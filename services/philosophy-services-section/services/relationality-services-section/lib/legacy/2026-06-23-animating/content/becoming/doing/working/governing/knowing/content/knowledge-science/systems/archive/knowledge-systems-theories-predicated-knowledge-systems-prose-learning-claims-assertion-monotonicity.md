---
type: theorem
status: sketch
depends-on: [predicated-knowledge-system, knowledge-fiber-algebra, knowledge-order]
see-also: [assert, federate]
---

# Assertion is monotone in the knowledge order (sketch)

**Theorem.** Let $\mathcal{K} = (\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$ be a predicated knowledge system, $S \in \Sigma$ a scope, and $\mathrm{assert}(s, p, o, \alpha, \sigma)$ the substrate operation per [assert](../morphisms/assert.md) that asserts cell $(s, p, o)$ with positive-evidence value $\alpha \in \mathbf{L}$ from source $\sigma$. Then for every settled state $v_S$ of the scope:
$$v_S \;\leq_k\; \mathrm{assert}(s, p, o, \alpha, \sigma)(v_S)$$
in the [knowledge order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) on the scope's fiber algebra.

## Proof

By definition (per [assert](../morphisms/assert.md)),
$$\mathrm{assert}(s, p, o, \alpha, \sigma)(v_S) \;=\; v_S \vee_k (\alpha, \mathbf{0})_{(s, p, o)}$$
where $(\alpha, \mathbf{0})_{(s, p, o)}$ is the bilattice element that places the value $(\alpha, \mathbf{0}) \in \mathbf{L}^\bowtie$ at coordinate $(s, p, o)$ and $(\mathbf{0}, \mathbf{0}) = \bot$ at every other coordinate.

The knowledge-order $\vee_k$ is the join in the bilattice's $\leq_k$ ordering. By the universal property of joins, $v_S \leq_k v_S \vee_k x$ for every $x$. Applying this with $x = (\alpha, \mathbf{0})_{(s, p, o)}$ gives
$$v_S \;\leq_k\; v_S \vee_k (\alpha, \mathbf{0})_{(s, p, o)} \;=\; \mathrm{assert}(\ldots)(v_S). \qquad \square$$

## Corollaries

**(C1) Assertion never decreases evidence.** The fiber-algebra cells' $t$-coordinates and $f$-coordinates can only grow under repeated assertion (and denial) operations. No $t$-valued cell ever becomes $\bot$ via assertion.

**(C2) Repeated assertion of the same cell from different sources accumulates.** If $\mathrm{assert}(s, p, o, \alpha_1, \sigma_1)$ and $\mathrm{assert}(s, p, o, \alpha_2, \sigma_2)$ are applied in either order, the result on the cell is $(\alpha_1 \vee_{\mathbf{L}} \alpha_2, \mathbf{0})$ — the bilattice's positive-evidence channel accumulates the join of the two source values.

**(C3) Assertion followed by denial of the same cell produces $\top$.** $\mathrm{assert}(s, p, o, \alpha) \circ \mathrm{deny}(s, p, o, \beta)$ produces value $(\alpha, \beta)$ at the cell, which equals $\top \in \mathbf{L}^\bowtie$ when $\alpha = \beta = \mathbf{1}$. The contestation is recorded rather than overwritten.

**(C4) Assertion is idempotent.** $\mathrm{assert}(s, p, o, \alpha, \sigma)^2 = \mathrm{assert}(s, p, o, \alpha, \sigma)$ — the second invocation joins the cell with itself, leaving the value unchanged.

## Relation to upstream literature

The monotonicity of assertion in the knowledge order is the bilattice analogue of *RDF triple-store insertion monotonicity* and *Datalog fact assertion monotonicity*; the Belnap-FOUR generalisation lifts the property from $\mathbf{2}$-valued ($t$ vs. absent) to $\mathbf{FOUR}$-valued ($\bot$ vs. $t$ vs. $f$ vs. $\top$) without changing the underlying lattice-theoretic argument. The substrate gains the contestation channel (C3) over RDF and Datalog; its monotonicity proof is identical because both channels' accumulation is by join.

The proof above does not depend on $\mathbf{L}$ being $\mathbf{2}$ specifically; it holds for any residuated lattice $\mathbf{L}$, hence for any value-domain choice the substrate admits.
