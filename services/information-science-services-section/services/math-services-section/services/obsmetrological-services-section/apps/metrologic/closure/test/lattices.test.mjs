// lattices — tests for the (lattice, phi) witnesses lattices.mjs builds so the closure morphism can be
// watched at each regime: `reachability` (finite, κ < ω) and `fromBilattice` (the floor's `settle` as
// the finite-regime restriction of the general closure). `omegaPlusOne` (κ = ω+1, transfinite) and
// `tower` (aperiodic, no countable κ) are exercised directly in closure.test.mjs, where their whole
// point — what `closureOrdinal` reports about them — is checked.
import { test } from "node:test";
import assert from "node:assert/strict";
import { reachability, fromBilattice } from "../src/lattices.mjs";
import { closureOrdinal } from "../src/closure.mjs";
import { show } from "../src/ordinal.mjs";
import {
  articulate, predicate, posit, settle,
} from "@lenticule-science/metrologic/bilattice";

test("reachability: Φ(S) adds exactly the heads of edges leaving S, seeded at `seed`", () => {
  const { lattice, phi } = reachability(5, [[0, 1], [1, 2], [3, 4]], [0]);
  assert.deepEqual(lattice.bottom, [0]);
  assert.deepEqual(phi([0]), [0, 1]);
  assert.deepEqual(phi([0, 1]), [0, 1, 2]);
  assert.deepEqual(phi([0, 1, 2]), [0, 1, 2]); // 2 has no outgoing edge — no further growth
});

test("reachability: unreachable vertices (3, 4) never enter the closure from seed [0]", () => {
  const { lattice, phi } = reachability(5, [[0, 1], [1, 2], [3, 4]], [0]);
  let s = lattice.bottom;
  for (let i = 0; i < 10; i++) s = phi(s);
  assert.ok(!s.includes(3) && !s.includes(4));
});

test("reachability: leq is the subset order, join is set union (sorted)", () => {
  const { lattice } = reachability(4, [], [0]);
  assert.equal(lattice.leq([0], [0, 1]), true);
  assert.equal(lattice.leq([0, 2], [0, 1]), false);
  assert.deepEqual(lattice.join([0], [1]), [0, 1]);
});

test("reachability: eq is plain JSON-stringify equality — NOT order-independent on raw input", () => {
  // eq is `(a,b) => S(a)===S(b)` (no sort). Every value eq is ACTUALLY called on inside this module comes
  // from `bottom` or `phi`, both of which run their result through `uniqSort` — so in the closure's own
  // use, eq behaves as a set equality. But eq itself, called directly on unsorted arrays, is order-
  // sensitive: [1,0] and [0,1] are the same set but compare unequal here.
  const { lattice } = reachability(4, [], [0]);
  assert.equal(lattice.eq([0, 1], [0, 1]), true);
  assert.equal(lattice.eq([1, 0], [0, 1]), false, "eq is not order-independent on raw arrays");
  assert.equal(lattice.eq(lattice.join([1], [0]), lattice.join([0], [1])), true, "but phi/join outputs are uniqSort'd, so real use is safe");
});

test("reachability: lattice.sup stabilizes at the finite closure's fixed point", () => {
  const { lattice, phi } = reachability(5, [[0, 1], [1, 2], [2, 3]], [0]);
  const chain = [lattice.bottom];
  for (let i = 0; i < 8; i++) chain.push(phi(chain[chain.length - 1]));
  const sup = lattice.sup((n) => chain[Math.min(n, chain.length - 1)]);
  assert.deepEqual(sup, [0, 1, 2, 3]);
});

test("reachability: closureOrdinal recovers a finite κ equal to the graph's own reachable-in-n-steps bound", () => {
  const { lattice, phi } = reachability(4, [[0, 1], [1, 2], [2, 3]], [0]);
  const { kappa, regime, value } = closureOrdinal(lattice, phi);
  assert.equal(regime, "finite");
  assert.equal(show(kappa), "3");
  assert.deepEqual(value, [0, 1, 2, 3]);
});

// ── fromBilattice: the floor's settle IS this morphism at finite κ ─────────────────────────────────

test("fromBilattice: settledValuation equals settle(category).sheaf.section directly", () => {
  const cat = posit(predicate(articulate(["tok", "claim"])));
  const { settledValuation } = fromBilattice(cat);
  assert.deepEqual(settledValuation, settle(cat).sheaf.section);
});

test("fromBilattice: closureOrdinal reports a finite κ, and F(κ) equals settle's own fixed point", () => {
  const cat = posit(predicate(articulate(["tok", "claim"])));
  const { lattice, phi, settledValuation } = fromBilattice(cat);
  const { kappa, regime, value } = closureOrdinal(lattice, phi);
  assert.equal(regime, "finite");
  assert.ok(kappa !== null);
  assert.deepEqual(value, settledValuation);
});

test("fromBilattice: phi is one knowledge-closure round (◇_k∘□_k) — idempotent once fixed", () => {
  const cat = posit(predicate(articulate(["tok", "claim"])));
  const { lattice, phi } = fromBilattice(cat);
  const { value } = closureOrdinal(lattice, phi);
  assert.deepEqual(phi(value), value);
});
