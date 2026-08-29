---
kind: question
status: partial
explores: [closure-2-monad, settling-endofunctor, settling-cohomology, verdier-duality-bitopological-site]
---

# Cosettling: the backward-direction story

> **Progress.** The [cosettling object](../objects/cosettling.md) defines the single-step backward operation $T^{-1}(w)$. The [forward-trajectory-inside-the-cosettling theorem](../theorems/backward-closure-recovers-forward-trajectory.md) establishes that the trajectory is *contained in* the iterated cosettling, but the inclusion is generally strict — off-trajectory pre-images exist even in the strict regime, where a cell from "the future" can be inserted into a present state and have the missing precursor re-derived in one closure step. So the cosettling is a finite **join-semilattice** (closed under union, with maximum $w$), not a complete lattice; it has no canonical minimum. The [three-backward-structures](three-backward-structures-and-their-symmetry.md) question splits the original "backward direction" into σ (cohomologically silent rotation), conflation (single-valued kernel operator $K_k = -T_k-$), and cosettling (multi-valued temporal). Still open here: cosettling cohomology (sub-question 2), reachability preorder (sub-question 3), retrocausal interpretation (sub-question 4), and the **off-trajectory pre-image classification problem** newly surfaced by the corrected theorem.

The corpus's [closure 2-monad](../morphisms/closure-2-monad.md) and [settling endofunctor](../morphisms/settling-endofunctor.md) run forward: starting from an increment sequence, iterating produces a settling at the closure ordinal. The settling is the *future limit* of the iteration.

The natural backward question: given a settling, what was the *minimal initial state* that could have produced it? Or: given a final state, what's the *coarsest predecessor* — the underdetermined previous-stage data?

This is structurally the **"cosettling"** question. The corpus has the cosheaf side via [Verdier duality](../theorems/verdier-duality-bitopological-site.md), but Verdier-dual-of-forward-running is still forward-running on the dual (sheaf cohomology classifies, cosheaf homology co-classifies, both forward). **Backward-running closure** is something else.

## Open

1. **Backward-running operator.** Define $T^{-1}$: a multi-valued map taking a settling state to the set of states that could close to it. For an inflationary monad, this is non-trivial — many initial states close to the same settling (the closure operator is not injective). The set of preimages is a structural invariant.

2. **Cosettling cohomology.** Just as forward iteration gives $H^1$ of accumulating firings, backward iteration would give... what? The cohomology of *maximally-extending consistent histories*? Connects to the consistent-histories interpretation of quantum mechanics in spirit.

3. **Reachability**. Given two settlings $v, w$, when is there a forward iteration from $v$ to $w$? When is there a backward path? This gives a partial order / preorder on settlings that's distinct from MLD-equivalence.

4. **Causal structure**. For settings with a temporal axis (the corpus's settling-stage), backward closure is *retrocausation* — what counterfactual past would have produced this present? Has connections to the cosmology questions about backward-time / closed timelike curves.

5. **The settling-shift orbit revisited from backward direction**. Settling-shift identifies settlings related by ordinal-translation. Forward and backward shifts are inverse. But forward-shift might be "easy" (just iterate further) while backward-shift might be "hard" (requires choosing among many preimages). Asymmetric difficulty.

The Verdier-cosheaf side is forward-running on dual data; this question is about a different backward-running construction. Probably requires explicit non-categorical machinery (multi-valued maps, partial orders on states).
