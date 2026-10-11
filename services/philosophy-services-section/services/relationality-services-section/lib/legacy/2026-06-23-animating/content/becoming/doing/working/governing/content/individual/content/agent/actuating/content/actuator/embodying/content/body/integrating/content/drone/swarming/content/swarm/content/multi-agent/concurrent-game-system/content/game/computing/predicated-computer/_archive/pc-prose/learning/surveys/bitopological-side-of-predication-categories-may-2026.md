---
description: Survey of the bitopological / Stone-dual side of predication categories — paired Priestley spaces, d-frames, the bitopological settling site, the dual predication hyperdoctrine, and the dual representation of a predication settling.
status: draft
session-date: 2026-05-19
---

## Scope

This survey records the bitopological side of predication categories as it stands in the library at `theories/.../predication-categories/code/structures/`. It covers the paired Priestley space (the Priestley-dual chart for a distributive bilattice's spectrum), the d-frame (the algebraic dual of a bitopological space), the bitopological settling site $(\mathbf{T}^*_{\mathrm{site}}, J)$, the dual predication hyperdoctrine $\mathcal{E}^*$, and the predication settling Priestley dual $\widehat{v}$. It defers the core categorical content (the primal hyperdoctrine, the fiber algebras, the predication settling) to the companion survey [predication-categories-may-2026](predication-categories-may-2026.md), and it defers cohomology and moduli content to their own surveys.

## Content

### The paired Priestley space

A paired Priestley space is a Priestley space $X$ equipped with an order-reversing involution $\sigma : X \to X$, the *swap*. Morphisms are continuous order-preserving maps that commute with $\sigma$. The category is $\mathbf{PairedPriSp}$. The swap encodes the bilattice negation; the underlying Priestley order encodes one of the two bilattice orders, with the other recovered by post-composing with $\sigma$.

For $\mathbf{L} = \mathbf{2}$, the spectrum $\mathrm{Spec}(\mathbf{L})$ is a point, so the paired Priestley dual of the four-element bilattice $\mathbf{FOUR}$ is the two-point space $\{+, -\}$ with $\sigma : + \leftrightarrow -$.

### The d-frame

A d-frame is the algebraic dual of a bitopological space, generalizing how a frame is the algebraic dual of a topological space (Jung–Moshier 2006; Jakl 2018). A d-frame is a quadruple

$$\mathbb{L} = (L_+,\, L_-,\, \mathrm{con},\, \mathrm{tot})$$

with $L_+$ and $L_-$ frames (complete lattices satisfying $a \wedge \bigvee S = \bigvee_{s \in S}(a \wedge s)$), the consistency relation $\mathrm{con} \subseteq L_+ \times L_-$ — *(a, b) ∈ con* asserts that positive datum $a$ and negative datum $b$ are jointly consistent (their joint extension is non-empty) — and the totality relation $\mathrm{tot} \subseteq L_+ \times L_-$ — *(a, b) ∈ tot* asserts that $a$ and $b$ together cover (their joint extension is the whole space).

The library's axioms on the two relations are: $\mathrm{con}$ is downward-closed and closed under directed joins on each side; $\mathrm{tot}$ is upward-closed and closed under finite meets on each side; plus compatibility axioms tying the two relations together, recorded in Jung–Moshier 2006 §3 and Jakl 2018 Ch. 2. The category of d-frames is $\mathbf{dFrm}$.

For a bitopological space $(X, \tau_+, \tau_-)$, the d-frame of opens is $\mathbb{L}(X, \tau_+, \tau_-) = (\tau_+, \tau_-, \mathrm{con}_X, \mathrm{tot}_X)$ with $(U, V) \in \mathrm{con}_X$ iff $U \cap V = \emptyset$ (no point is told both) and $(U, V) \in \mathrm{tot}_X$ iff $U \cup V = X$ (every point is told at least one).

Per Jakl 2025 §4.1, every distributive bilattice determines a d-frame, with $L_+$ the truth-side lattice and $L_-$ the order-dual of the inconsistency-side lattice; the consistency and totality relations encode the bilattice's $\leq_t / \leq_k$ structure. Every spatial d-frame arises this way. Distributive bilattices, paired Priestley spaces, and d-frames are three coordinate charts on the same axis under bitopological Stone duality; d-frames are the chart with the most-developed off-the-shelf homological-algebra infrastructure.

### The dual predication hyperdoctrine $\mathcal{E}^*$

Fix a predication hyperdoctrine $\mathcal{E}$ over $(\mathbf{L}, \mathcal{C}, E)$. The dual predication hyperdoctrine is the tuple

$$(\mathcal{E}^*, \, p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}, \, \mathbb{M}^*, \, \mathbb{N}^*, \, \mathrm{Cl}^*, \, \mathbf{T}^*(\mathcal{C}^{\mathrm{op}}, \lambda^{\mathrm{op}}))$$

obtained by piecewise application of the Jung–Rivieccio duality:

- **Fibers.** $\mathcal{E}^*_q = \mathrm{Spec}(A_q) \in \mathbf{PairedPriSp}$, the Priestley dual of the predication fiber algebra.
- **Total category.** $\mathcal{E}^*$ is the Grothendieck construction of the dualized fiberwise data over $\mathcal{C}^{\mathrm{op}}$.
- **Variance flip.** $p^*$ is an opfibration; morphisms in $\mathcal{C}$ stay where they were but reindexing $(f^*)^*$ runs in the opposite direction in the fibers.
- **Dual fibration-KZ pair.** $\mathbb{M}^*$ is a lax-idempotent 2-comonad; $\mathbb{N}^*$ is a colax-idempotent 2-monad. The 2-adjunction $\mathbb{M}^* \dashv \mathbb{N}^*$ on $\mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$ has the same diamond shape as the primal $\mathbb{M} \dashv \mathbb{N}$ with monad/comonad roles swapped.
- **Dual closure 2-comonad.** $\mathrm{Cl}^*$ is a colax-idempotent 2-comonad whose action on dual fibers is restriction-to-confirming-Priestley-points — the Stone-dual face of "inflate and add consequences."
- **Dual temporal 2-category.** $\mathbf{T}^*(\mathcal{C}^{\mathrm{op}}, \lambda^{\mathrm{op}})$ has 0-cells $(\tau, X^*)$ for $\tau \in \lambda^{\mathrm{op}}$ and $X^* \in \mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$, with 1-cells and 2-cells dualizing through the dual 2-adjunction.
- **Dual settling.** The primal predication settling coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ dualizes to a settling algebra $c^* : F_U^*(\mathcal{E}^*) \to \mathcal{E}^*$ on the dual side; the $\leq_k$-monotone primal orbit becomes a co-monotone dual orbit.

Existence and structural coherence of the entire tuple is the content of the Priestley dualizability theorem.

The two primal quantifier triples $\exists_f^k \dashv f^* \dashv \forall_f^k$ and $\exists_f^t \dashv f^* \dashv \forall_f^t$ dualize to dual adjoint triples on the Priestley side; Frobenius for $\wedge_k, \wedge_t$ and Beck–Chevalley carry across, since both orders correspond to orthogonal directions on the paired Priestley space. Each of the four predicate generators has a Priestley dual: specialization dualizes to inclusion of Priestley spectra; converse to the swap involution on Priestley pairs; subject-projection to diagonal-extension lifting a function on diagonal points to a rowwise function; object-projection dually, columnwise.

### The Priestley dual of a settling

Given a predication settling $v$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$, at each step $\tau < \lambda$ and each predicate $p$ the valuation $v_\tau(p) \in A_p = \mathbf{L}^{\bowtie\, E \times E}$ has a Priestley dual $\widehat{v_\tau(p)}$ — a paired Priestley space obtained by applying $\mathrm{Spec}$ to each coordinate of the twist product. The family $\widehat{v} = (\widehat{v_\tau(p)})_{p, \tau}$ is the dual representation of $v$.

For each fixed $p, \tau$, the correspondence $v_\tau(p) \mapsto \widehat{v_\tau(p)}$ is the object-level component of the Jung–Rivieccio duality applied to the predication fiber algebra $A_p$, and extends to bilattice-homomorphism morphisms on $A_p$. Under the duality, accumulation of evidence in the knowledge order on the primal side corresponds to filter-tightening on the Priestley-dual side: "knowledge grows" is dual to "possibility space shrinks."

### The bitopological settling site $(\mathbf{T}^*_{\mathrm{site}}, J)$

The site on which the cohomology of a predication hyperdoctrine lives is assembled from the dual predication hyperdoctrine's fiberwise paired Priestley spaces, over the contravariant predicate category and the covariant settling direction. Fix a predication hyperdoctrine $\mathcal{E}$ over $(\mathbf{L}, \mathcal{C}, E)$ with settling bound $\lambda$ and increment sequence $U = (u_\tau)_{\tau < \lambda}$. Write $X_q^\tau := \mathrm{Spec}(A_q)$ for the paired Priestley space at $(q, \tau)$, and use the pairwise-Stone framing of its bitopological structure (equivalent to the paired Priestley framing by bitopological Stone duality, $\mathbf{PStone} \cong \mathbf{Pries}$). A *pairwise-Stone clopen* is a subset $U \subseteq X_q^\tau$ clopen in the join of the $+$- and $-$-component topologies. Pairwise-Stone clopens form a Boolean algebra.

- **Objects:** triples $(q, \tau, U)$ with $q \in \mathcal{C}^{\mathrm{op}}$, $\tau < \lambda$, and $U$ a pairwise-Stone clopen in $X_q^\tau$.
- **Morphisms** $(q', \tau', U') \to (q, \tau, U)$ are triples $(f, h, j)$ with $f : q \to q'$ a $\mathcal{C}$-morphism, $h : \tau \to \tau'$ a $\lambda^{\mathrm{op}}$-morphism (equivalently $\tau' \geq \tau$), and $j : U' \hookrightarrow (f \times h)^*(U)$ an inclusion of pairwise-Stone clopens. Here $(f \times h)^* : X_q^\tau \to X_{q'}^{\tau'}$ is the composite of the dualized predicate generator along $f$ and the dualized settling advancement along $h$. Composition is componentwise.

The Grothendieck topology $J$ is generated by the pretopology in which a family $\{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in I}$ of pairwise-Stone inclusions at fixed $(q, \tau)$ is a covering family iff $\bigcup_i U_i = U$ in the pairwise-Stone topology on $X_q^\tau$. Pairwise-Stone covers are themselves closed under pullback by Priestley morphisms, so the pretopology is a Grothendieck basis.

Covers are *only* fiber-level pairwise-Stone refinements at fixed $(q, \tau)$. There are no temporal covers: families of the form $\{(q, \tau_i, U) \to (q, \tau, U)\}_{\tau_i \geq \tau}$ are not covering. Cross-ordinal settling structure is carried in morphisms, not in covers; cross-ordinal cohomological content is extracted at the cohomology level via direct limits along settling morphisms (Anderson–Putnam direct limit).

Regime-dependent complexity of the site:

- **Strict regime** ($\kappa < \omega$): $\mathbf{T}^*_{\mathrm{site}}$ is a finite category — finite Priestley fibers, finitely many ordinal strata.
- **Scott-continuous regime** ($\kappa = \omega$): countable at the ordinal level; pairwise-Stone fibers admit acyclic refinements via Husainov acyclicity.
- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$): countably many ordinal strata.
- **Aperiodic regime** ($\omega_1 \leq \kappa$): $\omega_1$-or-more ordinal strata with non-trivial 2-cells throughout; the site is accessible only as a direct limit over bounded sub-sites $\mathbf{T}^*_{\leq \tau}$. The aperiodic classifying invariant lives here.

## Synthesis-flags

The phrase "three coordinate charts on the same axis" reflects the Jakl 2025 §4.1 framing as reported in the library's `d-frame.md`; that file's text was used as the surveyor's organizing scaffold. The reading of $\mathrm{con}$ as "no point is told both" and $\mathrm{tot}$ as "every point is told at least one" tracks the Belnap-flavored gloss given in `d-frame.md`. The four bullet-point regime descriptions for the bitopological settling site reproduce the library's `bitopological-settling-site.md` text closely.

## Provenance

Read in full this session:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/d-frame.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/paired-priestley-space.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/bitopological-settling-site.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/dual-predication-hyperdoctrine.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/predication-priestley-dual.md`

External citations named in the source material:

- Jung, A., and Moshier, M. A. (2006), *A logical analysis of bitopology*.
- Jakl, T. (2018), thesis; (2025) §4.1 "Bilattices versus d-frames."
- The Jung–Rivieccio duality theorem (referenced as `jung-rivieccio-duality.md` in the library).
- The Priestley dualizability theorem (referenced as `priestley-dualizability.md` in the library).
