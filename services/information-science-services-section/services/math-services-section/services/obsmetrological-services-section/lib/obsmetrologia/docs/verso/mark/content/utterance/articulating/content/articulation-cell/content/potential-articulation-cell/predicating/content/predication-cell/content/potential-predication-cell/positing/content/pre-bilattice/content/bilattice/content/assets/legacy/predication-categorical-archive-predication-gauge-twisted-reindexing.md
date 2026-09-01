---
type: morphism
class: reindexing
symbol: "f^*_A"
status: draft
realizes: [internal-z2-gauge]
depends-on: [gauge-connection, predication-fibration, predication-hyperdoctrine, predicate-category, predication-fiber-algebra, klein-four-gauge-bundle, four-bilattice, negation, conflation, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection]
see-also: [gauge-connection, gauge-twisted-reindexing-graded-homomorphism, twisted-beck-chevalley, beck-chevalley-commutation-on-predication-bilattices]
---

# Gauge-twisted reindexing

Fix a [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ and a [gauge connection](../objects/gauge-connection.md) $A : \mathcal{C} \to BK_4$. For each morphism $f : q \to p$ in $\mathcal{C}$, the **$A$-twisted reindexing** is the composite

$$f^*_A \;:=\; A(f) \cdot f^* \;:\; \mathcal{E}_p \longrightarrow \mathcal{E}_q,$$

where $f^* : \mathcal{E}_p \to \mathcal{E}_q$ is the cleavage reindexing of $p$ (acting cellwise per axiom (A2) of the [predication fibration](../objects/predication-fibration.md)) and $A(f) \cdot$ is the fiberwise action of the group element $A(f) \in K_4 = \mathrm{Aut}(\mathbf{FOUR})$ on the [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_q = \mathbf{L}^{\bowtie\, E \times E}$.

Concretely, for $v \in \mathcal{E}_p$ and $(s, o) \in E \times E$,

$$f^*_A(v)(s, o) \;=\; A(f) \big( f^*(v)(s, o) \big),$$

with $A(f) \in \{\mathrm{id}, {\sim}, -, {\sim} \circ - \}$ acting on $\mathbf{FOUR}$-values componentwise.

## Functoriality

The assignment $f \mapsto f^*_A$ is functorial in $\mathcal{C}^{\mathrm{op}}$ when $A$ is functorial *and* the gauge values commute with cellwise reindexing. The composition calculation is

$$(g \circ f)^*_A \;=\; A(g \circ f) \cdot (g \circ f)^* \;=\; (A(g) A(f)) \cdot (f^* g^*) \;\stackrel{?}{=}\; A(f) \cdot f^* \cdot A(g) \cdot g^* \;=\; f^*_A \circ g^*_A,$$

using (C2) and ordinary fibration functoriality. The starred equality requires $A(g) \cdot f^* = f^* \cdot A(g)$ — i.e. the gauge value commutes past the cellwise reindexing $f^*$. This is the "orthogonality" check: $A(g)$ acts on cell *values* via the bilattice involution; $f^*$ acts on cell *indices* via the partial map $\phi_f : E \times E \rightharpoonup E \times E$. The two actions commute on cells inside the support of $\phi_f$ trivially. On cells outside the support, where $f^*$ extends by $\bot$, commutation requires $A(g)(\bot) = \bot$.

This holds whenever $A$ is valued in the $\bot$-fixing subgroup $K_4^{\,k} = \{e, {\sim}\}$. For $A$ valued in elements containing $-$ — namely $\{-, {\sim}\circ-\}$, which send $\bot \mapsto \top$ — the orthogonality fails on outside-support cells, and the twisted cleavage $f \mapsto f^*_A$ is not in general a strict functor on $\mathcal{C}^{\mathrm{op}}$. The same issue blocks the naive $\leq_t$-axis dualization in [twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md); see [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md) for the open question about gauging the cleavage extension.

For $A : \mathcal{C} \to BK_4^{\,k}$, $A$-twisting upgrades the cleavage of $p$ to a new cleavage $f \mapsto f^*_A$, defining a new cloven Grothendieck fibration $p_A$ on the same total category $\mathcal{E}$. Two gauge-equivalent $K_4^{\,k}$-connections produce naturally isomorphic twisted fibrations.

## Bilattice structure preservation (graded)

The reindexing $f^*$ preserves all bilattice-residuated operations strictly (axiom (A3) of the predication fibration). The Klein-four action $A(f) \cdot$ permutes the *bilattice* operations in a controlled way: $\sim$ swaps $(\wedge_t, \vee_t)$ and fixes $(\wedge_k, \vee_k)$; $-$ swaps $(\wedge_k, \vee_k)$ and fixes $(\wedge_t, \vee_t)$; every $g \in K_4$ commutes with [negation](negation.md) $\sim$ and [conflation](conflation.md) $-$ themselves (since $K_4$ is abelian). The composite $f^*_A$ is therefore a *$K_4$-graded* bilattice homomorphism: it preserves the lattice operations up to the $A(f)$-conjugate of the operation, and preserves $\sim, -$ strictly. Strict preservation of all bilattice operations is recovered when $A(f) = e$.

The Klein-four action does **not** respect the residuated operations $\odot, \Rightarrow$: only the identity element preserves them, by [contrapositive-failure](../theorems/contrapositive-failure.md). Consequently $f^*_A$ is *not* in general a bilattice-residuated homomorphism — the residuated content of reindexing is not gauge-symmetric. This restricts the natural domain of "gauge-twisted hyperdoctrinal structure" to the bilattice-and-quantifier part (B1–B3 in [predication-hyperdoctrine](../objects/predication-hyperdoctrine.md), which use only $\wedge_k, \wedge_t$); the residuated operations sit outside the gauge-symmetric layer.

The precise statement and proof are in [gauge-twisted reindexing graded homomorphism](../theorems/gauge-twisted-reindexing-graded-homomorphism.md).

## Role

The twisted reindexings are the substrate's first systematically curved morphisms. Where the untwisted predication hyperdoctrine treats every $K_4$-frame on every fiber as the *same* frame — the constant trivialization — the twisted hyperdoctrine treats the $K_4$-frame as a sheaf whose comparison maps along $f$ are the gauge elements $A(f)$. This is the same move that turns a vector bundle with constant frames into a vector bundle with a connection, with the same downstream payoff: holonomy, twisted cohomology, gauge-invariant invariants.
