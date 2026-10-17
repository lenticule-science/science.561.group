---
type: theorem
class: engineering-claim
status: proved
depends-on: [cost-composition-via-lawvere-quantale, federation-path-metrics-multiplicative, cost-quantale-of-fuel]
see-also: [federation-convergence, federation-trust-bilattice-graded, cost-discipline, fuel-bound]
---

# Federation fuel composition lifts by tensor distributivity

**Claim.** Let $\mathcal{V} = (V, \otimes, k, \bigvee)$ be the substrate's [cost quantale of fuel](../objects/cost-quantale-of-fuel.md) per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md), with quantale order $\le_{\mathcal{V}}$. Let a federation message traverse a multi-hop relay path $P = (p_1, p_2, \dots, p_n)$ with per-hop fuel costs $r_1, r_2, \dots, r_n \in V$.

Then:

1. **Path-cost is the tensor of per-hop costs.**
   $$r(P) \;=\; r_1 \otimes r_2 \otimes \dots \otimes r_n.$$
2. **Path-cost preserves arbitrary joins in each tensor factor.** For any indexed family $\{r_i^{(j)}\}_{j \in J}$ of alternative costs at hop $i$,
   $$r_1 \otimes \dots \otimes \left(\bigvee_{j \in J} r_i^{(j)}\right) \otimes \dots \otimes r_n \;=\; \bigvee_{j \in J} \bigl(r_1 \otimes \dots \otimes r_i^{(j)} \otimes \dots \otimes r_n\bigr).$$
3. **Per-hop bounds compose to a path bound.** If $r_i \le_{\mathcal{V}} b_i$ at every hop $i$, then
   $$r(P) \;=\; r_1 \otimes \dots \otimes r_n \;\le_{\mathcal{V}}\; b_1 \otimes \dots \otimes b_n.$$
   In particular, if every $r_i \le_{\mathcal{V}} b$ for a common per-hop bound $b \in V$, then $r(P) \le_{\mathcal{V}} b^{\otimes n}$.

The result is a corollary of the standard quantale axiom that $\otimes$ preserves arbitrary $\bigvee$ in each argument; no new substrate structure is introduced.

## Why this holds

Per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md), the substrate's per-operation costs compose via the quantale's $\otimes$. Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), the same composition law extends to federation-graph paths: a multi-hop path in the federation graph is a $\mathsf{Q}$-functor restriction whose grade is the iterated tensor of per-edge grades. Together these give part (1).

Part (2) is the standard distributivity axiom for a unital quantale: $\otimes$ preserves arbitrary suprema in each argument,

$$a \otimes \bigl(\bigvee_i b_i\bigr) \;=\; \bigvee_i (a \otimes b_i), \qquad \bigl(\bigvee_i a_i\bigr) \otimes b \;=\; \bigvee_i (a_i \otimes b).$$

Iterating across the path's $n$ tensor factors and applying the axiom at the $i$-th factor gives the formula in (2) directly. This axiom is recorded in [cost-quantale-of-fuel](../objects/cost-quantale-of-fuel.md)'s `distributivity-witness` field; for the four common carriers (`additive-latency`, `multiplicative-reliability`, `bottleneck-throughput`, `bilattice-trust`) the witness is structural.

Part (3) follows from the monotonicity of $\otimes$ in each argument. Monotonicity is an immediate corollary of (2): if $r \le_{\mathcal{V}} b$ then $b = r \vee b$, so $a \otimes b = a \otimes (r \vee b) = (a \otimes r) \vee (a \otimes b)$, whence $a \otimes r \le_{\mathcal{V}} a \otimes b$. Iterating across the $n$ tensor factors: if $r_i \le_{\mathcal{V}} b_i$ at every $i$, then $r_1 \otimes \dots \otimes r_n \le_{\mathcal{V}} b_1 \otimes \dots \otimes b_n$. The single-bound corollary $r(P) \le_{\mathcal{V}} b^{\otimes n}$ is the case $b_1 = \dots = b_n = b$.

Part (3) is stated with respect to the quantale order $\le_{\mathcal{V}}$ — "no worse than" in $\mathcal{V}$. For each common cost quantale, $\le_{\mathcal{V}}$ instantiates to the substrate's natural admissibility comparison: in $\mathcal{V} = ([0,\infty], +, 0)$ ordered so that $\bigvee = \min$, $r \le_{\mathcal{V}} b$ means $r \ge b$ as reals (smaller cost is higher in $\mathcal{V}$); in $\mathcal{V} = ([0,1], \cdot, 1)$ ordered so that $\bigvee = \max$, $r \le_{\mathcal{V}} b$ means $r \le b$ as reals (larger reliability is higher in $\mathcal{V}$). In both cases $\le_{\mathcal{V}}$ is the substrate's "is at least as admissible as" comparison and (3) reads directly: per-hop bounds in $\le_{\mathcal{V}}$ compose to a path bound in $\le_{\mathcal{V}}$.

## Engineering consequence

- **Federation-cost forecasting is structural.** A federation router computing path-cost over multi-hop relays uses the substrate's existing $\otimes$ per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md); the path-cost is determined by the per-hop contributions and the potential quantale, not by router heuristics.
- **Per-hop budget enforcement is sufficient for path budget.** A federation router that admits a hop iff $r_i \le_{\mathcal{V}} b$ for the substrate's per-hop bound $b$ produces paths whose total cost is bounded by $b^{\otimes n}$ structurally. Per-hop admissibility checks at each relay suffice; no centralised global path-cost forecast is required.
- **Alternative-route join is structural.** When a federation router has multiple admissible routes through the $i$-th relay (per (2)), it composes them via the quantale's $\bigvee$. For the additive-latency quantale this is the cheapest alternative; for multiplicative-reliability it is the most-reliable alternative; for bilattice-trust it is the strongest-trust alternative. The same routing primitive serves all three, parameterised only by the potential [cost quantale of fuel](../objects/cost-quantale-of-fuel.md).
- **Per-hop bounds aggregate by tensor.** Different per-hop bounds $b_1, \dots, b_n$ — for example, when each relay declares its own admissibility threshold — aggregate to the path bound $b_1 \otimes \dots \otimes b_n$ by the same monotone $\otimes$, with no inter-relay coordination beyond declaring the per-hop bounds as substrate content.
- **Federation-side admissibility is auditable per-hop.** Per [witness](../objects/witness.md), each hop's contribution $r_i$ is recorded as substrate content; an auditor reconstructs the path-cost by replaying $\otimes$ over the recorded contributions and verifies admissibility per-hop and end-to-end without re-running the federation transport.

## What the theorem rules out

- **Non-quantale federation cost models.** A federation-cost model that is not the substrate's chosen quantale (e.g., a heuristic that adds context-dependent overhead at each hop) is not what the theorem applies to. The substrate refuses; per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md), federation-cost composition is structurally the substrate's quantale composition.
- **Path-cost depending on intermediate-route choices beyond the quantale's $\bigvee$.** A federation router whose chosen path's cost depends on the *order* in which alternative routes are presented (rather than on the quantale-join of alternatives) is not implementing this theorem's lifting. The substrate's path-cost is order-independent under the quantale's $\bigvee$.
- **Per-hop admissibility insufficient for path admissibility.** A federation discipline that admits each hop within its per-hop bound $b$ but rejects the resulting path even when its total is within $b^{\otimes n}$ is over-restrictive; per (3), per-hop admissibility is sufficient for the path-bound at the corresponding tensor.
- **Quantale switching mid-path.** A path that uses different cost quantales at different hops without an explicit quantale-homomorphism record is non-conformant per [cost-quantale-of-fuel](../objects/cost-quantale-of-fuel.md)'s federation-domain coherence invariant.

## What the theorem requires

- The substrate's cost-domain is a [cost quantale of fuel](../objects/cost-quantale-of-fuel.md) — a commutative unital quantale per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md).
- Per-hop costs are recorded as substrate content (per [witness](../objects/witness.md)'s `fuel-consumed` field), in the units of the potential cost quantale.
- The federation graph composes per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md) — paths are $\mathsf{Q}$-functor restrictions whose grade is the iterated tensor of per-edge grades.
- Federating substrates share the same cost quantale (or have an explicit quantale-homomorphism bridge recorded as substrate content).

## Position

This theorem is a short corollary of [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md) and [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md) under the standard unital-quantale distributivity axiom. It exists as a named entity because federation-routing arguments and per-hop-budget arguments both need a single citable result for "per-hop fuel bounds lift to path bounds under the quantale's structure"; the named corollary keeps citing material from re-deriving it inline. Together with [federation-convergence](federation-convergence.md) (federation correctness) and [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md) (trust-graded federation), this completes the federation-cost-discipline corner of the substrate's federation algebra: the substrate's federation cost is one quantale, one composition law, structurally lifted from per-hop to path by the quantale's distributivity.
