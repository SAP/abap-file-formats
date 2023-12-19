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

  await exec.exec('git diff --name-only remotes/origin/main..HEAD', [], options);

  const pattern = new RegExp('file-formats/[a-z]{4}/[a-z]+-v[0-9]+\.json$', 'i');
  const lines = stdout.split("\n");
  const changedSchema = lines.filter(line => pattern.test(line));

  return changedSchema;
}

const processFile = async (file) => {
  try {
    const dataNew = fs.readFileSync(`../${file}`, 'utf8');
    const schemaNew = JSON.parse(dataNew);

    await exec.exec(`git checkout remotes/origin/main -- ../${file}` || true);

    const dataOld = fs.readFileSync(`../${file}`, 'utf8');
    const schemaOld = JSON.parse(dataOld);


    difftool.validateSchemaCompatibility(schemaOld, schemaNew);
  } catch (error) {
    core.setFailed(error.toString());
  }
}


async function run() {
  await getChangedFiles()
    .then((changedSchema) => {
      core.info('changed JSON schema');
      core.info(changedSchema);
      changedSchema.forEach( schema => processFile(schema));
    })
    .then(() => core.info('Processing finished.'));

}

run();
