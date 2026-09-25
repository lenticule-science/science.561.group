---
type: theorem
status: proved
depends-on: [four-bilattice, twist-product-fusion, twist-product-right-residual, four-bilattice-residuation-convergence, four-bilattice-residuation-properties]
see-also: [bilattice-stabilization-nucleus, residuation-orbit-monotonicity]
---

# Four-bilattice mixed orbit convergence rate

On [$\mathbf{FOUR}$](../objects/four-bilattice.md), fix $a \in \mathbf{FOUR}$ and define the **mixed step operator**

$$T_a : \mathbf{FOUR} \to \mathbf{FOUR}, \qquad T_a(x) \;:=\; a \Rightarrow (a \odot x),$$

composing the [twist-product fusion](../morphisms/twist-product-fusion.md) $a \odot \cdot$ followed by the [twist-product right residual](../morphisms/twist-product-right-residual.md) $a \Rightarrow \cdot$ (with the same $a$ used in both positions, modeling fusion-against-background-then-restriction-by-the-same-background).

For every $a, x_0 \in \mathbf{FOUR}$, the orbit $(x_n)_{n \geq 0}$ defined by $x_{n+1} = T_a(x_n)$ satisfies

$$x_1 \;=\; x_2.$$

That is, **one composite step suffices** for the orbit to reach a fixed point on $\mathbf{FOUR}$.

## Proof

By exhaustive calculation on the $|\mathbf{FOUR}|^2 = 16$ pairs $(a, x_0)$, using the encoding $\bot = \langle 0, 0 \rangle$, $\mathbf{f} = \langle 0, 1 \rangle$, $\mathbf{t} = \langle 1, 0 \rangle$, $\top = \langle 1, 1 \rangle$ from $\mathbf{2}^\bowtie \cong \mathbf{FOUR}$ and the formulas

$$\langle x, y \rangle \odot \langle z, v \rangle = \langle x z,\ (x \to v) \wedge (z \to y) \rangle, \qquad \langle x, y \rangle \Rightarrow \langle z, v \rangle = \langle (x \to z) \wedge (v \to y),\ xv \rangle.$$

The complete value table for $T_a(x)$ — computing $a \odot x$ then applying $a \Rightarrow \cdot$ — is

| $T_a(x)$, with $a \backslash x$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $\mathbf{t}$ | $\bot$ | $\mathbf{t}$ |
| $\mathbf{t}$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\mathbf{t}$ |
| $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ |
| $\top$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |

Each row is computed as follows.

**Row $a = \bot$.** $\bot \odot x = \langle 0, \cdot \rangle$ for every $x$ (the positive component is $0 \cdot x_1 = 0$); explicit values are $\bot \odot \bot = \mathbf{f}$, $\bot \odot \mathbf{t} = \bot$, $\bot \odot \mathbf{f} = \mathbf{f}$, $\bot \odot \top = \bot$. Then $\bot \Rightarrow \mathbf{f} = \bot$ and $\bot \Rightarrow \bot = \mathbf{t}$ (per [four-bilattice residuation properties](../../../references/four-bilattice-residuation-properties.md) (4) and direct computation), giving the row.

**Row $a = \mathbf{t}$.** $\mathbf{t} \odot \bot = \bot$, $\mathbf{t} \odot \mathbf{t} = \mathbf{t}$, $\mathbf{t} \odot \mathbf{f} = \mathbf{f}$, $\mathbf{t} \odot \top = \mathbf{t}$ (using $\langle 1, 0 \rangle \odot \langle z, v \rangle = \langle z, (1 \to v) \wedge (z \to 0) \rangle = \langle z, v \wedge \neg z \rangle$). Then $\mathbf{t} \Rightarrow \bot = \bot$, $\mathbf{t} \Rightarrow \mathbf{t} = \mathbf{t}$, $\mathbf{t} \Rightarrow \mathbf{f} = \mathbf{f}$, giving the row.

**Row $a = \mathbf{f}$.** $\mathbf{f} \odot x = \mathbf{f}$ for all $x$ by [four-bilattice residuation properties](../../../references/four-bilattice-residuation-properties.md) (2) (absorbing). Then $\mathbf{f} \Rightarrow \mathbf{f} = \mathbf{t}$ by (4). The row is constant $\mathbf{t}$.

**Row $a = \top$.** $\top \odot x = x$ for all $x$ by [four-bilattice residuation properties](../../../references/four-bilattice-residuation-properties.md) (1) (identity). Then $T_\top(x) = \top \Rightarrow x$. By direct calculation, $\top \Rightarrow x = x$ for every $x \in \mathbf{FOUR}$ — this is the fact that $\top$ is the *right-side unit* for the twist-product right residual, established by computing $\langle 1, 1 \rangle \Rightarrow \langle z, v \rangle = \langle (1 \to z) \wedge (v \to 1), 1 \cdot v \rangle = \langle z \wedge 1, v \rangle = \langle z, v \rangle$. The row is the identity.

**Verification of $x_1 = x_2$.** For each $a$, applying $T_a$ a second time gives:

- $a = \bot$: $T(\bot) = \bot$ and $T(\mathbf{t}) = \mathbf{t}$, so the row's outputs $\{\bot, \mathbf{t}, \bot, \mathbf{t}\}$ are all $T_\bot$-fixed. ✓
- $a = \mathbf{t}$: $T(\bot) = \bot$, $T(\mathbf{t}) = \mathbf{t}$, $T(\mathbf{f}) = \mathbf{f}$, so the row's outputs $\{\bot, \mathbf{t}, \mathbf{f}, \mathbf{t}\}$ are all $T_\mathbf{t}$-fixed. ✓
- $a = \mathbf{f}$: every $T_\mathbf{f}$-output is $\mathbf{t}$, and $T_\mathbf{f}(\mathbf{t}) = \mathbf{t}$. ✓
- $a = \top$: $T_\top$ is the identity, so trivially $T_\top \circ T_\top = T_\top$. ✓

In every case, $T_a(T_a(x_0)) = T_a(x_0)$, i.e., $x_1 = x_2$. $\square$

## Remark on tightness

The bound $x_1 = x_2$ is tight: some orbits genuinely require step 1 to reach the fixed point, e.g. $T_\bot(\mathbf{f}) = \bot \neq \mathbf{f} = x_0$. Strengthening to $x_0 = x_1$ would fail on this case.

## Remark on the per-substep bound

A single application of $T_a$ decomposes into two **substeps**: first $a \odot \cdot$, then $a \Rightarrow \cdot$. Counting at the substep level, the orbit reaches its fixed point in at most $2$ substeps. This is the substep figure that engineering implementations cite when budgeting per-cell stabilization fuel: 2 substeps per per-cell iteration, with one per-cell iteration sufficing. (For other implementations, $T_a$ may be implemented as a single fused operation rather than two substeps; under that fusion, the bound is 1 step per cell.)

## Relationship to the pure-fusion and pure-residual bounds

[Four-bilattice residuation convergence](../../../references/four-bilattice-residuation-convergence.md) establishes $\mathrm{L}_a^2 = \mathrm{L}_a^3$ and $\mathrm{R}_a^2 = \mathrm{R}_a^3$ separately, where each step applies a single operator. The mixed-orbit theorem above is the analogous bound for the composite step $T_a = \mathrm{R}_a \circ \mathrm{L}_a$. The two pure bounds do not, on their own, imply the mixed bound: composing two operators that each stabilize in two of-their-own steps does not automatically produce a composite that stabilizes in two composite steps. The mixed-orbit bound's tightness ($x_1 = x_2$) is structurally stronger than what composition of the pure bounds would give.

## Position

This theorem provides the per-cell convergence bound that downstream cell-stabilization disciplines invoke when iterating fusion-then-residuation against a fixed background value. The [bilattice stabilization nucleus](../objects/bilattice-stabilization-nucleus.md) is the per-cell operator built from $T_a$; its convergence rate on $\mathbf{FOUR}$ is exactly the bound above.

The bound is finite-bilattice-specific: it does not extend automatically to twist-product algebras over richer residuated lattices $\mathbf{L}$, where iterated $T_a$-orbits may require more composite steps. For larger bilattices, the analogous convergence rate is a structural question per the underlying $\mathbf{L}$, not an automatic consequence of the [twist-product residuation theorem](../../../../../../../../residuated-lattice/content/twist-product/references/twist-product-residuation.md).
