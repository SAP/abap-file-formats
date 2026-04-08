#!/usr/bin/env python3
"""Check ABAP Doc annotations for correct casing conventions.

Titles (<p class="shorttext">...</p>) must be Title Case.
Descriptions ("! text after title) must be sentence case.

Usage:
    python check_abap_doc_casing.py                         # scan all files under file-formats/
    python check_abap_doc_casing.py file1.abap file2.abap   # scan specific files
    python check_abap_doc_casing.py --diff < changed_files  # read file list from stdin
"""

import json
import os
import re
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
TERMS_FILE = os.path.join(SCRIPT_DIR, "casing-terms.json")

_LETTER_RANGE_RE = re.compile(r'^[A-Za-z][-/][A-Za-z]$')
_HUNK_RE = re.compile(r'^@@ -\d+(?:,\d+)? \+(\d+)(?:,\d+)? @@')

# Words that stay lowercase in title case (unless first or last word)
TITLE_CASE_LOWER = {
    "a", "an", "the",                                       # articles
    "and", "but", "or", "nor", "for", "yet", "so",          # conjunctions
    "in", "on", "at", "to", "by", "of", "with",             # prepositions
    "from", "as", "if", "up", "via", "per",
}


def load_terms():
    """Load the preserve-case terms dictionary."""
    if not os.path.exists(TERMS_FILE):
        return []
    with open(TERMS_FILE, encoding="utf-8") as f:
        data = json.load(f)
    return data.get("preserveCase", [])


def is_preserved_token(word, preserve_set):
    """Check whether a word should be left as-is."""
    # Exact match in dictionary (case-sensitive), with or without trailing punctuation
    if word in preserve_set:
        return True
    # Check if word with common trailing punctuation is in preserve set
    for suffix in [".", ",", ";", ":"]:
        if (word + suffix) in preserve_set:
            return True
    # All-caps tokens of 2+ characters are auto-preserved (acronyms)
    if len(word) >= 2 and word == word.upper() and word.isalpha():
        return True
    # Mixed-case with multiple uppercase letters likely an abbreviation (e.g., "IDs", "OData")
    upper_count = sum(1 for c in word if c.isupper())
    if upper_count >= 2 and len(word) >= 2:
        return True
    # Tokens containing digits (e.g., "v702", "3.0", "INT2")
    if any(c.isdigit() for c in word):
        return True
    # Tokens with slashes or hyphens connecting letters (e.g., "A-Z", "a-z")
    if _LETTER_RANGE_RE.match(word):
        return True
    return False


def strip_punctuation(part):
    """Strip leading/trailing punctuation from a word, returning (leading, core, trailing)."""
    trailing = ""
    core = part
    while core and core[-1] in ",.;:)":
        trailing = core[-1] + trailing
        core = core[:-1]
    leading = ""
    while core and core[0] in "(":
        leading += core[0]
        core = core[1:]
    return leading, core, trailing


def title_case_word(word, index, total, preserve_set):
    """Return the expected title-case form of a single word."""
    if is_preserved_token(word, preserve_set):
        return word
    # First and last words are always capitalized
    if index == 0 or index == total - 1:
        return word[0].upper() + word[1:] if word else word
    # Articles, conjunctions, short prepositions stay lowercase
    if word.lower() in TITLE_CASE_LOWER:
        return word.lower()
    # Everything else: capitalize first letter, preserve rest
    return word[0].upper() + word[1:] if word else word


def replace_multiword_terms(text, multiword_terms):
    """Replace multi-word terms with placeholders to protect them from casing changes.

    Returns (modified_text, placeholder_map).
    """
    placeholders = {}
    tmp = text
    for j, term in enumerate(multiword_terms):
        ph = f"\x01TERM{j}\x01"
        replaced = re.sub(re.escape(term), ph, tmp, flags=re.IGNORECASE)
        if replaced != tmp:
            placeholders[ph] = term
            tmp = replaced
    return tmp, placeholders


def restore_placeholders(text, placeholders):
    """Restore placeholders back to their canonical terms."""
    for ph, term in placeholders.items():
        text = text.replace(ph, term)
    return text


def expected_title_case(text, preserve_set, multiword_terms=None):
    """Compute the expected title-case form of a full title string."""
    placeholders = {}
    working = text
    if multiword_terms:
        working, placeholders = replace_multiword_terms(working, multiword_terms)

    def title_transform(core, i, total):
        return title_case_word(core, i, total, preserve_set)

    out = _apply_casing_to_tokens(working.split(), preserve_set, title_transform)
    return restore_placeholders(out, placeholders)


_ABBREVS = ["i.e.", "e.g.", "Rel.", "vs.", "etc.", "no.", "incl.", "max.", "min."]


def _apply_casing_to_tokens(parts, preserve_set, word_transform):
    """Apply casing to a list of whitespace-split tokens.

    word_transform(core, index, total) -> transformed core string.
    Placeholders (\\x01...\\x01) are passed through unchanged.
    """
    total = len(parts)
    result = []
    for i, part in enumerate(parts):
        if part.startswith("\x01") and part.endswith("\x01"):
            result.append(part)
            continue
        leading, core, trailing = strip_punctuation(part)
        if not core:
            result.append(leading + trailing)
            continue
        if is_preserved_token(core, preserve_set):
            result.append(leading + core + trailing)
            continue
        result.append(leading + word_transform(core, i, total) + trailing)
    return " ".join(result)


def expected_sentence_case(text, preserve_set, multiword_terms=None):
    """Compute the expected sentence-case form of a description string.

    Handles multiple sentences separated by '. ' — capitalizes the first
    word of each sentence.  Does NOT split on known abbreviations like
    'i.e.', 'e.g.', 'Rel.', 'vs.', 'etc.', 'no.'.
    """
    mw_placeholders = {}
    working = text
    if multiword_terms:
        working, mw_placeholders = replace_multiword_terms(working, multiword_terms)

    # Protect abbreviations from triggering sentence splits
    abbr_placeholders = {f"\x00ABBR{j}\x00": abbr for j, abbr in enumerate(_ABBREVS)}
    tmp = working
    for ph, abbr in abbr_placeholders.items():
        tmp = tmp.replace(abbr, ph)

    sentences = re.split(r'(?<=\.)\s+', tmp)
    sentences = [restore_placeholders(s, abbr_placeholders) for s in sentences]

    def sentence_transform(core, i, _total):
        return (core[0].upper() + core[1:]) if i == 0 else (core[0].lower() + core[1:])

    result_sentences = [
        _apply_casing_to_tokens(s.split(), preserve_set, sentence_transform)
        for s in sentences
        if s.split()
    ]
    return restore_placeholders(" ".join(result_sentences), mw_placeholders)


# Regex patterns
SHORTTEXT_RE = re.compile(r'"!\s*<p\s+class="shorttext">\s*(.*?)\s*</p>')
DESCRIPTION_RE = re.compile(r'"!\s+([^$<\s].*)')
ANNOTATION_RE = re.compile(r'"!\s+\$')


def check_file(filepath, preserve_set, multiword_terms):
    """Check a single ABAP file. Returns list of (line_num, message) violations."""
    violations = []
    try:
        with open(filepath, encoding="utf-8") as f:
            lines = f.readlines()
    except (OSError, UnicodeDecodeError) as e:
        return [(0, f"Could not read file: {e}")]

    prev_was_shorttext = False

    for line_num, line in enumerate(lines, start=1):
        stripped = line.strip()

        # Check for shorttext (title)
        m = SHORTTEXT_RE.search(stripped)
        if m:
            title = m.group(1).strip()
            if title:
                expected = expected_title_case(title, preserve_set, multiword_terms)
                if title != expected:
                    violations.append(
                        (line_num, f"title not Title Case: \"{title}\" -> \"{expected}\"")
                    )
            prev_was_shorttext = True
            continue

        # Skip annotation lines
        if ANNOTATION_RE.search(stripped):
            continue

        # Check for description (line after shorttext)
        if prev_was_shorttext:
            dm = DESCRIPTION_RE.search(stripped)
            if dm:
                desc = dm.group(1).strip()
                if desc:
                    expected = expected_sentence_case(desc, preserve_set, multiword_terms)
                    if desc != expected:
                        violations.append(
                            (line_num, f"description not sentence case: \"{desc}\" -> \"{expected}\"")
                        )
            prev_was_shorttext = False
            continue

        prev_was_shorttext = False

    return violations


def parse_pr_diff(diff_text):
    """Parse a unified diff and return {filepath: set(added_line_numbers)}.

    Only tracks lines added in the PR (lines starting with '+', excluding '+++').
    Uses hunk headers (@@ -old +new,count @@) to compute new-file line numbers.
    """
    changed_lines = {}
    current_file = None
    new_line = 0

    for line in diff_text.splitlines():
        # New file in diff
        if line.startswith("+++ b/"):
            current_file = line[6:]
            if current_file not in changed_lines:
                changed_lines[current_file] = set()
            continue
        if line.startswith("+++ /dev/null") or line.startswith("--- "):
            continue

        if current_file is None:
            continue

        # Hunk header: @@ -old_start,old_count +new_start,new_count @@
        hunk = _HUNK_RE.match(line)
        if hunk:
            new_line = int(hunk.group(1))
            continue

        if line.startswith("+"):
            changed_lines[current_file].add(new_line)
            new_line += 1
        elif line.startswith("-"):
            pass  # removed line, don't advance new_line
        else:
            new_line += 1  # context line

    return changed_lines


def find_abap_files(root):
    """Recursively find all .abap files under root."""
    results = []
    for dirpath, _, filenames in os.walk(root):
        for fn in sorted(filenames):
            if fn.endswith(".abap"):
                results.append(os.path.join(dirpath, fn))
    return results


def main():
    preserve_terms = load_terms()
    preserve_set = set(preserve_terms)
    # Multi-word terms need special handling (matched as phrases, not individual words)
    multiword_terms = [t for t in preserve_terms if " " in t]

    # Determine files to check
    files = []
    changed_lines_filter = None  # if set, only report violations on these line numbers

    if "--pr-diff" in sys.argv:
        # Read unified diff from stdin, check only added/modified lines
        diff_text = sys.stdin.read()
        changed_lines_filter = parse_pr_diff(diff_text)
        files = [p for p in changed_lines_filter if p.endswith(".abap") and os.path.isfile(p)]
    elif "--diff" in sys.argv:
        # Read file list from stdin
        for line in sys.stdin:
            path = line.strip()
            if path.endswith(".abap") and os.path.isfile(path):
                files.append(path)
    elif len(sys.argv) > 1:
        # Explicit file arguments
        for arg in sys.argv[1:]:
            if arg.startswith("-"):
                continue
            if os.path.isfile(arg):
                files.append(arg)
            elif os.path.isdir(arg):
                files.extend(find_abap_files(arg))
    else:
        # Default: scan file-formats/
        repo_root = os.path.dirname(SCRIPT_DIR)
        ff_dir = os.path.join(repo_root, "file-formats")
        if os.path.isdir(ff_dir):
            files = find_abap_files(ff_dir)
        else:
            print(f"Error: directory not found: {ff_dir}", file=sys.stderr)
            sys.exit(2)

    if not files:
        print("No .abap files to check.")
        sys.exit(0)

    total_violations = 0
    for filepath in sorted(files):
        violations = check_file(filepath, preserve_set, multiword_terms)
        for line_num, msg in violations:
            # In --pr-diff mode, skip violations not in the PR's changed lines
            if changed_lines_filter is not None:
                allowed = changed_lines_filter.get(filepath, set())
                if line_num not in allowed:
                    continue
            try:
                rel = os.path.relpath(filepath)
            except ValueError:
                rel = filepath
            print(f"{rel}:{line_num}: {msg}")
            total_violations += 1

    if total_violations > 0:
        print(f"\n{total_violations} casing violation(s) found.")
        sys.exit(1)
    else:
        print("All ABAP Doc casing checks passed.")
        sys.exit(0)


if __name__ == "__main__":
    main()
