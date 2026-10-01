---
type: definition
class: filtered-algebra
symbol: "A^{\\flat}_p"
depends-on: [predication-fiber-algebra, closure-rule-system, bilattice-stabilization-nucleus, closure-operator, settling-monotonicity, knowledge-order]
see-also: [closure-2-monad, sigma-delta-pass-decomposition, settling-fiber-groupoid, witness]
name: Stratified predication fiber
description: A stratified predication fiber $A^{\flat}p$ over a closure-rule system $\mathcal{S}$ and a bilattice-stabilization nucleus $N\Delta$ is the predication fiber algebra $Ap$ equipped with a per-cell-atom stratum assignment
---

# Stratified predication fiber

A **stratified predication fiber** $A^{\flat}_p$ over a [closure-rule system](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/closure-rule-system.md) $\mathcal{S}$ and a [bilattice-stabilization nucleus](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/bilattice-stabilization-nucleus.md) $N_\Delta$ is the [predication fiber algebra](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-fiber-algebra.md) $A_p$ equipped with a per-cell-atom **stratum assignment**

$$
\mathrm{strat} \,:\, \mathrm{Atoms}(A_p) \;\longrightarrow\; \{0, 1, 2\}
$$

— equivalently, a $\{0,1,2\}$-graded decomposition $A^{\flat}_p \;=\; A^{(0)}_p \;\sqcup\; A^{(1)}_p \;\sqcup\; A^{(2)}_p$ of the underlying atom-set into three sub-presheaves whose union (as cell records) is $A_p$ — together with a per-atom **witness chain** $\mathrm{deps}: \mathrm{Atoms}(A_p) \to \mathrm{Pow}(\mathrm{Atoms}(A_p))$ pointing each higher-stratum atom to the strictly-lower-stratum atoms that justified its emission.

The strata are named:

| Stratum | Tag | Generation |
|---|---|---|
| $0$ | asserted | Input atoms — claims admitted by an external sender; not yet exposed to $\mathcal{S}$ or $N_\Delta$. |
| $1$ | saturated | Atoms in $\mathrm{cl}^{\mathcal{S}}(A^{(0)}_p) \setminus A^{(0)}_p$ — conclusions derivable by $\mathcal{S}$-firings against asserted (and possibly previously-saturated) premises. |
| $2$ | settled | Atoms in $N_\Delta(A^{(0)}_p \cup A^{(1)}_p) \setminus (A^{(0)}_p \cup A^{(1)}_p)$ — per-cell bilattice fixed points of $T_a(x) = a \Rightarrow (a \odot x)$ that lie in the joint $\mathrm{Fix}(\mathrm{cl}^{\mathcal{S}}) \cap \mathrm{Fix}(N_\Delta)$. |

A stratified predication fiber is the math-side carrier of "the same cell coordinate $(s, p, o)$ may be witnessed at three structurally distinct degrees of derivation, each with its own retraction semantics, federation policy, and audit role."

## Structural properties

**Stratum-respecting generation.** $A^{(1)}_p$ is exactly the σ-derivable-but-not-asserted closure of $A^{(0)}_p$, and $A^{(2)}_p$ is exactly the Δ-derived-but-not-already-present closure of $A^{(0)}_p \cup A^{(1)}_p$. Equivalently, stratum is the *closure-degree* of an atom under the $\mathcal{S}/N_\Delta$ pair: stratum $0$ atoms have empty $\mathrm{deps}$; stratum $1$ atoms have $\mathrm{deps} \subseteq A^{(0)}_p \cup A^{(1)}_p$ with at least one σ-firing in their generation; stratum $2$ atoms have $\mathrm{deps} \subseteq A^{(0)}_p \cup A^{(1)}_p$ with at least one Δ-stabilization in their generation.

**Forward-only stratum.** For each cell coordinate $a = (s, p, o)$, the stratum-assignment $\mathrm{strat}(c_a^\tau)$ on the family $(c_a^\tau)_{\tau}$ of atoms emitted at $a$ across the trajectory is non-decreasing in the lex-canonical [firing trajectory](../../documents/articles/research/2026/07/31/lenticule-import/theorems/canonical-firing-trajectory-via-lex-order.md) ordinal $\tau$. The graded decomposition is therefore a *filtration* of the trajectory's emitted atom set, never demoted.

**Persistence-under-promotion.** When a higher-stratum atom $c_a^{\tau'}$ is emitted at coordinate $a$, the lower-stratum atom $c_a^{\tau}$ ($\tau < \tau'$) that witnessed the earlier value is *not* removed; it remains in $A^{\flat}_p$ as a separate atom, accessible by stratum-indexed projection. This is the load-bearing structural property that makes retraction non-destructive: the lower-stratum atom is the lasting record of the asserted premise that justified the higher-stratum derivation.

**Acyclic witness chain along the trajectory.** Within a single settling, the witness graph $(\mathrm{Atoms}(A^{\flat}_p), \mathrm{deps})$ is acyclic: if $c \in \mathrm{deps}^*(c')$ then $\mathrm{strat}(c) < \mathrm{strat}(c')$ or $\mathrm{strat}(c) = \mathrm{strat}(c')$ with $c$ emitted in a strictly-earlier σ-pass layer than $c'$. Acyclicity follows from forward-only stratum together with the lex-canonical trajectory's layer-respect: a σ-firing's premise atoms are present at the start of the firing's layer, and the firing's conclusion is emitted at a strictly-later $(\tau, k)$ position.

**Default-projection semantics.** The map $\pi_2: A^{\flat}_p \to A^{(2)}_p$ that retains only stratum-2 atoms is the *default projection* of the stratified fiber. The substrate's read surfaces commit to this projection as the meaning of "the current value at $(s, p, o)$" — atoms at strata $0$ and $1$ are derivation-record content, available to audit and federation but not to default consumers.

## Action of σ and Δ on $A^{\flat}_p$

The σ-nucleus $\mathrm{cl}^{\mathcal{S}}$ and Δ-nucleus $N_\Delta$ act on $A^{\flat}_p$ in stratum-emitting form:

- $\mathrm{cl}^{\mathcal{S}}$ reads atoms at strata $\le 1$, fires rules, and **emits new atoms at stratum $1$** with $\mathrm{deps}$ pointing to the firing's premise atoms. It does not modify atoms in place.
- $N_\Delta$ reads atoms at strata $\le 2$, runs the per-cell $T_a$-orbit, and **emits new atoms at stratum $2$** with $\mathrm{deps}$ pointing to the cell's stratum-1 (or stratum-0) atoms whose values were composed in the orbit. It does not modify atoms in place.

The "atoms-not-modified-in-place" discipline is what distinguishes the stratified-fiber action from the action on the underlying $A_p$. Without stratification, $\mathrm{cl}^{\mathcal{S}}$ may be modelled as updating cell values; with stratification, every update is *appended* as a new atom at the strictly-higher stratum, and the cell's "current" value is the projection $\pi_2$.

## Relationship to the closure 2-monad

The closure 2-monad on $A_p$ (per [closure-2-monad](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/closure-2-monad.md)) is a property-like 2-monad whose algebras are the closure-fixed points. The stratified predication fiber is a *refinement* of the 2-monad's free-algebra structure: the 2-cell algebra fiber's underlying atom set is the stratum-2 sub-presheaf $A^{(2)}_p$, and the strata $0$ and $1$ record the *generators* of the free algebra rather than the algebra itself.

Equivalently: $\pi_2: A^{\flat}_p \to A^{(2)}_p$ is the algebra map of the closure 2-monad; the strata-0-and-1 atoms are the "presentation data" of the algebra, retained on disk for the [witness](../../documents/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/witness.md) discipline. The stratified fiber is therefore the natural carrier for any substrate that needs both the algebra (for default reads) *and* the presentation (for audit, federation, and retraction analysis).

## Position

The stratified predication fiber is the math object the substrate's stratum-tag discipline reflects in wire form. It is the smallest structure that:

1. Distinguishes the three *closure-degrees* an atom may carry (asserted, σ-derivable, σ-and-Δ-stabilized) without conflating them as a single "current value" — the conflation that the dev spec's `dont-flatten-the-tower` motivation forbids.
2. Carries a witness chain $\mathrm{deps}$ on every atom of stratum $> 0$, making per-atom dependent-invalidity computable from the witness graph alone (per [saturation-respects-asserted-monotonicity](../../documents/articles/research/2026/07/31/lenticule-import/theorems/saturation-respects-asserted-monotonicity.md)).
3. Forms the carrier on which the lex-canonical [firing trajectory](../../documents/articles/research/2026/07/31/lenticule-import/theorems/canonical-firing-trajectory-via-lex-order.md) and its [per-artifact projection](../../documents/articles/research/2026/07/31/lenticule-import/theorems/per-artifact-trajectory-projection-is-contiguous.md) are stated — the trajectory emits atoms into the stratified fiber, and the projection structure of the trajectory inherits the stratification.

Engineering-side, $A^{\flat}_p$ surfaces in the substrate as the wire-form `stratum` field on each cell record together with the `derived_from`/`derived_via` witness fields, formalised in [stratified-cell-atom](../../documents/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/stratified-cell-atom.md).
