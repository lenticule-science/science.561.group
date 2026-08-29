import assert from "node:assert/strict";
import test from "node:test";

import { EMPTY_WITNESS_ROOT, identifyJsonSemanticContent } from "@red-cup-engineering/semantic-content-identify-service";
import { jsonId } from "../src/semantic-identity.mjs";

test("Toki Pona die IDs preserve the exact SCIS v2 object-kind/value/witness-root law", () => {
  const value = { text: "mi moku e kili." };
  const objectKind = "lenticule.tokipona-language-algebra.tagging-request";
  const expected = identifyJsonSemanticContent({ objectKind, value, witnessRoot: EMPTY_WITNESS_ROOT });
  assert.equal(jsonId(value, objectKind), expected.token);
  assert.notEqual(jsonId(value, `${objectKind}.other`), expected.token);
  assert.throws(() => jsonId(value, ""), /object kind is required/);
});
