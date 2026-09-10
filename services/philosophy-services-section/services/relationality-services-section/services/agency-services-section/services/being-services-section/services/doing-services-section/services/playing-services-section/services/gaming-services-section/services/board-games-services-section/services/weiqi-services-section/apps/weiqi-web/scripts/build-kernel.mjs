import { buildBrowserKernel } from "@red-cup-engineering/weiqi-engine/build-browser";
import { fileURLToPath } from "node:url";

const result = await buildBrowserKernel(fileURLToPath(new URL("../public/js/kernel", import.meta.url)));
console.log(`Built and verified ${result.moduleCount} browser kernel modules in ${result.destination}`);
