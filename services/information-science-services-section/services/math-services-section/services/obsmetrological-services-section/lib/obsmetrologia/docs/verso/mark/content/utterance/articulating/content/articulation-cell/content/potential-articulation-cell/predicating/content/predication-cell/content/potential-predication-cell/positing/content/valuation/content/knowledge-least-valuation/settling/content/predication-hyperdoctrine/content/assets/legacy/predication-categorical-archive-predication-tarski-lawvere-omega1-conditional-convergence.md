---
type: theorem
status: proved
depends-on: [lawvere-laplacian-grothendieck-sites, quantale-enriched-sheaf, tarski-lawvere-fixed-point-grothendieck-sites, kelly1982, ghrist-et-al2025]
---

# Conditional Tarski–Lawvere convergence at ω₁ under codirected-continuity

The strongest *general* statement available for Tarski–Lawvere convergence on $\omega_1$-cofinal Grothendieck sites: convergence at some ordinal $\leq \omega_1$ under an explicit hypothesis on the sheaf, namely that its restriction maps preserve codirected $\omega_1$-meets. Together with the [obstruction analysis](tarski-lawvere-fixed-point-grothendieck-sites.md) §"Where the obstruction lives" — which shows the hypothesis is precisely what closes the only structural gap — this is the matched conditional half of the unrestricted-but-false original conjecture.

The hypothesis itself is satisfied automatically for cellular stalk-product sheaves ([Tarski–Lawvere convergence at ω₁ for cellular stalk-product Q-enriched sheaves](tarski-lawvere-omega1-cellular-stalk-product.md), proved), which covers the corpus's primary case.

## Setup

Fix a commutative unital quantale $\mathsf Q$, a small category $\mathbf T$ with Grothendieck topology $J$ whose covers are $\omega_1$-cofinal, and a $\mathsf Q$-enriched sheaf $F$ on $(\mathbf T, J)$. By the [Layer-1 sheaf-compatibility lemma](lawvere-laplacian-grothendieck-sites.md), the Lawvere Laplacian $L : C^0 F \to C^0 F$ restricts to an endofunctor on the sheaf subcategory.

The Tarski–Lawvere iteration is $x_0 = \top$, $x_{\beta+1} = x_\beta \wedge L(x_\beta)$, $x_\lambda = \bigwedge_{\beta < \lambda} x_\beta$ at limits. *Convergence at $\kappa$* means $x_\kappa$ is a suffix point of $L$, i.e., $x_\kappa \leq L(x_\kappa)$.

**Definition (ω₁-codirected-continuity).** $F$ is *$\omega_1$-codirected-continuous* if for every morphism $f : \sigma \to \tau$ in $\mathbf T$ and every codirected $\omega_1$-indexed family $\{y_\beta\}_{\beta < \omega_1}$ in $F(\tau)$,

$$F(f)\Bigl(\bigwedge_{\beta < \omega_1} y_\beta\Bigr) \;=\; \bigwedge_{\beta < \omega_1} F(f)(y_\beta).$$

## Theorem

**Theorem.** *Let $F$ be a $\mathsf Q$-enriched sheaf on a Grothendieck site $(\mathbf T, J)$ with $\omega_1$-cofinal covers. If $F$ is $\omega_1$-codirected-continuous, then the Tarski–Lawvere iteration on $L$ converges to the largest suffix point at some ordinal $\leq \omega_1$.*

*Proof.* The iteration is decreasing in the complete $\mathsf Q$-category $C^0 F$, so $x_{\omega_1} = \bigwedge_{\beta < \omega_1} x_\beta$ exists. We show $x_{\omega_1} \leq L(x_{\omega_1})$ at every $\sigma$.

For every $\beta < \omega_1$, $x_{\omega_1} \leq x_{\beta+1} \leq L(x_\beta)$ by construction, so $x_{\omega_1} \leq \bigwedge_\beta L(x_\beta)$. Compute the right side at $\sigma$:

$$\bigwedge_\beta L(x_\beta)(\sigma) \;=\; \bigwedge_\beta \bigwedge_{f : \sigma \to \tau} F(f)\bigl(F(f)^*(x_\beta(\tau_f))\bigr) \;=\; \bigwedge_f \bigwedge_\beta F(f)\bigl(F(f)^*(x_\beta(\tau_f))\bigr),$$

swapping the two meets via Fubini for $\mathsf Q$-weighted limits ([@kelly1982] §3.5). The codirected-continuity hypothesis lets us pass $\bigwedge_\beta$ inside $F(f)$:

$$\bigwedge_\beta F(f)\bigl(F(f)^*(x_\beta(\tau_f))\bigr) \;=\; F(f)\Bigl(\bigwedge_\beta F(f)^*(x_\beta(\tau_f))\Bigr).$$

Right adjoints preserve all weighted meets ([@kelly1982] §3.2), so

$$\bigwedge_\beta F(f)^*(x_\beta(\tau_f)) \;=\; F(f)^*\Bigl(\bigwedge_\beta x_\beta(\tau_f)\Bigr) \;=\; F(f)^*(x_{\omega_1}(\tau_f)).$$

Substituting,

$$\bigwedge_\beta L(x_\beta)(\sigma) \;=\; \bigwedge_f F(f)\bigl(F(f)^*(x_{\omega_1}(\tau_f))\bigr) \;=\; L(x_{\omega_1})(\sigma).$$

Hence $x_{\omega_1} \leq L(x_{\omega_1})$ at every $\sigma$, so $x_{\omega_1}$ is a suffix point of $L$. By [@ghrist-et-al2025] Theorem 2.17, $x_{\omega_1}$ is the largest suffix point of $L$ below $x_0 = \top$, and the iteration stabilizes by stage $\omega_1$. $\square$

## On the necessity of the hypothesis for this proof route

Without $\omega_1$-codirected-continuity, the displayed step

$$\bigwedge_\beta F(f)\bigl(F(f)^*(x_\beta(\tau_f))\bigr) \;\overset{?}{=}\; F(f)\Bigl(\bigwedge_\beta F(f)^*(x_\beta(\tau_f))\Bigr)$$

fails generically, and there is no general way to reassemble $L(x_{\omega_1})$ from $\bigwedge_\beta L(x_\beta)$. The codirected-continuity hypothesis is therefore necessary for *this* proof route — though not necessarily for convergence itself, which could in principle hold via different mechanisms in special cases.

## When the hypothesis holds

The hypothesis depends on $F$, not on the cover structure or on $\mathsf Q$ alone:

- **$F(f)$ a right adjoint.** Right adjoints preserve all weighted limits, so the hypothesis is automatic. This applies whenever the site morphism $f$ has a left adjoint that $F$ sends to the corresponding $\mathsf Q$-functor — e.g., when the bitopological settling site's restriction along an inclusion of clopens has a left-adjoint extension.

- **$F$ valued in a complete $\mathsf Q$-category whose underlying lattice is meet-continuous at $\omega_1$.** When the value lattices satisfy a Scott-continuity-at-$\omega_1$ axiom (codirected $\omega_1$-meets are computed pointwise in a way the $\mathsf Q$-functors $F(f)$ automatically preserve), the hypothesis is again automatic.

- **$F$ is cellular stalk-product** ($F(U) = \prod_{\sigma \in K(U)} F_\sigma$, restrictions as projections). Projections out of products preserve all weighted limits. Detailed in [Tarski–Lawvere convergence at ω₁ for cellular stalk-product Q-enriched sheaves](tarski-lawvere-omega1-cellular-stalk-product.md). This covers the corpus's primary case (cellular d-frame-valued sheaves on the bitopological settling site).

## When the hypothesis fails

For $\mathsf Q$-enriched frame sheaves with frame-morphism restrictions, $\mathsf Q = \mathbf{Frm}$ quantale: frame morphisms preserve *finite* meets and *arbitrary* joins, but uncountable codirected meets are not generally preserved. The hypothesis fails generically — see the [parent sketch](tarski-lawvere-fixed-point-grothendieck-sites.md) §"What's open" item 1 for the open task of recording an explicit counterexample.

This is the structural reason the original *unrestricted* conjecture (Tarski–Lawvere at $\omega_1$ for arbitrary $\mathsf Q$-enriched sheaves) is materially false: the conditional theorem above is the strongest general statement available, and the direct-limit definition (per [aperiodic-regime cohomology via direct limit](aperiodic-regime-cohomology-via-direct-limit.md)) is the structural workaround for non-stalk-product cases.
