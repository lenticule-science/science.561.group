---
type: theorem
class: engineering-claim
status: proved
depends-on: [federation-graph, quantale-enriched-sheaf, q-fuzzy-equivalence, bilattice-accessibility-relation, modal-necessity-operator]
see-also: [graded-dispatch-via-q-enriched-fusion, cycle-holonomy-as-federation-disagreement, federation-trust-bilattice-graded]
---

# Federation path metrics compose multiplicatively in the quantale

**Claim.** For any path $w_0 \to w_1 \to \dots \to w_n$ in the [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md), with per-edge quantale grades $q_i \in \mathsf{Q}$ for the federation's chosen commutative unital quantale, the path's composite grade is

$$q(w_0 \to w_n) \;=\; q_1 \cdot q_2 \cdot \dots \cdot q_n$$

where $\cdot$ is the quantale's binary operation. The composite is independent of intermediate choices in the bilattice's join-fusion (per the quantale's distributivity over suprema).

## Why this holds

Per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md), the federation graph viewed as a Q-enriched site has per-edge $\mathsf{Q}$-functor restrictions. Composition of $\mathsf{Q}$-functors satisfies

$$\mathrm{hom}_\mathcal{C}(x, z) \;\succeq\; \mathrm{hom}_\mathcal{C}(x, y) \cdot \mathrm{hom}_\mathcal{C}(y, z)$$

— the triangle inequality in the quantale order. For a path of length $n$, the composite hom is bounded below by the multiplicative product of per-edge homs.

Per the quantale axioms, this composition distributes over arbitrary joins:

$$q \cdot \bigvee_{i \in I} q_i \;=\; \bigvee_{i \in I} (q \cdot q_i)$$

so the path-composite is well-defined regardless of how intermediate predications are joined. The composite is a *Q-functor restriction* from the start-node fiber to the end-node fiber.

This generalizes the classical [Lawvere-quantale settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmark-lawvere-quantale-settling.md) on graphs ($\mathsf{Q} = ([0, \infty], +, \min)$ giving shortest-path) to arbitrary commutative unital quantales: the federation's path metric is the same construction in a different quantale.

## Engineering consequence

- **Latency-aware federation routing.** With $\mathsf{Q} = ([0, \infty], +, \min)$, multi-hop federation latency is the sum of per-hop latencies; the optimal route is the $\min$-cost path. The substrate's federation router can run shortest-path on the federation graph using exactly the substrate's grade composition.
- **Reliability-weighted federation routing.** With $\mathsf{Q} = ([0, 1], \cdot, \max)$, multi-hop federation reliability is the product of per-hop reliabilities; the optimal route is the highest-product path. Same substrate operation, different quantale.
- **Trust-graded federation routing.** With $\mathsf{Q} = \mathbf{L}^\bowtie$ (the bilattice as a quantale), multi-hop trust is the bilattice's $\odot$ along the path; the optimal route is the strongest-trust path. Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), this uses the federation's bilattice accessibility directly.
- **Multi-criteria via product quantales.** With $\mathsf{Q} = \mathsf{Q}_1 \times \mathsf{Q}_2$, path composition handles latency and reliability simultaneously per the product quantale's pointwise $\cdot$.
- **Compositional grade auditing.** Per [witness](../objects/witness.md), each federation hop records its grade contribution; an auditor can decompose a multi-hop grade into its per-hop factors and verify that the substrate's composition matches the recorded contributions.

## What the theorem rules out

- **Non-quantale cost models.** A federation cost model that does not satisfy the quantale axioms (commutativity, associativity, unit, distributivity over suprema) cannot be lifted into the q-enriched composition. The substrate's grade composition is bounded to monotone, distributive cost-models.
- **Path-dependent grades.** A grade that depends on the path's history (rather than on the per-edge contributions composed multiplicatively) is not a quantale grade — it is a Markovian quantity. The substrate's path metric is structurally Markov-like in the quantale.
- **Composing grades from different quantales.** Two federation peers using different quantales cannot directly compose their grades; per [q-fuzzy-equivalence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), they may share a *fuzzy* equivalence via a quantale homomorphism, but the substrate refuses silent quantale-coercion.

## What the theorem requires

- The federation graph is a [quantale-enriched sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md) over a commutative unital quantale $\mathsf{Q}$.
- All federation peers agree on the choice of $\mathsf{Q}$ (or have explicit bridges between their quantales — these bridges are auditable predications).
- Per-edge grades are recorded as substrate content; the grade is reproducible from the recorded predications, not derived from runtime measurement alone.

## Position

Together with [graded-dispatch-via-q-enriched-fusion](graded-dispatch-via-q-enriched-fusion.md) and [cycle-holonomy-as-federation-disagreement](cycle-holonomy-as-federation-disagreement.md), this theorem grounds the substrate's federation path-metric in the q-enriched-sheaf structure. The federation's routing layer is not an external network protocol — it is the substrate's evaluation of the path-metric on its own substrate-content federation graph.
