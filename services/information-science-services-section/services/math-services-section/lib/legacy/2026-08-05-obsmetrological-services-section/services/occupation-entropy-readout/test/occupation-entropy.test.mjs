import assert from "node:assert/strict";
import { test } from "node:test";

import { userRmnMessage } from "@red-cup-engineering/a2a-rmn-part-service";
import {
  decodeNormalizedCarrier as decodeSemantic,
  normalizedCarrierBytes as semanticBytes,
} from "@red-cup-engineering/relation-model-notation-cbor-codec";
import { attestMathematicalSources, computeOccupationEntropy } from "../src/occupation-entropy.mjs";
import { executeA2aMessage } from "../scripts/execute-a2a-task.mjs";

test("admitted mathematical source bytes still match", () => {
  const attestation = attestMathematicalSources();
  assert.equal(attestation.sources.every((source) => source.matches), true);
  assert.match(attestation.assurance.limitation, /not a formally verified extraction/);
  assert.equal(
    attestation.declarations.includes("Obsmetrologia.Thermodynamics.configH"),
    true,
  );
});

test("two singleton cells: no spread cost, full entropy in the split", () => {
  const result = computeOccupationEntropy({ occupation: [1, 1] });
  assert.equal(result.cells, 2);
  assert.equal(result.totalObjects, 2);
  assert.equal(result.configH, 0);
  assert.equal(result.entropyBits, 1);
});

test("everything in one cell: zero entropy", () => {
  const result = computeOccupationEntropy({ occupation: [2, 0] });
  assert.equal(result.totalObjects, 2);
  assert.equal(result.entropyBits, 0);
});

test("even split across two cells of two: log2(6) bits", () => {
  const result = computeOccupationEntropy({ occupation: [2, 2] });
  assert.equal(result.totalObjects, 4);
  assert.ok(Math.abs(result.entropyBits - Math.log2(6)) < 1e-9);
});

test("a single empty cell: all zeros, no N=0 division blowup", () => {
  const result = computeOccupationEntropy({ occupation: [0] });
  assert.equal(result.cells, 1);
  assert.equal(result.totalObjects, 0);
  assert.equal(result.configH, 0);
  assert.equal(result.entropyBits, 0);
});

test("a non-array occupation is refused", () => {
  assert.throws(() => computeOccupationEntropy({ occupation: "nope" }), /non-empty array/);
});

test("an empty occupation array is refused", () => {
  assert.throws(() => computeOccupationEntropy({ occupation: [] }), /non-empty array/);
});

test("a negative occupation count is refused", () => {
  assert.throws(() => computeOccupationEntropy({ occupation: [1, -1] }), /non-negative safe integers/);
});

test("a non-integer occupation count is refused", () => {
  assert.throws(() => computeOccupationEntropy({ occupation: [1.5, 2] }), /non-negative safe integers/);
});

function requestMessage(payload) {
  return userRmnMessage(semanticBytes(["mark", JSON.stringify(payload)]), "occupation-entropy-request.rmn.cbor");
}

test("A2A executor: occupationEntropy happy path round-trip", async () => {
  const response = await executeA2aMessage(requestMessage({ occupation: [1, 1] }));
  assert.equal(response.metadata.disposition, "completion");
  const part = response.parts.find((p) => p.mediaType === "application/rmn+cbor");
  assert.ok(part, "response carries one RMN part");
  const term = decodeSemantic(Buffer.from(part.raw, "base64"));
  assert.equal(term[0], "mark");
  const result = JSON.parse(term[1]);
  assert.equal(result.entropyBits, 1);
  assert.equal(result.cost.denomination, "occupation-entropy-readout-cpu-seconds");
  assert.equal(result.certificate.library, "@lenticule-science/obsmetrologia");
});

test("A2A executor: a malformed occupation is refused, not completed", async () => {
  await assert.rejects(
    () => executeA2aMessage(requestMessage({ occupation: [] })),
    /non-empty array/,
  );
});

test("A2A executor: a non-Mark request term is refused", async () => {
  const message = userRmnMessage(semanticBytes(["pair", ["mark", "a"], ["mark", "b"]]), "occupation-entropy-request.rmn.cbor");
  await assert.rejects(() => executeA2aMessage(message), /one RMN Mark term/);
});
