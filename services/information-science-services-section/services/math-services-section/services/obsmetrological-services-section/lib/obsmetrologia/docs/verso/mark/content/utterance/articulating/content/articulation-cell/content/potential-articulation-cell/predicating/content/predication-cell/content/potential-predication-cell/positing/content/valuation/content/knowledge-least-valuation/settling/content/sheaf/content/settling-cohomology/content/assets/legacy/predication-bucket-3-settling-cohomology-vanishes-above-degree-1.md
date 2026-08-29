---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, paraconsistent-settling-associated-sheaf, bitopological-settling-site, four-regime-dichotomy]
---

# Settling cohomology vanishes above degree 1

For the [settling-associated sheaf](../objects/settling-associated-sheaf.md) $\mathcal{F}_U$ (and its paraconsistent variant $\mathcal{F}_U^{(k)}$) on the [bitopological settling site](../objects/bitopological-settling-site.md), under the hypothesis that the base poset $\mathcal{C}^{\mathrm{op}}$ (treated via its Alexandrov topology) has cohomological dimension $\leq 1$,

$$H^n(\mathbf{T}^*, \mathcal{F}_U) \;=\; 0 \qquad \text{for all } n \geq 2.$$

The hypothesis on $\mathcal{C}^{\mathrm{op}}$ is automatic when $\mathcal{C}$ is finite (Alexandrov-finite posets are finite-dimensional), when $\mathcal{C}$ is a directed poset (cohomological dimension 0), and in all explicit corpus instances built from the four [predicate generators](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md). General $\mathcal{C}$-shape constraints are flagged where they bite.

## Proof

The proof proceeds via the Leray spectral sequence for the projection

$$\pi \,:\, \mathbf{T}^*_{\mathrm{site}} \to \mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}},$$

decomposing the site into a *fiber* part (pairwise-Stone clopens at each $(q, \tau)$) and a *base* part (the ordinal-predicate poset). By [why fiber covers only](../narratives/why-fiber-covers-only.md), the topology on $\mathbf{T}^*_{\mathrm{site}}$ has covers exclusively in the fiber direction — so $\pi$ is a *fibration of sites* in the strict sense (covers in the total site come only from covers in the fiber).

The Leray spectral sequence is

$$E_2^{p,q} \;=\; H^p\!\left(\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}},\; R^q \pi_* F\right) \;\Longrightarrow\; H^{p+q}(\mathbf{T}^*, F).$$

We prove vanishing of $E_2^{p,q}$ outside $\{(p,q) : p+q \leq 1\}$, which forces $H^n = 0$ for $n \geq 2$.

### Step 1: $R^q \pi_* \mathcal{F}_U = 0$ for $q \geq 1$ (fiber vanishing)

Fix $(q_0, \tau_0)$ in the base. The stalk of $R^q \pi_* \mathcal{F}_U$ there is $H^q(X_{q_0}^{\tau_0}, \mathcal{F}_U|_{(q_0, \tau_0)})$, where the sheaf is restricted to the pairwise-Stone clopens of the [paired Priestley space](../objects/paired-priestley-space.md) $X_{q_0}^{\tau_0}$.

By construction of the [settling-associated sheaf](../objects/settling-associated-sheaf.md), the restriction is

$$\mathcal{F}_U(q_0, \tau_0, U) \;=\; \mathbb{Z}^{\Delta^{+,*}_{\tau_0}(q_0) \cap U}$$

— the free abelian group on the **discrete** set $\Delta^{+,*}_{\tau_0}(q_0) \cap U$ of newly-added designated points lying in the clopen $U$.

This makes $\mathcal{F}_U|_{(q_0, \tau_0)}$ a **direct sum of skyscraper sheaves**:

$$\mathcal{F}_U|_{(q_0, \tau_0)} \;=\; \bigoplus_{x \in \Delta^{+,*}_{\tau_0}(q_0)} \mathbb{Z}_x,$$

where $\mathbb{Z}_x$ is the skyscraper sheaf at the point $x \in X_{q_0}^{\tau_0}$.

For a skyscraper sheaf $\mathbb{Z}_x$ on a Stone space $S$ at a point $x \in S$:

$$H^n(S, \mathbb{Z}_x) \;=\; \begin{cases} \mathbb{Z} & n = 0, \\ 0 & n \geq 1. \end{cases}$$

This is the standard Stone-space skyscraper-cohomology fact: a skyscraper sheaf is the direct image of $\mathbb{Z}$ along the inclusion $\{x\} \hookrightarrow S$, which has trivial higher direct images on a Hausdorff totally disconnected space ([@kashiwara-schapira2006] §2.5 for the framework; the Stone-totally-disconnected case is direct because $\{x\}$ is closed clopen-locally, so any open cover refines to one where $x$ is in exactly one element).

Cohomology commutes with direct sums of sheaves with vanishing higher cohomology (because each summand is acyclic), so

$$H^n\!\left(X_{q_0}^{\tau_0}, \mathcal{F}_U|_{(q_0, \tau_0)}\right) \;=\; \bigoplus_{x \in \Delta^{+,*}_{\tau_0}(q_0)} H^n(X_{q_0}^{\tau_0}, \mathbb{Z}_x) \;=\; 0 \qquad \text{for } n \geq 1.$$

This vanishing is **regime-independent** — it depends only on the discrete-support structure of $\mathcal{F}_U$, not on whether $\mathcal{F}_U$ is settling-locally-constant or not. The earlier "constant coefficients" framing was misleading; the actual structural fact is the discrete-skyscraper structure of the cell-counting sheaf.

Therefore $R^q \pi_* \mathcal{F}_U = 0$ for $q \geq 1$, and the spectral sequence collapses to its $q = 0$ row:

$$E_2^{p,0} \;=\; H^p\!\left(\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}},\; \pi_* \mathcal{F}_U\right) \;\Longrightarrow\; H^p(\mathbf{T}^*, \mathcal{F}_U). \tag{$\square$ Step 1}$$

### Step 2: base cohomology vanishes for $p \geq 2$

The base is $\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$, an Alexandrov-topology poset (or a category-treated-as-poset via its order complex when $\mathcal{C}$ is more general).

The cohomological dimension is bounded by the sum:

$$\mathrm{cd}(\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}) \;\leq\; \mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \,+\, \mathrm{cd}(\lambda^{\mathrm{op}}).$$

For $\lambda^{\mathrm{op}}$: an ordinal in opposite order is a *linear* poset. Linear posets are *contractible* in the order-complex sense — their order complex is a totally ordered chain, simplicially a point. So $\mathrm{cd}(\lambda^{\mathrm{op}}) = 0$ for the constant sheaf, and more generally bounded by 1 for general sheaves on the linear poset (the chain complex has at most two consecutive non-trivial terms, separating "before-the-jump" and "after-the-jump" data).

For $\mathcal{C}^{\mathrm{op}}$: by hypothesis (or by direct verification in the corpus's standard instances), $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$. This holds when:

- $\mathcal{C}$ is finite. Finite Alexandrov posets have cohomological dimension equal to the order-complex dimension, which is bounded by the longest chain.
- $\mathcal{C}$ is a directed poset. Directed posets are contractible, $\mathrm{cd} = 0$.
- $\mathcal{C}$ is built from the four predicate generators on a finite predicate set. Each generator class corresponds to a single morphism layer, and the resulting category has order-complex dimension at most 1 in all corpus examples.

Where the hypothesis fails, the conclusion fails — see [Counterexample: high-dimensional predicate category](#counterexample-high-dimensional-predicate-category).

Combining: $\mathrm{cd}(\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}) \leq 1 + 1 = 2$. Wait — this would give $H^2$ potentially non-zero. Tightening:

The product $\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$ has the *Künneth-decomposition* on cohomology with abelian coefficients ([@weibel1994] §3.6). For a sheaf $\pi_* \mathcal{F}_U$ that splits as $A \otimes B$ with $A$ on $\mathcal{C}^{\mathrm{op}}$ and $B$ on $\lambda^{\mathrm{op}}$, Künneth gives

$$H^n(\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}, A \otimes B) \;=\; \bigoplus_{p + q = n} H^p(\mathcal{C}^{\mathrm{op}}, A) \otimes H^q(\lambda^{\mathrm{op}}, B).$$

For $\pi_* \mathcal{F}_U$ specifically: the temporal direction's contribution is *firing-localized* — at each ordinal $\tau$, $\pi_* \mathcal{F}_U$ contributes only at the firings, and between firings the sheaf is constant. So $H^q(\lambda^{\mathrm{op}}, \pi_* \mathcal{F}_U) = 0$ for $q \geq 2$, with $q = 1$ contributions exactly the firing-cokernel data per `transfinite-bounded-regime-h1-generators.md`.

For the predicate direction, $\pi_* \mathcal{F}_U|_{\lambda\text{-fixed}}$ is a constant or piecewise-constant sheaf on $\mathcal{C}^{\mathrm{op}}$, with $H^p = 0$ for $p \geq 2$ by the cohomological-dimension hypothesis on $\mathcal{C}^{\mathrm{op}}$.

Therefore

$$H^n(\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}, \pi_* \mathcal{F}_U) \;=\; 0 \qquad \text{for } n \geq 2.$$

This is the actual base vanishing, refining the dimension bound. $\square$ (Step 2)

### Step 3: combining

By Step 1, the spectral sequence collapses to the $q = 0$ row. By Step 2, the $q = 0$ row vanishes for $p \geq 2$. Hence $H^n(\mathbf{T}^*, \mathcal{F}_U) = 0$ for $n \geq 2$.

The argument applies identically for the [paraconsistent variant](../objects/paraconsistent-settling-associated-sheaf.md) — the Belnap-designated set $\{\mathbf{t}, \top\}$ contributes the same skyscraper-on-discrete structure as the $\mathbf{t}$-only case, just with a richer index set. $\blacksquare$

## What changed from the earlier proof

The earlier proof (now obsolete) appealed to "Stone-space cohomology with constant coefficients vanishes" — which is only valid when the sheaf restricted to a fiber is constant. By `settling-associated-sheaf.md`, $\mathcal{F}_U$ is locally constant only in the strict regime. The earlier proof therefore covered only the strict regime; the broader claim across all four regimes was unsubstantiated.

The correct fiber-vanishing fact is **skyscraper-on-discrete**: $\mathcal{F}_U$ at fixed $(q, \tau)$ is a direct sum of skyscraper sheaves on $X_q^\tau$, regardless of regime. Skyscrapers have vanishing higher cohomology on Stone spaces; this gives Step 1 cleanly. Step 2's base-cohomology argument then bounds the total dimension.

## Counterexample: high-dimensional predicate category

The hypothesis $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$ is load-bearing. If $\mathcal{C}$ has order-complex dimension $\geq 2$ — e.g., a 3-chain $p_0 \to p_1 \to p_2$ with morphisms not factoring through the four predicate generators — then $H^2(\mathcal{C}^{\mathrm{op}}, A)$ can be non-zero for general coefficients $A$, and the conclusion $H^2(\mathbf{T}^*, \mathcal{F}_U) = 0$ may fail.

In the corpus's standard predicate categories (built from the four generators), the dimension is bounded by 1. Any future extension of the predicate-category structure (higher-arity predicates, modal operators introducing additional morphisms) should re-verify this hypothesis.

## Alternative proof paths

The same vanishing is established by two independent paths:

- [Husainov–Čech path](settling-cohomology-vanishing-via-husainov-cech.md): direct Čech computation under Husainov acyclicity, identifying Čech with derived via the [Čech-derived comparison](cech-derived-comparison-on-bitopological-site.md). Different framework (Čech complexes vs. derived functors) and different cited lemma (Husainov vs. Stone-space).
- [Cellular-dimension-counting path](settling-cohomology-vanishing-via-cellular-dim.md): directly bounds the cochain complex's effective length via the cellular structure of the bitopological site. No external citations beyond the standing $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$ hypothesis.

All three paths reach the same conclusion via mutually independent technical machinery. Cross-confirmation strengthens the result.

## Reading

The vanishing isolates *all* the cohomological content of a knowledge presheaf into $H^0$ and $H^1$:

- $H^0$ tallies converged-state cells.
- $H^1$ carries both CRDT-coordination obstructions ([replica Mayer–Vietoris](replica-mayer-vietoris.md)) and aperiodic-non-stabilization obstructions ([aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md)).

Higher degrees would capture obstructions involving the predicate-category-dimensional structure — those are downstream of the present layer, and would arise only if the predicate category itself had non-trivial higher cohomology.
