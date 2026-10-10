#!/usr/bin/env node

import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { fileURLToPath } from "node:url";

import { createSemanticRecordJournal } from "@red-cup-engineering/semantic-record-journal-service";

import { parseLeaderMessage, semanticJsonId } from "./parse-leader-message.js";

const CONTEXT = "https://www.w3.org/ns/activitystreams";
const ACTOR = "urn:ame:linguistics-services-section";
const CUSTOMER = "urn:ame:leader-movement-team";
const EFFECTS = Object.freeze(["provider-local-semantic-record-journal"]);

export const semanticDigest = (value, objectKind = "lenticule.linguistics.contract-content/v2") => semanticJsonId(value, objectKind);
function identify(type, source, object, published) {
  const body = { "@context": CONTEXT, type, actor: ACTOR, target: source?.actor ?? CUSTOMER, inReplyTo: source?.id ?? null, object, published };
  return Object.freeze({ id: semanticDigest(body, "lenticule.linguistics.activity/v2"), ...body });
}
function contentValid(value) { const { id, ...body } = value ?? {}; return typeof id === "string" && id === semanticDigest(body, "lenticule.linguistics.activity/v2"); }
function attachments(note) { return Array.isArray(note?.attachment) ? note.attachment : note?.attachment === undefined ? [] : [note.attachment]; }
function requestOf(sourceActivity) {
  const supplied = attachments(sourceActivity?.object).find((item) => item?.type === "LeaderMessageParsingRequest");
  const text = supplied?.text ?? sourceActivity?.object?.content;
  return typeof text === "string" && text.trim() ? Object.freeze({ text, sourceActivity: sourceActivity?.id ?? null }) : null;
}
function journalAt(dataRoot) {
  if (typeof dataRoot !== "string" || dataRoot.length === 0) throw new TypeError("dataRoot is required");
  return createSemanticRecordJournal({ root: resolve(dataRoot), objectKind: "lenticule.linguistics.journal-record/v2" });
}
function append(journal, category, record, at) {
  return journal.record({ category, record, recordedAt: at, charge: { support: true, refutation: false } });
}
function reject(journal, source, reason, at) {
  const result = identify("Reject", source, { type: "LeaderMessageParsingRefusal", reason, prohibitedEffectsPerformed: false, customerMutation: false, foreignMutation: false }, at);
  append(journal, "leader-message-parsing.refusal/v2", result, at);
  return { status: 2, output: result };
}
function solicit(journal, source, at) {
  if (source?.["@context"] !== CONTEXT || source.type !== "Offer" || source.target !== ACTOR || source.object?.type !== "ServiceSolicitation") return reject(journal, source, "malformed-solicitation-or-law", at);
  const request = requestOf(source.object.sourceActivity);
  if (!request) {
    const question = identify("Question", source, { type: "ServiceTermsRequired", sourceActivity: source.object.sourceActivity?.id ?? null, missing: ["nonempty Leader message"] }, at);
    append(journal, "leader-message-parsing.question/v2", question, at);
    return { status: 0, output: question };
  }
  const requestDigest = semanticDigest(request, "lenticule.leader-message-parsing.request/v2");
  const offer = identify("Offer", source, {
    type: "ExecutableServiceOffer", sourceActivity: request.sourceActivity, request, requestDigest,
    intentSignature: "urn:service-intent:parse-leader-message-with-default-english-fiber",
    operation: "invoke-service", effects: EFFECTS, requirements: ["candidate-reading-not-speaker-authority", "customer-admits-result-locally"],
    scope: { sourceActivity: request.sourceActivity, sourceToken: semanticDigest(request.text, "lenticule.leader-message.source-text/v2") },
  }, at);
  append(journal, "leader-message-parsing.offer/v2", offer, at);
  return { status: 0, output: offer };
}
function invoke(journal, source, at) {
  if (source?.["@context"] !== CONTEXT || source.type !== "Accept" || source.target !== ACTOR || source.object?.type !== "ServiceContract") return reject(journal, source, "malformed-invocation-or-law", at);
  const offerActivity = source.object.offer;
  const offer = offerActivity?.object;
  if (offerActivity?.actor !== ACTOR || !contentValid(offerActivity) || offer?.operation !== "invoke-service") return reject(journal, source, "invocation-does-not-carry-exact-provider-offer", at);
  if (semanticDigest(offer.request, "lenticule.leader-message-parsing.request/v2") !== offer.requestDigest) return reject(journal, source, "offered-request-changed", at);
  if (!EFFECTS.every((effect) => source.object.capability?.allowedActions?.includes(effect))) return reject(journal, source, "capability-does-not-grant-provider-local-semantic-record-journal", at);
  try {
    const parse = parseLeaderMessage(offer.request.text);
    const result = identify("Accept", source, { type: "LeaderMessageParsingResult", disposition: "candidate-reading", sourceActivity: offer.request.sourceActivity, requestDigest: offer.requestDigest, parse, customerMutation: false, foreignMutation: false, producedBy: ACTOR }, at);
    append(journal, "leader-message-parsing.result/v2", result, at);
    return { status: 0, output: result };
  } catch (error) { return reject(journal, source, `leader-message-parsing-refused:${error instanceof Error ? error.message : String(error)}`, at); }
}

export function handleLeaderMessageParsing({ operation = "solicit-service", source = {}, at = new Date().toISOString(), dataRoot = process.env.LINGUISTICS_DATA_ROOT } = {}) {
  const journal = journalAt(dataRoot);
  if (operation === "solicit-service") return solicit(journal, source, at);
  if (operation === "invoke-service") return invoke(journal, source, at);
  return reject(journal, source, "unsupported-operation", at);
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  const flag = (name) => { const index = process.argv.indexOf(name); return index < 0 ? undefined : process.argv[index + 1]; };
  let source; try { source = JSON.parse(readFileSync(0, "utf8")); } catch { source = {}; }
  try {
    const result = handleLeaderMessageParsing({ operation: flag("--operation") ?? "solicit-service", source, at: flag("--now") ?? new Date().toISOString(), dataRoot: flag("--data-root") ?? process.env.LINGUISTICS_DATA_ROOT });
    process.stdout.write(`${JSON.stringify(result.output)}\n`); process.exitCode = result.status;
  } catch (error) { process.stderr.write(`contract-leader-message-parsing: ${error instanceof Error ? error.message : String(error)}\n`); process.exitCode = 2; }
}
