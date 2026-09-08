import assert from "node:assert/strict";
import test from "node:test";
import { compileJsonSchema } from "@red-cup-engineering/validate-json-schema-service";
import { articulationCellSchema, utteranceSchema, MarkSchema, TokenSchema, ClaimSchema } from "../dist/lib/articulating/utterance.mjs";
import { CellSchema, PredicateSchema } from "../dist/lib/articulating/predicating/predication.mjs";
import { ChargeCarrierSchema } from "../dist/lib/articulating/predicating/positing/bilattice-charge.mjs";
import { memeSchema } from "../dist/lib/articulating/predicating/positing/fiber.mjs";

const dialect = "https://json-schema.org/draft/2020-12/schema";
const mark = { kind: "utterance.mark", value: "witness" };
const token = { kind: "utterance.token", hand: "left", mark };
const claim = { kind: "utterance.claim", hand: "right", mark };
const utterance = { kind: "utterance.carrier", token, claim };
const side = { kind: "bilattice-charge.side", name: "present" };
const outer = articulationCellSchema.properties.potentialAperiodicArticulationCell;
const inner = outer.prefixItems[1];
const charge = memeSchema.properties.charge.properties;

test("composed carriers use their owners' exact semantic schemas", () => {
  assert.strictEqual(memeSchema.properties.cell, CellSchema);
  assert.strictEqual(memeSchema.properties.charge, ChargeCarrierSchema);
  assert.strictEqual(CellSchema.properties.subject, TokenSchema);
  assert.strictEqual(CellSchema.properties.object, TokenSchema);
  assert.strictEqual(CellSchema.properties.predicate, PredicateSchema);
  assert.strictEqual(PredicateSchema.properties.claim, ClaimSchema);
  assert.strictEqual(TokenSchema.properties.mark, MarkSchema);
  assert.strictEqual(ClaimSchema.properties.mark, MarkSchema);
  assert.strictEqual(charge.evidence.prefixItems[0].items, MarkSchema);
});
const cases = [
  ["articulation pair", outer, [utterance, [[token], []]], [[token], utterance]],
  ["token and empty pair", inner, [[token], []], [[], [token]]],
  ["singleton token", inner.prefixItems[0], [token], [claim]],
  ["empty tuple", inner.prefixItems[1], [], [token]],
  ["charge sides", charge.value, [side, side], [side, mark]],
  ["independent evidence lanes", charge.evidence, [[mark], []], [[side], []]],
];

for (const [name, schema, accepted, rejected] of cases) {
  test(`${name} retains fixed tuple membership under Draft 2020-12`, () => {
    const evaluator = compileJsonSchema({ ...schema, $schema: dialect });
    const good = evaluator.validate(accepted);
    assert.equal(good.valid, true, JSON.stringify(good.issues));
    for (const value of [rejected, [...accepted, null], ...(accepted.length ? [accepted.slice(0, -1)] : [])]) {
      const bad = evaluator.validate(value);
      assert.equal(bad.valid, false, JSON.stringify(value));
      assert(bad.issues.every((issue) => issue.kind === "instance"), JSON.stringify(bad.issues));
    }
  });
}

test("exported documents declare Draft 2020-12 and preserve independent charge lanes", () => {
  for (const schema of [utteranceSchema, articulationCellSchema, memeSchema]) assert.equal(schema.$schema, dialect);
  const evaluator = compileJsonSchema(memeSchema);
  const cell = { subject: token, predicate: { kind: "predication.predicate", claim, mark }, object: token };
  for (const positive of [false, true]) for (const negative of [false, true]) {
    const value = { kind: "predication.fiber.meme", cell, charge: {
      kind: "bilattice-charge.carrier",
      value: [positive, negative].map((present) => ({ kind: "bilattice-charge.side", name: present ? "present" : "absent" })),
      evidence: [positive ? [mark] : [], negative ? [mark] : []],
    } };
    const result = evaluator.validate(value);
    assert.equal(result.valid, true, JSON.stringify(result.issues));
  }
});
