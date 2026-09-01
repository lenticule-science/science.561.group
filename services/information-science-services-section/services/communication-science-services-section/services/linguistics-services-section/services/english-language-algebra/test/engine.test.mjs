// engine.test.mjs — exercises the REAL ported pipeline stages directly
// (articulate → tag/construe → parse → roles/cohomology), reproducing the
// original recovered src/parity.test.mts's own assertions (SVO subject/
// object arcs from "The teacher graded the exam."; tag() on "The"/"teacher"/
// "graded") — the exact behavior that package boundary dropped when a flat
// suffix/lexicon stub with no arcs and no roles would otherwise have been
// written. Also exercises real, reproducible gaps in the recovered English
// bundle data confronted with the shared engine's generic attachment rules
// (see README.md "what's still stubbed").
import test from "node:test";
import assert from "node:assert/strict";

import { rawBundle } from "../src/bundle.mjs";
import { admitCommunication, articulateCommunication, load, read, roles } from "@lenticule-science/communicating";

const bundle = load(rawBundle);
const articulate = (text, selectedBundle) => articulateCommunication(admitCommunication(text), selectedBundle);
const parse = (sentence, _base, selectedBundle) => read(sentence.text, selectedBundle).parse;
const tag = (word, selectedBundle) => read(word, selectedBundle).parse.words[0]?.tags ?? [];

test("bundle declares SVO order with left-headed determiners/adjectives", () => {
  assert.equal(bundle.wordOrder, "SVO");
  assert.equal(bundle.attachment.determiner, "left");
  assert.equal(bundle.attachment.adjective, "left");
  assert.equal(bundle.attachment.subject, "left");
  assert.equal(bundle.attachment.object, "right");
});

test("tag() tags reference English words from the recovered parity.test.mts fixture", () => {
  assert.ok(tag("The", bundle).includes("det"));
  assert.ok(tag("teacher", bundle).includes("noun"));
  assert.ok(tag("graded", bundle).includes("verb"));
});

test("parse() reproduces the recovered parity.test.mts's SVO subject/object arcs", () => {
  const text = "The teacher graded the exam.";
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  const result = parse(sentence, base, bundle);
  const nsubj = result.arcs.find((a) => a.rel === "nsubj");
  const dobj = result.arcs.find((a) => a.rel === "dobj");
  assert.equal(nsubj?.headText, "graded");
  assert.equal(nsubj?.depText, "teacher");
  assert.equal(dobj?.headText, "graded");
  assert.equal(dobj?.depText, "exam");
});

test("articulate() is offset-true: every span's text matches the source slice", () => {
  const text = "The teacher graded the exam. Mary read the book.";
  const base = articulate(text, bundle);
  for (const s of base.spans) {
    if (s.start === null || s.end === null) continue;
    assert.equal(text.slice(s.start, s.end), s.text, `span mismatch at tier ${s.tier}: "${s.text}"`);
  }
  assert.equal(base.spans.filter((s) => s.tier === "sentence").length, 2);
});

test("amod fires for suffix-derived English adjectives, unlike Latin/Lakota/Toki Pona", () => {
  // Latin's and Lakota's READMEs both document that their own recovered
  // suffixRules produce no "adj" tag at all, so amod can never fire for
  // them. English's recovered suffixRules DO include an adjective-suffix
  // rule ("famous" -> -ous), so amod genuinely fires here.
  const text = "The famous teacher graded the exam.";
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  const result = parse(sentence, base, bundle);
  const amod = result.arcs.find((a) => a.rel === "amod");
  assert.equal(amod?.headText, "teacher");
  assert.equal(amod?.depText, "famous");
  const dobj = result.arcs.find((a) => a.rel === "dobj");
  assert.equal(dobj?.depText, "exam");
});

test("cohomology() reads a glued (H0=1, H1=0, no conflicts) parse for a clean past-tense sentence", () => {
  const text = "The teacher graded the exam.";
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  const result = parse(sentence, base, bundle);
  const h = read(text, bundle).cohomology;
  assert.equal(h.glued, true);
  assert.equal(h.h0, 1);
  assert.equal(h.h1, 0);
});

test("roles() extracts agent/patient from a clean past-tense sentence", () => {
  const text = "The teacher graded the exam.";
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  const result = parse(sentence, base, bundle);
  const frame = roles(result).find((r) => r.verb === "graded");
  assert.equal(frame?.agent, "teacher");
  assert.equal(frame?.patient, "exam");
});

test("GAP (real, reproducible): a bare adjective with no recognized derivational suffix floors to \"noun\" and steals the dobj arc ahead of the true object", () => {
  // "difficult" matches none of rawBundle.morphology.suffixRules's adjective
  // patterns (ous|ful|ible|able|ive|ical|ic|ish|less|al|ant|ent|ary|ese|most)
  // — a real, common gap: many ordinary English adjectives ("big", "red",
  // "old", "difficult", "good") carry no derivational suffix at all — so
  // tagging.mjs's open-class floor assigns it ["noun"] instead of ["adj"].
  // dobj() then scans rightward from the verb for the nearest noun-or-
  // pronoun and stops at "difficult" (mistagged noun) before ever reaching
  // the true object "exam". This is real, reproducible behavior of the
  // shared engine's generic dobj() rule confronted with English's own real
  // recovered suffixRules data — not a new defect introduced by this port
  // (contrast with the sentence above, where "famous" DOES carry a
  // recognized adjective suffix and dobj resolves correctly).
  const text = "The teacher graded the difficult exam.";
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  const result = parse(sentence, base, bundle);
  assert.deepEqual(tag("difficult", bundle), ["noun"]);
  const dobj = result.arcs.find((a) => a.rel === "dobj");
  assert.equal(dobj?.depText, "difficult"); // wrong: should be "exam"
  const examWord = result.words.find((w) => w.text === "exam");
  assert.equal(examWord.connected, "void"); // the true object is left unattached
  const frame = roles(result).find((r) => r.verb === "graded");
  assert.equal(frame?.patient, "difficult"); // roles() inherits the same wrong resolution
});

test("GAP (real, reproducible): no rule in the recovered suffixRules ever tags a bare/plain present-tense verb, so nsubj/dobj/roles() never fire for present-tense sentences", () => {
  // rawBundle.morphology.suffixRules covers -ly (adv), -ize/-ise/-ify/-ate
  // (verb, but only when the word ITSELF ends that way — a 3sg "-s" suffix
  // added on top, e.g. "translates", breaks the match), -ing (verb), -ed
  // (verb), -en (verb/noun), and a battery of adjective/noun-suffix
  // patterns. None of them covers a bare present-tense verb stem or its
  // regular 3sg "-s" form ("read"/"reads", "eat"/"eats", "chase"/"chases",
  // "run"/"runs") — so tagging.mjs's open-class floor assigns every one of
  // them ["noun"]. The shared engine's nsubj()/dobj() rules require a word
  // tagged "verb" or "aux" to anchor an arc on; without one, neither rule
  // ever fires. This is a real gap in the recovered English *data* (Latin's
  // own recovered suffixRules DO cover present tense: ".{2,}t$" 3sg,
  // ".{2,}nt$" 3pl), not in the ported *engine*.
  for (const verb of ["reads", "read", "chases", "chase", "eats", "eat", "runs", "run"]) {
    assert.deepEqual(tag(verb, bundle), ["noun"], `expected "${verb}" to float to noun, got ${JSON.stringify(tag(verb, bundle))}`);
  }
  const text = "Mary reads a book.";
  const base = articulate(text, bundle);
  const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
  const result = parse(sentence, base, bundle);
  assert.equal(result.arcs.find((a) => a.rel === "nsubj"), undefined);
  assert.equal(result.arcs.find((a) => a.rel === "dobj"), undefined);
  assert.deepEqual(roles(result), []);
  const mary = result.words.find((w) => w.text === "Mary");
  assert.equal(mary.connected, "void");
});

test("the pipeline is a deterministic function of (text, bundle): identical input, identical output", () => {
  const text = "The teacher graded the exam.";
  const runOnce = () => {
    const base = articulate(text, bundle);
    const sentence = base.spans.find((s) => s.tier === "sentence") ?? base.document;
    return parse(sentence, base, bundle);
  };
  assert.deepEqual(runOnce(), runOnce());
});
