// verb-lexicon.test.mjs — exercises @lenticule-science/communicating@0.0.5's
// verb-lexicon path (irregularVerbs table + regular verbFormRules) and its
// copula-precedence fix, wired against the real English bundle.
import test from "node:test";
import assert from "node:assert/strict";

import { rawBundle } from "../src/bundle.mjs";
import { load, read, roles } from "@lenticule-science/communicating";

const bundle = load(rawBundle);
const parse = (text) => read(text, bundle).parse;

test("regular 3sg present tense (\"walks\") tags verb and forms an nsubj arc", () => {
  const result = parse("She walks to the store.");
  const walks = result.words.find((w) => w.text === "walks");
  assert.ok(walks?.tags.includes("verb"));
  const nsubj = result.arcs.find((a) => a.rel === "nsubj");
  assert.equal(nsubj?.headText, "walks");
  assert.equal(nsubj?.depText, "She");
});

test("irregular past tense (\"sat\", from morphology.irregularVerbs) tags verb and forms an nsubj arc", () => {
  const result = parse("The cat sat on the mat.");
  const sat = result.words.find((w) => w.text === "sat");
  assert.ok(sat?.tags.includes("verb"));
  const nsubj = result.arcs.find((a) => a.rel === "nsubj");
  assert.equal(nsubj?.headText, "sat");
  assert.equal(nsubj?.depText, "cat");
});

test("a copula sentence (\"is\") surfaces cop, not aux, now that the bundle no longer double-lists \"be\" forms", () => {
  const result = parse("The dog is loud.");
  const is = result.words.find((w) => w.text === "is");
  assert.deepEqual(is?.tags, ["cop"]);
});

test("agent/patient roles now resolve for a present-tense sentence via the regular 3sg path", () => {
  const result = parse("She walks to the store.");
  const frame = roles(result).find((r) => r.verb === "walks");
  assert.equal(frame?.agent, "She");
});
