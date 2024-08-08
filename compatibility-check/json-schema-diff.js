const jsonSchemaDiff = require('json-schema-diff')
const exec = require('@actions/exec');
const core = require('@actions/core');
const {readFileSync} = require('node:fs');





async function run() {

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

  await exec.exec('git diff --name-only --diff-filter=M remotes/origin/main..HEAD', [], options);

  const pattern = new RegExp('file-formats/[a-z]{4}/[a-z]+-v[0-9]+\.json$', 'i');
  const lines = stdout.split("\n");

  const changedSchema = lines.filter(line => pattern.test(line));


  for (const schema of changedSchema) {

    const dataNew = readFileSync(`../${schema}`, 'utf8');
    const schemaNew = JSON.parse(dataNew);

    try {
      await exec.exec(`git checkout remotes/origin/main -- `, [schema], { cwd: `../`} );
    } catch (error) {
      core.info(`File ${schema} is not known to main branch.`);
      continue;
    }

    const dataOld = readFileSync(`../${schema}`, 'utf8');
    const schemaOld = JSON.parse(dataOld);

    delete schemaOld['$schema'];
    delete schemaNew['$schema'];

    const result = await jsonSchemaDiff.diffSchemas( {sourceSchema: schemaOld, destinationSchema: schemaNew});
    if (result.removalsFound) {
      core.setFailed('Something was removed');
    }

    if (result.additionsFound) {
      core.setFailed('Something was added');
    };
  }
}

run();
