#!/usr/bin/env node

import { randomUUID } from "node:crypto";
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { computeDailyReadingTerm, DAILY_READING_TYPE } from "./rmn-daily-reading.mjs";
export { appendDailyReadingWitness } from "./daily-reading-witness.mjs";
import { appendDailyReadingWitness } from "./daily-reading-witness.mjs";
import { admitJsonSemanticContent, EMPTY_WITNESS_ROOT, identifyJsonSemanticContent, identifyNormalizedSemanticContent } from "@red-cup-engineering/semantic-content-identify-service";
import { checkTerm } from "@red-cup-engineering/relation-model-notation-runtime";
import { assayWitTransition } from "@lenticule-science/wit-transition-assay/client";

export const CONTEXT = "https://www.w3.org/ns/activitystreams";
export const ACTOR = "urn:ame:divination-services-section";
export const ACCOUNT = "eip155:31337:0x4fa4554223cb86713b2d8d8f1a6d40b0b1730689";
export const CONTRACT = "ni:///sha-256;jGz3g3xPim5UlTYnC0M0y_B0zXcCvdneuJNAPCKVrd0";
export const OPERATION_TYPE = Object.freeze(["product", ["mark"], ["mark"]]);
const PRECONDITION = "ni:///sha-256;ntxOpkBcnbGVC6NeD1y4X54yLK7GmBmNf2ul7IhJV2I";
const POSTCONDITION = "ni:///sha-256;am0o7fpff-A8Q_SdJFQDw0zJYBdAr8Q8EQEw4V0dWj4";
const REFUSAL = "ni:///sha-256;IebXWZ-MmX6I7pLllQ4vNRHP9SdWr32AE_pC-w15YMk";
const HERE = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(HERE, "..");
function response(type, source, object) {
  return { "@context": CONTEXT, id: `urn:uuid:${randomUUID()}`, type, actor: ACTOR, target: source.actor, inReplyTo: source.id, object };
}

function witAgent(env = process.env) { if (!env.WIT_TRANSITION_ASSAY_AGENT) throw new Error("WIT_TRANSITION_ASSAY_AGENT must name the hired WIT transition provider's signed A2A 1.0 Agent Card"); return env.WIT_TRANSITION_ASSAY_AGENT; }

function document(value, name) {
  if (value?.type !== "Document" || value.mediaType !== "application/rmn+cbor" || typeof value.id !== "string" || typeof value.content !== "string") {
    throw new Error(`${name} must be an ActivityStreams Document carrying application/rmn+cbor bytes`);
  }
  return value;
}

function sameField(left, right, field) {
  if (left[field] !== right[field]) throw new Error(`completion changed ${field}`);
}

function persistDocument(root, doc) {
  const digest = doc.id.slice(doc.id.indexOf(";") + 1);
  const path = join(root, "objects", "sha-256", `${digest}.cbor`);
  const bytes = Buffer.from(doc.content, "base64");
  mkdirSync(dirname(path), { recursive: true });
  if (existsSync(path)) {
    if (!readFileSync(path).equals(bytes)) throw new Error(`content-address collision at ${path}`);
  } else writeFileSync(path, bytes, { flag: "wx" });
}

function identifyTerm(term, expectedType, objectKind) {
  if (!checkTerm(term, expectedType)) throw new Error(`${objectKind} does not inhabit its declared RMN type`);
  const identified = identifyNormalizedSemanticContent({ objectKind, semanticType: expectedType, term, witnessRoot: EMPTY_WITNESS_ROOT });
  return { term: identified.token, normalForm: identified.envelope.settledBody, canonicalBytesBase64: Buffer.from(identified.bytes).toString("base64") };
}

export async function invokeDailyReading(source, { env = process.env, now = new Date().toISOString() } = {}) {
  if (source?.["@context"] !== CONTEXT || source.type !== "Accept" || source.target !== ACTOR || source.object?.type !== "ServiceContract" || source.object.contract !== CONTRACT) {
    throw new Error("daily reading must be an ActivityStreams Accept<ServiceContract> addressed to Divination's RMN law");
  }
  const proposalDoc = document(source.object.proposal, "proposal");
  const proposal = admitJsonSemanticContent({ bytes: Buffer.from(proposalDoc.content, "base64"), token: proposalDoc.id, objectKind: "divination.daily-reading-proposal" });
  const cell = proposal.value?.cell, operation = proposal.value?.operation;
  if (cell.law !== CONTRACT || cell.provider !== ACCOUNT) throw new Error("proposal is not addressed to Divination's law, smart account, and service scale");
  if (source.object.callerAccount !== cell.caller) throw new Error("callerAccount does not match the RMN caller");
  if (cell.outcome?.positiveEvidence !== false || cell.outcome?.negativeEvidence !== false) throw new Error("proposal must enter at FOUR-bottom");
  if (cell.precondition !== PRECONDITION || cell.postcondition !== POSTCONDITION || cell.refusal !== REFUSAL) throw new Error("proposal does not name Divination's exact precondition, postcondition, and refusal terms");
  if (operation?.[0] !== "pair" || operation[1]?.[0] !== "mark" || operation[2]?.[0] !== "mark") throw new Error("operation must carry exactly one date and one tradition mark");
  const operationIdentity = identifyTerm(operation, OPERATION_TYPE, "divination.daily-reading-operation").term;
  if (cell.operation !== operationIdentity) throw new Error("effect-operation-mismatch: the committed operation does not identify the bundled operation");
  const [date, tradition] = [operation[1][1], operation[2][1]];
  const started = performance.now();
  let disposition, evidence, evidenceDoc;
  try {
    const reading = identifyTerm(computeDailyReadingTerm(date, tradition), DAILY_READING_TYPE, "divination.daily-reading");
    disposition = "completion";
    evidence = reading.term;
    evidenceDoc = { type: "Document", id: reading.term, mediaType: "application/rmn+cbor", content: reading.canonicalBytesBase64, profile: "org.emsenn.divination.daily-reading.v1", profileCommitment: "ni:///sha-256;MGYe_PrTQlwEYjTev0F1q3qVwHLgJlRVXsu_OXJ0Rjg" };
  } catch (error) {
    const refusal = identifyTerm(["pair", ["mark", "reading-computation-refused"], ["mark", error.message]], ["product", ["mark"], ["mark"]], "divination.daily-reading-refusal");
    disposition = "refused";
    evidence = refusal.term;
    evidenceDoc = { type: "Document", id: refusal.term, mediaType: "application/rmn+cbor", content: refusal.canonicalBytesBase64, profile: "org.emsenn.divination.refusal.v1" };
  }
  const elapsed = Math.max(0, Math.round(performance.now() - started)).toString();
  const completionCell = {
    ...cell, evidenceRoot: evidence, outcome: { positiveEvidence: disposition === "completion", negativeEvidence: disposition === "refused" },
    measures: [
      ...cell.measures.filter(({ dimension }) => !["compute", "time", "wit"].includes(dimension)),
      { dimension: "compute", quantity: "1", unit: "daily-reading" },
      { dimension: "time", quantity: elapsed, unit: "millisecond" },
      { dimension: "wit", quantity: "1", unit: "typed-four-cover" },
    ],
  };
  for (const field of ["caller", "law", "operation", "parent", "postcondition", "precondition", "provider", "refusal" ]) sameField(cell, completionCell, field);
  const transition = await assayWitTransition({ agentUrl: witAgent(env), proposalCell: cell, completionCell, evidence });
  const completionIdentity = identifyJsonSemanticContent({ objectKind: "divination.daily-reading-completion", value: { cell: completionCell, operation }, witnessRoot: EMPTY_WITNESS_ROOT });
  const completion = { term: completionIdentity.token, canonicalBytesBase64: Buffer.from(completionIdentity.bytes).toString("base64") };
  const completionDoc = { type: "Document", id: completion.term, mediaType: "application/rmn+cbor", content: completion.canonicalBytesBase64 };
  const root = resolve(env.DIVINATION_DATA_ROOT ?? join(ROOT, "data"));
  persistDocument(root, evidenceDoc); persistDocument(root, completionDoc);
  appendDailyReadingWitness(root, now, { proposal: proposal.token, completion: completion.term, evidence, witness: transition.witness, disposition });
  return response(disposition === "completion" ? "Accept" : "Reject", source, {
    type: "RmnDailyReadingSettlement", contract: CONTRACT, disposition, proposal: proposal.token,
    completion: completion.term, evidence, witness: transition.witness, readingType: "ni:///sha-256;MGYe_PrTQlwEYjTev0F1q3qVwHLgJlRVXsu_OXJ0Rjg", customerTerritoryMutation: false,
    attachment: [completionDoc, evidenceDoc],
  });
}

if (process.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  try { process.stdout.write(`${JSON.stringify(await invokeDailyReading(JSON.parse(readFileSync(0, "utf8"))))}\n`); }
  catch (error) { process.stderr.write(`${error.stack ?? error.message}\n`); process.exitCode = 1; }
}
