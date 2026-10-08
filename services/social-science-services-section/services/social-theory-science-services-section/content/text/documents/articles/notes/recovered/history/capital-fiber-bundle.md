---
type: definition
class: fiber-bundle
status: draft
symbol: "\\mathcal{K}_{\\mathrm{cap}}"
depends-on: [social-base, social-settling, predication-fiber-algebra, social-position]
realizes: [social-position, social-field]
---

# Capital fiber bundle

The multi-dimensional capital structure of a social formation, realized as a family of [predication fiber algebras](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over the social base, one per capital type:

$$\mathcal{K}_{\mathrm{cap}} \;=\; \bigl(\mathcal{K}^{\mathrm{eco}},\; \mathcal{K}^{\mathrm{cul}},\; \mathcal{K}^{\mathrm{soc}},\; \mathcal{K}^{\mathrm{sym}}\bigr)$$

corresponding to Bourdieu's four capital types — economic, cultural, social, and symbolic — plus any field-specific subtypes. Each component is a bilattice-valued fiber algebra over the social entity set:

$$\mathcal{K}^{\mathrm{eco}} \;=\; A_{\texttt{holds-economic-capital}} \;=\; \mathbf{2}^{\bowtie\, E_{\mathrm{soc}} \times E_{\mathrm{soc}}}$$

and similarly for the other types, with appropriate relata (cultural capital is held in relation to a field, social capital in relation to a network, symbolic capital in relation to a recognizing audience).

## The four-state reading for capital cells

| $v(\langle e, \texttt{holds-economic-capital}, c\rangle)$ | Reading |
|---|---|
| $\bot$ | No information: whether $e$ holds capital type $c$ is unknown |
| $\mathbf{t}$ | Positive: $e$'s holding of $c$ is witnessed (documented assets, credentials, network ties, recognition events) |
| $\mathbf{f}$ | Negative: $e$'s absence of $c$ is witnessed (documented exclusion, non-recognition, lack of credential) |
| $\top$ | Contradicted: competing witnesses — $e$ both holds and does not hold $c$ (contested legitimacy, disputed credentials, recognition conflict) |

The $\top$ state is sociologically significant: it is the substrate representation of *symbolic struggle* — a conflict over the legitimate assignment of capital. Bourdieu's analysis of cultural distinction is in part the analysis of how these $\top$ states arise (when agents contest the valuation of capital) and how they are resolved (when the dominant faction imposes its valuation, settling the cell back toward $\mathbf{t}$ or $\mathbf{f}$).

## Capital sections

The *capital section of agent $e$* is the function

$$\kappa_e : (\text{cap-type}, c) \mapsto v(\langle e, \texttt{holds-cap-type}, c\rangle)$$

— the row of $\mathcal{K}_{\mathrm{cap}}$ at $e$. The capital section is the substrate-algebraic representation of the agent's capital *portfolio*: the bilattice-valued distribution of their economic, cultural, social, and symbolic holdings.

## Capital conversion as predicate morphism

Capital types are convertible: economic capital can purchase cultural capital (private schooling), cultural capital can generate symbolic capital (academic consecration), social capital enables economic accumulation (network-mediated access). Conversion is represented as a morphism in $\mathcal{C}_{\mathrm{soc}}$ from one capital-type predicate to another, carrying a bilattice-valued *conversion rate* (how much of the source capital type's $\mathbf{t}$-value carries through to the target predicate).

The conversion is not lossless: the [predicate-specialization morphism](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) applied to a capital conversion has a kernel — it maps $\mathbf{t}$ in the source to a value that may be only $\mathbf{t}$ or $\bot$ in the target depending on whether the agent has the additional conditions (field membership, recognized conversion right) that the conversion rule requires.

## Symbolic capital and misrecognition

Symbolic capital is distinctive: it is capital *misrecognized as something other than capital* — recognized as merit, talent, breeding, natural distinction. The misrecognition is the substrate operation of [symbolic violence](../morphisms/symbolic-violence.md): the morphism that maps $\top$ states (the contradiction between objective capital inequality and legitimate-merit ideology) to $\mathbf{t}$ states on symbolic capital cells by suppressing the contradicting evidence.

Agents who hold high symbolic capital are those for whom the `holds-symbolic-capital` cell is settled at $\mathbf{t}$ *and* the `symbolic-capital-is-recognized-as-merit` cell is settled at $\mathbf{t}$. The double settlement constitutes the naturalization of privilege: not only is the agent recognized as holding capital, but the form of recognition denies that what is recognized is capital.

## Volume and composition

An agent's *capital volume* is the knowledge-order join across all capital types:

$$\mathrm{vol}(e) \;=\; \bigvee_{(\text{type}, c)}^{(k)} v(\langle e, \texttt{holds-cap-type}, c\rangle)$$

Their *capital composition* is the truth-order distribution across types — whether they hold primarily economic capital, cultural capital, or social capital. Volume places the agent on the vertical axis of the social space; composition places them on the horizontal axis. Both are substrate-derivable from the capital fiber bundle sections.
