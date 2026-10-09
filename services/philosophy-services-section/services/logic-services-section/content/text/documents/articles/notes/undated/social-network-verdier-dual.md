---
kind: example
status: verified
depends-on: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, q-enriched-curry-finite-graph, d-frame-verdier-composition, strict-regime-two-cell-curry, relational-database-settling]
instantiates: [verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site]
lineage: 2
title: Verdier dual of a social-network settling with non-trivial cellular fiber
description: "A worked Verdier-duality computation on a Lineage 2 settling: the L2 social-network base ($E = \\{a, b\\}$, $a, b$ for Alice and Bob; single predicate $P$ for Likes) with two firings of different evidence sides — \"Alice likes Bob\"…"
---

# Verdier dual of a social-network settling with non-trivial cellular fiber

A worked Verdier-duality computation on a **Lineage 2** settling: the L2 social-network base ($E = \{a, b\}$, $a, b$ for Alice and Bob; single predicate $P$ for Likes) with two firings of *different* evidence sides — "Alice likes Bob" ($\mathbf{t}$ at $(a, b)$) and "Bob does not like Alice" ($\mathbf{f}$ at $(b, a)$).

This is the corpus's first example where the d-frame stalk has *both* $L_+$ and $L_-$ non-trivial (rank 1 each, on disjoint cells). It exercises the cellular extension plan's Layer 2 machinery on a setting where the cellular fiber is genuinely non-trivial AND the d-frame structure has substantive consistency / totality content.

## Setup

Same base as [strict-regime-two-cell-curry](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/strict-regime-two-cell-curry.md) but with a richer increment sequence:

- $\mathbf{L} = \mathbf{2}$, $E = \{a, b\}$ (Alice, Bob), $\Pi = \{P\}$ ($P$ for Likes), $\mathcal{C}$ trivial.
- Settling bound $\lambda = 3$.
- Increments: $u_1 = (\text{told } P(a, b) = \mathbf{t})$ — "Alice likes Bob"; $u_2 = (\text{told } P(b, a) = \mathbf{f})$ — "Bob does not like Alice."

Settling stages:
- $\tau = 0$: all $\bot$.
- $\tau = 1$: $v_1(P)(a, b) = \mathbf{t}$, others $\bot$.
- $\tau = 2$: $v_2(P)(a, b) = \mathbf{t}$, $v_2(P)(b, a) = \mathbf{f}$, others $\bot$. Quiescent.

Strict regime, $\kappa = 2$. Two firings on *distinct cells with distinct evidence sides*.

## Cells and Priestley structure at $\tau = 2$

Newly-truth-positive: $\Delta^+_2 = \{(a, b)\}$. Newly-falsity-positive: $\Delta^-_2 = \{(b, a)\}$.

Dualized: $\Delta^{+,*}_2 = \{((a, b), +)\}$, $\Delta^{-,*}_2 = \{((b, a), -)\}$. Two distinct Priestley points on opposite sides.

The cellular fiber's clopen lattice has 4 elements (the 2-point Priestley space's clopens), forming a 1-dim cellular complex with 2 vertices and 1 edge — same shape as [strict-regime-two-cell-curry](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/strict-regime-two-cell-curry.md) but with the two cells on *different evidence sides*.

## d-frame stalk at maximal section

At $(P, 2, \{((a, b), +), ((b, a), -)\})$:

- $L_+ = \mathcal{P}(\{((a, b), +)\}) = \{\emptyset, \{((a, b), +)\}\}$ — rank 1 (truth-side).
- $L_- = \mathcal{P}(\{((b, a), -)\}) = \{\emptyset, \{((b, a), -)\}\}$ — rank 1 (falsity-side).
- $\mathrm{con}$: a pair $(A, B) \in L_+ \times L_-$ is consistent iff no cell has both truth-positive AND falsity-positive content. Since $(a, b) \neq (b, a)$, **no pair co-witnesses any cell as $\top$** — consistency holds for *all* four pairs:

$$\mathrm{con} = \{(\emptyset, \emptyset),\, (\{((a, b), +)\}, \emptyset),\, (\emptyset, \{((b, a), -)\}),\, (\{((a, b), +)\}, \{((b, a), -)\})\}.$$

- $\mathrm{tot}$: a pair $(A, B)$ is total iff covers settled cells on both sides. Only the full pair:

$$\mathrm{tot} = \{(\{((a, b), +)\}, \{((b, a), -)\})\}.$$

This is *structurally distinct* from the L1 ⊤-firing case (where consistency *fails* on the singleton total pair) — here both rank-1 components live on different cells, so consistency is preserved and totality requires both.

## Verdier dual via Layer 2

Apply the [Q-enriched Curry on Grothendieck sites](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/theorems/q-enriched-curry-grothendieck-site.md). The cellular fiber is the same 2-vertex 1-edge complex as [strict-regime-two-cell-curry](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/strict-regime-two-cell-curry.md), so the per-fiber Curry fuzziness $q^{\mathrm{fib}}$ collapses to 1 for the same reason (Boolean d-frame data, strict-adjoint inclusions). Base-change fuzziness across $\tau \to \tau+1$ is also 1.

So $q^{\mathrm{glob}} = 1$: strict equivalence.

The cosheaf $\check{\mathbb{F}}_v$ has the same stalks as $\mathbb{F}_v$, with cosheaf-extensions in place of sheaf-restrictions. At the maximal section:

$$\check{\mathbb{F}}_v(P, 2, \{((a, b), +), ((b, a), -)\}) \;=\; (L_+, L_-, \check{\mathrm{con}}, \check{\mathrm{tot}})$$

with the same components and the dualized relations.

## Composed duality $\mathbb{D}$ — exhibits the truth/falsity-pair structure

Apply $\mathbb{D}_{\mathrm{val}}$ (value-category swap):

- $L_+' = $ original $L_- = \{\emptyset, \{((b, a), -)\}\}$.
- $L_-' = $ original $L_+ = \{\emptyset, \{((a, b), +)\}\}$.

Under negation $\neg$, the cell $(a, b)$ on truth-side maps to $(a, b)$ on falsity-side; $(b, a)$ on falsity-side maps to $(b, a)$ on truth-side. So $\mathbb{D}_{\mathrm{val}}$ maps:

- "Alice likes Bob" ($\mathbf{t}$ at $(a, b)$) $\leftrightarrow$ "Alice does not like Bob" ($\mathbf{f}$ at $(a, b)$).
- "Bob does not like Alice" ($\mathbf{f}$ at $(b, a)$) $\leftrightarrow$ "Bob likes Alice" ($\mathbf{t}$ at $(b, a)$).

The negation-image $\neg v$ is the settling where Alice does not like Bob AND Bob likes Alice — the *reverse* social pattern.

Composed $\mathbb{D}(v) = $ the cosheaf for $\neg v$. Under the composed duality, $v$ is paired with $\neg v$ as an exchange-orbit pair.

## What this exhibits

Three structural observations:

**1. The d-frame's consistency relation has substantive content here.** Where the L1 ⊤-firing example had consistency *fail* on the single inconsistent total pair, this L2 example has consistency *hold* on all pairs (because the cells are distinct). The d-frame structure tracks "no inconsistency" as a feature, not just as a vacuous case.

**2. The exchange-orbit pair is concrete.** The composed-duality pairing $v \leftrightarrow \neg v$ is exhibited explicitly: "Alice likes Bob, Bob does not like Alice" pairs with "Alice does not like Bob, Bob likes Alice." Both are MLD-distinct from the all-$\bot$ settling, but they're MLD-paired with each other under negation.

**3. The L2 setting makes the orbit-type semantically interpretable.** Truth-only firings on social-network claims correspond to "asserted positive" facts; falsity-only firings to "asserted negative" facts. The composed duality exchanges these — exactly the semantic operation the framework predicts.

## Position in Lineage 2

The L2 instance for the Verdier-duality chapter. With the cellular fiber non-trivial and the d-frame structure substantive (both $L_+$ and $L_-$ rank 1), this example exhibits more of the framework's content than the L1 single-cell cases. Pairs forward with [social-network-strong-mld-orbits](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/social-network-strong-mld-orbits.md), which makes the strong-MLD orbit-type stratification explicit on this base.
