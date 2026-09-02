// independent-evidence — the predication-charge machinery's own test suite.
//
// Ports the behaviors exercised by @red-cup-engineering/computer's
// posix-holography/tests/substrate.mjs (that file, and its
// fixtures/fregean-four-chu.json, are read-only deprecation inventory as of
// this port; fixtures/fregean-four-chu.json here is a byte-identical copy),
// restricted to the independent-evidence family this package now seats, plus
// the FregeanFourChu independence property named in
// Obsmetrologia.Language.Predicating.FregeanFourChu: converse is not denial.
import { readFileSync } from "node:fs";
import assert from "node:assert/strict";
import { test } from "node:test";
import { FOUR, row as chuRow, settleRow } from "@lenticule-science/metrologic/chu";
import {
  jcs,
  rowId,
  reify,
  isReified,
  REIFIED_PREFIX,
  INDEPENDENT_EVIDENCE_WITNESS_KIND,
  independentEvidenceRow,
  independentEvidenceSide,
  foldIndependentEvidence,
  sectionSpace,
} from "../lib/articulating/predicating/independent-evidence.mts";

const cellOf = (folded, predicate, object) =>
  folded.fiber.find((c) => c.predicate === predicate && jcs(c.object) === jcs(object));

test("jcs is canonical (key order independent)", () => {
  assert.equal(jcs({ b: 1, a: 2 }), jcs({ a: 2, b: 1 }));
});

test("rowId is deterministic content identity", () => {
  const row = { e: "x", a: "color", v: "blue", t: "t0" };
  assert.equal(rowId(row), rowId({ ...row }));
  assert.notEqual(rowId(row), rowId({ ...row, v: "red" }));
});

test("reify/isReified: a reified row is an attribution about a base row", () => {
  const base = { e: "x", a: "color", v: "blue", t: "t0" };
  assert.ok(reify(base).startsWith(REIFIED_PREFIX));
  assert.ok(isReified(reify(base)));
  assert.ok(!isReified("x"));
});

test("independentEvidenceRow validates its shape and tags the witness kind", () => {
  const row = independentEvidenceRow({ subject: "s", predicate: "p", object: "o", side: "positive", by: "alice", witness: "w" });
  assert.equal(row.e, "s");
  assert.equal(row.a, "p");
  assert.equal(row.v, "o");
  assert.equal(row.t.kind, INDEPENDENT_EVIDENCE_WITNESS_KIND);
  assert.equal(row.t.version, 1);
  assert.equal(independentEvidenceSide(row), "positive");
  assert.throws(() => independentEvidenceRow({ subject: "", predicate: "p", object: "o", side: "positive", by: "a", witness: "w" }), TypeError);
  assert.throws(() => independentEvidenceRow({ subject: "s", predicate: "p", object: "o", side: "sideways", by: "a", witness: "w" }), TypeError);
});

test("independentEvidenceSide reads null off a row with no independent-evidence witness", () => {
  assert.equal(independentEvidenceSide({ e: "s", a: "p", v: "o", t: "t0" }), null);
});

test("Fregean claim x independent evidence => FOUR (the ported fregean-four-chu fixture)", () => {
  const fixture = JSON.parse(readFileSync(new URL("./fixtures/fregean-four-chu.json", import.meta.url), "utf8"));
  const rows = fixture.evidence.map(({ claim, ...evidence }) => independentEvidenceRow({ ...fixture.claims[claim], ...evidence }));
  const folded = foldIndependentEvidence(fixture.subject, fixture.claims, rows);

  assert.equal(folded.fiber.length, 4, "retains all four admitted oriented claims");
  assert.deepEqual(cellOf(folded, "has-standing", "neither").value, { pos: 0, neg: 0, evidence: [[], []] });
  assert.equal(cellOf(folded, "has-standing", "for").value.pos, 1);
  assert.equal(cellOf(folded, "has-standing", "for").value.neg, 0);
  assert.equal(cellOf(folded, "has-standing", "against").value.pos, 0);
  assert.equal(cellOf(folded, "has-standing", "against").value.neg, 1);
  assert.equal(cellOf(folded, "has-standing", "both").value.pos, 1);
  assert.equal(cellOf(folded, "has-standing", "both").value.neg, 1);
  assert.ok(rows.every((row) => row.e === fixture.subject && row.a === "has-standing"), "preserves the exact oriented EAV triple");

  assert.throws(
    () => foldIndependentEvidence(fixture.subject, fixture.claims, rows, { converse: { denied: "has-standing" } }),
    /converse is not denial/,
    "the independent path refuses converse-as-denial configuration",
  );

  const space = sectionSpace(folded, rows);
  const pointKey = (object) => jcs(["has-standing", object]);
  assert.equal(settleRow(space.space, pointKey("neither")), FOUR.BOT);
  assert.equal(settleRow(space.space, pointKey("for")), FOUR.T);
  assert.equal(settleRow(space.space, pointKey("against")), FOUR.F);
  assert.equal(settleRow(space.space, pointKey("both")), FOUR.TOP);

  const bothRow = chuRow(space.space, pointKey("both"));
  assert.ok(bothRow.some(({ state, value }) => state === "alice" && value === FOUR.T));
  assert.ok(bothRow.some(({ state, value }) => state === "bob" && value === FOUR.F));

  // cellFor's charge is the folded cell's own {pos,neg,evidence} value -- a consumer (e.g.
  // workspace-content-graph-service) reads which row ids witnessed each face straight off it.
  const bothCell = space.cellFor(pointKey("both"));
  assert.deepEqual(Object.keys(bothCell.charge).sort(), ["evidence", "neg", "pos"]);
  assert.equal(bothCell.charge.pos, 1);
  assert.equal(bothCell.charge.neg, 1);
  assert.equal(bothCell.charge.evidence[0].length, 1);
  assert.equal(bothCell.charge.evidence[1].length, 1);
});

test(
  "FregeanFourChu independence property: a converse-relation row does not charge the original " +
  "predicate's negative coordinate; an independent negative witness does " +
  "(Obsmetrologia.Language.Predicating.FregeanFourChu: converse is not denial)",
  () => {
    const subject = "door:1";
    const claims = [{ subject, predicate: "open", object: "door" }];

    // A row asserting the CONVERSE relation ("shut") on the same subject/object never touches
    // "open"'s charge -- there is no opts.converse path and no in-trace has-converse scan here.
    const converseRow = independentEvidenceRow({ subject, predicate: "shut", object: "door", side: "positive", by: "alice", witness: "w1" });
    const foldedFromConverseOnly = foldIndependentEvidence(subject, claims, [converseRow]);
    const openFromConverse = cellOf(foldedFromConverseOnly, "open", "door");
    assert.equal(openFromConverse.value.pos, 0);
    assert.equal(openFromConverse.value.neg, 0, "a converse-relation row must not charge the negative coordinate");

    // An INDEPENDENT NEGATIVE witness on the SAME predicate does charge the negative face.
    const negativeRow = independentEvidenceRow({ subject, predicate: "open", object: "door", side: "negative", by: "bob", witness: "w2" });
    const foldedFromNegative = foldIndependentEvidence(subject, claims, [negativeRow]);
    const openFromNegative = cellOf(foldedFromNegative, "open", "door");
    assert.equal(openFromNegative.value.neg, 1, "an independent negative witness charges the negative coordinate");
  },
);

import { chargeValueNames, chargeValue, gauge, kleinFourGaugeReceipt } from "../dist/lib/articulating/predicating/positing/bilattice-charge.mjs";

test("gauge witness orbits match the actual nonfixed action", () => {
  const receipt = kleinFourGaugeReceipt();
  for (const element of ["negation", "conflation"]) {
    const orbit = chargeValueNames.filter(name => gauge(element, chargeValue(name)).name !== name);
    assert.deepEqual([...receipt[element + "Orbit"]].sort(), [...orbit].sort());
    for (const name of orbit) assert.ok(orbit.includes(gauge(element, chargeValue(name)).name));
  }
});

import { valuationFiberCarrier, valuationFiberCornerOp, sigmaNucleus, deltaNucleus, valuationTruthMeet, valuationLeqTruth, valuationQuartetDischargeReceipt } from '../dist/lib/articulating/predicating/positing/valuation-fiber-algebra.mjs';

test('corner operators follow Quartet.lean and the maps are commuting truth nuclei', () => {
  const names = ['absurd', 'potential', 'active', 'stable'];
  const valuations = names.flatMap(x => names.map(y => valuationFiberCarrier(['x', 'y'], { x, y })));
  for (const value of valuations) {
    // Obsmetrologia.Language.Positing.Quartet: absurd=id, potential=f, active=g, stable=f∘g.
    assert.deepEqual(valuationFiberCornerOp('absurd', value), value);
    assert.deepEqual(valuationFiberCornerOp('potential', value), sigmaNucleus(value));
    assert.deepEqual(valuationFiberCornerOp('active', value), deltaNucleus(value));
    assert.deepEqual(valuationFiberCornerOp('stable', value), sigmaNucleus(deltaNucleus(value)));
    assert.deepEqual(sigmaNucleus(deltaNucleus(value)), deltaNucleus(sigmaNucleus(value)));
    for (const nucleus of [sigmaNucleus, deltaNucleus]) {
      assert.equal(valuationLeqTruth(value, nucleus(value)), true);
      assert.deepEqual(nucleus(nucleus(value)), nucleus(value));
      for (const other of valuations) assert.deepEqual(nucleus(valuationTruthMeet(value, other)), valuationTruthMeet(nucleus(value), nucleus(other)));
    }
    const receipt = valuationQuartetDischargeReceipt(value);
    assert.equal(receipt.stableIsIntersection, true);
    assert.equal(receipt.theorem, 'Obsmetrologia.FiberDischarge.valuation_discharges_abstract_quartet');
    assert.equal(receipt.theoremFixPi, 'Obsmetrologia.FiberDischarge.valuation_quartet_fix_pi_iff');
    assert.equal(Object.hasOwn(receipt, 'absurdIsIntersection'), false);
  }
});

import { readValuationFiber, valuationTruthJoin, valuationTruthImplication } from '../dist/lib/articulating/predicating/positing/valuation-fiber-algebra.mjs';

test('valuation points survive prototype-sensitive names through JSON and nuclei', () => {
  const points = ['active', 'potential', 'carrier', '__proto__', 'constructor', 'toString'];
  const ordinary = points.map((_, index) => `point-${index}`);
  const valuesOf = carrier => carrier.points.map(point => readValuationFiber(carrier, point));
  for (const name of chargeValueNames) {
    const make = labels => valuationFiberCarrier(labels, Object.fromEntries(labels.map(point => [point, name])));
    const carrier = make(points);
    assert.equal(Object.getPrototypeOf(carrier.values), Object.prototype);
    assert.equal(Object.isFrozen(carrier.values), true);
    assert.deepEqual(Object.keys(carrier.values), points);
    assert.deepEqual(valuationFiberCarrier(points, JSON.parse(JSON.stringify(carrier.values))), carrier);
    for (const operation of [sigmaNucleus, deltaNucleus, value => valuationFiberCornerOp('stable', value)]) {
      assert.deepEqual(valuesOf(operation(carrier)), valuesOf(operation(make(ordinary))));
    }
    for (const operation of [valuationTruthMeet, valuationTruthJoin, valuationTruthImplication]) {
      assert.deepEqual(valuesOf(operation(carrier, carrier)), valuesOf(operation(make(ordinary), make(ordinary))));
    }
  }
  for (const point of points) {
    assert.throws(() => valuationFiberCarrier([point], Object.create({ [point]: 'active' })), {
      name: 'TypeError', message: `valuationFiberCarrier: missing value for ${point}`,
    });
    assert.throws(() => readValuationFiber(valuationFiberCarrier([], {}), point), {
      name: 'TypeError', message: `readValuationFiber: point ${point} is not in the carrier`,
    });
  }
});

import { knowledgeJoinClosure, pointwiseClosureFamilyReceipt, reindexMapCarrier, reindexValuationFiber } from '../dist/lib/articulating/predicating/positing/closure-operator-fiber.mjs';

test('pointwise closure and reindexing preserve own prototype-sensitive point names', () => {
  for (const point of ['__proto__', 'constructor', 'toString']) {
    const seed = valuationFiberCarrier([point], { [point]: 'absurd' });
    const map = reindexMapCarrier([point], ['target'], { [point]: 'target' });
    assert.equal(Object.getPrototypeOf(map.map), Object.prototype);
    assert.deepEqual(Object.keys(map.map), [point]);
    assert.deepEqual(reindexValuationFiber(JSON.parse(JSON.stringify(map)), valuationFiberCarrier(['target'], { target: 'absurd' })), seed);
    const receipt = pointwiseClosureFamilyReceipt(knowledgeJoinClosure('potential'), seed);
    assert.equal(readValuationFiber(receipt.closed, point), 'potential');
    assert.throws(() => reindexMapCarrier([point], ['target'], Object.create({ [point]: 'target' })), { name: 'TypeError', message: `reindexMapCarrier: missing target for ${point}` });
  }
});
