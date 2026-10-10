import { fileURLToPath } from "node:url";
import { buildBrowserKernel } from "./build-browser-kernel.mjs";

const result = await buildBrowserKernel(fileURLToPath(new URL("../dist", import.meta.url)));
console.log(`Built and verified ${result.moduleCount} distributable kernel modules in ${result.destination}`);
