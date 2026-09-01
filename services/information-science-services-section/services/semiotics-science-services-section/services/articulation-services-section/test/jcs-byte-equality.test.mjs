// jcs-byte-equality — proves predicating/independent-evidence.mts's local `jcs` produces the exact
// same bytes as @red-cup-engineering/json-codec-service's `canonical`, on a range of test vectors.
//
// The local copy exists because json-codec-service's root export transitively imports
// @lenticule-science/articulating (via its jsonl/eavt subpath -- see
// src/json/jsonl/eavt/index.mts), so importing it at RUNTIME from this package would close a
// package-dependency cycle (articulating -> json-codec-service -> articulating). This test imports
// json-codec-service only as a devDependency, never from the shipped source, to verify the two
// canonicalizations never drift apart without paying for the cycle.
import assert from "node:assert/strict";
import { test } from "node:test";
import { canonical } from "@red-cup-engineering/json-codec-service";
import { jcs } from "../lib/articulating/predicating/independent-evidence.mts";

const vectors = [
  null,
  true,
  false,
  0,
  -1.5,
  "",
  "hello \"world\"\n",
  [],
  [1, 2, 3],
  { b: 2, a: 1 },
  { nested: { z: [1, { y: 2, x: [null, false, "s"] }] }, a: 1 },
  { e: "subject:1", a: "has-standing", v: { for: true, against: false }, t: { kind: "predication.independent-evidence", version: 1, side: "positive", by: "alice", witness: "w" } },
];

test("jcs matches json-codec-service's canonical() byte-for-byte on shared test vectors", () => {
  for (const value of vectors) {
    assert.equal(jcs(value), canonical(value), `byte mismatch for ${JSON.stringify(value)}`);
  }
});
