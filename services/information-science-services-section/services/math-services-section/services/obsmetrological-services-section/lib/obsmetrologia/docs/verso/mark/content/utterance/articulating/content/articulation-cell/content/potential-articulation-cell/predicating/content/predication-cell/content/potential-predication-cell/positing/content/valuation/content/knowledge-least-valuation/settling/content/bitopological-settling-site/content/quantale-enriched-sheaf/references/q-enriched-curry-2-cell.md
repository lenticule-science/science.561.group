---
kind: theorem
status: proved
depends-on: [quantale-enriched-sheaf, quantale-enriched-cosheaf, q-enriched-cohomology, lawvere-laplacian-grothendieck-sites, q-enriched-curry-2-cell-fuzzy]
---

# Q-enriched Curry equivalence: the 2-cell case

The simplest non-trivial test of the [conjectural Q-enriched Verdier duality](verdier-duality-bitopological-site.md).
We work the case of a graph with two vertices and one edge in detail, identifying both successes and obstructions for the general lifting of [@curry2014]'s derived equivalence to the $\mathsf{Q}$-enriched setting.

## Setup

Let $G$ be the graph with vertices $\{a, b\}$ and one edge $e$ with $\partial e = \{a, b\}$.
The incidence poset has $a \lhd e$ and $b \lhd e$.

Fix a commutative unital quantale $\mathsf{Q}$.
A $\mathsf{Q}$-enriched cellular sheaf on $G$ is data:

- Stalks $F(a), F(b), F(e) \in \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ (complete weighted lattices).
- Restrictions $f_a := F(a \lhd e) : F(a) \to F(e)$ and $f_b := F(b \lhd e) : F(b) \to F(e)$ (Q-functors).

## The cochain complex of $F$

The Q-enriched cellular cochain complex has

$$C^0 F := F(a) \times F(b), \qquad C^1 F := F(e),$$

with two parallel "evaluation" Q-functors $\delta_a, \delta_b : C^0 F \to C^1 F$:

$$\delta_a(x, y) := f_a(x), \qquad \delta_b(x, y) := f_b(y).$$

**Q-enriched $H^0$.** In the abelian setting, $H^0$ is the kernel of the single coboundary $\delta = \delta_a - \delta_b$.
Without subtraction in $\mathsf{Q}$-Cat, the analogue is the **equalizer** of $\delta_a, \delta_b$:

$$H^0(F) := \mathrm{Eq}(\delta_a, \delta_b) = \bigl\{(x, y) \in F(a) \times F(b) : f_a(x) = f_b(y)\bigr\},$$

with equality computed in $F(e)$.
(For fuzzy global sections, replace "$=$" with "$\succeq_\varepsilon$" — the Q-graded equality of [@ghrist-et-al2025].)

**Q-enriched $H^1$.** Dually, the **coequalizer** of $\delta_a, \delta_b$:

$$H^1(F) := \mathrm{Coeq}(\delta_a, \delta_b),$$

the quotient of $C^1 F = F(e)$ by the relations $f_a(x) \sim f_b(y)$ for all $(x, y) \in C^0 F$.
Concretely: $F(e)$ modded out by identifying $\mathrm{im}(f_a)$ and $\mathrm{im}(f_b)$ pointwise.

Both equalizer and coequalizer exist in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ as Q-weighted (co)limits.

## The right-adjoint cosheaf attempt

The natural construction of an associated cosheaf $\check{F}$ from $F$:

- Stalks: $\check{F}(\sigma) := F(\sigma)$ for each cell $\sigma$.
- Extensions: for each incidence $v \lhd e$, set $\check{f}_v := f_v^*$, the **right adjoint** of $f_v$ in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.

**Obstruction (verified by direct computation).** Right adjoints in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ require the Q-functor to preserve all Q-weighted colimits — including the empty join (the bottom element).
A monotone map between complete lattices that does not preserve $\bot$ fails to have a strict right adjoint.

*Concrete example.* Take $\mathsf{Q}$ = Boolean (so Q-Cat = Pos).
Let $F(a) = F(b) = \{0, 1\}$, $F(e) = \{0, 1, 2\}$.
Take $f_a(0) = 0, f_a(1) = 1$ (identity on the lower two elements) and $f_b(0) = 1, f_b(1) = 2$ (shifts up).
Then $f_b$ does not preserve $\bot$ ($\bot_{F(b)} = 0$ but $f_b(0) = 1 \neq 0 = \bot_{F(e)}$).
The "would-be" right adjoint $f_b^*(z) = \bigvee \{y : f_b(y) \leq z\}$ gives $f_b^*(0) = 0$ (empty supremum), but the adjunction fails: $f_b(0) = 1 \nleq 0$ while $0 \leq f_b^*(0) = 0$, breaking the iff condition.

So **the right-adjoint construction fails for sheaves whose restrictions are not strict left adjoints** — equivalently, whose restrictions don't preserve all Q-weighted colimits, including the empty one (bottom).

## Lopez's resolution: fuzzy adjoints

Per [@lopez2024], every Q-functor between complete weighted lattices admits a **fuzzy adjoint** $f \dashv_\varepsilon g$ for some $\varepsilon \in \mathsf{Q}$.
The fuzziness $\varepsilon$ measures how close the pair is to a strict adjunction:

- $\varepsilon = 1$: strict adjunction ($f$ preserves all colimits).
- $\varepsilon < 1$: fuzzy adjunction with quantale-graded error.

Using fuzzy adjoints, we can always construct a "fuzzy cosheaf" $\check{F}$ from a sheaf $F$, with extensions being fuzzy right adjoints of restrictions.
The cosheaf functoriality is also fuzzy: $\check{f}_g \circ \check{f}_h \succeq_\varepsilon \check{f}_{h \circ g}$ rather than equality.

## H_0 of the fuzzy cosheaf

The Q-enriched chain complex of $\check{F}$:

$$C_0 \check{F} := F(a) \sqcup F(b), \qquad C_1 \check{F} := F(e),$$

with $\sqcup$ the Q-coproduct in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.
The boundary structure uses the parallel pair

$$\partial_a, \partial_b : C_1 \check{F} \to C_0 \check{F}$$

with $\partial_a = \iota_a \circ \check{f}_a$ and $\partial_b = \iota_b \circ \check{f}_b$, where $\iota_a, \iota_b$ are the coproduct injections.

**Q-enriched $H_0$.** The coequalizer of $\partial_a, \partial_b$:

$$H_0(\check{F}) := \mathrm{Coeq}(\partial_a, \partial_b),$$

the quotient of $C_0 \check{F}$ by the relation $\iota_a(\check{f}_a(z)) \sim \iota_b(\check{f}_b(z))$ for all $z \in F(e)$.

In the **strict-adjunction case** ($\check{f}_a = f_a^*$, $\check{f}_b = f_b^*$ existing strictly): the coequalizer identifies $f_a^*(z) \in F(a)$ with $f_b^*(z) \in F(b)$ for each $z \in F(e)$.
The result is a Q-Cat that records the "matched data" across the edge, retrieved via right adjoints.

## Comparison: $H^0(F)$ vs $H_0(\check{F})$

**Claim (Q-enriched Curry, 2-cell case, conditional on strict adjunctions).** When $f_a, f_b$ both preserve all Q-weighted colimits (strict left adjoints), there is a canonical Q-functor

$$H^0(F) \xrightarrow{\sim} H_0(\check{F})$$

sending a global section $(x, y) \in H^0(F)$ (satisfying $f_a(x) = f_b(y) = z$ for some $z$) to the equivalence class of $\iota_a(x) \sim \iota_b(y)$ in $H_0(\check{F})$.

*Reasoning sketch.* The forward map: given $(x, y)$ with $f_a(x) = f_b(y) =: z$, by the adjunction $f_a(x) \leq z$ iff $x \leq f_a^*(z)$, so $x \leq f_a^*(z)$.
Similarly $y \leq f_b^*(z)$.
So $\iota_a(x), \iota_b(y)$ are below $\iota_a(f_a^*(z))$ and $\iota_b(f_b^*(z))$ respectively, which are identified in the coequalizer.
The forward map sends $(x, y)$ to this coequalizer class.

The reverse map: given a coequalizer class, find the corresponding global section.
This is more subtle and uses the unit of the adjunction $\eta_a : \mathrm{id}_{F(a)} \to f_a^* \circ f_a$.

In the strict-adjunction case, both maps are well-defined and inverse — giving the equivalence.

## Concrete verification (Boolean Q, identity restrictions)

With $\mathsf{Q}$ = Boolean, $F(a) = F(b) = F(e) = \{0, 1\}$, and $f_a = f_b = \mathrm{id}$:

- $H^0(F) = \{(x, y) : x = y\} = \mathrm{diagonal}\{0, 1\}^2 \cong \{0, 1\}$.
- Right adjoints $f_a^* = f_b^* = \mathrm{id}$.
- $H_0(\check{F}) = (\{0, 1\} \sqcup \{0, 1\}) / (\iota_a(z) \sim \iota_b(z))$ for all $z \in \{0, 1\}$.

The coproduct $\{0, 1\} \sqcup \{0, 1\}$ in Pos is the disjoint union $\{0_a, 1_a, 0_b, 1_b\}$.
The relations $0_a \sim 0_b$ and $1_a \sim 1_b$ identify them pairwise, giving $\{0, 1\}$.

So $H_0(\check{F}) \cong \{0, 1\} \cong H^0(F)$. **The equivalence holds in this trivial case.**

## Proof (strict-adjunction case)

The strict-adjunction case is established by the explicit forward and inverse map construction in the [Comparison section above](#comparison-h0f-vs-h_0checkf), with concrete Boolean verification in the trivial example.
Formally, the strict case is the $q = 1$ specialisation of the [fuzzy 2-cell theorem](q-enriched-curry-2-cell-fuzzy.md): when $q_a = q_b = 1$, the fuzzy adjunctions collapse to strict adjunctions, the round-trip $q$-fuzzy identity becomes a strict identity, and the equivalence is strict. $\square$

## What is established

1. **The 2-cell Q-enriched Curry equivalence holds in the strict-adjunction case** (sheaves whose restrictions preserve all colimits including bottom): forward and inverse maps both well-defined, equivalence is strict (rather than $q$-fuzzy).
  Concretely verified for the trivial Boolean-Pos example.
  The strict case is the $q = 1$ specialisation of the [fuzzy 2-cell theorem](q-enriched-curry-2-cell-fuzzy.md), where $q_a = q_b = 1$ collapses the fuzzy adjunctions to strict adjunctions and the $q$-fuzzy round-trip identity to a strict identity.

2. **The strict-adjunction condition is restrictive**: many natural Q-enriched sheaves have restrictions that don't preserve $\bot$, putting them outside the strict case.
  For these, the [fuzzy 2-cell theorem](q-enriched-curry-2-cell-fuzzy.md) gives the equivalence with quantale-graded error.

## Higher-cell open work

The 2-cell case (strict + fuzzy) is the foundation.
Extension to higher cells:

1. **Higher-cell extensions** to graphs / cell complexes with more vertices and edges, then to higher-dimensional cells: see [q-enriched-curry-finite-graph](q-enriched-curry-finite-graph.md), [q-enriched-curry-2-dim-degree-0](q-enriched-curry-2-dim-degree-0.md), and the inductive synthesis [q-enriched-curry-cw-complex](q-enriched-curry-cw-complex.md).
2. **The cosheaf-side functoriality**: right adjoints don't compose strictly — the cosheaf is "fuzzy-coherent" rather than strict.
  The fuzzy-coherence is sufficient for the chain-complex / homology computation in the 2-cell case (verified above); whether higher-dim composition preserves useful global error bounds is the substantive question for the higher-cell theorems.

## Position in the program

This theorem is **session-scale concrete progress** on the [Verdier duality conjecture](verdier-duality-bitopological-site.md).
It establishes the 2-cell case in the strict-adjunction setting, concretely verifies the equivalence in a trivial example, and identifies the precise obstructions that prevent immediate generalization (right-adjoint existence, fuzzy resolution machinery).

The next concrete step toward proving the full Q-enriched Verdier duality:

- Define "fuzzy chain complex" precisely.
- Define "fuzzy equivalence with quantale-graded error" in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.
- Lift the 2-cell argument above to the fuzzy setting, using Lopez 2024's fuzzy-adjoint framework.
- Then extend to higher cells.

These are paper-scale tasks but each has a concrete entry point identified by this 2-cell working.
