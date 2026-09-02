import assert from "node:assert/strict";
import { mkdtempSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, resolve } from "node:path";
import { spawnSync } from "node:child_process";
import test from "node:test";

import { handleLeaderMessageParsing, semanticDigest } from "../src/contract-leader-message-parsing.js";
import { admitAndRecordLegacyLinguisticsBlob, admitLegacyLinguisticsBlob, admitLegacyLinguisticsRelationalWire } from "../src/legacy-linguistics-relational-wire.js";
import { parseLeaderMessage } from "../src/parse-leader-message.js";

const ROOT = resolve(import.meta.dirname, "..");
const CONTEXT = "https://www.w3.org/ns/activitystreams";
const ACTOR = "urn:ame:linguistics-services-section";
const CUSTOMER = "urn:ame:leader-movement-team";
const NOW = "2096-07-18T06:00:00.000Z";
const leaderText = "Stand up a linguistics services section. I can switch from Ming Daoism to semiosis without missing a beat, but SHP should not become a roadblock.";

function sourceActivity(overrides = {}) { return { "@context": CONTEXT, id: "urn:leader:test", type: "Create", actor: "urn:leader:emsenn", target: CUSTOMER, object: { type: "Note", content: leaderText, ...overrides } }; }
function solicitation(source = sourceActivity()) { return { "@context": CONTEXT, id: "urn:lmt:solicit", type: "Offer", actor: CUSTOMER, target: ACTOR, object: { type: "ServiceSolicitation", sourceActivity: source } }; }
function root() { return mkdtempSync(join(tmpdir(), "linguistics-service-test-")); }
function run(operation, source, dataRoot) { return handleLeaderMessageParsing({ operation, source, at: NOW, dataRoot }); }

test("the default English fiber preserves source, ambiguity, and repairs without claiming authority", () => {
  const parsed = parseLeaderMessage(leaderText);
  assert.equal(parsed.kind, "lenticule-science.leader-message-parse/v2");
  assert.equal(parsed.candidateReading, true);
  assert.equal(parsed.source.text, leaderText);
  assert.equal(parsed.language.fiber, "@lenticule-science/english-language-algebra@0.1.7");
  assert.notEqual(parsed.language.fiber, parsed.language.contentToken);
  assert.ok(parsed.ambiguity.obstructions.length >= 1);
  assert.ok(parsed.repairObligations.length >= parsed.ambiguity.obstructions.length);
  assert.ok(parsed.limitations.some((item) => item.includes("no speaker intent")));
});

test("the strict JSON contract solicits and invokes into precisely the supplied local data root", () => {
  const dataRoot = root();
  try {
    const offered = run("solicit-service", solicitation(), dataRoot);
    assert.equal(offered.status, 0); assert.equal(offered.output.type, "Offer");
    assert.equal(offered.output.object.requestDigest, semanticDigest(offered.output.object.request, "lenticule.leader-message-parsing.request/v2"));
    const invocation = { "@context": CONTEXT, id: "urn:lmt:accept", type: "Accept", actor: CUSTOMER, target: ACTOR, object: { type: "ServiceContract", offer: offered.output, capability: { allowedActions: ["provider-local-semantic-record-journal"] } } };
    const executed = run("invoke-service", invocation, dataRoot);
    assert.equal(executed.status, 0); assert.equal(executed.output.object.disposition, "candidate-reading");
    assert.equal(executed.output.object.customerMutation, false);
    assert.match(readFileSync(join(dataRoot, "data", "logs", "2096", "07", "18", "semantic-record-content.jsonl"), "utf8"), /LeaderMessageParsingResult/u);
  } finally { rmSync(dataRoot, { recursive: true, force: true }); }
});

test("tampered offers and unsupported effect capabilities are refused", () => {
  const dataRoot = root();
  try {
    const offered = run("solicit-service", solicitation(), dataRoot).output;
    const tampered = structuredClone(offered); tampered.object.request.text = "a different text";
    const result = run("invoke-service", { "@context": CONTEXT, type: "Accept", actor: CUSTOMER, target: ACTOR, object: { type: "ServiceContract", offer: tampered, capability: { allowedActions: [] } } }, dataRoot);
    assert.equal(result.status, 2); assert.match(result.output.object.reason, /exact-provider-offer|offered-request-changed/u);
  } finally { rmSync(dataRoot, { recursive: true, force: true }); }
});

test("legacy relational blobs are filename-bound and readdressed without a legacy encoder", () => {
  const path = join(ROOT, "data", "rmn", "sha-256", "28", "28bdjBPXLwdp4SgcKU1V-ct-Pup44fiD7rd9sRlFr6w.rmn.cbor");
  const receipt = admitLegacyLinguisticsBlob(path);
  assert.equal(receipt.wire, "legacy-linguistics-relational-wire/v1");
  assert.match(receipt.legacyToken, /^ni:\/\/\/sha-256;/u);
  assert.match(receipt.readdressedToken, /^ni:\/\/\/sha-256;/u);
  assert.notEqual(receipt.legacyToken, receipt.readdressedToken);
  const dataRoot = root();
  const recorded = admitAndRecordLegacyLinguisticsBlob({ path, dataRoot, recordedAt: NOW });
  assert.match(recorded.journalRecordToken, /^ni:\/\/\/sha-256;/u);
  assert.match(readFileSync(join(dataRoot, "data", "logs", "2096", "07", "18", "semantic-record-content.jsonl"), "utf8"), /legacy-linguistics-relational-wire\/v1/u);
  rmSync(dataRoot, { recursive: true, force: true });
  const bytes = Buffer.from(readFileSync(path)); bytes[0] ^= 1;
  assert.throws(() => admitLegacyLinguisticsRelationalWire({ bytes, filename: path }), /immutable filename/u);
});

test("both installed bins accept the ordinary packed transport", () => {
  const parser = spawnSync(process.execPath, [join(ROOT, "src", "parse-leader-message.js")], { input: leaderText, encoding: "utf8" });
  assert.equal(parser.status, 0, parser.stderr);
  assert.equal(JSON.parse(parser.stdout).source.text, leaderText);
  const dataRoot = root();
  try {
    const solicitationResult = spawnSync(process.execPath, [join(ROOT, "src", "contract-leader-message-parsing.js"), "--operation", "solicit-service", "--now", NOW, "--data-root", dataRoot], { input: JSON.stringify(solicitation()), encoding: "utf8" });
    assert.equal(solicitationResult.status, 0, solicitationResult.stderr);
    assert.equal(JSON.parse(solicitationResult.stdout).type, "Offer");
  } finally { rmSync(dataRoot, { recursive: true, force: true }); }
});
