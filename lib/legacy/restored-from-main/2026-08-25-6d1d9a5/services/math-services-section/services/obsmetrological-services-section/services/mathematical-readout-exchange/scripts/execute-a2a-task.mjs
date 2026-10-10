#!/usr/bin/env node

import { randomUUID } from "node:crypto";
import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { pathToFileURL } from "node:url";
import { Message, Role } from "@a2a-js/sdk";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import {
  executeRelationalGraphReadout,
  mathematicalReadoutRequestKind,
  RELATIONAL_GRAPH_READOUT,
} from "../src/relational-graph-protocol.mjs";
import {
  executeSiloxaneZeoliteRigidityReadout,
  SILOXANE_ZEOLITE_RIGIDITY,
} from "../src/siloxane-zeolite-rigidity-protocol.mjs";

// Static source citation, not a runtime hash: the CoverNerve die's
// specification lives at Obsmetrologia/Cohomology/CoordinationCohomology.lean
// and Obsmetrologia/Cohomology/LandauerEntropy.lean. This used to be a
// per-call sha256 self-attestation of those files' bytes
// (@lenticule-science/cover-nerve-rank-readout-service's
// attestCoverNerveSources); the ceremony was removed, but the
// metadata.mathematicalSourceCertificate wire field stays as a static
// value for backward compatibility with any consumer reading it.
const SOURCE_CERTIFICATE = Object.freeze({
  library: "@lenticule-science/obsmetrologia",
  sources: Object.freeze([
    Object.freeze({ file: "Obsmetrologia/Cohomology/CoordinationCohomology.lean" }),
    Object.freeze({ file: "Obsmetrologia/Cohomology/LandauerEntropy.lean" }),
  ]),
});

function exactFraction(numerator, denominator) {
  let num = BigInt(numerator), den = BigInt(denominator), left = num, right = den;
  while (right !== 0n) [left, right] = [right, left % right];
  num /= left; den /= left;
  return Object.freeze({ numerator: num.toString(), denominator: den.toString() });
}

function measuredReadout(inputBytes) {
  const wallStart = process.hrtime.bigint();
  const cpuStart = process.cpuUsage();
  const requestKind = mathematicalReadoutRequestKind(inputBytes);
  let dieResult;
  let filename;
  if (requestKind === RELATIONAL_GRAPH_READOUT.input) {
    dieResult = executeRelationalGraphReadout(inputBytes);
    filename = "relational-graph-result.rmn.cbor";
  } else if (requestKind === SILOXANE_ZEOLITE_RIGIDITY.input) {
    dieResult = executeSiloxaneZeoliteRigidityReadout(inputBytes);
    filename = "siloxane-zeolite-rigidity-surrogate2d-result.rmn.cbor";
  } else {
    const error = new Error(`mathematical-readout-exchange does not serve request kind ${requestKind ?? "[absent]"}`);
    error.code = "unsupported-readout-kind";
    throw error;
  }
  const cpu = process.cpuUsage(cpuStart);
  const wallNanoseconds = process.hrtime.bigint() - wallStart;
  return {
    dieResult,
    filename,
    certificate: SOURCE_CERTIFICATE,
    resourceEffects: {
      "fuel-consumed": exactFraction(cpu.user + cpu.system, 1_000_000),
      "wall-time-seconds": exactFraction(wallNanoseconds, 1_000_000_000),
      denomination: "mathematical-relational-graph-service-cpu-seconds",
      settled: false,
    },
  };
}

export async function executeA2aMessage(source) {
  const message = Message.fromJSON(source);
  if (message.role !== Role.ROLE_USER) throw new Error("mathematical-readout-exchange requires an A2A ROLE_USER message");
  const input = extractRmnPart(message.parts);
  const result = measuredReadout(input.bytes);
  return Message.toJSON({
    messageId: randomUUID(),
    contextId: message.contextId,
    taskId: message.taskId,
    role: Role.ROLE_AGENT,
    parts: [rmnPart(result.dieResult.bytes, result.filename)],
    metadata: {
      disposition: "completion",
      requestNi: input.ni,
      responseNi: result.dieResult.id,
      mathematicalSourceCertificate: result.certificate,
      resourceEffects: result.resourceEffects,
    },
    extensions: [],
    referenceTaskIds: [],
  });
}

if (process.argv[1] && pathToFileURL(resolve(process.argv[1])).href === import.meta.url) {
  try {
    const source = JSON.parse(readFileSync(0, "utf8"));
    process.stdout.write(`${JSON.stringify(await executeA2aMessage(source))}\n`);
  } catch (error) {
    process.stderr.write(`${error.code ?? "mathematical-readout-exchange-refusal"}: ${error.message}\n`);
    process.exitCode = 1;
  }
}
