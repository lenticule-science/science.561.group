---
type: morphism
class: primitive-operator
realizes: [stepping, substrate-state]
depends-on: [stepping, port, substrate-state, predication-settling, increment-sequence, closure-drivenness, settling-endofunctor, settling-coalgebra-structure, step-shift-morphism]
see-also: [admit, settle, witness, stepping-laws]
---

# Step

The substrate's primitive operator for *advancing state by one admitted message*. Step is the substrate-side instance of the math [settling-endofunctor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/settling-endofunctor.md) $F_U$ applied to one admitted increment: it produces the successor [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) $v_{\tau+1}$ from the prior $v_\tau$ via [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md):

$$v_{\tau+1}(p) = \mathrm{cl}^{\mathcal{S}}_p(v_\tau(p) \vee_k u_{\tau+1}(p))$$

Where [admit](admit.md) is the boundary primitive (intake), step is the substrate-observable advancement that admit produces: each admitted port-typed message becomes one entry $u_{\tau+1}$ in the substrate's [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md), regardless of how many internal settlement layers the engine spends processing it.

Step is the unit of substrate-observable change. The substrate's [event log](../objects/event-log.md) accumulates one step per admitted message; the substrate's [stepping](teaching/explanations/stepping.md) discipline binds steps under the counit and coassociativity laws (per [stepping-laws](../theorems/stepping-laws.md)). The substrate-observable family of steps is the structure map $c : \mathcal{E} \to F_U(\mathcal{E})$ of the substrate's [settling-equipped predication hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-coalgebra-structure.md) — the per-history coalgebra structure on the predication fibration. The coalgebra perspective makes precise what the engine's degree of freedom is: the engine schedules iterations of the closure operator within a step, but the coalgebra map is determined by $\mathcal{S}$ and the increment.

Recursive substrates that need to compare step-$n$ and step-$(n+1)$ structure (e.g., engines admitting closure rules whose look-back depth changes across history extensions) inherit the math of the [step-shift morphism](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/step-shift-morphism.md) $\sigma_n^{n+1} : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$. A substrate that admits a step-shift in its rule-system must take its restriction map back from $t' = t \cdot s$ along the step-shift's adjoint, not the simple counit; engines that skip this are non-conformant for variable-look-back rule systems.

## Signature

`step(prior-state, admitted-message, step-context) → (next-state, restriction-map, step-witness)`

Inputs:

- **`prior-state`** — references to the prior valuation $v_\tau$ (the [substrate-state](teaching/explanations/substrate-state.md) at history $t$ before the step is applied).
- **`admitted-message`** — the port-typed message produced by [admit](admit.md), contributing the increment $u_{\tau+1}$.
- **`step-context`** — references to the [closure-rule-system](../objects/closure-rule-system.md) active at this history (which generates $\mathrm{cl}^{\mathcal{S}}$), the [scope-record](../objects/scope-record.md) the message is addressed to, and any [fuel](teaching/explanations/fuel-bound.md) bound on settlement work.

Outputs:

- **`next-state`** — the successor valuation $v_{\tau+1}$ at history $t' = t \cdot s$ where $s$ is the admitted step.
- **`restriction-map`** — the contravariant map $H_{t'} \to H_t$ recovering the prior valuation. Per [morphism-direction-conventions](teaching/explanations/morphism-direction-conventions.md), the restriction map is what makes replay and audit work; per [stepping-laws](../theorems/stepping-laws.md), it satisfies the counit law.
- **`step-witness`** — the [witness](../objects/witness.md) recording the step's effect: prior-state hash, message hash, increment hash, next-state hash, intermediate settlement hashes, fuel consumed.

## Operational semantics

Step proceeds through four phases:

1. **History extension.** The admitted message is added to the substrate's history monoid. Per the [port](teaching/explanations/port.md)'s independence relation, the new history is either a sequential extension (dependent step) or a parallel branch (independent step). The substrate's ordinal advances per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md).
2. **Initial join.** The new fiber starts as $v_\tau \vee_k u_{\tau+1}$ — the prior fiber joined with the message's content (per [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md)). The fiber is *un-settled* at this point.
3. **Settlement.** The substrate's [settle](settle.md) operator runs against the joined fiber, applying $\mathrm{cl}^{\mathcal{S}}$ until quiescence (per [settling-quiescence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md)) or fuel exhaustion. Settlement may apply many closure rules, surface contested predications, and invoke repairs per [repair-catalog](../objects/repair-catalog.md).
4. **Witness emission.** The step's witness is assembled from the message hash, the settlement's witness chain, and the resulting state hash. Per [emit-witness](emit-witness.md), the witness is appended to the event log.

The result is a coherent step: the substrate's settling has advanced by one admitted message, with the witness chain recording the step's contribution to the increment sequence and the closure trajectory.

## Engineering invariants

- **Counit law.** Per [stepping-laws](../theorems/stepping-laws.md), the restriction map composed with the step's effect must give the identity on the prior fiber's content. Stepping forward by $s$ and then restricting back recovers the prior state.
- **Coassociativity.** Two consecutive steps $s_1$ then $s_2$ cohere with their composition. Per [stepping-laws](../theorems/stepping-laws.md), this follows from the closure 2-monad's lax-idempotence and the closure-merge commutation lemma.
- **Witness-emitting.** Every step emits a witness, regardless of whether the message produced an interior change.
- **Per-port-message granularity.** Steps are at the granularity of port messages, not of internal settlement layers. The engine's internal scheduling is a degree of freedom; the step boundary is the substrate's contract.
- **Monotone in $\leq_k$.** Per [closure-driven settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), $v_{\tau+1} \geq_k v_\tau$ in the knowledge order.

## Failure modes

- **Settlement non-termination (fuel exhaustion).** The settlement phase consumes the cited fuel without reaching quiescence. The step's witness records "incomplete settlement"; the next-state contains un-settled predications. For non-Scott-continuous-regime substrates, fuel-exhaustion is expected at non-Scott-continuous firing ordinals.
- **Hard contradiction.** The settlement surfaces a contested predication whose [repair-catalog](../objects/repair-catalog.md) entry classifies it as `unrepairable`. The step's witness records the contradiction; the substrate's caller must intervene.
- **Constraint violation under repair.** A pre-commit [constraint-record](../objects/constraint-record.md) check fails after settlement. Per the constraint's severity, the step is either rejected (rolled back via the restriction map) or admitted with a repair ticket.
- **Independence violation.** Two declared-independent messages produce non-commuting effects — a substrate-correctness violation per [independence-implies-confluence](../theorems/independence-implies-confluence.md). The substrate halts and surfaces the violation for diagnosis.

## Position in the substrate

Step is the substrate's *change unit* and the substrate-side instance of the math settling-endofunctor's iteration. Per [substrate-anatomy-as-four-components](teaching/explanations/substrate-anatomy-as-four-components.md), step is the boundary's connection to the engine and the store: the boundary admits a message contributing to $U$, the engine settles via $\mathrm{cl}^{\mathcal{S}}$, the store records the new $v_{\tau+1}$. Per [stepping-laws](../theorems/stepping-laws.md), the laws step satisfies are what make replay and audit trail-able.

The pattern composes with [admit](admit.md), [settle](settle.md), [emit-witness](emit-witness.md), and [event-log](../objects/event-log.md).
