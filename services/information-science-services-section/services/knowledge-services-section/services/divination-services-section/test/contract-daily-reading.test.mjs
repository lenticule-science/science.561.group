import assert from "node:assert/strict";
import { mkdtempSync, readFileSync, readdirSync, rmSync } from "node:fs";
import { createServer } from "node:net";
import { tmpdir } from "node:os";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { createRequire } from "node:module";
import test, { after, before } from "node:test";
import { serveContractedAgent } from "@red-cup-engineering/a2a-contracted-agent-service";
import { ephemeralAgentCardSigning } from "@red-cup-engineering/a2a-agent-card-key-service/testing";
import { startWitTransitionAssayProcess } from "@lenticule-science/wit-transition-assay/test-provider";
import { startWitnessJournalProviderProcess } from "@red-cup-engineering/witness-journal-document-service/test-provider";
import { ACCOUNT, ACTOR, CONTRACT, CONTEXT, invokeDailyReading, OPERATION_TYPE } from "../src/contract-daily-reading.mjs";
import { DAILY_READING_TYPE } from "../src/rmn-daily-reading.mjs";
import { checkTerm } from "@red-cup-engineering/relation-model-notation-runtime";
import { inferTy } from "@red-cup-engineering/relation-model-notation-typing";
import { admitNormalizedSemanticContent, EMPTY_WITNESS_ROOT, identifyJsonSemanticContent, identifyNormalizedSemanticContent } from "@red-cup-engineering/semantic-content-identify-service";

const CALLER = "eip155:31337:0x0000000000000000000000000000000000000001";
const PRECONDITION = "ni:///sha-256;ntxOpkBcnbGVC6NeD1y4X54yLK7GmBmNf2ul7IhJV2I";
const POSTCONDITION = "ni:///sha-256;am0o7fpff-A8Q_SdJFQDw0zJYBdAr8Q8EQEw4V0dWj4";
const REFUSAL = "ni:///sha-256;IebXWZ-MmX6I7pLllQ4vNRHP9SdWr32AE_pC-w15YMk";
const AT = "2026-07-19T12:00:00.000Z";
const require = createRequire(import.meta.url);
const TEST_ROOT = dirname(fileURLToPath(import.meta.url));
// Locate each contracted service's package root through node module
// resolution (its exported face's package.json), never by relative
// traversal across a package boundary.
const packageRoot = (specifier) => dirname(require.resolve(`${specifier}/package.json`));
const RMN_ROOT = packageRoot("@red-cup-engineering/relation-model-notation-conformance");
let rmnServer, witnessJournalServer, witServer, agentUrl, witnessJournalAgentUrl, witAgentUrl;

function memoryTaskSource() {
  const records = new Map();
  const coordinate = ({ taskId, tenant = "" }) => `${tenant}\u0000${taskId}`;
  return Object.freeze({
    async put(record) {
      records.set(coordinate(record), structuredClone(record));
      return structuredClone(record);
    },
    async get(reference) {
      const record = records.get(coordinate(reference));
      return record === undefined ? null : structuredClone(record);
    },
    async list({ tenant = "" } = {}) {
      return [...records.values()]
        .filter((record) => record.tenant === tenant)
        .map((record) => structuredClone(record));
    },
  });
}

function memoryCoordinationSource() {
  const records = new Map();
  let revision = 0;
  const coordinate = ({ namespace, tenant = "", key }) => `${namespace}\u0000${tenant}\u0000${key}`;
  return Object.freeze({
    async put(record) {
      const stored = {
        ...structuredClone(record),
        contentSha256: `memory-${++revision}`,
        etag: `memory-${revision}`,
      };
      records.set(coordinate(record), stored);
      return structuredClone(stored);
    },
    async get(reference) {
      const record = records.get(coordinate(reference));
      return record === undefined ? null : structuredClone(record);
    },
    async list({ namespace, tenant = "" }) {
      return [...records.values()]
        .filter((record) => record.namespace === namespace && record.tenant === tenant)
        .map((record) => structuredClone(record));
    },
    async remove(reference) {
      return records.delete(coordinate(reference));
    },
  });
}

function termIdentity(term, objectKind, declaredType) {
  const semanticType = declaredType ?? inferTy([], term);
  assert.notEqual(semanticType, null);
  return identifyNormalizedSemanticContent({ objectKind, semanticType, term, witnessRoot: EMPTY_WITNESS_ROOT });
}

before(async () => {
  const socket = createServer(); await new Promise((accept) => socket.listen(0, "127.0.0.1", accept));
  const port = socket.address().port; await new Promise((accept) => socket.close(accept));
  const baseUrl = `http://127.0.0.1:${port}`; agentUrl = `${baseUrl}/.well-known/agent-card.json`;
  rmnServer = await serveContractedAgent({ port, host: "127.0.0.1", baseUrl,
    taskSource: memoryTaskSource(), coordinationSource: memoryCoordinationSource(),
    agentCard: resolve(TEST_ROOT, "fixtures/rmn-semantic-conformance.json"),
    executor: process.execPath, executorArgs: [resolve(RMN_ROOT, "scripts/execute-a2a-task.mjs")], timeoutMs: 10_000,
    ...ephemeralAgentCardSigning(baseUrl, "divination-rmn-test") });
  witnessJournalServer = await startWitnessJournalProviderProcess();
  witnessJournalAgentUrl = witnessJournalServer.agentCardUrl;
  witServer = await startWitTransitionAssayProcess({ witnessJournalAgentUrl });
  witAgentUrl = witServer.agentCardUrl;
});
after(async () => {
  const closing = [
    ...(witServer ? [witServer.close()] : []),
    ...(witnessJournalServer ? [witnessJournalServer.close()] : []),
    ...(rmnServer?.server ? [new Promise((resolveClose, rejectClose) => {
      rmnServer.server.close((error) => error ? rejectClose(error) : resolveClose());
    })] : []),
  ];
  const results = await Promise.allSettled(closing);
  const failures = results.filter(({ status }) => status === "rejected").map(({ reason }) => reason);
  if (failures.length > 0) throw new AggregateError(failures, "contract daily-reading fixture cleanup failed");
});

function proposal(date = "2026-07-18", tradition = "rcl", mutate = (cell) => cell) {
  const operation = ["pair", ["mark", date], ["mark", tradition]];
  const cell = mutate({
    law: CONTRACT, caller: CALLER, provider: ACCOUNT,
    precondition: PRECONDITION, operation: termIdentity(operation, "divination.daily-reading-operation", OPERATION_TYPE).token, postcondition: POSTCONDITION, refusal: REFUSAL,
    evidenceRoot: termIdentity(["mark", "proposal-at-four-bottom"], "divination.daily-reading-proposal-evidence").token, outcome: { positiveEvidence: false, negativeEvidence: false },
    measures: [
      { dimension: "asset", quantity: "0", unit: "none" }, { dimension: "compute", quantity: "1", unit: "daily-reading" },
      { dimension: "erasure", quantity: "0", unit: "alternative" }, { dimension: "gas", quantity: "0", unit: "gas" },
      { dimension: "time", quantity: "0", unit: "millisecond" }, { dimension: "wit", quantity: "0", unit: "typed-four-cover" },
    ], parent: null,
  });
  const proposalIdentity = identifyJsonSemanticContent({ objectKind: "divination.daily-reading-proposal", value: { cell, operation }, witnessRoot: EMPTY_WITNESS_ROOT });
  return {
    "@context": CONTEXT, id: "urn:test:divination-contract", type: "Accept", actor: "urn:ame:test-caller", target: ACTOR,
    object: {
      type: "ServiceContract", contract: CONTRACT, callerAccount: CALLER,
      proposal: { type: "Document", id: proposalIdentity.token, mediaType: "application/rmn+cbor", content: Buffer.from(proposalIdentity.bytes).toString("base64") },
    },
  };
}

function fixture() {
  const divination = mkdtempSync(join(tmpdir(), "divination-rmn-test-"));
  return { divination, env: { DIVINATION_DATA_ROOT: divination, RMN_CONFORMANCE_AGENT: agentUrl, WITNESS_JOURNAL_RDF_AGENT: witnessJournalAgentUrl, WIT_TRANSITION_ASSAY_AGENT: witAgentUrl } };
}

test("Divination settles a variable-length reading as one fully typed RMN term", async (t) => {
  const roots = fixture(); t.after(() => { rmSync(roots.divination, { recursive: true, force: true }); });
  const result = await invokeDailyReading(proposal(), { env: roots.env, now: AT });
  assert.equal(result.type, "Accept", JSON.stringify(result));
  assert.equal(result.object.type, "RmnDailyReadingSettlement");
  assert.equal(result.object.disposition, "completion");
  assert.match(result.object.witness, /^ni:\/\/\/sha-256;/u);
  const reading = result.object.attachment.find(({ profile }) => profile === "org.emsenn.divination.daily-reading.v1");
  assert.ok(reading);
  const identified = admitNormalizedSemanticContent(Buffer.from(reading.content, "base64"), reading.id);
  const term = identified.envelope.settledBody;
  assert.equal(checkTerm(term, DAILY_READING_TYPE), true);
  assert.equal(termIdentity(term, "divination.daily-reading", DAILY_READING_TYPE).token, reading.id);
  assert.equal(term[0], "pair");
  const objectFiles = readdirSync(join(roots.divination, "objects/sha-256"));
  assert.equal(objectFiles.length, 2);
  const witnessJournalDir = join(roots.divination, "data/logs/2026/07/19"), witnessJournalFiles = readdirSync(witnessJournalDir);
  assert.equal(witnessJournalFiles.length, 1);
  const witnessJournal = readFileSync(join(witnessJournalDir, witnessJournalFiles[0]), "utf8");
  const witnessRows = witnessJournal.trim().split("\n").map((line) => JSON.parse(line));
  assert.equal(witnessRows.length, 5);
  assert.ok(witnessRows.every((row) => Object.keys(row).sort().join(",") === "a,e,t,v"));
  assert.match(
    witnessRows.find(({ a }) => a === "daily-reading:transition-witness")?.v ?? "",
    /^semantic-content\.transition-witness\.sha256\.[0-9a-f]{64}$/u,
  );
});

test("a valid RMN proposal with an invalid date settles by one negative-evidence WIT", async (t) => {
  const roots = fixture(); t.after(() => { rmSync(roots.divination, { recursive: true, force: true }); });
  const result = await invokeDailyReading(proposal("2026-02-30"), { env: roots.env, now: AT });
  assert.equal(result.type, "Reject");
  assert.equal(result.object.disposition, "refused");
  const refusal = result.object.attachment.find(({ profile }) => profile === "org.emsenn.divination.refusal.v1");
  assert.ok(refusal);
  const term = admitNormalizedSemanticContent(Buffer.from(refusal.content, "base64"), refusal.id).envelope.settledBody;
  assert.deepEqual(term[1], ["mark", "reading-computation-refused"]);
});

test("Divination rejects an effect whose operation commitment does not match its bundled operation", async (t) => {
  const roots = fixture(); t.after(() => { rmSync(roots.divination, { recursive: true, force: true }); });
  const source = proposal("2026-07-18", "rcl", (cell) => ({ ...cell, operation: termIdentity(["mark", "other-operation"], "divination.daily-reading-operation").token }));
  await assert.rejects(invokeDailyReading(source, { env: roots.env, now: AT }), /effect-operation-mismatch|does not identify/u);
  assert.deepEqual(OPERATION_TYPE, ["prod", ["base"], ["base"]]);
});
