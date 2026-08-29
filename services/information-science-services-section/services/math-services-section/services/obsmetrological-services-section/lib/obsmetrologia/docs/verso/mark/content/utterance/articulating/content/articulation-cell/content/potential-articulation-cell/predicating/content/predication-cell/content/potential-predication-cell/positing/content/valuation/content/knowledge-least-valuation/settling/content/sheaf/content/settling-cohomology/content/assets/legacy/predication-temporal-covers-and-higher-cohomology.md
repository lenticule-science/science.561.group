---
type: question
class: internal
status: open
explores:
  - bitopological-settling-site
  - settling-cohomology
  - settling-cohomology-vanishes-above-degree-1
  - q-enriched-cohomology-higher-degree-vanishing
  - exceptional-higher-cohomology
  - anderson-putnam-direct-limit
---

# Temporal covers and the $H^{\geq 2}$ vanishing

The [bitopological settling site](../objects/bitopological-settling-site.md) explicitly **forbids temporal covers**. Covering families are *only* fiber-level pairwise-Stone refinements at fixed $(q, \tau)$; families of the form $\{(q, \tau_i, U) \to (q, \tau, U)\}_{\tau_i \geq \tau}$ are not covering. Cross-ordinal settling structure is carried in *morphisms* — the $h$-component of the morphism triples $(f, h, j)$ — and cross-ordinal cohomological content is extracted at the cohomology level via direct limits along settling morphisms, [Anderson–Putnam-style](../objects/anderson-putnam-direct-limit.md).

This choice is load-bearing for the [degree-1 vanishing theorem](../theorems/settling-cohomology-vanishes-above-degree-1.md) and its [Q-enriched analog](../theorems/q-enriched-cohomology-higher-degree-vanishing.md). The Leray spectral sequence collapse depends on:

- *Fiber vanishing:* $R^q \pi_* F = 0$ for $q \geq 1$, via skyscraper-on-Stone-space arguments.
- *Base vanishing:* $H^p(\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}, -) = 0$ for $p \geq 2$, tightened to $p \geq 2$ on firing-localized sheaves via the linear-temporal-filtration.

Both vanishings rely on the fiber-only-covers structure. If covering sieves crossed settling-ordinals, neither argument would go through unchanged — gluing obstructions across the temporal direction would presumably populate $H^2$, and the framework's degree-1 cap would lift.

## The question

What does the cohomology of the bitopological settling site look like when covers are allowed to cross settling-ordinals?

## Sub-questions

**1. The "temporal cover" structure.** Define a Grothendieck topology $J^{\mathrm{temp}}$ enriching $J$ with covers that descend a sieve from $(q, \tau, U)$ along a non-trivial subset of $\{(q, \tau_i, U)\}_{\tau_i \leq \tau}$. What are the natural candidates?

- *Settling-monotone covers.* The family $\{(q, \tau_i, U_i)\}_{i \in I}$ with $\tau_i \leq \tau$ covers $(q, \tau, U)$ if the $v_{\tau_i}$-images cover the $v_\tau$-image cell-wise. This makes "the settled-cell content at $\tau$ is determined by the family at earlier stages."
- *Closure-step covers.* Sieves built from single $\mathrm{Cl}$-application steps. Covers "$(q, \tau)$ by the pre-closure family at $(q, \tau - 1)$."
- *Anderson-Putnam-tower covers.* The settling-endofunctor's iterates supply a tower; AP-style refinement gives a Grothendieck topology by analogy with substitution-tile covers.

Each choice is a different framework. The question is which one classifies natural mathematical content.

**2. $H^2$ content under each choice.** For each candidate temporal topology, what does $H^2$ classify?

- *Cross-ordinal gluing obstructions.* The first guess: sections agreeing fiber-wise at $(q, \tau_i, U_i)$ but failing to glue to a global section across the temporal cover. This is the structural analog of $H^1$ classifying cross-fiber gluing obstructions.
- *Higher-dimensional firing dependencies.* A non-Scott-continuous firing at $\mu$ depends on a $\mu$-cofinal sub-orbit of prior settlings; this dependency structure could carry higher-dimensional cohomology when the cover is temporal.
- *Anderson-Putnam $H^2$.* The Anderson–Putnam direct limit on substitution-tile cohomology has non-trivial higher-degree content for higher-dimensional tilings; the PCT analog under AP-style temporal covers may inherit this content.

**3. Relationship to the existing degree-1 cap.** Is the fiber-only-covers choice mathematically *necessary* (e.g., does any natural temporal topology force structural problems with the closure-driven dynamics?), or is it a *design choice* that keeps the framework degree-1-bounded by construction?

If the latter, temporal-cover variants are alternative cohomology theories on the same underlying objects, each picking up its own classifying invariants. The relationship between them would be its own typed-comparison question, parallel to the [cohomological-framework-2-category](../objects/cohomological-framework-2category.md).

**4. Engagement with [exceptional-$H^{\geq 2}$ candidates](exceptional-higher-cohomology.md).** That question identified three candidates for higher-degree content (non-standard sheaves, higher-order morphisms, quantum analogs); temporal covers is structurally a *fourth* candidate, sitting at the level of *which Grothendieck topology* rather than which value category or which morphism type. Pursuing it alongside the other three may sharpen the picture of what the degree-1 cap is actually a cap on.

## Why this matters

The degree-1 cap is the cleanest structural simplification in the corpus, and it determines the shape of the entire classifying-invariant programme. Understanding *whether the cap is a feature of PCT or a feature of this particular Grothendieck-topology choice* is structural information about what the framework actually says about predication dynamics. If temporal-cover variants exist and have rich $H^{\geq 2}$ content, the framework's "everything classifies in $H^1$" claim is properly read as "in *this* cohomology theory; other theories exist."

The aperiodic regime is the natural test bed — that's where the temporal direction has the most content, and where the degree-1 cap is most surprising relative to the apparent richness of $\omega_1$-many firing-ordinal generators.
