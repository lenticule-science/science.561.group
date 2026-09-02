// engine.test.mjs — exercises the REAL shared pipeline stages directly
// (articulate → tag/construe → parse → roles/cohomology) against the shared
// @lenticule-science/communicating engine, mirroring lakota-language-algebra's
// own engine.test.mjs in structure. Every assertion below was checked against
// the actual engine output, not assumed from the fiber contract — including
// the "honest gap" tests, which record real, verified behavior of the shared
// engine confronted with an isolating language that curates no verb
// allowlist (see the comments on each).
import test from "node:test";
import assert from "node:assert/strict";

import { rawBundle } from "../src/bundle.mjs";
import { admitCommunication, articulateCommunication, load, read, roles } from "@lenticule-science/communicating";

const bundle = load(rawBundle);
const articulate = (text, selectedBundle) => articulateCommunication(admitCommunication(text), selectedBundle);
const tokenize = (text) => articulate(text, bundle).spans.filter((s) => s.tier === "word").map((s) => s.text);

test("bundle declares SVO order and left/left/left/right attachment", () => {
  assert.equal(bundle.wordOrder, "SVO");
  assert.equal(bundle.attachment.determiner, "left");
  assert.equal(bundle.attachment.adjective, "left");
  assert.equal(bundle.attachment.subject, "left");
  assert.equal(bundle.attachment.object, "right");
  assert.equal(bundle.roleBy, undefined); // Mandarin carries no case-role flag
});

test("grammar profile declares script word-boundary and a segment hook is supplied", () => {
  assert.equal(bundle.grammar.morphology.type, "isolating");
  assert.equal(bundle.grammar.segmentation.wordBoundary, "script");
  assert.equal(typeof bundle.segment, "function");
});

test("tag() tags curated closed classes", () => {
  assert.deepEqual(read("这", bundle).parse.words[0]?.tags, ["det"]);
  assert.deepEqual(read("在", bundle).parse.words[0]?.tags, ["prep"]);
  assert.deepEqual(read("我", bundle).parse.words[0]?.tags, ["pron"]);
  assert.deepEqual(read("会", bundle).parse.words[0]?.tags, ["aux"]);
  assert.deepEqual(read("和", bundle).parse.words[0]?.tags, ["conj"]);
});

test("classifiers are tagged via curated rootPatternRules, with measure-word features", () => {
  for (const [char, nounClass] of [
    ["个", "noun-class:general-default"],
    ["条", "noun-class:long-flexible-objects"],
    ["本", "noun-class:bound-volumes"],
    ["张", "noun-class:flat-objects"],
    ["只", "noun-class:small-animals"],
    ["位", "noun-class:people-honorific"],
    ["家", "noun-class:organizations"],
    ["次", "noun-class:verbal-events"],
  ]) {
    const word = read(char, bundle).parse.words[0];
    assert.deepEqual(word?.tags, ["classifier"], `${char} should tag as classifier`);
    assert.ok(word.feats.includes("measure-word"), `${char} should carry the measure-word feature`);
    assert.ok(word.feats.includes(nounClass), `${char} should carry ${nounClass}`);
  }
});

test("an uncurated open-class word floors to noun — not faked", () => {
  // 猫 (cat) is real vocabulary but is not in this bundle's closed classes,
  // classifier rules, or core-vocabulary wordlist — it floors to the
  // pipeline's default tag, same as any unrecognized word in any bundle.
  assert.deepEqual(read("猫", bundle).parse.words[0]?.tags, ["noun"]);
});

test("reference.pronouns carries person/number/gender features", () => {
  assert.deepEqual(bundle.pronounFeatures("我"), { person: 1, number: "sg" });
  assert.deepEqual(bundle.pronounFeatures("他"), { person: 3, number: "sg", gender: "m" });
  assert.deepEqual(bundle.pronounFeatures("她"), { person: 3, number: "sg", gender: "f" });
  assert.deepEqual(bundle.pronounFeatures("它"), { person: 3, number: "sg", gender: "n" });
  assert.deepEqual(bundle.pronounFeatures("我们"), { person: 1, number: "pl" });
});

test("articulate() is offset-true over real Mandarin sentences", () => {
  const text = "他在中国。我喜欢学习。";
  const base = articulate(text, bundle);
  for (const s of base.spans) {
    if (s.start === null || s.end === null) continue;
    assert.equal(text.slice(s.start, s.end), s.text, `span mismatch at tier ${s.tier}: "${s.text}"`);
  }
  assert.equal(base.spans.filter((s) => s.tier === "sentence").length, 2);
});

// ── The segment hook: dictionary-based greedy longest-match ─────────────
test("segment() engages instead of per-character fallback: multi-character words come back as single tokens", () => {
  assert.deepEqual(tokenize("我喜欢学习"), ["我", "喜欢", "学习"]);
  assert.deepEqual(tokenize("你好吗"), ["你好", "吗"]);
});

test("segment() prefers the longest dictionary match at each position", () => {
  // 你好 (2 chars, in the core vocabulary) must win over splitting into
  // the single characters 你 (a pronoun) + 好 (an adjective).
  assert.deepEqual(rawBundle.segment("你好"), ["你好"]);
});

test("segment() falls through unknown multi-character words to single characters", () => {
  // 钥匙 ("key") is real Mandarin vocabulary but is not in this bundle's
  // curated dictionary at all — neither as a 2-character word nor via
  // either of its individual characters. This is the honestly-graded
  // failure mode of a small dictionary segmenter: mis-segmentation into
  // single-character tokens, not a crash or a dropped token.
  assert.deepEqual(rawBundle.segment("钥匙"), ["钥", "匙"]);
});

test("segment() drops punctuation and whitespace rather than emitting them as tokens", () => {
  // Matches the engine's own per-character script fallback (tokenizeByScript
  // in communicating), which restricts itself to \p{L}\p{M}\p{N} and never
  // emits a punctuation or whitespace character as a word span.
  assert.deepEqual(rawBundle.segment("你好。 吗？"), ["你好", "吗"]);
  assert.deepEqual(rawBundle.segment(""), []);
});

test("articulate() threads the segment hook through the full span pipeline, terminators excluded", () => {
  const text = "我喜欢学习。";
  const words = tokenize(text);
  assert.deepEqual(words, ["我", "喜欢", "学习"]);
});

// ── Honest gaps, verified against the real engine (not assumed) ─────────

// relating.mts's nsubj()/dobj()/ccomp()/obl()/discourse()/topic() rules all
// gate on isVerbLike (a word tagged "verb"). This bundle curates no verb
// allowlist — Mandarin verbs are the true open class, and morphology has no
// suffix or affix that marks a word as a verb, so tagging one honestly
// requires a curated allowlist (as lakota-language-algebra does for Lakota
// verb stems) or real morphosyntactic evidence, neither of which this build
// was scoped to produce. The real, verified consequence: no word in this
// bundle is EVER tagged "verb", so nsubj/dobj/ccomp/obl/discourse/topic arcs
// never fire for ANY Mandarin sentence — including for 把/被, whose
// roleStrategies (grammar.roleStrategies, "obl" by particle) are correctly
// wired to relating.mts's obliqueParticles() but have no verb to attach to.
test("honest gap: no verb allowlist means nsubj/dobj/roles never fire, even for simple SVO sentences", () => {
  const result = read("我喜欢你。", bundle).parse;
  assert.deepEqual(result.words.map((w) => w.tags), [["pron"], ["noun"], ["pron"]]);
  assert.equal(result.arcs.find((a) => a.rel === "nsubj"), undefined);
  assert.equal(result.arcs.find((a) => a.rel === "dobj"), undefined);
  assert.deepEqual(roles(result), []);
});

test("honest gap: 把/被 oblique-particle strategies are wired but do not fire without a tagged verb", () => {
  const result = read("我把书给你。", bundle).parse;
  assert.equal(result.arcs.find((a) => a.rel === "obl"), undefined);
  assert.equal(result.arcs.find((a) => a.rel === "case" && a.depText === "把"), undefined);
});

test("是 is a recognized copula via isCopula() and closedClassTags() surfaces a 'cop' tag", () => {
  assert.equal(bundle.isCopula("是"), true);
  assert.deepEqual(read("是", bundle).parse.words[0]?.tags, ["cop"]);
});

test("是 tags 'cop' in a simple copular sentence", () => {
  const result = read("我是学生。", bundle).parse;
  const shi = result.words.find((w) => w.text === "是");
  assert.deepEqual(shi.tags, ["cop"]);
});

// ── What DOES work without a curated verb: prep/pobj and det attachment ──
test("prep/pobj arcs fire for a coverb + its object (these rules key off noun/prep tags, not verb)", () => {
  const result = read("他在中国。", bundle).parse;
  const pobj = result.arcs.find((a) => a.rel === "pobj");
  assert.equal(pobj?.headText, "在");
  assert.equal(pobj?.depText, "中国");
});

test("det arcs fire for a preposed determiner/particle attaching to the nearest noun", () => {
  const result = read("这本书。", bundle).parse;
  const det = result.arcs.find((a) => a.rel === "det");
  assert.equal(det?.headText, "书");
  assert.equal(det?.depText, "这");
  // 本 sits between 这 and 书 and is tagged "classifier", not "noun" — det()
  // correctly skips past it to find the nearest actual noun.
  const classifier = result.words.find((w) => w.text === "本");
  assert.deepEqual(classifier?.tags, ["classifier"]);
});

test("the pipeline is a deterministic function of (text, bundle): identical input, identical output", () => {
  const text = "他在中国。";
  const runOnce = () => read(text, bundle).parse;
  assert.deepEqual(runOnce(), runOnce());
});
