import assert from "node:assert/strict";
import * as discrete from "../dist/lib/articulating/predicating/positing/settling/analysis/discrete-set-number-graph.mjs";
test("finite graph keys preserve string tuples and own numeric orders", () => {
  const vertices = ["a\0b", "c", "a", "b\0c", "__proto__"];
  const graph = discrete.directedGraph(vertices, [[vertices[0], vertices[1]], [vertices[2], vertices[3]], [vertices[0], vertices[1]]]);
  assert.equal(graph.edges.length, 2);
  assert.equal(discrete.directedHandshakeReceipt(graph).sumIndegree, 2);
  const order = Object.fromEntries(vertices.map((v, i) => [v, i]));
  assert.equal(discrete.topologicalDagReceipt(graph, order).order.__proto__, 4);
  assert.throws(() => discrete.topologicalDagReceipt(graph, Object.create(order)), TypeError);
  assert.throws(() => discrete.successorAlgebraReceipt({
    kind: "discrete.successorAlgebra.carrier", elements: ["x"], zero: "x", successor: Object.create({x: "x"}),
  }), TypeError);
});

test("finite posets preserve NUL labels and reject inherited map assignments", () => {
  const points = ["a\0b", "c", "a", "b\0c", "__proto__"];
  const poset = alexandrov.finitePoset(points, [[points[0], points[1]], [points[2], points[3]]]);
  assert.equal(poset.leq.length, 7);
  assert.ok(poset.leq.every((pair) => pair.length === 2 && pair.every((p) => points.includes(p))));
  const identity = Object.fromEntries(points.map((p) => [p, p]));
  assert.deepEqual(alexandrov.monotoneMap(poset, poset, identity).map, identity);
  assert.throws(() => alexandrov.monotoneMap(poset, poset, Object.create(identity)), TypeError);
});
import * as alexandrov from "../dist/lib/articulating/predicating/positing/settling/analysis/alexandrov-husainov.mjs";
import { test } from "node:test";
import { canonical } from "@red-cup-engineering/json-codec-service";
import { canonicalJson as jcs } from "@red-cup-engineering/canonical-json-service";

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
