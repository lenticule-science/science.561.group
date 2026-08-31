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
