---
title: "RelConLang Blind Dialogue Protocol v0.1"
date-created: 2026-10-01
kind: experimental-protocol
status: active
in-service-of: lib/emsenn/services/561-group/services/lenticule-science
tags: [relconlang, dialogue, conversation-analysis, conditional-relevance, communicating]
---

# RelConLang Blind Dialogue Protocol v0.1

## Purpose

Test whether dialogue relations can be recovered from RelConLang surface language without exposing the evaluator to hand-authored move, reply, or adjacency labels.

This is a language experiment only. It produces readings, not actions.

## Input

For each scene the evaluator receives only:

- ordered turns;
- speaker identity;
- surface RelConLang text.

Gold labels, expected arcs, adjacency annotations, and response targets are hidden.

## Independent outputs

Each turn is read into `dialogue-turn-reading-v0.2`; the prefix of turns is folded into `dialogue-relevance-state-v0.1`.

The evaluator must keep separate:

1. syntactic well-formedness;
2. propositional content;
3. explicit surface stance versus no stance marking;
4. any stance report separately from target proposition evidence;
5. the fiber over which any FOUR/evidence reading is interpreted;
6. illocutionary/dialogue force;
5. conditional relevance opened by the turn;
6. candidate earlier relevance addressed by the turn;
7. semantic compatibility with the addressed turn;
8. repair mode/effect if a repair is proposed;
9. remaining conditional relevance.

A failure at one level must not be converted into a failure at another.

## Graphs

Maintain distinct graphs:

- `G_semantic`: shared terms/entities/topics;
- `G_temporal`: causal/temporal threading;
- `G_dialogue`: response and adjacency relations inferred from conversational force and content.

Neither semantic connectivity nor temporal precedence is sufficient evidence for a dialogue edge.

## First assay

Use `content/data/relconlang/blind-dialogue-v0.2.json` as the preferred deictically grounded assay. Retain `blind-dialogue-v0.1.json` only as the initial/provisional lineage dataset.

The first contrast holds the question fixed and compares a relevant answer to a grammatical but irrelevant answer. Both second turns are known RelConLang forms.

Success requires the evaluator to preserve syntactic success for both while distinguishing response compatibility.

## Maturity rule

No result from this protocol licenses deployment of RelConLang as an operational, governance, or agent-control language.


## Relevance-state fold

The experiment maintains a separate conditional-relevance carrier.

A first pair-part may open a relevance item. A later turn may address and close it. Closure records the response disposition but does not assert that the speaker was normatively obligated to respond.

Explicit deontic content such as `kod` is evaluated separately. This allows the experiment to distinguish:

- "an answer is conversationally relevant now";
- "the addressee is obligated to answer";
- "the addressee is capable of answering";
- "the addressee refuses to answer."

These are deliberately different propositions.


## Deictic grounding gate

Before proposition compatibility is scored, first- and second-person forms must be grounded against a speech-event context. Raw equality of `mi` or `tu` across turns is not referential identity.

Existing legacy dialogue fixtures that change speaker while repeating `tu` are retained as historical test material but their adjacency labels are provisional until their intended deixis is clarified or corrected.


## Proposition-comparison gate

After deictic grounding, turn compatibility is evaluated over an experimental proposition nucleus rather than raw strings.

The comparison relation is multi-valued:

- same nucleus;
- refinement/update of the same nucleus;
- related but distinct;
- unrelated;
- undetermined.

Dialogue force and FOUR/evidence are not part of nucleus identity. They may update or act on a nucleus without changing what proposition is under discussion.

## v0.2 deictic corpus

The preferred corpus names discourse participants independently of the RelConLang pronoun forms. Each turn carries `speaker` and `addressees`; `mi` resolves to the current speaker and `tu` to the current addressee.

The corpus includes a corrected capability question/answer, an irrelevant-answer control, request→uptake with aspectual refinement, a counter-question, and candidate `nul+ccomp` / `nes+ccomp` scenes. Candidate scenes are explicitly maturity-tagged so they cannot silently become grammar facts.

## Transition-law scoring

The preferred v0.2 assay folds turns through the experimental laws in `content/data/relconlang/dialogue-transition-laws-v0.1.json`.

Move recognition and state transition are scored separately. An utterance can correctly carry `dialogue:answer` while failing to close a question because its proposition is irrelevant. Likewise a refusal can close conversational relevance while producing no truth/evidence update on the target proposition.

## Interrogativity gate

A grammatical question issue is opened from an explicit interrogative reading, currently `ku`. Sentence-final `?` is recorded as orthographic evidence but does not by itself supply `dialogue:question` in either current parser.

Information-structure particles can constrain an already-open issue, but local `fi` or `ko` does not automatically create a QUD. The experiment therefore scores interrogative force and information structure separately.

## Stance/evidence gate

Zero marking does not currently license an implicit `ta` reading. The evaluator records `surfaceStance.explicit=false` and `stanceReport=null` unless a stance particle is actually present.

Target proposition evidence is a separate coordinate. A stance report may be witnessed as an utterance event without fabricating for/against witnesses on its target.

## Saturation-fiber gate

SignCraft subject/object hole fibers are scored as attested lexical/selectional incidence. They may be learned from clauses with any stance, including `mu` or `sha`. They are never used as a shortcut for target proposition truth/evidence.
