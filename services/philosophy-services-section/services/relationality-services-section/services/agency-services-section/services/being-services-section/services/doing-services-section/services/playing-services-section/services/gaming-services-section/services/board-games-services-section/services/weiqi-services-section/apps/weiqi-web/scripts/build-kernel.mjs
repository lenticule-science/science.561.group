import { buildBrowserKernel } from "@red-cup-engineering/weiqi-engine/build-browser";
import { readFile, writeFile } from "node:fs/promises";
import { fileURLToPath } from "node:url";

const result = await buildBrowserKernel(fileURLToPath(new URL("../public/js/kernel", import.meta.url)));
const srsSource = fileURLToPath(new URL("../node_modules/@red-cup-engineering/education-platform-service/dist/src/srs.js", import.meta.url));
const srsDestination = fileURLToPath(new URL("../public/js/srs.mjs", import.meta.url));
const srsModule = await readFile(srsSource, "utf8");
await writeFile(srsDestination, srsModule.replace(/[ \t]+$/gm, ""));
console.log(`Built and verified ${result.moduleCount} browser kernel modules in ${result.destination}; projected shared SRS to ${srsDestination}`);
