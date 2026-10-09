---
type: theorem
status: proved
depends-on: [gauge-twisted-reindexing, gauge-connection, predication-fibration, predication-fiber-algebra, four-bilattice, twist-product, twist-product-fusion, twist-product-right-residual, negation, conflation, contrapositive-failure, klein-four-gauge-bundle, internal-z2-gauge]
see-also: [gauge-twisted-reindexing, twisted-beck-chevalley, beck-chevalley-commutation-on-predication-bilattices, contrapositive-failure]
---

# Gauge-twisted reindexing is a $K_4$-graded bilattice homomorphism

The [$A$-twisted reindexing](../morphisms/gauge-twisted-reindexing.md) $f^*_A$ associated to a [gauge connection](../objects/gauge-connection.md) $A$ on a [predication fibration](../objects/predication-fibration.md) preserves the bilattice structure of the [predication fiber algebras](../objects/predication-fiber-algebra.md) up to the $K_4$-grading determined by $A(f)$. The four lattice operations $\{\wedge_t, \vee_t, \wedge_k, \vee_k\}$ are permuted according to the Klein-four action on operation symbols, while [negation](../morphisms/negation.md) and [conflation](../morphisms/conflation.md) are preserved strictly. The residuated operations $\odot, \Rightarrow$ are *not* preserved by general $K_4$-elements: only the identity respects them, by [contrapositive-failure](contrapositive-failure.md).

## Statement

**Theorem.** *Let $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ be a predication fibration over $(\mathbf{L}, \mathcal{C}, E)$ with $\mathbf{L} = \mathbf{2}$ (so the fiber is $\mathbf{FOUR}^{E \times E}$ and the gauge group is $K_4 = \mathrm{Aut}(\mathbf{FOUR})$). Let $A : \mathcal{C} \to BK_4$ be a gauge connection. For every $f : q \to p$ in $\mathcal{C}$ the twisted reindexing $f^*_A : \mathcal{E}_p \to \mathcal{E}_q$ satisfies, for all $v, w \in \mathcal{E}_p$:*

1. *(Lattice operations, graded.)*
   $$f^*_A(v \star w) \;=\; f^*_A(v) \,\star^{A(f)}\, f^*_A(w), \qquad \star \in \{\wedge_t, \vee_t, \wedge_k, \vee_k\},$$
   *where the $K_4$-action on lattice operation symbols is given by*

   | $g \in K_4$ | $\wedge_t^g$ | $\vee_t^g$ | $\wedge_k^g$ | $\vee_k^g$ |
   |---|---|---|---|---|
   | $\mathrm{id}$ | $\wedge_t$ | $\vee_t$ | $\wedge_k$ | $\vee_k$ |
   | ${\sim}$ | $\vee_t$ | $\wedge_t$ | $\wedge_k$ | $\vee_k$ |
   | $-$ | $\wedge_t$ | $\vee_t$ | $\vee_k$ | $\wedge_k$ |
   | ${\sim} \circ -$ | $\vee_t$ | $\wedge_t$ | $\vee_k$ | $\wedge_k$ |

2. *(Negation and conflation, strict.)*
   $$f^*_A({\sim} v) \;=\; {\sim}\, f^*_A(v), \qquad f^*_A(- v) \;=\; -\, f^*_A(v).$$

3. *(Residuated operations, not preserved.)* The operations $\odot$ and $\Rightarrow$ are preserved by $f^*_A$ if and only if $A(f) = e$. For $A(f) \neq e$, both ${\sim}$ and $-$ fail to commute with $\odot$ and $\Rightarrow$ on $\mathbf{FOUR}$ — explicit counterexamples are given in [contrapositive-failure](contrapositive-failure.md) — and so $f^*_A$ is *not* a bilattice-residuated homomorphism in general.

*In particular, when $A(f) = e$ the preservation is strict for all bilattice-residuated operations, recovering axiom (A3) of the [predication fibration](../objects/predication-fibration.md). For $A(f) \neq e$, axiom (A3) is preserved on the bilattice fragment $\{\wedge_t, \vee_t, \wedge_k, \vee_k, {\sim}, -\}$ (graded for the four lattice operations, strict for the two involutions) but not on the residuated fragment $\{\odot, \Rightarrow\}$.*

## Proof

The argument decomposes the composite $f^*_A = A(f) \cdot f^*$ into the strict reindexing $f^*$ followed by the fiberwise $K_4$-action $A(f)$.

**Step 1: $f^*$ preserves all bilattice-residuated operations strictly.** This is axiom (A3) of the predication fibration: the cleavage reindexing $f^*$ for any of the four generators (and hence for every morphism in $\mathcal{C}$) is a bilattice-residuated homomorphism — preserving $\wedge_t, \vee_t, \wedge_k, \vee_k, {\sim}, \odot, \Rightarrow$ pointwise. Since [conflation](../morphisms/conflation.md) on $\mathbf{FOUR}$ acts on twist coordinates uniformly and the four reindexing types act only on the cell index $E \times E$ (specialization restricts cellwise, converse swaps subject/object, projections fold along an axis — none touch the value coordinates), $f^*$ also preserves $-$ strictly.

**Step 2: $A(f)$ acts on bilattice operation symbols.** Each element of $K_4 = \mathrm{Aut}(\mathbf{FOUR})$ preserves the *bilattice* structure abstractly — the pair of lattice structures together with their De Morgan-style involutions — but with elements that may reverse one or both orders. The action on the four lattice operations is governed by the order properties of [negation](../morphisms/negation.md) and [conflation](../morphisms/conflation.md):

- $\sim$ is antitone in $\leq_t$ and monotone in $\leq_k$. Antitonicity in $\leq_t$ converts $\sup_t$ to $\inf_t$ and vice versa, so $\sim(a \wedge_t b) = \sim a \vee_t \sim b$; equivalently, $(\wedge_t)^{\sim} = \vee_t$ and $(\vee_t)^{\sim} = \wedge_t$. Monotonicity in $\leq_k$ preserves $\wedge_k, \vee_k$.
- $-$ is monotone in $\leq_t$ and antitone in $\leq_k$, swapping $(\wedge_k, \vee_k)$ and fixing $(\wedge_t, \vee_t)$.
- ${\sim} \circ -$ swaps both pairs.
- $\mathrm{id}$ fixes everything.

This produces the action table in part (1) of the statement.

For [negation](../morphisms/negation.md) and [conflation](../morphisms/conflation.md) themselves: since $K_4$ is abelian and is generated by ${\sim}, -$, every $g \in K_4$ commutes with both involutions. Hence $g({\sim} v) = {\sim} g(v)$ and $g(-v) = - g(v)$ pointwise, giving part (2).

**Step 3: $A(f)$ does not act on $\odot$ or $\Rightarrow$ as automorphisms of the residuated structure.** This is exactly [contrapositive-failure](contrapositive-failure.md): there exist $a, b \in \mathbf{FOUR}$ with $\sim(a \odot b) \neq \sim a \odot \sim b$ (e.g. $a = \mathbf{t}, b = \mathbf{f}$ gives $\sim(\mathbf{t} \odot \mathbf{f}) = \mathbf{t}$ but $\sim\mathbf{t} \odot \sim\mathbf{f} = \mathbf{f}$), and similarly $\sim(a' \Rightarrow b') \neq \sim a' \Rightarrow \sim b'$. A direct calculation gives the symmetric counterexample for conflation: $-( \bot \odot \mathbf{t}) = -\bot = \top$ but $- \bot \odot -\mathbf{t} = \top \odot \mathbf{t} = \mathbf{t}$. So neither ${\sim}$ nor $-$ is a $\odot$-homomorphism, and the same for $\Rightarrow$. Composing with the strict $f^*$ preserves these failures, giving part (3).

**Step 4: assemble parts (1) and (2).** For any *bilattice* operation $\star \in \{\wedge_t, \vee_t, \wedge_k, \vee_k\}$,

$$f^*_A(v \star w) \;=\; A(f)\big( f^*(v \star w) \big) \;=\; A(f)\big( f^*(v) \star f^*(w) \big) \;=\; A(f)(f^*(v)) \,\star^{A(f)}\, A(f)(f^*(w)) \;=\; f^*_A(v) \,\star^{A(f)}\, f^*_A(w),$$

using Step 1 in the second equality, Step 2 in the third, and the definition of $f^*_A$ in the fourth. For $\star \in \{{\sim}, -\}$ the $K_4$-action is trivial on the symbol and the equation reduces to strict preservation, completing parts (1) and (2). $\square$

## Discussion

The theorem is the gauge-theoretic refinement of axiom (A3). The strict bilattice-residuated axiom is recovered exactly as the special case $A(f) = e$. The general statement records:

- **Bilattice fragment is gauge-symmetric, graded.** The four lattice operations are permuted by $K_4$ via the action on operation symbols.
- **Involution fragment is gauge-symmetric, strict.** Both ${\sim}$ and $-$ commute with the entire gauge group by abelianness of $K_4$.
- **Residuated fragment is gauge-broken.** Only the identity element preserves $\odot, \Rightarrow$; the rest of $K_4$ violates the homomorphism law explicitly per [contrapositive-failure](contrapositive-failure.md).

The asymmetry has a structural reading: the bilattice and involution data are intrinsic to $\mathbf{FOUR}$ as a bilattice, and $K_4$ is exactly the automorphism group of that bilattice structure. The residuated operations $\odot, \Rightarrow$ encode the additional structure of the *underlying* residuated lattice $\mathbf{L} = \mathbf{2}$ via the twist construction $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$; this finer choice is not preserved by all bilattice automorphisms, only by those that respect the twist coordinates. For $\mathbf{2}^\bowtie$ this restricts to the trivial subgroup.

The consequence is that the natural domain of "gauge-twisted hyperdoctrinal structure" is the bilattice-and-quantifier fragment of [predication-hyperdoctrine](../objects/predication-hyperdoctrine.md) — axioms B1k, B1t, B2k, B2t, B3 — which use only $\wedge_k, \wedge_t$ and quantifier adjoints. The residuated structure sits outside the gauge-symmetric layer.

For twist products $\mathbf{L}^\bowtie$ over a non-trivial commutative residuated lattice $\mathbf{L}$, the gauge group is $\mathrm{Aut}(\mathbf{L}^\bowtie)$ — generally larger than $K_4$ and possibly a continuous Lie-group-valued gauge structure (cf. [klein-four-gauge-bundle](../objects/klein-four-gauge-bundle.md)'s open downstream). The graded statement (parts 1 and 2) adapts immediately. The residuated-fragment statement (part 3) requires re-checking case-by-case: the residuated operations are preserved exactly by the subgroup of bilattice automorphisms that descend from automorphisms of the underlying $\mathbf{L}$.
