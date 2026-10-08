---
name: primitive-frontmatter-keys-discussion-2026-05-14
description: Conversation between emsenn and founding-assistant working out the minimum set of structural (load-bearing, authored) frontmatter keys needed to make FARS-style flatfile theories self-describing enough that a swarm of mechanical agents can fill in extractable keys.
type: session-log
date: 2026-05-14
participants: [emsenn, founding-assistant]
mode: talk-only
title: primitive-frontmatter-keys-discussion-2026-05-14
date-created: 2026-05-14
---

# Primitive frontmatter keys for FARS — talking it through

## Frame emsenn set

- This session is talk, not do. emsenn asked to be reminded when slipping toward making changes.
  Exception granted for this log itself; rule otherwise in force. founding-assistant may create documents under `work/` and `governance/` of FARS as they are needed for the discussion.
- Bird's-eye-view problem: the superrepo is governed by strict category theory but the math is so poorly encoded in the records that finding it is impossible.
  The goal is to articulate the rules cleanly enough that the cleanup becomes mechanical and dispatchable to a swarm of microskills/models.
- The bootstrap obstacle: the swarm cannot be built until the substrate is untangled; the substrate cannot be untangled by hand at this scale.

## Direction emsenn articulated

The first tangle to attack is the predication-category-theory of *theory itself* — Scott-Lambek-style theory presentation, plus speech-acts (frontmatter as performative presentation).
The aim is to build up predicatory objects and morphisms around theories such that predication category theory can itself be encoded as a theory in the repo, with the load-bearing predications declared in frontmatter.

emsenn's own framing of the practical shape: "figure out which keys are our primitives for different resources in a flatfile agentic resource system, then start using them, filling in values with other entities in that or upstream theories, and start getting things computable.
We do the figuring out, you and me, while other agents get tasked with the mechanical 'read this file, see which named entities are mentioned, populate the right key' work."

## Distinctions surfaced

### "Is a theory" decomposes into presentation + relation

emsenn asked: when we say "every directory is a theory," what transformer do I actually mean?
Hypothesis: "is a theory" reduces to `derives-from: another-theory`, anchoring at predication as primary theory.
But derivation alone isn't enough without DIFFERENCE.

founding-assistant's sharpening:

- A theory T (Scott-Lambek) is *presented* by a signature (sorts, ops, relations) plus axioms.
  Two distinct statements:
  - "This directory is a theory" — a claim about presentation.
  - "This theory derives-from that theory" — a claim about relation to other theories.
- **Presentation = directory contents** (`concepts/`, `objects/`, `morphisms/`, `claims/`, etc.).
  Computable by walking.
- **Frontmatter carries what cannot be computed from contents alone** — namely the relations to other theories and the mode of those relations.
- "DIFFERENCE" is not a frontmatter key.
  It is the *delta* between this theory's presentation and its parents' presentations, computable once `derives-from` + mode-of-derivation are present.

### Two registers of frontmatter keys

The full set of frontmatter keys splits into two operationally distinct registers:

| Register | Origin | Volume | Change rate | Filler |
|---|---|---|---|---|
| **Structural (load-bearing)** | authored by emsenn / founding-assistant (draft-only) | few | rarely | human + character-agent |
| **Extractable (content)** | computable from prose + a closed vocabulary | many | regenerable | swarm of mechanical agents |

The swarm operates on the extractable register.
The structural register is what we have to settle first by hand, because it is the vocabulary the swarm uses.

### Candidate floor for the structural register

Starting guess (subject to revision):

- `derives-from` / `extends` — parent theory or theories (possibly several; theories compose by pushout).
- **mode-of-derivation** — pure extension? quotient? interpretation-of / model-of?
  Without this, `derives-from` is ambiguous and the delta is uncomputable.
- `presents` — for a record inside a theory, which fragment of the theory's signature it contributes (a sort? an op? a relation? an axiom?).
- (possibly) `models` — for theories that are interpretations of other theories rather than syntactic extensions.

## Evidence already in the substrate

The FARS `_index.md` already commits to these primitive keys:

- `instantiates:` — the doc realizes / specializes / makes-concrete entities from upstream theories.
- `depends-on:` — the doc reads from the listed entities.
- `see-also:` — non-load-bearing related entities.
- `derives-methods-from-theory:` — present at the theory level (in `_index.md` itself).

These are not theoretical.
They are in use.
They constitute prior art for the structural register and have to be reconciled with the candidate floor above (e.g., is `instantiates` a special case of "mode-of-derivation = model-of" at the record level? is `derives-methods-from-theory` the theory-level form of `derives-from` restricted to method-import?).

## Open questions this log defers

- What is the smallest predicate vocabulary such that a directory's contents *determine* the theory it presents?
  (gating question for the bootstrap)
- Is the right mode-of-derivation vocabulary: {extension, quotient, interpretation, model-of}?
  Or is it richer?
  (Lambek/Lawvere have answers; need to import them carefully, not wholesale.)
- Where does `instantiates` sit relative to `models` and `derives-from`?
  Suspected: `instantiates` is the *record-level* (not theory-level) form of "this thing realizes that thing in a specific scope" — i.e., interpretation at the entity granularity.
- Are speech-act keys (declare / assert / question / defer) part of the structural register, or are they meta to it?
  Frontmatter-as-presentation reads them as performative — that suggests they belong, but the shape is unclear.
- How does `presents` interact with the canonical content directories (`concepts/`, `objects/`, `morphisms/`, `claims/`)?
  Possibly the directory IS the value of `presents` (a concepts/ record presents a concept), in which case `presents` is redundant with file location and can be dropped from the structural floor.

## What this log does not do

- Does not propose changes to any record outside this log.
- Does not authorize the swarm.
  The swarm cannot exist until the structural register is settled.
- Does not commit to the floor above.
  The floor is a starting point for the next round of talk.
