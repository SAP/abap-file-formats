const difftool = require('json-schema-diff-validator')
const child_process = require('child_process');


async function run() {

    difftool.validateSchemaCompatibility(oldjson, newjson)

    const types = [];
    for (const f of fs.readdirSync("../file-formats/")) {
      if (f.length === 4) {
        types.push(f.toUpperCase());
      }
    }
    types.sort();


    child_process.exec('git diff --name-only HEAD..main', function(err, stdout, stderr) {
        console.log(stdout);
    });


}