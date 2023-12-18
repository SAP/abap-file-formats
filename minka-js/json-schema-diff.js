const difftool = require('json-schema-diff-validator')
const exec = require('@actions/exec');
const core = require('@actions/core');
const fs = require('node:fs');
const path = require('node:path');


let getChangedFiles = async () => {
  let stdout = '';
  const options = {
    listeners: {
      stdout: (data) => {
        stdout += data.toString();
      },
      stderr: (data) => {
        core.error(data.toString());
      }
    }
  };

  // await exec.exec('git fetch', [], options);
  await exec.exec('git diff --name-only remotes/origin/main', [], options);

  const pattern = new RegExp('file-formats/[a-z]{4}/[a-z]+-v[0-9]+\.json$', 'i');
  const lines = stdout.split("\n");
  const changedSchema = lines.filter(line => pattern.test(line));

  return changedSchema;
}

const processFile = async (file) => {
  try {
    const dataNew = fs.readFileSync(`../${file}`, 'utf8');
    const schemaNew = JSON.parse(dataNew);

    await exec.exec(`git checkout main -- ../${file}` || true);

    const dataOld = fs.readFileSync(`../${file}`, 'utf8');
    const schemaOld = JSON.parse(dataOld);


    difftool.validateSchemaCompatibility(schemaOld, schemaNew);
  } catch (error) {
    core.setFailed(error.toString());
  }
}

const processFiles = async (changedFiles) => {
  for (const file of changedFiles) {
    await processFile(file);
  }
}


async function run() {

  const changedFiles = await getChangedFiles();

  core.notice("Relevant files:");
  core.notice(changedFiles);


  processFiles(changedFiles)
    .then(() => core.info('Processing finished.'));

}

run();
