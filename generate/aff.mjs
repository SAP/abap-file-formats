import * as fs from 'node:fs';
import * as path from 'node:path';
import * as child_process from 'node:child_process';
import {initializeABAP} from "./output/init.mjs";
await initializeABAP();
import * as core from '@actions/core';

async function run() {
  if (fs.existsSync("generated") === false) {
    fs.mkdirSync("generated");
  }

  const types = [];
  for (const f of fs.readdirSync("../file-formats/")) {
    if (f.length === 4) {
      types.push(f.toUpperCase());
    }
  }
  types.sort();


  let error = false;
  for (const type of types) {
    if (type === "ENHO") {
      core.notice(type+" skipped, https://github.com/SAP/abap-file-formats/issues/409");
      continue;
    }

    const result = await abap.Classes["CL_RUN"].run({object_type: new abap.types.String().set(type)});
    const filename = "generated" + path.sep + type.toLowerCase() + "-v1.json";
    fs.writeFileSync(filename, result.get());


    const command = `diff --strip-trailing-cr -u generated/${type.toLowerCase()}-v1.json ../file-formats/${type.toLowerCase()}/${type.toLowerCase()}-v1.json`;
    const output = child_process.execSync(`${command} || true`);
    if (output.toString().length > 0) {
      core.setFailed(type+": Provided and generated JSON Schema differ")
      core.info(output.toString());
      core.info("generated JSON Schema for "+type+"\n"+result.get());
    }

  }

}

run();
