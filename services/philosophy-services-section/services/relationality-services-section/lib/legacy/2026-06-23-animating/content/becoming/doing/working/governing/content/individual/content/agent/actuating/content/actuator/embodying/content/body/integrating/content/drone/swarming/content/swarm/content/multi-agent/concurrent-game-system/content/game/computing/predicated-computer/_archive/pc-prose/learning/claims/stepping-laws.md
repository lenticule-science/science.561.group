---
type: theorem
class: engineering-claim
status: proved
depends-on: [stepping, port, substrate-state, predication-settling, settling-monotonicity, settling-continuity, closure-2-monad, closure-2-monad-lax-idempotence, closure-driven-settling-monotonicity, closure-monad-no-non-trivial-periodic-orbits]
see-also: [step, settlement-determinism, four-regime-dichotomy]
---

# Stepping satisfies counit and coassociativity

**Claim.** Every conformant substrate's stepping discipline satisfies two laws:

1. **Counit law.** For any step $s$ advancing history $t$ to $t' = t \cdot s$, the restriction map $\rho : H_{t'} \to H_t$ produced by the step composes with the step's effect to give the identity on the prior fiber's content. Stepping forward and then restricting back recovers the prior state exactly.

2. **Coassociativity law.** For any two consecutive steps $s_1$ and $s_2$ from history $t$ through $t \cdot s_1$ to $t \cdot s_1 \cdot s_2$, applying $s_1$ then $s_2$ produces the same indexed-family-of-fibers as applying their composition $s_1 \cdot s_2$ in one go.

The two laws together are the substrate's *coalgebra discipline* on top of the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md). The substrate's [substrate-state](teaching/explanations/substrate-state.md) is the underlying carrier — concretely, a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) $(v_\tau)_{\tau < \lambda}$ — and the [stepping](teaching/explanations/stepping.md) family is its structure map; the laws are what make history a coherent advance of that settling.

## Why this holds

The argument has two parts, each of which is the engineering register of a math fact about the closure 2-monad and the predication settling.

**Part 1: Counit law follows from the predication-settling's indexed-family structure.** Per [substrate-state](teaching/explanations/substrate-state.md), the substrate carries the entire indexed family of [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over its history index — exactly the data of a predication settling $(v_\tau)$ in the math sense. Per [event-log](../objects/event-log.md), the family is materialized as an append-only sequence whose entries are the [witnesses](../objects/witness.md) of successive steps, and each witness records the increment $u_{\tau+1}$ joined into the prior state.

When a step $s$ advances history $t$ to $t' = t \cdot s$, the new fiber $H_{t'}$ is constructed per [closure-driven settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md) as $\mathrm{cl}_p(v_t \vee_k u_{t+1})$ — closure of the prior state joined with the new increment. Because the substrate records the increment $u_{t+1}$ separately (via the witness), and because closure is *inflationary* (axiom 2 of [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md)), the restriction map $\rho : H_{t'} \to H_t$ is well-defined: removing the increment recovers the join-input, and the prior closed state $v_t$ is by inflationarity below $H_{t'}$. Per [hash-discipline](teaching/explanations/hash-discipline.md), the canonical-form hash of the restricted result equals the canonical-form hash of $v_t$ — the recovery is byte-identical.

The counit law is thus a structural consequence of the substrate carrying the *settling family* (with explicit increments) rather than the cumulative state alone. A substrate that overwrote prior content during stepping would violate [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) and break replay.

**Part 2: Coassociativity follows from the closure 2-monad's lax-idempotence.** Per [port](teaching/explanations/port.md), the substrate's history is a monoid over the port's step alphabet, modulo the port's independence relation $I$. Two consecutive steps $s_1, s_2$ admitted from history $t$ produce history $t \cdot s_1 \cdot s_2$. The new fiber is

$$H_{t \cdot s_1 \cdot s_2} \;=\; \mathrm{cl}_p\!\left(\mathrm{cl}_p(v_t \vee_k u_{s_1}) \vee_k u_{s_2}\right) \;=\; \mathrm{cl}_p\!\left(v_t \vee_k u_{s_1} \vee_k u_{s_2}\right)$$

by the closure-merge commutation lemma (the same lemma that powers [crdt-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md)). The right-hand side is exactly what one gets by admitting $s_1 \cdot s_2$ as a single composed step. So whether the substrate processes $s_1$ and $s_2$ as two steps or as one composed step does not change the final fiber's value or its canonical-form hash.

The 2-categorical content: the [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) is [lax-idempotent](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) (Kelly–Lack K1), so the multiplication $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$ is structural rather than free data. This is what guarantees that "two closures composed equal one closure" without additional axiomatic fiat — coassociativity is a property of the substrate, not an extra rule the engine has to enforce.

## Stepping has no oscillation

A consequence of the same lax-idempotence: the closure 2-monad has no non-trivial periodic orbits (per [closure-monad-no-non-trivial-periodic-orbits](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-monad-no-non-trivial-periodic-orbits.md)). Iterating the stepping family from any state produces a $\leq_k$-monotone chain that converges to a fixed point — never an oscillation, never a periodic orbit of period $\geq 2$. The substrate's stepping is structurally a fixed-point dynamics, not a dynamical-systems-style trajectory: the engine never has to "wait for the cycle to close" because there are no cycles.

This is the engineering content of "stepping always settles": the rule out is structural, not implementation-dependent.

## Engineering consequence

The two laws are why the substrate's *replay* is well-defined: the event log can be processed step-by-step or in batches without changing the resulting state. The substrate's [audit-stack](teaching/explanations/substrate-as-stack-composition.md) discipline relies on this — an auditor can verify any segment of the event log without re-running the full history before it.

The laws are also why the substrate's *batched admission* is safe: a substrate that receives multiple messages and admits them as a single step (per [admit](../morphisms/admit.md)) produces the same state as admitting them one-by-one. The engine's internal batching is a degree of freedom because of coassociativity.

The laws together let the substrate's stepping be implemented as a coalgebra structure map without the implementation having to verify fixed-point stability, since the math forecloses oscillation.

## Regime dependence

The two laws hold in all four regimes of the [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), but the *granularity* of stepping admissible to an engine differs:

- **Strict and Scott-continuous regimes.** Steps are at finite ordinals; the stepping-monoid's history is well-ordered as $\omega$ or below. Each step's increment is finitary; closure terminates in $\omega$ or fewer applications.
- **Transfinite-bounded and aperiodic regimes.** Steps may live at non-Scott-continuous firing ordinals (per [non-Scott-continuous-firing-ordinal](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/non-scott-continuous-firing-ordinal.md)). At such ordinals, a single "step" admits a $\forall$-block antecedent's worth of content all at once (the limit-jump). The counit and coassociativity laws hold across these limit-steps by [settling-continuity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-continuity.md), but the engine implementing such a substrate must record limit-step witnesses with sufficient detail to recover the full firing-ordinal pattern (per the regime hypotheses of [federation-convergence](federation-convergence.md)).

## What the theorem rules out

A substrate that violates these laws is *not* a conforming predicated computer:

- A substrate whose stepping silently overwrites prior content violates the counit law and settling-monotonicity. Replay would not reproduce earlier states; the substrate's audit chain breaks.
- A substrate whose stepping interacts with internal scheduling (the result of $s_1$ then $s_2$ depends on whether the engine ran them serially or in parallel) violates coassociativity, because it violates the closure operator's $\mathcal{C}$-naturality or its idempotence. The substrate's state is then not a function of admitted messages alone.
- A substrate whose history-extension is not associative has a non-monoidal history; the [event log](../objects/event-log.md)'s sequence semantics are then incoherent.
- A substrate whose stepping admits content non-monotonically (a step that *removes* knowledge from a cell rather than raising it in $\leq_k$) is not closure-driven and has no settling structure in the math sense; the laws don't apply because the prerequisites don't.

## What the theorem requires

- The substrate's history is a monoid over the port's step alphabet (per [port](teaching/explanations/port.md)).
- The substrate's state is a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) — the indexed family of fibers, not just the latest fiber (per [substrate-state](teaching/explanations/substrate-state.md)).
- Stepping is closure-driven: each step has the form $v_{\tau+1} = \mathrm{cl}_p(v_\tau \vee_k u_{\tau+1})$ for some increment $u_{\tau+1}$ (per [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md)).
- The closure operator satisfies the four axioms (monotone in $\leq_k$, inflationary, idempotent, $\mathcal{C}$-natural).
- Each step records its incremental content (the message admitted plus the settlement that followed) per [witness](../objects/witness.md) and [emit-witness](../morphisms/emit-witness.md).
- For substrates in the non-Scott-continuous regimes, witnesses at limit ordinals record sufficient detail to recover the firing pattern.
