---
type: theorem
status: proved
depends-on: [equivariant-cohomology-decomposition, gauge-connection, gauge-twisted-reindexing, gauge-twisted-reindexing-graded-homomorphism, twisted-beck-chevalley, flat-connections-classified-by-h1, klein-four-gauge-bundle, klein-four-symmetry, internal-z2-gauge, settling-cohomology, settling-associated-sheaf]
see-also: [curvature-from-pseudo-functorial-connections, converse-loop-gauge-moduli]
---

# Twisted equivariant cohomology decomposition ($\leq_k$-axis)

The [equivariant cohomology decomposition](equivariant-cohomology-decomposition.md) refined by a gauge connection. For any $K_4^{\,k}$-valued gauge connection $A : \mathcal{C} \to BK_4^{\,k}$ on the [predicate category](../objects/predicate-category.md), the four isotypic sectors $H^\bullet_\chi$ get tensored by the rank-1 local system $\mathcal{L}_{\chi,A}$ with monodromy $\chi \circ \mathrm{hol}_A$. Non-trivial twists annihilate sectors whose composite character is non-trivial, producing a connection-dependent thinning of $H^1$.

## Statement

**Theorem (twisted equivariant cohomology decomposition, $\leq_k$-axis).** *Let $v$ be a predication settling with [Klein-four gauge bundle](../objects/klein-four-gauge-bundle.md) $\mathcal{G}_v$ on a [predicate category](../objects/predicate-category.md) $\mathcal{C}$. Let $A : \mathcal{C} \to BK_4^{\,k}$ be a [gauge connection](../objects/gauge-connection.md) valued in $K_4^{\,k} = \{e, \sim\} \subseteq K_4$. Work with rational coefficients (or $\mathbb{Z}[1/|K_4|]$).*

1. *(Twisted decomposition.)* *The $K_4$-equivariant cohomology of $\mathcal{G}_v$ twisted by $A$ decomposes as*
$$H^n(\mathcal{C}, \mathcal{G}_v \otimes^A_{K_4}) \;\cong\; \bigoplus_{\chi \in \widehat{K_4}} H^n(\mathcal{C}, \mathcal{G}_v^{\,\chi} \otimes \mathcal{L}_{\chi, A})$$
*where $\mathcal{G}_v^{\,\chi}$ is the $\chi$-isotypic sub-sheaf (from [equivariant cohomology decomposition](equivariant-cohomology-decomposition.md)) and $\mathcal{L}_{\chi, A}$ is the rank-1 local system on $\mathcal{C}$ with monodromy*
$$\chi \circ \mathrm{hol}_A \,:\, \pi_1(\mathcal{C}) \longrightarrow K_4 \xrightarrow{\;\chi\;} \{\pm 1\}.$$

2. *(Vanishing of twisted sectors — clean hypotheses.)* *Suppose additionally:*
   - *(H1)* *$|N\mathcal{C}|$ is a $K(\pi_1(\mathcal{C}), 1)$ space (the universal cover $|N\widetilde{\mathcal{C}}|$ is contractible);*
   - *(H2)* *$\pi_1(\mathcal{C})$ is finite;*
   - *(H3, trivial sheaf-monodromy regime)* *for each $\chi$, the residual deck-action of $\pi_1(\mathcal{C})$ on the upstairs stalk $W^\chi := (\mathcal{G}_v^{\,\chi})_{\tilde q}$ coming from sheaf-monodromy is trivial — i.e. the monodromy representation $\rho^{\,\mathcal{G}_v^{\,\chi}} : \pi_1(\mathcal{C}) \to \mathrm{GL}(W^\chi)$ associated to $\mathcal{G}_v^{\,\chi}$ as a local system on $\mathcal{C}$ is the identity. Equivalently: $\mathcal{G}_v^{\,\chi}$ is the constant sheaf $\underline{W^\chi}$ on $\mathcal{C}$, not merely a sheaf whose universal-cover pullback is constant.*

   *Then for each $\chi$ with $\chi \circ \mathrm{hol}_A$ non-trivial:*
$$H^n(\mathcal{C}, \mathcal{G}_v^{\,\chi} \otimes \mathcal{L}_{\chi, A}) \;=\; 0 \qquad \text{for all } n \geq 0.$$
   *For $\chi \circ \mathrm{hol}_A$ trivial: $\mathcal{L}_{\chi, A} \cong \underline{\mathbb{Q}_\chi}$ constant, so $H^n(\mathcal{C}, \mathcal{G}_v^{\,\chi} \otimes \mathcal{L}_{\chi, A}) = H^n(\mathcal{C}, \mathcal{G}_v^{\,\chi})$ matches the untwisted theorem.*

   *(Without (H3) — the case of non-constant sheaf-monodromy on $\widetilde{\mathcal{C}}$ — the conclusion weakens to a Cartan–Leray spectral sequence whose $E_2^{p,q}$ vanishes for $p \geq 1$ by Maschke (over $\mathbb{Q}$), leaving the surviving piece as $E_\infty^{0,n} = \mathrm{Hom}_{\pi_1}(\mathcal{L}_{\chi,A}^{-1}, H^n(|N\widetilde{\mathcal{C}}|, \mathcal{G}_v^{\,\chi}|_{\widetilde{\mathcal{C}}}))$ — the $(\chi \circ \mathrm{hol}_A)$-isotypic component of the upstairs cohomology under the residual $\pi_1$-action coming from sheaf-monodromy. This can be non-zero and is the genuine generalization to non-constant settings.)*

3. *(Sector survival table for $K_4^{\,k}$-valued $A$.) The four characters compose with $\mathrm{hol}_A : \pi_1(\mathcal{C}) \to K_4^{\,k} = \{e, \sim\}$ as follows:*

   | $\chi$ | $\chi(e)$ | $\chi(\sim)$ | $\chi \circ \mathrm{hol}_A$ trivial? |
   |---|---|---|---|
   | $\chi_\mathrm{id}$ | $+1$ | $+1$ | always |
   | $\chi_\sim$ | $+1$ | $-1$ | iff $\mathrm{hol}_A \equiv e$ |
   | $\chi_-$ | $+1$ | $+1$ | always |
   | $\chi_{\sim\circ-}$ | $+1$ | $-1$ | iff $\mathrm{hol}_A \equiv e$ |

   *In particular, the trivial connection $A = e$ preserves all four sectors (recovering [equivariant cohomology decomposition](equivariant-cohomology-decomposition.md)), while any $A$ with non-trivial $\sim$-holonomy annihilates the two sectors $\chi_\sim$ and $\chi_{\sim\circ-}$ when $\pi_1(\mathcal{C})$ is finite.*

4. *(Twisted Gauss–Bonnet under (H1)–(H3).) Under the hypotheses of Part 2, the twisted Euler characteristic*
$$\chi^A_\mathrm{Euler}(v) \;:=\; \sum_\chi \bigl(\mathrm{rank}\,H^0_\chi(\mathcal{L}_{\chi,A}) - \mathrm{rank}\,H^1_\chi(\mathcal{L}_{\chi,A})\bigr)$$
*satisfies $\chi^A_\mathrm{Euler}(v) = \sum_{\chi : \chi \circ \mathrm{hol}_A = 1} \chi^{A=e,\,\chi}_\mathrm{Euler}(v)$ — only the surviving sectors contribute, and each contributes its full untwisted Euler characteristic. The killed sectors $\{\chi : \chi \circ \mathrm{hol}_A \neq 1\}$ contribute zero (both $H^0$ and $H^1$ vanish). For the $K_4^{\,k}$-axis with $\mathrm{hol}_A = \sim$, only $\chi_\sim$ and $\chi_{\sim\circ-}$ are killed; $\chi_\mathrm{id}$ and $\chi_-$ contribute their untwisted Euler characteristics.*

## Proof

### Part 1: twisted decomposition

The gauge connection $A : \mathcal{C} \to BK_4^{\,k}$ specifies, for each morphism $f : q \to p$ in $\mathcal{C}$, an element $A(f) \in K_4^{\,k}$. The *$A$-twisted Klein-four gauge bundle* $\mathcal{G}_v \otimes^A_{K_4}$ has the same fiberwise data and the same fiberwise $K_4$-equivariant structure $\rho^{\,K_4}$ as $\mathcal{G}_v$, but the sheaf restriction maps along $f$ are modified:

$$\mathrm{res}^A_f \;:=\; \rho^{K_4}_{A(f)} \circ \mathrm{res}_f \,:\, (\mathcal{G}_v)_p \to (\mathcal{G}_v)_q,$$

where $\mathrm{res}_f$ is the original (untwisted) restriction and $\rho^{K_4}_{A(f)}$ is the fiberwise action of $A(f) \in K_4$ on $(\mathcal{G}_v)_q$. The connection cocycle (C2), $A(g \circ f) = A(g) A(f)$, together with associativity of $\rho^{K_4}$, gives functoriality of $\mathrm{res}^A$. The fiberwise $K_4$-equivariance is preserved because $K_4$ is abelian: $\rho^{K_4}_h \circ \mathrm{res}^A_f = \rho^{K_4}_h \circ \rho^{K_4}_{A(f)} \circ \mathrm{res}_f = \rho^{K_4}_{A(f)} \circ \rho^{K_4}_h \circ \mathrm{res}_f = \mathrm{res}^A_f \circ \rho^{K_4}_h$ (using $K_4$-equivariance of the original $\mathrm{res}_f$ in the last step).

For each $\chi \in \widehat{K_4}$, the idempotent $e_\chi = \frac{1}{|K_4|} \sum_g \chi(g^{-1}) g$ projects onto the $\chi$-isotypic fiberwise sub-sheaf. By the abelianity argument above, $e_\chi$ commutes with $\mathrm{res}^A_f$, so the projection extends to a sub-sheaf of $\mathcal{G}_v \otimes^A_{K_4}$:

$$(\mathcal{G}_v \otimes^A_{K_4})^\chi \;=\; \mathcal{G}_v^{\,\chi} \otimes \mathcal{L}_{\chi, A},$$

where $\mathcal{L}_{\chi, A}$ is the rank-1 $\mathbb{Q}$-local system on $\mathcal{C}$ whose stalk at $q$ is $\mathbb{Q}$ and whose transition along $f : q \to p$ is multiplication by $\chi(A(f))$. Cocycle/functoriality of $\mathcal{L}_{\chi, A}$ comes from $\chi(A(g \circ f)) = \chi(A(g)) \chi(A(f))$. The corresponding monodromy representation of $\pi_1(\mathcal{C})$ is the composite

$$[\gamma] \,\mapsto\, \chi(\mathrm{hol}_A(\gamma)) \,:\, \pi_1(\mathcal{C}) \to \{\pm 1\}.$$

The factorization $(\mathcal{G}_v \otimes^A_{K_4})^\chi = \mathcal{G}_v^{\,\chi} \otimes \mathcal{L}_{\chi, A}$ is the tensor decomposition of the twisted fiberwise isotypic component into (untwisted isotypic sheaf) $\otimes$ (sign local system carrying the $A$-twist). Applying $R\Gamma$ and summing over $\chi$ gives the claimed decomposition. $\square$ (Part 1)

### Part 2: vanishing of twisted sectors under (H1)–(H3)

Sheaf cohomology on the small category $\mathcal{C}$ with locally constant coefficients agrees with cohomology of the geometric realization $|N\mathcal{C}|$ with the corresponding local system (standard nerve/realization equivalence; Quillen). By (H3), the sub-sheaf $\mathcal{G}_v^{\,\chi}$ is a local system on $\mathcal{C}$ with constant stalk $W^\chi$ and trivial sheaf-monodromy on $\widetilde{\mathcal{C}}$. The tensor product $\mathcal{G}_v^{\,\chi} \otimes \mathcal{L}_{\chi, A}$ is then a local system on $\mathcal{C}$ with stalk $W^\chi$ and total monodromy

$$\rho^{tot} \,=\, \rho^{\,\mathcal{G}_v^{\,\chi}} \otimes \rho^{\,\mathcal{L}_{\chi,A}} \,:\, \pi_1(\mathcal{C}) \to \mathrm{GL}(W^\chi).$$

By (H3) the sheaf-side factor $\rho^{\,\mathcal{G}_v^{\,\chi}}$ is trivial as a representation of $\pi_1$ on $W^\chi$, so $\rho^{tot}(\gamma) = \chi(\mathrm{hol}_A(\gamma)) \cdot \mathrm{id}_{W^\chi}$ — i.e. $\pi_1$ acts on $W^\chi$ as the scalar sign character $\chi \circ \mathrm{hol}_A$. (Note (H3) is stronger than "$\mathcal{G}_v^{\,\chi}|_{\widetilde{\mathcal{C}}}$ is constant" — the latter follows automatically from any local system on $\mathcal{C}$, while (H3) requires the genuine $\pi_1$-action $\rho^{\,\mathcal{G}_v^{\,\chi}}$ to be trivial.)

Under (H1), the Cartan–Leray spectral sequence

$$E_2^{p,q} \;=\; H^p\!\bigl(\pi_1(\mathcal{C}),\, H^q(|N\widetilde{\mathcal{C}}|,\, W^\chi)\bigr) \;\Longrightarrow\; H^{p+q}(\mathcal{C}, \mathcal{G}_v^{\,\chi} \otimes \mathcal{L}_{\chi, A})$$

simplifies because $|N\widetilde{\mathcal{C}}|$ is contractible: $H^q(|N\widetilde{\mathcal{C}}|, \underline{W^\chi}) = 0$ for $q \geq 1$ and $= W^\chi$ for $q = 0$. (Pulled-back constant local system on a contractible space has only $H^0$.) So

$$E_2^{p, 0} \;=\; H^p(\pi_1(\mathcal{C}),\, W^\chi)_{\rho^{tot}}, \qquad E_2^{p, q \geq 1} = 0.$$

By (H2) and Maschke (over $\mathbb{Q}$), $H^p(\pi_1(\mathcal{C}), -) = 0$ for $p \geq 1$. So $E_\infty$ is concentrated at $E_\infty^{0,0} = (W^\chi)^{\pi_1, \rho^{tot}}$ — the $\rho^{tot}$-invariants.

Since $\pi_1$ acts on $W^\chi$ by the scalar sign character $\chi \circ \mathrm{hol}_A$, the invariants are

$$(W^\chi)^{\pi_1, \rho^{tot}} \;=\; \begin{cases} W^\chi & \text{if } \chi \circ \mathrm{hol}_A = 1, \\ 0 & \text{if } \chi \circ \mathrm{hol}_A \neq 1. \end{cases}$$

For $\chi \circ \mathrm{hol}_A$ non-trivial: $H^0 = 0$ and $H^n = 0$ for all $n \geq 1$. For $\chi \circ \mathrm{hol}_A$ trivial: $\mathcal{L}_{\chi,A}$ is constant, recovering the untwisted theorem. $\square$ (Part 2)

### Part 3: sector survival table for $K_4^{\,k}$-valued $A$

Direct evaluation: $K_4^{\,k} = \{e, \sim\}$, and the four characters of $K_4$ restrict to $K_4^{\,k}$ as:

- $\chi_\mathrm{id}|_{K_4^{\,k}}$: $e \mapsto +1$, $\sim \mapsto +1$ — trivial on $K_4^{\,k}$.
- $\chi_\sim|_{K_4^{\,k}}$: $e \mapsto +1$, $\sim \mapsto -1$ — non-trivial on $K_4^{\,k}$ iff $\mathrm{hol}_A$ hits $\sim$.
- $\chi_-|_{K_4^{\,k}}$: $e \mapsto +1$, $\sim \mapsto +1$ — trivial on $K_4^{\,k}$ (since $\chi_-(\sim) = +1$ from the [Klein-four gauge bundle](../objects/klein-four-gauge-bundle.md) character table).
- $\chi_{\sim\circ-}|_{K_4^{\,k}}$: $e \mapsto +1$, $\sim \mapsto -1$ — non-trivial on $K_4^{\,k}$ iff $\mathrm{hol}_A$ hits $\sim$.

Combining with Part 2 gives the table. $\square$ (Part 3)

### Part 4: twisted Gauss–Bonnet

By Part 1, the Euler characteristic of $\mathcal{G}_v \otimes^A_{K_4}$ decomposes additively across the isotypic sectors. By Part 2, each sector with $\chi \circ \mathrm{hol}_A \neq 1$ has $H^n = 0$ for all $n \geq 0$, contributing zero. Each sector with $\chi \circ \mathrm{hol}_A = 1$ has $\mathcal{L}_{\chi,A} \cong \underline{\mathbb{Q}_\chi}$ constant, contributing the full untwisted $\chi^{A=e,\,\chi}_\mathrm{Euler}(v)$. Summing gives the stated formula. $\square$ (Part 4) $\blacksquare$

## Why $\leq_k$-axis only

The decomposition relies on the twisted restriction maps $\mathrm{res}^A_f$ being well-defined sheaf morphisms on the *predication-fiber-algebra-valued* sheaf $\mathcal{G}_v$ — in particular, on commuting with the bottom-extension convention used by [predicate specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md), which extends sections by $\bot$ on cells outside the source's support.

For $K_4^{\,k} = \{e, \sim\}$, the [internal $\mathbb{Z}/2$ gauge](teaching/explanations/internal-z2-gauge.md) acts as a bottom-fixing automorphism: $\sim(\bot) = \bot$ (and $\sim(\top) = \top$). Hence $\rho^{K_4}_{A(f)} \circ \mathrm{ext}_\bot = \mathrm{ext}_\bot \circ \rho^{K_4}_{A(f)}$, and the twisted restriction is a well-defined sheaf morphism. This is exactly the bottom-fixing/orthogonality condition used in [twisted Beck–Chevalley](twisted-beck-chevalley.md) and the functoriality clause of [gauge-twisted reindexing](../morphisms/gauge-twisted-reindexing.md).

For $K_4^{\,t} = \{e, -\}$, conflation has $-(\bot) = \top$, so $\rho^{K_4}_{-} \circ \mathrm{ext}_\bot \neq \mathrm{ext}_\bot \circ \rho^{K_4}_{-}$ on outside-support cells: the twist takes a $\bot$-extended cell to a $\top$-extended cell, breaking the sheaf structure on the specialization morphism class. The full-$K_4$ case has both this $\bot/\top$-migration obstruction and an additional order-reversal one (since $-$ reverses $\leq_k$, isotypic projection no longer respects $\leq_k$-monotonicity).

The $K_4^{\,t}$ and full-$K_4$ extensions of the twisted equivariant decomposition are open territory, joined to the obstructions catalogued in [curvature-from-pseudo-functorial-connections](questions/curvature-from-pseudo-functorial-connections.md) — same root cause (asymmetric extension-by-$\bot$ + non-bottom-fixing action), same scope of resolution required.

## Specialization to the converse-loop category

For $\mathcal{C} = B(\mathbb{Z}/2)$ from [converse-loop gauge moduli](../examples/converse-loop-gauge-moduli.md), hypotheses (H1) and (H2) of Part 2 are immediate: $|N\mathcal{C}| \simeq \mathbb{RP}^\infty$ is a $K(\mathbb{Z}/2, 1)$ (universal cover $S^\infty$ contractible), and $\pi_1(\mathcal{C}) = \mathbb{Z}/2$ is finite. Hypothesis (H3) is the substantive assumption: it says that the converse functor $\sigma$ (the single non-identity morphism in $B(\mathbb{Z}/2)$ and the generator of $\pi_1$) acts trivially on $W^\chi$ — i.e. the $\chi$-isotypic stalk of the settling-associated sheaf is fixed by $\sigma$. Equivalently, the settling $v$ is converse-symmetric on its $\chi$-isotypic component. This is automatic for symmetric binary predicates of the kind built in [converse-loop gauge moduli](../examples/converse-loop-gauge-moduli.md), where $\sigma$ acts as a permutation of cells that preserves the bilattice-fiber structure within each $\chi$-orbit.

Under (H1)–(H3), the four moduli classes $[A_0], [A_\sim], [A_-], [A_{\sim\circ-}]$ from [converse-loop gauge moduli](../examples/converse-loop-gauge-moduli.md) give the following total cohomology decomposition (over $\mathbb{Q}$, summed over $n \geq 0$):

| connection $A$ | $\chi_\mathrm{id}$ | $\chi_\sim$ | $\chi_-$ | $\chi_{\sim\circ-}$ | covered by this theorem? |
|---|---|---|---|---|---|
| $A_0$ (trivial) | full untwisted rank | full untwisted rank | full untwisted rank | full untwisted rank | yes (degenerate case, $\mathcal{L}_{\chi,A} = \underline{\mathbb{Q}_\chi}$) |
| $A_\sim$ | full untwisted rank | **0** | full untwisted rank | **0** | yes (Part 2 + Part 3) |
| $A_-$ | — | — | — | — | open ($K_4^{\,t}$-axis, beyond scope) |
| $A_{\sim\circ-}$ | — | — | — | — | open (full-$K_4$, beyond scope) |

The connection $A_\sim$ thins the $K_4$-equivariant cohomology from four sectors to two by killing the negation-antisymmetric and doubly-antisymmetric content entirely. This is the first concrete instance of *gauge twisting changing cohomological rank* in the corpus, and the first computation realizing the open territory flagged in [Klein-four gauge bundle](../objects/klein-four-gauge-bundle.md) ("non-flat connections produce gauge-twisted cohomology").

## What this gives

**The twisted version of the strong-MLD invariant.** [equivariant cohomology decomposition](equivariant-cohomology-decomposition.md) Part 5 identified the four sector counts $(|L_\mathrm{ns}^\chi|)_\chi$ as the strong-MLD invariant. The twisted refinement gives a *connection-indexed* family of MLD-style invariants: for each $K_4^{\,k}$-valued connection $A$, the surviving sector counts $(|L_\mathrm{ns}^\chi|)_{\chi : \chi \circ \mathrm{hol}_A = 1}$ form a coarser but $A$-sensitive invariant. Different connections see different parts of the same settling.

**A gauge-theoretic spectral sequence.** Part 1 is essentially the $E_1$-page of a connection-twisted Hochschild–Serre spectral sequence for the fibration $|N\widetilde{\mathcal{C}}| \to |N\mathcal{C}| \to B\pi_1(\mathcal{C})$. The vanishing in Part 2 says the spectral sequence collapses immediately for $\pi_1$ finite and $\chi$ non-trivial. For infinite $\pi_1$ — which can arise when the predicate category has non-finite generation — the higher pages can carry interesting information; this is a natural extension front.

**Coupling to closure-flow curvature.** The corpus's other curvature notion — [closure-flow curvature](../theorems/closure-flow-curvature-regime-correspondence.md) — lives in $H^1$ of the closure 2-monad. The present theorem gives a way to *gauge-twist* that curvature: replacing constant coefficients by $\mathcal{L}_{\chi, A}$ in the closure-flow cohomology computation. Whether the gauge $H^2$-curvature ([curvature-from-pseudo-functorial-connections](questions/curvature-from-pseudo-functorial-connections.md)) controls obstructions to coherently twisting the closure-flow $H^1$ is the natural follow-up question, and the open direction (3) on the user's plan list.
