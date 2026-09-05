---
type: question
class: internal
status: open
explores: [aperiodic-regime-cohomology-via-direct-limit, transfinite-bounded-regime-h1-generators, aperiodic-classifying-invariant, strong-mld-via-composed-duality, d-frame-verdier-composition, non-scott-continuous-firing-ordinal]
---

# Typed barcoding of settling cohomology

The corpus's classifying invariants are *sets* — the firing-ordinal set $L_{\mathrm{ns}}(\kappa)$, encoded as $\bigoplus_\mu \mathbb{Z}$ in $H^1$. The settling is naturally filtered by ordinal time $\tau \in [0, \kappa]$, and the cohomology has *birth-and-death* structure over this filtration that predication categories' set-style invariants collapse. Re-presenting the classifying data as a **persistence barcode** over the ordinal filtration recovers the time-axis structure explicitly.

The d-frame setting refines further: each generator carries an **orbit type** (truth-only / falsity-only / $\top$, from the [d-frame Verdier composition](../theorems/d-frame-verdier-composition.md)). A *typed barcode* tracks orbit-type changes — a cell that fires as $\mathbf{t}$ at $\mu_1$ and becomes $\top$ at later $\mu_2$ has a typed-bar $[\mu_1, \mu_2)$ on the truth side closing at $\mu_2$, and a typed-bar $[\mu_2, \kappa)$ on the $\top$ side opening then.

## What a barcode formulation gives

The set-style classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v)$ records *which* firings happen but not their *temporal structure*. Specifically:

- **Persistence visible.** Bars expose how long generators persist before being modified or absorbed by later firings. In predication categories' typical settings (firings don't erase earlier content), bars are $[\mu, \kappa)$ — half-infinite. But settlings with retroactive content (extensions of the framework) would have finite bars.

- **Typed structure.** A typed barcode is essentially the [strong-MLD classification](../theorems/strong-mld-via-composed-duality.md)'s $\mathbb{D}$-equivariant invariant presented in time-axis form. Two typed barcodes are equal iff the strong-MLD classes agree.

- **Stability theorems.** Standard persistent-homology stability ([Cohen-Steiner–Edelsbrunner–Harer 2007]) gives bottleneck-distance bounds between barcodes under perturbation. The corpus's [deformation theory](../theorems/skh-deformation-ext-classification.md) suggests an analog: small first-order deformations of a settling produce small bottleneck-distance changes in the typed barcode.

## Concrete sub-questions

1. **State the barcode theorem.** For a settling $v$ with closure ordinal $\kappa$, the cohomology $H^k(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_v)$ over the filtration $\{\mathbf{T}^*_{\leq \tau}\}_{\tau \leq \kappa}$ admits a barcode decomposition. For predication categories' typical settlings, all bars are half-infinite $[\mu, \kappa)$ for $\mu \in L_{\mathrm{ns}}^{(k)}$.

2. **Define the typed barcode.** Each bar carries the orbit-type label of its firing. The typed barcode is therefore a multi-set of pairs $(\mu, \mathrm{type}_\mu)$ with $\mathrm{type}_\mu \in \{\text{truth-only}, \text{falsity-only}, \top\}$.

3. **Persistence stability under deformation.** Conjecture: deformations in $\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v)$ produce bounded bottleneck-distance changes in the typed barcode. The bound depends on the deformation's $\mathrm{Ext}^1$-norm and the firing-density.

4. **Barcoded MLD-equivalence.** Define **barcode-MLD-equivalence** $\sim_{\mathrm{bMLD}}$ as: two settlings have isomorphic typed barcodes (as multisets up to settling-shift). Show this is exactly the [strong-MLD classification](../theorems/strong-mld-via-composed-duality.md) — typed barcodes ARE the $\mathbb{D}$-equivariant invariant in time-axis presentation.

## Connection to existing literature

The persistent-homology / topological-data-analysis framework (Carlsson 2009, Edelsbrunner–Harer 2010) gives barcodes for sheaf-cohomology over filtered spaces. The corpus's setting fits naturally — the ordinal-filtered settling is a structurally rich filtration, with the four-regime dichotomy stratifying barcodes by their cardinality and structure.

Sheaf-theoretic persistence ([@curry2014]'s thesis discusses this) is the closest established framework. The corpus's bilattice-flavored / Q-enriched extension would be novel content.

## Position in predication categories

This is the most directly accessible of the four "horizon" questions ([failure-event moduli](failure-event-moduli-stack.md), [holographic reconstruction](holographic-sheaf-reconstruction.md), [unified void dynamics](unified-void-dynamics.md), and this one). The persistence theorem is essentially a corollary of the existing direct-limit cohomology theorems, restated to expose the time-axis structure. The typed-barcode refinement uses the strong-MLD machinery directly.

Concrete entry point: state and prove the barcode theorem for the strict / Scott-continuous / transfinite-bounded regimes, where the classifying invariants are already explicit. The aperiodic regime extension follows by direct-limit assembly (paralleling the [aperiodic-regime cohomology via direct limit](../theorems/aperiodic-regime-cohomology-via-direct-limit.md) strategy).
