import { describe, it } from "node:test";
import assert from "node:assert/strict";
import { articulate, fourCornerOfArticulationCell, mark, predicating, utterance } from "@lenticule-science/articulating";
import {
  freeSettlementFiltration,
  induceRelation,
  knowledgeValuationClosureOrder,
  presentSettlementFiltration,
  settlementClosureProfile,
  settleWith,
} from "@lenticule-science/articulating/predicating/positing/settling";

describe("material descent law", () => {
  it("articulate emits the exact token-present, claim-empty potential cell", () => {
    const admitted = utterance(mark("token"), mark("claim"));
    const articulation = articulate(admitted);
    const [, [tokens, claims]] = articulation.potentialAperiodicArticulationCell;
    assert.equal(tokens[0], admitted.token);
    assert.equal(claims.length, 0);
    assert.equal(fourCornerOfArticulationCell(articulation).corner, "potential");
  });

  it("posit consumes admitted valuation and does not fabricate cell witnesses", () => {
    const site = predicating.predicate(articulate(utterance(mark("token"), mark("claim"))));
    const least = predicating.positing.knowledgeLeastValuation(site);
    const posited = predicating.positing.posit(site, least);
    assert.equal(posited.fiber.valuation.fibers.flatMap((fiber) => fiber.assignments).length, 0);
  });

  it("induceRelation is settle after posit after predicate after articulate", () => {
    const admitted = utterance(mark("token"), mark("claim"));
    const evidence = predicating.positing.witnessedPotential(admitted.token.mark);
    const articulation = articulate(admitted);
    const site = predicating.predicate(articulation);
    const valuation = predicating.positing.valuationOfCharge(site, evidence);
    const posited = predicating.positing.posit(site, valuation);
    const expanded = settleWith(posited, knowledgeValuationClosureOrder);
    assert.deepEqual(induceRelation(admitted, evidence, knowledgeValuationClosureOrder), expanded);

    const profile = settlementClosureProfile("knowledge");
    const generators = presentSettlementFiltration(posited, profile);
    assert.equal(generators.assignments[0].charge, evidence);
    assert.deepEqual(generators.closureProfile, profile);
    assert.notEqual(generators.kind, expanded.kind);
    assert.deepEqual(freeSettlementFiltration(generators), expanded);

    const settledCells = expanded.stages.flatMap((stage) => stage.designated.cells);
    assert.ok(settledCells.length > 0);
    assert.ok(settledCells.every((cell) => predicating.cellCoincides(cell, site.cells.cells[0])));
  });
});
