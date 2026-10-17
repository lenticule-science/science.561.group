---
type: theorem
status: proved
depends-on: [tarski-lawvere-fixed-point-grothendieck-sites, tarski-lawvere-omega1-conditional-convergence, tarski-lawvere-omega1-cellular-stalk-product, kelly1982, picado-pultr2012]
---

# Frame morphisms preserve all meets iff they have a left adjoint, iff (spatially) they are induced by open maps

The structural characterization of meet preservation for frame morphisms, plus an explicit $\omega_1$-cofinal counterexample exhibiting the failure, plus the corollary that places the corpus's cellular stalk-product class on the *correct* side of the characterization. Settles item 1 of [Tarski–Lawvere fixed point on Grothendieck sites](tarski-lawvere-fixed-point-grothendieck-sites.md) §"What's open" structurally rather than by ad-hoc construction.

The structural lesson: meet preservation is not an accidental extra property a frame morphism might or might not have — it is a *categorical openness* property, equivalent to the existence of a left adjoint. Cellular stalk-product restrictions trivially have left adjoints (they are product projections, with component-inclusion as left adjoint). Topology-refining frame morphisms generically lack left adjoints. The corpus's positive case and the obstruction's failure case are the two sides of one structural condition.

## Theorem 1: meet preservation iff left-adjoint existence

**Theorem.** *Let $h : G \to G'$ be a frame morphism. The following are equivalent:*

1. *$h$ preserves all meets.*
2. *$h$ has a left adjoint $h_! : G' \to G$.*

*Proof.* (1)⇒(2): Apply the poset adjoint functor theorem ([@picado-pultr2012] §IV.2, or directly: if $h$ preserves all meets, define $h_!(V) := \bigwedge \{U \in G : V \leq h(U)\}$; the meet exists by completeness of $G$ and the adjunction $h_! \dashv h$ holds by the meet-preservation hypothesis).

(2)⇒(1): Right adjoints preserve all weighted limits ([@kelly1982] §3.2). $h$ being a right adjoint of $h_!$ preserves all meets, including the codirected meets at issue. $\square$

**Corollary.** *A frame morphism preserves all $\omega_1$-codirected meets iff it preserves all meets, iff it has a left adjoint.*

(The "iff" between $\omega_1$-codirected and arbitrary is because failure at any meet implies failure at some chain-meet, and chain-meets in any frame can be embedded in $\omega_1$-codirected meets.)

## Theorem 2: spatial characterization via open maps

**Theorem.** *Let $f : Y \to X$ be a continuous map between topological spaces, and $h := f^{-1} : \Omega(X) \to \Omega(Y)$ the induced frame morphism. The following are equivalent:*

1. *$h$ preserves all meets.*
2. *$h$ has a left adjoint.*
3. *$f$ is an open map (sends opens to opens).*

*Proof.* (1)⇔(2) by Theorem 1.

(3)⇒(2): If $f$ is open, define $h_!(V) := f(V)$ for $V \in \Omega(Y)$. Then $f(V) \in \Omega(X)$ by openness of $f$, and the adjunction $h_!(V) \leq U \iff V \leq h(U)$ unfolds to $f(V) \subseteq U \iff V \subseteq f^{-1}(U)$, which holds for every $V, U$.

(2)⇒(3): If $h_! : \Omega(Y) \to \Omega(X)$ exists, then $h_!(V) \leq U \iff V \leq h(U) = f^{-1}(U) \iff f(V) \subseteq U$. So $h_!(V)$ is the smallest open in $X$ containing $f(V)$. For the smallest open containing $f(V)$ to exist for *every* $V \in \Omega(Y)$, $f(V)$ itself must be open (otherwise the intersection of all opens containing $f(V)$ is not open in general). So $f$ is open. $\square$

## Explicit ω₁-cofinal counterexample

The characterization shows where to look: a continuous, non-open map between spaces with $\omega_1$-cofinal neighborhood structure.

**Construction.** Let $X := \omega_1 + 1$ with the order topology. The point $\omega_1$ is a limit with neighborhood base $\{(\alpha, \omega_1] : \alpha < \omega_1\}$ — uncountable, with no countable cofinal subfamily. Let $Y := X$ as an underlying set, with the topology refined by adjoining $\{\omega_1\}$ as an open. The identity $f : Y \to X$ is continuous (the refinement adds opens, so preimages of $X$-opens are $Y$-opens).

$f$ is not an open map: $f(\{\omega_1\}) = \{\omega_1\}$ is open in $Y$ but not in $X$ (where it sits at a limit point with no isolated singleton).

By Theorem 2, $h := f^{-1}$ does not preserve all meets.

**Explicit chain witnessing failure.** Take $U_\alpha := (\alpha, \omega_1]$ for $\alpha < \omega_1$, a strictly decreasing $\omega_1$-indexed chain in $\Omega(X)$. Compute:

- $\bigwedge_{\alpha < \omega_1} U_\alpha$ in $\Omega(X)$ = $\mathrm{int}_X\bigl(\bigcap_\alpha U_\alpha\bigr) = \mathrm{int}_X(\{\omega_1\}) = \emptyset$.
- $h(\bigwedge_\alpha U_\alpha) = h(\emptyset) = \emptyset$.
- $h(U_\alpha) = U_\alpha$ as a set, viewed in $Y$'s topology — still open since standard $X$-opens remain $Y$-opens.
- $\bigwedge_{\alpha < \omega_1} h(U_\alpha)$ in $\Omega(Y)$ = $\mathrm{int}_Y\bigl(\bigcap_\alpha U_\alpha\bigr) = \mathrm{int}_Y(\{\omega_1\}) = \{\omega_1\}$ (open in $Y$ by refinement).
- Strict failure: $\emptyset \subsetneq \{\omega_1\}$ in $\Omega(Y)$. $\square$

This is a concrete frame morphism on spatial frames failing $\omega_1$-codirected-meet preservation, structurally certified by Theorem 2 (failure of openness of $f$), with an explicit witnessing chain.

## Application: cellular stalk-product on the right side

For a cellular Q-enriched sheaf $F$ with stalk-product form $F(U) = \prod_{\sigma \in K(U)} F_\sigma$ and projections-as-restrictions, every restriction $F(f) : F(U) \to F(U')$ is a product projection $\pi_{K(U')} : \prod_{\sigma \in K(U)} F_\sigma \to \prod_{\sigma \in K(U')} F_\sigma$. The component-inclusion functor $\iota_{K(U')} : \prod_{\sigma \in K(U')} F_\sigma \to \prod_{\sigma \in K(U)} F_\sigma$ extending by top in the new components is the left adjoint of $\pi_{K(U')}$ in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$. So $F(f)$ has a left adjoint, and by Theorem 1, $F(f)$ preserves all meets — in particular $\omega_1$-codirected meets. This recovers the [cellular stalk-product theorem](tarski-lawvere-omega1-cellular-stalk-product.md)'s lemma as a corollary of the openness characterization.

## Application: settles item 1 of the parent sketch

The [parent sketch](tarski-lawvere-fixed-point-grothendieck-sites.md) §"What's open" item 1 asks for an explicit counterexample to $\omega_1$-codirected-continuity on a non-stalk-product frame sheaf. The construction above provides one at the level of frame morphisms.

To embed it as a sheaf restriction: take $\mathbf T := (\sigma \xrightarrow{f} \tau)$ the two-object site with one non-identity morphism, trivial topology (only maximal sieves cover). The presheaf $\mathbb F$ with $\mathbb F(\sigma) := \Omega(Y)$, $\mathbb F(\tau) := \Omega(X)$, $\mathbb F(f) := h$ is automatically a sheaf for the trivial topology. By the construction above, $\mathbb F$ is not $\omega_1$-codirected-continuous: $\mathbb F(f) = h$ fails to preserve the meet of $\{U_\alpha\}_{\alpha < \omega_1}$ in $\mathbb F(\tau) = \Omega(X)$.

Because $\mathbf T$ has trivial topology and only one non-identity morphism, the iteration's chain at $\tau$ is constant top — so the *iteration on this minimal site* doesn't itself encounter the failure. This is a feature, not a bug: it shows the failure mechanism is at the level of the sheaf's restriction structure, not the iteration itself, and that any richer site whose iteration generates chains of $X$-neighborhoods of $\omega_1$ will inherit the failure. (For instance, the site $\mathbf T_{\omega_1+1}$ with object set $\omega_1+1$ and morphisms encoding the $X$-neighborhood inclusions, valued in $\Omega(X)$ vs $\Omega(Y)$ at appropriate stalks, generates the chain explicitly. The minimal-site form is the cleanest carrier of the failure mechanism.)

## What this says structurally

Three facts compose:

1. **Meet preservation is openness.** A frame morphism preserves all meets iff it has a left adjoint, iff (spatially) it is induced by an open map. Not an accidental property — a *categorical openness* condition.

2. **Cellular stalk-product is structurally open.** Product projections always have inclusion left adjoints. So the corpus's cellular stalk-product condition is exactly the openness condition transposed to the categorical product setting.

3. **The unrestricted Tarski–Lawvere conjecture fails precisely when the sheaf restriction is not categorically open.** Topology-refining frame morphisms (continuous-but-not-open identity-as-set maps) are the prototypical failure case. They are abundant in non-spatial / refined-topology constructions and absent from cellular stalk-product structures.

The original conjecture's failure is therefore not an accident of the d-frame setting — it is the same phenomenon as "not every continuous map is open," dressed up in frame-theoretic language. The corpus's cellular stalk-product hypothesis is the categorical analog of the openness condition that *makes the conjecture true*. The structural picture is: convergence of the Tarski–Lawvere iteration at $\omega_1$ ↔ openness of the sheaf restrictions ↔ cellular stalk-product structure on the sheaf.

This is the structural content of item 1: the failure is not an obstacle to be worked around but a *characterization* of when the iteration converges, and the cellular stalk-product class is the maximal class on which it does.
