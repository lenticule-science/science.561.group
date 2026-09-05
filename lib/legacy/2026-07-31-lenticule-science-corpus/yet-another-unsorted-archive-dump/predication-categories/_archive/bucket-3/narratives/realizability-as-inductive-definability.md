---
kind: narrative
status: current
discusses: [rule-language-fragment-realizability-refinement, transfinite-bounded-regime-realizability, aperiodic-regime-realizability, closure-rule, non-scott-continuous-firing-ordinal]
---

# The realizability program as inductive definability

The corpus's realizability theorems for the bare $\Pi_1$+$<$ language — characterizing the realizable $L_{\mathrm{ns}}$-subsets as initial segments of countable limit ordinals — have a structural cousin in the classical theory of *positive monotone inductive definitions*. The narrative connects the two and uses the parallel to enrich understanding of the rule-language fragment hierarchy without leaning on the external theory for proof.

## The classical framework

A *positive monotone inductive definition* is a set-builder $\Gamma : \mathcal{P}(X) \to \mathcal{P}(X)$ on some structure $X$, monotone in $\subseteq$, that adds new elements based on what's already there. Iteration produces a transfinite chain $\Gamma^0 = \emptyset, \Gamma^{\xi+1} = \Gamma(\Gamma^\xi), \Gamma^\mu = \bigcup_{\xi < \mu} \Gamma^\xi$ at limits, stabilizing at the *closure ordinal* $\kappa(\Gamma)$ — the smallest $\xi$ with $\Gamma^{\xi+1} = \Gamma^\xi$.

Moschovakis's *Elementary Induction on Abstract Structures* (1974) develops the framework systematically. Aczel's *An Introduction to Inductive Definitions* (Handbook of Mathematical Logic, 1977) surveys it. Key results:

- For positive elementary inductive definitions on a countable structure, the closure ordinal is at most $\omega_1^{\mathrm{CK}}$ (the Church–Kleene ordinal — the supremum of recursive ordinals).
- For richer fragments — arithmetic, $\Sigma_1^1$, $\Pi_1^1$ — the closure ordinal can reach further into the projective hierarchy.
- The *non-trivial limit stages* of a positive monotone induction — limits where the iteration adds new content — form an initial segment of countable limit ordinals below the closure ordinal.

The third point is the structural fact that mirrors our bare-language realizability theorem.

## How the corpus's setup translates

The translation between positive monotone inductive definitions and our closure-rule systems is direct:

- *Closure-rule systems* in the bare $\Pi_1$+$<$ language are positive monotone inductive definitions on the predication fiber algebra. The rule's antecedent corresponds to the inductive operator's "input formula"; the consequent specifies which element gets added.
- *Settling stages* $v_\sigma$ are the iterated stages $\Gamma^\sigma$.
- *Closure ordinal* $\kappa$ is the inductive definition's closure ordinal.
- *Non-Scott-continuous firing ordinals* $L_{\mathrm{ns}}$ are the non-trivial limit stages — limits where the iteration adds content not derivable from any single earlier stage.
- *Increment sequences* are the inductive definition's "starting state" augmentation, with countable-support corresponding to the initial state being countably-presentable.

Under this translation, the realizability theorem becomes a statement about which subsets of countable limit ordinals can be the non-trivial-stage set of a positive monotone $\Pi_1$-induction with countable starting data.

## What the connection adds

The classical framework gives several things the corpus's realizability program inherits or parallels:

**A hierarchy of definability classes.** Moschovakis's theory parameterizes inductive definitions by their formula complexity: arithmetic, $\Sigma_1$, $\Pi_1^1$, etc. Each level produces its own closure-ordinal range and its own characterization of stage-of-addition sets. This hierarchy is the *external referent* for the corpus's [rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md):

- Bare $\Pi_1$+$<$ corresponds roughly to *finitary positive elementary induction*, with realizable $L_{\mathrm{ns}}$ matching the initial-segment characterization.
- Adding named-ordinal entity-equality literals corresponds to *arithmetic-positive induction* with parameters, yielding initial-segment-modulo-finite definability.
- Adding ordinal-arithmetic primitives corresponds to *arithmetic induction*, yielding arithmetic-definable subsets.
- Higher fragments correspond to higher-complexity inductions, walking the projective hierarchy.

The corpus's rule-language fragment hierarchy is therefore the bilattice-2-monadic refinement of a classical complexity hierarchy on inductive definitions.

**Methodological precedent.** The proof techniques classical inductive-definability theory uses — structural induction on rule complexity, direct-limit arguments at $\omega_1$, complexity-class characterization theorems — are available templates for proving the corpus's per-axis refinements. Specifically, the per-fragment realizability characterizations in [rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md) can borrow proof techniques from Moschovakis-style stage-characterization theorems.

**A vocabulary for cross-corpus comparison.** Stating realizability theorems in the inductive-definability vocabulary makes them legible to readers who know the classical framework but not the bilattice 2-monadic setting. The corpus's "$L_{\mathrm{ns}}$ is an initial segment" result is exactly the same shape as classical "non-trivial stages of a positive monotone $\Pi_1$-induction form an initial segment" — modulo the bilattice-and-2-monad-specific machinery.

## What the connection doesn't replace

The proofs of the corpus's realizability theorems are *not* derived from inductive definability. They are proved within the corpus's own framework — using the closure 2-monad's lax-idempotence, the positive-cell-atom monotonicity in the bare language, and the settling endofunctor's orbit structure in the temporal 2-category.

The classical framework is a *parallel* that the corpus's structure recovers — not a foundation that the corpus borrows from. The bilattice value-type structure (giving the bigraded refinement), the predicate-category $\mathcal{C}$-naturality (giving the $\mathcal{C}$-coupling refinement), and the 2-categorical lax-idempotent closure (giving the temporal 2-category) are all native to the corpus and have no direct analogue in classical inductive-definability theory.

The corpus's realizability program *extends* the classical framework along three orthogonal dimensions (bigraded value-type, predicate-category coupling, rule-language fragment) rather than specializing it. The Moschovakis analogue is recoverable as the rule-language axis specialized to the trivial bilattice and discrete $\mathcal{C}$ — a one-dimensional slice of a richer multi-dimensional question.

## Where this matters in the program

The connection is most informative for the [rule-language fragment refinement](../theorems/rule-language-fragment-realizability-refinement.md): each fragment-extension's realizability question parallels a specific classical inductive-definability characterization, and the proof techniques transfer. The bare $\Pi_1$+$<$ and named-ordinal entity-equality fragments are proved within the corpus; the higher fragments — ordinal arithmetic, $\Pi_2$, second-order — currently sketched in the corpus, are exactly where the inductive-definability literature gives both target theorems to aim for and proof techniques to adapt.

For the [transfinite-bounded](../theorems/transfinite-bounded-regime-realizability.md) and [aperiodic](../theorems/aperiodic-regime-realizability.md) regime theorems — already proved within the corpus — the connection is methodological flavor rather than required infrastructure. A reader who knows Moschovakis sees the parallel; a reader who doesn't gets a complete proof from the corpus's own structures.

For the [bigraded refinement](../theorems/bigraded-realizability-refinement.md) and [$\mathcal{C}$-naturality coupling refinement](../theorems/c-naturality-coupling-realizability-refinement.md), there is *no* classical analogue. These axes are bilattice-2-monadic native and have no inductive-definability cousin to lean on. They are where the corpus's program goes beyond what the classical framework can address.

## Summary

The bare-language realizability theorem is the bilattice 2-monadic refinement of a classical fact about positive monotone $\Pi_1$-inductive definitions. The connection illuminates the rule-language fragment hierarchy, suggests proof techniques for axis refinements that have classical precedent, and provides a vocabulary for cross-corpus comparison.

The theorems' proofs come from within the corpus. The classical framework supplies texture and orientation, not foundation.
