import * as fs from 'node:fs';
import * as path from 'node:path';
import * as child_process from 'node:child_process';
import { initializeABAP } from "./output/init.mjs";
await initializeABAP();
import * as core from '@actions/core';

async function run() {
  if (fs.existsSync("generated") === false) {
    fs.mkdirSync("generated");
  }

  function createAnnotations(diff, file) {
    let lines = diff.split('\n');

    let lineNumber;
    const regExp = /^[0-9]/;

    lines.forEach(line => {

      if (line.startsWith('>')) {
        let text = line.split(' ').slice(1).join(' ');
        console.log(`::error file=${file},line=${lineNumber}::${text}`);
        ++lineNumber;
      } else if (regExp.test(line)) {
        lineNumber = parseInt(line.split("c")[0].split(",")[0]); // 16
      }
    });

  }


  const types = [];
  const directory = '../file-formats'; // Replace with your directory
  for (const f of fs.readdirSync(directory)) {
    if (f.length === 4) {
      types.push(f.toLowerCase());
    }
  }
  types.sort();


  let error = false;
  for (const type of types) {
    if (type.toUpperCase() === "ENHO") {
      core.notice(type.toUpperCase() + " skipped, https://github.com/SAP/abap-file-formats/issues/409");
      continue;
    }

    const files = fs.readdirSync(directory+path.sep+type);
    const jsonFiles = files.filter(file => path.extname(file) === '.json');
    let objTypeVersNumb = jsonFiles.map((file) => {
      // Extract the characters before '-v' as namePart and the number after '-v' as versionNumber using regex
      let match = file.match(/(.*)(?:-v)(\d+)(?=\.json)/);

      if (match) {
        // Create and return an object with properties 'namePart' and 'versionNumber'
        let [_, object_type, format_version] = match;

        return {object_type, format_version};
      }

      return null;
    });

    for (let aff of objTypeVersNumb) {
      if(aff) {
          //core.info(`AFF type: ${aff.object_type}-v${aff.format_version}`);

          const result = await abap.Classes["CL_RUN"].run({ object_type: new abap.types.String().set(aff.object_type), format_version: aff.format_version });
          const filename = `generated` + path.sep + aff.object_type + `-v`+aff.format_version+`.json`;
          const filename_aff = `../file-formats/${aff.object_type}/${aff.object_type}-v`+aff.format_version+`.json`;
          fs.writeFileSync(filename, result.get());


          if (!fs.existsSync(filename_aff)){
            core.warning('Failed to access file: '+filename_aff);
            continue;
          }

          const command = `diff ${filename_aff} ${filename}`;
          const output = child_process.execSync(`${command} || true`);
          if (output.toString().length > 0) {
            core.setFailed(aff.object_type+"-v"+aff.format_version + ": Provided and generated JSON Schema differ")
            createAnnotations(output.toString(), path.resolve(filename_aff));
            //core.info(command);
            //core.info(output.toString());
          } else {
            core.notice(aff.object_type+"-v"+aff.format_version +" generated successfully");
          }

      }
   }



  }

}

run();
