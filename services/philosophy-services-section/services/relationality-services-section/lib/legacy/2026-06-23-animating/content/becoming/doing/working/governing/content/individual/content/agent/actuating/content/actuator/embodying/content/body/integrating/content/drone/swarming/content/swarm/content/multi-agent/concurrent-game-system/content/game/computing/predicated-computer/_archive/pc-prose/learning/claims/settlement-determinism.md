---
type: theorem
class: engineering-claim
depends-on: [settling-as-computation, source-of-truth, determinism, predication-settling, closure-2-monad, closure-2-monad-lax-idempotence, increment-sequence, predication-fiber-algebra, settling-monotonicity]
---

# Settlement is deterministic given event log and closure-rule system

**Claim.** Two predication substrates with the same event log and the same closure-rule system $\mathcal{S}$ produce the same [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) — equal as indexed families of valuations $(v_\tau)_{\tau<\lambda}$, cellwise in every fiber $A_p$. The substrate's settled content is a deterministic function of `(event log, closure-rule system)`. There is no role for runtime nondeterminism — host scheduling, network ordering, parallel execution, host-time reads — in determining settled content.

Byte-identity of the serialized state follows when canonical-form hashing per [hash-discipline](teaching/explanations/hash-discipline.md) is applied; the determinism claim itself is about *value equality in the fiber algebra*.

## Why this holds

The argument has three parts. Each is the engineering register of a structural property of the closure 2-monad and the predication settling it generates.

**Part 1: The event log determines the increment sequence.** Per [source-of-truth](teaching/explanations/source-of-truth.md), the event log is the authoritative record of admitted messages. Per [reification](teaching/explanations/reification.md), every event is a content-addressed reified message; per [hash-discipline](teaching/explanations/hash-discipline.md), reducers operate on canonical-form content. Per [read-discipline](teaching/explanations/read-discipline.md), reducers do not branch on substrate content outside the event payload. Two runtimes processing the same log apply the same events through the same pure reducers and produce the same [increment sequence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) $U = (u_\tau)$ — the $\mathcal{C}$-natural family of valuations representing what the world told this substrate.

**Part 2: The closure-rule system determines the closure operator.** Per [closure-rule-system](../objects/closure-rule-system.md) and the math counterpart [closure-rule-system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md), the closure-rule system $\mathcal{S}$ generates a unique closure operator $\mathrm{cl}^{\mathcal{S}}$ — the least operator satisfying inflationarity, idempotence, and every rule's consequent whenever its antecedent holds. By [closure 2-monad lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) (Kelly–Lack K1/K2), being a $\mathrm{Cl}^{\mathcal{S}}$-algebra is a *property* of a fibration, not extra data: there is at most one $\mathrm{Cl}^{\mathcal{S}}$-algebra structure on any given fibration, up to unique iso. So "the closure of this state" is unambiguously determined by $\mathcal{S}$ alone — no runtime choice can influence it.

**Part 3: The settling family is determined by $(U, \mathcal{S}, v_0)$.** Per [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md), the settling's successor steps are $v_{\tau+1}(p) = \mathrm{cl}_p^{\mathcal{S}}(v_\tau(p) \vee_k u_{\tau+1}(p))$, and per [settling-continuity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-continuity.md), limit-step values are determined as the cellwise $\leq_k$-join of preceding values. The successor formula and the limit-formula together are deterministic functions: given the same $v_0$, the same $U$, and the same $\mathrm{cl}^{\mathcal{S}}$, the entire settling family $(v_\tau)_{\tau<\lambda}$ is determined.

Combining the three: the event log determines $U$ (Part 1), the closure-rule system determines $\mathrm{cl}^{\mathcal{S}}$ (Part 2), and $(U, \mathrm{cl}^{\mathcal{S}}, v_0)$ together determine the settling (Part 3). The settled state is therefore a function of `(event log, closure-rule system)` alone, with $v_0$ fixed by the substrate's bootstrap convention.

## Engineering consequence

A substrate's audit covers everything that affects its settled state: the event log carries every admitted message, and the closure-rule system is itself substrate content per [self-representation](teaching/explanations/self-representation.md). Reasoning about the substrate's behavior at any past moment is reading past substrate state. Per [driver-as-thin-pump](teaching/explanations/driver-as-thin-pump.md), the runtime's role is reduced to plumbing; the substrate's behavior does not depend on which runtime processed the events.

This makes the substrate *replicable* (per [replication](teaching/explanations/replication.md) and [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md)): two substrates whose event logs converge — through normal sync, through federation merge, through replica catch-up — settle to the same state. The CRDT-style convergence of [federation-convergence](federation-convergence.md) is operative *because* settlement is deterministic; without determinism, convergence at the value-domain layer would not lift to convergence at the substrate-content layer.

## What the theorem rules out

A substrate operation whose effect depends on runtime conditions outside `(event log, closure-rule system)` is a violation:

- A reducer that reads host time and uses the time to make decisions has introduced runtime nondeterminism. The right structure is to put time as a predication on the event itself, so that the reducer reads time from the event payload rather than from the host runtime.
- A reducer that branches on substrate content has violated [read-discipline](teaching/explanations/read-discipline.md); the conditional belongs in a closure rule, where it becomes part of the deterministic closure operator generated by $\mathcal{S}$.
- A reducer that depends on host-level resources (file system state outside the substrate, network availability, OS-level identifiers) has introduced runtime dependence. The substrate's response is to ingest such resources as substrate content (through [interfacers](teaching/explanations/interfacer.md)) so that the reducer reads from substrate content rather than from the host.
- A closure rule that fails $\mathcal{C}$-naturality (axiom 4 of [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md)) breaks Part 2: the generated operator is not the unique $\mathrm{Cl}^{\mathcal{S}}$-algebra structure, so two substrates with the same $\mathcal{S}$ may settle differently. The corpus admits only $\mathcal{C}$-natural rules.

## What the theorem requires

- The substrate's value-domain is a [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) (CAI join, bilattice operations, $\mathcal{C}$-natural reindexing).
- Reducers are pure functions of `(working model, event, context)` where context contains only substrate-resident content.
- The closure-rule system's rules are positive-$\Pi_1$ over the inherited signature, per [closure-rule](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md), so the generated closure operator exists and is unique.
- The substrate's elision pass (per [source-of-truth](teaching/explanations/source-of-truth.md)) is itself deterministic.
- The substrate's bootstrap convention fixes the initial valuation $v_0$ deterministically (per [bootstrap](teaching/explanations/bootstrap.md)).
