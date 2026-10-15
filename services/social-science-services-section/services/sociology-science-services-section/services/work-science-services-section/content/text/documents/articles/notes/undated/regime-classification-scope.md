---
type: question
status: partial
explores: [operations-settling, regime-of-task, four-regime-dichotomy, regime-decomposition]
see-also: [non-scott-continuous-firing-ordinal, regime-mld-invariance, settling-moduli-prestack]
title: "Scope of a work-regime classification"
description: "Distinguish fixed-input saturation, saturated closure and open operational histories; state conditional bounds and counterexamples."
date-modified: 2026-10-15
---

# Scope of a work-regime classification

A regime claim must identify the object it classifies: a fixed-input orbit of
one rule operator, a family of such orbits, or an open operational history.
The [work-regime definition](../../../../glossary/concepts/work-regime.md)
is the active contract. The earlier answer in this note conflated these three
objects and asserted stronger results than its supplied hypotheses justified.

## Fixed-input orbit and saturated closure

For an inflationary monotone one-step operator F on a complete lattice, choose
an initial valuation v₀; take vα₊₁ = F(vα) and joins at limit stages. Its least
fixed stage, if it exists, is a property of this operator and starting point.
A saturated closure cl that is already idempotent satisfies cl(cl(v)) = cl(v).
Repeatedly applying that same closure without new input cannot demonstrate a
nontrivial transfinite saturation process. A source using cl for unsaturated
rule firing must state that different convention.

On a fixed N-coordinate FOUR carrier there are at most 2N strict knowledge
increases. For a Scott-continuous F started at bottom, the join of the finite
iterates is fixed, so the closure ordinal is at most ω. It need not equal ω:
F = identity is Scott-continuous and stabilizes immediately. Nor does finite
input force finite saturation on an infinite carrier: on subsets of ℕ, let
F(X) = {0} ∪ X ∪ {n+1 : n∈X}. Starting at the empty set, every finite stage
adds a successor, and the first fixed stage is ω. This operator is finitary
and Scott-continuous, with no further external increments needed.

## Open histories and worst-case bounds

The recurrence vτ₊₁ = cl(vτ ∨ₖ uτ) includes an externally supplied increment
sequence. A one-step plateau is not evidence that a later uτ cannot change
it. Adding a new scope or entity also changes the carrier unless an embedding
into a fixed carrier is supplied. Define the admitted family U, carrier,
initial state and stable-stage criterion before taking a supremum over runs.

A well-defined supremum is an upper bound. It need not be attained: the
supremum of all finite ordinals is ω although none is ω. Thus a worst-case
bound at a limit does not alone exhibit a run of that length. It is also not
“computable from the rules” merely by definition. That requires an algorithm
and proof for the admitted rule language.

Knowing only which rules eventually fire also forgets timing. With cl equal
to identity, inject one fresh positive datum at stage 1 in one history and at
stage 10 in another. The same datum and rule set occur, but the earliest
permanent stable stages differ. Any proposed equivalence of histories must
retain or quotient the timing information deliberately and prove invariance.

## Claims left for the owning mathematics

An MLD-invariance or deformation theorem applies only with its actual
hypotheses and preserved structure checked. The previous assertion that
non-locally-closed strata forbid continuous paths does not follow: failure of
local closedness alone is not a path-disconnection theorem. The previous
claim that regimes can only rise along deformations also needs a proved
monotonicity law, not an ordered list of labels.

No organizational role, charter, aim, cultural time horizon or recurrence
frequency receives a closure ordinal solely from its name. Supply the
valuation domain and operator, then establish the needed bound or lower-bound
witness. See [task](../../../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-task.md)
and [recurrent practice](../../../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-recurrent-practice.md)
for their conditional statements. The historical speculative constructions
remain available in this note’s earlier revision; they are not active proofs.
