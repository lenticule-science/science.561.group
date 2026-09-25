#!/usr/bin/env node

import { readFileSync } from "node:fs";
import { basename, dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

import { EMPTY_WITNESS_ROOT, identifyBytesSemanticContent, identifyJsonSemanticContent }
  from "@red-cup-engineering/computer-code-engineering-services-section/semiotic-expression-notation/runtime";
import { ACTIVITYSTREAMS_CONTEXT } from "@red-cup-engineering/activitypub-services-section/activitystreams";

const ACTOR = "urn:ame:oml";
const NODE_ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const REQUIRED_VERIFICATIONS = ["obsmetrologia-scope-audit", "obsmetrologia-lake-build", "obsmetrologia-axiom-law"];
// The Obsmetrologia axiom law (owner-ruled 2026-09-21): the library admits no axioms beyond
// `Quot.sound`, ever — see obsmetrologia-theorem-audit's ALLOWED_AXIOMS. A change bundle cannot
// itself run `lake build` and read `collectAxioms`, so this gate is conservative and textual: any
// diff line the bundle *adds* under the Lean library that declares a new `axiom` or names `sorry`
// as a token is refused outright, whether or not the bundle also carries passing verification
// evidence. It is a syntactic backstop, not a substitute for `obsmetrologia-axiom-law` evidence.
const OBSMETROLOGIA_LEAN_LIBRARY_PREFIXES = ["Obsmetrologia/", "lib/obsmetrologia/Obsmetrologia/"];
const AXIOM_DECLARATION_LINE = /^\s*axiom\s/u;
const SORRY_TOKEN = /\bsorry\b/u;
const EFFECTS = ["provider-local-witness-journal-evidence"];

export function semanticDigest(value) {
  return identifyJsonSemanticContent({
    objectKind: "lenticule.oml.change-bundle-record",
    value,
    witnessRoot: EMPTY_WITNESS_ROOT,
  }).token;
}
export const bytesNi = (bytes) => identifyBytesSemanticContent({
  objectKind: "lenticule.oml.change-bundle-carrier",
  bytes: typeof bytes === "string" ? new TextEncoder().encode(bytes) : bytes,
  witnessRoot: EMPTY_WITNESS_ROOT,
}).token;
function identify(body) { return { id: semanticDigest(body), ...body }; }
function contentValid(value) { const { id: _id, ...body } = value ?? {}; return value?.id === semanticDigest(body); }
function operation() {
  const index = process.argv.indexOf("--operation"); if (index >= 0) return process.argv[index + 1];
  const invoked = basename(process.argv[1] ?? ""); return invoked === "solicit-service" || invoked === "invoke-service" ? invoked : "invoke-service";
}
function instant() { const index = process.argv.indexOf("--now"); return index >= 0 ? process.argv[index + 1] : new Date().toISOString(); }
function response(type, source, object, at) {
  return identify({ "@context": ACTIVITYSTREAMS_CONTEXT, type, actor: ACTOR, target: source?.actor ?? null,
    inReplyTo: source?.id ?? null, object, published: at });
}
async function append(store, category, record) {
  await store.record({ category: `pure-mathematics-change-bundle-qualification-${category}`,
    recordedAt: record.published ?? record.recordedAt, record });
}
async function reject(store, source, reason, at, unmet = []) {
  const value = response("Reject", source, { type: "PureMathematicsChangeBundleQualificationRefusal", reason, unmet,
    prohibitedEffectsPerformed: false, customerMutation: false, foreignMutation: false }, at);
  await append(store, "refusals", value); return value;
}
function nonempty(value) { return typeof value === "string" && value.trim() !== ""; }
function ni(value) { return typeof value === "string" && /^ni:\/\/\/sha-256;[A-Za-z0-9_-]{43}$/u.test(value); }
function plainRelative(path) {
  return nonempty(path) && !path.startsWith("/") && !path.includes("\\") && !path.split("/").includes("..") && !path.split("/").includes(".git");
}
function patchPaths(content) {
  return [...content.matchAll(/^\+\+\+ b\/(.+)$/gmu)].map((match) => match[1]).filter((path) => path !== "/dev/null");
}
function underObsmetrologiaLeanLibrary(path) {
  return OBSMETROLOGIA_LEAN_LIBRARY_PREFIXES.some((prefix) => path.startsWith(prefix));
}
/**
 * Walk a unified diff's own text and report every *added* line, under the Obsmetrologia Lean
 * library, that declares an `axiom` or names `sorry`. Conservative by construction: it reads the
 * added line's text exactly as the patch carries it (after the leading `+`), and only exempts a
 * line whose trimmed text itself opens with a Lean `--` line comment — it does not parse Lean's
 * `/- block comments -/` or strip a trailing `-- comment` off an otherwise-live line, so it can
 * refuse a bundle it need not, but it never lets a real axiom or sorry through uninspected.
 * @param {string} content - The patch's unified-diff text.
 * @returns {string[]} `path:line` for every offending added line.
 */
function forbiddenLeanLineFindings(content) {
  const findings = [];
  let path = null;
  let newLine = 0;
  for (const line of content.split(/\r?\n/u)) {
    const target = /^\+\+\+ b\/(.+)$/u.exec(line);
    if (target) { path = target[1] === "/dev/null" ? null : target[1]; newLine = 0; continue; }
    const hunk = /^@@ -\d+(?:,\d+)? \+(\d+)(?:,\d+)? @@/u.exec(line);
    if (hunk) { newLine = Number(hunk[1]) - 1; continue; }
    if (line.startsWith("+++") || line.startsWith("---")) continue;
    if (path === null || !underObsmetrologiaLeanLibrary(path)) continue;
    if (line.startsWith("+")) {
      newLine += 1;
      const body = line.slice(1);
      if (!body.trim().startsWith("--") && (AXIOM_DECLARATION_LINE.test(body) || SORRY_TOKEN.test(body))) findings.push(`${path}:${newLine}`);
    } else if (line.startsWith(" ")) {
      newLine += 1;
    }
  }
  return findings;
}

export function requestProblems(request) {
  const problems = [];
  if (!request || typeof request !== "object" || Array.isArray(request)
      || Object.keys(request).some((key) => !["bundleId", "baseline", "patch", "claim", "verification", "applicationDependencies", "authority"].includes(key))) {
    return ["request must carry only the declared change-bundle fields"];
  }
  if (!nonempty(request.bundleId)) problems.push("bundleId(non-empty-string)");
  if (!request.baseline || !nonempty(request.baseline.repository) || typeof request.baseline.revision !== "string"
      || !/^[0-9a-f]{40}$/u.test(request.baseline.revision)
      || Object.keys(request.baseline).some((key) => !["repository", "revision"].includes(key))) problems.push("baseline(repository,40-hex-revision)");
  const patch = request.patch;
  if (!patch || typeof patch.content !== "string" || patch.content.length === 0 || patch.content.length > 1_000_000 || !ni(patch.ni)
      || !Array.isArray(patch.changedPaths) || patch.changedPaths.length === 0 || new Set(patch.changedPaths).size !== patch.changedPaths.length
      || !patch.changedPaths.every(plainRelative) || Object.keys(patch).some((key) => !["content", "ni", "changedPaths"].includes(key))) {
    problems.push("patch(content<=1MB,RFC6920-ni,unique-relative-changedPaths)");
  } else {
    if (bytesNi(patch.content) !== patch.ni) problems.push("patch.ni(matches-content-bytes)");
    if (/^GIT binary patch$/mu.test(patch.content)) problems.push("patch(binary-patches-not-admitted)");
    const declared = [...patch.changedPaths].sort(); const observed = [...new Set(patchPaths(patch.content))].sort();
    if (JSON.stringify(declared) !== JSON.stringify(observed)) problems.push("patch.changedPaths(exactly-match-unified-diff-targets)");
    const forbidden = patch.changedPaths.filter((path) => /(^|\/)(apps?|application|runtime)(\/|$)|HoareProgram/iu.test(path));
    if (forbidden.length) problems.push(`application-shaped paths are outside the pure package offer: ${forbidden.join(", ")}`);
    const forbiddenLeanLines = forbiddenLeanLineFindings(patch.content);
    if (forbiddenLeanLines.length) problems.push(`diff adds an axiom or sorry under the Obsmetrologia Lean library (the axiom law admits only Quot.sound, never sorry): ${forbiddenLeanLines.join(", ")}`);
  }
  const claim = request.claim;
  if (!claim || claim.kind !== "pure-mathematics" || !nonempty(claim.id) || !nonempty(claim.statement)
      || !Array.isArray(claim.corpusSources) || claim.corpusSources.length === 0
      || !claim.corpusSources.every((source) => plainRelative(source?.path) && ni(source?.ni))
      || Object.keys(claim).some((key) => !["id", "kind", "statement", "corpusSources"].includes(key))) {
    problems.push("claim(id,kind=pure-mathematics,statement,ni-identified-corpusSources)");
  }
  if (!Array.isArray(request.applicationDependencies) || request.applicationDependencies.length !== 0) problems.push("applicationDependencies(must-be-empty)");
  const verification = request.verification;
  if (!Array.isArray(verification) || verification.some((item) => !item || !nonempty(item.id) || item.outcome !== "passed" || !ni(item.evidence)
      || Object.keys(item).some((key) => !["id", "outcome", "evidence"].includes(key)))) {
    problems.push("verification(passed-items-with-RFC6920-evidence-identities)");
  } else for (const id of REQUIRED_VERIFICATIONS) if (!verification.some((item) => item.id === id)) problems.push(`verification requires ${id}`);
  const authority = request.authority;
  if (!authority || !nonempty(authority.controller) || !nonempty(authority.basis) || authority.mayAdmitToObsmetrologia !== false
      || Object.keys(authority).some((key) => !["controller", "basis", "mayAdmitToObsmetrologia"].includes(key))) {
    problems.push("authority(controller,basis,mayAdmitToObsmetrologia=false)");
  }
  return [...new Set(problems)];
}

export function qualifyChangeBundle(request) {
  const problems = requestProblems(request); if (problems.length) throw new TypeError(`inadmissible change bundle: ${problems.join(", ")}`);
  return { type: "PureMathematicsChangeBundleQualification",
    bundleId: request.bundleId, requestDigest: semanticDigest(request), baseline: request.baseline,
    patchIdentity: request.patch.ni, changedPaths: request.patch.changedPaths, claim: request.claim, verification: request.verification,
    qualification: { contentAddressVerified: true, pathEnvelopeVerified: true, requiredVerificationWitnessesPresent: true,
      applicationDependenciesDeclaredAbsent: true, mathematicalTruthVerified: false, corpusGroundingTruthVerified: false,
      customerAdmissionRequired: true,
      limitation: "This operation verifies bundle bytes, path envelope, declared evidence shape, and application-dependency absence; it does not prove the theorem, rerun supplied evidence, or admit the patch to Obsmetrologia." },
    authority: request.authority, customerMutation: false, foreignMutation: false };
}
function solicitationProblems(activity) {
  if (activity?.["@context"] !== ACTIVITYSTREAMS_CONTEXT || activity.type !== "Offer" || activity.target !== ACTOR
      || activity.object?.type !== "ServiceSolicitation") return ["solicitation must be an ActivityStreams Offer<ServiceSolicitation> addressed to OML"];
  return requestProblems(activity.object.request);
}
async function solicit(store, activity, at) {
  const problems = solicitationProblems(activity);
  if (problems.length) return reject(store, activity, `invalid-solicitation:${problems.join(",")}`, at, problems);
  const request = structuredClone(activity.object.request);
  const terms = { type: "UnpricedServiceTerms",
    assetPaymentRequired: false, witInterchangeabilityClaimed: false, erasureInterchangeabilityClaimed: false, gasInterchangeabilityClaimed: false };
  const object = { type: "ExecutableServiceOffer",
    sourceActivity: activity.id, request, requestDigest: semanticDigest(request), terms, termsDigest: semanticDigest(terms),
    operation: "invoke-service", effects: EFFECTS,
    evidence: ["provider-local-witness-journal-evidence", "completion-or-typed-refusal"] };
  const offer = response("Offer", activity, object, at); await append(store, "offers", offer); return offer;
}
function invocationProblem(activity) {
  if (activity?.["@context"] !== ACTIVITYSTREAMS_CONTEXT || activity.type !== "Accept" || activity.target !== ACTOR) return "invocation must be an ActivityStreams Accept addressed to OML";
  const contract = activity.object; const offer = contract?.offer;
  if (contract?.type !== "ServiceContract") return "invocation must accept the exact normalized SEN law";
  if (offer?.type !== "Offer" || offer.actor !== ACTOR
      || !contentValid(offer) || offer.object?.type !== "ExecutableServiceOffer") return "ServiceContract must carry OML's exact authored offer";
  if (offer.object.requestDigest !== semanticDigest(offer.object.request)) return "accepted request differs from provider-authored term";
  if (offer.object.termsDigest !== semanticDigest(offer.object.terms)
      || contract.termsAcceptance?.termDigest !== offer.object.termsDigest) return "customer did not accept the provider-authored terms";
  const capability = contract.capability;
  if (capability?.type !== "Capability" || capability.holder !== ACTOR || capability.invocationTarget !== ACTOR) return "invocation requires a capability held by OML";
  if (capability.parentOffer !== offer.id || capability.attenuation?.requestDigest !== offer.object.requestDigest) return "capability is not attenuated to the accepted offer";
  if (capability.capTP?.target !== ACTOR || capability.capTP.method !== "invoke-service" || !(capability.allowedActions ?? []).includes("invoke-service")) return "capability does not authorize OML's exact invoke-service method";
  if (!EFFECTS.every((effect) => (capability.allowedActions ?? []).includes(effect)) || (capability.allowedActions ?? []).includes("customer-write")) return "capability must permit only provider-local WitnessJournal evidence";
  return null;
}
async function invoke(store, activity, at) {
  const invalid = invocationProblem(activity); if (invalid) return reject(store, activity, invalid, at, [invalid]);
  const offer = activity.object.offer; let qualification;
  try { qualification = qualifyChangeBundle(offer.object.request); }
  catch (error) { return reject(store, activity, `qualification-could-not-settle:${error.message}`, at, [error.message]); }
  const record = identify({ type: "PureMathematicsChangeBundleQualificationRecord", outcome: "completion", qualification,
    recordedAt: at, customerMutation: false, foreignMutation: false });
  const receipt = identify({ type: "ServicePerformanceReceipt",
    provider: ACTOR, customer: activity.actor, offer: offer.id, invocation: activity.id,
    fulfillment: record.id, outcome: record.outcome, recordedAt: at, assetSettlementClaimed: false });
  const result = response("Accept", activity, { type: "PureMathematicsChangeBundleQualificationResult", record, receipt,
    customerMutation: false, foreignMutation: false }, at);
  await append(store, "qualifications", record); await append(store, "receipts", receipt); await append(store, "results", result);
  return result;
}

export async function run(activity, op = "invoke-service", at = new Date().toISOString(), options = {}) {
  const dataRoot = resolve(options.dataRoot ?? process.env.OML_DATA_ROOT ?? join(NODE_ROOT, "data"));
  const { createSettlementStore } = await import("@red-cup-engineering/witness-journal-document-service/record-semantic-record");
  const store = createSettlementStore({ settlementRoot: dataRoot, objectKind: "lenticule.oml.change-bundle-qualification.record", actor: ACTOR });
  if (op === "solicit-service") return solicit(store, activity, at);
  if (op === "invoke-service") return invoke(store, activity, at);
  return reject(store, activity, `unknown-provider-operation:${op}`, at);
}
if (process.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  try {
    const output = await run(JSON.parse(readFileSync(0, "utf8")), operation(), instant());
    process.stdout.write(`${JSON.stringify(output, null, 2)}\n`); if (output.type === "Reject") process.exitCode = 2;
  } catch (error) { process.stderr.write(`oml: ${error.message}\n`); process.exitCode = 1; }
}
