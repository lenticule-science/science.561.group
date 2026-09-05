---
title: "The Hamami-Morris Test for Plan Reconstruction"
date-created: 2026-05-02
---

Yacin Hamami and Rebecca Morris have developed an account of mathematical reading that sits at right angles to the line-by-line verification picture. On their account, the reader of a proof is not primarily verifying steps; the reader is *reconstructing the plan* — the strategic structure of the argument, what apparatus is being deployed, why one move is being made rather than another, what the proof is doing as a whole. The verification of individual steps is one piece of this work, but it is not the work.

This text is a synthesis of their framework and a translation of its diagnostic into the framework's vocabulary.

## Plan reconstruction as the unit of reading

The [plan-reconstruction](concepts/plan-reconstruction.md) concept in the framework formalizes Hamami and Morris's observation. A reader who has verified every line of a proof but cannot tell what strategy the proof was deploying has not yet read the proof. They have validated it. They can confirm correctness; they cannot reuse the technique, recognize when the strategy applies elsewhere, or explain to a student what is being learned.

Reading-as-plan-reconstruction is what experienced mathematicians do. They look for the central move. They identify the apparatus the proof is using. They recognize the proof's strategy as an instance of a pattern they have seen before, with variations. The line-by-line verification, when they do it, is in service of confirming that the plan is being executed correctly — not in lieu of recognizing the plan.

## What this implies for writing

A proof that licenses plan reconstruction is one whose strategic structure is recoverable from the artifact. This usually requires:

- **Plan signposting.** The proof says, near the top, what it is going to do — what apparatus it is going to deploy, what the central move is, what the structure of the argument will be.
- **Local-to-global anchoring.** Each step is presented in a way that connects it to the overall plan. The reader does not have to re-derive the strategic context for each line.
- **Apparatus naming.** The named theorems, lemmas, and techniques the proof is using are cited by name when they are deployed, so the reader can place each move in the apparatus map.

A proof that does not license plan reconstruction is verifiable but unreadable: the reader can confirm each step but cannot tell what the steps are for. Such proofs are common in formal verification output, in machine-generated derivations, and in proofs written under publication pressure where the strategic narrative was sacrificed to compactness.

## Why this is the framework's positive criterion

The framework's [accountable-closure](concepts/accountable-closure.md) concept asks for closures that the reader can perform with audit. The Hamami-Morris account specifies what the audit consists in: the reader, having performed the closure, can articulate what plan the closure was an execution of. A closure whose plan-reconstruction is recoverable is accountable. A closure whose plan is opaque, even if its individual steps are correct, is unaccountable in the framework's sense — the reader cannot tell whether the closure they performed is the one the writer intended, because they cannot tell what intention the writer had.

This is also why the framework does not adopt [formal-correctness-as-sole-rigor](../terms/formal-correctness-as-sole-rigor.md). The formal expansion preserves step-by-step verifiability and destroys plan-reconstruction. A proof in formal-derivation form has perfect line-by-line correctness and zero strategic readability; experienced mathematicians find such expansions essentially impossible to read for understanding, even when the expansions are about a result they already know.

## Translation outside mathematics

Plan reconstruction is the general operation by which readers recover what an artifact is *doing*, beyond confirming that it is doing it correctly. A software architecture document is read for its design, not for its line count. A policy document is read for its commitments and their structure, not for its grammatical correctness. A novel is read for its narrative, not for its lexical accuracy. In each case, the artifact's communicative responsibility includes making its plan recoverable, not just its surface correct.

The diagnostic move is to ask of any artifact: a competent reader, having finished reading, can articulate what this is *for* and what the central moves *are*. If yes, the artifact has supported plan reconstruction. If no, the artifact has produced surface content without strategic legibility, and its readers will either guess the plan from what they can see (often wrongly) or treat the artifact as a black box (and miss most of what it could have communicated).
