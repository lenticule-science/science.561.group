---
type: theorem
class: computational
status: sketch
depends-on: [dispatch, capability-fiber-bundle, four-regime-dichotomy, post-closure-adjunction-restriction, twist-product-residuation, predication-fiber-algebra]
see-also: [dispatch-monotonicity, regime-of-task, dispatch-readiness]
---

# Dispatch-readiness computation is a strict-regime settling

**Claim.** For any task $T$ with a *finite* required-capability index $C$ ($|C| < \omega$) and any agent $A$ with a post-closure capability section $\sigma_A : C \to \{\mathbf{t}, \mathbf{f}, \top\}$, the computation of dispatch readiness

$$\delta(A, T) \;=\; \bigwedge_{c \in C}^{(t)} \bigl(\rho_T(c) \Rightarrow \sigma_A(c)\bigr)$$

is a [strict-regime](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) settling with closure ordinal at most $|C|$.

**Corollary.** Dispatch decisions over any finite capability taxonomy are computable in bounded time, regardless of the overall regime of the surrounding operations settling.

## Why this holds

The dispatch morphism $\delta(A, T)$ is a pointwise application of [twist-product residuation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md) $\Rightarrow$ over the capability index $C$, followed by a truth-order meet $\bigwedge^{(t)}$ over $|C|$ values.
Each step references a bounded, finite collection of cells:

1. **Pointwise residuation is a finite closure rule.** At each capability $c \in C$, the residuation $\rho_T(c) \Rightarrow \sigma_A(c)$ is a closed-form computation over two substrate values.
  Its antecedent references exactly two cells — the task's required-capability cell for $c$ and the agent's provided-capability cell for $c$ — and its consequent is a single derived value.
  This is a finite-antecedent closure rule.

2. **The capability index is finite.** $|C| < \omega$ by hypothesis.
  The dispatch computation's closure-rule subsystem $\mathcal{S}_\delta$ has exactly $|C|$ residuation rules plus one truth-order meet rule. $\mathcal{S}_\delta$ is a finite closure-rule system over a finite entity set (the $|C|$ capabilities plus the agent and task entities).

3. **Strict-regime equivalence applies.** By the [four-regime dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), a settling over a finite base ($\mathbf{L}$ finite — $\mathbf{FOUR}$; $E$ finite — $\{A\} \cup \{T\} \cup C$; $\mathcal{C}$ finite — the capability predicate category restricted to $C$) has closure ordinal $\kappa < \omega$.
  The dispatch computation's settling is exactly such a system.
  The closure ordinal is at most $|C|$ (one firing per capability index, plus one meet-firing) — hence strictly finite.

4. **Post-closure restriction is compatible.** By the [post-closure bilattice closure theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/post-closure-adjunction-restriction.md), the dispatch morphism is computed on post-closure capability sections ($\sigma_A$ values already settled to $\{\mathbf{t}, \mathbf{f}, \top\}$, with $\bot$ absent).
  The restricted value domain is finite; no new settling steps beyond $|C|$ are needed. $\square$

## Operational content

The theorem establishes that dispatch-readiness computation is always in the strict regime, *irrespective of the surrounding operations settling's regime*.
A platform whose operations settling is in the Scott-continuous, transfinite-bounded, or aperiodic regime (due to task-lifecycle rules or function-pursuing closure rules) still has its dispatch readiness computed in finitely many steps at each dispatch event.
Dispatch does not inherit the surrounding settling's regime; it operates in its own strict-regime subcomputation.

This is the computational content of what the [dispatch morphism](../morphisms/dispatch.md) calls the "capability-completeness" requirement: before dispatch fires, the agent's capability section must be settled to post-closure values ($\bot$ driven out).
Once the precondition holds, the dispatch readiness computation terminates in $\leq |C|$ steps.

## Scope: finite capability index

The strict-regime bound holds for *finite* capability taxonomies.
A platform with a countably-infinite capability index $C$ (e.g., a dynamically extensible capability lattice where new predicates are added as skills are learned) has dispatch computations governed by the Scott-continuous regime ($\kappa = \omega$): the truth-order meet over countably many pointwise residuations settles at the $\omega$-limit.
In that setting, dispatch readiness "in the limit" means that readiness is determined once the capability section has stabilized across all countably many capabilities — a well-defined but $\omega$-stage computation.

For all standard work-vocabulary dispatch scenarios — finite skill taxonomies, finite authority structures, finite capability certificates — the finite-index hypothesis holds and the theorem applies.

## CALM and coordination-free dispatch-readiness queries

By the [predication-settling CALM corollary](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md), all $\leq_k$-monotone queries are coordination-free.
The dispatch-readiness value $\delta(A, T)$ is $\leq_k$-monotone: once it reaches $\mathbf{t}$ (the agent is fully ready to take the task), settling-monotonicity ensures it stays at $\mathbf{t}$.
The query "is $A$ ready to dispatch $T$?" is therefore coordination-free — any replica with a local snapshot of the capability cells can compute the answer.

Precision: the *positive* dispatch-readiness query ("is $\delta(A, T) = \mathbf{t}$?") is coordination-free.
The *negative* query ("is $\delta(A, T) = \mathbf{f}$?", "is $A$ *not* ready?") is not $\leq_k$-monotone and requires coordination — confirming incapability means confirming the absence of positive capability evidence, which is anti-monotone.

In distributed operations where event logs are replicated across multiple nodes, each node can locally confirm that a dispatch event is valid (the dispatch-readiness cell is at $\mathbf{t}$) without round-tripping to a central authority.
This is the computational basis for eventually-consistent dispatch: readiness confirmation is decentralizable.

## Dispatch readiness as a global section of the settling internal Hom

The [settling internal Hom](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-internal-hom.md) $\mathcal{H}om_{\mathrm{settle}}(v^A, v^T)$ between the agent's capability settling $v^A$ and the task's requirement settling $v^T$ is the settling whose value at each capability cell $c$ is the bilattice-valued implication strength from $v^A(c)$ to $v^T(c)$.

The dispatch readiness value $\delta(A, T)$ is precisely the *truth-order global section* of this internal Hom, restricted to the capability index $C$:

$$\delta(A, T) \;=\; \Gamma_{\mathbf{t}}\bigl(\mathcal{H}om_{\mathrm{settle}}(v^A|_C, v^T|_C)\bigr) \;=\; \bigwedge_{c \in C}^{(t)} \mathcal{H}om_{\mathrm{settle}}(v^A, v^T)(c)$$

where $\Gamma_{\mathbf{t}}$ is the functor taking the truth-order global section (the truth-order meet of all cell values).
The dispatch-readiness formula $\delta(A,T) = \bigwedge_c^{(t)} (\rho_T(c) \Rightarrow \sigma_A(c))$ is the explicit computation of $\Gamma_{\mathbf{t}}(\mathcal{H}om_{\mathrm{settle}})$ on the capability restriction.

This framing gives dispatch readiness an internal meaning in the settling category: readiness is the *extent to which the agent's capability settling globally implies the task's requirement settling*, measured in the truth order.
An agent is dispatch-ready iff the internal Hom has a $\mathbf{t}$-valued global section.
An agent is partially ready iff the global section takes $\bot$-values on some capabilities (not yet evidenced) or $\mathbf{f}$-values on some (actively lacking).

The internal Hom framing also shows why dispatch readiness is strict-regime: $\mathcal{H}om_{\mathrm{settle}}(v^A|_C, v^T|_C)$ is itself a settling over a finite base (the capability index $C$), and its global section is a finite-step computation.
The strict regime of dispatch readiness is a consequence of the internal Hom's regime being determined by the base's cardinality — finite by the capability-index hypothesis.

## Relationship to the overall dispatch regime

The [dispatch-as-closure-rule-system theorem](../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-as-closure-rule-system.md) (AOP) establishes that the *dispatch table* — the full rule system governing which agent receives which work — inherits the surrounding substrate's regime.
This theorem is compatible with that result but addresses a different object: not the dispatch table but the *dispatch-readiness computation* for a single $(A, T)$ pair.
The dispatch table may be in a non-strict regime (e.g., if dispatch policies quantify over an infinite agent population); individual dispatch-readiness valuations are always strict-regime over a finite capability index.
