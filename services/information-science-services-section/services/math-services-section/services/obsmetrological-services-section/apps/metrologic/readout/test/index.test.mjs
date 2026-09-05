// readout — property tests for the FOUR-place classification and its derived orderings, plus the
// style-table lookup that replaces a hand-rolled per-place switch.
import { test } from "node:test";
import assert from "node:assert/strict";
import { randomBytes } from "node:crypto";
import { PLACES, place, knowledgeWeight, salience, readout, styleFor, assertStyleTable } from "../src/index.mjs";

const rbool = () => (randomBytes(1)[0] & 1) === 1;
const randCharge = () => ({ value: [rbool(), rbool()], evidence: [[], []] });
const N = 200;

test("place: classifies every charge into exactly one of the four PLACES", () => {
  for (let i = 0; i < N; i++) {
    const p = place(randCharge());
    assert.ok(PLACES.includes(p));
  }
});

test("place: the value bits round-trip through the classification", () => {
  assert.equal(place({ value: [false, false], evidence: [[], []] }), "absurd");
  assert.equal(place({ value: [true, false], evidence: [[], []] }), "potential");
  assert.equal(place({ value: [false, true], evidence: [[], []] }), "active");
  assert.equal(place({ value: [true, true], evidence: [[], []] }), "stable");
});

test("knowledgeWeight: absurd=0, potential/active=1, stable=2, for every charge", () => {
  for (let i = 0; i < N; i++) {
    const c = randCharge();
    const w = knowledgeWeight(c);
    const expected = { absurd: 0, potential: 1, active: 1, stable: 2 }[place(c)];
    assert.equal(w, expected);
  }
});

test("salience: a total order reproducing absurd < active < potential < stable (tsander's BOT<F<T<TOP)", () => {
  const bot = { value: [false, false], evidence: [[], []] }; // absurd
  const f = { value: [false, true], evidence: [[], []] };    // active
  const t = { value: [true, false], evidence: [[], []] };    // potential
  const top = { value: [true, true], evidence: [[], []] };   // stable
  assert.deepEqual([salience(bot), salience(f), salience(t), salience(top)], [0, 2, 3, 5]);
  assert.ok(salience(bot) < salience(f) && salience(f) < salience(t) && salience(t) < salience(top));
});

test("readout: bundles place/knowledgeWeight/salience/top consistently", () => {
  for (let i = 0; i < N; i++) {
    const c = randCharge();
    const r = readout(c);
    assert.equal(r.place, place(c));
    assert.equal(r.knowledgeWeight, knowledgeWeight(c));
    assert.equal(r.salience, salience(c));
    assert.equal(r.top, r.place === "stable");
  }
});

test("styleFor: looks a charge's place up in a validated table", () => {
  const table = { absurd: "fog", potential: "green", active: "red", stable: "seam" };
  assert.equal(styleFor({ value: [false, false], evidence: [[], []] }, table), "fog");
  assert.equal(styleFor({ value: [true, true], evidence: [[], []] }, table), "seam");
});

test("assertStyleTable: throws when a place is missing", () => {
  assert.throws(() => assertStyleTable({ absurd: 1, potential: 2, active: 3 }), TypeError);
});

test("assertStyleTable: throws on a non-object table", () => {
  assert.throws(() => assertStyleTable(null), TypeError);
  assert.throws(() => assertStyleTable("nope"), TypeError);
});
