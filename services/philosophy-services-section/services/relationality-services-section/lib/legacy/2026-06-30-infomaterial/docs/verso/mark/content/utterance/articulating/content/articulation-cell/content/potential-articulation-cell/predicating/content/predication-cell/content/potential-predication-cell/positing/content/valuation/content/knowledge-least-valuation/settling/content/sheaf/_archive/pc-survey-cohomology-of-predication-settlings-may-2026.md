---
description: Survey of the cohomology side of predication categories — the settling-associated sheaf, settling cohomology in low degrees, bigraded cohomology by knowledge/truth grading, the Klein-four gauge bundle and its isotypic decomposition, and the multi-observer system's cohomology of disagreement.
status: draft
session-date: 2026-05-19
---

## Scope

This survey records the cohomological side of predication categories as it stands in the library at `theories/.../predication-categories/code/structures/`. It covers the settling-associated sheaf $\mathcal{F}_U$ and its paraconsistent variant; the bounded and unbounded settling cohomology $H^n(\mathbf{T}^*, F)$ and its low-degree readings; the bigraded settling cohomology $H^{m,n}_{k,t}$ organizing data by cohomological degree and designation grade; the Klein-four gauge bundle $\mathcal{G}_v$ refining the cohomology by the four characters of $K_4 = \mathbb{Z}/2 \times \mathbb{Z}/2$; and the multi-observer system $V : O \to \mathrm{Settlings}_B$ together with its consensus settling and its cohomological disagreement obstruction $H^1(O, \mathcal{V})$. It defers the underlying bitopological settling site to the bitopological-side survey, and defers the moduli theory (which uses cohomology classes as classifying invariants) to the moduli survey.

## Content

### The settling-associated sheaf $\mathcal{F}_U$

Fix a predication settling $(\mathcal{E}, c)$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with increment sequence $U = (u_\tau)_{\tau < \lambda}$. At each pair $(q, \tau) \in \mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$, the set of newly-added designated cells at stage $\tau$ is

$$\Delta^+_\tau(q) := \{(s, o) \in E \times E : v_\tau(q)(s, o) = \mathbf{t} \text{ and } v_{\tau'}(q)(s, o) \neq \mathbf{t} \text{ for all } \tau' < \tau\},$$

with $\Delta^+_0(q)$ equal to the $\mathbf{t}$-support of the initial state $v_0(q)$. Via the Jung–Rivieccio duality, each $(s, o) \in \Delta^+_\tau(q)$ corresponds to a $+$-point $(s, o, +)$ in the paired Priestley dual $X_q^\tau$; write $\Delta^{+,*}_\tau(q) \subseteq X_q^\tau$ for the image.

The settling-associated sheaf is the $\mathbf{Ab}$-valued KZ-coherent sheaf on the bitopological settling site

$$\mathcal{F}_U(q, \tau, U) := \mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U}$$

— the free abelian group on newly-added designated points lying in the pairwise-Stone clopen $U$. On a site-morphism $(f, h, j) : (q', \tau', U') \to (q, \tau, U)$, the dualized reindexing $(f \times h)^*$ sends $\Delta^{+,*}_{\tau'}(q') \cap U'$ into $\Delta^{+,*}_\tau(q) \cap U$ (newly-added-at-$\tau'$ points map to newly-added-at-$\tau$ or earlier-added points via settling-monotonicity becoming spectrum-shrinking on the dual). $\mathcal{F}_U$ acts by the induced $\mathbb{Z}$-linear map on free abelian groups.

The sheaf is locally constant in the strict regime, acquires $\omega$-indexed structure in the Scott-continuous regime, transfinite-bounded structure in the transfinite-bounded regime, and $\omega_1$-indexed aperiodic structure in the aperiodic regime. The parallel paraconsistent settling-associated sheaf $\mathcal{F}_U^{(k)}$ uses the full Belnap-designated set $\{\mathbf{t}, \top\}$ and tracks knowledge-order-sensitive increment data; it splits as $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$.

### Bounded and unbounded settling cohomology

The bitopological settling site does not in general have a terminal object — the predicate category $\mathcal{C}$ has a terminal predicate, but the settling direction is unbounded — so cohomology is defined relative to bounded sub-sites. For $\sigma \leq \kappa$, let $\mathbf{T}^*_{\leq \sigma}$ be the full subcategory of $\mathbf{T}^*_{\mathrm{site}}$ on $(q, \tau, U)$ with $\tau \leq \sigma$, with topology $J_{\leq \sigma}$ inherited by restriction. The bounded global sections functor is

$$\Gamma_{\leq \sigma}(F) := \varprojlim_{(q, \tau, U) \in \mathbf{T}^{*, \mathrm{op}}_{\leq \sigma}} F(q, \tau, U).$$

For a sheaf $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ and a bound $\sigma$, the $n$-th bounded cohomology is $H^n(\mathbf{T}^*_{\leq \sigma}, F) := R^n \Gamma_{\leq \sigma}(F)$; the unbounded cohomology is the direct limit $H^n(\mathbf{T}^*, F) := \varinjlim_\sigma H^n(\mathbf{T}^*_{\leq \sigma}, F)$. Filtered colimits in $\mathbf{Ab}$ are exact (AB5), so the limit preserves the $\delta$-functor structure.

**Low-degree content.**

- $H^0(\mathbf{T}^*, \mathcal{F}_U) \cong \mathbb{Z}^{\Delta^{+,*}_\infty}$ — the free abelian group on points eventually designated across the full settling, counting cells of the converged state. For the paraconsistent variant, $H^0$ also counts $\top$-valued cells.

- $H^1$ records first obstructions — gluing failures not detected at section-level. Two readings of the same structural fact:
    - *CRDT-coordination obstructions:* for two replicas with merge $v_1 \vee_k v_2$, a non-trivial class in $H^1$ of the associated replica Mayer–Vietoris cover indicates the local states cannot be merged without coordination. The CRDT-convergence theorem is equivalent to vanishing of a specific $H^1$-class.
    - *Aperiodic non-stabilization obstructions:* for an aperiodic-regime settling, $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$ contains the aperiodic classifying invariant. Zero iff the settling stabilizes before $\omega_1$; non-zero iff genuinely aperiodic.

- $H^{\geq 2}$ vanishes for settling-associated sheaves under $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$ on the predicate category — the settling-cohomology-vanishes-above-degree-1 theorem. The hypothesis holds automatically for all corpus instances built from the four predicate generators on finite predicate sets.

### Bigraded settling cohomology $H^{m,n}_{k,t}$

For a predication settling with paraconsistent settling-associated sheaf $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$, the bigraded cochain complex has two non-zero rows:

$$C^{m,n}_{k,t}(\mathbf{T}^*, \mathcal{F}_U) := \begin{cases} C^n(\mathbf{T}^*, \mathcal{F}_U^{(t)}) & m = 0, \\ C^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) & m = 1, \\ 0 & m \geq 2. \end{cases}$$

The horizontal differential $d_h : C^{m,n} \to C^{m,n+1}$ is the standard cochain differential. The vertical differential $d_v : C^{0,n} \to C^{1,n}$ is the composition $\mathcal{F}_U^{(t)} \hookrightarrow \mathcal{F}_U^{(k)} \twoheadrightarrow \mathcal{F}_U^{(\top)}$ at each $n$. The bigraded settling cohomology $H^{m,n}_{k,t}$ is the cohomology of the total complex; equivalently, $H^n(H^m(C^{\bullet,\bullet}_{k,t}))$.

The two-row total complex is a straightforward mapping cone. Two spectral sequences converge to the bigraded total: filtration by rows computes $H^q(\mathcal{F}_U^{(t)})$ and $H^q(\mathcal{F}_U^{(\top)})$ in separate columns; filtration by columns computes the mapping-cone differential's effect on $H^q$. Both degenerate at $E_2$.

**Regime specialization.** In consistent strict and Scott-continuous regimes, $\mathcal{F}_U^{(\top)} = 0$ and the bigrading collapses: $H^{1,n}_{k,t} = 0$ and $H^{0,n}_{k,t} = H^n_t$. In inconsistent transfinite-bounded or aperiodic settlings — as arise from contradicting sources merged across many rounds — both rows carry distinct content; the bigrading is genuinely 2-dimensional precisely when the apparatus needed to track inconsistency separately becomes load-bearing.

### The Klein-four gauge bundle $\mathcal{G}_v$ and isotypic decomposition of $H^1$

The bilattice $\mathbf{FOUR}$ has four involutive automorphisms forming the Klein-four group $K_4 = \mathbb{Z}/2 \times \mathbb{Z}/2$: identity, negation $\sim$ (swaps $\mathbf{t} \leftrightarrow \mathbf{f}$, fixes $\bot, \top$), conflation $-$ (swaps $\top \leftrightarrow \bot$, fixes $\mathbf{t}, \mathbf{f}$), and the combined $\sim \circ -$. The knowledge order is preserved by negation and reversed by conflation; the truth order is reversed by negation and preserved by conflation; the combined involution reverses both. Under Jung–Rivieccio duality, the $K_4$ action on $\mathbf{FOUR}$ dualizes to a $K_4$ action on the paired Priestley space.

The Klein-four gauge bundle of a predication settling $v$ is the $K_4$-equivariant sheaf $\mathcal{G}_v$ obtained by equipping $\mathcal{F}_v$ with natural transformations $\rho_g : \mathcal{F}_v \to g^*\mathcal{F}_v$ for each $g \in K_4$, satisfying $\rho_{\mathrm{id}} = \mathrm{id}$ and the cocycle condition $\rho_{gh} = \rho_h \circ \rho_g$. Negation acts on sections by exchanging $\Delta^{+,t}_\tau(q)$ (truth-side firings) with $\Delta^{+,f}_\tau(q)$ (falsity-side firings); conflation acts by exchanging $\Delta^{+,\top}_\tau(q)$ with $\Delta^{+,\bot}_\tau(q)$; the combined acts as their composition. Every predication settling carries this bundle — it is an inherent feature of the $\mathbf{FOUR}$-valued cell structure, not an additional structural choice.

$K_4$ is abelian; its irreducible representations are the four characters $\widehat{K_4} = \{\chi_{\mathrm{id}}, \chi_\sim, \chi_-, \chi_{\sim\circ-}\}$, each a homomorphism $K_4 \to \{+1, -1\}$. The $\chi$-isotypic component of $\mathcal{G}_v$ is $\mathcal{G}_v^\chi := \{s \in \mathcal{G}_v : g \cdot s = \chi(g) s \text{ for all } g \in K_4\}$. The equivariant cohomology decomposes $H^1$ along the four isotypic sectors, giving a gauge-theoretic refinement of the firing-type classification:

- $\mathcal{G}_v^{\mathrm{id}}$ — sections invariant under all $K_4$ actions; $\bot$-content fixed by $K_4$.
- $\mathcal{G}_v^{\chi_\sim}$ — sections flipping sign under negation; the $\mathbf{t}/\mathbf{f}$ distinction (antisymmetric under $\sim$, symmetric under conflation).
- $\mathcal{G}_v^{\chi_-}$ — sections flipping under conflation; the $\top/\bot$ consistency distinction.
- $\mathcal{G}_v^{\chi_{\sim\circ-}}$ — sections flipping under both; mixed truth-and-consistency content.

### Multi-observer systems and the cohomology of disagreement

A multi-observer system on a base $B$ is a small category $O$ together with a functor $V : O \to \mathrm{Settlings}_B$ assigning to each object $o \in O$ a settling $V(o)$ on $B$, and to each morphism $\alpha : o_1 \to o_2$ a settling-morphism $V(\alpha) : V(o_1) \to V(o_2)$. The category $O$ encodes observer-to-observer relations: each morphism $\alpha$ is a translation from one observer's perspective to another's. When $O$ is discrete, the multi-observer system is just a family of independent settlings; when $O$ has non-trivial morphisms, it expresses how perspectives compose, refine, or transform.

Examples from the library: $O = \{o_1, o_2\}$ discrete (two-observer disagreement); $O = \{o_1 \to o_2 \to o_3\}$ a chain (refinement); $O = G$ a group acting on settlings (Barad-style apparatus theory — each $g \in G$ is a way of operating the apparatus, $V$ records what each operation produces); $O$ a poset of viewing positions (parameterized settling family).

The consensus settling is the limit $V_{\mathrm{cons}} := \lim_{o \in O} V(o) \in \mathrm{Settlings}_B$ — the maximum-shared content satisfying every observer's settling-morphism constraints. For discrete $O$, the consensus is the pointwise bilattice meet of all $V(o)$ — the information common to all observers.

The disagreement is the cohomological obstruction to consensus,

$$\mathrm{Dis}_V := H^1(O, \mathcal{V}),$$

where $\mathcal{V}$ is the cell-wise constant sheaf $\mathcal{V}(o) = V(o)(\text{cell})$ on $O$ with restriction maps the settling-morphisms $V(\alpha)$. Non-zero $H^1$ classes encode coherent disagreement: observers whose perspectives are individually consistent but jointly contradictory. For discrete $O$, $H^1(O, \mathcal{V}) = 0$ trivially — disagreement in that case shows up as non-trivial pairwise differences rather than as cohomology. For non-discrete $O$, cohomology measures how far $V$ is from being a sheaf on $O$ — how far the pointwise data is from assembling into a single coherent settling.

## Synthesis-flags

The four-row table aligning $K_4$ orbit types to isotypic components in `klein-four-gauge-bundle.md` includes a parenthetical correction ("Wait: more precisely, truth-only and falsity-only firings are related by the negation $\sim$, so they lie in the same $K_4$-orbit"). This survey carries the corrected reading (truth-side and falsity-side firings as $+$- and $-$-eigenspaces of $\sim$ within the same isotypic component, not as separate components) but does not flag the correction as marked in source.

## Provenance

Read in full this session:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/settling-cohomology.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/settling-associated-sheaf.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/bigraded-settling-cohomology.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/multi-observer-system.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/klein-four-gauge-bundle.md`

External citations named in the source material:

- Kashiwara, M., and Schapira, P. (2006), §13.3 — derived-functor framework for $R^n \Gamma_{\leq \sigma}$.
- The settling-cohomology-vanishes-above-degree-1 theorem (referenced in `settling-cohomology.md`).
- The CRDT-convergence theorem and replica Mayer–Vietoris (cross-referenced in the same file).
- Strong-MLD via composed-duality, equivariant-cohomology-decomposition (cross-references inside `klein-four-gauge-bundle.md`).
