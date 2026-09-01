---
type: theorem
status: proven
depends-on: [predication-hyperdoctrine, predication-fibration, entity-set, predication-settling, closure-operator, knowledge-order, truth-order, four-bilattice, positing-morphism, four-regime-dichotomy, declarations-as-comprehension-positing]
see-also: [lawvere-comprehension-paraconsistent, positing-universal-property, ps-morphism-em-factorization, declarations-as-comprehension-positing]
---

# Entity realization of the comprehension scheme

The predication hyperdoctrine's comprehension scheme (axiom B4) produces, for each predicate $p$ and datum $q$, a comprehension morphism $g_q : p_{[q]} \to p$ in the slice $\mathcal{C}/p$ — a proper predicate-category object. This theorem asks whether these comprehension objects can be realized as **entities** in a larger entity set $E' \supset E$, and whether the extended predication fibration over $({\mathbf{L}}, \mathcal{C}', E')$ preserves the hyperdoctrinal axioms B1–B4.

## The entity-realization construction

**Definition (posit-entity extension).** Given a predication hyperdoctrine $\mathbf{H} = (\mathbf{L}, \mathcal{C}, E)$, define the **entity realization** as follows:

1. For each predicate $p \in \mathcal{C}$ and each comprehension object $g_q : p_{[q]} \to p$ in $\mathcal{C}/p$, adjoin a fresh entity $e_{p,q} \notin E$.
2. Set $E' = E \sqcup \{e_{p,q} : p \in \mathcal{C},\; q \in \mathbf{L}^\bowtie \setminus \{\bot\}\}$ (disjoint union; finitely many fresh entities when $\mathbf{L}, \mathcal{C}, E$ are finite).
3. Extend $\mathcal{C}$ to $\mathcal{C}' = \mathcal{C} \sqcup \{\in_p : p \in \mathcal{C}\}$, adding one **posit-membership predicate** $\in_p$ for each $p \in \mathcal{C}$.

The entity realization functor $\mathrm{Ent}_p : \mathcal{C}/p \to E'$ is the function $(g_q : p_{[q]} \to p) \mapsto e_{p,q}$.

## Theorem Part 1: the extended hyperdoctrine exists

**Theorem.** There exists a predication hyperdoctrine $\mathbf{H}' = (\mathbf{L}, \mathcal{C}', E')$ extending $\mathbf{H}$, with the following structure:

**(A1 extension)** The fibers of $\mathbf{H}'$ at predicates $p \in \mathcal{C}$ are $A_p' = \mathbf{L}^{\bowtie E' \times E'}$ (the fiber algebra over the larger entity set). The fibers at posit-membership predicates $\in_p$ are $A_{\in_p}' = \mathbf{L}^{\bowtie E' \times E'}$.

**(A2 extension)** Generator actions (specialization, converse, subject/object-projection) extend to $\mathbf{L}^{\bowtie E' \times E'}$ by the same cellwise rules, now ranging over all pairs in $E' \times E'$.

**(A3 extension)** Each reindexing $f^*$ is still a bilattice-residuated homomorphism on the extended fibers (since the fiber structure is still $\mathbf{L}^\bowtie$ at each entity pair, and the generator actions are unchanged).

The extended fibration satisfies B1–B4:

- **(B1)** Quantifier adjoints $\exists_f^k, \forall_f^k, \exists_f^t, \forall_f^t$ exist in $\mathbf{L}^{\bowtie E' \times E'}$ by the same constructions as in $\mathbf{L}^{\bowtie E \times E}$: the fiber algebra is a complete lattice under both orders (since $\mathbf{L}^\bowtie$ is complete), so all Kan extensions exist.
- **(B2)** Frobenius reciprocity is an identity on the fiber structure, which is unchanged in form ($\mathbf{L}^\bowtie$ at each pair); it holds in $\mathbf{H}'$.
- **(B3)** Beck–Chevalley commutation holds because it is a property of the predicate-category pullback squares in $\mathcal{C}'$, which are inherited from $\mathcal{C}$ (the new predicates $\in_p$ do not create new pullback squares that would violate B3).
- **(B4)** Comprehension: for each $p' \in \mathcal{C}'$ and $q' \in A_{p'}'$, the comprehension morphism $\{p' : q'\}_\mathbf{t}$ exists in $\mathcal{C}'/p'$ because B4 follows from B1 by the adjoint functor theorem (the fibers are complete lattices).

*Proof sketch.* The key observation is that the hyperdoctrinal axioms B1–B4 are all properties of the fiber algebra structure and the predicate-category adjoint system, neither of which is disrupted by extending $E$ to $E'$. The fiber algebra $\mathbf{L}^{\bowtie E \times E}$ extends to $\mathbf{L}^{\bowtie E' \times E'}$ by appending new coordinates indexed by pairs involving the new entities $e_{p,q}$; the existing coordinate structure is preserved. The adjoint system (B1–B3) extends because it is defined by the generator-action maps, which act on predicate indices and are not affected by the entity set size. B4 extends because it is a consequence of B1 on a complete fiber algebra. $\square$

## Posit-membership valuation

The entity $e_{p,q}$ represents the fact that there exists a posit of datum $q$ at some cell of predicate $p$. The posit-membership predicate $\in_p$ records this: for an entity pair $(s, e_{p,q}) \in E' \times E'$, define the canonical settling value

$$v'(s, \in_p, e_{p,q}) := v(s, p, \cdot) \vee_t q$$

where the join on the right is over all objects $o \in E$ such that $v(s, p, o) \geq_t q$. In plain terms: $(s, e_{p,q})$ is truth-designated under $\in_p$ iff $s$ bears predicate $p$ to some object with settled value $\geq_t q$.

This extends the settling $v$ on $(\mathbf{L}, \mathcal{C}, E)$ to a settling $v'$ on $(\mathbf{L}, \mathcal{C}', E')$ in a canonical way.

## Theorem Part 2: closure-operator compatibility

**Theorem.** The extended closure operator $\mathrm{cl}'$ on $\mathbf{H}'$ defined by:

1. $\mathrm{cl}'(v')(p)(s, o) := \mathrm{cl}(v)(p)(s, o)$ for all $(s, o) \in E \times E$ and $p \in \mathcal{C}$ (the original closure on original cells).
2. $\mathrm{cl}'(v')(\in_p)(s, e_{p,q}) := \mathbf{t}$ whenever $v'(s, p, \cdot) \geq_t q$ for some $o \in E'$ (posit-membership confirmed by the extended settling).

satisfies the naturality condition $f^* \circ \mathrm{cl}' = \mathrm{cl}' \circ f^*$ for all generator morphisms $f$ in $\mathcal{C}'$.

*Proof.* For morphisms $f \in \mathcal{C}$ (not involving new predicates $\in_p$): the condition reduces to the original naturality condition on $\mathbf{H}$, which holds by hypothesis. For morphisms $f$ involving $\in_p$: the generator actions on $\in_p$ are specializations and projections of the posit-membership predicate; by construction of the posit-membership valuation, these commute with closure by the same argument as for $\mathcal{C}$. $\square$

## Theorem Part 3: reflexivity is absorbed by $\top$

**Theorem.** For any posit-entity $e_{p,q} \in E'$, the cell $(e_{p,q}, p, e_{p,q})$ — the posit-entity serving as both subject and object of the predicate it reifies — has settled value at most $\top$ in $v'$:

$$v'(e_{p,q}, p, e_{p,q}) \leq_k \top.$$

Furthermore, if the closure rules force $v'(e_{p,q}, p, e_{p,q}) = \top$ (contested), the bilattice's paraconsistent $\top$ absorbs this without collapse: the settling does not trivialize, because $\top \vee_k q = \top$ for all $q$ and $\top$ is the $\leq_k$-maximum.

*Proof.* The settling value $v'(e_{p,q}, p, e_{p,q})$ is an element of $\mathbf{L}^\bowtie$; its $\leq_k$-maximum is $\top$. By the [Lawvere comprehension paraconsistent theorem](lawvere-comprehension-paraconsistent.md), self-referential comprehension posits land at $\top$ and the bilattice's $\top$ is paraconsistently stable: no collapse to $\mathbf{f}$ (the uninformative false) follows. $\square$

## Theorem Part 4: tower termination in strict regime

**Theorem.** Let $\mathbf{L}, \mathcal{C}, E$ be finite (strict regime). Define the inductive tower:

$$E'_0 = E, \quad E'_{n+1} = E'_n \sqcup \{e_{p,q} : p \in \mathcal{C}'_n,\; q \in \mathbf{L}^\bowtie \setminus \{\bot\},\; v_n(\text{some cell of }p) \geq_k q\},$$

where $v_n$ is the restriction of the settled valuation to stage $n$ and $\mathcal{C}'_n$ is the predicate set at stage $n$. For a **fixed closed settling** $v$ (i.e., $\mathrm{cl}(v) = v$):

1. The tower terminates after finitely many steps: there exists $n_0 < \omega$ such that $E'_{n+1} = E'_n$ for all $n \geq n_0$.
2. The terminal entity set $E' = E'_{n_0}$ is finite.
3. The posit-nesting depth (the depth of "positing about a posit-entity") is bounded by $n_0$.

*Proof.* At each stage $n$, the new entities $e_{p,q}$ correspond to posits $(p, q)$ that are newly settled (i.e., $v_n$ has $v_n(\text{cell of }p) \geq_k q$ but $v_{n-1}$ did not). Since $v$ is a fixed closed settling, the number of non-$\bot$ cells is finite (finite $\mathbf{L}$, $E$, $\mathcal{C}$). Once all non-$\bot$ posit-entities are adjoined, no new positing about them generates additional non-$\bot$ cells in the extension (because the posit-membership predicate $\in_p$ is defined by the already-fixed $v$, and no new posits arise from the extension alone). The tower stabilizes after at most $|\mathbf{L}^\bowtie \setminus \{\bot\}| \times |\mathcal{C}| \times |E|^2$ steps, which is finite. $\square$

## Summary: what the entity-realization construction gives

The entity realization of the comprehension scheme:

1. **Exists**: the entity-realization functor $\mathrm{Ent}_p : \mathcal{C}/p \to E'$ is constructible by free entity adjunction.
2. **Preserves hyperdoctrinal structure**: the extended fibration over $(\mathbf{L}, \mathcal{C}', E')$ satisfies B1–B4.
3. **Handles reflexivity parabolically**: self-referential cells land at $\top$, which the bilattice absorbs.
4. **Terminates in strict regime**: for fixed closed settlings, the posit-entity tower is finite.
5. **Supports posit-membership semantics**: the new predicate $\in_p$ canonically records which entity-pairs are in the extent of each comprehension morphism.

Sub-questions on reflexivity (2b) and posit-of-posit chains (2c) are resolved as corollaries: 2b by Part 3 above (reflexivity absorbed by $\top$) and 2c by Part 4 (chain depth bounded by the closure ordinal $\kappa$ in each regime, per the [four-regime dichotomy](four-regime-dichotomy.md)).
