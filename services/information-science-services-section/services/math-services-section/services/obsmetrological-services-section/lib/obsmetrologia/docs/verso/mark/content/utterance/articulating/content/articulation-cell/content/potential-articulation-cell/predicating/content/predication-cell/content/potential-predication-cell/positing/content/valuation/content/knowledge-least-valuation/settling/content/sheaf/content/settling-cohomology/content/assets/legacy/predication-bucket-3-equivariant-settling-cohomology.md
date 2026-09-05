---
kind: theorem
status: proved
depends-on: [settling-cohomology, internal-z2-gauge, bitopological-settling-site, jung-rivieccio-duality, negation]
---

# Equivariant settling cohomology under the bilattice negation gauge

The [internal $\mathbb{Z}/2$-gauge](../concepts/internal-z2-gauge.md) on each [predication fiber algebra](../objects/predication-fiber-algebra.md) — the [negation](../morphisms/negation.md) $\sim$ acting by $\sim \langle a, b \rangle = \langle b, a \rangle$ — induces via [Jung–Rivieccio duality](jung-rivieccio-duality.md) a $\mathbb{Z}/2$-action on the [bitopological settling site](../objects/bitopological-settling-site.md), and consequently on sheaves and on [settling cohomology](../objects/settling-cohomology.md).

## Proof

For each fiber $X_q^\tau$, $\sim$ induces a Priestley-space morphism $\sim^* : X_q^\tau \to X_q^\tau$ swapping the $+$ and $-$ coordinates of the [paired Priestley space](../objects/paired-priestley-space.md): a point $(p, +)$ is sent to the corresponding $(p, -)$ and vice versa, lifting to a self-involution. The involutive pair $\{1, \sim^*\}$ generates a $\mathbb{Z}/2$-action on $\mathbf{T}^*$ that

- preserves pairwise-Stone clopens — the swap $+ \leftrightarrow -$ is continuous on paired Priestley space ([@bezhanishvili-et-al2010], Theorem 2.9), hence preserves bitopological clopens;
- commutes with settling and predicate morphisms — the settling is $\leq_k$-monotone and $\sim$ preserves $\leq_k$ ($a \leq_k b \Leftrightarrow {\sim}a \leq_k {\sim}b$); predicate morphisms are cellwise and $\sim$ is pointwise.

Hence $\sim^*$ is a well-defined automorphism of the site $(\mathbf{T}^*, J)$, and it acts on sheaves by $F \mapsto F \circ \sim^*$. $\square$

## Equivariant sheaves and cohomology

A **$\mathbb{Z}/2$-equivariant sheaf** is a [KZ-coherent](../concepts/kz-coherent-sheaf.md) sheaf $F$ together with an isomorphism $\alpha_F : F \to F \circ \sim^*$ satisfying $(\sim^*)_*(\alpha_F) \circ \alpha_F = \mathrm{id}_F$. The category of such sheaves is denoted $\mathrm{Sh}^{\mathrm{KZ}, \mathbb{Z}/2}(\mathbf{T}^*, J)$.

The **$\mathbb{Z}/2$-equivariant cohomology** is

$$H^n_{\mathbb{Z}/2}(\mathbf{T}^*, F) \;:=\; H^n(\mathbf{T}^*_{\mathbb{Z}/2}, F),$$

cohomology on the Borel quotient — equivalently, sections of $F$ invariant under $\alpha_F$. Standard group-cohomology machinery ([@kashiwara-schapira2006] §19.1) gives a **Hochschild–Serre spectral sequence**

$$E_2^{p, q} \;=\; H^p(\mathbb{Z}/2;\, H^q(\mathbf{T}^*, F)) \;\Longrightarrow\; H^{p + q}_{\mathbb{Z}/2}(\mathbf{T}^*, F),$$

relating equivariant cohomology to group cohomology of the $\mathbb{Z}/2$-action on the ordinary cohomology.

## The action on the bigraded cohomology

The $\mathbb{Z}/2$-gauge acts on the [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) $H^{m, n}_{k, t}$ by:

- preserving cohomological degree $n$;
- fixing the designation grade $m \in \{0, 1\}$ as a set, but swapping $\{\mathbf{t}\}$- and $\{\mathbf{f}\}$-components when both are tracked. On $\mathcal{F}_U^{(\top)}$ and $\mathcal{F}_U^{(\bot)}$ the action is identity since $\top, \bot$ are $\sim$-fixed.

## Effective triviality on consistent $\mathbf{t}$-only sheaves

For [settling-associated sheaves](../objects/settling-associated-sheaf.md) tracking only $\mathbf{t}$-cells (not $\mathbf{f}$-cells), the $\mathbb{Z}/2$-action is effectively trivial — the only $\sim$-non-trivial content sits in the $\mathbf{t}/\mathbf{f}$ swap, and the sheaf does not see $\mathbf{f}$-cells. Equivariant cohomology then collapses to $H^n_t \otimes H^*(\mathbb{Z}/2; \mathbb{Z})$, no new distinguishing data.

For settings tracking both $\mathbf{t}$- and $\mathbf{f}$-cells via a symmetric settling-associated sheaf $\mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(f)}$, the $\mathbb{Z}/2$-action is the genuine $\mathbf{t} \leftrightarrow \mathbf{f}$ swap, and the equivariant Hochschild–Serre refinement provides additional distinguishing structure beyond the ordinary [aperiodic-regime classification](aperiodic-regime-classification.md).

The $\mathbf{f}$-cell variant is flagged but not developed here; the [aperiodic-regime classification](aperiodic-regime-classification.md) and [CRDT cohomology](crdt-convergence-via-mayer-vietoris.md) work with $\mathbf{t}$-designated settlings, where the gauge content is effectively trivial.
