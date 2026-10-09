---
type: definition
class: sheaf
depends-on: [transfinite-cell-complex, quantale-enriched-sheaf, quantale-enriched-cosheaf, lopez2024]
---

# Q-enriched cellular sheaf on a transfinite cell complex

A **$\mathsf{Q}$-enriched cellular sheaf on a [transfinite cell complex](transfinite-cell-complex.md)** $X$ extends the [Q-enriched cellular sheaf](../../../../../../../../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md) framework from finite regular CW complexes to transfinite (countable-cofinal) cellular bases. The data is the same per-cell — stalks in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, restrictions as $\mathsf{Q}$-functors along face incidences — but the cellular base now has $\omega_1$-many cells, indexed by a countable ordinal up to $\omega_1$.

The substantive new structural feature: the directed colimit presentation $X = \mathrm{colim}_{F \subseteq_{\mathrm{fin}}} X|_F$ induces an inverse limit on stalks and a directed colimit on cosheaves, and the **Q-enriched cellular sheaf on $X$** is determined by — and uniquely reconstructible from — its restrictions to finite sub-complexes.

## Definition

A **$\mathsf{Q}$-enriched cellular sheaf on $X$** is the data of:

- For each cell $\sigma \in \mathrm{cells}(X)$: a stalk $F(\sigma) \in \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.
- For each face incidence $\sigma \prec \tau$ (with $\dim \sigma + 1 = \dim \tau$): a $\mathsf{Q}$-functor $f_\sigma^\tau : F(\sigma) \to F(\tau)$.

Subject to the structural condition that for every finite sub-complex $X|_F \subseteq X$, the restriction $F|_{X|_F}$ is a Q-enriched cellular sheaf in the [finite CW-complex sense](../../../../../../../../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md). Equivalently: the data $\{F(\sigma), f_\sigma^\tau\}$ is the colimit of its finite-sub-complex restrictions.

## Cohomology by direct limit

The Q-enriched cellular cohomology of $F$ on $X$ is defined as a directed colimit:

$$H^k(F) \;:=\; \varinjlim_{F \subseteq_{\mathrm{fin}}} H^k(F|_{X|_F})$$

— the colimit over finite cellular sub-complexes of the corresponding [finite Q-enriched cohomology](../../../../../../../../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md).

For each finite sub-complex $X|_F$, $H^k(F|_{X|_F})$ is computed by the [finite CW-complex theorem](../theorems/q-enriched-curry-cw-complex.md) — equalizers and coequalizers in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$. The directed colimit is the colimit in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ of these finite-stage cohomologies along the inclusion-induced transitions.

This generalizes predication categories' [aperiodic-regime cohomology via direct limit](../../../../../../../../../../../../references/aperiodic-regime-cohomology-via-direct-limit.md) construction from $\mathbf{Ab}$-valued cohomology to the Q-enriched setting.

## Cosheaf homology by direct limit

Dually, the Q-enriched cellular cosheaf $\check{F}$ on $X$ has stalks $\check{F}(\sigma) = F(\sigma)$ and extensions $\check{f}_\sigma^\tau : F(\tau) \to F(\sigma)$ given by the [fuzzy right adjoints](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/bibliographies/lopez2024.md) of the sheaf restrictions, with quantale-graded fuzziness $q_\sigma^\tau \in \mathsf{Q}$.

Cosheaf homology by directed colimit:

$$H_k(\check{F}) \;:=\; \varinjlim_{F \subseteq_{\mathrm{fin}}} H_k(\check{F}|_{X|_F}).$$

## Transfinite fuzziness profile

The per-finite-sub-complex Curry fuzzinesses $q_k(X|_F, F|_{X|_F})$ from the finite CW-complex theorem accumulate along the directed system. The **transfinite degree-$k$ fuzziness** is

$$q_k^{\mathrm{transfin}}(X, F) \;:=\; \bigwedge_{F \subseteq_{\mathrm{fin}}} q_k(X|_F, F|_{X|_F}),$$

a meet over all finite sub-complexes. Since $\mathsf{Q}$ has all (in particular, countable) meets, this is well-defined. **The substantive technical question** is whether the meet remains $\succ \bot$ — i.e., whether the per-finite-sub-complex fuzzinesses don't degenerate to vacuous in the limit.

For sheaves whose per-finite-sub-complex fuzzinesses are bounded below by a fixed $q_\ast \succ \bot$ (independent of the sub-complex), $q_k^{\mathrm{transfin}} \succeq q_\ast$ — the meet is non-degenerate. For sheaves whose finite-sub-complex fuzzinesses tend to $\bot$ as the sub-complex grows, $q_k^{\mathrm{transfin}} = \bot$ and the Curry equivalence at the transfinite level is vacuous.

The non-degeneracy of $q_k^{\mathrm{transfin}}$ is the key concrete check for any transfinite cellular sheaf coming from the bitopological settling site's aperiodic-regime fibers.

## Examples relevant to the corpus

**Strict-regime fibers (finite-cellular).** Already covered by the finite CW-complex theorem; transfinite framework collapses to finite case.

**Scott-continuous-regime fibers (countably-cellular but Scott-continuous).** Each finite sub-complex has trivial Curry fuzziness ($q^{\mathrm{fib}} = 1$) for Boolean d-frame data; $q^{\mathrm{transfin}} = 1$ uniformly. The transfinite framework adds nothing beyond the existing direct-limit techniques.

**Aperiodic-regime fibers ($\omega_1$-cofinal cell index).** Each non-Scott-continuous firing ordinal $\mu \in L_{\mathrm{ns}}(\kappa)$ contributes new cellular structure. The per-finite-sub-complex fuzziness depends on the structure of restrictions across firing ordinals: whether the closure rule preserves strict adjoints (giving $q = 1$) or only fuzzy ones ($q \prec 1$). The transfinite fuzziness at the full $\kappa$-cellular base is the meet over all finite truncations.

For predication categories' typical aperiodic-regime settings — closure rules of $\Pi_1$-schema form, with Boolean predication fiber algebras — the per-finite-sub-complex fuzziness is uniformly $q = 1$, and the transfinite-Curry framework gives a strict (not just q-fuzzy) Curry equivalence in degree zero. Higher degrees and stronger fuzziness behavior are open structural questions.

## Position in predication categories

This definition completes the **definitional infrastructure for Layer 3** of the [cellular extension plan](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cellular-extension-plan.md). Together with [transfinite cell complex](transfinite-cell-complex.md) (the cellular base) and [Q-enriched cellular sheaf](../../../../../../../../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/quantale-enriched-sheaf.md) (the value-side framework on finite bases), this object is the input for the [transfinite Curry equivalence](../theorems/q-enriched-curry-transfinite-cw.md) — the substantive Layer-3 theorem.

The [Grothendieck-site lift](../theorems/q-enriched-curry-grothendieck-site.md) for transfinite-cellular fibers — needed for full Verdier coverage on the bitopological settling site — uses Q-enriched transfinite cellular sheaves on each fiber, assembled across the base via the same fibered-cellular framework as the finite-cellular case but now with transfinite per-fiber data.
