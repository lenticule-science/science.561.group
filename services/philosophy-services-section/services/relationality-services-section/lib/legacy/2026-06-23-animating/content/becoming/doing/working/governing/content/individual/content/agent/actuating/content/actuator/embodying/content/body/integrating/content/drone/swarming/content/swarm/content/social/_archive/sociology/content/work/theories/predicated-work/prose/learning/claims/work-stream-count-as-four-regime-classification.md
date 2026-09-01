---
type: theorem
class: regime-instantiation
status: draft
symbol: "\\mathrm{Regime}(v^{\\mathrm{caus}}_{\\mathrm{op}})"
depends-on: [operations-causal-settling, operations-base, operations-settling]
realizes: [four-regime-dichotomy, aperiodic-regime-classification]
---

# Work-stream count as four-regime classification

The [operations causal settling](../objects/operations-causal-settling.md)'s **work-stream count** — the number of connected components in the apex-of-void invariant $H^0_{\mathrm{apex of Void}}(v^{\mathrm{caus}}_{\mathrm{op}})$ — sits inside the corpus's [four-regime dichotomy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md).
Each of the four regimes — strict, Scott-continuous, transfinite-bounded, aperiodic — corresponds to a distinct operational stratum of how an organization's work-streams behave under closure dynamics:

| Regime | Closure ordinal $\kappa$ | Operational reading |
|---|---|---|
| **Strict** | $\kappa < \omega$ | Finite, fully decidable work-stream graph; auditable in finite time |
| **Scott-continuous** | $\kappa = \omega$ | Work-stream graph reachable as directed colimit of finite stages (countable when $|E_{\mathrm{ev}}| \leq \aleph_0$) |
| **Transfinite-bounded** | $\omega < \kappa < \omega_1$ | Work-stream graph requires non-Scott-continuous closure firings; "discontinuities" in causal acquisition |
| **Aperiodic** | $\kappa \geq \omega_1$ | Work-stream graph is not capturable in countable closure stages; full Anderson-Putnam direct-limit invariant required |

The classification is not a pedagogical taxonomy but a substrate-algebraic fact: the operational characteristics of a working community — auditability, predictability, parallelism budget, integration tractability — are determined by which regime its operations causal settling sits in, and the regime is invariant under every self-symmetry in $\mathrm{Aut}^\simeq(v^{\mathrm{op}})$ — cosmetic and substantive alike — per [restructure-as-visible-automorphism](restructure-as-visible-automorphism.md).
Only non-automorphism transformations (those that fail to stabilize $v^{\mathrm{op}}$) can change the regime.

## Statement

**Theorem (operations-causal regime classification).** *Let $v^{\mathrm{caus}}_{\mathrm{op}}$ be an [operations causal settling](../objects/operations-causal-settling.md) on dispatch-event set $E_{\mathrm{ev}}$ with direct-enablement seed $\prec_0$.
Let $\kappa(v^{\mathrm{caus}}_{\mathrm{op}})$ be its closure ordinal — the least ordinal at which the transitive closure stabilizes.
Then:*

1. *(Strict regime, $\kappa < \omega$.)
  The settling closes in finitely many transitive-closure steps.
  The work-stream count $H^0_{\mathrm{apex of Void}}$ is finite and computable.
  The longest causal chain in $\prec_0$ has length at most $\kappa$.
  Operationally: the work-stream structure is auditable in finite time and the apex/void cohomology is finitely presented.*

2. *(Scott-continuous regime, $\kappa = \omega$.)
  Every cell that becomes $\mathbf{t}$ does so at some finite stage and the $\omega$-supremum is the full causal order.
  The number of transitive-closure firings, the work-stream count, and the size of $H^1$ are bounded above by the cardinality of $E_{\mathrm{ev}}^2$; when $|E_{\mathrm{ev}}| \leq \aleph_0$ they are countable, but the regime classification itself does not require countability of the event base.
  The apex cohomology $H^1$ is the directed colimit of finite-stage cohomologies.
  Operationally: long-running work systems with bounded look-back depth at each stage but no global finite bound.*

3. *(Transfinite-bounded regime, $\omega < \kappa < \omega_1$.)
  The settling requires non-Scott-continuous closure firings — there exist pairs $(e_1, e_2)$ that become causally connected only at a stage $\tau > \omega$ that is not the supremum of any countable cofinal chain of finite-stage causal-precedence facts.
  By [aperiodic-regime-cohomology-via-direct-limit](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-cohomology-via-direct-limit.md)'s sub-aperiodic case, the apex cohomology has discontinuity-generators at each non-Scott-continuous firing.
  Operationally: integration events that depend on closure-stable patterns *across* extended operational time, where the dependency cannot be decomposed into a countable chain of finite-stage prerequisites.*

4. *(Aperiodic regime, $\kappa \geq \omega_1$.)
  The settling's closure ordinal is at least $\omega_1$.
  The full [Anderson–Putnam classifying invariant](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/aperiodic-classifying-invariant.md) is required to characterize the work-stream structure; the apex cohomology has uncountably-many generators in the absence of additional constraints.
  Operationally: working systems whose causal structure is not capturable by any countable specification — the structural-complexity ceiling for an organizational design.*

5. *(Automorphism invariance.)
  The regime $\mathrm{Regime}(v^{\mathrm{caus}}_{\mathrm{op}})$ is invariant under every $\phi \in \mathrm{Aut}^\simeq(v^{\mathrm{op}})$ — both cosmetic ($\phi \in N(v^{\mathrm{op}})$) and substantive ($\phi$ non-trivial in $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$).
  Regime change requires a transformation outside $\mathrm{Aut}^\simeq(v^{\mathrm{op}})$ — a non-automorphism that fails to stabilize $v^{\mathrm{op}}$.*

## Sketch

The four-regime dichotomy of the cited theorem applies to any settling whose closure operator is monotone and whose underlying value-bilattice is the four-valued $\mathbf{FOUR}$ (or its Boolean restriction).
The operations causal settling per [operations-causal-settling](../objects/operations-causal-settling.md) is a Boolean-valued settling with closure operator $T_{\mathrm{caus}}(v)(e_1, e_3) := v(e_1, e_3) \vee \exists e_2 .
[v(e_1, e_2) \wedge v(e_2, e_3)]$ — monotone in the bilattice's information order.
The four-regime dichotomy classifies it.

The regime is determined by $\kappa(v^{\mathrm{caus}}_{\mathrm{op}})$, which by the cited theorem is the least ordinal at which transitive-closure firings cease to produce new $\mathbf{t}$-cells.
Each of the four ordinal-range cases corresponds to a regime as enumerated above. $\square$

## Operational characterization per regime

The four regimes have qualitatively distinct operational characteristics:

### Strict regime ($\kappa < \omega$): the auditable organization

A working community whose operations causal settling is in the strict regime has a **finite causal-precedence depth**: there is a fixed $\kappa$ such that no causal chain in $\prec_0$ exceeds length $\kappa$.
Equivalently: every dispatch event has a bounded operational past.

Operational features:

- **Auditability is decidable in finite time.** Every causal-precedence question $e_1 \preceq_{\mathrm{op}} e_2$? is answerable by a bounded transitive-closure search.
- **Work-stream count is computable.** The connected-component analysis of $H^0_{\mathrm{apex of Void}}$ terminates.
- **Parallelism budget is precisely measurable.** The void cone's cardinality is finite and exactly enumerated.
- **No long-tail dependencies.** No event's enablement chain extends beyond $\kappa$ steps.

This is the regime of small project-based teams, well-scoped sprints, and bounded-engagement contracts.
The strict-regime constraint is what makes such organizations *plannable*: the planning horizon is bounded by $\kappa$.

### Scott-continuous regime ($\kappa = \omega$): the long-running auditable organization

A working community in the Scott-continuous regime has **unbounded but finite-stage-reachable causal depth**: there is no fixed $\kappa < \omega$ that bounds all chains, but every causal-precedence fact is reachable at some finite stage.
(When $|E_{\mathrm{ev}}| \leq \aleph_0$ the depth is also countable; the regime classification itself does not require this.)

Operational features:

- **Auditability is recursively enumerable, not decidable** *(when $|E_{\mathrm{ev}}|$ is countable)*.
  A specific causal-precedence question is answerable in finite time by enumerating finite-stage closures, but the *full* answer to "what is the complete work-stream count" requires the $\omega$-supremum.
  With uncountable $E_{\mathrm{ev}}$ the recursive-enumerability framing fails, but the directed-colimit structure of $H^1$ at $\kappa = \omega$ remains.
- **Work-stream structure stabilizes in the limit.** Each finite-stage approximation of the work-stream count is well-defined; the full work-stream count is the directed colimit and equals the supremum of stage-wise counts.
- **Long-tail dependencies are bounded by $\omega$.** Every dependency chain has finite length, but the lengths are unbounded across chains.

This is the regime of long-running organizations with bounded per-event look-back: monthly-cycle businesses, established institutions with decades of operations but no cell-pattern requiring transfinite closure to settle.
The Scott-continuous regime is the **upper bound for organizations describable in terms of finite-stage reasoning**.

### Transfinite-bounded regime ($\omega < \kappa < \omega_1$): the integration-discontinuity organization

A working community in the transfinite-bounded regime has **non-Scott-continuous closure firings** — pairs of events whose causal connection requires closure at a stage past $\omega$, with that connection not being the supremum of any countable cofinal chain of finite-stage facts.

Operational features:

- **Auditability requires transfinite reasoning.** Some causal-precedence questions cannot be answered by finite-stage enumeration; they require reasoning at limit stages.
- **Integration events with discontinuity character.** The most operationally salient phenomenon: an integration event (e.g., a quarterly close, an annual reconciliation, a multi-year project's final integration test) that depends on a *closure-stable pattern* of prior events rather than on any finite set of them.
  The pattern itself is the antecedent; closure firings at limit stages are required to recognize the pattern.
- **Apex cohomology has discontinuity generators.** Each non-Scott-continuous firing contributes a generator to $H^1$ that does not appear in any finite-stage approximation.
- **Cadence-boundary integration is the typical instance.** Per [cadence-as-step-shift-rg-flow](cadence-as-step-shift-rg-flow.md), each cadence-level boundary may produce a non-Scott-continuous firing if the higher-cadence content requires the lower-cadence pattern to be closure-stable rather than merely finitely-witnessed.
  Quarterly closes that depend on "the trend over the quarter, not specific weeks" sit here.

This is the regime of organizations whose integration events are *pattern-dependent* rather than *event-list-dependent*.
Practitioners encounter this as "you can't reduce the quarterly review to a list of weekly summaries — you have to look at the shape of the quarter."

### Aperiodic regime ($\kappa \geq \omega_1$): the full-complexity organization

A working community in the aperiodic regime has a **causal-precedence structure not capturable in countable closure stages**.
Per [aperiodic-regime-classification](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-classification.md), the full Anderson-Putnam direct-limit invariant is required.

Operational features:

- **No countable specification suffices.** The work-stream structure cannot be characterized by any countable list of facts; every countable approximation misses some causal-precedence content.
- **Integration events depend on uncountably-many prior pattern-classes.** An aperiodic-regime integration is one whose closure-stable pattern is itself uncountable in some essential way — most cleanly when the organization's closure rules generate aperiodic substitution dynamics on its cell content.
- **Cohomology generators are uncountable.** $H^1$ has uncountably-many generators in the absence of additional constraints (per the cited cohomology-via-direct-limit theorem).
- **The structural-complexity ceiling.** No higher regime exists in the four-regime dichotomy.
  An organization whose operations causal settling is aperiodic has reached the structural ceiling that the corpus's regime taxonomy recognizes.

This regime is operationally exotic.
The cited corpus question [aperiodic-regime-concrete-instances](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/questions/aperiodic-regime-concrete-instances.md) marks concrete instances as open.
Whether any actual organization realizes the aperiodic regime — or whether the regime is only attained in idealized substitution-dynamics models — is open.
Civilizational-scale institutions, multi-millennium religious traditions, and other deeply-recursive cultural formations are *candidates* for aperiodic regime but not established as such.

## Regime is an automorphism invariant

By [restructure-as-visible-automorphism](restructure-as-visible-automorphism.md), every restructuring in $\mathrm{Aut}^\simeq(v^{\mathrm{op}})$ — *whether cosmetic (in $N(v^{\mathrm{op}})$) or substantive (non-trivial in $\mathrm{Aut}^{\mathrm{vis}}(v^{\mathrm{op}})$)* — stabilizes $v^{\mathrm{op}}$ by definition.
Since the closure dynamics on the operations causal settling depend only on the cell-pattern of $v^{\mathrm{op}}$, and the closure ordinal $\kappa(v^{\mathrm{caus}}_{\mathrm{op}})$ is a numerical invariant of those dynamics, **the regime is preserved by every restructuring in $\mathrm{Aut}^\simeq(v^{\mathrm{op}})$, cosmetic and substantive alike**.
The cosmetic/substantive distinction concerns the action on the settling-associated sheaf and on the cohomological signature; it does not concern $\kappa$, which is indifferent to that distinction.

Regime change therefore requires a third stratum, parallel to the regime-changing stratum of [charter-amendment-as-visible-automorphism](theories/predicated-governance/theorems/charter-amendment-as-visible-automorphism.md): a transformation that **does not stabilize $v^{\mathrm{op}}$**, hence sits outside $\mathrm{Aut}^\simeq(v^{\mathrm{op}})$ entirely.
Such transformations are not self-symmetries of the operations settling; they produce a different settling whose regime may be computed independently.
Two natural classes:

- **Regime-lowering (consolidation that removes a chain).** A consolidation that identifies two operationally-distinct work-streams' event sets into one — *and that fails to satisfy $v^{\mathrm{op}}_\tau \circ (\pi_E \times \pi_E) = g \cdot v^{\mathrm{op}}_\tau$ stagewise on the consolidated cells* — produces a new operations settling $v^{\mathrm{op}}_{\mathrm{new}}$ in which causal chains crossing the prior work-stream boundary may be shorter than in $v^{\mathrm{op}}$.
  The regime of $v^{\mathrm{op}}_{\mathrm{new}}$ may be lower than that of $v^{\mathrm{op}}$.
- **Regime-raising (decoupling that introduces chain length).** Decoupling a previously-coupled work-stream into two independent sub-systems by splitting an entity (again, a non-stabilizing transformation) produces a $v^{\mathrm{op}}_{\mathrm{new}}$ whose void cone is larger and whose chain lengths may be longer; the regime may rise.

The strict slogan is therefore: *every automorphism preserves the regime; only non-automorphism transformations (true substrate edits, not self-symmetries) can change it.* The regime is the cleanest substrate-algebraic invariant under self-symmetry that the corpus makes available; *"the reorg didn't change the regime"* is the substantive content of *"the reorg was a self-symmetry,"* whether that self-symmetry was cosmetic or substantive.

## Where used

- [operations-causal-settling](../objects/operations-causal-settling.md) — supplies the settling whose regime this theorem classifies.
- [restructure-as-visible-automorphism](restructure-as-visible-automorphism.md) — supplies the automorphism-invariant under which the regime is preserved (every element of $\mathrm{Aut}^\simeq(v^{\mathrm{op}})$, cosmetic and substantive alike).
- [cadence-as-step-shift-rg-flow](cadence-as-step-shift-rg-flow.md) — cadence-boundary integration events are the typical operational instance of transfinite-bounded regime firings; the regime classification refines the cadence theorem's RG-flow picture by classifying *which cadences* push the operations causal settling past $\omega$.
- [completion-as-quiescence](completion-as-quiescence.md) — completion is closure of the operations causal settling; the regime determines how rapidly completion can be checked.
- [adjudication-modes-and-h1](adjudication-modes-and-h1.md) — adjudication-class generators in $H^1$ correspond to non-Scott-continuous firings in the transfinite-bounded regime; this theorem's regime placement refines which adjudication classes are *finite-firing* (strict) vs. *limit-firing* (transfinite-bounded).

## Open downstream

- *Empirical regime placement.* For real organizations with detailed event-log records, computing $\kappa$ directly from $\prec_0$ should be tractable in the strict and Scott-continuous regimes.
  Whether typical software-engineering teams, hospital departments, or universities sit in strict, Scott-continuous, or transfinite-bounded — and whether any sit in aperiodic — is an open empirical-formal question.
- *Regime-changing restructurings as design moves.* The taxonomy of regime-lowering consolidations and regime-raising decouplings deserves explicit characterization.
  When does a merger lower the regime?
  When does decoupling raise it?
  Conjecture: the regime-lowering condition is exactly that the consolidation removes a causal chain whose length attained the prior $\kappa$.
- *Stability-hierarchy correspondence.* The cited PCT question [four-regimes-as-stability-hierarchy](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/questions/four-regimes-as-stability-hierarchy.md) proposes that the four regimes correspond to Morley's model-theoretic stability classes (decidable / $\omega$-stable / stable / unstable).
  For operations causal settlings, this would identify the regime-classification with a stability-class on the type-space of dispatch-event causal histories.
  Open whether the correspondence is established in the operations setting and what operational reading the stability-class generators carry.
