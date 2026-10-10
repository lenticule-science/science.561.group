#!/usr/bin/env node
import { readFileSync } from "node:fs";
import { run } from "../src/contract-change-bundle-qualification.mjs";

const output = await run(JSON.parse(readFileSync(0, "utf8")), "invoke-service");
process.stdout.write(`${JSON.stringify(output, null, 2)}\n`);
if (output.type === "Reject") process.exitCode = 2;
