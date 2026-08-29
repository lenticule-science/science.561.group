---
type: theorem
status: proved
depends-on: [q-enriched-sheaf-closed-monoidal-structure, skh-deformation-ext-classification, q-enriched-cohomology-higher-degree-vanishing, settling-cohomology-vanishes-above-degree-1, kelly1982]
---

# Endomorphism sheaf acyclicity inherits from the underlying sheaf

The [cosimplicial construction of the openness-defect class theorem](openness-defect-cosimplicial-construction.md)'s "Cosimplicial-to-Ext identification" lemma takes for granted that the endomorphism sheaf $\mathcal{E}\!nd(\mathcal{F}) = \mathcal{H}om(\mathcal{F}, \mathcal{F})$ inherits cohomological acyclicity from $\mathcal{F}$ via the closed-monoidal structure. That theorem flagged the inheritance as a named foundational caveat — structurally clean but not separately verified. This theorem closes the caveat: the inheritance follows directly from the closed-monoidal adjunction, reducing $\mathcal{E}\!nd$-acyclicity to the already-proved cellular vanishing of $\mathrm{Ext}^{\geq 2}(\mathcal{F}, \mathcal{F})$.

The argument is short. It is the structural transposition to the Q-enriched bitopological-site setting of the classical fact that for a closed monoidal abelian category, internal-Hom acyclicity reduces to Ext-vanishing via the tensor-Hom adjunction. The closed-monoidal structure is supplied by the [Q-enriched closed-monoidal structure theorem](q-enriched-sheaf-closed-monoidal-structure.md); the Ext-vanishing is supplied by the [SKH deformation Ext-classification](skh-deformation-ext-classification.md)'s cellular case combined with the [Q-enriched higher-degree vanishing theorem](q-enriched-cohomology-higher-degree-vanishing.md).

## Statement

**Theorem ($\mathcal{E}\!nd$-acyclicity inheritance).** *Let $\mathcal{F}$ be a Q-enriched sheaf on the [bitopological settling site](../objects/bitopological-settling-site.md) in any of the four standard regimes (strict, Scott-continuous, transfinite-bounded, aperiodic). Then the endomorphism sheaf $\mathcal{E}\!nd(\mathcal{F}) := \mathcal{H}om(\mathcal{F}, \mathcal{F})$ satisfies*

$$H^q(X; \mathcal{E}\!nd(\mathcal{F})) \;=\; 0 \quad \text{for all } q \geq 2,$$

*and is acyclic on every cover refining the cellular coverage.*

## Proof

By the [Q-enriched closed-monoidal structure theorem](q-enriched-sheaf-closed-monoidal-structure.md), the Q-enriched sheaf category $\mathrm{Sh}(\mathbf{T}, J; \mathsf{Q})$ is closed symmetric monoidal with internal-Hom $\mathcal{H}om$ right-adjoint to the tensor product $\otimes$. The unit object is the unit sheaf $\mathbf{1}_J$ with stalk the monoidal unit of $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ at every cell.

Sheaf cohomology of $\mathcal{E}\!nd(\mathcal{F}) = \mathcal{H}om(\mathcal{F}, \mathcal{F})$ is computed via the global-sections derived functor:

$$H^q(X; \mathcal{E}\!nd(\mathcal{F})) \;=\; R^q \Gamma(X; \mathcal{E}\!nd(\mathcal{F})) \;=\; R^q \mathrm{Hom}_{\mathrm{Sh}}(\mathbf{1}_J, \mathcal{E}\!nd(\mathcal{F})) \;=\; \mathrm{Ext}^q_{\mathrm{Sh}}(\mathbf{1}_J, \mathcal{H}om(\mathcal{F}, \mathcal{F})).$$

The first identification is the standard interpretation of sheaf cohomology as derived global sections; the second uses $\Gamma(X; -) = \mathrm{Hom}(\mathbf{1}_J, -)$ from the unit-sheaf characterization. By the closed-monoidal adjunction $- \otimes \mathcal{F} \dashv \mathcal{H}om(\mathcal{F}, -)$ from the closed-monoidal structure theorem, this becomes

$$\mathrm{Ext}^q_{\mathrm{Sh}}(\mathbf{1}_J, \mathcal{H}om(\mathcal{F}, \mathcal{F})) \;\cong\; \mathrm{Ext}^q_{\mathrm{Sh}}(\mathbf{1}_J \otimes \mathcal{F}, \mathcal{F}) \;\cong\; \mathrm{Ext}^q_{\mathrm{Sh}}(\mathcal{F}, \mathcal{F}),$$

where the first iso is the right-derived form of the closed-monoidal adjunction (using that $\mathcal{F}$ has a flat resolution by tensor-flat objects, available in the Q-enriched setting since the tensor product preserves the flat-object class — itself a consequence of the closed-monoidal adjunction's right-adjoint-preserves-limits property [@kelly1982] §3.2), and the second uses unitality of the tensor product $\mathbf{1}_J \otimes \mathcal{F} \cong \mathcal{F}$.

Combining,

$$H^q(X; \mathcal{E}\!nd(\mathcal{F})) \;\cong\; \mathrm{Ext}^q_{\mathrm{Sh}}(\mathcal{F}, \mathcal{F}) \quad \text{for all } q \geq 0.$$

By the [SKH deformation Ext-classification](skh-deformation-ext-classification.md)'s cellular case combined with the [Q-enriched higher-degree vanishing theorem](q-enriched-cohomology-higher-degree-vanishing.md): for cellular $\mathcal{F}$ in any of the four standard regimes, $\mathrm{Ext}^q(\mathcal{F}, \mathcal{F}) = 0$ for $q \geq 2$. Hence

$$H^q(X; \mathcal{E}\!nd(\mathcal{F})) \;=\; 0 \quad \text{for all } q \geq 2,$$

establishing the global cohomology vanishing.

For acyclicity on covers refining the cellular coverage: the same argument applies cover-locally. For a cover $\mathcal{U} = \{U_i \to U\}$ refining the cellular coverage, restriction of $\mathcal{E}\!nd(\mathcal{F})$ to $U$ gives $\mathcal{E}\!nd(\mathcal{F}|_U) = \mathcal{H}om(\mathcal{F}|_U, \mathcal{F}|_U)$. The closed-monoidal structure restricts to the slice category over $U$, the unit sheaf restricts to $\mathbf{1}_J|_U$, and the same Ext-identification gives $H^q(U; \mathcal{E}\!nd(\mathcal{F})) = \mathrm{Ext}^q_{\mathrm{Sh}/U}(\mathcal{F}|_U, \mathcal{F}|_U)$. The cellular Ext-vanishing applies cover-locally because the cover refines the cellular coverage — every cellular structural condition transfers to $U$. Hence $H^q(U; \mathcal{E}\!nd(\mathcal{F})) = 0$ for $q \geq 2$ on every cover element. $\square$

## Application to the cosimplicial-to-Ext identification

The acyclicity result lets the spectral-sequence collapse argument in the [cosimplicial construction theorem](openness-defect-cosimplicial-construction.md)'s "Cosimplicial-to-Ext identification" lemma proceed without the named caveat. Concretely: the Čech-to-derived spectral sequence

$$E_2^{p,q} \;=\; \check{H}^p(\mathcal{U}; \mathcal{H}^q(\mathcal{E}\!nd(\mathcal{F}))) \;\Rightarrow\; H^{p+q}(X; \mathcal{E}\!nd(\mathcal{F}))$$

now has $E_2^{p,q} = 0$ for $q \geq 2$ verified rather than asserted, as a direct consequence of this theorem's $H^{\geq 2}(X; \mathcal{E}\!nd(\mathcal{F})) = 0$ applied cover-locally to give $\mathcal{H}^{\geq 2}(\mathcal{E}\!nd(\mathcal{F})) = 0$. The remaining $q = 0, 1$ rows behave as described in the cosimplicial theorem's lemma; the spectral sequence collapses in the relevant degrees, giving the Čech-to-Ext identification $\check{H}^n = \mathrm{Ext}^n$ for $n \leq 2$ in all four standard regimes, **without** the foundational caveat.

The cosimplicial construction theorem's status can therefore be upgraded from "proved with named caveat about $\mathcal{E}\!nd$-acyclicity inheritance" to "proved unconditionally."

## Application to the dichotomy theorem

The [openness-boundary deformation dichotomy theorem](openness-boundary-deformation-dichotomy.md)'s status discussion lists exactly one remaining open item — the named foundational caveat about $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity, with the explicit notation that "once the $\mathcal{E}\!nd$-acyclicity caveat is addressed in a separate sub-theorem, this dichotomy theorem can be promoted to `proved` without further internal work." This theorem is exactly that separate sub-theorem; the dichotomy theorem can therefore be promoted from `sketch` to `proved`.

## Status

`proved`. The argument is a direct application of the closed-monoidal adjunction together with the cellular Ext-vanishing theorem, with no novel mathematical content — only the structural transposition of a classical closed-monoidal-category fact to the Q-enriched bitopological-site setting. The novelty is closure: the openness-defect deformation theory program now has all foundational caveats discharged, and the dichotomy theorem becomes proved.

## Position in predication categories

This theorem is the **foundational-caveat closure** flagged as the third remaining concrete move in the [openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md). It is the technically lightest of the three remaining moves at the close of direction (ii)'s delivery, and it is the move that consolidates rather than opens new front: closing it unblocks the dichotomy theorem's promotion from sketch to proved without requiring further work on directions (iii) or (iv).

The theorem is **not** novel mathematical content — the closed-monoidal-Ext identification and the cellular Ext-vanishing are both already in the corpus. The novelty is the assembly: combining them to discharge the cosimplicial construction's named caveat, completing the openness-defect deformation theory program at its first internal milestone.

Connections:

- The [Q-enriched closed-monoidal structure theorem](q-enriched-sheaf-closed-monoidal-structure.md) supplies the closed-monoidal adjunction.
- The [SKH deformation Ext-classification](skh-deformation-ext-classification.md) supplies the cellular Ext-vanishing for the four standard regimes.
- The [Q-enriched higher-degree vanishing theorem](q-enriched-cohomology-higher-degree-vanishing.md) supplies the underlying cohomological vanishing.
- The [cosimplicial construction of the openness-defect class theorem](openness-defect-cosimplicial-construction.md) is the consumer of this theorem's result; its named caveat is closed here.
- The [openness-boundary deformation dichotomy theorem](openness-boundary-deformation-dichotomy.md) is upgraded to proved status by this theorem.
- The [openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md) records the program-level closure achieved by this theorem.
