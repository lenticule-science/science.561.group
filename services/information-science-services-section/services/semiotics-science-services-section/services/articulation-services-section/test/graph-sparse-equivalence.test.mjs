import assert from "node:assert/strict";
import { test } from "node:test";
import { graphFirstBettiNumberOfEdgeList, hodgeDecompositionOfWeights, weightsOfEdges } from "../dist/lib/articulating/predicating/positing/settling/analysis/laplacian.mjs";
import { count, natEqual } from "../dist/lib/articulating/predicating/positing/settling/analysis/exact-number.mjs";

test("sparse cycle rank agrees with exact dense Hodge decomposition for every simple graph on four vertices", () => {
  const pairs = [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3], [2, 3]];
  for (let mask = 0; mask < 64; mask += 1) {
    const edges = pairs.filter((_, bit) => mask & (1 << bit));
    for (const sample of [edges, [...edges, [0, 0], ...edges]]) {
      const sparse = graphFirstBettiNumberOfEdgeList(4, sample);
      const dense = hodgeDecompositionOfWeights(weightsOfEdges(4, sample));
      assert.ok(natEqual(count(Array(sparse)), dense.harmonic), `graph ${mask}`);
    }
  }
});

test("sparse cycle rank handles large paths without recursion and preserves edge input", () => {
  const edges = Object.freeze(Array.from({ length: 99999 }, (_, i) => Object.freeze([i, i + 1])));
  assert.equal(graphFirstBettiNumberOfEdgeList(100000, edges), 0);
  assert.equal(graphFirstBettiNumberOfEdgeList(100000, [...edges, [99999, 0]]), 1);
  assert.equal(graphFirstBettiNumberOfEdgeList(0, []), 0);
  assert.equal(graphFirstBettiNumberOfEdgeList(5, [[1, 2], [2, 1], [3, 3]]), 1);
});

test("sparse graphs refuse fractional sizes and endpoints outside the declared vertex set", () => {
  for (const n of [-1, 1.5, NaN, Infinity]) assert.throws(() => graphFirstBettiNumberOfEdgeList(n, []), RangeError);
  for (const edge of [[-1, 0], [0, 2], [0.5, 1], [NaN, 1], [2, 2]]) assert.throws(() => graphFirstBettiNumberOfEdgeList(2, [edge]), RangeError);
});
