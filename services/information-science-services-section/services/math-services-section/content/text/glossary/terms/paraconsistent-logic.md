---
title: "Paraconsistent Logic"
description: "Logic that permits contradictory evidence without making every proposition derivable, represented here by the four-valued Belnap bilattice."
aliases:
  - "paraconsistency"
  - "paraconsistent logics"
date-created: 2026-06-20
type: term
term-kind: concept
value-algebra: four-bilattice
source-snapshot: 2026-08-17-windows-561-group
source-variants:
  - paraconsistency/predication-classical-three-valued-paraconsistent-foils.md
  - paraconsistency/predication-classical-three-valued-paraconsistent-foils-1.md
  - paraconsistency/predication-classical-three-valued-paraconsistent-foils-2.md
  - paraconsistency/predication-paraconsistent-variants-opener.md
  - paraconsistency/predication-paraconsistent-variants-opener-1.md
  - paraconsistency/predication-paraconsistent-variants-opener-2.md
  - triage.dev.emsenn.net/content/_archive/legacy-research-overview.md
---

# Paraconsistent logic

Paraconsistent logic permits a proposition and its negation to be supported together without validating arbitrary conclusions. Classical logic has only true and false values, so an inconsistent premise can trigger explosion ($p \wedge \neg p \vdash q$ for every $q$). Three-valued logics add an unknown or undefined value, but do not represent contradiction directly. A paraconsistent system adds a contradiction value; combining both distinctions yields the four-valued Belnap bilattice

$$\mathbf{FOUR}=\{\mathbf{t},\mathbf{f},\top,\bot\},$$

where $\mathbf{t}$ is positive evidence, $\mathbf{f}$ negative evidence, $\top$ both kinds of evidence, and $\bot$ no evidence. The truth and knowledge orders are different: the first tracks truth polarity, while the second tracks information accumulation. The value $\top$ is therefore a legitimate epistemic state, not a failed computation.

The bilattice is the value space; settling-associated sheaves and CRDT-style joins supply temporal and distributed accumulation. The paraconsistent track refines ordinary truth-order cohomology with $\top$-cell and inconsistency data. A consistent settling reduces to the ordinary truth-only invariant; an inconsistent settling needs the additional track to remain distinguishable without erasing either side of the conflict.

This concept is the single home for the corpus's classical/three-valued/paraconsistent comparison and its six duplicate “variants” openers. The detailed comprehension, sheaf, classification, and transfinite-settling claims are consolidated in the two notes linked by their source ledgers rather than repeated as separate concept pages.

## Why tolerate contradiction?

The older overview adds the practical and philosophical motivation that belongs
with this definition. Classical explosion treats a contradiction as a reason to
derive every proposition, preserving consistency by making any inconsistent
theory unusable. That is a coherent revision policy, but it is not always a
workable description of inquiry: scientific theories under revision, legal and
database records assembled from conflicting sources, and semantic paradoxes can
all present incompatible evidence before anyone can repair the conflict.

Paraconsistency therefore changes the consequence relation rather than merely
adding an ``unknown`` value. Priest's Logic of Paradox (LP) can retain excluded
middle while rejecting explosion and disjunctive syllogism; relevant logics
restrict inference to premises connected to the conclusion; preservationist
systems quarantine incompatible premises; and Belnap's four-valued logic keeps
both the ``neither`` and ``both`` states. These are neighboring design choices,
not a single scale from strong to weak. Intuitionistic logic is independent:
it weakens excluded middle while retaining explosion, whereas paraconsistent
logic weakens explosion and may retain excluded middle.

The source's learning question—why rejecting explosion also blocks the usual
disjunctive-syllogism inference—belongs here as an explanatory prompt, not as a
separate glossary object. The old relative links were export-layout links and
are intentionally replaced by this canonical account.
