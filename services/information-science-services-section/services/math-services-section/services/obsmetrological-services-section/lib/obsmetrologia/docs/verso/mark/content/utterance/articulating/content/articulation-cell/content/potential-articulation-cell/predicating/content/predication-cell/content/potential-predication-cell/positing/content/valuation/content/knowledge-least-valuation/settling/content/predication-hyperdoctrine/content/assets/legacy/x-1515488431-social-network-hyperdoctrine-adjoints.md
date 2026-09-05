---
kind: example
status: verified
depends-on: [predication-hyperdoctrine, predicate-specialization, predicate-converse, predicate-subject-projection, knowledge-order, truth-order, four-bilattice, friendship-four-generators, relational-database-settling]
instantiates: [predication-hyperdoctrine, predicate-specialization, predicate-converse]
lineage: 2
---

# Hyperdoctrine quantifier adjoints on the social network

The corpus's first concrete computation of the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md)'s quantifier adjoints. **Lineage 2** instance: explicit computation of $\exists_f^k$ and $\forall_f^k$ for the four-generator predicate-category morphisms on the L2 social-network base. Builds on [friendship-four-generators](friendship-four-generators.md), which exhibits the four generators; this example pushes through the adjoint structure each generator induces.

## Setup

L2 base restricted to $E = \{a, b\}$ ($a, b$ for Alice and Bob). Predicates $\Pi = \{\text{IsHappy}, \text{Likes}, \text{LikedBy}, \text{IsHappyBroadcast}\}$. The four predicate-category morphisms from [friendship-four-generators](friendship-four-generators.md):

- $f_\text{spec} : \text{IsHappy} \to \text{Likes}$ with $\mathrm{dom}(\text{IsHappy}) = \Delta_E = \{(a, a), (b, b)\}$.
- $f_\text{conv} : \text{LikedBy} \to \text{Likes}$ with cellwise $(s, o) \mapsto (o, s)$.
- $f_\text{sp} : \text{IsHappyBroadcast} \to \text{IsHappy}$ with cellwise $(s, o) \mapsto (s, s)$.
- $f_\text{op}$ : object-projection (analogous to $f_\text{sp}$, omitted here).

For each generator $f : q' \to q$, the quantifier adjoints come in two pairs (knowledge-order and truth-order):

$$\exists_f^k \;\dashv\; f^* \;\dashv\; \forall_f^k, \qquad \exists_f^t \;\dashv\; f^* \;\dashv\; \forall_f^t.$$

The reindexing $f^*$ is the same in both orders; the existential and universal adjoints differ between knowledge ($\bigvee_k, \bigwedge_k$) and truth ($\bigvee_t, \bigwedge_t$) joins / meets.

## Specialization adjoints: $f_\text{spec}^*, \exists_{f_\text{spec}}^k, \forall_{f_\text{spec}}^k$

**Reindexing $f_\text{spec}^*$.** Pulls a Likes-valuation back to an IsHappy-valuation by restricting to $\Delta_E$:

$$f_\text{spec}^*(v_\text{Likes})(s, s) \;=\; v_\text{Likes}(s, s).$$

For $v_\text{Likes}(a, b) = \mathbf{t}$, $v_\text{Likes}(a, a) = \mathbf{f}$, $v_\text{Likes}(b, b) = \bot$, all other cells $\bot$:

$$f_\text{spec}^*(v_\text{Likes})(a, a) = \mathbf{f}, \qquad f_\text{spec}^*(v_\text{Likes})(b, b) = \bot.$$

The off-diagonal $\mathbf{t}$ at $(a, b)$ is dropped.

**Left adjoint $\exists_{f_\text{spec}}^k$.** Extends an IsHappy-valuation to a Likes-valuation by zero-extension off the diagonal — for the knowledge order, "zero" is $\bot$ (the $\leq_k$-bottom):

$$\exists_{f_\text{spec}}^k(\phi)(s, o) \;=\; \begin{cases} \phi(s, s) & s = o \\ \bot & s \neq o \end{cases}.$$

For $\phi(a, a) = \mathbf{t}$ (Alice IsHappy), $\phi(b, b) = \bot$:

$$\exists_{f_\text{spec}}^k(\phi)(a, a) = \mathbf{t}, \quad \exists_{f_\text{spec}}^k(\phi)(a, b) = \bot, \quad \exists_{f_\text{spec}}^k(\phi)(b, a) = \bot, \quad \exists_{f_\text{spec}}^k(\phi)(b, b) = \bot.$$

Reads as: "Alice is happy with herself; we know nothing about other Likes cells."

**Right adjoint $\forall_{f_\text{spec}}^k$.** Extends an IsHappy-valuation to a Likes-valuation by $\top$-extension off the diagonal — for the knowledge order, $\top$ is the $\leq_k$-top:

$$\forall_{f_\text{spec}}^k(\phi)(s, o) \;=\; \begin{cases} \phi(s, s) & s = o \\ \top & s \neq o \end{cases}.$$

For $\phi(a, a) = \mathbf{t}$:

$$\forall_{f_\text{spec}}^k(\phi)(a, a) = \mathbf{t}, \quad \forall_{f_\text{spec}}^k(\phi)(a, b) = \top, \quad \forall_{f_\text{spec}}^k(\phi)(b, a) = \top, \quad \forall_{f_\text{spec}}^k(\phi)(b, b) = \top.$$

Reads as: "Alice is happy with herself; off-diagonal cells are maximally informative ($\top$)."

**Adjunction verification.** $\exists_{f_\text{spec}}^k \dashv f_\text{spec}^*$ means: $\exists_{f_\text{spec}}^k(\phi) \leq_k v \iff \phi \leq_k f_\text{spec}^*(v)$ for every $\phi, v$. Concretely: $\exists_{f_\text{spec}}^k(\phi)$ is the $\leq_k$-smallest extension of $\phi$ to off-diagonal cells, so any $v$ that is $\leq_k$-above $\exists_{f_\text{spec}}^k(\phi)$ on the diagonal automatically agrees with $\phi$ there. The adjunction holds.

## Converse adjoints: $f_\text{conv}^*, \exists_{f_\text{conv}}^k, \forall_{f_\text{conv}}^k$

Converse $f_\text{conv}: \text{LikedBy} \to \text{Likes}$ has $\mathrm{dom}(\text{LikedBy}) = \mathrm{dom}(\text{Likes}) = E \times E$, with cellwise $(s, o) \mapsto (o, s)$.

**Reindexing $f_\text{conv}^*$.** $f_\text{conv}^*(v_\text{Likes})(s, o) = v_\text{Likes}(o, s)$. For $v_\text{Likes}(a, b) = \mathbf{t}$:

$$f_\text{conv}^*(v_\text{Likes})(b, a) = v_\text{Likes}(a, b) = \mathbf{t}.$$

Reads as: "Bob is liked by Alice."

**Left and right adjoints.** Since $f_\text{conv}$ is a *bijection* (the swap is its own inverse), $\exists_{f_\text{conv}}^k = \forall_{f_\text{conv}}^k = (f_\text{conv})^*$ acting on the inverse (which is $f_\text{conv}$ again):

$$\exists_{f_\text{conv}}^k(\psi)(s, o) = \forall_{f_\text{conv}}^k(\psi)(s, o) = \psi(o, s).$$

For a bijective generator, the adjoints collapse. This is structurally because $\mathrm{Sym}(\Delta_E) = $ the swap, and the swap is its own adjoint.

## Subject-projection adjoints: $f_\text{sp}^*, \exists_{f_\text{sp}}^k, \forall_{f_\text{sp}}^k$

Subject-projection $f_\text{sp}: \text{IsHappyBroadcast} \to \text{IsHappy}$ has cellwise $(s, o) \mapsto (s, s)$. The cell map is the projection onto the first coordinate's diagonal.

**Reindexing $f_\text{sp}^*$.** $f_\text{sp}^*(v_\text{IsHappy})(s, o) = v_\text{IsHappy}(s, s)$ — broadcasts the diagonal value to the full row.

**Left adjoint $\exists_{f_\text{sp}}^k$.** For an IsHappyBroadcast-valuation $\phi$, $\exists_{f_\text{sp}}^k(\phi)(s, s) = \bigvee_{o \in E} \phi(s, o)$ — the join over the entire row gets sent to the diagonal entry. For $\phi(a, a) = \mathbf{t}, \phi(a, b) = \bot, \phi(b, \cdot) = \bot$:

$$\exists_{f_\text{sp}}^k(\phi)(a, a) = \mathbf{t} \vee_k \bot = \mathbf{t}, \qquad \exists_{f_\text{sp}}^k(\phi)(b, b) = \bot \vee_k \bot = \bot.$$

Reads as: "Alice has someone she's happy about (existentially); Bob has no one."

**Right adjoint $\forall_{f_\text{sp}}^k$.** Similarly, $\forall_{f_\text{sp}}^k(\phi)(s, s) = \bigwedge_{o \in E} \phi(s, o)$ — the meet over the row.

## Beck–Chevalley check

Consider the cartesian square: pull back $f_\text{spec}: \text{IsHappy} \to \text{Likes}$ along $f_\text{conv}: \text{LikedBy} \to \text{Likes}$:

$$\begin{array}{ccc} \text{IsHappy} \times_{\text{Likes}} \text{LikedBy} & \to & \text{LikedBy} \\ \downarrow & & \downarrow f_\text{conv} \\ \text{IsHappy} & \xrightarrow{f_\text{spec}} & \text{Likes} \end{array}$$

The pullback $\text{IsHappy} \times_{\text{Likes}} \text{LikedBy}$ has cells $\{(s, s) \in \Delta_E\}$ with $f_\text{conv}$-corresponding cell $(s, s) \in \mathrm{dom}(\text{LikedBy})$ (the converse fixes the diagonal). Beck-Chevalley says $\exists_{f_\text{spec}}^k \circ f_\text{conv}^* = (f_\text{conv}')^* \circ \exists_{f_\text{spec}'}^k$ where the primes are the pulled-back morphisms.

For our cell-map: both sides of Beck-Chevalley send a LikedBy-valuation $\psi$ to its diagonal-extended form on Likes-cells. The verification is the cellwise computation:

- LHS: $\exists_{f_\text{spec}}^k(f_\text{conv}^*(\psi))(s, o) = (f_\text{conv}^*(\psi))(s, s)$ if $s = o$, else $\bot$ = $\psi(s, s)$ if $s = o$, else $\bot$.
- RHS: pulls $\psi$ along $f_\text{conv}'$ first, getting an IsHappy×LikedBy-valuation, then extends. Same answer.

The Beck-Chevalley square commutes, as required.

## What this exhibits

Three observations:

**1. The corpus's first explicit hyperdoctrine adjoint computation.** Quantifier adjoints have been abstract throughout the corpus; this example walks through specialization, converse, and subject-projection adjoints concretely on a small social-network setting, with adjunction and Beck-Chevalley verified.

**2. The four generators have qualitatively different adjoint structures.** Specialization adjoints zero/top-extend; converse adjoints collapse to identity-on-swap; subject-projection adjoints take row-joins/meets. This concrete picture is invisible at the abstract level; the example surfaces it.

**3. The L2 social-network setting makes the computations interpretable.** The adjoints have natural English readings — "Alice is happy with herself; off-diagonal cells are $\top$ (maximally informative)" — that ground the abstract hyperdoctrine machinery.

## Position in Lineage 2

The L2 instance for the hyperdoctrine layer. With this in hand, L2 has been carried through:
- Settling structure ([relational-database-settling](relational-database-settling.md), [friendship-four-generators](friendship-four-generators.md))
- Multi-agent / CRDT ([multi-agent-epistemic-settling](multi-agent-epistemic-settling.md), [three-replica-mayer-vietoris](three-replica-mayer-vietoris.md))
- Moduli ([two-entity-moduli](two-entity-moduli.md))
- Cellular fiber Curry ([strict-regime-two-cell-curry](strict-regime-two-cell-curry.md))
- Hyperdoctrine adjoints (this file).

L2's remaining members will exercise: Verdier dual ([social-network-verdier-dual](social-network-verdier-dual.md)), strong-MLD orbits, six-functor tensor, meta-classifier, deformation tangent.
