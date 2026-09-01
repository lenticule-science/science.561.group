---
type: question
status: open
explores: [settling-endofunctor, predication-settling, closure-operator, closure-driven-settling-monotonicity]
---

# Settling-endofunctor step order: corpus inconsistency

The corpus carries two different statements of the settling step rule that produce different orbits.

## The two statements

**Theorem statement (merge-then-close).** [Closure-driven settling monotonicity](../theorems/closure-driven-settling-monotonicity.md), in its proof, uses the formula

$$v_{\tau+1}(p) \;=\; \mathrm{cl}_p\bigl(v_\tau(p) \vee_k u_{\tau+1}(p)\bigr).$$

Merge the increment first, then close. Under this rule every $v_\tau$ for $\tau \geq 1$ satisfies $\mathrm{cl}(v_\tau) = v_\tau$ — the orbit lives in the closure 2-monad's algebras except possibly at the seed.

The same formula is used in [settling-convergence](../theorems/settling-convergence.md), [transfinite-settling-convergence](../theorems/transfinite-settling-convergence.md), and is consistent with the prose in [settling-dynamics-opener](prose/teaching/explanations/settling-dynamics-opener.md) ("external evidence arrives, the closure fires until the predication state is saturated under inference, and the result is the valuation at the next ordinal") and [closure-machinery-opener](prose/teaching/explanations/closure-machinery-opener.md) ("The settling orbit $v_{\tau+1} := \mathrm{cl}(v_\tau \vee_k u_\tau)$").

**Definition statement (close-then-merge).** [Settling endofunctor](../morphisms/settling-endofunctor.md) defines

$$F_U(\mathcal{E})_\tau \;:=\; \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau,$$

with prose "first applies closure — saturating the state under derivable consequences — then merges in new external evidence." Close first, then merge. Under this rule $v_\tau$ for $\tau \geq 1$ is in general *not* closed — only the limit $v_\kappa$ (after increments dry up and one final closure fires) is.

The same close-then-merge formula is cited in passing in [two-disentangled-kz-structures](prose/teaching/explanations/two-disentangled-kz-structures.md) and [settling-as-coalgebra](prose/teaching/explanations/settling-as-coalgebra.md), but those citations reference the settling-endofunctor definition rather than restating the math independently.

## What's at stake

The two formulas produce **different intermediate orbits** in general. Under eventually-zero increments and a Scott-continuous closure they agree at the limit (both reach the same fixed point), but the trajectory shape differs:

- *Merge-then-close orbit:* $v_0 \to v_0 \vee_k u_1 \to \mathrm{cl}(v_0 \vee_k u_1) = v_1 \to v_1 \vee_k u_2 \to \mathrm{cl}(v_1 \vee_k u_2) = v_2 \to \cdots$. Every $v_\tau$ ($\tau \geq 1$) is closed.
- *Close-then-merge orbit:* $v_0 \to \mathrm{cl}(v_0) \to \mathrm{cl}(v_0) \vee_k u_0 = v_1 \to \mathrm{cl}(v_1) \to \mathrm{cl}(v_1) \vee_k u_1 = v_2 \to \cdots$. $v_\tau$ in general not closed; an extra closure fires at each step.

Theorems about the orbit's structure — settling-monotonicity, settling-continuity, regime classification, naturality at quiescence — are stated in terms of the orbit, so the choice of step rule affects which intermediate states are required to satisfy which invariants.

## Resolution candidates

1. **The theorem is authoritative; the definition is the typo.** The merge-then-close formula appears in *proved* statements; the close-then-merge appears only in a definition note and its dependents. Update [settling-endofunctor](../morphisms/settling-endofunctor.md) (and the citing prose) to merge-then-close.
2. **The definition is authoritative; the theorems use a derived shifted form.** Some clean reading where the corpus's "$u_{\tau+1}$" in the theorem is actually the close-then-merge orbit's increment relabeled. Requires checking that the theorem proof goes through with that reinterpretation.
3. **Both are admissible**, with merge-then-close being the orbit-of-cl-algebras presentation and close-then-merge being the raw 2-functor presentation. Some downstream theorem distinguishes them. (Doesn't seem to fit the current corpus state — the regime-classification, cohomology, and moduli machinery doesn't differentiate between these orbits.)

## Surface

[`pypredcalc.dynamics.PredicationSettling`](../../../../../../../tools/math/pypredcalc/src/pypredcalc/dynamics/settling.py) realises the merge-then-close rule, citing the theorem as authoritative and flagging this question. If the resolution turns out to be (2), the implementation will need to swap orderings.
