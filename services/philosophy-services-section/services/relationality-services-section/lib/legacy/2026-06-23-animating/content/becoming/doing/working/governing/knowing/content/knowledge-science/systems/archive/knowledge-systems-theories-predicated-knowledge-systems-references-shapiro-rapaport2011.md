---
type: reference
authors: [Shapiro, Stuart C., Rapaport, William J., Kandefer, Michael, Johnson, Frances L., Goldfain, Albert]
year: 2007
title: "Metacognition in SNePS"
venue: "AI Magazine 28(1), 17–31"
---

## Full citation

S. C. Shapiro, W. J. Rapaport, M. Kandefer, F. L. Johnson, A. Goldfain. "Metacognition in SNePS." *AI Magazine* 28(1), 17–31, 2007.

## Status

Pending direct re-read; covered via the [knowledge-representation-survey](../texts/knowledge-representation-survey.md).

## Annotation

A contemporary status report on SNePS (Semantic Network Processing System), the long-running KR system developed by Shapiro and the SNePS Research Group at SUNY Buffalo. SNePS is a *propositional semantic network* — every node represents a proposition (not a concept or a term), and every arc is a relation between propositions. The system's distinctive commitment is *metacognition*: the system can have beliefs about its own beliefs, including the source, justification, and revision history of every assertion. SNePS includes SNeBR (the SNePS Belief Revision system) for handling contradictions through dependency-directed backtracking.

For the predicated framing, SNePS is the closest predecessor system to the framing's substrate in three respects: (i) propositions-as-nodes corresponds to *cells-as-first-class-citizens* — a cell is the unit of storage, not a derived label on edges; (ii) explicit metacognition (the system represents its own beliefs about its beliefs) corresponds to *reified-retraction* and the bilattice-valued [evidence-accumulation](teaching/explanations/evidence-accumulation.md) chain; (iii) belief revision through dependency-directed backtracking is a precedent for the framing's [reified-retraction](teaching/explanations/reified-retraction.md) — the system records *that* a belief was held, *what supported it*, and *under what conditions* it was retracted, rather than simply removing it.

SNePS is the system the framing most directly inherits from on the question of *epistemic adequacy for self-modelling knowledge bases*. The framing's improvement over SNePS is the bilattice-valued substrate, which provides an algebraic value-domain for "asserted-true", "asserted-false", "asserted-both", and "no-information" — where SNePS handles these distinctions through procedural protocols, the bilattice handles them as values in the cell algebra.

## Where used

- [knowledge-representation-survey](../texts/knowledge-representation-survey.md)
- [reified-retraction](teaching/explanations/reified-retraction.md)
- [evidence-accumulation](teaching/explanations/evidence-accumulation.md)
