---
type: theorem
class: engineering-claim
status: sketch
depends-on: [federation-graph, quantale-enriched-sheaf, q-fuzzy-equivalence, bilattice-network-sheaf-consensus, federation-path-metrics-multiplicative, network-sheaf-consensus-on-agent-graphs]
see-also: [graded-dispatch-via-q-enriched-fusion, federation-trust-bilattice-graded, federation-convergence]
---

# Cycle holonomy is federation disagreement

**Claim.** For any cycle $w_0 \to w_1 \to \dots \to w_n \to w_0$ in the [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), the round-trip composition of per-edge $\mathsf{Q}$-functor restrictions is *strictly equivalent* to the identity on $w_0$ if and only if the federation peers along the cycle agree on the cycle's content. When peers disagree, the round-trip is only a *q-fuzzy equivalence* with $q \prec 1$ — and the magnitude of $1 - q$ measures the federation disagreement quantitatively.

This is the substrate-level instance of *holonomy as obstruction to global section* on the federation's q-enriched sheaf — a generalization of the [bilattice network-sheaf consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) condition to quantale-graded federations.

## Why this holds

Per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md), the federation graph carries a $\mathsf{Q}$-enriched sheaf $F$. Each cycle in the graph induces a round-trip $\mathsf{Q}$-functor:

$$\mathrm{round}(w_0) \;:=\; F(e_n) \circ F(e_{n-1}) \circ \dots \circ F(e_1) \,:\, F(w_0) \to F(w_0)$$

The sheaf condition asserts: for every covering family, local data on the cover reconciles. For a cycle, the round-trip of restrictions is a structural reconciliation check: the data the cycle observes from $w_0$, transported around, must return to data q-fuzzy-equivalent to itself.

Per [q-fuzzy-equivalence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), the round-trip is q-fuzzy-equivalent to the identity for some $q \in \mathsf{Q}$. Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), the cycle's $q$ is the multiplicative product of per-edge grades:

$$q(\mathrm{round}(w_0)) \;=\; q(e_1) \cdot q(e_2) \cdot \dots \cdot q(e_n)$$

When all peers agree on the cycle's content (the data observed by each peer at each $w_i$ is consistent with the data the previous peer transported), per-edge grades are $1$ (the quantale unit) and the round-trip is *strict identity*. When peers disagree, per-edge grades drop below $1$ — the multiplicative product drops further with each disagreement, giving a strict lower bound on the cycle's composite-disagreement.

Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the bilattice case (where $\mathsf{Q}$ is the bilattice's own structure) recovers the consensus-equivalence on a network sheaf as the strict-identity case; this theorem extends the analysis to quantitative grade.

## Engineering consequence

- **Disagreement detection without polling.** A federation operator can detect inter-peer disagreement by traversing cycles and checking the round-trip's grade — no central coordinator polls each peer. The substrate's federation autonomously surfaces disagreement.
- **Quantitative reconciliation prioritization.** Cycles with smaller round-trip $q$ (greater disagreement) are higher-priority reconciliation candidates per [repair](teaching/explanations/repair.md). The substrate's repair scheduler can use the holonomy magnitude to triage.
- **Local sufficient cover.** If every cycle in a federation sub-graph has $q = 1$ (strict identity), the sub-graph admits a global consistent section. Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), this is the substrate's structural condition for "the federation is locally consistent here."
- **Holonomy is gauge-invariant.** Per the sheaf's $\mathsf{Q}$-functor structure, the holonomy at $w_0$ is conjugate-equivalent to the holonomy at any other cycle base-point. The substrate computes holonomy at any convenient base-point and gets the same disagreement-grade.
- **Federation-convergence interpretation.** Per [federation-convergence](federation-convergence.md), federation-merge converges when every cycle's holonomy reaches the quantale unit (or its q-fuzzy approximation). The substrate's convergence criterion is holonomy-flatness in the q-enriched sense.

## What the theorem rules out

- **Disagreement without holonomy.** A federation that has inter-peer disagreement but whose cycle round-trips are strictly the identity is not implementing the q-enriched sheaf. Either the disagreement is unrepresented (the substrate is missing predications) or the round-trip computation is ignoring per-edge grades.
- **Holonomy without local detection.** A federation whose disagreement is only detectable by central polling (rather than by local cycle traversal) is not deploying the substrate's q-enriched-sheaf machinery. The substrate's claim is that disagreement is *locally* detectable via cycle holonomy.
- **Coercing $q < 1$ holonomy to $q = 1$.** A federation operator who silently rounds disagreement-grades up to $1$ is suppressing substrate signal — the round-trip's true $q$ is the audit-truth. Per [witness](../objects/witness.md), the per-edge grades are recorded; the holonomy's $q$ is reproducible from the recorded grades.

## What the theorem requires

- The federation graph is a [quantale-enriched sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md) over a commutative unital quantale $\mathsf{Q}$.
- Per-edge $\mathsf{Q}$-functor restrictions are recorded as substrate content (per [self-representation](teaching/explanations/self-representation.md)).
- The federation has at least one cycle to admit holonomy analysis (a tree-shaped federation has trivially-identity holonomy on any path; the theorem's content is in the cyclic case).

## Status

Sketch. The connection to [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) is structurally clear, but the full holonomy-equivalence proof in the q-enriched setting requires verifying that the round-trip composition's $q$ is *exactly* (not just bounded above by) the product of per-edge grades — this depends on the quantale's distributivity behavior in the specific federation's value-domain. The bilattice case is verified per the consensus theorem; richer quantales require additional verification per [q-enriched-curry-2-cell-fuzzy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/q-enriched-curry-2-cell-fuzzy.md) (if existing) or analogous lemmas.

## Position

Together with [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md) and [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), this theorem grounds the substrate's federation-disagreement detection in the q-enriched-sheaf's holonomy structure. Federation reconciliation is not a centralized polling discipline — it is the substrate's local cycle-holonomy traversal on its own substrate-content federation graph.
