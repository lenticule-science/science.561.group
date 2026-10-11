import test from "node:test";
import assert from "node:assert/strict";

test("signature-only ambient declarations name real provider exports", async () => {
  const [rmn, evaluation, bridge] = await Promise.all([
    import("@red-cup-engineering/relation-model-notation"),
    import("@red-cup-engineering/relation-model-notation-eval"),
    import("@red-cup-engineering/relation-model-notation-json-codec"),
  ]);
  assert.equal(typeof rmn.tm, "object");
  for (const name of ["var", "lam", "app", "field", "append", "coincide", "cond", "fold"]) assert.equal(typeof rmn.tm[name], "function", name);
  assert.equal(typeof evaluation.evaluateRunTerm, "function");
  for (const name of ["arrayTerm", "objectTerm", "stringTerm", "jsonToTerm"]) assert.equal(typeof bridge[name], "function", name);
});
