import assert from "node:assert/strict";
import test from "node:test";
import { cell } from "@lenticule-science/articulating/predicating";
import * as closureRule from "@lenticule-science/articulating/predicating/positing/settling/analysis";

const term = (value) => Object.freeze({ mark: Object.freeze({ value }) });
const predicate = (value) => Object.freeze({ kind: "predication.predicate", mark: Object.freeze({ value }) });

test("typed predication closure admits Lean's three-step fixedness premise", () => {
  const point = cell(term("subject"), predicate("predicate"), term("object"));
  const key = closureRule.closureRule.predicationCellKey(point);
  const rule = closureRule.closureRule.alwaysRule(key, "potential");
  const system = closureRule.closureRule.predicationClosureRuleSystem([point], [rule]);
  const seed = closureRule.closureRule.knowledgeLeastValuation(system.cells);
  const receipt = closureRule.closureRule.threeStepClosureReceipt(system, seed);

  assert.equal(system.predicationCells[0], point);
  assert.equal(receipt.fixed, true);
  assert.equal(receipt.theorem, "Obsmetrologia.Closure.RuleSystem.immediate_consequence_lfp");
});

test("eventual runtime closure remains distinct from Lean's three-step clS on a long cascade", () => {
  const cells = ["a", "b", "c", "d"];
  const rule = (name, antecedent, cell) => closureRule.closureRule.closureRule(name, antecedent, { cell, charge: "potential" });
  const system = closureRule.closureRule.closureRuleSystem(cells, [
    rule("seed-a", [], "a"),
    rule("a-to-b", [{ cell: "a", atLeast: "potential" }], "b"),
    rule("b-to-c", [{ cell: "b", atLeast: "potential" }], "c"),
    rule("c-to-d", [{ cell: "c", atLeast: "potential" }], "d"),
  ]);
  const seed = closureRule.closureRule.knowledgeLeastValuation(cells);

  assert.notDeepEqual(closureRule.closureRule.clS(system, seed), closureRule.closureRule.eventualClosure(system, seed));
  assert.throws(() => closureRule.closureRule.threeStepClosureReceipt(system, seed), /not fixed/u);
  assert.equal(closureRule.closureRule.closureRuleReceipt(system, seed).eventualFixedPoint, true);
});
