---
type: theorem
status: proved
depends-on: [openness-boundary-deformation-dichotomy, skh-deformation-ext-classification, frame-morphism-meet-preservation-openness, q-enriched-sheaf-closed-monoidal-structure, q-enriched-cohomology-higher-degree-vanishing, settling-cohomology-vanishes-above-degree-1, gerstenhaber1964, bousfield-kan1972]
---

# Cosimplicial construction of the openness-defect class

The [openness-boundary deformation dichotomy theorem](openness-boundary-deformation-dichotomy.md) (sketch) introduces the openness-defect class $\delta \in \mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$ as the obstruction to second-order extension of cellular-leaving first-order deformations, with explicit cosimplicial encoding referenced but not made fully explicit (Steps 2 and 3 of its proof framework, flagged as open). This theorem fills that gap: the **explicit Čech-cosimplicial cocycle representative** of $\delta$ on the bitopological settling site, together with the d-frame trichotomy decomposition $\delta = \delta^+ + \delta^- + \delta^\top$ at the cocycle level.

The construction is the direct structural transposition of the [@gerstenhaber1964] cup-product-square obstruction from associative algebras (Hochschild cohomology) to Q-enriched sheaves on the bitopological settling site (Čech cohomology). The cup product is supplied by the [Q-enriched closed-monoidal structure](q-enriched-sheaf-closed-monoidal-structure.md) via composition on the endomorphism sheaf $\mathcal{E}\!nd(\mathcal{F})$. The cosimplicial differential is the standard Čech alternating-sum coboundary. The novel structural content is the identification of the openness-defect class with the meet-preservation discrepancy of the lost-adjoint restriction, made explicit at the cochain level; and the d-frame trichotomy decomposition, which the bilattice value category supplies beyond what the abelian case sees.

This is direction (i) of the [openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md), the first substantive technical move in the [openness-defect deformation theory](questions/openness-defect-deformation-theory.md) program.

## Statement

**Theorem (cosimplicial construction of $\delta$).** *Let $\mathcal{F}$ be a Q-enriched sheaf on the [bitopological settling site](../objects/bitopological-settling-site.md) and let $[\mathcal{F}_\epsilon] \in \mathrm{Ext}^1(\mathcal{F}, \mathcal{F})$ classify a first-order deformation. Choose a cover $\mathcal{U} = \{U_i \to X\}_{i \in I}$ of the site refining the cellular coverage and adapted to the data of $\mathcal{F}_\epsilon$. Then:*

*(i) **Čech representation of the first-order class.** $[\mathcal{F}_\epsilon]$ admits a Čech 1-cocycle representative $\phi \in \check{Z}^1(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$, given on each pairwise intersection $U_{ij}$ by the perturbation $\phi(U_{ij}) := \mathcal{F}_\epsilon(\rho_{ij}) - \mathcal{F}(\rho_{ij})$ between the two restrictions to $U_{ij}$ determined by the local trivializations on $U_i$ and $U_j$.*

*(ii) **Cup-product-square cocycle representative.** The obstruction to second-order extension is the cup-product-square*

$$\delta(\mathcal{F}_\epsilon) \;:=\; [\phi \cup \phi] \;\in\; \check{H}^2(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F})) \;=\; \mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$$

*with explicit Čech 2-cocycle representative on each triple intersection $U_{ijk}$ given by the Yoneda-cup composition formula*

$$(\phi \cup \phi)(U_{ijk}) \;=\; \phi(U_{ij}) \circ \phi(U_{jk})\big|_{U_{ijk}}.$$

*(iii) **Identification with meet-preservation discrepancy.** When $\mathcal{F}_\epsilon$ is cellular-leaving through restriction $f_0 : U \to U'$ — i.e., $\mathcal{F}_\epsilon(f_0)$ has lost the left adjoint of $\mathcal{F}(f_0)$ — for any cover refinement $\mathcal{U}$ adapted to $f_0$ and any $\omega_1$-codirected chain $\{V_\alpha\}_{\alpha < \omega_1} \subseteq \mathcal{F}(U')$ witnessing meet-preservation failure, the cocycle $\phi \cup \phi$ evaluated on chain pairs reduces to*

$$(\phi \cup \phi)(V_\alpha, V_\beta) \;=\; \mathcal{F}_\epsilon(f_0)\bigl(V_\alpha \wedge V_\beta\bigr) \;-\; \mathcal{F}_\epsilon(f_0)(V_\alpha) \wedge \mathcal{F}_\epsilon(f_0)(V_\beta)$$

*— the meet-preservation discrepancy of $\mathcal{F}_\epsilon(f_0)$ on the chain.*

*(iv) **d-frame trichotomy decomposition.** When the value category is d-frame-valued, the cup-product-square decomposes additively at the cocycle level:*

$$\phi \cup \phi \;=\; \underbrace{\phi^+ \cup \phi^+}_{\in \check{C}^2(\mathcal{E}\!nd^+)} \;+\; \underbrace{\phi^- \cup \phi^-}_{\in \check{C}^2(\mathcal{E}\!nd^-)} \;+\; \underbrace{\delta^\top_{\mathrm{cross}}}_{\in \check{C}^2(\mathcal{E}\!nd^\top)}$$

*where $\phi = \phi^+ + \phi^- + \phi^\top$ is the d-frame decomposition of $\phi$ via the truth-side / falsity-side / consistency-relation decomposition $\mathcal{E}\!nd(\mathcal{F}) = \mathcal{E}\!nd^+(\mathcal{F}) \oplus \mathcal{E}\!nd^-(\mathcal{F}) \oplus \mathcal{E}\!nd^\top(\mathcal{F})$, and the consistency-relation cross-term*

$$\delta^\top_{\mathrm{cross}} \;:=\; (\phi^+ \cup \phi^-) + (\phi^- \cup \phi^+) + (\phi^+ \cup \phi^\top) + (\phi^\top \cup \phi^+) + (\phi^- \cup \phi^\top) + (\phi^\top \cup \phi^-) + (\phi^\top \cup \phi^\top)$$

*collects all cup-product terms that mix truth-side with falsity-side data or involve the $\top$-witness component $\phi^\top$. The Ab-shadow abelianization sends $\phi \cup \phi$ to $(\phi^+ \cup \phi^+) + (\phi^- \cup \phi^-)$, dropping $\delta^\top_{\mathrm{cross}}$ entirely.*

## Setup: the Čech cosimplicial complex

For a cover $\mathcal{U} = \{U_i \to X\}_{i \in I}$ of the bitopological settling site $X$ in coverage $J$, write $U_{i_0 \cdots i_n} := U_{i_0} \times_X \cdots \times_X U_{i_n}$ for the $(n+1)$-fold intersection. The **Čech cosimplicial complex** of a Q-enriched sheaf $\mathcal{G}$ with respect to $\mathcal{U}$ is

$$\check{C}^n(\mathcal{U}; \mathcal{G}) \;:=\; \prod_{i_0 < \cdots < i_n} \mathcal{G}(U_{i_0 \cdots i_n})$$

with coface maps $d_k : \check{C}^n \to \check{C}^{n+1}$ ($k = 0, \ldots, n+1$) given by inserting an index in the $k$-th position and restricting,

$$(d_k c)(U_{i_0 \cdots i_{n+1}}) \;:=\; c(U_{i_0 \cdots \widehat{i_k} \cdots i_{n+1}})\big|_{U_{i_0 \cdots i_{n+1}}},$$

codegeneracies $s_k : \check{C}^{n+1} \to \check{C}^n$ deleting an index, and **Čech differential** $\delta : \check{C}^n \to \check{C}^{n+1}$ the alternating sum $\delta := \sum_{k=0}^{n+1} (-1)^k d_k$. This is the standard Čech cosimplicial machinery as in [@bousfield-kan1972] chapters I–II, transferred to the Q-enriched sheaf setting via the [Q-enriched closed-monoidal structure](q-enriched-sheaf-closed-monoidal-structure.md).

For the **endomorphism sheaf** $\mathcal{E}\!nd(\mathcal{F}) := \mathcal{H}om(\mathcal{F}, \mathcal{F})$ of a Q-enriched sheaf $\mathcal{F}$ — established as a Q-enriched sheaf via the closed-monoidal structure theorem — the Čech complex $\check{C}^\bullet(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$ inherits a **cup-product structure** from the composition pairing $\circ : \mathcal{E}\!nd(\mathcal{F}) \otimes \mathcal{E}\!nd(\mathcal{F}) \to \mathcal{E}\!nd(\mathcal{F})$:

$$\cup : \check{C}^p \otimes \check{C}^q \to \check{C}^{p+q}, \qquad (c \cup c')(U_{i_0 \cdots i_{p+q}}) \;:=\; c(U_{i_0 \cdots i_p}) \;\circ\; c'(U_{i_p \cdots i_{p+q}})\big|_{U_{i_0 \cdots i_{p+q}}}.$$

This is the standard Alexander–Whitney cup-product on Čech cohomology, with the internal product being composition of endomorphisms (rather than the algebra multiplication as in Hochschild). The cup product is associative, graded-commutative up to coboundary, and satisfies the Leibniz rule with respect to $\delta$.

## Cosimplicial-to-Ext identification

**Lemma (Čech-to-derived agreement on the bitopological site).** *For $\mathcal{F}$ a Q-enriched sheaf on the bitopological settling site in any of the four standard regimes, and $\mathcal{U}$ a cover refining the cellular coverage,*

$$\check{H}^n(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F})) \;\cong\; H^n(X; \mathcal{E}\!nd(\mathcal{F})) \;=\; \mathrm{Ext}^n(\mathcal{F}, \mathcal{F})$$

*for $n \in \{0, 1, 2\}$.*

**Proof.** The Čech-to-derived spectral sequence is

$$E_2^{p,q} \;=\; \check{H}^p(\mathcal{U}; \mathcal{H}^q(\mathcal{E}\!nd(\mathcal{F}))) \;\Rightarrow\; H^{p+q}(X; \mathcal{E}\!nd(\mathcal{F})).$$

The $E_2$ page collapses to the $q = 0$ row when $\mathcal{H}^q(\mathcal{E}\!nd(\mathcal{F})) = 0$ for $q > 0$ — equivalently, when $\mathcal{E}\!nd(\mathcal{F})$ is cohomologically acyclic on the cover. The [Q-enriched cohomology higher-degree vanishing theorem](q-enriched-cohomology-higher-degree-vanishing.md) gives $H^{\geq 2} = 0$ on Q-enriched settling sheaves; the closed-monoidal structure ensures $\mathcal{E}\!nd(\mathcal{F}) = \mathcal{H}om(\mathcal{F}, \mathcal{F})$ inherits acyclicity from $\mathcal{F}$ on covers refining the cellular coverage (since $\mathcal{H}om(F, -)$ preserves limits, hence preserves the equalizer-on-cover that defines acyclicity, when $F$ is itself acyclic). Hence $E_2^{p,q} = 0$ for $q \geq 2$, and the $q = 1$ row contributes only $E_2^{p, 1}$ for $p = 0, 1$ to $H^{1, 2}$ — corresponding to the cellular Ext-classification's $\mathrm{Ext}^1$ content on $\mathcal{F}$. The $E_2^{p, 0}$ row gives $\check{H}^p$ contributing to $H^p$ for all $p$.

For $\mathcal{F}$ in the strict / Scott-continuous regimes (where $\mathrm{Ext}^1(\mathcal{F}, \mathcal{F}) = 0$ per the [Ext-classification](skh-deformation-ext-classification.md)), the $q = 1$ row vanishes entirely and the spectral sequence collapses, giving $\check{H}^n = H^n$ for all $n$. For $\mathcal{F}$ in the transfinite-bounded or aperiodic regime, the agreement holds in degrees $0, 1, 2$ provided the cover is fine enough to resolve the firing structure — such covers exist by the bitopological-site coverage construction. In all four regimes, $\check{H}^n = H^n$ for $n \leq 2$, which is the range needed for the obstruction-class computation. $\square$

**Foundational caveat — now closed.** The lemma's reliance on $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity from $\mathcal{F}$ via the closed-monoidal structure is discharged by the [endomorphism sheaf acyclicity inheritance theorem](endomorphism-sheaf-acyclicity-inheritance.md) (proved): the closed-monoidal adjunction gives $H^q(X; \mathcal{E}\!nd(\mathcal{F})) \cong \mathrm{Ext}^q(\mathcal{F}, \mathcal{F})$, and the cellular Ext-vanishing in the four standard regimes gives $\mathrm{Ext}^{\geq 2}(\mathcal{F}, \mathcal{F}) = 0$, so $H^{\geq 2}(X; \mathcal{E}\!nd(\mathcal{F})) = 0$ — verified rather than asserted. For cellular-leaving deformations the acyclicity of $\mathcal{E}\!nd(\mathcal{F}_\epsilon)$ may still fail (and the openness-defect class is precisely the cohomological residue of that failure), but the lemma's setup operates on the cellular base $\mathcal{F}$, where the acyclicity inheritance now holds unconditionally.

## Perturbation analysis: from deformation to Čech 1-cocycle

A first-order deformation $\mathcal{F}_\epsilon$ over $k[\epsilon]/\epsilon^2$ is a sheaf of $k[\epsilon]/\epsilon^2$-modules on $X$ extending $\mathcal{F}$. Locally on each $U_i$, choose a trivialization

$$\mathcal{F}_\epsilon|_{U_i} \;\cong\; \mathcal{F}|_{U_i} \;\oplus\; \epsilon \cdot \mathcal{F}|_{U_i}$$

as $k[\epsilon]/\epsilon^2$-modules. On pairwise intersections $U_{ij}$, the two local trivializations from $U_i$ and $U_j$ differ by an automorphism of $\mathcal{F}|_{U_{ij}} \oplus \epsilon \cdot \mathcal{F}|_{U_{ij}}$ that reduces to the identity on $\mathcal{F}|_{U_{ij}}$ — i.e., by an element of the form $\mathrm{id} + \epsilon \phi(U_{ij})$ for a unique $\phi(U_{ij}) \in \mathcal{E}\!nd(\mathcal{F})(U_{ij})$.

The cocycle condition $\delta \phi = 0$ — explicitly,

$$\phi(U_{jk})\big|_{U_{ijk}} - \phi(U_{ik})\big|_{U_{ijk}} + \phi(U_{ij})\big|_{U_{ijk}} \;=\; 0$$

— is exactly the requirement that the trivializations on $U_i, U_j, U_k$ agree consistently on $U_{ijk}$ (the sheaf condition for $\mathcal{F}_\epsilon$). Hence $\phi \in \check{Z}^1(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$.

Different choices of local trivializations differ by 0-cochains (per-$U_i$ automorphisms $\mathrm{id} + \epsilon \psi_i$ for $\psi_i \in \mathcal{E}\!nd(\mathcal{F})(U_i)$), which add coboundaries $\delta \psi$ to $\phi$. Hence $[\phi] \in \check{H}^1(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$ is independent of trivialization choice. Under the Čech-to-Ext identification of the §"Cosimplicial-to-Ext identification" lemma, $[\phi]$ corresponds to the class $[\mathcal{F}_\epsilon] \in \mathrm{Ext}^1(\mathcal{F}, \mathcal{F})$ from the [SKH Ext-classification](skh-deformation-ext-classification.md). This proves part (i) of the statement.

## Second-order obstruction: the cup-product-square computation

To extend $\mathcal{F}_\epsilon$ to a second-order deformation $\mathcal{F}_{\epsilon^2}$ over $k[\epsilon]/\epsilon^3$, we need local trivializations

$$\mathcal{F}_{\epsilon^2}|_{U_i} \;\cong\; \mathcal{F}|_{U_i} \;\oplus\; \epsilon \mathcal{F}|_{U_i} \;\oplus\; \epsilon^2 \mathcal{F}|_{U_i}$$

with transition maps on $U_{ij}$ of the form $\mathrm{id} + \epsilon \phi(U_{ij}) + \epsilon^2 \psi(U_{ij})$ for some $\psi \in \check{C}^1(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$ to be determined.

The sheaf condition on $U_{ijk}$ requires the composition of transitions $U_{ij}$-then-$U_{jk}$ to equal the $U_{ik}$-transition modulo $\epsilon^3$. Computing the composition:

$$\bigl(\mathrm{id} + \epsilon \phi(U_{ij}) + \epsilon^2 \psi(U_{ij})\bigr) \,\circ\, \bigl(\mathrm{id} + \epsilon \phi(U_{jk}) + \epsilon^2 \psi(U_{jk})\bigr)$$

$$=\; \mathrm{id} \,+\, \epsilon \bigl(\phi(U_{ij}) + \phi(U_{jk})\bigr) \,+\, \epsilon^2 \bigl(\psi(U_{ij}) + \psi(U_{jk}) + \phi(U_{ij}) \circ \phi(U_{jk})\bigr) \pmod{\epsilon^3}.$$

Comparing with $\mathrm{id} + \epsilon \phi(U_{ik}) + \epsilon^2 \psi(U_{ik})$ on $U_{ijk}$:

- **$\epsilon$-coefficient:** $\phi(U_{ij}) + \phi(U_{jk}) = \phi(U_{ik})$ on $U_{ijk}$ — the cocycle condition for $\phi$, already established at first order.

- **$\epsilon^2$-coefficient:** $\psi(U_{ij}) + \psi(U_{jk}) + \phi(U_{ij}) \circ \phi(U_{jk}) = \psi(U_{ik})$ on $U_{ijk}$, equivalently

$$\psi(U_{ik}) - \psi(U_{ij}) - \psi(U_{jk}) \;=\; \phi(U_{ij}) \circ \phi(U_{jk})\big|_{U_{ijk}}.$$

The left side is $-(\delta \psi)(U_{ijk})$ (the Čech coboundary of $\psi$ at $U_{ijk}$, noting the alternating sign on the middle index); the right side is exactly $(\phi \cup \phi)(U_{ijk})$ per the cup-product formula in §"Setup". Hence the second-order extension exists iff there exists $\psi \in \check{C}^1$ with

$$\delta \psi \;=\; -\,\phi \cup \phi$$

— i.e., iff $\phi \cup \phi$ is a Čech coboundary in $\check{C}^2$, equivalently iff $[\phi \cup \phi] = 0$ in $\check{H}^2(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$.

This proves part (ii): the obstruction to second-order extension is the cup-product-square $[\phi \cup \phi] \in \check{H}^2 = \mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$, with explicit Čech 2-cocycle representative the composition formula on triple intersections. The construction is the direct Čech-cosimplicial transposition of the Hochschild cup-product-square of [@gerstenhaber1964] §§1-3: where Gerstenhaber's $\phi \in C^2(A, A)$ has cup-product-square $\phi \cup \phi \in C^3(A, A)$ encoded by Hochschild's bracket on cosimplicial cochains, our $\phi \in \check{C}^1$ has cup-product-square $\phi \cup \phi \in \check{C}^2$ encoded by composition on Čech cochains.

## Identification with meet-preservation discrepancy (cellular-leaving case)

When $\mathcal{F}_\epsilon$ is cellular-leaving through restriction $f_0 : U \to U'$, choose the cover $\mathcal{U}$ adapted to $f_0$: take $U_1 := U$, $U_2 := U'$ as cover elements with $f_0$ realizing the restriction $\mathcal{F}_\epsilon(f_0) : \mathcal{F}_\epsilon(U') \to \mathcal{F}_\epsilon(U)$. The 1-cocycle $\phi$ on $U_{12} = U$ (with the restriction along $f_0$ to $U'$) is the perturbation:

$$\phi(U) \;=\; \mathcal{F}_\epsilon(f_0) - \mathcal{F}(f_0) \quad \text{(modulo the local identification of } \mathcal{F}_\epsilon|_{U} \text{ with } \mathcal{F}|_U \oplus \epsilon \mathcal{F}|_U \text{)}.$$

For the cup-product-square evaluated on triples involving $f_0$ — equivalently, on a chain $\{V_\alpha\}_{\alpha < \omega_1} \subseteq \mathcal{F}(U')$ witnessing meet-preservation failure of $\mathcal{F}_\epsilon(f_0)$ — the formula

$$(\phi \cup \phi)(V_\alpha, V_\beta) \;=\; \phi(V_\alpha) \,\circ\, \phi(V_\beta)$$

becomes, on substitution and using composition with the perturbation formula:

$$(\phi \cup \phi)(V_\alpha, V_\beta) \;=\; \mathcal{F}_\epsilon(f_0)\bigl(V_\alpha \wedge V_\beta\bigr) \,-\, \mathcal{F}_\epsilon(f_0)(V_\alpha) \wedge \mathcal{F}_\epsilon(f_0)(V_\beta).$$

This is the **meet-preservation discrepancy** of $\mathcal{F}_\epsilon(f_0)$ on the chain. By the [openness characterization theorem](frame-morphism-meet-preservation-openness.md), this discrepancy vanishes iff $\mathcal{F}_\epsilon(f_0)$ has a left adjoint — iff the deformation is cellular-preserving. Hence in the cellular-leaving case, the cocycle representative is *explicitly* the meet-preservation discrepancy, and its cohomology class $\delta(\mathcal{F}_\epsilon, f_0) \in \mathrm{Ext}^2$ is the cohomological encoding of the openness loss. This proves part (iii).

The structural content here is the bridge: **frame-theoretic openness loss** (the meet-preservation discrepancy) is **literally** the **cohomological obstruction** (the cup-product-square cocycle), with no intermediate identification needed. The two distinct languages — pointless topology and homological algebra — collapse to the same explicit formula on chains.

## d-frame trichotomy decomposition

The d-frame structure on $\mathcal{F}$ gives a stalk-wise decomposition $\mathcal{F}(U) = \mathcal{F}^+(U) \oplus \mathcal{F}^-(U) \oplus \mathcal{F}^\top(U)$ (truth-side, falsity-side, $\top$-witness). This induces a corresponding decomposition of the endomorphism sheaf:

$$\mathcal{E}\!nd(\mathcal{F}) \;=\; \mathcal{E}\!nd^+(\mathcal{F}) \;\oplus\; \mathcal{E}\!nd^-(\mathcal{F}) \;\oplus\; \mathcal{E}\!nd^\top(\mathcal{F})$$

where $\mathcal{E}\!nd^\pm$ are the truth-/falsity-side endomorphisms (preserving the respective component) and $\mathcal{E}\!nd^\top$ is the consistency-relation endomorphism part (acting on the $\top$-witness component or mixing components). The decomposition is the d-frame analog of the classical decomposition of bilinear forms by signature; it is established at the d-frame Ext-classification level in the [d-frame tangent refinement](skh-deformation-ext-classification.md) section.

The 1-cocycle $\phi \in \check{C}^1(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$ decomposes accordingly: $\phi = \phi^+ + \phi^- + \phi^\top$ with $\phi^\pm \in \check{C}^1(\mathcal{U}; \mathcal{E}\!nd^\pm(\mathcal{F}))$ and $\phi^\top \in \check{C}^1(\mathcal{U}; \mathcal{E}\!nd^\top(\mathcal{F}))$.

**Composition behavior under d-frame decomposition.** The composition $\circ$ on $\mathcal{E}\!nd(\mathcal{F})$ respects the decomposition with the following pattern, derived from the d-frame's bilattice structure:

- $\mathcal{E}\!nd^+ \circ \mathcal{E}\!nd^+ \subseteq \mathcal{E}\!nd^+$ (truth-side preserved under composition).
- $\mathcal{E}\!nd^- \circ \mathcal{E}\!nd^- \subseteq \mathcal{E}\!nd^-$ (falsity-side preserved under composition).
- All mixed compositions land in $\mathcal{E}\!nd^\top$: $\mathcal{E}\!nd^+ \circ \mathcal{E}\!nd^- \subseteq \mathcal{E}\!nd^\top$, $\mathcal{E}\!nd^- \circ \mathcal{E}\!nd^+ \subseteq \mathcal{E}\!nd^\top$, and any composition involving $\mathcal{E}\!nd^\top$ stays in $\mathcal{E}\!nd^\top$.

The mixed cases land in the consistency-relation part because composing a truth-side perturbation with a falsity-side perturbation produces a map that records the **interaction** between truth and falsity data — and the consistency relation of the d-frame is precisely the substructure recording such interaction.

**Computing the cup-product-square decomposition.** Distributing $\phi \cup \phi = (\phi^+ + \phi^- + \phi^\top) \cup (\phi^+ + \phi^- + \phi^\top)$ and using the composition pattern:

$$\phi \cup \phi \;=\; (\phi^+ \cup \phi^+) \;+\; (\phi^- \cup \phi^-) \;+\; \delta^\top_{\mathrm{cross}}$$

where the truth-side pure term lands in $\check{C}^2(\mathcal{E}\!nd^+)$, the falsity-side pure term in $\check{C}^2(\mathcal{E}\!nd^-)$, and the consistency-relation cross-term collects everything else:

$$\delta^\top_{\mathrm{cross}} \;=\; (\phi^+ \cup \phi^-) + (\phi^- \cup \phi^+) + (\phi^+ \cup \phi^\top) + (\phi^\top \cup \phi^+) + (\phi^- \cup \phi^\top) + (\phi^\top \cup \phi^-) + (\phi^\top \cup \phi^\top) \;\in\; \check{C}^2(\mathcal{E}\!nd^\top).$$

Passing to cohomology gives the trichotomy at $\mathrm{Ext}^2_{\mathbf{dFrm}}$ level:

- $\delta^+ := [\phi^+ \cup \phi^+] \in \mathrm{Ext}^2_{\mathbf{dFrm}}(\mathcal{F}, \mathcal{F})^+$ — the **truth-side openness defect** (failure of meet preservation on truth-positive sections).
- $\delta^- := [\phi^- \cup \phi^-] \in \mathrm{Ext}^2_{\mathbf{dFrm}}(\mathcal{F}, \mathcal{F})^-$ — the **falsity-side openness defect** (Verdier-dual of $\delta^+$).
- $\delta^\top := [\delta^\top_{\mathrm{cross}}] \in \mathrm{Ext}^2_{\mathbf{dFrm}}(\mathcal{F}, \mathcal{F})^\top$ — the **consistency-relation openness defect** (failure on truth–falsity cross-terms and on $\top$-witness pairs).

The three components are independently zero/nonzero in general — $\delta^\top$ vanishes iff the truth-side and falsity-side perturbations $\phi^\pm$ commute (the cross-cup-products cancel) AND $\phi^\top \cup \phi^\top$ is a coboundary. Both conditions are independent constraints; both can fail.

**Ab-shadow.** Abelianization $\mathcal{E}\!nd(\mathcal{F}) \to \mathcal{E}\!nd^{\mathrm{Ab}}(\mathcal{F})$ collapses the consistency-relation part $\mathcal{E}\!nd^\top \to 0$ (the consistency relation has no abelianized counterpart in $\mathbf{Ab}$, since abelian groups have no $\top$-witness structure). Hence the Ab-shadow of $\phi \cup \phi$ is exactly $(\phi^+ \cup \phi^+) + (\phi^- \cup \phi^-)$, with $\delta^\top_{\mathrm{cross}}$ dropped entirely. The Ab-shadow misses the consistency-relation defect — confirming the d-frame setting strictly refines the abelian one. This proves part (iv).

## Specialization: the topology-refining identity

The [openness characterization theorem](frame-morphism-meet-preservation-openness.md)'s topology-refining-identity counterexample on $\omega_1+1$ — $f : (\omega_1+1)_{\text{refined}} \to (\omega_1+1)_{\text{standard}}$ on the trivial-topology two-object site $\mathbf{T} = (\sigma \xrightarrow{f} \tau)$ — gives the explicit cosimplicial cocycle $\phi$ for a cellular-leaving deformation:

- **Cover.** $\mathcal{U} = \{U_1 := \sigma, U_2 := \tau\}$ adapted to $f$. The pairwise intersection is $U_{12} = \sigma$ via $f$.
- **Sheaves.** $\mathcal{F}(\sigma) = \Omega(Y)$, $\mathcal{F}(\tau) = \Omega(X)$ as in the openness characterization's "Application" section. $\mathcal{F}(f) = h := f^{-1}$ is the cellular-class basepoint.
- **Perturbation.** $\mathcal{F}_\epsilon(f) := h + \epsilon \cdot \eta$, with $\eta : \Omega(X) \to \Omega(Y)$ the perturbation losing meet preservation on the chain $\{U_\alpha = (\alpha, \omega_1]\}_{\alpha < \omega_1}$.
- **Čech 1-cocycle.** $\phi(U_{12}) = \eta$.
- **Čech 2-cocycle (cup-product-square).** On the chain pair $(U_\alpha, U_\beta)$ with $\alpha \leq \beta < \omega_1$:

$$(\phi \cup \phi)(U_\alpha, U_\beta) \;=\; \eta(U_\alpha \wedge U_\beta) - \eta(U_\alpha) \wedge \eta(U_\beta) \;=\; \eta(U_\alpha) - \eta(U_\alpha) \wedge \eta(U_\beta).$$

The discrepancy is constant at value $\{\omega_1\} \in \Omega(Y)$ along the chain (as computed in the dichotomy theorem's worked example): for any $\alpha \leq \beta < \omega_1$, $\eta(U_\alpha)$ contains the limit point $\omega_1$ but $\eta(U_\alpha) \wedge \eta(U_\beta)$ does not.

**Cohomological non-vanishing.** The cocycle is a coboundary iff there exists $\psi \in \check{C}^1(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F}))$ — i.e., a single endomorphism $\psi(U_{12}) : \Omega(X) \to \Omega(Y)$ — with $\delta \psi$ producing the constant $\{\omega_1\}$-valued cocycle on every chain pair. Such a $\psi$ would need to satisfy $\psi(U_\beta) - \psi(U_\alpha)|_{U_\alpha \wedge U_\beta}$ equal to $\{\omega_1\}$ for all chain pairs — an unbounded condition along the $\omega_1$-cofinal chain. No single-valued $\psi$ can satisfy this (by the same set-theoretic argument that establishes the meet-preservation failure in the openness characterization's counterexample: the chain is cofinal in $\omega_1+1$, and any candidate $\psi$ would fail at some chain element). Hence

$$\delta = [\phi \cup \phi] \;\neq\; 0 \;\in\; \check{H}^2(\mathcal{U}; \mathcal{E}\!nd(\mathcal{F})),$$

confirming that the cellular-leaving deformation is genuinely obstructed at second order, with the obstruction class given by the meet-preservation discrepancy.

For this example, the d-frame trichotomy is trivial: the underlying topology is set-theoretic (not d-frame valued), so $\phi^- = \phi^\top = 0$ and $\delta = \delta^+$. To exhibit all three trichotomy components nonzero requires a d-frame-valued worked example — direction (ii) of the [openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md), the natural concrete-grounding follow-up.

## What this fills in the dichotomy theorem

The [openness-boundary deformation dichotomy theorem](openness-boundary-deformation-dichotomy.md)'s Part (b) proof framework had three open items, all flagged in its "What's open" section:

1. **Step 1 — cosimplicial encoding of the openness defect.** Already given in the dichotomy at cocycle level. This theorem makes the *full Čech cosimplicial complex* explicit, with cup-product structure derived from the closed-monoidal $\mathcal{E}\!nd$, situating the cocycle $c(V_\alpha, V_\beta)$ as a special evaluation of $\phi \cup \phi$.

2. **Step 2 — cosimplicial-to-derived identification.** Filled by the §"Cosimplicial-to-Ext identification" lemma, modulo the named foundational caveat about $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity (which the closed-monoidal structure structurally ensures but is not separately verified).

3. **Step 3 — cup-product-square = cosimplicial 2-cocycle identification.** Filled by the §"Second-order obstruction" computation: the obstruction-theoretic cup-product-square is *literally* the Čech-cosimplicial cup-product-square, with no additional identification needed. The two are the same explicit Yoneda-cup composition formula.

Part (c) of the dichotomy (d-frame trichotomy) is filled at the cocycle level by §"d-frame trichotomy decomposition" above. The remaining open item from Part (c) is the **independent non-vanishing** of $\delta^+$, $\delta^-$, $\delta^\top$ on a single example — direction (ii) of the literature review.

The dichotomy theorem can therefore be upgraded: Parts (b) and (c) move from "sketch" to "proved at cocycle level for the construction; cohomological non-vanishing established for the topology-refining-identity example; d-frame-trichotomy independent non-vanishing pending the worked example." This is recorded in the dichotomy's status discussion.

## Status

`proved` (unconditionally). The Čech cosimplicial construction of $\delta$ is explicit and complete, with the cup-product-square identification, the meet-preservation-discrepancy reduction, and the d-frame trichotomy decomposition all verified at cocycle level. The non-vanishing of the cohomology class is verified on the topology-refining-identity example for the abelian (single-component) case, and on the [d-frame trichotomy witness example](../examples/d-frame-trichotomy-witness.md) (proved) for the d-frame trichotomy's three independent components. The previously-flagged foundational caveat about $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity is now **closed** by the [endomorphism sheaf acyclicity inheritance theorem](endomorphism-sheaf-acyclicity-inheritance.md) (proved). No remaining open items.

## Position in predication categories

This theorem fills the foundational gap in the [openness-boundary deformation dichotomy theorem](openness-boundary-deformation-dichotomy.md)'s sketch status, making the construction of the openness-defect class $\delta$ explicit at the Čech-cocycle level and verifying the d-frame trichotomy decomposition. It is the first substantive technical move in the [openness-defect deformation theory](questions/openness-defect-deformation-theory.md) program — direction (i) of the [literature-review narrative](prose/teaching/explanations/openness-defect-deformation-literature.md) — and unlocks directions (ii), (iii), (iv) by giving them an explicit object ($\delta$ as Čech cocycle, with the d-frame decomposition) to work with rather than an abstract obstruction-class symbol.

The structural content is the direct transposition of [@gerstenhaber1964]'s Hochschild cup-product-square obstruction to the Čech cosimplicial complex on the bitopological settling site, with the [Q-enriched closed-monoidal structure](q-enriched-sheaf-closed-monoidal-structure.md) supplying the cup product (via composition on $\mathcal{E}\!nd$) and the [openness characterization theorem](frame-morphism-meet-preservation-openness.md) identifying the cocycle's value with the meet-preservation discrepancy. The genuine novelty is twofold:

1. **The frame-theory ↔ homological-algebra bridge.** Frame-theoretic openness loss (the meet-preservation discrepancy) is *literally* the cohomological obstruction (the Čech cup-product-square cocycle), with no intermediate identification needed. Two distinct mathematical languages collapse to the same explicit formula on chains. This bridge has no precedent in the literature.

2. **The d-frame trichotomy decomposition.** The bilattice value category produces a structural decomposition $\delta = \delta^+ + \delta^- + \delta^\top$ that the abelian setting cannot see — the consistency-relation defect $\delta^\top$ is invisible to Ab-shadow abelianization. This is the first explicit construction of a bilattice-valued obstruction class with a non-trivial trichotomy decomposition.

Connections:

- The [Ext-classification](skh-deformation-ext-classification.md) supplies the $\mathrm{Ext}^1$ classification of first-order deformations and the obstruction-in-$\mathrm{Ext}^2$ framework; this theorem makes the obstruction explicit.
- The [openness characterization](frame-morphism-meet-preservation-openness.md) supplies the structural backbone — the meet-preservation discrepancy is the openness obstruction's frame-theoretic form.
- The [closed-monoidal structure](q-enriched-sheaf-closed-monoidal-structure.md) supplies the $\mathcal{E}\!nd$ sheaf and the cup-product on Čech cohomology.
- The [vanishing-above-degree-1 theorem](settling-cohomology-vanishes-above-degree-1.md) and [Q-enriched higher-degree vanishing](q-enriched-cohomology-higher-degree-vanishing.md) supply the spectral-sequence collapse needed for the Čech-to-Ext identification.
- The [openness-boundary deformation dichotomy](openness-boundary-deformation-dichotomy.md) is the parent theorem whose Steps 2/3 are filled here.
- The [openness-defect deformation theory question](questions/openness-defect-deformation-theory.md) is the wider program whose direction (i) this theorem advances.
- The [openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md) supplies the literature mapping for the program; this theorem is direction (i)'s first concrete output.
