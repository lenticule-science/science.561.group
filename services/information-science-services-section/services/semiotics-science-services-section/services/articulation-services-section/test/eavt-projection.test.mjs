import assert from "node:assert/strict";
import test from "node:test";
import { eavtToCell, cellToEavt } from "../dist/lib/articulating/predicating/eavt.mjs";
import { negate, joinKnowledge } from "../dist/lib/articulating/predicating/positing/bilattice-charge.mjs";
import { cellSet, cellCoincides } from "../dist/lib/articulating/predicating/predication.mjs";
import { isMeme } from "../dist/lib/articulating/predicating/positing/fiber.mjs";

test("positive EAVT projection preserves fractional values, time and origin", () => {
  const row = { e: "s", a: "p", v: 1.5, t: { observedAt: "2026-09-05T00:00:00Z", origin: "resource:one" } };
  const projected = eavtToCell(row);
  assert(isMeme(projected));
  const transported = JSON.parse(JSON.stringify(projected));
  assert(isMeme(transported));
  assert(cellCoincides(projected.cell, transported.cell));
  const cells = cellSet([projected.cell, transported.cell]);
  assert.equal(cells.cells.length, 1);
  assert.equal(cells.entities.entities.length, 2);
  assert.deepEqual(cellToEavt(transported), [row]);
});

test("positive row projection refuses negative and contradictory evidence", () => {
  const { cell, charge } = eavtToCell({ e: "s", a: "p", v: "o", t: "w" });
  const negative = negate(charge);
  assert.throws(() => cellToEavt({ cell, charge: negative }), /independentEvidenceRow/);
  assert.throws(() => cellToEavt({ cell, charge: joinKnowledge(charge, negative) }), /independentEvidenceRow/);
});

test("scientific projection refuses legacy tuple rows and invalid JSON", () => {
  assert.throws(() => eavtToCell(["s", "p", "o", "w"]));
  for (const v of [NaN, Infinity, new Date(), [,], "\uD800"]) assert.throws(() => eavtToCell({ e: "s", a: "p", v, t: "w" }));
});
