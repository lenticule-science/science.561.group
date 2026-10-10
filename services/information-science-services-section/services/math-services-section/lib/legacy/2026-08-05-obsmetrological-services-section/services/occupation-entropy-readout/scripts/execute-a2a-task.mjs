#!/usr/bin/env node

import { randomUUID } from "node:crypto";
import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { pathToFileURL } from "node:url";
import { Message, Role } from "@a2a-js/sdk";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import {
  decodeNormalizedCarrier as decodeSemantic,
  normalizedCarrierBytes as semanticBytes,
} from "@red-cup-engineering/relation-model-notation-cbor-codec";
import { attestMathematicalSources, computeOccupationEntropy } from "../src/occupation-entropy.mjs";

// The die's A2A request/response shape is one RMN Mark term whose label is a
// JSON string — the same pragmatic mark-payload convention the LISS Groq
// provider uses for its instruction/input Marks (see
// groq-inference-team/src/execute-rmn-inference.mjs operationMarks()) rather
// than the full typed effect-cell/relational-value machinery: this die has
// no owned law, no settlement, and no independent evidence to witness — it
// is a stateless pure-function readout.
function decodeRequest(bytes) {
  const term = decodeSemantic(bytes);
  if (!Array.isArray(term) || term.length !== 2 || term[0] !== "mark" || typeof term[1] !== "string") {
    throw new Error("occupation-entropy-readout request must be one RMN Mark term carrying a JSON-object label");
  }
  let payload;
  try {
    payload = JSON.parse(term[1]);
  } catch (error) {
    throw new Error(`occupation-entropy-readout Mark label is not valid JSON: ${error.message}`);
  }
  if (typeof payload !== "object" || payload === null || Array.isArray(payload)) {
    throw new Error("occupation-entropy-readout Mark label must decode to a JSON object carrying occupation");
  }
  return payload;
}

function encodeResult(value) {
  const term = ["mark", JSON.stringify(value)];
  return { bytes: semanticBytes(term) };
}

function measuredReadout(params) {
  const wallStart = process.hrtime.bigint();
  const cpuStart = process.cpuUsage();
  const readout = computeOccupationEntropy(params);
  const cpu = process.cpuUsage(cpuStart);
  return {
    ...readout,
    certificate: attestMathematicalSources(),
    cost: {
      "fuel-consumed": (cpu.user + cpu.system) / 1e6,
      "wall-time-seconds": Number(process.hrtime.bigint() - wallStart) / 1e9,
      denomination: "occupation-entropy-readout-cpu-seconds",
      settled: false,
    },
  };
}

export async function executeA2aMessage(source) {
  const message = Message.fromJSON(source);
  if (message.role !== Role.ROLE_USER) throw new Error("occupation-entropy-readout requires an A2A ROLE_USER message");
  const input = extractRmnPart(message.parts);
  const request = decodeRequest(input.bytes);
  const result = measuredReadout(request);
  const output = encodeResult(result);
  return Message.toJSON({
    messageId: randomUUID(),
    contextId: message.contextId,
    taskId: message.taskId,
    role: Role.ROLE_AGENT,
    parts: [rmnPart(output.bytes, "occupation-entropy-result.rmn.cbor")],
    metadata: {
      disposition: "completion",
      requestNi: input.ni,
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
    process.stderr.write(`${error.code ?? "occupation-entropy-readout-refusal"}: ${error.message}\n`);
    process.exitCode = 1;
  }
}
