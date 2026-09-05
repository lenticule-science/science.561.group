---
name: what is a predication-cell-trace
description: Questions that drive the predication-cell-trace structure's definition and theorems. The questioning record is the first artifact written for any new $thing — it states what we do not yet know about the thing, so we have a place to question it properly rather than chat at the operator about it. Unresolved questions here are the agenda for the structure's learning/answering/ slot.
---

# What is a predication-cell-trace?

A predication-cell-trace is, provisionally, the ≤_k-monotone chain in **L**^⋈ obtained by evaluating a predication-settling at one fixed predication-cell across all settling ordinals. The mathematical definition is at [predication-cell-trace.md](../../predication-cell-trace.md); the theorems forcing it to exist as a distinct structure live there too.

This file holds the questions about that definition that the bytes do not yet answer. Each question names a derivation that still needs to be settled.

## Questions about the categorical home

1. **What ambient space does the trace live in?** Three candidates:
   - The chain space $\mathrm{Chain}_{\leq_k}(\mathbf{L}^\bowtie)$ of ≤_k-monotone functions from an ordinal to **L**^⋈. The trace's image-arity matches.
   - The product **L**^{⋈ λ} as a thin category in the pointwise ≤_k-order. The trace is then a global element.
   - A section of the constant **L**^⋈-bundle over the ordinal λ, under the discrete (ordinal-poset) topology. The trace is a discrete cross-section.

   The three candidates are isomorphic as sets but carry different morphism structure. Which is the correct categorical home for the apparatus we already have? The decision shapes the trace category referenced in Q9 below.

2. **Is the index λ inherited from the parent settling, or a per-trace parameter?** [predication-settling.md](../../../../../../predication-settling-category/library/predication-settling/predication-settling.md) carries λ as a parameter on the settling. A trace produced by slicing inherits the parent's λ. Independent traces (not produced by slicing) might carry their own λ. The question is whether the structure-record admits both presentations or commits to one.

3. **What is the empty trace?** When λ = 0, the trace is the empty function $\emptyset \to \mathbf{L}^\bowtie$. When λ ≥ 1 but no closure-rule has fired, the trace is the constant function $\tau \mapsto \bot$ (the asserted starting value of knowledge-bottom). The two are different in cardinality but both represent "no information." Are they the same structure with different presentations, or two different structures?

4. **Does the trace need to be a total function from λ, or a partial function defined only at observed ordinals?** The math admits total functions naturally — a settling fills every ordinal. The engineering side (cell-trace) presents only the *observed* ordinals — those at which a closure-rule fired or an assertion landed. Does the layer-1 record commit to totality, or admit the partial presentation as primary?

## Questions about the relation to predication-settling

5. **Is `predication-cell-trace` a slicing-of or a member-of?** Two candidate frontmatter cells:
   - `slicing-of: predication-settling` — the trace is the settling-restricted-to-φ. Verb-form is a gerund; predicate is novel.
   - `element-of: predication-settling-cell-slice-space` — the trace is an element of a structure that does not yet exist. Forcing this requires creating that structure.

   The first reads correctly but introduces a new predicate (`slicing-of`); the second uses only existing predicates but invokes a missing $thing. Which is the right way to encode the relation?

6. **Does the closure 2-monad act on the trace, or only on its parent settling?** The frontmatter relation `closure-2-monad: predication-settling` appears on settling, valuation, fibration, hyperdoctrine. Does the same relation lift to the trace? Slicing commutes with the closure-operator's pointwise action on A_p (T2 of the structure record), so the lifted action is well-defined. But the closure-2-monad is itself a not-yet-written $thing; the lift is a derivation waiting on the prerequisite definition.

7. **Theorem T3 says single-cell slicing loses information.** What is the categorical content of that information-loss? Possible reading: Sl_φ is a fibration onto the cell-trace category whose fiber over a chosen trace is the set of settlings whose slice at φ is that trace. The fiber's cardinality is at least |A_p^E^2 ∖ {(s, o)}|^λ. Is this fibration the right way to record the loss, or is it a different categorical artifact?

## Questions about reindexing under predicate-category morphisms

8. **Theorem T2 (naturality)** licenses lifting reindexing f^* : A_p → A_q onto traces. But the four generator classes have different cell-coordinate effects:
   - Specialization keeps the cell-position fixed.
   - Converse swaps the (s, o) coordinates of the cell.
   - Subject-projection collapses to (s, s).
   - Object-projection collapses to (o, o).

   For the trace, this means specialization gives a trace at the same φ in a different fiber; converse gives a trace at (o, p, s) in the same fiber; the two projections give traces at degenerate cells. Are all four reindexings well-behaved on traces in the same way, or do the projections require special handling because they land at degenerate (diagonal) cells?

## Questions about the trace category

9. **Is there a category $\mathbf{Tr}_\phi$ whose objects are predication-cell-traces at φ and whose morphisms are ≤_k-refinements (closure-orbit extensions)?** Candidate definition: a morphism T → T' is a pair (g, h) where g : λ → λ' is an ordinal-embedding and h : T' ∘ g ≥_k T pointwise — T' extends T by adding more knowledge at the embedded ordinals. The category would carry the trace's "growth under the closure 2-monad" as morphisms. Does this category have the right limits and colimits? Is it itself a fibration over predication-cell-set?

## Questions about degeneracy

10. **In the boolean-2, λ=1 special case (Theorem T6 of the structure record), the trace literally equals a single FOUR-value.** Is the equality categorical or merely set-theoretic? Categorical claim: the slicing functor Sl_φ becomes the identity functor on a one-object category. Set-theoretic claim: the underlying sets are bijective. Which one are we asserting?

11. **For Datomic-EAVT-with-retractions**, the value at a cell can transition ⊤ → ⊥ (assertion then retraction). The ≤_k chain in **L**^⋈ does not admit this — knowledge-monotonicity forbids regression in the knowledge order. But truth-order regression is fine: ⟨⊤,⊥⟩ → ⟨⊤,⊤⟩ goes ⊤ → ⊥ in the truth-order. Does the trace record this as a ≤_k-monotone advance even though the classical reading is "retraction"? The frontmatter answer is yes (knowledge accumulates evidence both for and against); this question is for the worked example.

## Questions about naming

12. **The slug is `predication-cell-trace`, not `predication-cell-trace-along-settling`.** The shorter form treats the parent settling as implicit context. Is this lossy? Under what reading of the math does the same cell-trace appear differently depending on which settling is sliced — and is that the operator's intent, or should the slug be expanded to carry the settling explicitly?

## How this record progresses

Each question's resolution becomes a new file:

- A definitional commitment moves to a frontmatter cell on [predication-cell-trace.md](../../predication-cell-trace.md) or to its body's "structural facts" section.
- A theorem-with-proof moves to `learning/answering/predication-cell-trace-is-a-[$structure].md` under this directory.
- A still-open question stays here as the agenda.

The questioning record is never deleted; it accumulates the structure's intellectual history.
