---
type: question
class: bridge
status: partial
explores: [entity-set, predication-settling, predication-cell, settling-bound]
---

# Entity sets that aren't ordinals

> **Progress.** The graph case is now exemplified: the [graph cycle $C_4$ benchmark](../examples/benchmarks/benchmark-graph-cycle-c4.md) is a concrete settling with $E$ a graph rather than an ordinal. The [Lorentzian causal-settling](../objects/lorentzian-causal-settling.md) gives another non-ordinal $E$ (a poset with causal structure). The [Lawvere-quantale benchmark](../examples/benchmarks/benchmark-lawvere-quantale-settling.md) settles on graphs with weighted-edge structure. Empirically the framework handles these without needing ordinal $E$ — the closure-2-monad and four-regime dichotomy don't depend on $E$ being well-ordered. **Still open**: a structural theorem identifying which $E$-structures (graphs / topological spaces / manifolds) give which regimes, and whether closure-ordinal definitions need adjustment for non-well-orderable $E$.

The corpus has used $E$ as: finite sets ($n$-cell strict-regime), $\omega$ (Scott-continuous), $\omega \cdot k$ for finite $k$ (transfinite-bounded), $\omega_1$ (aperiodic). All of these are ordinals.

The framework doesn't actually require this. $E$ is just a set with relational structure (predications live on $E \times E$). It could be:

- **A graph** $G = (V, E_G)$. Predications on $V \times V$ index over edges plus diagonals. Settlings would be graph-relational dynamics; closure rules could encode message-passing or label propagation.
- **A topological space** $X$. Predications on $X \times X$. Closure rules respecting the topology give *continuous-state settlings*. The bitopological settling site's spatial axis already has topology; making $E$ topological adds structure on the entity-axis too.
- **A manifold** $M$. Predications on $M \times M$. Closure rules involving differential structure (parallel transport, gradient flow). Settlings as PDE fixed points.
- **The integers $\mathbb{Z}$**. Predications on $\mathbb{Z} \times \mathbb{Z}$. Closure rules respecting the group structure (translation-invariance). Settlings = translation-invariant relational structures, related to symbolic dynamics on $\mathbb{Z}^2$.
- **A fractal** (Cantor set, space-filling curve, etc.). Predications on fractal $\times$ fractal. Self-similar closure rules. Settlings as fractal limits.
- **A finite group / monoid** with multiplication-relation. Predications encoding the multiplication table. Closure rules representing word-rewriting. Settlings as rewriting-system normal forms.

## Open

1. **Which framework results survive?** The corpus's main theorems (four-regime dichotomy, $H^1$ classification, Verdier duality, etc.) were proved with $E$ as an ordinal. Many should generalise — e.g., the four-regime dichotomy should hold for any $E$ since it's about closure-ordinal cardinality, not entity-set structure. The cellular-extension plan's Layers 1+2+3 already work for arbitrary fibered cellular sites.

2. **Which results require ordinal-$E$?** The transfinite-induction settling explicitly uses ordinal structure ($\forall \alpha < \beta$ is meaningful only on a partial order). Closure rules involving such quantifiers don't directly generalize to non-ordinal $E$ — though group-action-invariance or topology-respecting analogues might.

3. **Graph-$E$ specifically.** Probably the most natural non-ordinal case. The framework would interface with graph neural networks, message-passing algorithms, network sheaf theory. Has substantial overlap with the [Ghrist-Hansen-Riess work](../../../operations/command/plans/collab/ghrist-hansen-riess-pysheaf.md).

4. **Manifold-$E$.** Predications on $M \times M$ — bi-pointed structures on a manifold. Closure rules involving connections, curvature, or geodesic flow. Connects to gauge theory and synthetic differential geometry.

5. **Recovering predication categories' existing theorems.** In ordinal-$E$ form, predication categories' content is well-developed. Re-deriving for non-ordinal-$E$ might surface that some theorems' "ordinal hypothesis" is decorative, others structurally required.

The corpus's ordinal-$E$ choice was for tractability; it's not a structural commitment. The framework's generality is much larger than what's been used.
