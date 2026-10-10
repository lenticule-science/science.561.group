#!/usr/bin/env node
import { randomUUID } from "node:crypto";
import { readFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { Message, Role } from "@a2a-js/sdk";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import { decodeLegacyAscribedRelationalWire } from "@red-cup-engineering/carrier-refinement-law/legacy-ascribed-wire";
import { decodeSemantic, semanticBytes } from "@red-cup-engineering/relation-model-notation-cbor-codec";
import { admitJsonSemanticContent } from "@red-cup-engineering/semantic-content-identify-service";
import { assayWasmFourCarrierRefinement, decodeWasmFourRefinementRequest, fromScisTransport } from "../src/refinement-assay.mjs";
import { createWasmFourCarrierRefinementRecordJournal } from "../src/record-journal.mjs";

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");

function admitRequest(bytes) {
  try {
    const admitted = admitJsonSemanticContent({ bytes, objectKind: "lenticule.wasm-four-carrier-refinement.request" });
    return { value: admitted.value, transportNi: admitted.token, legacy: false };
  } catch (v2Error) {
    const legacy = decodeSemantic(bytes);
    if (!semanticBytes(legacy).equals(bytes) || legacy?.[0] !== "ascribe" || legacy.length !== 3) throw v2Error;
    decodeLegacyAscribedRelationalWire(legacy);
    return { type: legacy[1], term: legacy[2], legacy: true };
  }
}

export async function executeA2aMessage(source, env = process.env) {
  const message = Message.fromJSON(source);
  if (message.role !== Role.ROLE_USER) throw new Error("carrier refinement requires an A2A ROLE_USER message");
  const input = extractRmnPart(message.parts), admitted = admitRequest(input.bytes);
  const request = admitted.legacy ? decodeWasmFourRefinementRequest(admitted.type, admitted.term) : fromScisTransport(admitted.value);
  const result = await assayWasmFourCarrierRefinement(request);
  const recordedAt = new Date().toISOString();
  const journal = createWasmFourCarrierRefinementRecordJournal({ root: resolve(ROOT, "data") });
  journal.recordProof({ ...result.proof, semanticId: result.proofSemanticId }, recordedAt);
  journal.recordReceipt({ ...result.receipt, semanticId: result.semanticId }, recordedAt);
  return Message.toJSON({ messageId: randomUUID(), contextId: message.contextId, taskId: message.taskId, role: Role.ROLE_AGENT, parts: [rmnPart(result.canonicalBytes, "carrier-refinement-receipt.rmn.cbor")], metadata: { disposition: "conformant", receiptNi: result.semanticId, componentNi: result.receipt.component, materialRootNi: result.receipt.materialRoot, profile: result.receipt.profile }, extensions: [], referenceTaskIds: [] });
}

try { const source = JSON.parse(readFileSync(0, "utf8")); process.stdout.write(`${JSON.stringify(await executeA2aMessage(source))}\n`); }
catch (error) { process.stderr.write(`${error.code ?? "carrier-refinement-refusal"}: ${error.message}\n`); process.exitCode = 1; }
