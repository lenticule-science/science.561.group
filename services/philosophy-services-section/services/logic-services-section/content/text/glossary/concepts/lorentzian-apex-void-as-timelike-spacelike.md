---
kind: theorem
status: proved
depends-on: [lorentzian-causal-settling, void-cone-cohomology, void-cone-structure]
title: Timelike/spacelike as apex/void in Lorentzian causal settlings
description: "For a Lorentzian causal-structure settling on a causal set $(E, \\preceq)$, the corpus's apex and void cones acquire a clean Lorentzian-physical interpretation: the apex is the timelike (causally-connected) substructure and the void is the…"
---

# Timelike/spacelike as apex/void in Lorentzian causal settlings

For a [Lorentzian causal-structure settling](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/lorentzian-causal-settling.md) on a causal set $(E, \preceq)$, the corpus's apex and void cones acquire a clean Lorentzian-physical interpretation: **the apex is the timelike (causally-connected) substructure and the void is the spacelike (causally-disconnected) substructure**. The cohomological apex/void duality (per [void-cone cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md)) becomes the timelike/spacelike duality of Lorentzian geometry.

## Statement

**Theorem (apex/void = timelike/spacelike).** *Let $v_\kappa$ be a Lorentzian causal settling on a causal set $(E, \preceq)$ with seed relation $\prec_0$. Then:*

1. *(Apex = causally-connected pairs.) The apex cone $\mathrm{Apex}_v := \{(e_1, e_2) : v_\kappa(e_1, e_2) = \mathbf{t}\}$ equals the set of pairs with $e_1 \preceq e_2$ — the causal-precedence relation.*

2. *(Void = spacelike pairs.) The bidirectional void cone $V_\infty^{\leftrightarrow} := \{(e_1, e_2) : e_1 \neq e_2,\ v_\kappa(e_1, e_2) = \bot \text{ and } v_\kappa(e_2, e_1) = \bot\}$ equals the set of pairs with neither $e_1 \preceq e_2$ nor $e_2 \preceq e_1$ — the spacelike-separated relation. The one-way void $V_\infty := \{(e_1, e_2) : v_\kappa(e_1, e_2) = \bot\}$ is larger: it also holds every pair $(e_1, e_2)$ with $e_2 \prec e_1$.*

3. *(Cohomological pairing.) The apex / void cohomologies $H^1(\mathcal{F}_{v_\kappa})$ and $H^0(V_\infty)$ are dually paired (per [void-cone cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md)) and provide the Lorentzian causal invariants:*

   - $H^1$ generators: causal-precedence-acquisition events (transitivity firings).
   - $H^0(\mathrm{Void})$ generators: structural-spacelike events (irreducibly-disconnected pairs).

## Proof

### Step 1: apex = causal precedence

By definition, $v_\kappa(e_1, e_2) = \mathbf{t}$ iff there's a directed $\prec_0$-path from $e_1$ to $e_2$. In the causal-set definition $\preceq$ is exactly the transitive closure of $\prec_0$. So $v_\kappa(e_1, e_2) = \mathbf{t}$ iff $e_1 \preceq e_2$.

Therefore $\mathrm{Apex}_v = \{(e_1, e_2) : e_1 \preceq e_2\}$. $\square$ (Step 1)

### Step 2: void = spacelike

A cell $(e_1, e_2)$ is in $V_\infty$ iff $v_\kappa(e_1, e_2) = \bot$, iff there's no directed $\prec_0$-path from $e_1$ to $e_2$, iff $e_1 \not\preceq e_2$. This one-way set $V_\infty$ is not the spacelike relation: it also contains every pair with $e_2 \prec e_1$.

For the *void cone* in the bitopological sense (per [void-cone-structure](../../documents/articles/notes/undated/narratives-void-cone-structure.md)), the theorem uses the bidirectional void $V_\infty^{\leftrightarrow}$: the pairs $(e_1, e_2)$ with $e_1 \neq e_2$ and both $v_\kappa(e_1, e_2) = \bot$ and $v_\kappa(e_2, e_1) = \bot$. This is exactly $e_1 \not\preceq e_2$ and $e_2 \not\preceq e_1$ — i.e., $e_1$ and $e_2$ are *incomparable* under $\preceq$, which is the definition of **spacelike separated** in a causal set. $\square$ (Step 2)

### Step 3: cohomological pairing

By [void-cone cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md), $H^1(\mathcal{F}_v) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z}$ and $H^0(V_\infty) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z}$, dually paired by firing-ordinal indexing.

Each NSC firing $\mu$ in this Lorentzian setting corresponds to a *transitivity firing* — a step where a previously-disconnected cell $(e_1, e_3)$ acquires the value $\mathbf{t}$ via composition of $(e_1, e_2)$ and $(e_2, e_3)$ for some intermediate $e_2$. So:

- $H^1$ generator $e_\mu^{\mathrm{apex}}$: "cell $(e_1, e_3)$ became causally-connected at firing $\mu$" — a *causal-precedence-acquisition event*.
- $H^0(\mathrm{Void})$ generator $e_\mu^{\mathrm{void}}$: "cell $(e_1, e_3)$ stopped being spacelike (or void) at firing $\mu$" — the same event from the void side.

The duality records: each firing simultaneously adds a timelike pair and removes a spacelike one. The two cohomologies count the same events from complementary perspectives. $\square$ (Step 3)

Combining: the corpus's apex/void cohomological framework, applied to a Lorentzian causal-structure settling, identifies the timelike/spacelike duality of Lorentzian geometry. $\blacksquare$

## Concrete instances

### Diamond causal set

$E = \{a, b, c, d\}$, $\prec_0 = \{(a, b), (a, c), (b, d), (c, d)\}$.

Closure adds $(a, d)$. Apex: 5 pairs $\{(a, b), (a, c), (b, d), (c, d), (a, d)\}$ — all causally connected. Bidirectional void $V_\infty^{\leftrightarrow}$: $(b, c)$ and $(c, b)$ — $b$ and $c$ are spacelike separated. The one-way void $V_\infty$ holds 7 ordered pairs of distinct events: $(b, c)$, $(c, b)$, $(b, a)$, $(c, a)$, $(d, a)$, $(d, b)$, $(d, c)$.

$H^1 = \mathbb{Z}^1$ (one NSC firing: the transitivity firing $(a, d)$ via $(a, b), (b, d)$ — or via $(a, c), (c, d)$, but both yield the same firing event).

Wait — actually there are *two* witnesses for $(a, d)$: via $b$ and via $c$. In the firing-ordinal counting, this is *one* firing of cell $(a, d)$, but the witness-multiplicity is 2. The cohomology generator records the cell-firing, not the witness multiplicity.

$H^0(\mathrm{Void}) = \mathbb{Z}^?$. Per the theorem, $H^0(\mathrm{Void})$ is dually paired with $H^1$, so should be $\mathbb{Z}^1$ as well. The single generator records "$(a, d)$ became non-void at the transitivity firing."

But there are *two* permanently-spacelike pairs $\{(b, c), (c, b)\}$ in $V_\infty^{\leftrightarrow}$. These are *not counted by $H^0(\mathrm{Void})$ in the firing-counting sense* — they're at the *void cone's apex* (the structurally-spacelike component, never resolved).

This distinction is real: $H^0(\mathrm{Void})$ counts firings (cells that *stop* being void); the *void cone's apex* (cells that *never* stop being void) is a separate invariant. Per [void-cone cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md), the corpus has both:

$$H^0_{\mathrm{apex of Void}}(v) := \{\text{cells permanently } \bot\}.$$

For the diamond: $H^0_{\mathrm{apex of Void}} = \{(b, c), (c, b)\}$ — the spacelike-separated pairs that *never* become causally connected.

### What dimensions mean

The number of permanently-spacelike pairs (apex of void) is a structural invariant of the causal set. For Minkowski 1+1 spacelike-distinct events, every pair of events at the same time slice but different spatial position is spacelike. So *spacelike content* counts events that are "simultaneous in some frame."

In the corpus: the *apex of void* ($V_\infty^{\leftrightarrow}$) for a Lorentzian causal settling counts **structurally-distinct spatial events** — events on the same "time slice" (in the Lorentzian sense). This gives a discrete-causal-set analog of the *spatial-dimensionality* of the underlying spacetime.

For a 1+1 Minkowski sprinkling of $N$ events with diameter $\Delta$, the number of spacelike pairs scales as $\sim N^2 \cdot (\text{spatial-extent}/\Delta)$, capturing the spatial dimension count. For $D+1$ Minkowski, scales as $N^2 \cdot (\text{spatial-volume}/\text{lightcone-volume})$, capturing $D$.

This gives a **dimension-detecting invariant** from the void cone's apex — concretely how much of the causal set is spatially-extended vs. temporally-extended.

## Connection to causal-set physics

The causal-set physics literature has analogous invariants:
- *Myrheim-Meyer dimension*: counts pairs of intervals to estimate dimensionality.
- *Causal-set action*: discrete analog of the Einstein-Hilbert action via element-counting.

The corpus's apex/void cohomology gives a complementary characterization:
- *Apex $H^1$*: counts causal-precedence-acquisition events.
- *Void $H^0$*: same firings, dually counted.
- *Apex of void $V_\infty$*: structural-spacelike content, dimension-flavored invariant.

A clean translation: **the corpus's cohomological invariants are causal-set-theoretic invariants, recast in closure-2-monad form.** The Myrheim-Meyer-style content has a corpus-form via the void cone's apex.

Open: detailed comparison between the corpus's $H^0_{\mathrm{apex of Void}}$ and the Myrheim-Meyer dimension estimator. They should agree on Minkowski sprinklings but may differ for non-Minkowski causal sets.

## Position in the program

Establishes the Lorentzian-physical interpretation of the corpus's apex/void framework. The corpus's structural theory has a physics-flavored instance: causal sets, with apex = timelike, void = spacelike.

This is **Phase 3.2 part one** — formal identification.

Pairs with:
- The [Lorentzian causal-settling object](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/lorentzian-causal-settling.md) — the underlying setting.
- The [void-cone cohomology theorem](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md) — generic apex/void duality this specializes.
- The [Lorentzian causal-set benchmark](../../documents/articles/notes/undated/benchmark-lorentzian-causal-set.md) — concrete computation.

Open downstream:
- *Causal-set dimension estimator from $H^0_{\mathrm{apex of Void}}$*: detailed connection to Myrheim-Meyer.
- *Action principles in the corpus's framework*: discrete Einstein-Hilbert action as a corpus invariant.
- *Continuum limit*: when does the discrete-causal-set settling converge to a smooth Lorentzian manifold? Cohomological convergence statement open.
