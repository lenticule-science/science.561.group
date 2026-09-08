import assert from "node:assert/strict";
import test from "node:test";
import { mark, coincides, isMark } from "../dist/lib/articulating/utterance.mjs";
import { twistProduct } from "../dist/lib/articulating/predicating/positing/twist-product.mjs";
import { chargeBilatticeLawReceipt, chargeValues } from "../dist/lib/articulating/predicating/positing/bilattice-charge.mjs";
import { truthOrderResiduation } from "../dist/lib/articulating/predicating/positing/logic/bilattice-linear-logic.mjs";

test("wrapped FOUR specialization retains its bilattice laws and residuation", () => {
  const { kind, ...laws } = chargeBilatticeLawReceipt();
  for (const [name, holds] of Object.entries(laws)) assert.equal(holds, true, name);
  for (const a of chargeValues) for (const b of chargeValues) for (const c of chargeValues) {
    assert.equal(truthOrderResiduation(a, b, c).kind, "bilattice.linearLogic.truthOrderResiduation:witness");
  }
});

// Two different residuated algebras on the same three opaque Mark coordinates.
// In particular, Łukasiewicz multiplication is not lattice meet.
for (const multiplication of ["Godel", "Lukasiewicz"]) {
  test(`Mark-valued ${multiplication} twist satisfies the lattice and linear contracts`, () => {
    const coordinates = ["low", "middle", "high"].map(mark);
    const rank = (coordinate) => {
      const index = coordinates.findIndex((candidate) => coincides(candidate, coordinate));
      assert.notEqual(index, -1, "coordinate belongs to the supplied carrier");
      return index;
    };
    const algebra = twistProduct({
      bottom: coordinates[0], top: coordinates[2], one: coordinates[2],
      leq: (a, b) => rank(a) <= rank(b),
      meet: (a, b) => coordinates[Math.min(rank(a), rank(b))],
      join: (a, b) => coordinates[Math.max(rank(a), rank(b))],
      fuse: (a, b) => coordinates[multiplication === "Godel"
        ? Math.min(rank(a), rank(b)) : Math.max(0, rank(a) + rank(b) - 2)],
      imply: (a, b) => coordinates[multiplication === "Godel"
        ? (rank(a) <= rank(b) ? 2 : rank(b)) : Math.min(2, 2 - rank(a) + rank(b))],
    });
    const points = coordinates.flatMap((a) => coordinates.map((b) => algebra.value(a, b)));
    const apply = (operation, a, b) => operation({ left: a, right: b });
    assert.equal(new Set(points.map(JSON.stringify)).size, 9);
    assert(points.every((point) => Object.isFrozen(point) && point.every(isMark)));
    for (const a of points) {
      assert.deepEqual(algebra.negate(algebra.negate(a)), a);
      assert.deepEqual(apply(algebra.fuse, a, algebra.one), a);
      assert.deepEqual(apply(algebra.imply, a, algebra.one), algebra.negate(a));
      for (const b of points) {
        // Orders are independently calculated from the coordinate carrier.
        assert.equal(apply(algebra.leqKnowledge, a, b), rank(a[0]) <= rank(b[0]) && rank(a[1]) <= rank(b[1]));
        assert.equal(apply(algebra.leqTruth, a, b), rank(a[0]) <= rank(b[0]) && rank(b[1]) <= rank(a[1]));
        assert.deepEqual(apply(algebra.fuse, a, b), apply(algebra.fuse, b, a));
        assert.deepEqual(apply(algebra.fuse, JSON.parse(JSON.stringify(a)), JSON.parse(JSON.stringify(b))), apply(algebra.fuse, a, b));
        for (const c of points) {
          assert.equal(apply(algebra.leqTruth, apply(algebra.fuse, a, b), c),
            apply(algebra.leqTruth, a, apply(algebra.imply, b, c)), "residuation adjunction");
          assert.deepEqual(apply(algebra.fuse, apply(algebra.fuse, a, b), c), apply(algebra.fuse, a, apply(algebra.fuse, b, c)));
          for (const [meet, join, leq] of [
            [algebra.meetKnowledge, algebra.joinKnowledge, algebra.leqKnowledge],
            [algebra.meetTruth, algebra.joinTruth, algebra.leqTruth],
          ]) {
            assert.equal(apply(leq, c, apply(meet, a, b)), apply(leq, c, a) && apply(leq, c, b), "greatest lower bound");
            assert.equal(apply(leq, apply(join, a, b), c), apply(leq, a, c) && apply(leq, b, c), "least upper bound");
          }
        }
      }
    }
    const middle = algebra.value(coordinates[1], coordinates[1]);
    assert.strictEqual(middle[0], coordinates[1], "construction retains the Mark itself");
    assert.strictEqual(apply(algebra.fuse, middle, middle)[0], coordinates[multiplication === "Godel" ? 1 : 0]);
  });
}
