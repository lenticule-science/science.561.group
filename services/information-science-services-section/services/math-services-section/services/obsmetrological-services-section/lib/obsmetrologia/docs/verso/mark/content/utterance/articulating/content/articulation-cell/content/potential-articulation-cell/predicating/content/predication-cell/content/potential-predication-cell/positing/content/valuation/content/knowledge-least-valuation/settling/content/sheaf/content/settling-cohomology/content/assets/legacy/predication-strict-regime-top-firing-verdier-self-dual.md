---
type: example
status: verified
depends-on: [d-frame-verdier-composition, q-enriched-curry-grothendieck-site, verdier-duality-bitopological-site, quantale-enriched-cosheaf, strict-regime-d-frame-computation, strict-regime-verdier-dual, d-frame-valued-sheaf]
instantiates: [d-frame-verdier-composition, verdier-duality-bitopological-site]
lineage: 1
---

# Verdier self-duality of the strict-regime ⊤-firing settling

A worked example complementing the [strict-regime Verdier dual](strict-regime-verdier-dual.md) (truth-only firing → exchange orbit). Here the increment is "told $P(a, a) = \top$" — a single ⊤-firing, the smallest paraconsistent strict-regime case. The settling is **strictly self-dual** under the composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$: the value-category swap fixes the d-frame structure up to canonical isomorphism, and the spatial Verdier (q-fuzzy with $q^{\mathrm{glob}} = 1$ in this example, matching the truth-only case's calculation) acts as identity-on-stalks. This concretizes the firing-pattern characterization of self-duality from the [d-frame Verdier composition theorem](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md).

**Lineage 1** instance: the L1 self-dual orbit case under the composed duality. Pairs with [strict-regime-verdier-dual](strict-regime-verdier-dual.md) (the L1 exchange-orbit case) — the two examples together exhibit the strong-MLD orbit-type stratification on the L1 single-cell base.

## Setup

Same scaffolding as the [strict-regime d-frame computation](strict-regime-d-frame-computation.md), with one change to the increment:

- $\mathbf{L} = \mathbf{2}$, $E = \{a\}$, $\Pi = \{P\}$, $\lambda = 2$, $\mathcal{C}$ trivial.
- Increment $u_1 = (\text{told } P(a, a) = \top)$ — i.e., simultaneously asserting both truth-positive and falsity-positive content for the cell.

Settling stages:

- $\tau = 0$: $v_0(P)(a, a) = \bot$.
- $\tau = 1$: $v_1(P)(a, a) = \bot \vee_k \top = \top$. The cell is paraconsistent.

This is a **⊤-firing**: both the truth-component and the falsity-component of the cell first appear at the same firing ordinal ($\tau = 1$). The settling is in the strict regime ($\kappa = 1 < \omega$).

## Newly-positive cells and Priestley dual

$$\Delta^{+}_0 = \Delta^{-}_0 = \emptyset, \qquad \Delta^{+}_1 = \{(a, a)\}, \qquad \Delta^{-}_1 = \{(a, a)\}.$$

Both newly-positive sets are non-empty at $\tau = 1$, in contrast to the truth-only example where $\Delta^{-}_1 = \emptyset$.

Dualized via the swap involution $\sigma$ on the paired Priestley space $\{+, -\}$:

$$\Delta^{+, *}_1 = \{((a, a), +)\}, \qquad \Delta^{-, *}_1 = \{((a, a), -)\}.$$

## d-frame-valued sheaf

The non-trivial section is at $(P, 1, U)$ for $U$ containing both Priestley points.

**At $(P, 1, \{+, -\})$:** the d-frame value is $\mathbb{F}_v(P, 1, \{+, -\}) = (L_+, L_-, \mathrm{con}, \mathrm{tot})$ with

- $L_+ = \mathcal{P}(\{((a, a), +)\}) = \{\emptyset,\, \{((a, a), +)\}\}$ — rank 1.
- $L_- = \mathcal{P}(\{((a, a), -)\}) = \{\emptyset,\, \{((a, a), -)\}\}$ — rank 1.

Both components are rank 1: the ⊤-firing populates both sides simultaneously.

- **Consistency.** A pair $(A, B) \in L_+ \times L_-$ is consistent iff $A$ and $B$ do not co-witness any cell as ⊤. The cell $(a, a)$ has both components present at $\tau = 1$, so the pair $(\{((a, a), +)\}, \{((a, a), -)\})$ co-witnesses the cell being ⊤ and is *excluded*:

$$\mathrm{con} = \{(\emptyset, \emptyset),\, (\{((a, a), +)\}, \emptyset),\, (\emptyset, \{((a, a), -)\})\}.$$

Three of the four possible pairs; the inconsistent one is removed. This is the structural fingerprint of the ⊤-firing.

- **Totality.** A pair $(A, B)$ is total iff $A$ covers the truth-side settled cells of $U$ and $B$ covers the falsity-side settled cells. Both sides have one settled cell at $\tau = 1$, so totality requires both components to be the singleton:

$$\mathrm{tot} = \{(\{((a, a), +)\},\, \{((a, a), -)\})\}.$$

The single total pair is precisely the inconsistent pair. This is the d-frame's encoding of "the cell is totally settled but cannot be consistently total" — the formal signature of ⊤.

**At $(P, 1, U)$ for $U \subsetneq \{+, -\}$:** components reduce by intersection with $U$, giving sub-cases without all four components. (The maximal section is what matters for the duality discussion.)

## Spatial Verdier dual via Layer 1 + Layer 2

The [Q-enriched Curry equivalence on Grothendieck sites](../theorems/q-enriched-curry-grothendieck-site.md) applies. The fiber-and-base-change calculation tracks the same way as the truth-only case:

- **Per-fiber Curry fuzziness.** Each fiber is essentially 0-dimensional (the entity set is a singleton, so the cellular structure on the paired Priestley fiber has at most a single non-trivial cell per stage). $q^{\mathrm{fib}} = 1$.
- **Base-change fuzziness.** Sheaf restriction along the settling-advancement morphism $0 \to 1$ is the inclusion $(\{\emptyset\}, \{\emptyset\}) \hookrightarrow (L_+, L_-)$ at the maximal-clopen section — Boolean inclusions on both components, strict left adjoints with strict right adjoints. $q^{\mathrm{bc}} = 1$.

So $q^{\mathrm{glob}} = 1$ again: the q-fuzzy Verdier specializes to a strict equivalence in this example, just as in the truth-only-firing case.

The spatial dual cosheaf has the same d-frame stalk at the maximal section, with cosheaf-extensions in place of sheaf-restrictions:

$$\check{\mathbb{F}}_v(P, 1, \{+, -\}) = (L_+,\, L_-,\, \check{\mathrm{con}},\, \check{\mathrm{tot}}).$$

## Value-category swap: $\mathbb{D}_{\mathrm{val}}(\mathbb{F}_v)$

Apply $L_+ \leftrightarrow L_-$ and the canonical relation-argument swap $\sigma$:

- $L_+' = $ original $L_- = \{\emptyset, \{((a, a), -)\}\}$.
- $L_-' = $ original $L_+ = \{\emptyset, \{((a, a), +)\}\}$.
- $\mathrm{con}' = \{(B, A) : (A, B) \in \mathrm{con}\} = \{(\emptyset, \emptyset),\, (\emptyset, \{((a, a), +)\}),\, (\{((a, a), -)\}, \emptyset)\}$ — same three "unswapped-but-relabeled" pairs.
- $\mathrm{tot}' = \{(\{((a, a), -)\},\, \{((a, a), +)\})\}$ — single pair, with components swapped.

**Comparison with the original.** The swapped d-frame $(L_+', L_-', \mathrm{con}', \mathrm{tot}')$ has the same combinatorial shape as $(L_+, L_-, \mathrm{con}, \mathrm{tot})$: rank-1 truth-side, rank-1 falsity-side, three-out-of-four consistency, single inconsistent total pair. The structural fingerprint is preserved.

Concretely, the canonical bilattice-negation involution on the original d-frame — sending $((a, a), +) \mapsto ((a, a), -)$ and vice versa — is an isomorphism

$$\mathbb{F}_v(P, 1, \{+, -\}) \;\xrightarrow{\;\cong\;}\; \mathbb{D}_{\mathrm{val}}(\mathbb{F}_v)(P, 1, \{+, -\}).$$

So $\mathbb{D}_{\mathrm{val}}$ fixes $\mathbb{F}_v$ up to canonical isomorphism. **The settling is value-category-self-dual.**

## Composed duality: self-duality of the ⊤-firing

The composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$ on this example:

1. $\mathbb{D}_{\mathrm{val}}(\mathbb{F}_v) \cong \mathbb{F}_v$ (canonical bilattice-negation isomorphism).
2. $\mathbb{D}_{\mathrm{sp}}$ on $\mathbb{F}_v$ produces $\check{\mathbb{F}}_v$ — same stalks, cosheaf structure — with $q^{\mathrm{glob}} = 1$ specializing the q-fuzzy equivalence to strict equivalence.

Composing: $\mathbb{D}(\mathbb{F}_v) \cong \check{\mathbb{F}}_v$, with the canonical sheaf-cosheaf identification (Curry equivalence map at $q^{\mathrm{glob}} = 1$) followed by the canonical bilattice-negation isomorphism. **The settling is strictly self-dual under $\mathbb{D}$.**

## Contrast: truth-only firing vs ⊤-firing

The two strict-regime worked examples now exhibit the two orbit-types of the composed duality:

| Example | Increment | Firing type | $L_+$ rank | $L_-$ rank | $\mathbb{D}$-orbit |
|---|---|---|---|---|---|
| [strict-regime-verdier-dual](strict-regime-verdier-dual.md) | told $\mathbf{t}$ | truth-only | 1 | 0 | exchange (size 2): $\{v, \neg v\}$ |
| (this example) | told $\top$ | ⊤-firing | 1 | 1 | self-dual (size 1): $\{v\}$ |

The truth-only-firing settling exchanges with its negation $\neg v$ (which is the falsity-only settling); the ⊤-firing settling is its own negation up to canonical isomorphism, and so its $\mathbb{D}$-orbit is a singleton.

A symmetric "told $\mathbf{f}$" example would mirror the first row: $L_+$ rank 0, $L_-$ rank 1, exchange orbit with the truth-only case. We don't write that one out separately — it is the $\mathbb{D}_{\mathrm{val}}$-image of the truth-only example, which is the content of *that* example's orbit-classification section.

## What this validates

1. **The firing-pattern characterization of self-duality holds on a concrete strict-regime case.** The [d-frame Verdier composition theorem](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md) predicts: a settling is self-dual iff every firing is a ⊤-firing. This example has a single ⊤-firing and is self-dual; the truth-only example has a single truth-only firing and is in an exchange orbit. The two examples together cover the simplest non-trivial cases of the characterization.

2. **The Layer 1 + Layer 2 spatial Verdier specializes cleanly when fuzziness collapses.** Both worked examples have $q^{\mathrm{glob}} = 1$ (essentially-trivial fibers, strict-adjoint base-changes), so the abstract q-fuzzy duality reduces to strict equivalence in both. The framework lands the right answer where the answer is computable directly.

3. **The d-frame structure encodes ⊤ as "totally-settled but consistency-violating".** The single total pair of the d-frame is precisely the inconsistent pair — a precise structural fingerprint of the ⊤-firing that the bilattice-negation swap preserves.

## Position in predication categories

This example pairs with [strict-regime-verdier-dual](strict-regime-verdier-dual.md) to give the chapter's two minimal strict-regime instances of the composed-duality classification. Together they exhibit:

- Exchange orbits (truth-only and falsity-only firings — paired under $\mathbb{D}$).
- Self-dual orbits (⊤-firings — fixed under $\mathbb{D}$).

The next concrete examples to develop:

- **A non-trivial-fiber example** with multiple entities, where the cellular fiber is no longer essentially a point. Worked through in the [two-cell strict-regime Curry example](strict-regime-two-cell-curry.md): the maximal-section fiber is a 1-dim cell complex (2 vertices + 1 edge), and the example documents an honest accounting of why $q^{\mathrm{glob}} = 1$ persists (Boolean d-frame data is too rigid for the q-fuzzy theory's quantale-graded error to bite — that requires non-Boolean value categories).
- **A mixed-firing example** combining truth-only and ⊤-firings, demonstrating how partial self-duality decomposes the orbit structure into self-dual and exchange components per-firing. The corpus's [mixed-stratum two-firing settling](mixed-stratum-two-firing-settling.md) has the right shape but lives in the transfinite-bounded regime, currently outside the Layer 1+2 scope.
