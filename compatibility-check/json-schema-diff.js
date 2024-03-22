const jsonSchemaDiff = require('json-schema-diff')
const exec = require('@actions/exec');
const core = require('@actions/core');
const {readFileSync} = require('node:fs');


let getChangedSchema = async () => {
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
  const dataNew = readFileSync(`../${file}`, 'utf8');
  const schemaNew = JSON.parse(dataNew);
  const source = {type: 'string'};

  try {
    await exec.exec(`git checkout remotes/origin/main -- `, [file], { cwd: `../`} );
  } catch (error) {
    core.info(`File ${file} is not known to main branch.`);
    // file is not on main branch, so we continue and compare the file to itself (no harm)
  }

    const dataOld = readFileSync(`../${file}`, 'utf8');
    const schemaOld = JSON.parse(dataOld);

    delete schemaOld['$schema'];
    delete schemaNew['$schema'];

    const result = await jsonSchemaDiff.diffSchemas( {sourceSchema: schemaOld, destinationSchema: schemaNew});
    if (result.removalsFound) {
      core.error('Something was removed!');
    }

    if (result.additionsFound) {
      core.error('Something was added!');
    }
  }


async function run() {

  const changedSchema = await getChangedSchema();
  for (const schema of changedSchema) {
    await processFile(schema);
  }
}

run();
