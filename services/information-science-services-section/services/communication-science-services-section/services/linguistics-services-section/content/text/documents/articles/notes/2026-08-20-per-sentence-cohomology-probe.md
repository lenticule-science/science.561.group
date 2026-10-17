---
title: "Per-Sentence Cohomology Probe"
description: "Investigation (Ascent Phase 4, ADR-deferred item 4) of what tagText's per-sentence reading.cohomology field actually computes, how it differs from cohesion.mts's paragraph/dialogue-level discourse-cohesion receipts, and whether either is meaningful learner feedback on produced Mandarin text today — with real probes run against the Mandarin and English fibers and their outputs quoted."
date-created: 2026-08-20
type: notes
name: 2026-08-20-per-sentence-cohomology-probe
keywords:
  - linguistics
  - communicating
  - cohomology
  - mandarin
  - english
  - language-learning
  - investigation
tags:
  - draft
status: draft
authors:
  - Claude Opus
---

# Per-Sentence Cohomology Probe — 2026-08-20

## 0. What this is

The system design (§4) and the arc42 (§9, deferred ADR item 4) both name the same unaudited fact: `mandarin-language-algebra`'s (and every other fiber's) `tagText()` return value carries a per-sentence `reading.cohomology` field that was discovered but not read deeply enough to state precisely what it computes, and Phase 4 names investigating it — explicitly, before any later phase is allowed to build on it — as the task this note discharges. This is that investigation. It changes no code and proposes no build; it reads the pipeline that produces the field, reads the sibling `cohesion.mts` machinery the design already accepted at the paragraph/dialogue grain, and runs real probes comparing what each produces for real Mandarin and English text.

**Bottom line, stated up front so the reasoning below is legible as an argument for it, not a mystery to be revealed at the end:** the per-sentence `cohomology` field is real, deterministic, and precisely specified — but at single-sentence grain it measures something much narrower than "is this sentence coherent," and for Mandarin specifically it is not meaningful as learner feedback today. It is not merely "less useful because no verb tagging" — it is actively misleading on the field most likely to be surfaced to a learner (`glued`/`h0`), because that field only detects one specific kind of syntactic ambiguity, and Mandarin's fiber (by its own `research-obligations.json`'s "predicate-tagging" entry) is structurally incapable of ever proposing the arc types that ambiguity depends on. Probes below show a real, correct Mandarin sentence and pure word-salad reading identically "glued" (`h0=1`, `glued:true`), while `h1` (the obstruction count) tracks essentially the sentence's *un-attachable word count* — a fact almost entirely determined by which grammar rules exist for the fiber, not by whether the learner's sentence is well-formed. The paragraph/dialogue-level receipts in `cohesion.mts` are a genuinely different structure — a discourse graph over claim-subjects and utterers, not a syntactic parse — and are not affected by this finding at all; conflating the two, which the deferred item's own phrasing already declines to do, would be the wrong move.

## 1. What the per-sentence `cohomology` field computes, precisely

### 1.1 The pipeline that produces it

`tagText(text)` (identical shape in `mandarin-language-algebra/src/tag.mjs` and `english-language-algebra/src/tag.mjs`) calls the shared engine's `settle()` to split `text` into sentence spans, then for each sentence calls `read(sentenceSpan.text, bundle)` and reads `reading.cohomology` off the result. `read` → `parse` (`parsing.mts`) runs, per sentence:

1. **`construe`** (`construing.mts`) — tags every word (`tag()`), computes features (`features()`), then calls **`relate`** (`relating.mts`) to propose dependency **arcs**: `det`, `amod`, `advmod`, `nsubj`, `dobj`, `ccomp`, `obl`, `discourse`, `topic`/`focus`/`contrast`/`repair`, `prep`, `pobj`.
2. **`charge`** (`charging.mts`) turns words/arcs into kernel entries, and — this is the load-bearing step — generates a small, fixed set of **questions**, each an "is this decided?" query the descend/settle kernel will answer:
   - **`connectivity`** — one question *per word*: is this word's `is-connected` charge decided (`TRUE`, because the word appears as a head or dependent in at least one proposed arc) or does it stay `⊥`/void?
   - **`pp-attachment`** — one question per preposition/coverb word that has **two or more** competing candidate heads proposed by the `prep()` rule (i.e. genuine structural ambiguity: which of several nominal/verbal heads does this PP attach to).
   - **`agreement`** (`subject-verb-agrees`) — one question per `nsubj` arc, but *only* if the verb's features include `"3sg"`/`"base"` **and** the subject's features include `"sg"`/`"pl"`.
3. **`descend`** settles those charges; `parse()` (`parsing.mts` lines 79–80) buckets the resulting `ParsedAnswer`s: `conflicts` = answers that settled `"ambiguous"` (an **overdetermined** cell — genuinely competing evidence), `voids` = answers that settled `"void"` (an **underdetermined** cell — no evidence reached it at all).
4. **`cohomology()`** (`cohomology.mts`) wraps that directly:
   ```ts
   const overdetermined = result.conflicts.map(a => obstruction("conflict", a));
   const underdetermined = result.voids.map(a => obstruction("void", a));
   const obstructions = [...overdetermined, ...underdetermined];
   const glued = overdetermined.length === 0;
   return { glued, h0: glued ? 1 : 0, h1: obstructions.length, obstructions, overdetermined, underdetermined };
   ```

So, precisely: **`h0`/`glued` is `true` unless the sentence contains at least one *conflict*-kind obstruction** — and conflicts can *only* arise from `pp-attachment` ambiguity or subject-verb `agreement` mismatch, nothing else. **`h1` is simply the total count of conflict-plus-void obstructions** — in every probe below, this is dominated by *voids* (disconnected words), not conflicts.

### 1.2 Two structural facts that make this narrower than it sounds

- **Every verb-anchored arc type (`nsubj`, `dobj`, `ccomp`, `obl`, `discourse`, `topic`, `focus`, `contrast`, `repair`, and `advmod`) requires a word tagged `"verb"` or `"aux"`** (`isVerbLike`/`nearestVerb`/`nearestVerbWithFallback` in `relating.mts`, all gating on `word.tags.includes("verb")`). Only `det`, `amod`, `prep`, `pobj` do not require a verb-tagged word.
- **The `agreement` question requires the verb's `feats` to contain `"3sg"` or `"base"`.** These feats are produced only by a fiber's `verbFormRules` (via `featuring.mts` → `bundle.verbForm`). English's own `verbFormRules` (`bundle.mts` line 75) only ever emit `"past"`/`"nonfin"` (from `-ed`/`-ing`/`-en` suffixes) — **never** `"3sg"` or `"base"`. So the `agreement` conflict path is unreachable through the English fiber as currently authored, and (having checked) no other fiber's `verbFormRules` populate those feats either. In practice, today, across every fiber, **the only way a sentence can ever be marked *not glued* is `pp-attachment` ambiguity.**

## 2. What the paragraph/dialogue-level receipts compute — and why they are a different structure entirely

`cohesion.mts`'s `discourseCohesionOf` (H0/topics, `cohesionTrees`, `derivable`/`irreducible` via Hodge decomposition) does **not** consume `tagText`'s parse output at all. It consumes a **membrane**: an array of `UtteranceCarrier`s, each already bearing a structured `{ claim, token }` pair (`claim.mark.value` = the claim text, `token.mark.value` = the utterer/speaker). `membraneMeme` (`face.mts` lines 177–187) builds each meme's cell as `(subject = claimSubject(claim), predicate, object = utterer)` — the subject is *the claim's own text with a leading negation marker stripped*, not a word extracted from a dependency parse. The discourse graph `discourseCohesionOf` runs its Laplacian/Matrix-Tree/Hodge machinery over is therefore a **who-claimed-what-about-whom graph across multiple utterances**, built from already-structured claim/utterer input — not a syntactic dependency graph derived by parsing free text.

This confirms, precisely, the distinction the system design's §4 ADR already drew when it accepted this machinery "narrowly": `cohesion.mts` reads *discourse* structure (which independent topics a set of utterances splits into, how robustly cross-linked they are), scoped to the structural fields only for Mandarin/Lakota, with the truth-polarity axis (`isDenial`/`claimSubject`'s regex on `not`/`no`/`never`/`¬`/`!`/`-`) explicitly confirmed English-surface-form-only in `face.mts`'s own `isDenial` implementation (line 121). The per-sentence `cohomology` field investigated here is a **different, single-sentence, syntax-level structure** with no dependency on that membrane-construction step at all. The two should not be conflated, and this note does not.

## 3. Real probes — Mandarin vs. English, quoted

Run against the installed `@lenticule-science/communicating@0.0.4` via `mandarin-language-algebra/src/tag.mjs` and `english-language-algebra/src/tag.mjs`'s own `tagText()`, node 24, no modification to any package.

### 3.1 Mandarin — a correct simple sentence

```
tagText("我喜欢你。")
words: [{我,pron,void}, {喜欢,noun,void}, {你,pron,void}]
arcs: []
cohomology: {"glued":true,"h0":1,"h1":3,
  "obstructions":[
    {"kind":"void","label":"connectivity","on":"我"},
    {"kind":"void","label":"connectivity","on":"喜欢"},
    {"kind":"void","label":"connectivity","on":"你"}]}
```
A perfectly correct "I like you" produces **zero arcs** (喜欢 "like" floors to `noun`, per `research-obligations.json`'s "predicate-tagging" entry — no word is ever tagged `verb` for Mandarin, confirmed directly here), all three words void, `h1=3`. `glued` is `true` only because "glued" checks `conflicts`, not `voids` — it is *vacuously* true, not a coherence judgment.

### 3.2 Mandarin — a sentence with a coverb (在)

```
tagText("我把书放在桌子上。")   // "I put the book on the table"
arcs: [det(书,把), prep(放,在), prep(书,在), pobj(在,桌)]
cohomology: {"glued":false,"h0":0,"h1":4,
  "overdetermined":[{"kind":"conflict","label":"pp-attachment","on":"word@4-5"}],
  "underdetermined":[void:我, void:子, void:上]}
```
A correct, natural 把-construction sentence reads `glued:false`. Not because it is ungrammatical — because `prep()` (`relating.mts` lines 305–323) walks backward from 在 pushing a `prep` proposal for *every* preceding noun/verb-tagged word until it hits a verb, and since **no word is ever tagged verb for Mandarin**, it never hits one and keeps accumulating competing heads (放 and 书 both proposed as 在's head here) — a structural inevitability of the missing verb tag, not a genuine parse ambiguity a human reader would perceive.

### 3.3 Mandarin — deliberate word-salad vs. correct sentence, same reading

```
tagText("你好吗")                 // correct: "how are you"
words: [{你好,noun,void},{吗,det,void}]
cohomology.h0/h1/glued: 1 2 true

tagText("喜欢你我")                // word-salad reordering — not a sentence
words: [{喜欢,noun,void},{你,pron,void},{我,pron,void}]
cohomology.h0/h1/glued: 1 3 true
```
**A correct greeting and pure word-salad both read `glued:true`.** `h1` differs only because the salad has one more word — `h1` here is tracking word count among unattachable words, not grammaticality. This is the concrete demonstration that `glued`/`h0` cannot discriminate correct from incorrect Mandarin text today: it is not a coherence signal, it is "did the (verb-blind) parser happen to propose a competing preposition attachment," which for most ordinary Mandarin sentences it structurally cannot.

### 3.4 English — verb morphology gates everything, including for English

```
tagText("The dog barked loudly.")
arcs: [det(dog,The), advmod(barked,loudly), nsubj(barked,dog)]
cohomology: {"glued":true,"h0":1,"h1":0,"obstructions":[]}   // fully clean

tagText("She organized the books quickly.")
arcs: [det, advmod, nsubj(organized,She), dobj(organized,books)]
cohomology: {"glued":true,"h0":1,"h1":0,"obstructions":[]}   // fully clean
```
When the verb carries a suffix the fiber's `suffixRules` recognize (`-ed`/`-ing`/`-ize`/`-ify`/`-ate`/`-en`), tagging succeeds, `nsubj`/`dobj` arcs form, and the sentence reads cleanly glued with zero obstructions — a genuinely different, more informative reading than any Mandarin probe above.

But this is fragile even for English:
```
tagText("The cat sat on the mat.")     // "sat" -> noun (irregular past, no suffix match)
tagText("She walks to the store.")     // "walks" -> noun (bare -s present, not in suffixRules)
tagText("The cats chase the mouse.")   // "chase" -> noun (no suffix at all)
tagText("She gave the book to the boy in the park.")  // "gave" -> noun
```
In all four, the verb (`sat`, `walks`, `chase`, `gave`) is tagged `noun`, not `verb` — English's `suffixRules` (`bundle.mts` line 65–69) match derivational/participial suffixes only, not bare present-tense or irregular past forms, and no irregular-verb lookup feeds the tagger (the `irregularVerbs` table exists in the bundle but is not consulted by `tag()`/`features()` for POS assignment, only for the unused `"3sg"`/`"base"` feature slots noted in §1.2). So `nsubj`/`dobj` fail to form for these too, and each reads at least one void obstruction, with "The cat sat on the mat." additionally reading `glued:false` from the same PP-attachment mechanism as the Mandarin coverb case (`sat`/`cat` both proposed as `on`'s competing head, since `sat` never got tagged `verb` to break the backward walk).

## 4. Is either receipt meaningful as learner feedback on produced Mandarin text today?

**Paragraph/dialogue-level (`cohesion.mts`):** not addressed by this finding either way — it does not read a syntactic parse, so the predicate-tagging gap is irrelevant to it. It is meaningful exactly as already scoped in the system design's accepted ADR: structural fields (topic count, spanning-tree robustness) for any language once a membrane is constructed, truth-polarity only where a real negation detector exists (today, nowhere — `isDenial`'s regex is English words/symbols only, not even genuinely wired to English negation morphology like "isn't"/"doesn't"). Building the membrane-construction adapter itself remains real, separate work the system design already named; this note adds no new finding here.

**Per-sentence (`tagText().sentences[i].cohomology`), for Mandarin, today: no.** Section 3 is not a hypothetical — it is a direct demonstration that:
- `glued`/`h0` reads identically true for a correct sentence and for word-salad (§3.3), because it can only go false via a PP-attachment collision that is itself a byproduct of the missing verb tag, not a judgment about the input.
- `h1` tracks disconnected-word count, which for Mandarin is close to *total word count minus however many words happen to be a determiner/adjective/preposition-object* — i.e., close to a constant fraction of sentence length, near-independent of whether the sentence is well-formed.
- Showing either number to a learner as "your sentence's cohomology/coherence" would overclaim in exactly the way the system design's own overclaiming risk (§6, "cohomology-verified mastery") warns against — except here the overclaim would land on every single sentence, not just a summarized belief state.

For English the field is *closer* to meaningful (§3.4's clean examples) but still not reliable enough to surface uncorrected: it silently misreads any verb outside `-ed`/`-ing`/`-ize`/`-ify`/`-ate`/`-en` (i.e., most irregular past tense and all bare present tense) as a noun, which will read as spurious "disconnection" obstructions on entirely correct English sentences a learner produces in casual present tense.

## 5. Recommendation

**Defer, for Mandarin, pending the predicate-tagging Roadmap item — do not wire the per-sentence field into any learner-facing feedback surface as currently built.** This is not a hedge; §3 is a direct demonstration that the field cannot currently distinguish a correct Mandarin sentence from word-salad, and the one way it *can* flip to "not glued" (PP-attachment) is a structural artifact of the missing verb tag, not a real ambiguity. Surfacing it to Morgan today would be indistinguishable, from the learner's seat, from a coin flip dressed as formal feedback — precisely the risk the system design's §6 "overclaiming the belief-fusion layer" risk warns against, extended here to a sibling receipt the design correctly declined to build on without this investigation.

**For English, do not wire it in either, but for a narrower reason: the receipt is directionally real (§3.4's clean cases) but not dependable against ordinary present-tense and irregular-verb English** — the exact register a learner's own production is most likely to use. Wiring it in now would intermittently, unpredictably flag entirely correct sentences as structurally broken depending on which verb the learner happened to choose, which is arguably worse for trust than a field that is uniformly unusable (Mandarin's case) — a partially-working oracle is harder for a learner to build accurate intuition about than a consistently-silent one.

**Concretely, before this field earns any role:** (a) for Mandarin, this is the same trigger the design already named — a real predicate-tagging capability (`research-obligations.json`'s own stated upgrade path: a reviewed, source-cited verb-stem allowlist or real morphosyntactic verb detection); (b) for English specifically, a much smaller, separable fix — extending `verbFormRules`/tagging to recognize bare present tense and consulting the already-present (but currently unused for POS) `irregularVerbs` table — would likely make the per-sentence field usable there well before Mandarin's predicate-tagging gap closes, and could be scoped as its own small, English-only follow-up distinct from the Mandarin Roadmap item; (c) either way, `glued`/`h0` specifically should never be surfaced to a learner as a plain "coherent"/"not coherent" boolean even once (a)/(b) land, without also disclosing what it actually checks (PP-attachment and — currently unreachable everywhere — subject-verb agreement), the same disclosed-mechanism discipline the system design already requires of every mechanically-checked exercise kind (§3.5).

## Obligations

- This note is Research-grade: every claim traces either to a direct source-code read (cited by file and line/section above) or to a probe run this session and quoted verbatim; no claim about the pipeline's behavior on inputs not shown above should be assumed to generalize without re-running the probe.
- Not investigated here: Lakota's and Latin's fibers (Lakota's `research-obligations.json`/maturity ledger claims a curated verb-stem allowlist the system design flags as a possible predicate-tagging advantage over Mandarin's fiber — §3.11 of the system design — which would make this same per-sentence field behave differently there; worth a follow-up probe before any Lakota-specific claim is made).
- Not investigated here: whether `subject-verb-agrees` questions are reachable through *any* fiber in this estate (this note checked only English's `verbFormRules`); stated in §1.2 as "no other fiber's `verbFormRules` populate those feats either" based on a grep sweep for `"3sg"`/`"base"` across the parsing package and English's bundle, not an exhaustive per-fiber read of Latin/Lakota/Toki Pona bundles.
- The recommendation in §5 is this note's own synthesis, not a restatement of anything the system design already concluded (the system design explicitly left this open) — a future session accepting or revising Phase 4/5 scope should treat §5 as a proposal to weigh, not a settled fact the way §1–§3 are.
