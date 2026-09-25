---
type: theorem
status: proved
lean:
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.top_fusion_id
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.f_fusion_absorb
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.t_fusion_idem
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.f_fusion_idem
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.top_fusion_idem
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.bot_fusion_eq_f
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.bot_self_imp
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.t_self_imp
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.f_self_imp
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.top_self_imp
depends-on: [four-bilattice, twist-product-fusion, twist-product-right-residual, twist-product-residuation]
kind: theorem
---

# Four-bilattice residuation properties

In the [four-element bilattice](../objects/four-bilattice.md) $\mathbf{FOUR}$ with the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ and the [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$:

1. $\top$ is the identity for $\odot$: $\top \odot a = a$ for all $a$.
2. $\mathbf{f}$ is absorbing for $\odot$: $\mathbf{f} \odot a = \mathbf{f}$ for all $a$.
3. $\mathbf{t}, \mathbf{f}, \top$ are idempotent under $\odot$; $\bot$ is not: $\bot \odot \bot = \mathbf{f}$.
4. Self-implication: $a \Rightarrow a = \mathbf{t}$ for $a \in \{\bot, \mathbf{t}, \mathbf{f}\}$; $\top \Rightarrow \top = \top$.

## Proof

Recall the encoding $\mathbf{f} = \langle 0, 1 \rangle$, $\bot = \langle 0, 0 \rangle$, $\top = \langle 1, 1 \rangle$, $\mathbf{t} = \langle 1, 0 \rangle$ from $\mathbf{2}^\bowtie \cong \mathbf{FOUR}$.

**(1)** $\langle 1, 1 \rangle \odot \langle x, y \rangle = \langle 1 \cdot x,\ (1 \to y) \wedge (x \to 1) \rangle = \langle x,\ y \wedge 1 \rangle = \langle x, y \rangle$.

**(2)** $\langle 0, 1 \rangle \odot \langle x, y \rangle = \langle 0 \cdot x,\ (0 \to y) \wedge (x \to 1) \rangle = \langle 0,\ 1 \wedge 1 \rangle = \langle 0, 1 \rangle = \mathbf{f}$.

**(3)** $\langle x, y \rangle \odot \langle x, y \rangle = \langle x \cdot x,\ (x \to y) \wedge (x \to y) \rangle = \langle x,\ x \to y \rangle$; computing case by case:

- $\mathbf{t} \odot \mathbf{t} = \langle 1,\ 1 \to 0 \rangle = \langle 1, 0 \rangle = \mathbf{t}$;
- $\mathbf{f} \odot \mathbf{f} = \langle 0,\ 0 \to 1 \rangle = \langle 0, 1 \rangle = \mathbf{f}$;
- $\top \odot \top = \langle 1,\ 1 \to 1 \rangle = \langle 1, 1 \rangle = \top$;
- $\bot \odot \bot = \langle 0,\ 0 \to 0 \rangle = \langle 0, 1 \rangle = \mathbf{f}$.

**(4)** Direct calculation. Using $\langle x, y \rangle \Rightarrow \langle z, v \rangle = \langle (x \to z) \wedge (v \to y),\ x \cdot v \rangle$:

- $\bot \Rightarrow \bot = \langle (0 \to 0) \wedge (0 \to 0),\ 0 \cdot 0 \rangle = \langle 1, 0 \rangle = \mathbf{t}$;
- $\mathbf{t} \Rightarrow \mathbf{t} = \langle (1 \to 1) \wedge (0 \to 0),\ 1 \cdot 0 \rangle = \langle 1, 0 \rangle = \mathbf{t}$;
- $\mathbf{f} \Rightarrow \mathbf{f} = \langle (0 \to 0) \wedge (1 \to 1),\ 0 \cdot 1 \rangle = \langle 1, 0 \rangle = \mathbf{t}$;
- $\top \Rightarrow \top = \langle (1 \to 1) \wedge (1 \to 1),\ 1 \cdot 1 \rangle = \langle 1, 1 \rangle = \top$.

$\square$

## Remark

Verification of the residuation adjointness $\odot \dashv \Rightarrow$ on all $|\mathbf{FOUR}|^3 = 64$ triples in $\mathbf{FOUR}$ is a direct consequence of the [twist-product residuation theorem](../../../../../../../../residuated-lattice/content/twist-product/references/twist-product-residuation.md): that theorem holds for any integral commutative residuated lattice $\mathbf{L}$, and the Boolean lattice $\mathbf{2}$ is such a lattice.
