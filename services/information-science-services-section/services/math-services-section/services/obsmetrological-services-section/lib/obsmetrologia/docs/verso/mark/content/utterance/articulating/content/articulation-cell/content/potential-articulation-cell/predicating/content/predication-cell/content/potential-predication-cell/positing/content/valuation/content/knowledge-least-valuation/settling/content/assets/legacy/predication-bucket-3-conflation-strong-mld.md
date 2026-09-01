---
kind: theorem
status: proved
depends-on: [d-frame-verdier-composition, strong-mld-via-composed-duality, internal-z2-gauge, four-bilattice, transfinite-bounded-regime-d-frame-cohomology, aperiodic-regime-d-frame-cohomology, verdier-duality-bitopological-site]
---

# Conflation-strong-MLD theorem (firing-pattern characterization)

The **conflation analog** of the [d-frame Verdier composition theorem](d-frame-verdier-composition.md)'s firing-pattern characterization. The corpus's existing strong-MLD work used the *negation* involution on the bilattice to define a composed duality $\mathbb{D}_{\neg} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\neg}^{\mathrm{val}}$. The bilattice $\mathbf{FOUR}$ has a second natural involution — **conflation** $-$ — and a parallel composed duality $\mathbb{D}_{-} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{-}^{\mathrm{val}}$ acts on the d-frame structure.

The two involutions have *complementary fixed-sets*:

| Involution | Fixed values | "Self-dual firings" |
|---|---|---|
| Negation $\neg$ | $\{\bot, \top\}$ | $\bot$-firings, $\top$-firings |
| Conflation $-$ | $\{\mathbf{t}, \mathbf{f}\}$ | truth-only firings, falsity-only firings |

The negation case characterises the *bilattice $\bot/\top$ axis* self-duality (settlings whose firings are all on the void/fullness axis). The conflation case characterises the *truth axis* self-duality (settlings whose firings are all on the determinate truth/falsity axis).

## Statement

**Theorem (conflation firing-pattern self-duality characterization).** *Let $v$ be a settling on the bitopological settling site, with d-frame-valued associated sheaf $\mathbb{F}_v$. Define the composed conflation-Verdier duality*

$$\mathbb{D}_{-} := \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{-}^{\mathrm{val}}$$

*where $\mathbb{D}_{\mathrm{sp}}$ is the spatial Verdier duality on the bitopological settling site (per the [Verdier duality theorem](verdier-duality-bitopological-site.md)) and $\mathbb{D}_{-}^{\mathrm{val}}$ is the value-category-side conflation gauge ($\bot \leftrightarrow \top$, $\mathbf{t}, \mathbf{f}$ fixed).*

*Then $v$ has a q-fuzzy self-dual d-frame Verdier under $\mathbb{D}_{-}$ iff every firing of $v$ is a truth-only firing or a falsity-only firing — equivalently, every firing's bilattice value is in the conflation-fixed set $\{\mathbf{t}, \mathbf{f}\}$.*

## Proof

The structure parallels the [negation-case proof in d-frame-verdier-composition](d-frame-verdier-composition.md), with the involution swapped. By the [transfinite-bounded-regime d-frame cohomology theorem](transfinite-bounded-regime-d-frame-cohomology.md), the d-frame $H^1$-generator $D_\mu$ at each non-Scott-continuous firing $\mu$ has component structure determined by the firing's bilattice value:

- *Truth-only firing* ($v(\text{cell}) = \mathbf{t}$): $D_\mu = (\mathbb{Z}, 0, \text{trivial}, \text{trivial})$.
- *Falsity-only firing* ($v(\text{cell}) = \mathbf{f}$): $D_\mu = (0, \mathbb{Z}, \text{trivial}, \text{trivial})$.
- *$\top$-firing* ($v(\text{cell}) = \top$): $D_\mu = (\mathbb{Z}, \mathbb{Z}, \text{con-fails-on-singleton}, \text{trivial})$.
- *$\bot$-firing* ($v(\text{cell}) = \bot$): $D_\mu = (0, 0, \text{trivial}, \text{trivial})$ — the zero d-frame.

Action of $\mathbb{D}_{-}^{\mathrm{val}}$ on each: conflation fixes $\mathbf{t}$ and $\mathbf{f}$ (so the corresponding $D_\mu$ are fixed up to canonical iso) and swaps $\bot \leftrightarrow \top$ (so the corresponding $D_\mu$ exchange). Concretely:

- *Truth-only* $D_\mu = (\mathbb{Z}, 0, \cdot, \cdot)$: conflation fixes $\mathbf{t}$, so the d-frame is fixed (the $\mathbf{t}$-content is conflation-invariant). $D_\mu \mapsto D_\mu$.
- *Falsity-only* $D_\mu = (0, \mathbb{Z}, \cdot, \cdot)$: conflation fixes $\mathbf{f}$, $D_\mu \mapsto D_\mu$.
- *$\top$-firing* $D_\mu = (\mathbb{Z}, \mathbb{Z}, \text{con-fails}, \text{trivial})$: conflation maps $\top$ to $\bot$, so the $D_\mu$ becomes the *zero d-frame*: $D_\mu \mapsto (0, 0, \text{trivial}, \text{trivial})$ — i.e., the $\bot$-firing-form.
- *$\bot$-firing* $D_\mu = (0, 0, \text{trivial}, \text{trivial})$: conflation maps $\bot$ to $\top$, so this becomes the $\top$-firing form: $D_\mu \mapsto (\mathbb{Z}, \mathbb{Z}, \text{con-fails}, \text{trivial})$.

So under $\mathbb{D}_{-}^{\mathrm{val}}$, **truth-only and falsity-only firings are individually fixed; $\bot$-firings and $\top$-firings exchange.**

The spatial duality $\mathbb{D}_{\mathrm{sp}}$ acts on the firing-ordinal indexing and the assembly structure but does not differentiate firings by their bilattice value (which is value-category content). For a settling $v$ to be self-dual under the composed $\mathbb{D}_{-}$, the value-category exchange ($\bot \leftrightarrow \top$) must be a *self*-action on the firing pattern — which happens iff there are no $\bot$-firings or $\top$-firings, i.e., every firing's value is in $\{\mathbf{t}, \mathbf{f}\}$.

The aperiodic-regime case generalises via the direct-limit structure of the [aperiodic-regime d-frame cohomology theorem](aperiodic-regime-d-frame-cohomology.md). $\square$

## What this gives

Three structural consequences:

**1. The conflation-self-dual stratum is complementary to the negation-self-dual stratum.** Negation-self-dual settlings have all firings in $\{\bot, \top\}$ (the void/fullness axis). Conflation-self-dual settlings have all firings in $\{\mathbf{t}, \mathbf{f}\}$ (the truth axis). These two strata partition the firing-pattern-self-dual settlings, with intersection only the trivial empty settling.

**2. Klein-four-equivariant classification.** Combining the negation and conflation theorems, the meta-aperiodic stratum (and its sub-strata) acquire a $\mathbb{Z}/2 \times \mathbb{Z}/2$-equivariant structure on the d-frame side, refining the strong-MLD theorem's (negation-only) orbit classification:

- **(neg-FP, con-FP) = (T, T)**: trivial settling only.
- **(T, F)**: settlings in the bilattice's $\{\bot, \top\}$ axis (negation-self-dual; conflation-active orbit).
- **(F, T)**: settlings in the bilattice's $\{\mathbf{t}, \mathbf{f}\}$ axis (conflation-self-dual; negation-active orbit). **Realised by Fibonacci and Thue-Morse with default labelings.**
- **(F, F)**: settlings with mixed firing types from both axes. Realised by Padovan, Tribonacci, Tetranacci.

**3. Klein-four-orbit type as a finer invariant.** Two settlings with the same negation orbit type can have different conflation orbit types (and vice versa). The full Klein-four orbit type — ordered tuple of $(\text{neg orbit type}, \text{con orbit type})$ — is strictly finer than either single-involution classification. This refines the strong-MLD invariant.

## Computational verification

Verified in [Klein-four self-duality on named substitutions](../examples/klein-four-self-duality-on-named-substitutions.md):

- **Fibonacci** (default labeling $a:\mathbf{t}, b:\mathbf{f}$): both letters in $\{\mathbf{t}, \mathbf{f}\}$, so conflation-FP self-dual. Confirmed.
- **Thue-Morse** (default labeling $0:\mathbf{f}, 1:\mathbf{t}$): both letters in $\{\mathbf{t}, \mathbf{f}\}$, so conflation-FP self-dual. Confirmed.
- **Padovan, Tribonacci** (default labeling $c:\top$): not all firings in $\{\mathbf{t}, \mathbf{f}\}$ (the $\top$-firing breaks it), so not conflation-FP self-dual. Confirmed.
- **Tetranacci** (default labeling uses $\bot, \top$): firings in both axes, so neither conflation-FP nor negation-FP self-dual. Confirmed.

## Position in the program

Closes the corpus's strong-MLD theorem family from "negation only" to "full Klein-four group." The bilattice's natural $\mathbb{Z}/2 \times \mathbb{Z}/2$ symmetry now acts in the corpus's classification framework, with both involutions giving complementary firing-pattern characterizations.

The headline structural finding: **the firing-pattern-self-duality classification has two complementary orthogonal axes** — the void/fullness axis (controlled by negation) and the truth axis (controlled by conflation). Settlings can be self-dual under either, both, or neither, giving four Klein-four orbit-type classes.

Pairs forward with [bilattice-klein-four-symmetry question](../questions/bilattice-klein-four-symmetry.md), which raised this question in the first place; with [klein-four self-duality table](../examples/klein-four-self-duality-on-named-substitutions.md), which provides the empirical verification; and with the [d-frame Verdier composition theorem](d-frame-verdier-composition.md), which is the negation-side parallel.
