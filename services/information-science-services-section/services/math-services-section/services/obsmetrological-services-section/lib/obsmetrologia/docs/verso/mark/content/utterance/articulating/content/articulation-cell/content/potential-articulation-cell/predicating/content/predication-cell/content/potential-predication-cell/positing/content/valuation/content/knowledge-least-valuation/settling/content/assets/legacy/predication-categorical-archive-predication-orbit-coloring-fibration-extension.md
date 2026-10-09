---
type: theorem
status: sketch
depends-on:
  - predication-fibration
  - boundary-extended-predicate-category
  - orbit-coloring-generator
  - relaxed-bilattice-homomorphism-classification
  - twist-product-fusion
  - twist-product-right-residual
  - bilattice-homomorphism
  - bilattice-homomorphism-naturality
  - entity-set
see-also:
  - predicate-specialization
  - orbit-coloring-generator-structural-integration
  - residuated-preservation-tension-on-bottom-cells
---

# Orbit-coloring fibration extension

The predication fibration extends from $\mathcal C$ to the [boundary-extended predicate category](../objects/boundary-extended-predicate-category.md) $\mathcal C^\beta$ with (A1) automatic, (A2) extended to include cellwise specifications for the eight [orbit-coloring generators](../../../../../../../pre-bilattice/content/bilattice/content/klein-four-symmetry/content/orbit-coloring-generator/orbit-coloring-generator.md), and (A3) splitting into a bilattice fragment satisfied by all 18 generators and a residuated fragment satisfied by 10. The residuated tension at constant-$\bot$ cells is inherited from the chapter — chapter generators with proper sub-support fail it by the same obstruction.

## Statement

Let $\mathbf L$ be an integral commutative [residuated lattice](../objects/residuated-lattice.md) with $\mathbf L \neq \mathbf 1$ (non-degenerate), $|E| \geq 3$, and $\mathcal C^\beta$ the boundary-extended predicate category. Then:

**(A1)** Fiber uniformity is automatic. The fibers of any candidate $\mathcal C^\beta$-fibration are $A_q := \mathbf L^{\bowtie\, E\times E}$ as in the chapter; the (A1) condition does not see the morphisms.

**(A2$^\beta$)** Generator action extends. For each generator class in $\mathcal C^\beta$ — the four chapter classes plus the eight orbit-coloring classes — the reindexing functor $f^* : \mathcal E_p \to \mathcal E_q$ acts on fiber elements by the cellwise specification

$$f^*(v)(s', o') = \begin{cases} \alpha_O(v) & \text{if } (s', o') \in O \text{ for } O \in \{\Delta, \Delta^c\} \end{cases}$$

with $\alpha_O$ given by [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md) Step 4 — one of $\{\mathrm{constant\text{-}}\bot, \mathrm{constant\text{-}}\top, \mathrm{ev}_p\}$ for $p$ a $\mathrm{Stab}$-fixed point of orbit $O$.

**(A3$^\beta$-bilattice)** Preservation of bilattice operations holds for all 18 generators. By [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md), every per-orbit choice of $\alpha_O$ yields a bilattice homomorphism $\mathbf L^{\bowtie\, E\times E} \to \mathbf L^{\bowtie\, E\times E}$ preserving $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ pointwise.

**(A3$^\beta$-residuated)** Preservation of [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ and [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$ holds at exactly those cells where $f^*$ does not paint constant-$\bot$. Equivalently, it holds for the 10 generators in $\mathcal C^\beta$ that have no constant-$\bot$ cell on either orbit:

| diagonal $\alpha_\Delta$ | off-diagonal $\alpha_{\Delta^c}$ | name | residuated? |
|---|---|---|---|
| $\mathrm{ev}_\mathrm{diag}$ | $\mathrm{ev}_\mathrm{id}$ | identity | ✓ |
| $\mathrm{ev}_\mathrm{diag}$ | $\mathrm{ev}_\mathrm{swap}$ | converse | ✓ |
| $\mathrm{ev}_\mathrm{diag}$ | $\mathrm{ev}_\mathrm{subj}$ | subject-projection | ✓ |
| $\mathrm{ev}_\mathrm{diag}$ | $\mathrm{ev}_\mathrm{obj}$ | object-projection | ✓ |
| constant-$\top$ | $\mathrm{ev}_\mathrm{id}$ | $\top$-on-$\Delta$ + identity | ✓ |
| constant-$\top$ | $\mathrm{ev}_\mathrm{swap}$ | $\top$-on-$\Delta$ + converse | ✓ |
| constant-$\top$ | $\mathrm{ev}_\mathrm{subj}$ | $\top$-on-$\Delta$ + subj | ✓ |
| constant-$\top$ | $\mathrm{ev}_\mathrm{obj}$ | $\top$-on-$\Delta$ + obj | ✓ |
| $\mathrm{ev}_\mathrm{diag}$ | constant-$\top$ | identity + $\top$-on-$\Delta^c$ | ✓ |
| constant-$\top$ | constant-$\top$ | total $\top$-collapse | ✓ |

The remaining 8 generators have at least one constant-$\bot$ cell and fail (A3$^\beta$-residuated) at those cells:

| diagonal $\alpha_\Delta$ | off-diagonal $\alpha_{\Delta^c}$ | failing operation | failing cells |
|---|---|---|---|
| $\mathrm{ev}_\mathrm{diag}$ | constant-$\bot$ | $\odot$, $\Rightarrow$ | $\Delta^c$ |
| constant-$\bot$ | $\mathrm{ev}_\mathrm{id}$ | $\odot$, $\Rightarrow$ | $\Delta$ |
| constant-$\bot$ | $\mathrm{ev}_\mathrm{swap}$ | $\odot$, $\Rightarrow$ | $\Delta$ |
| constant-$\bot$ | $\mathrm{ev}_\mathrm{subj}$ | $\odot$, $\Rightarrow$ | $\Delta$ |
| constant-$\bot$ | $\mathrm{ev}_\mathrm{obj}$ | $\odot$, $\Rightarrow$ | $\Delta$ |
| constant-$\bot$ | constant-$\bot$ | $\odot$, $\Rightarrow$ | both |
| constant-$\top$ | constant-$\bot$ | $\odot$, $\Rightarrow$ | $\Delta^c$ |
| constant-$\bot$ | constant-$\top$ | $\odot$, $\Rightarrow$ | $\Delta$ |

**(Cleavage functoriality)** The canonical cleavage — Cartesian lift of $f : q \to p$ over $v \in A_p$ given by $(v, f^*(v) \to v)$ — is functorial: $(g \circ f)^* = f^* \circ g^*$ holds for every composable pair in $\mathcal C^\beta$, by the leftmost-wins composition rule on per-orbit assignments.

## Proof

**(A1)** Trivial: the chapter's (A1) statement does not reference any specific morphism class.

**(A2$^\beta$)** The cellwise specification is the per-orbit decomposition produced in [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md) Step 4. By construction it gives a well-defined function $A_q \to A_p$.

**(A3$^\beta$-bilattice)** By [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md) Step 1, the per-coordinate construction $h(P, N) = (\alpha(P), \alpha(N))$ for any lattice homomorphism $\alpha$ preserves $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ on $\mathbf L^\bowtie$ at each output cell, hence pointwise on $A_p = (\mathbf L^\bowtie)^{E\times E}$.

**(A3$^\beta$-residuated) — positive cases.**

*Constant-$\top$ cells.* Compute in $\mathbf L^\bowtie$ at the painted cell:

$$\top \odot \top \;=\; \langle 1, 1\rangle \odot \langle 1, 1\rangle \;=\; \langle 1\cdot 1,\ (1\to 1)\wedge(1\to 1)\rangle \;=\; \langle 1, 1\rangle \;=\; \top.$$

So $f^*(v_1 \odot v_2)(s', o') = \top = f^*(v_1)(s', o') \odot f^*(v_2)(s', o')$ at constant-$\top$ cells.

$$\top \Rightarrow \top \;=\; \langle (1\to 1)\wedge(1\to 1),\ 1\cdot 1\rangle \;=\; \langle 1, 1\rangle \;=\; \top$$

likewise.

*Principal-evaluation cells.* At a cell $(s', o')$ with $\alpha_{(s', o')} = \mathrm{ev}_{g(s', o')}$:

$$f^*(v_1 \odot v_2)(s', o') \;=\; (v_1 \odot v_2)(g(s', o')) \;=\; v_1(g(s', o')) \odot v_2(g(s', o')) \;=\; f^*(v_1)(s', o') \odot f^*(v_2)(s', o')$$

since $\odot$ on $A_q$ is pointwise. Same for $\Rightarrow$.

So the 10 generators with no constant-$\bot$ cell satisfy (A3$^\beta$-residuated) pointwise.

**(A3$^\beta$-residuated) — negative cases.** At a constant-$\bot$ cell:

$$\bot \odot \bot \;=\; \langle 0, 0\rangle \odot \langle 0, 0\rangle \;=\; \langle 0\cdot 0,\ (0\to 0)\wedge(0\to 0)\rangle \;=\; \langle 0, 1\rangle \;=\; \mathbf f$$

(using $0 \to 0 = 1$ in any residuated lattice — the residuum returns top whenever antecedent $\leq$ consequent in the lattice order). So $f^*(v_1)(s', o') \odot f^*(v_2)(s', o') = \mathbf f$, while $f^*(v_1 \odot v_2)(s', o') = \bot$ by construction. These differ for any non-degenerate $\mathbf L$ where $\mathbf f \neq \bot$ (i.e. $0 \neq 1$ in $\mathbf L$).

Symmetrically, $\bot \Rightarrow \bot = \langle (0\to 0)\wedge(0\to 0),\ 0\cdot 0\rangle = \langle 1, 0\rangle = \mathbf t \neq \bot$, so $\Rightarrow$ also fails at constant-$\bot$ cells.

**(Cleavage functoriality.)** Two generators compose pointwise: $(\phi_2 \circ \phi_1)(v)(s', o') = \phi_2(\phi_1(v))(s', o')$. By per-orbit decomposition, $\phi_2(\phi_1(v))(s', o') = \alpha^{(2)}_O(\phi_1(v))$ for $(s', o') \in O$. If $\alpha^{(2)}_O$ is constant-$\bot$ or constant-$\top$, the composition equals that constant on $O$ regardless of $\phi_1$. If $\alpha^{(2)}_O = \mathrm{ev}_p$, the composition equals $\phi_1(v)(p)$ on $O$, which by the per-orbit decomposition of $\phi_1$ equals $\alpha^{(1)}_{O'}(v)$ where $O' \ni p$. So composition is determined by per-orbit lattice-hom composition: leftmost (outermost) constant or $\mathrm{ev}$-pullback of inner per-orbit choice. This is associative and well-defined, giving a strict functor from $\mathcal C^{\beta\,\mathrm{op}}$ to $\mathbf{Set}$, hence a strict cleavage. $\square$

## Reading

The fibration extension is *almost clean*. The bilattice fragment of (A3) — preservation of $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ — extends without obstruction to all 18 generators in $\mathcal C^\beta$. The residuated fragment — preservation of $\odot, \Rightarrow$ — extends to 10 of them.

The 8 generators that fail (A3$^\beta$-residuated) are exactly those with a constant-$\bot$ cell. The obstruction is purely local and computational: $\bot \odot \bot = \mathbf f$ in the twist product, not $\bot$. This is *not* a defect of the orbit-coloring construction — it is inherited from the chapter, where any predicate-specialization morphism with proper sub-support $\mathrm{dom}(q) \subsetneq E\times E$ has the same constant-$\bot$ cells off its domain and fails (A3) at those cells by the same computation. See [residuated preservation tension on bottom cells](prose/remarks/residuated-preservation-tension-on-bottom-cells.md).

The structural moral: dropping bottom-preservation from the chapter's exhaustiveness theorem extends the bilattice-fragment fibration cleanly (4 chapter classes → 18 generators), but does not heal the pre-existing residuated-fragment tension. The residuated fragment was already incomplete in the chapter; the boundary extension does not fix it, and adds 8 more generators that exhibit the same failure mode for the same reason.

The 10-generator (A3$^\beta$-residuated)-clean inventory — 4 chapter generators with full domain plus 6 orbit-coloring generators with no constant-$\bot$ cell — is the natural sub-fibration that closes both fragments. It is a finite, well-behaved residuated-bilattice fibration over a sub-category of $\mathcal C^\beta$.

## Position

This resolves [orbit-coloring generator structural integration](questions/orbit-coloring-generator-structural-integration.md) sub-question 1 with caveat: the fibration extends, but the (A3) tension is split into bilattice and residuated fragments, and the residuated fragment was already unresolved in the chapter. The chapter-side aspect of the tension is recorded in the new remark [residuated preservation tension on bottom cells](prose/remarks/residuated-preservation-tension-on-bottom-cells.md), without touching the chapter's existing files.

The remaining four sub-questions — hyperdoctrine adjoints, closure 2-monad, Verdier dual, strong-MLD — are independent of this resolution. The expected pattern (bilattice fragment extends cleanly, residuated/structural fragment may inherit existing tensions) is a natural template to use when working through them.
