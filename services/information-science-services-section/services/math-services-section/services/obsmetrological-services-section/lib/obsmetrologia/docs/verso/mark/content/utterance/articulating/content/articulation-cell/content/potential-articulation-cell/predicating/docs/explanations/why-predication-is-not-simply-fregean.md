---
name: why predication is not simply fregean
description: Classical Boolean logic is a collapsed projection of the richer predication fiber. The standard ingredients have separate literatures; the forced Fregean-predication to FOUR to Chu composition is a result of this research lab.
status: draft
---

There is a recurring confusion when someone first meets predication category theory after years of working in classical logic: they read "the bilattice has four values $\mathbf{t}, \mathbf{f}, \bot, \top$ instead of two" and conclude PCT is a non-classical alternative — one logic among many, comparable to intuitionistic logic or three-valued Łukasiewicz or paraconsistent LP. This framing is wrong in a specific, structural way that matters for actually working with the math.

Classical / Fregean / Boolean two-valued logic is not an alternative to predication. **It is a projection** — one fragment of the predication-hyperdoctrine, recoverable by restricting to a specific sub-poset of fiber values and using one of the hyperdoctrine's two parallel adjoint systems. The recovery is a theorem, not an axiom. PCT does not postulate classical logic; classical logic falls out.

This projection claim belongs to the lab's predication program. It must not be
misattributed to a generic curriculum or to the separate literatures on Fregean
predication, bilattices, or categorical logic.

## The two-axis structure of fiber values

A predication cell $\phi = (s, p, o)$ carries a value $v(p)(s, o)$ in the predication-fiber-algebra $A_p$. The fiber algebra is built from a residuated lattice $\mathbf{L}$ by the twist product $\mathbf{L}^\bowtie$, pointed by the entity-pair index $E \times E$. The fiber's value space inherits *two* orders from the twist product:

- the **truth order** $\leq_t$ — "which way does the evidence point" — with bottom $\mathbf{f}$ (told false) and top $\mathbf{t}$ (told true);
- the **knowledge order** $\leq_k$ — "how much has been settled" — with bottom $\bot$ (told nothing) and top $\top$ (told both).

The two orders are transverse: $\mathbf{t}$ and $\mathbf{f}$ are $\leq_t$-extremes and $\leq_k$-middles (both equally informative); $\bot$ and $\top$ are $\leq_k$-extremes and $\leq_t$-middles (both truth-neutral). On the four-bilattice $\mathbf{FOUR}$, the diamond has $\mathbf{f} \leq_t \{\bot, \top\} \leq_t \mathbf{t}$ horizontally and $\bot \leq_k \{\mathbf{t}, \mathbf{f}\} \leq_k \top$ vertically.

Each value encodes two independent quantities: how much positive evidence has arrived, and how much negative evidence has arrived. On $\mathbf{FOUR}$ that is the twist-product realization

$$\mathbf{f} = \langle 0, 1\rangle, \quad \bot = \langle 0, 0\rangle, \quad \mathbf{t} = \langle 1, 0\rangle, \quad \top = \langle 1, 1\rangle.$$

The two sides — for and against — are independently representable. *That* is the structural commitment of predication that classical logic lacks.

## What classical logic cannot represent

Classical / Fregean two-valued logic assigns each predication a single value in $\{\text{true}, \text{false}\}$. There is no way to express "no information has arrived about this cell" distinct from "the cell is false." There is no way to express "contradictory evidence has been received about this cell" distinct from any other value.

Concretely: a relational database storing facts about $\{\text{Alice}, \text{Bob}, \text{Carol}\}$ under a Likes predicate. The fact $(\text{Alice}, \text{Likes}, \text{Bob})$ is asserted; the fact $(\text{Bob}, \text{Likes}, \text{Alice})$ is denied; the fact $(\text{Alice}, \text{Likes}, \text{Carol})$ is reported by two sources who disagree; the fact $(\text{Bob}, \text{Likes}, \text{Carol})$ has never been mentioned by anyone. The four cells take values $\mathbf{t}, \mathbf{f}, \top, \bot$ respectively. Classical logic can represent the first two cleanly; it conflates the third with one of the first two (depending on which source's report it accepts last) and conflates the fourth with $\mathbf{f}$ (closed-world assumption) or refuses to represent it (open-world refusal). Three-valued logics (Kleene's K3, LP) recover one or the other of $\bot$ and $\top$ but not both. Only the bilattice-valued representation carries all four states natively.

This is the *evidence* role from the PCT literature: positive and negative evidence are *independently* representable; both sides may be present at once ($\top$); both sides may be absent at once ($\bot$). A framework conflating the two cannot represent disagreement, conflict-held-as-state, or absence-distinct-from-falsity.

## The two adjoint systems and the derivation of classical equality

The predication-hyperdoctrine satisfies the standard Lawvere–Seely conditions — quantifier adjoints, Frobenius reciprocity, Beck-Chevalley coherence, comprehension — *twice*: once in the $\leq_k$ enrichment, once in the $\leq_t$ enrichment. For every morphism $f : q \to p$ in the predicate category $\mathcal{C}$, the reindexing $f^* : \mathcal{E}_p \to \mathcal{E}_q$ has both a $\leq_k$-left-adjoint $\exists_f^k$ and a $\leq_t$-left-adjoint $\exists_f^t$ (and analogous right adjoints). This is the structural distinctive feature of PCT relative to e.g. Maruyama-style single-adjoint bilattice hyperdoctrines: *two parallel internal logics on a single fibration*.

From this structure, two equalities are derivable on the diagonal specialization $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E := \{(s, s) : s \in E\}$:

- **Classical equality** is the $\leq_t$-Lawvere image of the constant-$\mathbf{t}$ valuation:
  $$=_E \;:=\; \exists_g^t(\mathbf{1}_q^t), \qquad =_E(s, o) = \begin{cases} \mathbf{t} & s = o, \\ \mathbf{f} & s \neq o. \end{cases}$$
  This is standard two-valued classical equality. It is *derived* from the $\leq_t$-adjoint apparatus, not postulated. The bilattice first-order logics in the surrounding literature — BD∆ (Băutu et al.), Kamide–Zohar 2008, Běhounek–Daňková–Dvořák 2020 — postulate classical equality as a primitive on their bilattices. The predication-hyperdoctrine shows the postulate is unnecessary: classical equality falls out of the $\leq_t$ comprehension structure as a theorem.

- **Paraconsistent equality** is the $\leq_k$-Lawvere image of the constant-$\top$ valuation:
  $$\Delta_E^k \;:=\; \exists_g^k(\mathbf{1}_q^k), \qquad \Delta_E^k(s, o) = \begin{cases} \top & s = o, \\ \bot & s \neq o. \end{cases}$$
  The diagonal carries $\top$ (information-maximal); off-diagonal is $\bot$ (no claim). This equality is stable under the $\vee_k$-merge that drives CRDT convergence — the natural choice for replicated knowledge.

Both equalities arise from the same diagonal specialization $g$; they differ only in which adjoint system supplies the $\exists$. Neither is postulated; both are forced.

## So: where does Boolean live?

Classical / Fregean / Boolean first-order logic is the *sub-doctrine* of the predication-hyperdoctrine obtained by:

1. **Choosing $\mathbf{L} = \mathbf{2}$** (the simplest residuated lattice — the Boolean lattice).
2. **Restricting fiber values to the $\leq_t$-classical sub-poset** $\{\mathbf{t}, \mathbf{f}\} = \{\langle 1, 0\rangle, \langle 0, 1\rangle\}$ — the values where the negative coordinate is the classical complement of the for-coordinate. This drops $\bot$ and $\top$.
3. **Working in the $\leq_t$ adjoint system only**, ignoring the $\leq_k$ system entirely.
4. **Using $=_E$ as the equality predicate** (derived via the $\leq_t$-Lawvere image, as above).

Under these restrictions, every first-order classical theory recovers as a sub-doctrine of the predication-hyperdoctrine — quantifier adjoints, Frobenius, Beck-Chevalley, and comprehension all specialize correctly to their classical Lawvere-1969 forms.

Boolean isn't a parallel framework. Boolean is what's *left over* when you take the predication-hyperdoctrine and project out everything PCT adds beyond it — the $\leq_k$ axis, the $\bot$ and $\top$ values, the paraconsistent equality, the two-axis evidence structure.

By the same projection-shape, Datalog (Herbrand model with truth-functional predicates) and standard RDF (asserted-or-absent triples) are also $\leq_t$-classical projections, plus additional engineering constraints (closed-world for Datalog; open-world but value-flat for RDF). They are not external alternatives to PCT's encoding; they are recoverable as projections.

## Why this matters when working with records

Two consequences for anyone authoring or reading records:

**A predicate is not a truth-function.** When you see a frontmatter cell `bilattice-homomorphism: bilattice`, it is not the Fregean assertion "is-bilattice-homomorphism-to-bilattice is true of four-bilattice." It is a *witness of a categorical morphism* — the specific bilattice-homomorphism (here, the inclusion of the prime four-element bilattice into the generic bilattice) recorded as a cell. The transformer `bilattice-homomorphism` is itself a rich categorical operation; the cell selects a particular morphism within that class. The frontmatter encodes the morphism's existence-and-codomain; the body elaborates the math.

**Cell values aren't booleans.** The valuation assigning $v(p)(s, o)$ to each cell takes values in the fiber algebra, not in $\{\text{true}, \text{false}\}$. An existing cell valued at $\bot$ is *not equivalent to* an absent cell — both read as $\bot$ under the current valuation, but the first is a recorded cell whose evidence hasn't accumulated, while the second is a cell that hasn't been articulated yet. (The predication-cell specification's implicit register makes this explicit: every frontmatter line is a cell; the cell's valuation is a separate matter.)

The Fregean intuition that "frontmatter records facts" is approximately right but loses the bilattice-value structure. The more precise statement: frontmatter records the *existence and codomain of categorical morphisms*; the valuation that assigns bilattice values to cells is a separate apparatus (defined by the closure-rule system and the settling-evolution).

## Provenance and novelty boundary

The references below supply important ingredients and comparisons. They do not
state the lab's full forced chain from Fregean predication through independent
evidence and FOUR to the canonical Chu evaluation space. That composition is a
561 Group / Lenticule Science result, now carried formally by
`fregean_predication_forces_four_and_chu` and taught by the corresponding Verso
chapter. Claims about the stronger two-adjoint-system projection must be judged
against the lab's own Lean declarations rather than borrowed prestige.

- **Belnap, N. D.** (1977). "A useful four-valued logic." In Dunn & Epstein (eds.), *Modern Uses of Multiple-Valued Logic*, 5–37. Dordrecht: Reidel. The original $\mathbf{FOUR}$ — establishes the bilattice value structure and the epistemic interpretation $\mathbf{t}, \mathbf{f}, \bot, \top$.
- **Fitting, M.** (1991). "Bilattices and the semantics of logic programming." *Journal of Logic Programming* 11(2), 91–116. Introduces the conflation involution and bilattice-valued logic programming.
- **Avron, A.** (1996). "The structure of interlaced bilattices." *Mathematical Structures in Computer Science* 6(3), 287–299. The interlaced-bilattice representation theorem — every bounded interlaced bilattice arises as a twist product.
- **Lawvere, F. W.** (1969). "Adjointness in foundations." *Dialectica* 23, 281–296. Hyperdoctrines and the Lawvere-image construction of equality via diagonal-$\exists$.
- **Maruyama, Y.** (various). Single-adjoint bilattice hyperdoctrines; PCT contrasts with this by carrying *two* adjoint systems in parallel.
- **Kamide, N. and Zohar, Y.** (2008+). Bilattice first-order logic BD∆ with postulated classical equality.
- **Běhounek, L., Daňková, M., Dvořák, A.** (2020+). Bilattice-valued first-order logics with extended truth machinery.
- **Mac Lane, S.** (1971). *Categories for the Working Mathematician*. Graduate Texts in Mathematics 5. New York: Springer. Foundational category theory for hyperdoctrines.

That classical equality is derivable rather than postulated — and that the same
diagonal specialization produces the paraconsistent dual through the knowledge
order — is a claim of this predication-hyperdoctrine development. Its exact
settled scope is whatever the linked Lean declarations prove.

## See also

- [predication-cell](../../../concepts/predication-cell.md) — the cell as oriented triple; its value lives in the fiber algebra.
- [order-of-truth](../../../concepts/order-of-truth.md) — the $\leq_t$ axis; what classical logic uses, projected to its classical fragment.
- [order-of-knowledge](../../../concepts/order-of-knowledge.md) — the transverse axis; what classical logic drops.
- [predicated-frontmatter](../../../concepts/predicated-frontmatter.md) — the frontmatter encoding; treats Datalog/RDF/property-graph as projections of predication, with explicit notes that the cell's value lives in the bilattice rather than in $\{0, 1\}$.
- [algebraic-theory-from-predication](../../../../learning/claims/algebraic-theory-from-predication.md) — the claim that recovers classical universal algebra as the $\leq_t$-classical, functional-cell, clone-closed-closure fragment.
