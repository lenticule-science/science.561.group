---
type: theorem
status: draft
class: pseudo-functorial-gauge-connection
symbol: "A^{\\mathrm{Cl}}"
realizes: [internal-z2-gauge, klein-four-symmetry, lax-idempotent-coherence]
depends-on: [gauge-connection, closure-2-monad, closure-2-monad-lax-idempotence, closure-operator, predication-fibration, predication-hyperdoctrine, klein-four-gauge-bundle, four-bilattice, flat-connections-classified-by-h1, closure-flow-curvature-regime-correspondence, four-regime-dichotomy, dualized-closure-2-comonad, gauge-twisted-reindexing-graded-homomorphism, contrapositive-failure]
see-also: [curvature-from-pseudo-functorial-connections, order-and-cleavage-gauged-hyperdoctrine, twisted-equivariant-cohomology-decomposition, closure-flow-curvature-regime-correspondence]
---

# Pseudo-functorial gauge connections from the closure 2-monad

A [gauge connection](../objects/gauge-connection.md) $A : \mathcal{C} \to BK_4$ is by definition a *strict* functor; by [flat connections classified by $H^1$](flat-connections-classified-by-h1.md) the moduli of such connections is $H^1(N\mathcal{C}, \underline{K_4})$ — every connection is flat by construction. The open question on [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md) asked whether any natural construction in the corpus produces a *genuinely pseudo-functorial* connection — one with non-trivial 2-cocycle data $\alpha_{g,f}$ in $H^2(N\mathcal{C}, \underline{K_4})$ — and singled out direction (3): apply the [closure 2-monad](../morphisms/closure-2-monad.md) to a strict connection, expecting its lax-idempotence to obstruct strict functoriality.

This theorem carries out that construction. Given a strict $A$ and a $K_4^{\,k}$-equivariant closure family $\mathrm{cl}$, the **closure-twisted connection** $A^{\mathrm{Cl}}$ is a pseudo-functor whose 2-cocycle is the cup product of the parity homomorphism $\pi \circ A$ with itself, paired with the lax-idempotence 2-cell $\mu : \mathrm{cl}^2 \Rightarrow \mathrm{cl}$:

$$\boxed{[F_{A^{\mathrm{Cl}}}] \;=\; \bigl([\pi \circ A] \smile [\pi \circ A]\bigr) \cdot [\mu] \;\in\; H^2(N\mathcal{C}, \underline{K_4}_\mu),}$$

where $\underline{K_4}_\mu$ is the constant sheaf $K_4$ tensored with the closure-2-monad 2-cell coefficient. The class is non-trivial whenever **all three** factors are non-trivial: the closure flow is in a *curved* regime ($[\mu] \neq 0$, transfinite-bounded or aperiodic), the connection has non-trivial parity sub-class ($[\pi \circ A] \neq 0$ in $H^1$), **and** the cup-square $[\pi \circ A] \smile [\pi \circ A]$ is non-zero in $H^2(N\mathcal{C}, \mathbb{Z}/2)$. Vanishing of any one factor kills the gauge curvature.

This is the unification predicted by the question: pseudo-functorial gauge curvature is the cup-square of parity holonomy paired with closure-flow curvature.

## Setup

Fix a [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$, a strict gauge connection $A : \mathcal{C} \to BK_4$, and a $\mathcal{C}$-natural [closure operator](../morphisms/closure-operator.md) $\mathrm{cl} = (\mathrm{cl}_q)_{q \in \mathcal{C}}$ generating the [closure 2-monad](../morphisms/closure-2-monad.md) $\mathrm{Cl}$ on $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$.

By [closure-2-monad lax-idempotence](closure-2-monad-lax-idempotence.md) the multiplication $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$ is a 2-cell with adjoint right inverse $\eta_{\mathrm{Cl}}$; in the strict-idempotent case $\mu = \mathrm{id}$, in the genuinely lax case $\mu \neq \mathrm{id}$. By [closure-flow curvature–regime correspondence](closure-flow-curvature-regime-correspondence.md) the strict-idempotent case corresponds exactly to the flat closure-flow regimes (strict, Scott-continuous), and $\mu \neq \mathrm{id}$ corresponds to the curved regimes (transfinite-bounded, aperiodic), with the 2-cell content classified by $L_{\mathrm{ns}}(\kappa)$ — the non-Scott-continuous firing ordinals.

Let $\pi : K_4 \to \mathbb{Z}/2$ be the parity homomorphism with kernel $K_4^{\,k} = \{e, {\sim}\}$ and image-1 coset $\{-, {\sim}\circ-\}$ (the order-reversing elements). Composition with $A$ gives a homomorphism

$$\pi \circ A \,:\, \mathcal{C} \to BK_4 \to B(\mathbb{Z}/2),$$

i.e. a class $[\pi \circ A] \in H^1(N\mathcal{C}, \underline{\mathbb{Z}/2})$ — the **parity sub-connection** of $A$.

### Standing hypothesis: $K_4^{\,k}$-equivariance of closure

Throughout, we assume the closure family $\mathrm{cl}$ satisfies:

**(EQ).** *For every $g \in K_4^{\,k} = \{e, {\sim}\}$ and every $q \in \mathcal{C}$, $g \circ \mathrm{cl}_q = \mathrm{cl}_q \circ g$ as endofunctors of the fiber $\mathcal{E}_q$.*

Hypothesis (EQ) is independent of the four [closure-operator](../morphisms/closure-operator.md) axioms (monotone in $\leq_k$, inflationary, idempotent, $\mathcal{C}$-natural) — those constrain closure with respect to $\mathcal{C}$-reindexings, not the fiberwise $K_4$-action. (EQ) is a separate, additional axiom that closure operators arising from $K_4^{\,k}$-equivariant rule systems satisfy automatically: any closure generated by rules whose antecedents and consequents are bilattice formulas in the [knowledge order](teaching/explanations/knowledge-order.md) signature $\{\bot, \top, \wedge_k, \vee_k\}$ is $K_4^{\,k}$-equivariant, since ${\sim}$ is the unique non-trivial bilattice automorphism preserving $\leq_k$ (and hence preserving $\bot, \top, \wedge_k, \vee_k$ — see [contrapositive-failure](contrapositive-failure.md) for the dual statement on $-$, and [gauge-twisted-reindexing-graded-homomorphism](gauge-twisted-reindexing-graded-homomorphism.md) for the action's lattice-operation-preservation pattern).

For closures whose generating rules involve $\leq_t$-content (e.g. truth-order joins or residuated operations), (EQ) need not hold; outside this hypothesis the present construction does not directly apply. The standard corpus closures used in the [closure-flow curvature–regime correspondence](closure-flow-curvature-regime-correspondence.md) are $K_4^{\,k}$-equivariant and so satisfy (EQ).

### Standing hypothesis: bridging-2-cell involutivity

A second auxiliary hypothesis used only in Case $(1,1)$ of Lemma 1:

**(BR).** *For every parity-1 $g \in K_4 \setminus K_4^{\,k}$ and every $q \in \mathcal{C}$, the bridging 2-cell $\beta_g : \mathrm{cl}_q \circ g \Rightarrow g \circ \mathrm{cl}_q$ from the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) satisfies the involutive coherence: the horizontal composite*

$$\beta_g \,*\, (g \circ \beta_g \circ g^{-1}) \,:\, \mathrm{cl}_q \circ g \circ g \,\Rrightarrow\, g \circ g \circ \mathrm{cl}_q$$

*equals the identity 2-cell on $\mathrm{cl}_q$ (using $g^2 = e$ and (EQ) for the parity-0 sector).*

(BR) is the categorical statement that two consecutive bridging insertions across an involutive $g$ cancel. It is the corpus's residual coherence axiom for the closure–interior duality; if proved as a derived statement of the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md), Case $(1,1)$ of Lemma 1 becomes derived rather than axiomatic. As stated in this theorem we use (BR) as an explicit hypothesis. The corpus's [dualized-closure-colax-idempotence](../../../references/dualized-closure-colax-idempotence.md) supplies one direction of (BR) (the coherence between $\mathrm{cl}$'s lax-idempotence and $\mathrm{Op}$'s colax-idempotence); the involutive coherence stated in (BR) is the natural specialization to the $K_4$-action and is asserted as a clean, isolated axiom here pending a full derivation.

## Why parity-1 elements obstruct strict commutation with closure

The parity-0 elements ($e$ and ${\sim}$) preserve $\leq_k$; the parity-1 elements ($-$ and ${\sim}\circ-$) reverse $\leq_k$. As fiberwise endofunctors of $\mathcal{E}_q$:

- **Parity-0 elements commute strictly with $\mathrm{cl}$ by hypothesis (EQ)**: for $g \in K_4^{\,k}$, $g \circ \mathrm{cl}_q = \mathrm{cl}_q \circ g$. (No claim is made beyond what (EQ) asserts.)

- **Parity-1 elements do not commute with $\mathrm{cl}$**: for $g \in K_4 \setminus K_4^{\,k}$, $g$ reverses $\leq_k$ and so $g \circ \mathrm{cl}_q$ and $\mathrm{cl}_q \circ g$ have opposite monotonicity content. Concretely, $g \circ \mathrm{cl}_q \circ g^{-1}$ is a closure operator on the *dual* order $\leq_k^{\mathrm{op}}$ — equivalently an *interior* operator on $\leq_k$ — namely the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) $\mathrm{Op}_q := g \circ \mathrm{cl}_q \circ g^{-1}$. Since each parity-1 $g$ is an *involution* in $K_4$ ($g^2 = e$), the conjugation is symmetric: $\mathrm{Op}_q$ does not depend on the choice of parity-1 $g$ used to define it (both $-$ and ${\sim}\circ-$ give the same $\mathrm{Op}_q$ up to the parity-0 factor ${\sim}$, which commutes with $\mathrm{cl}_q$ by (EQ)).

The closure–interior pair $(\mathrm{cl}_q, \mathrm{Op}_q)$ is the data of the [dualized closure 2-comonad](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/dualized-closure-2-comonad.md) on fiber $\mathcal{E}_q$. The relevant **bridging 2-cell** is the canonical comparison

$$\beta_g \,:\, \mathrm{cl}_q \circ g \,\Rightarrow\, g \circ \mathrm{cl}_q \quad \text{for } g \in K_4 \setminus K_4^{\,k},$$

an isomorphism witnessed (on closure-saturated inputs $v = \mathrm{cl}_q(v)$) by the closure–interior duality: $\mathrm{cl}_q(g(v)) = g(\mathrm{Op}_q(v)) = g(v)$ when $v$ is itself $\mathrm{Op}_q$-saturated, and the discrepancy on non-jointly-saturated cells is mediated by the $\eta_{\mathrm{Cl}}$-counit. For $g \in K_4^{\,k}$ we set $\beta_g = \mathrm{id}$ (which holds by (EQ)).

The key combinatorial fact for what follows is that $\beta_g$ is an involution in the same sense $g$ is: since $g^2 = e$ for every $g \in K_4$, the composite $\beta_g \cdot (g \cdot \beta_g \cdot g^{-1})$ is canonically the identity 2-cell on parity-0 endofunctors and the lax-idempotence collapse $\mu_q$ on parity-1 endofunctors composed with $\mathrm{cl}^2$. This is the technical content used in Lemma 1, Case $a = b = 1$.

## Definition: the closure-twisted connection

For a strict gauge connection $A : \mathcal{C} \to BK_4$, the **closure-twisted connection** $A^{\mathrm{Cl}}$ is the assignment

$$A^{\mathrm{Cl}}(f) \,:=\, \mathrm{cl} \circ A(f) \circ \eta_{\mathcal{E}_q}^{\mathrm{cl}} \,:\, \mathcal{E}_p \to \mathcal{E}_q$$

for $f : q \to p$ in $\mathcal{C}$, where $\eta^{\mathrm{cl}}$ is the closure unit and the composite is taken in the 2-category $\mathbf{PrFib}$. On closure-saturated subobjects $\mathcal{E}^{\mathrm{cl}}_q := \{v \in \mathcal{E}_q \mid \mathrm{cl}_q(v) = v\}$ this restricts to

$$A^{\mathrm{Cl}}(f)(v) \,=\, \mathrm{cl}_q(A(f)(v)) \quad \text{for } v \in \mathcal{E}^{\mathrm{cl}}_p.$$

The outer closure $\mathrm{cl}_q$ is needed when $A(f)$ has parity 1, because then $A(f)$ may take a closed cell to a non-closed one (the action of $-$ on a $\leq_k$-saturated set produces a $\leq_k^{\mathrm{op}}$-saturated set, which is generally not $\leq_k$-saturated unless the cell is fixed by $-$).

For parity-0 $A(f)$, the outer $\mathrm{cl}_q$ is redundant by closure equivariance: $A^{\mathrm{Cl}}(f)|_{\mathcal{E}^{\mathrm{cl}}} = A(f)|_{\mathcal{E}^{\mathrm{cl}}}$.

## Definition: the parity-pair coherence cell

For composable $f : q \to p$, $g : p \to r$ with parities $a := \pi(A(f))$, $b := \pi(A(g)) \in \mathbb{Z}/2$, **define** the comparison 2-cell

$$\alpha^A_{g,f} \,:\, A^{\mathrm{Cl}}(g) \circ A^{\mathrm{Cl}}(f) \,\Rightarrow\, A^{\mathrm{Cl}}(g \circ f)$$

by

$$\alpha^A_{g,f} \,:=\, \mu_{q}^{\,a \cdot b} \;=\; \begin{cases} \mathrm{id} & \text{if } a \cdot b = 0, \\ \mu_q : \mathrm{cl}_q \circ \mathrm{cl}_q \Rightarrow \mathrm{cl}_q & \text{if } a = b = 1. \end{cases}$$

The point of Lemma 1 below is to verify that this *defined* 2-cell is the correct comparison: i.e. on closure-saturated inputs the difference between $A^{\mathrm{Cl}}(g) \circ A^{\mathrm{Cl}}(f)$ and $A^{\mathrm{Cl}}(g \circ f)$ is exactly $\mu_q^{ab}$ as a vertical pasting in $\mathbf{End}(\mathcal{E}^{\mathrm{cl}}_q)$.

## Lemma 1: the parity-pair coherence cell is the correct comparison

**Lemma 1.** *Under hypothesis (EQ), for each composable pair $f, g$ with parities $a, b$, there is a vertical pasting in $\mathbf{End}(\mathcal{E}^{\mathrm{cl}}_q)$,*

$$A^{\mathrm{Cl}}(g) \circ A^{\mathrm{Cl}}(f) \;\overset{\alpha^A_{g,f}}{\Longrightarrow}\; A^{\mathrm{Cl}}(g \circ f),$$

*equal to $\mu_q^{a \cdot b}$. The cell is the identity in cases $(a,b) \in \{(0,0), (1,0), (0,1)\}$ and is $\mu_q$ in case $(1,1)$.*

**Proof.** Compute on $v \in \mathcal{E}^{\mathrm{cl}}_r$. Using the strict cocycle $A(g \circ f) = A(f) \cdot A(g)$ (right-action convention):

$$\mathrm{LHS}(v) \;=\; \mathrm{cl}_q\bigl(A(f)(\,\mathrm{cl}_p(A(g)(v))\,)\bigr), \qquad \mathrm{RHS}(v) \;=\; \mathrm{cl}_q\bigl(A(f)(A(g)(v))\bigr).$$

The two differ in whether an inner $\mathrm{cl}_p$ is applied between $A(g)$ and $A(f)$.

*Case $(a, b) = (0, 0)$.* Both $A(f), A(g) \in K_4^{\,k}$; by (EQ) at $p$, $A(f) \circ \mathrm{cl}_p = \mathrm{cl}_p \circ A(f)$. Also by (EQ) at $r$ applied with the inverse $A(g)^{-1} = A(g)$ (parity-0 elements of $K_4$ are involutions), $A(g)$ preserves closure-saturation: $v \in \mathcal{E}^{\mathrm{cl}}_r \Rightarrow A(g)(v) \in \mathcal{E}^{\mathrm{cl}}_p$ (since $\mathrm{cl}_p A(g) v = A(g) \mathrm{cl}_r v = A(g) v$). So $\mathrm{cl}_p(A(g)(v)) = A(g)(v)$ on the nose, and $\mathrm{LHS}(v) = \mathrm{cl}_q(A(f)(A(g)(v))) = \mathrm{RHS}(v)$. The comparison cell is $\mathrm{id} = \mu_q^{0 \cdot 0}$. ✓

*Case $(a, b) = (1, 0)$.* $A(g) \in K_4^{\,k}$, so as in the previous case $A(g)$ preserves closure-saturation, $\mathrm{cl}_p(A(g)(v)) = A(g)(v)$, and $\mathrm{LHS}(v) = \mathrm{cl}_q(A(f)(A(g)(v))) = \mathrm{RHS}(v)$. Cell is $\mathrm{id} = \mu_q^{1 \cdot 0}$. ✓

*Case $(a, b) = (0, 1)$.* $A(g)$ is parity-1, so $A(g)(v)$ is generally not $\mathrm{cl}_p$-saturated; the inner $\mathrm{cl}_p$ is non-trivial. But $A(f) \in K_4^{\,k}$ and (EQ) at $p$ gives $A(f) \circ \mathrm{cl}_p = \mathrm{cl}_p \circ A(f)$, so

$$\mathrm{LHS}(v) = \mathrm{cl}_q\bigl(A(f)(\mathrm{cl}_p(A(g)(v)))\bigr) = \mathrm{cl}_q\bigl(\mathrm{cl}_p(A(f)(A(g)(v)))\bigr).$$

Using $\mathcal{C}$-naturality of closure (axiom (4) of [closure-operator](../morphisms/closure-operator.md)) — applied to the *base reindexing* $f^* : \mathcal{E}_p \to \mathcal{E}_q$ which is part of the predication-fibration data for $f$ — the inner $\mathrm{cl}_p$ inside an outer $\mathrm{cl}_q$ collapses to a single $\mathrm{cl}_q$ on closure-saturated outputs. Hence $\mathrm{LHS}(v) = \mathrm{cl}_q(A(f)(A(g)(v))) = \mathrm{RHS}(v)$. Cell is $\mathrm{id} = \mu_q^{0 \cdot 1}$. ✓

*Case $(a, b) = (1, 1)$ — the genuinely lax case (uses (BR)).* Both $A(f), A(g) \in K_4 \setminus K_4^{\,k}$ are parity-1 involutions ($A(f)^2 = A(g)^2 = e$). Type the 2-cells precisely. Working entirely in $\mathbf{End}(\mathcal{E}^{\mathrm{cl}}_q)$ via the cleavage transport $f^* : \mathcal{E}_p \to \mathcal{E}_q$ (which intertwines $\mathrm{cl}_p$ with $\mathrm{cl}_q$ by the closure-operator $\mathcal{C}$-naturality axiom — concretely, $f^* \circ \mathrm{cl}_p = \mathrm{cl}_q \circ f^*$), and writing $\bar A(f), \bar A(g) \in \mathrm{Aut}(\mathcal{E}_q)$ for the $K_4$-actions transported to fiber $q$ via the cleavage:

$$\mathrm{LHS}(v) = \mathrm{cl}_q\bigl(\bar A(f)(\mathrm{cl}_q(\bar A(g)(v)))\bigr), \qquad \mathrm{RHS}(v) = \mathrm{cl}_q\bigl(\bar A(f)(\bar A(g)(v))\bigr),$$

for $v \in \mathcal{E}^{\mathrm{cl}}_q$ (the fiber-$q$ form of the LHS/RHS, which is equal to the original under the cleavage's intertwining).

The 4-step pasting is now entirely fiber-$q$:

$$\begin{aligned}
\mathrm{LHS} &= \mathrm{cl}_q \circ \bar A(f) \circ \mathrm{cl}_q \circ \bar A(g) \\
&\overset{(\dagger)\;\;\beta_{\bar A(f)}^{-1} \text{ whiskered by } \mathrm{cl}_q \text{ on left, } \bar A(g) \text{ on right}}{\Longleftarrow} \mathrm{cl}_q \circ \mathrm{cl}_q \circ \bar A(f) \circ \bar A(g) \\
&\overset{(\ddagger)\;\;\mu_q \text{ whiskered by } \bar A(f) \circ \bar A(g) \text{ on right}}{\Longrightarrow} \mathrm{cl}_q \circ \bar A(f) \circ \bar A(g) \;=\; \mathrm{RHS}.
\end{aligned}$$

Step $(\dagger)$ uses the bridging 2-cell $\beta_{\bar A(f)} : \mathrm{cl}_q \circ \bar A(f) \Rightarrow \bar A(f) \circ \mathrm{cl}_q$ (its inverse, since we swap the order from the $\mathrm{cl}_q\circ \bar A(f)\circ \mathrm{cl}_q \circ \bar A(g)$ position to $\mathrm{cl}_q \circ \mathrm{cl}_q \circ \bar A(f) \circ \bar A(g)$); horizontally whiskered by the outer $\mathrm{cl}_q$ on the left and by $\bar A(g)$ on the right. Step $(\ddagger)$ applies $\mu_q : \mathrm{cl}_q \circ \mathrm{cl}_q \Rightarrow \mathrm{cl}_q$ horizontally whiskered by $\bar A(f) \circ \bar A(g)$ on the right.

The vertical composite is $\bigl(\mu_q * (\bar A(f) \bar A(g))\bigr) \,\circ_v\, \bigl(\mathrm{cl}_q * \beta_{\bar A(f)}^{-1} * \bar A(g)\bigr)$ as a 2-cell from $\mathrm{cl}_q \bar A(f) \mathrm{cl}_q \bar A(g)$ to $\mathrm{cl}_q \bar A(f) \bar A(g)$.

We must show this composite equals $\mu_q$ whiskered into the appropriate 1-cell context. By **(BR)** applied at $g = \bar A(f)$: the 2-cell $\beta_{\bar A(f)}^{-1}$, when paired with its $\bar A(f)$-conjugate via the involution $\bar A(f)^2 = e$, is canonically absorbed; what remains in the vertical composite is exactly $\mu_q$ (whiskered by $\bar A(f) \bar A(g)$ on the right). This is exactly $\mu_q^{1 \cdot 1}$ in our notation.

Hence $\alpha^A_{g,f} = \mu_q$ in case $(1,1)$. ✓

The four cases assemble into the uniform formula $\alpha^A_{g,f} = \mu_q^{a \cdot b}$, valid under (EQ) and — for the $(1,1)$ case only — (BR). $\square$

**Remark.** The combinatorial picture: each parity-1 morphism contributes a $\beta$-insertion. By (BR), pairs of $\beta$-insertions across an involutive $K_4$-element cancel. The residual content is exactly the lax-idempotence collapse $\mu_q$, which accumulates one factor per parity-1 pair. This is the same mechanism that makes two reflections in a Coxeter group compose to a rotation: the involutive content cancels, the lax-idempotence content accumulates as the group cohomology coefficient.

## Theorem: $A^{\mathrm{Cl}}$ is a pseudo-functor

**Theorem.** *The assignment $f \mapsto A^{\mathrm{Cl}}(f)$, together with the 2-cells $\alpha^A_{g,f}$ from Lemma 1, defines a pseudo-functor $A^{\mathrm{Cl}} : \mathcal{C} \to \mathcal{B}_{K_4, \mu}$, where $\mathcal{B}_{K_4, \mu}$ is the bicategory with one object, $K_4$-many 1-cells, and 2-cells generated by $\mu$ via the closure-conjugation embedding into $\mathbf{End}(\mathcal{E}^{\mathrm{cl}})$.*

**Proof.** A pseudo-functor requires (i) unit data $A^{\mathrm{Cl}}(\mathrm{id}_q) \cong \mathrm{id}_{A^{\mathrm{Cl}}(q)}$, (ii) coherence cells $\alpha^A_{g,f}$ satisfying the pentagon and triangle identities.

(i) **Unit.** $A(\mathrm{id}_q) = e$ has parity 0, so $A^{\mathrm{Cl}}(\mathrm{id}_q) = \mathrm{cl}_q \circ e = \mathrm{cl}_q$ on $\mathcal{E}^{\mathrm{cl}}_q$, which is the identity (closure of a closed cell is itself). The unit isomorphism is the identity 2-cell.

(ii) **Coherence cells.** Take Lemma 1's $\alpha^A_{g,f} = \mu^{ab}_q$.

(iii) **Pentagon identity.** For composable $f : q \to p$, $g : p \to r$, $h : r \to s$ with parities $a = \pi(A(f))$, $b = \pi(A(g))$, $c = \pi(A(h))$, the pentagon reads:

$$\alpha^A_{h, g \circ f} \cdot (\alpha^A_{g,f} \cdot \mathrm{id}_{A^{\mathrm{Cl}}(h)}) \;=\; \alpha^A_{h \circ g, f} \cdot (\mathrm{id}_{A^{\mathrm{Cl}}(f)} \cdot \alpha^A_{h,g}).$$

Using $\alpha = \mu^{(\cdot)}$:

LHS exponent: $c \cdot (a + b) + a \cdot b = ca + cb + ab \pmod 2$.

RHS exponent: $(b + c) \cdot a + b \cdot c = ab + ac + bc \pmod 2$.

These agree mod 2 (commutative ring identity). Hence both sides equal $\mu^{ab + bc + ac}_{q}$ (after identifying fibers via the 2-cell composition), and the pentagon holds. $\square$

(iv) **Triangle.** For $f : q \to p$ with $g = \mathrm{id}_p$ or $f = \mathrm{id}_q$, one parity is 0, so $a \cdot b = 0$ and $\alpha^A_{g,f} = \mathrm{id}$, matching the unit-coherence identity.

## Theorem: the pseudo-functor's 2-cocycle is the parity cup-square

The 2-cocycle classifying $A^{\mathrm{Cl}}$'s pseudo-functoriality is the cup product

$$F_{A^{\mathrm{Cl}}}(f, g) \,=\, \pi(A(f)) \cdot \pi(A(g)) \,\cdot\, \mu \,\in\, \underline{\mathrm{Aut}_{2}(\mathrm{Cl})},$$

where $\underline{\mathrm{Aut}_{2}(\mathrm{Cl})}$ is the constant sheaf of 2-cells of $\mathrm{Cl}$. As a cohomology class:

**Theorem (cup-product identification).** *The class $[F_{A^{\mathrm{Cl}}}] \in H^2(N\mathcal{C}, \underline{\mathrm{Aut}_{2}(\mathrm{Cl})})$ is the cup product of the parity sub-connection class $[\pi \circ A] \in H^1(N\mathcal{C}, \underline{\mathbb{Z}/2})$ with itself, with coefficient pairing $\mathbb{Z}/2 \otimes \mathbb{Z}/2 \to \underline{\mathrm{Aut}_{2}(\mathrm{Cl})}$ sending $1 \otimes 1 \mapsto [\mu]$:*

$$[F_{A^{\mathrm{Cl}}}] \;=\; [\pi \circ A] \smile [\pi \circ A] \,\cdot\, [\mu].$$

**Proof.** By Lemma 1, $F_{A^{\mathrm{Cl}}}(f, g) = \mu^{\pi(A(f)) \pi(A(g))}$, which is exactly the cup-product cochain formula on the nerve $N\mathcal{C}$. The cocycle condition (verified by the pentagon identity in the previous theorem) shows the cochain is closed; since cup product respects cocycles, $[F_{A^{\mathrm{Cl}}}] = [\pi \circ A] \smile [\pi \circ A]$ with coefficient $[\mu]$. $\square$

## Corollary: when does $A^{\mathrm{Cl}}$ have non-trivial gauge curvature?

By the cup-product identification, $[F_{A^{\mathrm{Cl}}}] = 0$ if and only if at least one of the following holds:

1. **Trivial parity sub-connection.** $[\pi \circ A] = 0 \in H^1(N\mathcal{C}, \underline{\mathbb{Z}/2})$ — i.e. $A$ takes values in $K_4^{\,k}$ up to gauge equivalence; equivalently, $A$ has trivial parity holonomy on every loop.

2. **Trivial closure-flow curvature.** $[\mu] = 0$ in $\underline{\mathrm{Aut}_{2}(\mathrm{Cl})}$ — i.e. $\mathrm{cl}$ is strictly idempotent. By [closure-flow curvature–regime correspondence](closure-flow-curvature-regime-correspondence.md), this is equivalent to $L_{\mathrm{ns}}(\kappa) = \emptyset$, i.e. the closure flow is in the strict or Scott-continuous regime.

3. **Cup-product vanishing.** Even with both factors non-trivial, $[\pi \circ A] \smile [\pi \circ A]$ may vanish in $H^2(N\mathcal{C})$ for cohomological reasons (e.g. when $H^2(N\mathcal{C}, \underline{\mathbb{Z}/2}) = 0$, as for tree-shaped or simply-connected $\mathcal{C}$).

Conversely, $[F_{A^{\mathrm{Cl}}}] \neq 0$ whenever all three are non-trivial: $A$ has a non-trivial parity sub-connection, the closure flow is curved, and the cup-square does not vanish in $H^2$. The first natural such example arises with $\mathcal{C}$ containing a 2-simplex of two composable parity-1 morphisms whose loop-class is non-trivial in $H_1(N\mathcal{C}, \mathbb{Z}/2)$, and a settling in the transfinite-bounded or aperiodic regime.

## Connection to closure-flow curvature

The closure-flow curvature module is $H^1(\mathbf{T}^*, \mathcal{F}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z}$ with one $\mathbb{Z}$-generator per non-Scott-continuous firing ordinal — see [closure-flow curvature–regime correspondence](closure-flow-curvature-regime-correspondence.md). The 2-cell $[\mu]$ used as cup-product coefficient in this theorem is the corresponding $\mathrm{Cl}$-multiplication 2-cell whose non-vanishing is equivalent to $L_{\mathrm{ns}} \neq \emptyset$.

The unification is now explicit: a non-trivial closure-flow curvature event at firing ordinal $\mu_0 \in L_{\mathrm{ns}}$ contributes to the gauge 2-cocycle of every closure-twisted connection $A^{\mathrm{Cl}}$ whose parity sub-connection is non-trivial. The map

$$\bigoplus_{\mu_0 \in L_{\mathrm{ns}}} \mathbb{Z} \;\longrightarrow\; H^2(N\mathcal{C}, \underline{K_4})$$

given by $\mu_0 \mapsto [\pi \circ A] \smile [\pi \circ A] \cdot \mu_0$ projects closure-flow curvature events onto gauge curvature classes, with the map's kernel measuring the gauge-cohomologically invisible NSC firings (those that lift to coboundaries in gauge cohomology).

This answers the question's secondary asks affirmatively:

- *Do closure-flow curvature events project onto the gauge curvature class?* Yes, via the cup-product map above.
- *Are there settlings that realize a given $H^2$ class?* Yes when the cup-square is non-trivial: choose $A$ with the desired parity holonomy class in $H^1(\mathcal{C}, \mathbb{Z}/2)$ and a settling in a curved regime; the closure-twisted connection realizes the cup-square in $H^2$.

## Recovery of the strict, $K_4^{\,k}$-axis, and Scott-continuous limits

Three degenerate-limit checks:

- **Strict closure ($\mu = \mathrm{id}$, e.g. Scott-continuous regime).** Then $\alpha^A_{g,f} = \mathrm{id}$ for all $f, g$, and $A^{\mathrm{Cl}}$ is strictly functorial. Recovers the strict-$A$ classification by $H^1$.

- **$K_4^{\,k}$-axis connection ($\pi \circ A = 0$).** Then $a \cdot b = 0$ identically and $\alpha^A_{g,f} = \mathrm{id}$, so $A^{\mathrm{Cl}}$ is strictly functorial regardless of closure regime. Recovers the [twisted Beck–Chevalley](twisted-beck-chevalley.md) setting where the $\leq_k$-axis connection sees no gauge curvature.

- **Trivial connection ($A = A_0 = e$).** Then $\pi \circ A = 0$ and $A^{\mathrm{Cl}} = \mathrm{cl} \circ e = \mathrm{cl}$. The closure-twisted trivial connection is just the closure operator, with no gauge content. Consistent.

## Position in predication categories

This theorem provides the affirmative answer to direction (3) of [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md) and is the **unified curvature theorem** the question called for. The two curvature notions present in the corpus — closure-flow curvature in $H^1$ on the bitopological settling site, and gauge curvature in $H^2$ on the predicate category nerve — combine via the cup-product formula

$$\underbrace{[\pi \circ A] \smile [\pi \circ A]}_{\text{parity-sub-cup-square in } H^2(N\mathcal{C}, \mathbb{Z}/2)} \;\otimes\; \underbrace{[\mu]}_{\text{closure-flow curvature in } H^1(\mathbf{T}^*, \mathcal{F})} \;\longmapsto\; \underbrace{[F_{A^{\mathrm{Cl}}}]}_{\text{pseudo-functorial gauge curvature in } H^2(N\mathcal{C}, \underline{K_4})}.$$

The construction is parsimonious: no extra data beyond a strict $A$ and a closure family, both already part of the corpus's standard kinematic/dynamic data. The pseudo-functoriality emerges from the inability of parity-1 $K_4$-elements to commute strictly with closure, with the lax-idempotence 2-cell $\mu$ supplying the precise coherence content.

Three structural consequences:

1. **The gauge curvature lives on the parity-1 sector.** The cup-product is built from $\pi \circ A$, not from $A$ directly. A connection with no parity-1 holonomy carries no closure-induced gauge curvature, regardless of how curved the closure flow is. This matches the per-leg analysis in [order-and-cleavage-gauged-hyperdoctrine](../objects/order-and-cleavage-gauged-hyperdoctrine.md): the obstruction to in-support gauged BC is also located on parity-1 (projection-leg) data, suggesting the two parity-1 obstructions share a common $H^2$-source — to be made precise in a follow-up.

2. **The closure-flow regime gates the gauge curvature.** In the flat regimes (strict, Scott-continuous), $\mu = \mathrm{id}$ and *no* connection produces non-trivial $A^{\mathrm{Cl}}$-curvature. In the curved regimes, $\mu \neq \mathrm{id}$ and gauge curvature arises whenever parity-1 holonomy is non-trivial. The corpus's existing four-regime classification thereby acquires a gauge-cohomological meaning: the curved regimes are exactly those that support pseudo-functorial gauge content.

3. **The construction is canonical.** $A^{\mathrm{Cl}}$ depends only on $A$ and $\mathrm{cl}$, with no auxiliary choices. The pseudo-functor structure is determined uniquely by Lemma 1's parity-pair formula, which in turn is forced by the closure–parity-0 commutation and the closure–parity-1 bridging 2-cell. There is no gauge-equivalent strictification (when the cup-square is non-trivial) — the pseudo-functoriality is genuine.

## Open questions raised

1. **Outside-support extension to the cohomology decomposition.** The [twisted equivariant cohomology decomposition](twisted-equivariant-cohomology-decomposition.md) was established for $K_4^{\,k}$-axis connections; this theorem provides the pseudo-functorial extension to full $K_4$ at the cost of a non-trivial $H^2$ contribution. Working out the explicit pseudo-equivariant cohomology decomposition over a curved closure regime is the natural next theorem.

2. **Common $H^2$-source with the order-and-cleavage gauged hyperdoctrine.** The parity-1 projection-leg obstruction in [order-and-cleavage-gauged-hyperdoctrine](../objects/order-and-cleavage-gauged-hyperdoctrine.md) and the parity-cup-square here both live in $H^2(N\mathcal{C}, \cdot)$; identifying them explicitly (as the same class with different coefficient sheaves, or as related via a coefficient short exact sequence) would consolidate the two parity-1 phenomena.

3. **Higher pseudo-functoriality.** The construction uses only the lax-idempotence 2-cell $\mu$. A 3-functorial relaxation (tri-functor with 3-cell coherence) would arise from higher coherence cells of the closure 2-monad in a tri-categorical setting, with curvature class in $H^3$. Whether the corpus's machinery supports this higher refinement is open.
