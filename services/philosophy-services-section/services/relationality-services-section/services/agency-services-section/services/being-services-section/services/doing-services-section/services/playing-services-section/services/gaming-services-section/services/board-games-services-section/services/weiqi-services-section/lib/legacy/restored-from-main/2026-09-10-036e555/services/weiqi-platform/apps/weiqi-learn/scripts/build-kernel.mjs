import { fileURLToPath } from "node:url";
import { buildBrowserKernel } from "@red-cup-engineering/weiqi-engine/build-browser";

const result = await buildBrowserKernel(fileURLToPath(new URL("../public/lib/kernel", import.meta.url)));
console.log(`Built and verified ${result.moduleCount} browser kernel modules in ${result.destination}`);
