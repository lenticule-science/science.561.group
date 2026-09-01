---
kind: example
status: verified
depends-on: [verdier-duality-bitopological-site, d-frame-verdier-composition, q-enriched-curry-grothendieck-site, quantale-enriched-cosheaf, strict-regime-d-frame-computation, d-frame-valued-sheaf]
instantiates: [verdier-duality-bitopological-site, d-frame-verdier-composition]
lineage: 1
---

# Verdier dual of the single-cell strict-regime settling

A worked example computing the d-frame Verdier dual of the [strict-regime single-cell settling](strict-regime-d-frame-computation.md). Shows the duality concretely and verifies the composed-duality classification: the example's settling has only a truth-only firing, so it lies in a non-self-dual orbit; its $\mathbb{D}$-image is the cosheaf for the negation-settling (which has only a falsity-only firing).

**Lineage 1** instance: the Verdier dual computation on the L1 single-cell base, exhibiting the exchange-orbit case (truth-only $\leftrightarrow$ falsity-only) of the composed-duality classification. Pairs with [strict-regime-top-firing-verdier-self-dual](strict-regime-top-firing-verdier-self-dual.md) which exhibits the L1 self-dual orbit instance.

## Setup

Recap from [strict-regime d-frame computation](strict-regime-d-frame-computation.md): $\mathbf{L} = \mathbf{2}$, $E = \{a\}$, single predicate $P$, $\lambda = 2$, increment $u_1 = $ told $P(a, a) = \mathbf{t}$.

The d-frame-valued sheaf $\mathbb{F}_v$ at the maximal section $(P, 1, \{+, -\})$:

$$\mathbb{F}_v(P, 1, \{+, -\}) = \bigl(\mathcal{P}(\{((a,a), +)\}),\, \{\emptyset\},\, \mathrm{con}_{\mathrm{global}},\, \mathrm{tot}_{\mathrm{global}}\bigr).$$

$L_+$ rank 1 (the truth-positive cell $(a, a)$); $L_-$ rank 0 (no falsity-positive cells); consistency is trivial; totality requires the full $L_+$ element.

## Spatial Verdier dual: $\mathbb{D}_{\mathrm{sp}}(\mathbb{F}_v)$ via Layer 1 + Layer 2

The [Q-enriched Curry equivalence on Grothendieck sites](../theorems/q-enriched-curry-grothendieck-site.md) applies to this setting: the bitopological settling site is fibered cellular, and the strict regime makes every fiber finite-cellular. The spatial Verdier dual $\check{\mathbb{F}}_v$ is the cosheaf produced by the Curry equivalence, q-fuzzy-equivalent to $\mathbb{F}_v$ with global fuzziness $q^{\mathrm{glob}}$ as specified by the Grothendieck-site theorem.

**Fuzziness in this example.** The Curry global fuzziness has two factors: per-fiber fuzziness and base-change fuzziness. Each fiber is essentially a point (single-element entity set, single predicate), so the per-fiber Curry fuzziness collapses to $q^{\mathrm{fib}} = 1$ (no edges, no cycles, no higher cells contribute). The base-change is across the settling-advancement morphism $0 \to 1$; for the "told $P(a, a) = \mathbf{t}$" increment, the sheaf restriction along $0 \to 1$ is the inclusion $\emptyset \hookrightarrow \{((a,a), +)\}$ of subsets in the Boolean stalk, which is a strict left adjoint with strict right adjoint (its "remove the new cell" projection). Hence the base-change fuzziness is also $q^{\mathrm{bc}} = 1$.

So $q^{\mathrm{glob}} = 1$: in this strict-regime example, the q-fuzzy Verdier duality reduces to a strict equivalence.

For the maximal section, the cosheaf is:

$$\check{\mathbb{F}}_v(P, 1, \{+, -\}) = \bigl(\mathcal{P}(\{((a,a), +)\}),\, \{\emptyset\},\, \check{\mathrm{con}},\, \check{\mathrm{tot}}\bigr).$$

The spatial duality acts as identity-on-stalks here because each cellular fiber is 0-dimensional (a single cell). The non-trivial structural information lives in the variance-reversed extension/restriction maps, which the Curry equivalence concretizes: cosheaf extensions are the (strict, in this example) right adjoints of the sheaf restrictions.

## Value-category swap: $\mathbb{D}_{\mathrm{val}}(\mathbb{F}_v)$

Apply the bilattice negation swap $L_+ \leftrightarrow L_-$ to each stalk:

$$\mathbb{D}_{\mathrm{val}}(\mathbb{F}_v)(P, 1, \{+, -\}) = \bigl(\{\emptyset\},\, \mathcal{P}(\{((a,a), +)\}),\, \mathrm{con}_{\mathrm{swapped}},\, \mathrm{tot}_{\mathrm{swapped}}\bigr).$$

Now $L_+$ is rank 0 (no truth-positive cells), $L_-$ is rank 1 (the cell $(a, a)$ now appearing as falsity-positive).

## What this dualized sheaf is concretely

The value-category-swapped sheaf $\mathbb{D}_{\mathrm{val}}(\mathbb{F}_v)$ is exactly the d-frame-valued sheaf one would get from the **negated settling** $\neg v$ — the settling where the increment was "told $P(a, a) = \mathbf{f}$" instead of "told $P(a, a) = \mathbf{t}$". The cell $(a, a)$ at $\tau = 1$ has the falsity-component first appearing at $\tau = 1$, with no truth-component.

This is a concrete instance of the structural claim from the [d-frame Verdier composition theorem](../theorems/d-frame-verdier-composition.md): truth-only firings exchange with falsity-only firings under $\mathbb{D}_{\mathrm{val}}$.

## Composed duality: $\mathbb{D}(\mathbb{F}_v) = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}(\mathbb{F}_v)$

Composing: take $\mathbb{D}_{\mathrm{val}}(\mathbb{F}_v)$ (the negated-settling sheaf) and apply spatial Verdier (identity-on-stalks here, with $q^{\mathrm{glob}} = 1$) to get a cosheaf with the same stalk structure.

$$\mathbb{D}(\mathbb{F}_v) = \bigl(\{\emptyset\},\, \mathcal{P}(\{((a,a), +)\}),\, \check{\mathrm{con}}_{\mathrm{swapped}},\, \check{\mathrm{tot}}_{\mathrm{swapped}}\bigr) \;\;\text{as a cosheaf.}$$

This is the **cosheaf for the negated settling** $\neg v$.

## Orbit classification

The settling $v$ (with truth-only firing at $\tau = 1$) is **not self-dual** under $\mathbb{D}$. Its orbit under $\mathbb{D}$ has size 2:

- $\{v, \neg v\}$ — the original settling and its negation, both encoded as d-frame-valued sheaves on the bitopological settling site.

By the [composed-duality classification](../theorems/d-frame-verdier-composition.md), this is the **truth/falsity-paired orbit** — a non-self-dual exchange orbit.

To exhibit a self-dual settling, one would need a $\top$-firing — e.g., increment $u_1 = $ "told both $P(a, a) = \mathbf{t}$ AND $P(a, a) = \mathbf{f}$" simultaneously, giving $v_1(P)(a, a) = \top$. The resulting d-frame-valued sheaf would be self-dual under $\mathbb{D}$.

## Reading

This worked example validates the composed-duality theorem on a concrete finite case. Three things are visible:

1. **The composition is computable.** Spatial Verdier is small (trivial on 0-dim fibers, with $q^{\mathrm{glob}} = 1$ for this strict-adjoint case); the value-category swap is direct.
2. **The duality has structural meaning.** The Verdier dual of a sheaf for a settling $v$ is the cosheaf for the negated settling $\neg v$. This is a precise relationship between the spatial-cohomological duality and the bilattice-negation involution.
3. **Self-duality requires $\top$-firings.** A settling with no $\top$-firings (only truth-only or falsity-only firings) is in an exchange orbit; its $\mathbb{D}$-image is a different settling. Self-dual settlings are exactly those where every firing has both evidence components.

## Position in the program

This is the chapter's first concrete instance of the composed duality. It validates the theorem on a finite case and previews what richer instances would compute. Natural next examples:

- A two-cell settling with both truth-only and falsity-only firings, demonstrating exchange orbits with non-trivial stalk structure.
- A $\top$-firing settling ([mixed-stratum two-firing settling](mixed-stratum-two-firing-settling.md) is the corpus's existing example), demonstrating self-duality concretely.

Each strengthens the duality framework's grounding and surfaces what the framework predicts for non-trivial cases.
