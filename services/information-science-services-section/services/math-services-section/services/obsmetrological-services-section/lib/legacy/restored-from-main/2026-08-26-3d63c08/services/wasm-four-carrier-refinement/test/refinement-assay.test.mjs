import assert from "node:assert/strict";
import test from "node:test";
import { chmod, lstat, mkdtemp, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { observeInfomaterial } from "@lenticule-science/infomaterial-observation";
import { jsonId } from "../src/semantic-identity.mjs";
import { HIERARCHICAL_CIRCUIT_PROFILE } from "@red-cup-engineering/hierarchical-circuit-law";
import { assayWasmFourCarrierRefinement, PROVIDER_ACCOUNT, WASM_FOUR_CARRIER_PROFILE } from "../src/refinement-assay.mjs";
import { createWasmFourCarrierRefinementRecordJournal } from "../src/record-journal.mjs";
import { decodeLegacyAscribedRelationalWire } from "@red-cup-engineering/carrier-refinement-law/legacy-ascribed-wire";
import { EMPTY_WITNESS_ROOT, admitJsonSemanticContent, identifyJsonSemanticContent, verifySha256NiUri } from "@red-cup-engineering/semantic-content-identify-service";
import { encodeWasmFourRefinementRequest, toScisTransport } from "../src/refinement-assay.mjs";
import { semanticBytes } from "@red-cup-engineering/relation-model-notation-cbor-codec";

const IDENTITY_WASM = Buffer.from("AGFzbQEAAAABBwFgAn9/AX8DAwIAAAcnAhBwb3NpdGl2ZUV2aWRlbmNlAAAQbmVnYXRpdmVFdmlkZW5jZQABCgsCBAAgAAsEACABCw==", "base64");
const IMPORT_WASM = Buffer.from([0,97,115,109,1,0,0,0,1,4,1,96,0,0,2,7,1,1,120,1,102,0,0]);
const FOUR = [[false, false], [true, false], [false, true], [true, true]].map(([positiveEvidence, negativeEvidence]) => ({ positiveEvidence, negativeEvidence }));
const id = (label) => jsonId(["constant", ["base", "Text"], label], "lenticule.carrier-refinement.test-text-constant");
const component = (outputs = FOUR) => ({
  profile: HIERARCHICAL_CIRCUIT_PROFILE,
  law: id("identity wasm die law"),
  ports: [
    { name: "in", direction: "input", predicate: id("witnessed input"), carrier: id("FOUR pair"), mode: "tensor" },
    { name: "out", direction: "output", predicate: id("witnessed output"), carrier: id("FOUR pair"), mode: "tensor" },
  ],
  instances: [], nets: [],
  behavior: { factors: [{ inputs: ["in"], outputs: ["out"], rows: FOUR.map((input, index) => ({ input: [input], output: [outputs[index]] })) }] },
});

async function fixture(bytes = IDENTITY_WASM) {
  const root = await mkdtemp(join(tmpdir(), "wasm-four-refinement-")), path = join(root, "die.wasm");
  await writeFile(path, bytes); await chmod(path, 0o644);
  const observed = await observeInfomaterial(path), stat = await lstat(path, { bigint: true });
  const materialObservation = { ...observed.observation, semanticId: observed.semanticId, canonicalBytesBase64: observed.canonicalBytes.toString("base64") };
  return { root, bytes, materialObservation, mode: String(stat.mode) };
}

function request(fixture, selected = component()) {
  return { kind: "WasmFourCarrierRefinementAssayRequest", producer: "eip155:31337:0x1111111111111111111111111111111111111111", component: selected, materialObservation: fixture.materialObservation, carrier: { profile: WASM_FOUR_CARRIER_PROFILE, bytesBase64: fixture.bytes.toString("base64"), mode: fixture.mode } };
}

test("exact no-import WebAssembly material mechanically refines the complete FOUR behavior", async () => {
  const value = await fixture(), result = await assayWasmFourCarrierRefinement(request(value));
  assert.equal(result.receipt.equivalent, true);
  assert.equal(result.proof.vectorCount, 4);
  assert.equal(result.proof.vectors.every(({ matched }) => matched), true);
  assert.equal(result.receipt.proof, result.proofSemanticId);
  assert.equal(result.receipt.materialRoot, value.materialObservation.materialRoot);
  assert.match(result.semanticId, /^ni:\/\/\/sha-256;/u);
});

test("the carrier producer may run the same exact replayable refinement assay", async () => {
  const value = await fixture(), input = request(value); input.producer = PROVIDER_ACCOUNT;
  const result = await assayWasmFourCarrierRefinement(input);
  assert.equal(result.receipt.provider, PROVIDER_ACCOUNT);
  assert.equal(result.receipt.producer, PROVIDER_ACCOUNT);
  assert.equal(result.receipt.equivalent, true);
  assert.equal(result.proof.vectors.every(({ matched }) => matched), true);
});

test("changed bytes cannot inhabit an earlier material observation", async () => {
  const value = await fixture(); value.bytes = Buffer.from(value.bytes); value.bytes[value.bytes.length - 2] ^= 1;
  await assert.rejects(assayWasmFourCarrierRefinement(request(value)), /do not inhabit the observed material root/u);
});

test("the bounded physical die refuses all WebAssembly host imports", async () => {
  const value = await fixture(IMPORT_WASM);
  await assert.rejects(assayWasmFourCarrierRefinement(request(value)), /permits no imports/u);
});

test("executed carrier output must equal the exact RMN component behavior", async () => {
  const value = await fixture(), outputs = FOUR.map((pair) => ({ ...pair })); outputs[2] = { positiveEvidence: true, negativeEvidence: true };
  await assert.rejects(assayWasmFourCarrierRefinement(request(value, component(outputs))), /differs from component behavior/u);
});

test("successful evidence remains in the package-local support-only SEAVT journal", async () => {
  const value = await fixture(), result = await assayWasmFourCarrierRefinement(request(value));
  const journal = createWasmFourCarrierRefinementRecordJournal({ root: await mkdtemp(join(tmpdir(), "wasm-four-refinement-journal-")) });
  const recorded = journal.recordReceipt({ ...result.receipt, semanticId: result.semanticId }, "2026-08-14T00:00:00.000Z");
  assert.equal(recorded.objectKind, "lenticule.wasm-four-carrier-refinement.journal-record");
  assert.deepEqual(recorded.charge, { support: true, refutation: false });
  assert.deepEqual(journal.query({ category: "wasm-four-carrier-refinement.receipt" })[0].record, { ...result.receipt, semanticId: result.semanticId });
  assert.ok(journal.claims().some((claim) => claim.a === "charge:support"));
  assert.ok(!journal.claims().some((claim) => claim.a === "charge:refutation"));
});

test("SCIS v2 is the exact new transport while the named v7 wire remains ingress-only", async () => {
  const value = await fixture(), canonical = encodeWasmFourRefinementRequest(request(value));
  const transported = toScisTransport(canonical.value), v2 = identifyJsonSemanticContent({ objectKind: "lenticule.wasm-four-carrier-refinement.request", value: transported, witnessRoot: EMPTY_WITNESS_ROOT });
  assert.ok(verifySha256NiUri(v2.bytes, v2.token));
  assert.equal(admitJsonSemanticContent({ bytes: v2.bytes, token: v2.token, objectKind: "lenticule.wasm-four-carrier-refinement.request" }).value.kind, canonical.value.kind);
  assert.deepEqual(decodeLegacyAscribedRelationalWire(["ascribe", canonical.type, canonical.term]), canonical.value);
  assert.notEqual(v2.token, jsonId(["ascribe", canonical.type, canonical.term], "lenticule.wasm-four-carrier-refinement.request"));
  assert.ok(semanticBytes(["ascribe", canonical.type, canonical.term]).length > 0);
});
