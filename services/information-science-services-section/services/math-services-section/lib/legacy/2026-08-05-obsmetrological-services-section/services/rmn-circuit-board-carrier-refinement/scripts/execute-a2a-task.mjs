#!/usr/bin/env node
import { randomUUID } from "node:crypto";
import { readFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { Message, Role } from "@a2a-js/sdk";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import { requestHierarchicalCircuitEquivalence } from "@lenticule-science/hierarchical-circuit-equivalence-assay/client";
import { checkTerm } from "@red-cup-engineering/relation-model-notation-runtime";
import { decodeSemantic, semanticBytes } from "@red-cup-engineering/relation-model-notation-cbor-codec";
import { createSettlementStore } from "@red-cup-engineering/witness-journal-rdf-projection-service/client";
import { assayRmnCircuitBoardCarrierRefinement, decodeRmnCircuitBoardRefinementRequest } from "../src/refinement-assay.mjs";
const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");
export async function executeA2aMessage(source, env = process.env) {
  const message = Message.fromJSON(source); if (message.role !== Role.ROLE_USER) throw new Error("RMN board refinement requires an A2A ROLE_USER message");
  if (!env.EQUIVALENCE_AGENT_URL) throw new Error("EQUIVALENCE_AGENT_URL is required; the board refinement provider cannot attest its own circuit equivalence");
  if (!env.WITNESS_JOURNAL_RDF_AGENT) throw new Error("WITNESS_JOURNAL_RDF_AGENT is required; the board refinement provider cannot keep an ambient book");
  const input = extractRmnPart(message.parts), term = decodeSemantic(input.bytes);
  if (!semanticBytes(term).equals(input.bytes) || term?.[0] !== "ascribe" || term.length !== 3) throw new Error("RMN board refinement request must be canonical typed RMN CBOR"); checkTerm(term[2], term[1]);
  const request = decodeRmnCircuitBoardRefinementRequest(term[1], term[2]);
  const result = await assayRmnCircuitBoardCarrierRefinement(request, { assayEquivalence: ({ circuit, components, assembly }) => requestHierarchicalCircuitEquivalence({ agentUrl: env.EQUIVALENCE_AGENT_URL, circuit, components, assembly }) });
  const recordedAt = new Date().toISOString(), store = createSettlementStore({ settlementRoot: ROOT, agentUrl: env.WITNESS_JOURNAL_RDF_AGENT });
  await store.record({ category: "rmn-circuit-board-carrier-refinement.proof", recordedAt, record: { ...result.proof, semanticId: result.proofSemanticId } });
  await store.record({ category: "rmn-circuit-board-carrier-refinement.receipt", recordedAt, record: { ...result.receipt, semanticId: result.semanticId } });
  return Message.toJSON({ messageId: randomUUID(), contextId: message.contextId, taskId: message.taskId, role: Role.ROLE_AGENT, parts: [rmnPart(result.canonicalBytes, "carrier-refinement-receipt.rmn.cbor")], metadata: { disposition: "conformant", receiptNi: result.semanticId, componentNi: result.receipt.component, materialRootNi: result.receipt.materialRoot, profile: result.receipt.profile }, extensions: [], referenceTaskIds: [] });
}
try { const source = JSON.parse(readFileSync(0, "utf8")); process.stdout.write(`${JSON.stringify(await executeA2aMessage(source))}\n`); } catch (error) { process.stderr.write(`${error.code ?? "carrier-refinement-refusal"}: ${error.message}\n`); process.exitCode = 1; }
