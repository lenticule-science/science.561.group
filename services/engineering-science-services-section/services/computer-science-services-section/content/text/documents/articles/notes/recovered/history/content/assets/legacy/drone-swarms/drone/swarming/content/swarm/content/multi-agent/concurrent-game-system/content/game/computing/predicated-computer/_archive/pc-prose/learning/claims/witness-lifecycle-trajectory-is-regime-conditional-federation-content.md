---
type: theorem
class: engineering-claim
status: proved
depends-on: [federation-convergence, closure-rule-system-realizes-closure-2-monad, regime-classification-for-substrate, witness, paraconsistency-as-substrate-discipline, repair-as-top-cell-resolution]
see-also: [cross-peer-trajectory-ordering-is-content-addressed, audit-content-via-inconsistency-sheaf-cohomology, four-regime-dichotomy, regime-record]
---

# Witness-lifecycle trajectory is regime-conditional federation content

**Claim.** A [witness](../objects/witness.md)'s lifecycle — the path it traverses from its initial *open* state through any *triaged* / *repaired* intermediate states to its *settled* endpoint — is the regime-determined trajectory of one application of the substrate's closure 2-monad per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md). It is not extra structure on top of the math; it is the path the closure operator took, recorded in the witness's `intermediate-hashes` field.

Whether this trajectory is *load-bearing* federation content depends entirely on the substrate's regime per [regime-classification-for-substrate](regime-classification-for-substrate.md):

- **In the strict and Scott-continuous regimes**, the witness's `intermediate-hashes` are *engineering-observability content*: useful to operators and auditors as visibility into where in a closure-step a long-running rule is, but not required for federation correctness. Substrates federating in these regimes may ship endpoint-only witnesses and converge per [federation-convergence](federation-convergence.md).

- **In the transfinite-bounded and aperiodic regimes**, the witness's `intermediate-hashes` are *substrate-content* required for federation convergence per [federation-convergence](federation-convergence.md) §"Regime hypotheses": each intermediate-hash records a non-Scott-continuous firing ordinal that contributes a $\mathbb{Z}$-generator to $H^1$ of the merged settling, and a federation that elides the intermediates loses the cohomological invariant distinguishing [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md) classes.

The 4-state spec lifecycle (open → triaged → repaired → settled) is therefore not an extension of the 2-state mathematical arrow (open → settled, monotone in $\leq_k$); the 4-state view is the regime-determined trajectory of that single arrow, with the load-bearingness of the intermediate states regime-conditional.

## Why this holds

**Part 1 — the lifecycle is one closure-2-monad application.** Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), the substrate's settlement is the iteration of the closure 2-monad $\mathrm{Cl}^{\mathcal{S}}$ on its [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). The 2-monad's unit $\eta$ embeds a value in its closure; its multiplication $\mu$ collapses nested closures to a fixed point. A single witness records one $\eta;\mu$ application — equivalently, one closure step taking the input valuation $v_\tau$ to the output valuation $v_{\tau+1}$.

The 4 substrate lifecycle states correspond to four layers of that closure trajectory:

| Lifecycle state | Closure-2-monad layer | Witness field |
|---|---|---|
| **open** | $v_\tau$ — pre-application valuation | `input-hash` |
| **triaged** | $\eta(v_\tau)$ — embedded in the closure but no rule fired yet | `intermediate-hashes[0]` |
| **repaired** | $\mathrm{Cl}^{\mathcal{S}}(\eta(v_\tau))$ — post one rule-application layer (e.g., a repair from [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md)), before $\mu$ has collapsed to fixed point | `intermediate-hashes[1]` |
| **settled** | $\mu(\mathrm{Cl}^2(v_\tau)) = \mathrm{cl}_p(v_\tau) = v_{\tau+1}$ — fixed point | `output-hash` |

By the lax-idempotence of the closure 2-monad (Kelly–Lack property-likeness; the 2-monad's algebras form a property of objects rather than added structure), the trajectory's intermediate states are equivalent to the endpoint *up to canonical iso*: being settled is a property of the valuation, not extra structural data. The intermediate states are therefore trajectory information about *how* the closure proceeded, not new structural content distinct from the endpoint.

This establishes that the 4-state lifecycle is one closure-step's path, not an extension of the math. The math mandates the 2-state endpoint arrow; the 4-state lifecycle is an engineering-side observation of the path that arrow took.

**Part 2 — load-bearingness is regime-conditional.** Per [federation-convergence](federation-convergence.md) §"Regime hypotheses":

- *Strict and Scott-continuous regimes.* The closure ordinal $\kappa \le \omega$. Federation can ship endpoint state alone — the closure-merge commutation lemma makes the converged state $\mathrm{cl}_p(\bigvee_k U)$ depend only on the set $U$ of writes, not on the trajectory. In these regimes, the lifecycle's intermediate states are *engineering ergonomics*: an operator can see where in a long-running rule a closure step is, but the substrate's correctness algebra does not depend on shipping that visibility across federation.

- *Transfinite-bounded and aperiodic regimes.* The closure ordinal $\kappa > \omega$. Each [non-Scott-continuous firing ordinal](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/non-scott-continuous-firing-ordinal.md) contributes a $\mathbb{Z}$-generator to $H^1$ of the merged settling per [federation-convergence](federation-convergence.md) §"Regime hypotheses". The intermediate-hash records the firing-ordinal pattern of the closure step; a federation that elides the intermediate-hashes ships a witness with the same `input-hash` and `output-hash` as a Scott-continuous closure step would but with a different actual firing pattern, and two substrates exchanging only endpoint-witnesses converge to byte-identical $v_{\tau+1}$ but lose the $H^1$ class that distinguishes their MLD-classes. In these regimes the intermediate-hashes are *substrate-content*.

The conjunction of Parts 1 and 2 is the claim: the 4-state lifecycle is not new structure (Part 1), and its federation-content status is determined by the regime (Part 2).

**Part 3 — the spec lifecycle pattern is a substrate convention, not a math claim.** The 4-state spec lifecycle (open / triaged / repaired / settled) is a substrate-engineering convention naming which intermediate-hash positions correspond to which spec-state (per the table in Part 1). The convention is not a mathematical extension of the closure 2-monad; it is a names-and-positions discipline over the existing `intermediate-hashes` field. Different substrates may use different spec-state vocabularies (e.g., a 3-state lifecycle for a substrate with no repair-pass; a 5-state lifecycle for a substrate with explicit triage-vs-investigate distinction); the math is the same in every case — one closure-2-monad application — and the spec-state vocabulary is a substrate-convention layer.

## Engineering consequence

- **No primary-theory extension is needed to legitimise the 4-state lifecycle.** The math-side primitives ([closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), the closure 2-monad's lax-idempotence) already suffice. The 4-state spec lifecycle is the regime-determined trajectory of the existing 2-state arrow, recorded in the existing `intermediate-hashes` field.
- **Federation discipline is regime-conditional.** A substrate restricted to the Scott-continuous regime may implement the 4-state lifecycle as observability-only — intermediate-hashes optional in the federation envelope, populated locally for operator visibility. A federation that admits transfinite-bounded peers must enforce the 4-state lifecycle as substrate-content — intermediate-hashes mandatory in the federation envelope.
- **The 4-state lifecycle is consistent with both the math-side endpoint arrow and the regime-conditional federation requirement.** Primary theory mandates the 2-state endpoint arrow at the [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) level — this is the content of the math-side [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md) — and mandates trajectory at the regime-conditional federation level per [federation-convergence](federation-convergence.md) §"Regime hypotheses". The 4-state lifecycle is consistent with both.
- **Repair is a special case.** Per [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md), repair operates on $\top$-tagged cells per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md). A witness recording a repair-step's lifecycle includes the pre-repair $\top$-state in `intermediate-hashes` and the post-repair non-$\top$ state in `output-hash`. The repair's regime-conditional federation content is governed by the same theorem.
- **Audit-side reads the trajectory uniformly.** Per [audit-content-via-inconsistency-sheaf-cohomology](audit-content-via-inconsistency-sheaf-cohomology.md), audit machinery enumerates $H^0$ in stabilising regimes and $H^1$ classes in non-Scott-continuous regimes; this theorem makes the witness-lifecycle's intermediate-hashes the substrate-content the $H^1$ enumeration consults.

## What the theorem rules out

- **A federation discipline shipping endpoint-only witnesses in transfinite-bounded or aperiodic regimes.** Per Part 2, this loses the $H^1$ cohomological invariant. The substrate's [regime-record](../objects/regime-record.md) `federation-discipline` field rejects endpoint-only configurations in those regimes.
- **A spec lifecycle vocabulary claiming to be a math extension.** Per Part 3, the spec-state names are substrate-convention layers over the existing `intermediate-hashes` field. A 4-state lifecycle that claims to add new mathematical structure beyond the closure 2-monad is over-claiming; the math has not changed.
- **Inconsistent intermediate-hash schemas across federation peers.** Two substrates sharing a federation but disagreeing on which intermediate-hash position records which spec-state cannot interpret each other's witnesses; the substrate's federation handshake includes the lifecycle-vocabulary version-hash to detect this.
- **Trajectory-elision in regimes that mandate trajectory-shipping.** A substrate in transfinite-bounded regime that emits witnesses with no `intermediate-hashes` at all has under-recorded its closure-2-monad trajectory; its federation peers cannot reconstruct the firing-ordinal pattern, and audit-side cannot enumerate $H^1$ classes. The substrate is non-conformant.

## What the theorem requires

- The substrate implements the closure rule system per [closure-rule-system](../objects/closure-rule-system.md), realising the closure 2-monad per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md).
- Each [witness](../objects/witness.md) records the closure-step's intermediate hashes in the `intermediate-hashes` field per the witness invariants.
- The potential [regime-record](../objects/regime-record.md) declares the substrate's regime, which determines whether intermediate-hashes are observability-only or federation-content per Part 2.
- Federation peers share the substrate-convention layer naming intermediate-hash positions; the convention is recorded as substrate content (typically as a versioned spec-pattern reference cited from the federation handshake).

## Position

This theorem situates the substrate's witness lifecycle: the multi-state lifecycle is not new mathematical structure on top of the math but the regime-determined trajectory of the existing closure-2-monad arrow, with the intermediate states' federation-content status governed by [federation-convergence](federation-convergence.md) §"Regime hypotheses". Together with [cross-peer-trajectory-ordering-is-content-addressed](cross-peer-trajectory-ordering-is-content-addressed.md) — the dual claim that the *ordering* of trajectory-increments is content-determined in those regimes — this completes the substrate's regime-conditional federation-trajectory discipline: the trajectory itself is regime-conditional content (this theorem), and its ordering is content-determined when shipped (the paired theorem). The substrate's audit-cohomology machinery consumes this trajectory uniformly across regimes per [audit-content-via-inconsistency-sheaf-cohomology](audit-content-via-inconsistency-sheaf-cohomology.md).
