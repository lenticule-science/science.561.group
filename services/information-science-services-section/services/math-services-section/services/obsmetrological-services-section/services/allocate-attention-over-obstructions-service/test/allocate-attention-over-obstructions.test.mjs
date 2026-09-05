import assert from "node:assert/strict";
import test from "node:test";
import { allocateAttentionOverObstructions } from "../scripts/allocate-attention-over-obstructions.mjs";
const obstructions = [{ id: "a", cost: 2, benefit: 4 }, { id: "b", cost: 3, benefit: 3 }, { id: "c", cost: 1, benefit: 1 }, { id: "d", cost: 5, benefit: 9 }];
test("selects by benefit density within the budget and reports the residual", () => {
  const out = allocateAttentionOverObstructions({ obstructions, budget: 4 });
  assert.deepEqual(out.readNext, ["a", "c"]);
  assert.equal(out.cost, 3);
  assert.equal(out.benefit, 5);
  assert.equal(out.residual, 12);
});
test("a zero budget yields the empty selection with residual equal to the universe benefit", () => {
  const out = allocateAttentionOverObstructions({ obstructions, budget: 0 });
  assert.deepEqual(out.readNext, []);
  assert.equal(out.residual, 17);
});
test("every prefix of the selection is feasible", () => {
  const out = allocateAttentionOverObstructions({ obstructions, budget: 8 });
  let running = 0;
  for (const o of out.selected) { running += o.cost; assert.ok(running <= 8); }
});
test("refuses a malformed obstruction", () => assert.throws(() => allocateAttentionOverObstructions({ obstructions: [{ id: "x", cost: -1, benefit: 1 }], budget: 1 }), /string id and non-negative integer cost and benefit/u));
