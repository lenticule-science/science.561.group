#!/usr/bin/env node
import { readFileSync } from "node:fs";
import { assayImprovementGameProposal } from "../src/assay.mjs";
process.stdout.write(`${JSON.stringify(assayImprovementGameProposal(JSON.parse(readFileSync(0, "utf8"))), null, 2)}\n`);
