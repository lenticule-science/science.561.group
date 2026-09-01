---
type: theorem
status: sketch
depends-on: [predication-fibration, predication-fiber-algebra, predication-fiber-functor, predicate-category, knowledge-order, predication-settling-category, predication-valuation]
---

# Positing is natural under predicate-category reindexing

Let $(\mathbf{L}, \mathcal{C}, E)$ be base parameters, $v$ a [predication valuation](../objects/predication-valuation.md), and $\mathrm{posit}_{(\phi, q)}$ the atomic positing morphism at cell $\phi = (s, p, o)$ with datum $q \in \mathbf{L}^\bowtie$. For any morphism $f : p' \to p$ in the [predicate category](../objects/predicate-category.md) $\mathcal{C}$ with reindexing $f^* : A_p \to A_{p'}$:

$$f^*\!\left(\mathrm{posit}_{(\phi,\, q)}(v)\right) = \mathrm{posit}_{\left(f^*(\phi),\, q\right)}\!\left(f^*(v)\right)$$

where $f^*(\phi)$ is the cell obtained by applying the generator action to the entity-pair index of $\phi$ (the predicate coordinate changes from $p$ to $p'$; the bilattice value $q$ is unchanged), and the reindexed positing morphism $\mathrm{posit}_{(f^*(\phi), q)}$ acts on the reindexed valuation $f^*(v)$.

## Proof

Positing is defined by $\mathrm{posit}_{(\phi, q)}(v) = v \vee_k \delta_{\phi, q}$ where $\delta_{\phi, q}$ is the indicator valuation placing $q$ at $\phi$ and $\bot$ elsewhere. Applying $f^*$:

$$f^*\!\left(\mathrm{posit}_{(\phi, q)}(v)\right) = f^*\!\left(v \vee_k \delta_{\phi, q}\right).$$

By [predication fibration](../objects/predication-fibration.md) axiom (A3), $f^*$ is a bilattice-residuated homomorphism and in particular preserves $\vee_k$ pointwise:

$$f^*(v \vee_k \delta_{\phi, q}) = f^*(v) \vee_k f^*(\delta_{\phi, q}).$$

It remains to identify $f^*(\delta_{\phi, q})$. The generator actions (A2) carry the indicator $\delta_{\phi, q}$ — supported on the single entity pair $(s, o)$ at predicate $p$ — to an indicator on the reindexed entity pair at predicate $p'$:

| Generator | Cell $\phi = (s, p, o)$ | Reindexed $f^*(\phi)$ | Value $f^*(q)$ |
|---|---|---|---|
| Specialization $f_{\mathrm{spec}} : p' \to p$ | $(s, p, o)$ | $(s, p', o)$ | $q$ |
| Converse $f_{\mathrm{conv}} : p^\circ \to p$ | $(s, p, o)$ | $(o, p^\circ, s)$ | $q$ |
| Subject-projection $\pi_s : p_s \to p$ | $(s, p, o)$ | $(s, p_s)$ | $q$ |
| Object-projection $\pi_o : p_o \to p$ | $(s, p, o)$ | $(o, p_o)$ | $q$ |

In every case the bilattice value is preserved ($f^*(q) = q$) and only the entity-pair or predicate index changes. Thus $f^*(\delta_{\phi, q}) = \delta_{f^*(\phi), q}$. Substituting:

$$f^*(v) \vee_k f^*(\delta_{\phi, q}) = f^*(v) \vee_k \delta_{f^*(\phi), q} = \mathrm{posit}_{(f^*(\phi),\, q)}(f^*(v)).$$

This is the right-hand side of the claimed equation. $\square$

## Corollary: positing is a natural transformation in $\mathcal{C}^{\mathrm{op}}$

For fixed datum $q$, the family of positing morphisms $\{\mathrm{posit}_{(\phi, q)}\}_\phi$ defines a natural transformation $\Delta_q : F \Rightarrow F'$ between predication fiber functors $F, F' : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$, where $F' = F \vee_k (\text{const}_q)$ at each fiber. Naturality of $\Delta_q$ is exactly the equation proved above.

In particular, positing is a 2-cell in the 2-category $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$. This upgrades positing from a mere [predication settling category](../objects/predication-settling-category.md) morphism to a morphism in the full 2-categorical structure of predication fibrations.

## Corollary: speech-act morphism classes are 2-cells

The [assertive](../morphisms/assertive-positing-morphism.md), [denial](../morphisms/denial-positing-morphism.md), and [contestation](../morphisms/contestation-positing-morphism.md) positing morphisms — which are sub-classes of positing morphisms distinguished by the truth-order class of $q$ — inherit 2-cell status from this theorem. Each speech-act class is a family of 2-cells in $\mathbf{PrFib}$ indexed by cell and datum.
