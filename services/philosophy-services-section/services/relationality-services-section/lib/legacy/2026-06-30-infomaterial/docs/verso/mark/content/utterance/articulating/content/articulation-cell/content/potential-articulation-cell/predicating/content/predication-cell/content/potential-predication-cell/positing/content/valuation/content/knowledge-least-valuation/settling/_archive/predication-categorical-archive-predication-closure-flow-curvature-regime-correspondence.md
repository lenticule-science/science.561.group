---
type: theorem
status: proved
depends-on: [four-regime-dichotomy, non-scott-continuous-firing-ordinal, aperiodic-regime-cohomology-via-direct-limit, settling-cohomology, settling-associated-sheaf, closure-2-monad, closure-operator]
see-also: [closure-flow-singularity-formation, settling-gauss-bonnet, geometries-of-failure-dynamics-of-void]
---

# Closure flow curvature–regime correspondence

The closure operator's iteration $\sigma \mapsto v_\sigma$ is a discrete flow on the space of valuations. At limit ordinals where the flow commutes with directed $\leq_k$-joins — Scott-continuous points — the flow is **flat** in the connection-theoretic sense: parallel transport (in the ordinal direction) is trivial. At [non-Scott-continuous firing ordinals](teaching/explanations/non-scott-continuous-firing-ordinal.md), the flow has a **curvature event**: the value at the limit ordinal $\mu$ contains cells not recoverable as any directed colimit of earlier values.

The corpus's [settling cohomology](../objects/settling-cohomology.md) $H^1(\mathcal{F}_v)$ classifies the curvature content of the closure flow. This theorem makes the identification precise: the four-regime classification is a classification by total curvature type, and $H^1$ is the curvature module.

## Statement

**Theorem (curvature–regime correspondence).** *Let $v$ be a predication settling on a bitopological settling site with closure ordinal $\kappa$ and settling-associated sheaf $\mathcal{F}_v$. Then:*

1. *(Flat regimes.) $H^1(\mathbf{T}^*, \mathcal{F}_v) = 0$ if and only if $L_{\mathrm{ns}}(\kappa) = \emptyset$ — i.e., the closure flow has no curvature events — if and only if $v$ is in the* strict *or* Scott-continuous *regime ($\kappa \leq \omega$).*

2. *(Curved regimes.) $H^1(\mathbf{T}^*, \mathcal{F}_v) \neq 0$ if and only if $L_{\mathrm{ns}}(\kappa) \neq \emptyset$ — i.e., the closure flow has at least one curvature event — if and only if $v$ is in the* transfinite-bounded *or* aperiodic *regime ($\kappa > \omega$).*

3. *(Curvature module.) $H^1(\mathbf{T}^*, \mathcal{F}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$, with one $\mathbb{Z}$-generator per curvature event. In particular, $\mathrm{rank}\,H^1 = |L_{\mathrm{ns}}(\kappa)|$ — the total curvature event count of the closure flow.*

4. *(Curvature taxonomy of the four regimes.)*

   | Regime | $\kappa$ | $L_{\mathrm{ns}}$ | Total curvature | $H^1$ |
   |---|---|---|---|---|
   | Strict | $< \omega$ | $\emptyset$ | zero, finitely-terminated | $0$ |
   | Scott-continuous | $= \omega$ | $\emptyset$ | zero, $\omega$-terminated | $0$ |
   | Transfinite-bounded | $\omega < \kappa < \omega_1$ | countable, non-empty | finite or countable | $\bigoplus_{|L_{\mathrm{ns}}|} \mathbb{Z}$ |
   | Aperiodic | $\kappa \geq \omega_1$ | uncountable | $\omega_1$-bounded | $\bigoplus_{|L_{\mathrm{ns}}|} \mathbb{Z}$ |

## Proof

### Part 1 and 2: equivalence of $L_{\mathrm{ns}} = \emptyset$ with strict/SC regime

By the [four-regime dichotomy](four-regime-dichotomy.md):

- **Strict regime** ($\kappa < \omega$): the closure 2-monad terminates in finitely many successor steps; every firing occurs at a successor ordinal $\sigma + 1$. Since NSC firing ordinals are limit ordinals where the colimit-to-closure equality fails, and there are no relevant limit ordinals below $\kappa < \omega$, $L_{\mathrm{ns}}(\kappa) = \emptyset$.

- **Scott-continuous regime** ($\kappa = \omega$): by definition, the closure operator is Scott-continuous — it commutes with all directed $\leq_k$-joins. The Scott-continuity condition is exactly that $\mathrm{cl}(\bigvee_k v_\sigma) = \bigvee_k \mathrm{cl}(v_\sigma)$ at every limit ordinal, which is precisely $L_{\mathrm{ns}}(\omega) = \emptyset$.

- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$): non-Scott-continuous by the dichotomy's equivalence ($\kappa > \omega$ and countable cofinality implies the closure is non-SC on some countable limit ordinal). So $L_{\mathrm{ns}}(\kappa) \neq \emptyset$.

- **Aperiodic regime** ($\kappa \geq \omega_1$): non-Scott-continuous with uncountable-cofinality state space. $L_{\mathrm{ns}}(\kappa)$ is non-empty and of cardinality $\omega_1$ or larger.

### Part 3: curvature module identification

By the [aperiodic-regime cohomology via direct limit theorem](aperiodic-regime-cohomology-via-direct-limit.md) (and its transfinite-bounded counterpart):
$$H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_v) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

For the strict and Scott-continuous regimes ($L_{\mathrm{ns}} = \emptyset$), the direct sum over the empty set is $0$. These are also covered directly by the regime-specific cohomology theorems ([strict-regime-cohomology-vanishing](strict-regime-cohomology-vanishing.md), [scott-continuous-regime-cohomology-vanishing](scott-continuous-regime-cohomology-vanishing.md)).

The rank formula $\mathrm{rank}\,H^1 = |L_{\mathrm{ns}}(\kappa)|$ follows by counting generators. $\square$

## The curvature analogy unpacked

The analogy with differential geometry is structural, not metaphorical. A connection $\nabla$ on a bundle over a base $M$ is **flat** iff its curvature 2-form $F_\nabla$ vanishes iff parallel transport along any loop is trivial. In the corpus:

- **"Connection"**: the closure 2-monad $T$ acting on the predication fiber algebra $A_q = \mathbf{L}^{\bowtie\, E \times E}$, advancing valuations at each ordinal step.
- **"Parallel transport"**: the colimit of earlier settling values, $\bigvee_k v_\sigma$ as $\sigma \to \mu$.
- **"Flat"**: the parallel transport agrees with the connection's output — i.e., the closure commutes with the directed join (= Scott-continuity).
- **"Curvature event at $\mu$"**: the connection produces a value $v_\mu$ that the parallel transport cannot; the closure at $\mu$ exceeds the colimit of earlier closures.
- **"Curvature module" $H^1$**: the $\mathbb{Z}$-module generated by one class per curvature event, classifying the curvature content of the full closure flow.

In differential geometry, curvature is a local quantity (the 2-form $F_\nabla$ at each point). In the corpus, curvature is discrete and local in the ordinal direction (the NSC firings $\mu \in L_{\mathrm{ns}}$). Both are classified by the same cohomological tool ($H^1$).

## The two flat regimes and the two curved regimes

The theorem reveals a 2×2 structure:

$$\begin{array}{c|c|c}
 & \text{terminates in } \leq \omega \text{ stages} & \text{requires } > \omega \text{ stages} \\
\hline
\text{flat ($H^1 = 0$)} & \text{strict} & \text{Scott-continuous} \\
\text{curved ($H^1 \neq 0$)} & \text{(impossible)} & \text{transfinite-bounded or aperiodic}
\end{array}$$

The cell "curved and terminates in $\leq \omega$ stages" is empty: a Scott-continuous settling terminates at $\omega$ and has no curvature events; a non-Scott-continuous settling with $\kappa \leq \omega$ would contradict the four-regime characterization ($\kappa > \omega$ for non-SC on infinite bases).

## Connection to the geometric-flow question

The [closure-flow-singularity-formation question](questions/closure-flow-singularity-formation.md) proposes that NSC firings are singularity events in a Ricci-flow–style analysis of the closure dynamics. The present theorem gives the cohomological classification of those singularities: $H^1$ is the "singularity module," classifying singularities by their firing-ordinal class. The blowup analysis proposed in that question would classify the *local structure* of each singularity; the present theorem classifies the *global curvature content* as a $\mathbb{Z}$-module.

The two results are complementary: singularity formation characterizes local structure; curvature–regime correspondence characterizes global cohomological invariants.
