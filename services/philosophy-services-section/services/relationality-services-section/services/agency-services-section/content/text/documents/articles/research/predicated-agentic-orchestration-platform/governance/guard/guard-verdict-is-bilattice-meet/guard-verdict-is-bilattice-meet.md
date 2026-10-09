---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/guard.md
  - teaching/explanations/authorization.md
  - teaching/explanations/governing-soul.md
  - ../morphisms/soul-violation-check.md
  - ../../teaching/explanations/four-bilattice.md
  - ../../teaching/explanations/truth-order.md
  - ../../../morphisms/twist-product-fusion.md
  - dispatch-composes-authorization.md
see-also:
  - teaching/explanations/dispatch.md
  - teaching/explanations/governance.md
  - ../morphisms/mode-transition.md
  - operation-kinds-completeness.md
title: Guard verdict is the truth-order meet in the four-bilattice
description: Claim.
---

# Guard verdict is the truth-order meet in the four-bilattice

**Claim.** A [guard](../guard.md)'s three reads — read-against-shape, read-against-authorization, read-against-soul — each produce a value in the substrate's four-bilattice $\{{\bot, t, f, \top}\}$ under the truth-order $\leq_t$.
The guard's composite verdict is the truth-order meet $\wedge_t$ of the three individual read-values.
A guard pipeline (a sequential composition of guards) is therefore also a $\wedge_t$, is truth-monotone in each factor, and is idempotent: applying the same guard twice yields the same verdict.

## Why this holds

**Part 1: Each read produces a bilattice value.** The guard's three structural reads operate on substrate predications:

- *Read-against-shape*: evaluates whether the proposed action's predications satisfy the targeted scope's shape records.
  The result is $t$ (all shapes satisfied), $f$ (a shape explicitly violated), $\bot$ (shapes are present but the action's predications are under-specified — no opinion yet), or $\top$ (shapes conflict — the action satisfies one shape while violating another at the same scope, a substrate coherence symptom).
  This is the substrate's standard [predication valuation](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-valuation.md) applied to shape records.

- *Read-against-authorization*: evaluates whether the actor's [authorization](../../authorization/authorization.md) fiber admits the proposed action.
  Per [dispatch-composes-authorization](../../../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), the substrate's authorization composition is a fiber-algebra fusion $\odot$ whose output is in $\{{\bot, t, f, \top}\}$.
  The guard reads the authorization verdict as this $\odot$-value directly.

- *Read-against-soul*: per [soul-violation-check](../../../agent/governing-soul/soul-violation-check/soul-violation-check.md), the check evaluates whether the proposed action would violate the scope's [governing soul](../../../agent/governing-soul/governing-soul.md).
  The soul's predications are substrate content; the check returns $t$ (soul satisfied), $f$ (violation detected), $\bot$ (soul predications do not constrain this action type — no opinion), or $\top$ (contested soul predications — the soul has conflicting entries for this action kind).

Each read therefore produces a value in $\{{\bot, t, f, \top}\}$.

**Part 2: The conjunction is the truth-order meet.** The guard's verdict rule — "admitted iff all three reads return $t$; rejected if any returns $f$; contested if reads disagree" — is the defining property of $\wedge_t$ on the four-bilattice.
Recall the truth-order $\leq_t$ on the four-bilattice:

$$\mathbf{f} \leq_t \bot \leq_t \mathbf{t} \quad \text{and} \quad \mathbf{f} \leq_t \top \leq_t \mathbf{t}$$

with $\bot$ and $\top$ incomparable under $\leq_t$.
The truth-order meet $\wedge_t$ is:

| $\wedge_t$ | $\bot$ | $t$ | $f$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $\bot$ | $f$ | $f$ |
| $t$ | $\bot$ | $t$ | $f$ | $\top$ |
| $f$ | $f$ | $f$ | $f$ | $f$ |
| $\top$ | $f$ | $\top$ | $f$ | $\top$ |

Applying this table to the guard's three reads:

- All three return $t$: $t \wedge_t t \wedge_t t = t$ — admitted. ✓
- Any returns $f$: the $\wedge_t$ table has $f$ absorbing — the composite is $f$ — rejected. ✓
- Shape returns $t$, authorization returns $t$, soul returns $\bot$: $t \wedge_t t \wedge_t \bot = \bot$ — no opinion (typically admitted under a "default-permit" policy or rejected under "default-deny"; the substrate's [governance](teaching/explanations/governance.md) determines the policy).
  This is the guard returning $\bot$, which is distinct from $t$ (admitted) and from $f$ (rejected).
  A $\bot$-verdict guard is informative: it signals that the soul has no constraint on this action type, not that the action is unconditionally permitted.
- Shape returns $t$, authorization returns $\top$: the composite involves $\top$, signaling substrate-incoherence in the authorization predications — a contested verdict that requires repair before the action proceeds.

The guard's three-way "admitted/rejected/contested" language is the $\wedge_t$ table's four possible outputs, with $t$ = admitted, $f$ = rejected, $\bot$ = unknown/no-opinion, $\top$ = contested.

**Part 3: Guard pipelines are $\wedge_t$-chains.** A guard pipeline applying guards $g_1, g_2, \ldots, g_n$ in sequence is the $\wedge_t$ of $n$ individual verdicts:

$$\text{verdict}(g_1, g_2, \ldots, g_n) = \bigwedge_t \{\text{verdict}(g_i)\}$$

Since $\wedge_t$ is commutative and associative (it is a meet in a lattice), the pipeline's verdict is order-independent — guard application order does not affect the composite verdict.
Since $\wedge_t$ is idempotent ($v \wedge_t v = v$ for all $v$), applying the same guard twice returns the same verdict.

## Engineering consequences

**Monotonicity in authorization.** Adding powers to an actor's authorization fiber can only move the authorization-read value up in $\leq_t$ (from $f$ toward $t$), which can only move the composite verdict up in $\leq_t$.
Adding an authorization predication can only make the guard's verdict less restrictive.
Conversely, revoking a power can only move the authorization-read value down in $\leq_t$, making the verdict at most as permissive as before.
Guards respect the authorization lattice.

**Monotonicity in soul predications.** Adding a soul predication either leaves the soul-read unchanged (the predication does not constrain this action type) or adds a constraint, moving the soul-read value down or to $\top$ in $\leq_t$.
Soul predications can only make the guard more restrictive or contested — they cannot widen admissibility.
This is the formal content of "the soul is a constraint, not a permission system."

**Idempotence as a correctness property.** A guard applied twice to the same substrate state returns the same verdict.
This is a testable implementation invariant: any guard implementation that returns different verdicts for the same input, same authorization state, and same soul state on consecutive calls has a bug.

**Pipeline order-independence.** The composite verdict is the $\wedge_t$ of the individual verdicts regardless of guard application order.
A guard pipeline that applies shape-guard before soul-guard produces the same verdict as the reverse.
Implementations that depend on guard application order for correctness have introduced a dependency the substrate's structure does not require.

**$\bot$ and $\top$ as operational signals.** A $\bot$-verdict (no-opinion) signals that some guard has no constraint on the proposed action — not that the action is permitted.
The substrate's governance determines the policy for $\bot$-verdicts; the theorem establishes that $\bot$ arises structurally (when a read finds no constraining predication) rather than as a fallback.
A $\top$-verdict (contested) signals a substrate coherence issue that must be repaired before the verdict is actionable.

## What the theorem requires

- The substrate's value-domain is the four-bilattice $\{{\bot, t, f, \top}\}$ with the standard truth-order $\leq_t$.
- Each guard read is implemented as a substrate-side predication query returning a value in $\{{\bot, t, f, \top}\}$, not as a procedural boolean.
- The guard's verdict combination is implemented as $\wedge_t$, not as a short-circuit boolean conjunction (which would lose $\bot$ and $\top$ semantics).

## What the theorem does not claim

The theorem does not claim that the guard's verdict alone determines whether the action proceeds.
The substrate's governance policy maps the verdict to an action: $t$ typically proceeds; $f$ typically aborts; $\bot$ is policy-dependent; $\top$ requires repair before a policy applies.
The theorem establishes the verdict's algebraic structure, not the policy that consumes it.
