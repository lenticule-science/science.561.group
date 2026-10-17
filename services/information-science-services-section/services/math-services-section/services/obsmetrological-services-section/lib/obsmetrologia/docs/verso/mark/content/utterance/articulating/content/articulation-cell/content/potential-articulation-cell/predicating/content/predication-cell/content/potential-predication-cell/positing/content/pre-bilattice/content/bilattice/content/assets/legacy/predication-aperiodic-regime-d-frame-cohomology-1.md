---
kind: theorem
status: sketch
depends-on: [d-frame-valued-sheaf, d-frame-cohomology-comparison, transfinite-bounded-regime-d-frame-cohomology, aperiodic-regime-cohomology-via-direct-limit, non-scott-continuous-firing-ordinal, anderson-putnam-direct-limit, four-regime-dichotomy, aperiodic-settling, lawvere-laplacian-grothendieck-sites, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw, transfinite-cell-complex]
---

# Aperiodic-regime d-frame cohomology

For a knowledge presheaf $v$ in the [aperiodic regime](../../../../../../valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) with closure ordinal $\kappa \geq \omega_1$, the [d-frame-valued cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) of $\mathbb{F}_v$ is

$$H^n_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \kappa}, \mathbb{F}_v) \;\cong\; \begin{cases} \displaystyle\varinjlim_{\tau < \kappa} H^0_{\mathbf{dFrm}}(\mathbb{F}_v|_{\leq \tau}) & n = 0, \\ \displaystyle\varinjlim_{\tau < \kappa} H^1_{\mathbf{dFrm}}(\mathbb{F}_v|_{\leq \tau}) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} D_\mu & n = 1, \\ 0 & n \geq 2, \end{cases}$$

where $D_\mu$ is the d-frame generator at firing ordinal $\mu$ as in [transfinite-bounded-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md), and the direct limit is taken over the directed system of truncations $\mathbf{T}^*_{\leq \tau}$ for countable ordinals $\tau < \kappa$.

Under the [shadow comparison](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md), this matches the existing $\mathbf{Ab}$-valued [aperiodic-regime cohomology via direct limit](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) theorem on each evidence side, with d-frame generators packaging the consistency-totality content not visible in the abelianized direct limit.

## Proof (via direct-limit assembly)

The proof structure mirrors the existing $\mathbf{Ab}$-valued aperiodic direct-limit argument, lifted to the d-frame setting. With the [transfinite-bounded d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md) at draft status (Layer 1 + countable convergence), the aperiodic case follows by direct limit at countable scale.

**Step 1 (cellular structure).** For aperiodic settlings, $\kappa \geq \omega_1$ has uncountable cofinality. Paired-Priestley fibers at any $\tau < \kappa$ are countably-cellular (the truncation $\mathbf{T}^*_{\leq \tau}$ is in either the Scott-continuous or transfinite-bounded regime depending on $L_{\mathrm{ns}}(\tau)$). The full $\omega_1$-scale fiber is the colimit of these countable truncations.

**Step 2 (Laplacian framework on truncations).** For each truncation $\tau < \kappa$, the [Lawvere Laplacian on Grothendieck sites](lawvere-laplacian-grothendieck-sites.md) applies (Layer 1 sheaf-compatibility, cardinality-independent). The Tarski–Lawvere Fixed Point Theorem gives convergence at the truncation's countable cofinality.

**Step 3 (truncation cohomology).** For each $\tau < \kappa$, the truncation $\mathbf{T}^*_{\leq \tau}$ falls in one of:

- *Scott-continuous truncation* (no $L_{\mathrm{ns}}$ within $\tau$): [Scott-continuous-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md) gives $H^{\geq 1}(\mathbf{T}^*_{\leq \tau}, \mathbb{F}_v) = 0$.
- *Transfinite-bounded truncation* ($L_{\mathrm{ns}}(\tau) \neq \emptyset$): [transfinite-bounded-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md) gives $H^1(\mathbf{T}^*_{\leq \tau}, \mathbb{F}_v) = \bigoplus_{\mu \in L_{\mathrm{ns}}(\tau)} D_\mu$.

**Step 4 (direct-limit assembly).** The unbounded settling cohomology is the direct limit of truncation cohomologies. By the direct-limit definition of [settling cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/settling-cohomology.md):

$$H^n_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \kappa}, \mathbb{F}_v) \;:=\; \varinjlim_{\tau < \kappa} H^n_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \tau}, \mathbb{F}_v).$$

Direct limits exist in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ at any cardinality: filtered colimits in complete weighted lattices are the standard pointwise filtered-colimit construction, computed at each component frame and then quotient by the equalizer for consistency / totality. The directed system over countable truncations $\tau < \omega_1$ has well-defined transitions:

- *Scott-continuous-to-transfinite-bounded* (entering a stage with new NSC firings): the transition adds $D_\mu$ generators for the new firings.
- *Within-Scott-continuous segments*: identity transitions.
- *Within-transfinite-bounded segments*: generator-additions for newly-encountered NSC firings.

The colimit over all $\tau < \kappa$ produces:

$$H^1_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \kappa}, \mathbb{F}_v) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} D_\mu,$$

where $D_\mu$ is the d-frame generator constructed in [transfinite-bounded-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md) Step 4.

The $H^0$ formula holds analogously: $H^0(\mathbf{T}^*_{\leq \kappa}) = \varinjlim_\tau H^0(\mathbf{T}^*_{\leq \tau})$. Higher cohomology vanishes by the [3-axis vanishing](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md) (sketch).

**Why the direct-limit definition avoids needing Layer 3 fully.** The Tarski–Lawvere fixed-point convergence at $\omega_1$-cofinality is *not* required for this proof, because we don't iterate the Laplacian to convergence at the unbounded settling — we *define* the unbounded cohomology as the colimit of truncation cohomologies. Each truncation has countable cofinality, where the standard Tarski–Lawvere fixed-point theorem gives convergence. The colimit over truncations is the categorical operation, requiring no fixed-point convergence at $\omega_1$.

This matches the corpus's existing [aperiodic-regime cohomology via direct limit](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) Ab-valued theorem's strategy exactly. $\square$

**Shadow comparison.** Under the [shadow functor](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md), $\mathbb{S}(H^1_{\mathbf{dFrm}}) = (\bigoplus_{\mu \in L_{\mathrm{ns}}^+} \mathbb{Z}, \bigoplus_{\mu \in L_{\mathrm{ns}}^-} \mathbb{Z})$ on the positive and negative paraconsistent shadow sides respectively, matching the existing [aperiodic-regime cohomology via direct limit](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) theorem applied to $\mathcal{F}_v^{(k)}$ and $\mathcal{F}_v^{(k, -)}$.

## The Anderson–Putnam template, lifted to d-frames

The corpus's existing aperiodic theorem mirrors the Anderson–Putnam direct-limit construction for substitution tilings: finite-stage cohomologies are individually tractable, the directed system has well-defined transitions, the cohomology of the unbounded object is the colimit. The d-frame version preserves this structure but enriches the value type.

The d-frame analogue of the [Anderson–Putnam direct-limit](../objects/anderson-putnam-direct-limit.md) construction would be:

- Finite-stage paired-Priestley spectra (cellular for finite distributive bilattices) → d-frames.
- Inverse-limit Priestley spectrum at $\omega_1$ → transfinite d-frame.
- Cohomology of the inverse-limit dual = direct-limit of finite-stage cohomologies, in the d-frame setting.

Layer 3 of the cellular extension plan effectively requires constructing this transfinite-d-frame Anderson–Putnam template.

## Refined classification at the aperiodic stratum

Once the d-frame aperiodic cohomology is established, the [aperiodic-regime classification](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) refines: two aperiodic settlings are d-frame-MLD-equivalent iff their $\omega_1$-scale firing-ordinal d-frames agree. This is a substantively finer classification than the existing $\mathbf{Ab}$-valued MLD-equivalence — it distinguishes settlings whose firing ordinal interactions differ even when the per-side firing-ordinal sets agree.

This is the d-frame setting's contribution to the [strong-MLD-classification question](../questions/strong-mld-classification.md) at the aperiodic level: a candidate refined classifying invariant whose discriminating power exceeds the bigraded refinement.

## Position in the program

This theorem is now established at draft level. The cellular extension plan's three layers — Layer 1 ([finite CW-complex Curry](q-enriched-curry-cw-complex.md)), Layer 3 ([transfinite-CW Curry](q-enriched-curry-transfinite-cw.md)), and Layer 2 ([Grothendieck-site lift](q-enriched-curry-grothendieck-site.md), extended to admit transfinite per-fiber input) — are all in place at draft level. Together with the underlying [transfinite-bounded d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md) (also draft) supplying the per-truncation cohomology content, the aperiodic theorem follows by the direct-limit assembly described above.

The aperiodic-regime case is where the bilattice-valued cohomology project's full ambition lives: structurally-faithful invariants on the regime where the corpus's most intricate classification machinery operates. With the cellular extension plan now executed at draft level, this ambition is concretely realized — the d-frame cohomology in the aperiodic regime is computed via direct-limit assembly from the per-truncation transfinite-bounded theorem, with the d-frame generators $D_\mu$ articulating the per-firing structure that the abelianized shadow drops.

The chapter's frontier moves to:

- **Concrete computations** of $H^1_{\mathbf{dFrm}}$ for specific aperiodic settlings, exhibiting the d-frame structure beyond the shadow.
- **The aperiodic co-classification** ([aperiodic-co-classification theorem](aperiodic-co-classification.md)) — the cosheaf-side dual presentation, paired with the present theorem via Verdier duality.
- **The strong-MLD classification refinement** ([strong-MLD theorem](strong-mld-via-composed-duality.md)) — using the d-frame H^1 to refine the aperiodic classification by composed-duality orbit type.
