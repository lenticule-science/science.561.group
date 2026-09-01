---
type: question
class: internal
status: open
explores: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, aperiodic-co-classification, quantale-enriched-cosheaf, settling-associated-sheaf, anderson-putnam-direct-limit]
---

# Holographic reconstruction of settling sheaves from boundary data

The [Verdier duality theorem](../theorems/verdier-duality-bitopological-site.md), via the cellular extension plan's Layers 1+2+3, gives an isomorphism on cohomology classes:

$$H^k(\mathbf{T}^*, \mathcal{F}_v) \;\simeq\; H_k(\mathbf{T}^*, \check{\mathcal{F}}_v).$$

This is structurally a **bulk–boundary correspondence**: the *bulk* (sheaf cocycles, settled content) and the *boundary* (cosheaf cycles, eventually-uncovered content) carry the same cohomological data via duality. The aperiodic co-classification operationalizes this for the headline classifying invariant.

Open: a stronger **holographic reconstruction** statement — not just isomorphism on $H$-classes, but **the entire sheaf $\mathcal{F}_v$ is reconstructible from boundary data alone** (the cosheaf $\check{\mathcal{F}}_v$, restricted appropriately to the boundary clopens).

## What "holographic" means here

In predication categories' setting:

- **Bulk:** the sheaf $\mathcal{F}_v$ on the full bitopological settling site, with stalks at every $(q, \tau, U)$.
- **Boundary:** the cosheaf $\check{\mathcal{F}}_v$ restricted to the *eventually-uncovered* clopens — clopens $U$ at stage $\tau$ such that some cell in $U$ remains $\bot$-uncovered as $\tau' \to \kappa$.

A holographic reconstruction theorem would assert: given the boundary cosheaf data, the entire bulk sheaf is determined up to canonical isomorphism (or up to fuzziness, in the q-fuzzy setting).

For Boolean d-frame stalks the question is mostly trivial — the data is finite combinatorial content at each stalk, and reconstruction follows from the explicit cell-and-firing structure. For richer enrichments (Lawvere quantale, MV-algebras), the question becomes substantive.

## Why this is more than Verdier

Verdier duality gives **isomorphism on cohomology classes**: $H^k$ on each side has the same generator structure. But the sheaf and cosheaf have *more* than their cohomology — they carry full stalk-and-restriction data. Verdier alone does not say bulk-data is reconstructible from boundary-data; it says cohomological invariants of bulk and boundary agree.

Holography is the *strengthening*: not just invariants, but **the underlying objects themselves** are bulk-boundary related. This is significantly stronger than Verdier and requires substantial additional structural content.

## Sub-questions

1. **State the reconstruction conjecture precisely.** Define what "boundary cosheaf data" means (the cosheaf restricted to a specific class of "boundary" clopens, possibly the $\omega_1$-frontier of the settling), and conjecture that the bulk sheaf is reconstructible from this.

2. **Verify in the strict regime.** For finite-cellular fibers and finite settling-axis, give an explicit reconstruction algorithm: from boundary cosheaf data, build up the bulk sheaf cell-by-cell. Strict regime is the natural test case.

3. **Attempt in the Scott-continuous regime.** Filtered colimits of finite reconstruction give a Scott-continuous reconstruction, *if* the reconstruction algorithm is functorial enough. This is structurally analogous to the [aperiodic-regime cohomology via direct limit](../theorems/aperiodic-regime-cohomology-via-direct-limit.md) construction at the level of sheaves rather than cohomology.

4. **Anderson–Putnam analog.** The Anderson–Putnam framework reconstructs substitution-tiling spaces from inverse-limit data. The corpus's holographic reconstruction would parallel this but on the *sheaf* level — a substitution-tiling-style reconstruction theorem for settling sheaves.

5. **Failure mode at non-Boolean values.** For Lawvere-quantale-valued data, where sheaf restrictions aren't necessarily strict adjoints, the reconstruction may be *fuzzy* — recovered up to quantale-graded error. Whether the error is bounded by something computable is open.

## What a holographic reconstruction would give

If established at draft level:

- **The bilattice-valued cohomology framework reduces to a boundary problem.** Computations of $H^k(\mathcal{F}_v)$ become computations of boundary cosheaf data, often more tractable than the bulk version.
- **Concrete computational simplification.** Aperiodic settlings have $\omega_1$-many bulk cells but a (potentially) more compact boundary. Reconstruction makes the boundary the primary computational object.
- **Connection to physics-style holography.** AdS/CFT-style bulk-boundary correspondences in mathematical physics have exact-statement parallels to what the corpus would give: a precise mathematical instance of holography in the topos-theoretic setting.

## Connection to existing structure

The reconstruction question is *downstream* of:

- [Verdier duality](../theorems/verdier-duality-bitopological-site.md) (now draft).
- [Six-functor formalism](../theorems/q-enriched-sheaf-direct-inverse-image.md) (now sketch) — particularly the $f^!$ functor, which is the natural formal apparatus for boundary-to-bulk reconstruction.
- [Aperiodic co-classification](../theorems/aperiodic-co-classification.md) — establishes the cohomological holography; the question asks whether this lifts to sheaf-level holography.

## Position in predication categories

This is the *deepest* of the four "horizon" questions ([typed barcoding](typed-barcoding-of-settling-cohomology.md), [unified void dynamics](unified-void-dynamics.md), [failure-event moduli](failure-event-moduli-stack.md), and this one). It requires sheaf-level structural content, not just cohomological.

Concrete entry point: the strict regime, where the bulk is finite. Build the reconstruction algorithm explicitly, verify it gives the correct sheaf on small examples (the worked strict-regime examples already in the corpus), and identify where the algorithm needs Scott-continuous extension. The full Aperiodic case is downstream of all this.

This direction is predication categories' natural connection to the mathematical-physics literature on holography (AdS/CFT-style) — without making physics commitments, it gives a precise topos-theoretic instance of bulk-boundary reconstruction with explicit invariants.
