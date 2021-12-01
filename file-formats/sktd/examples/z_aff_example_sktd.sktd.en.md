[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.headings )

## Headings
 
Section headings can be specified in six different levels using the hash character.
 
**Markdown**:
```
# This is a h1 heading
## This is a h2 heading
### This is a h3 heading
#### This is a h4 heading
##### This is a h5 heading
###### This is a h6 heading
```


[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.linesAndParagraphs )

## Lines and paragraphs
 
This is a paragraph.
This is a new line in the same paragraph.
 
This is a separate paragraph.
 
**Markdown**:
```
This is a paragraph.
This is a new line in the same paragraph.
 
This is a separate paragraph.
```

[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.links )

## Links

### Web links

* See [Link SAP](https://www.sap.com)
* A direct link goes is specified like this: <http://www.sap.com>
 
**Markdown**:
```
* See [Link SAP](http://www.sap.com)
* A direct link goes is specified like this: <http://www.sap.com>
```

### Object reference

* See [Link to BDEF](BDEF:Z_AFF_EXAMPLE_SKTD)
* A direct link goes is specified like this: <BDEF:Z_AFF_EXAMPLE_SKTD>
 
**Markdown**:
```
* See [Link to BDEF](BDEF:Z_AFF_EXAMPLE_SKTD)
* A direct link goes is specified like this: <BDEF:Z_AFF_EXAMPLE_SKTD>
```

[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.lists )

## Lists
 
### Unordered list
 
* item 1
  * item 1.1
  * item 1.2
    * item 1.2.1
* item 2
* item 3
 
**Markdown**:
```
* item 1
  * item 1.1
  * item 1.2
    * item 1.2.1
* item 2
* item 3
```
 
### Ordered List
 
1. item a
2. item b
3. item c
 
**Markdown**:
```
1. item a
2. item b
3. item c
```
 

[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.quote )

### Quote
 
> This is a simple blockquote text.
> This line is part of the same quote.
 
Quote break.
 
> This is the continued blockquote text. 
 
**Markdown**:
```
> A blockquote starts with the greater-than character (>).
```
 

[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.sourceCode )

### Source Code
 
`Inline code` has *back-ticks* (`\``) around it.
 
A code block is enclosed by *three back-ticks* (`\`\`\``) before and after the code snippet.
 
```
if (a == b) {
    alert(s);
}
```
 
**Markdown**:
```
\`\`\`
if (a == b) {
    alert(s);
}
\`\`\`
```

[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.table )

## Tables in Simple Markdown
 
There must be at least 3 dashes separating each header cell.
 
| Header1 | Header2 | Header3 |
|---------|---------|---------|
|Cell11   |*Cell12* |Cell13   |
|Cell21   |Cell22   |Cell23   |
 
**Markdown**:
```
| Header1 | Header2 | Header3 |
|---------|---------|---------|
|Cell11   |*Cell12* |Cell13   |
|Cell21   |Cell22   |Cell23   |
```
 
The outer pipes (`|`) are optional.
 
Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
 
**Markdown**:
```
Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
```
 
Columns can be aligned using colons (`:`) with the dashes.
 
| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |
 
**Markdown**:
```
| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |
```
 

[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.textFormatting )

## Text formatting
 
Simple Markdown supports *Italics* (enclosed by `\*`), **Bold** (enclosed by `\*\*`) and ~~Strikethrough~~ (enclosed by `\~\~`).
 
**Markdown**:
```
Text can be formatted in *Italics*, **Bold** or ~~Strikethrough~~.
```


[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAE;name=z_aff_example_sktd )

Here are some documentation texts for the different actions named after the different possibilities of KTD Markdown. 

[//]: # (id:[z_aff_example_sktd] )

This is an example KTD documentation of a *Behavior Definition* (**BDEF**) and will be used to create an example *ABAP File Format* (**AFF**)
