---
type: narrative
discusses: [settling-associated-sheaf, aperiodic-regime-classification, aperiodic-classifying-invariant, sheaf-functoriality-on-bitopological-site]
kind: narrative
---

# Scope restrictions for the moduli layer

Four loose ends carried forward from the cohomology layer are scope-restricted at the moduli level. Documenting them here so subsequent moduli-theoretic statements can be read with the corresponding hypotheses understood.

## Universal settling-associated sheaf

The [aperiodic-regime classification theorem](../../aperiodic-settling/references/aperiodic-regime-classification.md) invokes a sheaf $\mathcal{F}_U^{\mathrm{univ}} := \mathcal{F}_U \oplus \mathcal{F}_{U'}$ as ambient for comparing two settlings. A *truly universal* sheaf — functorial over the entire moduli — is not constructed at the cohomology layer. Two settings:

- **Single-base setting.** Over a fixed base, the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) is well-defined per settling, and the pairwise universal $\mathcal{F}_U^{\mathrm{univ}}$ suffices for paired comparisons. No truly universal sheaf is needed for fixed-base moduli.
- **Base-varying setting.** Across base parameters, the settling-associated sheaves of varying settlings assemble into a sheaf-of-sheaves on (moduli) × (bitopological site). Existence follows from descent at the base-varying-stack level; full functorial properties are deferred.

## Base-change of the classifying invariant

The [bitopological settling site functoriality](../../bitopological-settling-site/content/assets/legacy/bitopological-settling-site-functoriality.md) establishes site morphisms induced by predication-hyperdoctrine morphisms with common base parameters. Base-change under varying $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is not explicitly tracked at the cohomology layer. At the moduli layer:

- For fixed-base moduli: no base-change needed.
- For base-varying moduli: $\mathbf{L}$-base-change reduces to a Priestley-side topological argument via the [Jung–Rivieccio duality](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md); $(\mathcal{C}, E, \lambda)$-base-change is handled via morphisms.

## Cardinality hypothesis $|E| \geq \omega_1$

The [aperiodic-regime classification theorem](../../aperiodic-settling/references/aperiodic-regime-classification.md) carries the hypothesis $|E| \geq \omega_1$ to ensure the settling has $\omega_1$-many distinct cells available. For $|E| < \omega_1$ with $\kappa = \omega_1$, the settling re-enters previously-populated cells via non-trivial morphisms; the classification still applies but with a refined MLD-equivalence allowing settling-shifted coincidence.

The aperiodic moduli stratum is defined for general $|E|$, but the [moduli classifying function](../morphisms/moduli-classifying-function.md) injection is invoked only on the sub-stratum with $|E| \geq \omega_1$. Other aperiodic moduli points are classified via the refined equivalence, deferred as a refinement.

## Functoriality of $\mathcal{F}_U$ in the increment sequence

Whether $U \mapsto \mathcal{F}_U$ extends to a functor with explicit naturality on settling-data morphisms is not established at the cohomology layer. The moduli layer does not require functorial naturality: settling-data morphisms are handled pointwise via the sheaf condition on the fiber algebra. Full functoriality would slightly strengthen some statements but is not load-bearing.

## What this means in practice

The four scope restrictions narrow the moduli's domain of assertion without weakening the load-bearing theorems within that domain. Fixed-base moduli (the primary target) is fully covered; base-varying moduli is covered modulo descent; aperiodic-regime classification at $|E| \geq \omega_1$ is fully covered. Refinements outside these conditions are documented as future-work openings.
