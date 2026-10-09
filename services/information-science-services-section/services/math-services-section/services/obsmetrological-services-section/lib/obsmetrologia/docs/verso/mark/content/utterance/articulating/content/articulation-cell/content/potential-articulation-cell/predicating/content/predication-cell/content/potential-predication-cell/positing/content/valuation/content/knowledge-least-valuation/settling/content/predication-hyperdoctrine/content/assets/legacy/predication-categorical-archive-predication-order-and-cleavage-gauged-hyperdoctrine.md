---
type: definition
class: gauged-hyperdoctrine
symbol: "(p, A, \\sigma_A, \\varepsilon_A, \\pi_A)"
status: draft
realizes: [internal-z2-gauge, klein-four-symmetry, order-cleavage-quantifier-joint-gauge]
depends-on: [predication-hyperdoctrine, predication-fibration, predicate-specialization, gauge-connection, klein-four-gauge-bundle, four-bilattice, internal-z2-gauge, negation, conflation, twisted-beck-chevalley, beck-chevalley-commutation-on-predication-bilattices]
see-also: [twisted-beck-chevalley, gauge-twisted-reindexing, gauge-twisted-reindexing-graded-homomorphism, equivariant-cohomology-decomposition, twisted-equivariant-cohomology-decomposition, curvature-from-pseudo-functorial-connections]
---

# Order-and-cleavage-gauged predication hyperdoctrine

The [$\leq_k$-axis twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md) theorem covers exactly one quadrant of the gauge group: connections valued in $K_4^{\,k} = \{e, {\sim}\}$. The remaining sectors — and in particular any connection whose holonomy includes the order-reversing elements $\{-, {\sim}\circ-\}$ — are obstructed by two structurally distinct mismatches:

1. **Cleavage-extension mismatch.** [predicate-specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) reindexes by extending outside-support cells with $\bot$. Under a $-$-twist or $({\sim}\circ-)$-twist, $-(\bot) = \top$, so the gauge action does *not* commute with cellwise reindexing on outside-support cells.
2. **Quantifier-polarity mismatch.** Order-reversing elements $\{-, {\sim}\circ-\}$ turn $\leq_k$-monotone reindexings into Galois adjoints between $\leq_k$ and $\leq_k^{\mathrm{op}}$, corresponding to the swap $\exists_f^k \leftrightarrow \forall_f^k$ along the twisted edges.

The **order-and-cleavage-gauged predication hyperdoctrine** resolves the *per-edge* obstruction by treating the order axis, the extension value, and the quantifier polarity as *joint* per-edge gauge data — additional structure varying along $\mathcal{C}$ together with the fiber automorphism. With this enlarged gauge structure, the per-edge gauged twisted reindexing $f^{*,A}$ and gauged left adjoint $L^A_f$ are well-defined for every $f$ and every $A(f) \in K_4$ (Lemmas 1–2 below). The four-edge Beck–Chevalley *coherence around pullback squares* then has a clean per-leg characterization (Lemma 4 + Theorem): the in-support gauged BC on the $f$-leg holds whenever $\mathrm{par}(A(p_B)) = 0$ (sufficiency, unconditional), and conversely fails on some $\phi$ whenever $\mathrm{par}(A(p_B)) = 1$ provided the square is $f$-non-degenerate (necessity); the dual statement holds for the $g$-leg. Consequently, full square in-support coherence (both legs) holds in **exactly two parity regimes** — parity-0 uniform, and the top-bottom parity-1 regime $\{f, g\}$ parity-1 with $\{p_A, p_B\}$ parity-0 (Corollary; sufficiency unconditional, necessity for non-degenerate squares). The remaining six configurations carry an explicit $\exists^k$-vs-$\forall^k$ obstruction located on whichever projection leg is parity-1; this is what locates the gauge-curvature content of [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md).

## The parity homomorphism

The Klein-four group has a distinguished quotient

$$\mathrm{par} : K_4 \twoheadrightarrow K_4 / K_4^{\,k} \;\cong\; \mathbb{Z}/2,$$

with $\mathrm{par}(e) = \mathrm{par}({\sim}) = 0$ and $\mathrm{par}(-) = \mathrm{par}({\sim}\circ-) = 1$. This is the **$\leq_k$-parity homomorphism**: it records whether an element preserves $\leq_k$ (parity 0) or reverses it (parity 1).

For any gauge connection $A : \mathcal{C} \to BK_4$, the composite $\mathrm{par} \circ A : \mathcal{C} \to B\mathbb{Z}/2$ is a $\mathbb{Z}/2$-valued connection — itself a 1-cocycle on $N\mathcal{C}$ with $\mathbb{Z}/2$ coefficients, classified by $H^1(N\mathcal{C}, \mathbb{Z}/2)$. The parity sub-connection records the "is the order reversed along this edge?" data of $A$.

For a pullback square $f \circ p_A = g \circ p_B$ in $\mathcal{C}$ (with $p_A : P \to A$, $p_B : P \to B$, $f : A \to C$, $g : B \to C$), functoriality of $\mathrm{par} \circ A$ gives

$$\mathrm{par}(A(f)) + \mathrm{par}(A(p_A)) \;\equiv\; \mathrm{par}(A(g)) + \mathrm{par}(A(p_B)) \pmod 2,$$

equivalently $\sum_{\text{edges}} \mathrm{par}(A(\cdot)) \equiv 0 \pmod 2$. So zero, two, or four edges have parity 1. The square is **parity-uniform** if all four parities are equal (zero or four edges reversed) and **parity-mixed** otherwise (exactly two reversed).

## Setup: the structural-choice triple

Let $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ be a [predication hyperdoctrine](predication-hyperdoctrine.md) over base parameters $(\mathbf{L}, \mathcal{C}, E)$ with $\mathbf{L} = \mathbf{FOUR}$. Each fiber $\mathcal{E}_q$ carries the bilattice orders $\leq_k, \leq_t$, the bottoms $\bot, \mathbf{f}$, and adjoint families $(\exists_f^k \dashv f^* \dashv \forall_f^k)$ and $(\exists_f^t \dashv f^* \dashv \forall_f^t)$.

Define the **structural-choice triple space**

$$\Theta := \{\leq_k, \leq_k^{\mathrm{op}}\} \times \{\bot, \top\} \times \{\exists, \forall\},$$

with the **base triple** $\Theta_0 := (\leq_k, \bot, \exists)$ matching the conventions of [predicate-specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) and [beck-chevalley-commutation-on-predication-bilattices](../theorems/beck-chevalley-commutation-on-predication-bilattices.md). The space $\Theta$ is *eight* elements abstractly; the orbit of $\Theta_0$ under the $K_4$-action defined below has only *two* elements, corresponding to the two parity classes.

The construction is intentionally restricted to the $\leq_k$-axis-and-its-opposite. The $\leq_t$-axis variant — gauging $\Theta_t := (\leq_t, \mathbf{f}, \exists)$ — is a separate construction (open: see [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md), $\leq_t$-half).

## $K_4$-action on the orbit of $\Theta_0$

Define the $K_4$-action on $\Theta$ by

$$g \cdot (\sigma, \varepsilon, \pi) \;=\; \big( g \cdot_\sigma \sigma, \; g \cdot_\varepsilon \varepsilon, \; g \cdot_\pi \pi \big),$$

with the three components specified by:

- $g \cdot_\sigma \sigma \;:=\; \begin{cases} \sigma & \mathrm{par}(g) = 0 \\ \sigma^{\mathrm{op}} & \mathrm{par}(g) = 1 \end{cases}$ (preserve / reverse the order, on either $\leq_k$ or $\leq_k^{\mathrm{op}}$);

- $g \cdot_\varepsilon \varepsilon \;:=\; g(\varepsilon)$ (apply the bilattice automorphism to the extension value: $\sim$ and $e$ fix $\bot$ and $\top$; $-$ and $\sim\circ-$ swap them);

- $g \cdot_\pi \pi \;:=\; \begin{cases} \pi & \mathrm{par}(g) = 0 \\ \bar\pi & \mathrm{par}(g) = 1 \end{cases}$ (preserve / swap quantifier polarity).

**Action factors through parity on the orbit of $\Theta_0$.** Acting on $\Theta_0 = (\leq_k, \bot, \exists)$:

| element of $K_4$ | $\sigma$ | $\varepsilon$ | $\pi$ | parity |
|---|---|---|---|---|
| $e$ | $\leq_k$ | $\bot$ | $\exists$ | 0 |
| ${\sim}$ | $\leq_k$ | $\bot$ | $\exists$ | 0 |
| $-$ | $\leq_k^{\mathrm{op}}$ | $\top$ | $\forall$ | 1 |
| ${\sim}\circ-$ | $\leq_k^{\mathrm{op}}$ | $\top$ | $\forall$ | 1 |

The orbit $K_4 \cdot \Theta_0$ has exactly two elements, one per parity class. The action factors through $\mathrm{par} : K_4 \to \mathbb{Z}/2$ when restricted to this orbit. (On the wider abstract $\Theta$ — not restricted to the orbit — the action does not factor through parity, since $\sim$ acts non-trivially on, e.g., $\leq_t$. The construction never invokes that action, so the well-definedness depends only on the orbit-restricted version.)

## Definition: order-and-cleavage-gauged hyperdoctrine

An **order-and-cleavage-gauged predication hyperdoctrine** is a tuple

$$(p, A, \sigma_A, \varepsilon_A, \pi_A)$$

consisting of:

- *(D1)* a [predication hyperdoctrine](predication-hyperdoctrine.md) $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$;
- *(D2)* a [gauge connection](gauge-connection.md) $A : \mathcal{C} \to BK_4$;
- *(D3)* the **induced structural triple** on morphisms of $\mathcal{C}$ defined by

  $$\bigl(\sigma_A(f), \varepsilon_A(f), \pi_A(f)\bigr) \;:=\; A(f) \cdot \Theta_0.$$

The induced triple lies in $K_4 \cdot \Theta_0 \subset \Theta$, hence depends only on $\mathrm{par}(A(f))$. The triple is *not* extra data — it is the orbit-coordinate of $A(f)$ acting on $\Theta_0$, recorded explicitly to track polarity bookkeeping in the BC statement below.

The **gauged twisted reindexing** along $f$ is

$$f^{*,A}(v)(s, o) \;:=\; \begin{cases} A(f)\bigl( v(\phi_f(s, o)) \bigr) & (s, o) \in \mathrm{dom}(q) \\ \varepsilon_A(f) & (s, o) \notin \mathrm{dom}(q) \end{cases}$$

— extension by the $A(f)$-image of the base bottom, rather than by the base bottom itself. The **gauged left adjoint** is

$$L^A_f \;:=\; \begin{cases} \exists^{k}_f \cdot A(f) & \pi_A(f) = \exists \quad (\text{i.e. } \mathrm{par}(A(f)) = 0) \\ \forall^{k}_f \cdot A(f) & \pi_A(f) = \forall \quad (\text{i.e. } \mathrm{par}(A(f)) = 1) \end{cases}$$

— polarity-swapped along order-reversing edges to track the fact that the left adjoint of an antitone map is the right adjoint of the corresponding monotone map.

## Coherence

**Lemma 1 (functoriality of the induced triple).** *For all composable morphisms $f : q \to p$ and $g : p \to r$ in $\mathcal{C}$,*

$$A(g \circ f) \cdot \Theta_0 \;=\; A(g) \cdot \bigl( A(f) \cdot \Theta_0 \bigr).$$

**Proof.** Functoriality of $A : \mathcal{C} \to BK_4$ gives $A(g \circ f) = A(g) \cdot A(f)$ in $K_4$. Functoriality of the $K_4$-action on $\Theta$ then gives $A(g) \cdot A(f) \cdot \Theta_0 = A(g) \cdot (A(f) \cdot \Theta_0)$. $\square$

The lemma confirms that $(\sigma_A, \varepsilon_A, \pi_A)$ is well-defined on $\mathcal{C}$: composable morphisms compose triples consistently. Equivalently — and more transparently — the parity sub-connection $\mathrm{par} \circ A : \mathcal{C} \to B\mathbb{Z}/2$ is a functor, and the induced triple at $f$ is determined by $\mathrm{par}(A(f))$.

## Why all three components must move together

A more restrictive definition gauging only one of $(\sigma, \varepsilon, \pi)$ is incoherent. The forcing is per-edge:

**Normalization axiom (canonical-extension).** *The gauged reindexing $f^{*,A}$ extends outside-support cells by the $\sigma_A(f)$-bottom of $\mathbf{FOUR}$.* This is the gauged analogue of the base axiom in [predicate-specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) (extension by the $\leq_k$-bottom $\bot$); without it, the outside-support value would be free, since outside-support cells take the same constant on both sides of any monotonicity comparison and thus do not constrain $\varepsilon_A(f)$ purely from monotonicity.

**Lemma 2 (per-edge joint movement under canonical-extension normalization).** *Let $f : q \to p$ be a morphism with $A(f) = h \in K_4$. Assume the canonical-extension normalization. Then:*

*(a) $\sigma_A(f)$ is uniquely determined by $\mathrm{par}(h)$ via the requirement that $f^{*,A}$ be monotone (between source and target fibers in the gauged enrichment $\sigma_A(f)$): $\sigma_A(f) = \leq_k$ if $\mathrm{par}(h) = 0$, $\sigma_A(f) = \leq_k^{\mathrm{op}}$ if $\mathrm{par}(h) = 1$.*

*(b) Given $\sigma_A(f)$, the cleavage-extension value $\varepsilon_A(f)$ is uniquely determined by the canonical-extension normalization as the $\sigma_A(f)$-bottom: $\varepsilon_A(f) = \bot$ for $\sigma_A(f) = \leq_k$, $\varepsilon_A(f) = \top$ for $\sigma_A(f) = \leq_k^{\mathrm{op}}$. In particular $\varepsilon_A(f) = h(\bot)$.*

*(c) Given $\sigma_A(f)$, the polarity $\pi_A(f)$ is uniquely determined as the symbol naming the left adjoint of $f^{*,A}$ in the $\sigma_A(f)$-enrichment: $\pi_A(f) = \exists$ for $\sigma_A(f) = \leq_k$, $\pi_A(f) = \forall$ for $\sigma_A(f) = \leq_k^{\mathrm{op}}$ (since the $\leq_k^{\mathrm{op}}$-left-adjoint of $f^{*,A}$ is the $\leq_k$-right-adjoint, which is $\forall_f^k$). The gauged left adjoint is then $L^A_f = \pi_A(f)^k_f \cdot A(f)$.*

**Proof.**

(a) The reindexing $f^{*,A}(v) = A(f) \cdot v \circ \phi_f$ on in-support cells. Monotonicity for $v \leq_{\sigma'} v' \Rightarrow f^{*,A}(v) \leq_{\sigma_A(f)} f^{*,A}(v')$ requires that $A(f)$ act monotonically from $\leq_{\sigma'}$ to $\leq_{\sigma_A(f)}$ on the bilattice. By the table in [gauge-connection](gauge-connection.md): elements of $K_4^{\,k}$ are $\leq_k$-monotone, so $\sigma' = \sigma_A(f) = \leq_k$ for $\mathrm{par}(h) = 0$; elements of $\{-, \sim\circ-\}$ are $\leq_k$-antitone, equivalently $\leq_k^{\mathrm{op}}$-monotone, so $\sigma' = \sigma_A(f) = \leq_k^{\mathrm{op}}$ for $\mathrm{par}(h) = 1$.

(b) By the canonical-extension normalization, $\varepsilon_A(f)$ is the $\sigma_A(f)$-bottom. The $\leq_k$-bottom of $\mathbf{FOUR}$ is $\bot$; the $\leq_k^{\mathrm{op}}$-bottom is the $\leq_k$-top, which is $\top$. So $\varepsilon_A(f) \in \{\bot, \top\}$ as the parity of $h$ dictates. Direct check: for $h \in K_4^{\,k}$, $h(\bot) = \bot$; for $h \in \{-, \sim\circ-\}$, $h(\bot) = \top$. Hence $\varepsilon_A(f) = h(\bot)$ in both cases — the gauged extension is the $A(f)$-image of the base extension. As an immediate consequence, the gauged reindexing factors as

$$f^{*,A} \;=\; A(f) \cdot f^* \qquad \text{(equality of cellwise functions, all parities)}, \tag{$\star$}$$

where $f^*$ is the base reindexing extending outside-support cells by $\bot$. On in-support cells both sides equal $A(f)(v(\phi_f(s,o)))$; on outside-support cells, $f^{*,A}$ extends by $\varepsilon_A(f) = h(\bot) = A(f)(\bot)$, which equals $A(f) \cdot f^*$ applied to the outside-support extension by $\bot$.

(c) By the standard lattice-enriched adjoint correspondence, the $\sigma_A(f)$-monotone map $f^{*,A}$ between complete fibers admits a $\sigma_A(f)$-left adjoint given by the $\sigma_A(f)$-supremum along fibers of $\phi_f$. For $\sigma_A(f) = \leq_k$, the $\leq_k$-supremum is $\exists^k_f$; for $\sigma_A(f) = \leq_k^{\mathrm{op}}$, the $\leq_k^{\mathrm{op}}$-supremum is the $\leq_k$-infimum, which is $\forall^k_f$. The pre-composition with $A(f)$ is the cellwise gauge action and gives $L^A_f = \pi_A(f)^k_f \cdot A(f)$ as stated.

The trio $(\sigma_A(f), \varepsilon_A(f), \pi_A(f))$ is therefore uniquely determined by $\mathrm{par}(h)$ alone. $\square$

The lemma is purely *per-edge* and does not assert anything about pullback squares or compositions of edges with mismatched parity. Compositional coherence is Lemma 1.

## The gauged Beck–Chevalley problem

Fix the standard pullback square in $\mathcal{C}$:

$$\begin{array}{ccc} P & \xrightarrow{p_A} & A \\ p_B \downarrow & & \downarrow f \\ B & \xrightarrow{g} & C \end{array} \qquad f \circ p_A = g \circ p_B.$$

The **$f$-leg gauged Beck–Chevalley map** is the canonical natural transformation

$$\mathrm{BC}_f^A : L^A_{p_A}\bigl( (p_B)^{*,A} \phi \bigr) \;\longrightarrow\; f^{*,A}\bigl( L^A_g \phi \bigr) \qquad (\phi \in \mathcal{E}_B);$$

the **$g$-leg** map is the symmetric one obtained by transposing $(f, p_A) \leftrightarrow (g, p_B)$. We say the square satisfies **full gauged BC** if both leg-maps are isomorphisms. We restrict attention throughout to **in-support comparison**: equality of $\mathrm{BC}_f^A$ on cells of $A$ in $\mathrm{im}(\phi_f)$. Outside-support behavior depends on the cleavage-extension values $\varepsilon_A$ and is handled separately at the end of the section.

The pullback functoriality identity $A(f)A(p_A) = A(g)A(p_B)$ is denoted $(\ast)$ throughout.

## The unified $h_0$-identity and reduction lemma

**Lemma 3 ($h_0$-identity, all parity regimes).** *In any pullback square in $\mathcal{C}$,*

$$h_0 \;:=\; A(p_A) \cdot A(p_B) \;=\; A(f) \cdot A(g) \;\in\; K_4. \tag{$\dagger$}$$

**Proof.** All factors lie in $K_4$, abelian with every element an involution. From $(\ast)$, right-multiply by $A(p_A)$ (using $A(p_A)^2 = e$): $A(f) = A(g) \cdot A(p_B) \cdot A(p_A)$. Right-multiply by $A(g)$:

$$A(f) \cdot A(g) \;=\; A(g) \cdot A(p_B) \cdot A(p_A) \cdot A(g) \;=\; A(g)^2 \cdot A(p_B) \cdot A(p_A) \;=\; A(p_B) \cdot A(p_A) \;=\; A(p_A) \cdot A(p_B),$$

where the second equality commutes the rightmost $A(g)$ leftward (abelian), the third uses $A(g)^2 = e$, and the last is one more abelian commutation. $\square$

The parity of $h_0$ is $\mathrm{par}(p_A) + \mathrm{par}(p_B) \equiv \mathrm{par}(f) + \mathrm{par}(g) \pmod 2$.

**Lemma 4 (reduction of $\mathrm{BC}_f^A$ to a single quantifier comparison).** *In any pullback square, the $f$-leg gauged BC map satisfies, on in-support cells of $f$,*

$$\mathrm{LHS}\big|_{\mathrm{in\text{-}supp}\,f} \;=\; h_0 \cdot f^*\bigl( Q_{g}^{\,\mathrm{LHS}}(\phi) \bigr), \qquad \mathrm{RHS}\big|_{\mathrm{in\text{-}supp}\,f} \;=\; h_0 \cdot f^*\bigl( \exists^{k}_g(\phi) \bigr),$$

*where $Q_{g}^{\,\mathrm{LHS}} \in \{\exists^{k}_g, \forall^{k}_g\}$ is determined by:*

$$Q_{g}^{\,\mathrm{LHS}} \;=\; \begin{cases} \exists^{k}_g & \mathrm{par}(p_A) + \mathrm{par}(h_0) \equiv 0 \pmod 2 \\ \forall^{k}_g & \mathrm{par}(p_A) + \mathrm{par}(h_0) \equiv 1 \pmod 2 \end{cases} \;=\; \begin{cases} \exists^{k}_g & \mathrm{par}(p_B) = 0 \\ \forall^{k}_g & \mathrm{par}(p_B) = 1. \end{cases}$$

**Proof.**

*RHS reduction.* By $(\star)$ for $f$: $\mathrm{RHS} = A(f) \cdot f^*(L^A_g \phi)$. Two sub-cases:

- *$\mathrm{par}(g) = 0$:* $L^A_g = \exists^{k}_g \cdot A(g)$. Since $A(g) \in K_4^{\,k}$ preserves $\vee_k$ strictly (with $A(g)(\bot) = \bot$ on empty fibers), $\exists^{k}_g \cdot A(g) = A(g) \cdot \exists^{k}_g$.
- *$\mathrm{par}(g) = 1$:* $L^A_g = \forall^{k}_g \cdot A(g)$. The parity-1 conjugation $\forall^{k}_g \cdot A(g) = A(g) \cdot \exists^{k}_g$ holds — cellwise: $\bigwedge_k\{A(g)(\phi(b))\} = A(g)(\bigvee_k\{\phi(b)\})$ since $A(g) \in \{-, \sim\circ-\}$ swaps $\wedge_k \leftrightarrow \vee_k$ ([gauge-twisted-reindexing-graded-homomorphism](../theorems/gauge-twisted-reindexing-graded-homomorphism.md)); empty fibers: $A(g)(\bot) = \top$ matches $\bigwedge_k \emptyset = \top$.

Either way, $L^A_g \phi = A(g) \cdot \exists^{k}_g(\phi)$, so $\mathrm{RHS} = A(f) \cdot f^*\bigl(A(g) \cdot \exists^{k}_g(\phi)\bigr)$. To commute $A(g)$ past $f^*$: on in-support cells of $f$, $f^*$ acts as strict precomposition with $\phi_f$, and $A(g)$ acts cellwise on bilattice values, so

$$f^*(A(g) \cdot \psi)(c_A) \;=\; A(g)\bigl(\psi(f(c_A))\bigr) \;=\; \bigl(A(g) \cdot f^*(\psi)\bigr)(c_A) \quad \text{for } c_A \in \mathrm{in\text{-}supp}\,f$$

(this commutation holds whether $A(g)$ is parity-0 or parity-1, since on in-support there is no $\bot$-extension to perturb). Hence on in-support of $f$:

$$\mathrm{RHS}\big|_{\mathrm{in\text{-}supp}\,f} \;=\; A(f) \cdot A(g) \cdot f^*(\exists^{k}_g(\phi)) \;\overset{(\dagger)}{=}\; h_0 \cdot f^*(\exists^{k}_g(\phi)).$$

*LHS reduction.* By $(\star)$ for $p_B$: $(p_B)^{*,A}\phi = A(p_B) \cdot p_B^*(\phi)$. Then $L^A_{p_A}((p_B)^{*,A}\phi) = Q_{p_A} \cdot A(p_A) \cdot A(p_B) \cdot p_B^*(\phi) = Q_{p_A}(h_0 \cdot p_B^*(\phi))$, where $Q_{p_A} = \exists^{k}_{p_A}$ if $\mathrm{par}(p_A) = 0$ and $\forall^{k}_{p_A}$ if $\mathrm{par}(p_A) = 1$. Now commute $h_0$ past $Q_{p_A}$:

- If $\mathrm{par}(h_0) = 0$ (so $h_0 \in K_4^{\,k}$): $h_0$ preserves both $\wedge_k$ and $\vee_k$ strictly, so $Q_{p_A}(h_0 \cdot \psi) = h_0 \cdot Q_{p_A}(\psi)$ — the quantifier is unchanged. Set $Q'_{p_A} := Q_{p_A}$.
- If $\mathrm{par}(h_0) = 1$ (so $h_0 \in \{-, \sim\circ-\}$): $h_0$ swaps $\wedge_k \leftrightarrow \vee_k$, so $Q_{p_A}(h_0 \cdot \psi) = h_0 \cdot Q'_{p_A}(\psi)$ where $Q'_{p_A}$ is the *opposite* quantifier ($\exists^{k}_{p_A} \leftrightarrow \forall^{k}_{p_A}$). The empty-fiber check matches: $h_0(\bot) = \top$, $h_0(\top) = \bot$, and $\bigvee_k \emptyset = \bot$, $\bigwedge_k \emptyset = \top$.

So $\mathrm{LHS} = h_0 \cdot Q'_{p_A}(p_B^*(\phi))$, where $Q'_{p_A}$ has parity $\mathrm{par}(p_A) + \mathrm{par}(h_0) \pmod 2$ as a $\forall$-vs-$\exists$ flag (0 = $\exists$, 1 = $\forall$). Apply the appropriate untwisted Beck–Chevalley iso ([beck-chevalley-commutation-on-predication-bilattices](../theorems/beck-chevalley-commutation-on-predication-bilattices.md)): $\exists^{k}_{p_A} \cdot p_B^* \cong f^* \cdot \exists^{k}_g$ and the dual $\forall^{k}_{p_A} \cdot p_B^* \cong f^* \cdot \forall^{k}_g$ both hold. Hence on in-support of $f$:

$$\mathrm{LHS}\big|_{\mathrm{in\text{-}supp}\,f} \;=\; h_0 \cdot f^*(Q^{\,\mathrm{LHS}}_g(\phi)),$$

with $Q^{\,\mathrm{LHS}}_g$ matching $Q'_{p_A}$ in flavor. Finally, since $\mathrm{par}(h_0) = \mathrm{par}(p_A) + \mathrm{par}(p_B)$, the flag $\mathrm{par}(p_A) + \mathrm{par}(h_0) \equiv \mathrm{par}(p_B) \pmod 2$ — the LHS quantifier on $g$ is determined entirely by $\mathrm{par}(p_B)$. $\square$

## Theorem: $f$-leg in-support gauged BC iff $\mathrm{par}(p_B) = 0$

**Theorem (in-support gauged BC, $f$-leg characterization).** *Let $(p, A, \sigma_A, \varepsilon_A, \pi_A)$ be an order-and-cleavage-gauged predication hyperdoctrine and consider any pullback square in $\mathcal{C}$. Then:*

1. *(Sufficiency, unconditional.) If $\mathrm{par}(A(p_B)) = 0$, the $f$-leg gauged Beck–Chevalley map $\mathrm{BC}_f^A$ is an isomorphism on the in-support locus of $f$ for every $\phi \in \mathcal{E}_B$.*
2. *(Necessity, with non-degeneracy.) Assume the pullback square is **$f$-non-degenerate**, meaning at least one of the following holds: (a) $\mathrm{im}(\phi_f) \not\subseteq \mathrm{im}(g)$; or (b) some $c \in \mathrm{im}(\phi_f) \cap \mathrm{im}(g)$ has non-singleton $g$-fiber $g^{-1}(c)$, and the bilattice in fiber $B$ is non-degenerate (admits two $\leq_k$-incomparable values). If $\mathrm{par}(A(p_B)) = 1$, then $\mathrm{BC}_f^A$ is **not** an isomorphism on the in-support locus of $f$: there exists $\phi \in \mathcal{E}_B$ for which the comparison map fails.*

In particular, the iff characterization holds for any non-degenerate square; degenerate squares (where every $c \in \mathrm{im}(\phi_f)$ lies in $\mathrm{im}(g)$ with singleton fiber, on a trivial bilattice) make $\forall^{k}_g$ and $\exists^{k}_g$ pointwise agree on $\mathrm{im}(\phi_f)$ for every $\phi$ and so trivially admit the iso even when $\mathrm{par}(p_B) = 1$ — but in that regime the gauged BC question is vacuous.

**Proof.** By Lemma 4, on in-support of $f$, $\mathrm{LHS} = h_0 \cdot f^*(Q^{\,\mathrm{LHS}}_g(\phi))$ and $\mathrm{RHS} = h_0 \cdot f^*(\exists^{k}_g(\phi))$, with $Q^{\,\mathrm{LHS}}_g = \exists^{k}_g$ iff $\mathrm{par}(p_B) = 0$.

*Sufficiency.* If $\mathrm{par}(p_B) = 0$, $\mathrm{LHS} = \mathrm{RHS}$ on in-support of $f$ by Lemma 4 plus the standard untwisted BC iso. This holds for every $\phi$, with no assumptions on the square.

*Necessity (non-degenerate case).* Suppose $\mathrm{par}(p_B) = 1$, so the in-support comparison reduces to $h_0 \cdot f^*(\forall^{k}_g(\phi))$ vs $h_0 \cdot f^*(\exists^{k}_g(\phi))$. Since $h_0$ is invertible, equality on in-support of $f$ holds for $\phi$ iff $\forall^{k}_g(\phi)(c) = \exists^{k}_g(\phi)(c)$ at every $c \in \mathrm{im}(\phi_f)$. Under non-degeneracy:
- *Case (a).* If some $c \in \mathrm{im}(\phi_f)$ lies outside $\mathrm{im}(g)$, then $g^{-1}(c) = \emptyset$ and $\forall^{k}_g(\phi)(c) = \top \neq \bot = \exists^{k}_g(\phi)(c)$ for every $\phi$ (independent of $\phi$), defeating the iso.
- *Case (b).* If some $c \in \mathrm{im}(\phi_f) \cap \mathrm{im}(g)$ has non-singleton $g$-fiber and the bilattice in $B$ admits two $\leq_k$-incomparable values $\alpha, \beta$, choose $\phi \in \mathcal{E}_B$ taking $\alpha$ on one fiber-element and $\beta$ on another. Then $\bigwedge_k\{\alpha,\beta\} \neq \bigvee_k\{\alpha,\beta\}$, so $\forall^{k}_g(\phi)(c) \neq \exists^{k}_g(\phi)(c)$, defeating the iso.

Either way, some $\phi$ defeats the in-support iso, so $\mathrm{BC}_f^A$ is not an in-support iso. $\square$

## Corollary: full in-support square BC iff $\mathrm{par}(p_A) = \mathrm{par}(p_B) = 0$

By the diagonal symmetry of the pullback square — the involution $(f, p_A) \leftrightarrow (g, p_B)$ that swaps the two legs — the analogous theorem for the $g$-leg gauged BC map reads: $\mathrm{BC}_g^A$ is an in-support iso (now on the in-support locus of $g$) iff $\mathrm{par}(A(p_A)) = 0$, under the symmetric $g$-non-degeneracy hypothesis (some $c \in \mathrm{im}(\phi_g)$ outside $\mathrm{im}(f)$, or some such $c$ with non-singleton $f$-fiber and non-trivial bilattice in fiber $A$).

**Corollary (full in-support gauged BC characterization).** *Assume the pullback square is both $f$-non-degenerate and $g$-non-degenerate. Then it satisfies full in-support gauged Beck–Chevalley (both leg-maps are in-support isos) if and only if $\mathrm{par}(A(p_A)) = \mathrm{par}(A(p_B)) = 0$. The sufficiency direction holds without the non-degeneracy hypotheses.*

By the parity-edge-sum constraint $\mathrm{par}(f) + \mathrm{par}(p_A) \equiv \mathrm{par}(g) + \mathrm{par}(p_B) \pmod 2$, the condition $\mathrm{par}(p_A) = \mathrm{par}(p_B) = 0$ forces $\mathrm{par}(f) = \mathrm{par}(g)$. So full in-support gauged BC holds in **exactly two parity regimes**:

- **Parity-0 uniform** ($A(\cdot) \in K_4^{\,k}$ on every edge): the gauging collapses to $\sigma_A \equiv \leq_k$, $\varepsilon_A \equiv \bot$, $\pi_A \equiv \exists$ everywhere, and the gauged BC reduces literally to the [$\leq_k$-axis twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md) (which gives the iso both on in-support *and* outside-support, since $\bot$ is preserved).
- **Top-bottom parity-1** ($\mathrm{par}(f) = \mathrm{par}(g) = 1$, $\mathrm{par}(p_A) = \mathrm{par}(p_B) = 0$): the LHS chain uses parity-0 commutations with $h_0 \in K_4^{\,k}$ ending in $\exists^{k}_g$; the RHS chain uses the parity-1 conjugation $\forall^{k}_g \cdot A(g) = A(g) \cdot \exists^{k}_g$, also ending in $\exists^{k}_g$. The two chains agree on in-support of $f$ (and symmetrically on in-support of $g$). However, the gauged extension values differ: $\varepsilon_A(p_A) = \varepsilon_A(p_B) = \bot$ but $\varepsilon_A(f) = \varepsilon_A(g) = \top$, so the *outside*-support behavior of the two sides need not agree, and full equality (in $\mathcal{E}_A$, not just on in-support of $f$) requires an additional outside-support analysis we do not carry out here. See [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md).

## Configurations that fail in-support BC

For non-degenerate squares (in the appropriate per-leg sense from the theorem), the remaining six parity regimes (parity-1 uniform, plus the five parity-mixed configurations with $\mathrm{par}(p_A) = 1$ or $\mathrm{par}(p_B) = 1$) fail at least one leg of the in-support gauged BC by Lemma 4 plus the theorem. Concretely, in any $f$-non-degenerate square the $f$-leg fails whenever $\mathrm{par}(p_B) = 1$, and dually the $g$-leg fails in any $g$-non-degenerate square whenever $\mathrm{par}(p_A) = 1$:

- Parity-1 uniform ($\mathrm{par} \equiv 1$): $\mathrm{par}(p_B) = 1$, $\mathrm{par}(p_A) = 1$ — both legs fail.
- $\{p_A, p_B\}$ parity-1: both legs fail.
- $\{f, p_B\}$ parity-1: $f$-leg fails ($\mathrm{par}(p_B) = 1$); $g$-leg holds ($\mathrm{par}(p_A) = 0$).
- $\{g, p_B\}$ parity-1: $f$-leg fails; $g$-leg holds.
- $\{f, p_A\}$ parity-1: $f$-leg holds; $g$-leg fails ($\mathrm{par}(p_A) = 1$).
- $\{g, p_A\}$ parity-1: $f$-leg holds; $g$-leg fails.

The asymmetric leg-failure patterns ($f$-only or $g$-only) are *not* artifacts: the gauged BC maps for the two legs are genuinely distinct, and the obstruction located by Lemma 4 lives on whichever projection ($p_A$ or $p_B$) is parity-1.

## Why the obstruction is structural (parity-1 projection legs)

The polarity swap $\pi_A(f) = \forall$ for parity-1 morphisms is an unavoidable consequence of joint gauging (Lemma 2): if one tries to *not* swap $\pi$ along parity-1 edges, the resulting $L^A_f$ is not the left adjoint of $f^{*,A}$ in any well-defined enrichment, breaking the basic adjoint structure that BC presupposes.

The $\exists/\forall$ mismatch isolated by Lemma 4 is the gauge-theoretic cost of a parity-1 *projection* leg ($p_A$ or $p_B$): the parity sub-connection $\mathrm{par} \circ A$ records the "$\wedge_k \leftrightarrow \vee_k$ swap" data, and that swap must be propagated through the BC chain, which it cannot do compatibly with the strict triple adjunction unless the projection legs are themselves parity-0.

## Recovery of the $\leq_k$-axis theorem

If $A$ takes values in $K_4^{\,k}$ throughout, every pullback square is automatically parity-0 uniform. The gauging collapses to $\sigma_A \equiv \leq_k$, $\varepsilon_A \equiv \bot$, $\pi_A \equiv \exists$, and the corollary's first regime reduces to [$\leq_k$-axis twisted Beck–Chevalley](../theorems/twisted-beck-chevalley.md) (which gives the iso both on in-support and outside-support, since the cleavage extension value $\bot$ is preserved by every $K_4^{\,k}$ action).

## Recovery of the untwisted hyperdoctrine

Setting $A = A_0$ (the trivial connection) gives $\mathrm{par} \circ A_0 \equiv 0$, so every square sits in the parity-0 uniform regime of the corollary, $f^{*,A_0} = f^*$, $L^{A_0}_f = \exists_f^k$. The gauged BC reduces to the untwisted [$\leq_k$-Beck–Chevalley](../theorems/beck-chevalley-commutation-on-predication-bilattices.md).

## What this resolves and what remains open

The sub-question of [curvature from pseudo-functorial connections](questions/curvature-from-pseudo-functorial-connections.md) asked: *what is the right notion of $K_4$-twisted predication hyperdoctrine in which structural data is gauged jointly with fiber automorphisms, such that all four elements of $K_4$ give a coherent twisted Beck–Chevalley?* The present construction answers it as follows:

1. **The structural data to gauge is the triple $(\sigma, \varepsilon, \pi)$** — order axis, cleavage extension value, quantifier polarity — restricted to the orbit of $\Theta_0$ under $K_4$. The triple is forced to move in lock-step (Lemma 2) and is determined by the parity sub-connection $\mathrm{par} \circ A$.

2. **In-support gauged BC has a per-leg characterization (Theorem).** Sufficiency is unconditional: $\mathrm{par}(A(p_B)) = 0$ ($\mathrm{par}(A(p_A)) = 0$) gives the $f$-leg ($g$-leg) in-support iso. Necessity, given $f$-non-degeneracy ($g$-non-degeneracy), reverses the implication. Full square in-support BC therefore holds iff $\mathrm{par}(A(p_A)) = \mathrm{par}(A(p_B)) = 0$ on every BC-relevant non-degenerate square (Corollary). By the parity-edge-sum constraint this admits exactly two parity regimes: parity-0 uniform, and the top-bottom parity-1 regime $\{f, g\}$ parity-1 with $\{p_A, p_B\}$ parity-0.

3. **The obstruction is located at parity-1 projection legs.** In the six remaining configurations (parity-1 uniform plus the five mixed configurations with at least one parity-1 projection), at least one BC leg fails on in-support, with the failure identified by Lemma 4 as the $\exists/\forall$ discrepancy coming from $\mathrm{par}(p_B) = 1$ (resp. $\mathrm{par}(p_A) = 1$ for the dual leg). The discrepancy $\forall^{k}_g(\phi) \neq \exists^{k}_g(\phi)$ on non-fiber-constant $\phi$ is the explicit obstruction.

4. **Outside-support behavior is open.** The two regimes admitting full in-support gauged BC differ in their cleavage-extension structure: parity-0 uniform has $\varepsilon_A \equiv \bot$ (so the iso extends globally), but the top-bottom parity-1 regime mixes $\varepsilon_A(p_A) = \varepsilon_A(p_B) = \bot$ with $\varepsilon_A(f) = \varepsilon_A(g) = \top$, and the outside-support equality of the two BC sides has not been analyzed here. Whether full equality in $\mathcal{E}_A$ (not merely on in-support of $f$) survives in the top-bottom parity-1 regime is left open and is the sort of question whose answer is expected to live in the [closure 2-monad](../morphisms/closure-2-monad.md) / pseudo-functorial framework (item (3) of the user's plan).

The full sub-question is **partially resolved**: the structural data $(\sigma, \varepsilon, \pi)$ is correctly identified and forced (Lemmas 1–2); the in-support coherence regime is characterized per leg by the Theorem (sufficiency unconditional, necessity for non-degenerate squares); the configurations admitting full in-support BC on every BC-relevant non-degenerate square are exactly two (Corollary); the failure cases carry an explicit $\exists/\forall$ obstruction located on parity-1 projection legs whenever a witness $\phi$ on a non-degenerate fiber exists. Open: outside-support analysis in the top-bottom parity-1 regime; an explicit 2-cocycle in $H^2$ witnessing the projection-leg obstruction; pseudo-functorial absorption.

## What this enables for cohomology

The [twisted equivariant cohomology decomposition](../theorems/twisted-equivariant-cohomology-decomposition.md) extends from its $K_4^{\,k}$-axis scope as far as in-support gauged BC permits. The Theorem and Corollary identify a *second* parity regime — top-bottom parity-1 — admitting full in-support BC, which (modulo the open outside-support analysis) suggests a strictly larger cohomological scope than parity-0 uniform alone: connections with $\mathrm{par}(A(p_A)) = \mathrm{par}(A(p_B)) = 0$ on every BC-relevant square may admit twisted equivariant cohomology even when $\{f, g\}$ are parity-1.

For configurations with at least one parity-1 projection leg, any twisted equivariant cohomology argument must replace the corresponding untwisted BC iso with a non-iso comparison map whose cokernel is exactly the $\exists/\forall$ discrepancy from Lemma 4. This converts an open question into a localized obstruction calculation per parity-1 projection leg.

## Position in predication categories

The order-and-cleavage-gauged hyperdoctrine is the right kinematic frame for analyzing $K_4$-valued gauge connections on a predication hyperdoctrine: the structural triple $(\sigma, \varepsilon, \pi)$ is the data the connection must move with, Lemma 2 forces the joint movement, and Lemma 1 makes it functorial. The construction is parsimonious — no extra data beyond the connection $A$ — and yet sufficient to formulate the full-$K_4$ twisted Beck–Chevalley question precisely.

The answer that question receives is structurally informative: in-support gauged BC has a clean per-leg characterization (parity of the *projection* leg controls each leg-iso, with sufficiency unconditional and necessity for non-degenerate squares), and full in-support coherence picks out exactly two parity regimes (on every BC-relevant non-degenerate square) related by the parity-edge-sum constraint. The asymmetry between projection legs ($p_A$, $p_B$) and base legs ($f$, $g$) is genuine — it arises from the directionality of the BC comparison map and is invisible to a "parity-uniform" analysis. The location of the failure mechanism on the projection-leg parity, traced through Lemma 4 to the parity-1 conjugation identity $\forall^{k}_g \cdot A(g) = A(g) \cdot \exists^{k}_g$, is the structural reason curvature in the predication-categorical setting attaches to the parity sub-connection $\mathrm{par} \circ A$ rather than to $A$ as a whole.

The construction makes precise the analogy between $K_4$ as a predication-categorical gauge group and $G$ as a classical-gauge-theoretic gauge group: a connection acts on every $G$-equivariant structure attached to the fibers — here, $(\sigma, \varepsilon, \pi)$ — and the global coherence of this action is what gauge curvature measures. The novelty here is the explicit per-leg characterization of the obstruction, with the projection legs of every BC-relevant square as the sites carrying the $H^2$-content.
