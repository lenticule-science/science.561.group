---
title: "Concordance Review: Gaps, Holes, and Structural Questions"
date-created: 2026-03-05T00:00:00
type: doc
purpose: Systematic audit of what the concordance captures and what it misses
description: Audited all 43 concordance files.
---

## Method

Audited all 43 concordance files. Grepped for concept names that appear
frequently across the concordance but lack their own concept files.
Cross-referenced against the vocabulary-mapping and the full set of draft
sources. Identified three categories of gaps:

1. **Missing concept files** — important ideas referenced frequently but
   with no dedicated documentation
2. **Structural gaps** — aspects of the framework's architecture that the
   concordance doesn't address
3. **Questions for structuring the re-production** — issues that must be
   resolved before turning the concordance into a coherent body of work

---

## Category 1: Missing Concept Files

### High priority (referenced 15+ times, central to the framework)

**1. The Articulation Theorem** — 18 references across 11 files
Currently referenced in: relationlessness.md, reflex.md, differentiate.md,
coherence.md, incitement.md, witness.md, self-grounding.md,
the-generative-closure.md, open-questions.md, vocabulary-mapping.md,
concordance-index.md.

This is HOW THE DERIVATION BEGINS. It resolves the fundamental question:
how does structure emerge from the void? "To describe the state 'without
relation' is to effect an exclusion between 'relation' and 'this field.'
Exclusion is relational in form, hence it constitutes a recognition."
Without this theorem, the opening of the derivation is mysterious.

**2. RITM (Relational Infinity-Topos Modality)** — 34 references across 8 files
Currently referenced in: concordance-index.md, flow.md, open-questions.md,
reflexive-equilibrium.md, self-grounding.md, states-observables.md,
the-derivation.md, vocabulary-mapping.md.

RITM is the formal mathematical structure that encodes the entire
framework as an adjoint quadruple (Shape ⊣ Flat ⊣ Sharp ⊣ Crisp). Its
self-stabilizing property is the formal expression of self-grounding.
The concordance discusses its PROPERTIES but never explains what RITM IS
as a structure — what the four adjunctions do, how they relate to the
five movements, and why their self-reconstruction is significant.

**3. RelationalLanguage / λ_R (typed lambda calculus)** — 24 references across 8 files
Currently referenced in: discipline-regime-filter-profile.md,
open-questions.md, concordance-index.md, self-grounding.md,
the-generative-closure.md, the-granular-derivation.md,
the-derivation.md, vocabulary-mapping.md.

The internal computational language of the relational field. Cross-cutting
— applies at every level. The concordance discusses it in Q9 (open
questions) but has no concept file explaining: what λ_R IS, how it is
EARNED from the relational structure, and how it relates to draft 9's
S-expression derivation and draft 2's computational approach.

**4. The four-part framework** — 22 references across 8 files
RelationalStructure → RelationalLanguage → RelationalGeometry →
RelationalPhysics. The treatise's organizational architecture. Each
Filter produces a Profile that reproduces all four parts. Q10 resolves
how the four parts map to the five movements, but no concept file
explains the four-part framework itself.

### Medium priority (referenced 8-17 times, fill important gaps)

**6. Reflecting (vs. Reflexing)** — 12 references across 3 files
Q17 resolves that these are genuinely distinct (instantaneous act vs.
sustained maintenance of reflexivity). The canonical-names doc lists
Reflecting as a distinct -ing form. But the distinction — crucial for
understanding how reflexive sequences work — has no concept file.

**7. Stratifying / Constructible** — 20 references across 9 files
PRE Part IV's operations for organizing diagrams by directional degree.
These are Movement IV's formal operators, but the cohesive-chain.md file
focuses on the adjoint quadruple (Shape/Flat/Sharp/Crisp) without
explaining stratification itself. The concept also appears heavily in
the SDIG framework (draft 6) where constructible diagrams are
foundational.

**8. Conserving / Conservation** — 8 references across 6 files
Movement V's principle that every consistency in the relational logic
finds expression as a measurable invariant. Mentioned in states-observables.md,
how-movements-connect.md, the-derivation.md, but not a separate concept.
The Noether-like character of relational conservation (14 references
to invariants) deserves its own treatment.

**9. Stable Envelope** — 8 references across 6 files
Draft 10's Envelope(x) = Possible(x) ∧ Necessary(x) — the bandwidth of
stable variation. Mentioned in canonical-names.md, dynamic-residuation.md,
existence-observation-duality.md, how-movements-connect.md,
the-derivation.md. A specific Movement V concept that bridges the modal
operators (Necessary/Possible) and the physical reading (observable content).

### Lower priority (fewer references, but philosophically significant)

**10. MinimalCohesion HIT (Cubical Agda formalization)** — 4 references
Draft 7's unique contribution: formalizing minimal coherence as a Higher
Inductive Type with nontrivial higher paths. Philosophically significant
because it demonstrates that coherence adds genuine higher-dimensional
structure — not just holding things together but creating new topology.

**11. Existing (as an act)** — 21 references to "existing" across 10 files
Draft 7 defines existing as a distinct act: "to claim that something
exists is to claim that it is not what it is not." The phenomenological
sequence starts with it. But the concept files jump from genesis
(relationlessness, reflex) to the phenomenological layer (tension,
difference) without a file for existing itself.

---

## Category 2: Structural Gaps

### The concordance maps concepts but not the ARGUMENT

The concordance has 38 concept files and 7 explanatory documents. The
explanatory documents (the-derivation.md, how-movements-connect.md,
the-phenomenological-sequence.md) DO present the argument. But the
concept files are encyclopedic — they define WHAT things are without
fully articulating WHY they arise or how each one COMPELS the next.

The "it cannot not derive" pattern is named (incitement.md,
predictive-determination.md) but the SPECIFIC compulsions between
adjacent concepts are scattered across files rather than forming a
connected chain.

**Gap**: A document that traces the complete chain of compulsions
from concept to concept — not at the movement level (how-movements-connect
already does this) but at the individual concept level.

### Movement IV and V are thin

The concordance has:
- Movement I: 6 concept files (differentiate, includes-excludes,
  together-either, negate, induces, iterate)
- Movement II: 4 concept files (close, open, balance, necessary-possible)
- Movement III: 3 concept files (flow, dynamic-residuation,
  discipline-regime-filter-profile)
- Movement IV: 1 concept file (cohesive-chain)
- Movement V: 1 concept file (states-observables)

Movement IV should include stratifying/constructible and the specific
adjunctions (Shape/Flat/Sharp/Crisp as individual concepts). Movement V
should include conserving, the stable envelope, and the meta-boundary.

### The computational derivation path is underdocumented

Draft 2 and the computational portions of draft 1 derive computational
structures (True/False, Tuple, Apply, typed lambda calculus) from
Reflex. Draft 9 does the same at much finer granularity. This path
is mentioned in the-granular-derivation.md and Q9 (open-questions) but
no concept file traces how computation is EARNED from the relational
field.

This matters because the RelationalLanguage (λ_R) is one of the four
parts of the treatise's architecture. The concordance has no file
explaining how lambda calculus arises from the relational axioms.

### The relationship between the relational field and mathematical
correspondences is not explicit

The concordance notes mathematical correspondences (Heyting algebra,
KZ-comonad, cohesive topos, etc.) but doesn't systematically map:
which relational concept → which mathematical structure → what the
correspondence validates. A reference table would make the philosophy-
mathematics bridge explicit.

---

## Category 3: Questions for Structuring the Re-Production

### 1. What is the right unit of publication?

The concordance has concept files (terms), explanatory documents
(articles), naming conventions (reference), and cross-references
(maps). For a published body of work, how should these relate?

Options:
- A single long text (like a treatise) that works through the derivation
- A network of interlinked concept pages (like the concordance itself)
- A layered presentation (philosophical overview → movement pages →
  concept entries)

### 2. What register should the published work use?

The concordance mixes registers:
- Philosophical (the-phenomenological-sequence, relating, tension)
- Mathematical (flow, cohesive-chain, dynamic-residuation)
- Analytical (the-derivation, open-questions)

The published work needs a consistent register. The plan file suggests
"philosophy first, math as correspondence" — but the concept files
don't consistently follow this.

### 3. How much of the granular derivation should be published?

Draft 1's 37-step sequence and draft 9's 50+ steps show the full
earning of each concept. But the published canonical sequence has
~15 operators. How much intermediate detail should appear?

### 4. What is the reader's entry point?

Currently, the concordance has multiple possible entry points:
- concordance-index.md (map of everything)
- the-derivation.md (the argument)
- the-phenomenological-sequence.md (plain-language opening)
- relationlessness.md (the seed)

A published work needs ONE clear entry point.

### 5. How do the concept files relate to the -ing naming convention?

The concept files use mixed names: some are -ing forms (relating.md),
some are bare verbs (differentiate.md, close.md), some are nouns
(coherence.md, tension.md). For the published work, should file names
match the canonical -ing convention? E.g., differentiating.md instead
of differentiate.md, closing.md instead of close.md?

---

## Summary of Missing Concept Files (by priority)

| Priority | Concept | References | Status |
|---|---|---|---|
| HIGH | Articulation Theorem | 18 across 11 files | DONE — articulation-theorem.md |
| HIGH | RITM | 34 across 8 files | DONE — ritm.md |
| HIGH | RelationalLanguage / λ_R | 24 across 8 files | DONE — relational-language.md |
| HIGH | Four-part framework | 22 across 8 files | DONE — four-part-framework.md |
| MEDIUM | Reflecting (vs. Reflexing) | 12 across 3 files | DONE — reflecting.md |
| MEDIUM | Stratifying / Constructible | 20 across 9 files | DONE — stratifying.md |
| MEDIUM | Conserving / Conservation | 8 across 6 files | DONE — conserving.md |
| MEDIUM | Stable Envelope | 8 across 6 files | DONE — active-envelope.md |
| LOWER | MinimalCohesion HIT | 4 across 3 files | DONE — minimal-cohesion.md |
| LOWER | Existing (as an act) | 21 across 10 files | DONE — existing.md |

All 11 missing concept files have been created. Each includes source attestations, relationships, and notes on TTL/Lean encoding.

## Remaining structural gaps (updated)

1. ~~Philosophy-math correspondence table~~ DONE — philosophy-math-correspondences.md
2. Concept-to-concept compulsions chain (individual compulsions, not movement-level) — NOT DONE
3. Computational derivation path detail — covered by the-granular-derivation.md and relational-language.md but could be more systematic
