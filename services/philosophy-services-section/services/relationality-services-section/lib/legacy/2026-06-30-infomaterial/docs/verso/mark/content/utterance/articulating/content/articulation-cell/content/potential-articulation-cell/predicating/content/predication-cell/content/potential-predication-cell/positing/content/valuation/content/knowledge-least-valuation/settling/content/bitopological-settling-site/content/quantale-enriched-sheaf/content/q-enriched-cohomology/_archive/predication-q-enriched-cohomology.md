---
type: definition
class: cohomology
symbol: "H^n_{\\mathsf{Q}}"
depends-on: [quantale-enriched-sheaf, lawvere-laplacian-grothendieck-sites, d-frame-valued-sheaf]
---

# Q-enriched cohomology

The $\mathsf{Q}$-enriched cohomology of a $\mathsf{Q}$-enriched sheaf $F$ on a Grothendieck site $(\mathbf{T}, J)$, defined via the standard cochain-complex construction with kernel and image computed in the $\mathsf{Q}$-Cat sense.

## Definition

Fix a commutative unital quantale $\mathsf{Q}$, a Grothendieck site $(\mathbf{T}, J)$, and a $\mathsf{Q}$-enriched sheaf $F : \mathbf{T}^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ ([definition](quantale-enriched-sheaf.md)).

**Cochain complex.** The $n$-th cochain group is

$$C^n F \;:=\; \prod_{\sigma \in \mathbf{T}_n} F(\sigma) \;\in\; \mathbf{Q\text{-}Cat}_{\mathrm{cwl}},$$

where $\mathbf{T}_n$ is the set of $n$-dimensional objects of $\mathbf{T}$ — informally, those reached by length-$n$ chains of non-identity morphisms. (For graphs, $\mathbf{T}_0 = V$ and $\mathbf{T}_1 = E$. For our [bitopological settling site](bitopological-settling-site.md), $\mathbf{T}_n$ corresponds to $n$-dimensional cells in the cellular structure.)

**Coboundary.** The coboundary $\delta^n : C^n F \to C^{n+1} F$ is the standard sheaf-theoretic coboundary in the enriched setting. For each $(n+1)$-dim cell $\tau$ with face structure $\partial \tau = \{\sigma_0, \ldots, \sigma_k\}$ (the $n$-dim cells in $\tau$'s boundary), the coboundary's $\tau$-component takes a cochain $x \in C^n F$ to

$$(\delta^n x)(\tau) \;=\; \bigwedge^W_{i = 0}^{k} F(\sigma_i \to \tau)^*(x(\sigma_i))$$

where $F(\sigma_i \to \tau)^*$ is the right $\mathsf{Q}$-adjoint of the restriction $F(\sigma_i \to \tau) : F(\tau) \to F(\sigma_i)$, and $\bigwedge^W$ is a weighted meet whose weight $W$ encodes the cell-incidence structure (sign, multiplicity).

**Cohomology.** The $\mathsf{Q}$-enriched cohomology is

$$H^n_{\mathsf{Q}}(\mathbf{T}, J;\, F) \;:=\; \mathrm{ker}(\delta^n) \,/\, \mathrm{image}(\delta^{n-1})$$

where:

- $\mathrm{ker}(\delta^n)$ is the $\mathsf{Q}$-Cat *kernel* of $\delta^n$ — the largest sub-$\mathsf{Q}$-category of $C^n F$ on which $\delta^n$ vanishes. Concretely, $\mathrm{ker}(\delta^n)$ consists of cochains $x \in C^n F$ such that the weighted meet $(\delta^n x)(\tau)$ equals the unit element (or "zero") of $F(\tau)$ for every $(n+1)$-cell $\tau$.
- $\mathrm{image}(\delta^{n-1})$ is the $\mathsf{Q}$-Cat *image* — the smallest sub-$\mathsf{Q}$-category of $C^n F$ containing the values of $\delta^{n-1}$.
- The quotient is the $\mathsf{Q}$-Cat coequalizer of the inclusion $\mathrm{image}(\delta^{n-1}) \hookrightarrow \mathrm{ker}(\delta^n)$ with the trivial-image map (zero-section).

All three operations — kernel, image, quotient — exist in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ as enriched (co)limits ([@kelly1982] §3.1, §3.7–3.10 — indexed limits/colimits, tensors and cotensors, ends and coends).

## Degree-0 cohomology = Lawvere Laplacian fixed points

For $n = 0$, the standard cochain-cohomology definition agrees with the [Lawvere Laplacian](lawvere-laplacian-grothendieck-sites.md) fixed-point characterization:

$$H^0_{\mathsf{Q}}(\mathbf{T}, J;\, F) \;\cong\; \mathrm{Fix}(L) \;\subseteq\; C^0 F,$$

where $\mathrm{Fix}(L)$ is the $\mathsf{Q}$-category of fixed points (or suffix points) of the Lawvere Laplacian $L : C^0 F \to C^0 F$.

The proof: by the Tarski–Lawvere Fixed Point Theorem ([@ghrist-et-al2025] Theorem 2.17), the suffix points of $L$ form a complete weighted sub-lattice of $C^0 F$. By construction of $L$, suffix points are exactly cochains $x \in C^0 F$ satisfying $\delta^0 x = 0$ — the kernel of the degree-0 coboundary. Since $\delta^{-1} = 0$, $H^0_{\mathsf{Q}} = \ker(\delta^0)$ identifies with the suffix points.

## Higher-degree cohomology: vanishing on the bitopological settling site

By the [Q-enriched cohomology vanishing theorem](../theorems/q-enriched-cohomology-higher-degree-vanishing.md), for $\mathsf{Q}$-enriched sheaves on the [bitopological settling site](bitopological-settling-site.md), $H^n_{\mathsf{Q}} = 0$ for $n \geq 2$. Hence the only non-trivial degrees are 0 and 1.

For $H^1$, the cochain-cohomology definition gives:

$$H^1_{\mathsf{Q}}(\mathbf{T}^*, J;\, F) \;=\; \ker(\delta^1) \,/\, \mathrm{image}(\delta^0).$$

The regime-by-regime structure of $H^1$ is determined by the corresponding regime cohomology theorems ([strict](../theorems/strict-regime-d-frame-cohomology.md), [Scott-continuous](../theorems/scott-continuous-regime-d-frame-cohomology.md), [transfinite-bounded](../theorems/transfinite-bounded-regime-d-frame-cohomology.md), [aperiodic](../theorems/aperiodic-regime-d-frame-cohomology.md)).

## Specialization to d-frame-valued cohomology

For the [d-frame-valued sheaf](d-frame-valued-sheaf.md) $\mathbb{F}_v$, the $\mathsf{Q}$-enriched cohomology specializes to **d-frame cohomology**:

$$H^n_{\mathbf{dFrm}}(\mathbf{T}^*, J;\, \mathbb{F}_v) \;:=\; H^n_{\mathsf{Q}}(\mathbf{T}^*, J;\, \mathbb{F}_v),$$

where $\mathsf{Q}$ is the underlying frame quantale of d-frames. Each $H^n_{\mathbf{dFrm}}$ is a d-frame whose components ($L_+$, $L_-$, $\mathrm{con}$, $\mathrm{tot}$) are computed from the cochain complex's d-frame-valued kernel and image.

## Position in predication categories

This definition makes the higher-degree d-frame cohomology meaningful — without it, statements like "$H^{\geq 2}_{\mathbf{dFrm}} = 0$" don't have a precise right-hand side. The kernel/image-quotient definition is the standard sheaf-cohomological move generalized to the $\mathsf{Q}$-enriched setting.

Together with the [Lawvere Laplacian extension theorem](../theorems/lawvere-laplacian-grothendieck-sites.md) (giving the framework for sheaves) and the regime-by-regime cohomology theorems (computing $H^0$ and $H^1$ explicitly), this completes the chapter's foundational definitional infrastructure. Remaining work is rigorization of the proof arguments via citation pass on Kelly 1982 / Stubbe 2005, plus regularization of the cellular-structure machinery on the bitopological settling site beyond the cases handled in the proved regime theorems.
