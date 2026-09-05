---
kind: narrative
discusses: [crdt-convergence-via-mayer-vietoris, cohomological-calm, replica-mayer-vietoris, distributed-settling-system, settling-cohomology]
---

# Cohomology and distributed-systems topology

The [CRDT Mayer–Vietoris](../theorems/crdt-convergence-via-mayer-vietoris.md) reformulation sits in a broader arc of topology-applied-to-distributed-systems work, with which it shares motivating intuitions but differs technically.

## [@herlihy-et-al2013]

*Distributed Computing Through Combinatorial Topology* is the foundational reference: distributed-computation tasks modeled via simplicial input/output complexes and protocol complexes, with task solvability reducing to existence of a decision simplicial map. The present development is *not* in this technical tradition — sheaf cohomology on a bitopological site, not simplicial homotopy on protocol complexes — but inherits the structural insight that distributed-computation properties have a topological signature.

## [@felber-et-al2025]

The closest parallel in the recent sheaf-on-distributed-systems literature. A *task sheaf* is a cellular sheaf whose global sections are exactly a task's terminating solutions; the cohomology encodes solvability obstructions. The frameworks differ in four ways:

- **Fiber values.** Task sheaves use vector-space / $\mathbf{Ab}$-valued cellular sheaves; the [bitopological settling site](../objects/bitopological-settling-site.md) uses $\mathbf{Ab}$-valued sheaves on the paired-Priestley dual of a bilattice-fibered hyperdoctrine.
- **Temporal structure.** Task sheaves use finite 1-categorical execution models; this layer uses transfinite 2-categorical settling.
- **Primary question.** Task sheaves target solvability; settling cohomology targets [aperiodic classification](../theorems/aperiodic-regime-classification.md) and [CRDT convergence](../theorems/crdt-convergence-via-mayer-vietoris.md).
- **Site base.** Task sheaves use a simplicial base; this layer uses the bitopological [bitopological settling site](../objects/bitopological-settling-site.md).

The two are complementary. A unified "sheaf cohomology as distributed-systems invariant" framework combining both is one of the cleanest open downstream developments — see [unified distributed-systems cohomology](../questions/unified-distributed-systems-cohomology.md).

## [@ghrist-ding2025]

*Precision-graded cohomology and arithmetic persistence for network sheaves* uses $p$-adic-integer-valued cellular cohomology with precision-graded filtration for distributed consensus with quantized communication. Coefficients are $\mathbb{Z}_p$, orthogonal to the $\mathbb{Z}$-coefficients on a bilattice Priestley dual used here. A unified treatment — bilattice-valued precision-graded cohomology — would make sense for some applications but has not been pursued.

## CALM

The [CRDT-as-CALM-instantiation](crdts-and-calm.md) connection becomes a cohomological theorem here: [cohomological CALM](../theorems/cohomological-calm.md) makes CALM-compatibility for an settling-derived sheaf equivalent to vanishing of all Mayer–Vietoris obstructions. This is the closest this layer comes to producing "topology of distributed computability" results in the HKR sense; the cohomological reformulation passes the structural-topology baton to derived-functor machinery.
