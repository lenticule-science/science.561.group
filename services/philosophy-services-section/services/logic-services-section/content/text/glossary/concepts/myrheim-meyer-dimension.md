---
type: concept
class: real-valued-invariant
symbol: "d_{\\mathrm{MM}}"
depends-on: [lorentzian-causal-settling, causal-set-substitution-settling, settling-associated-sheaf, lorentzian-apex-void-as-timelike-spacelike]
see-also: [myrheim-meyer-dimension-from-ordering-fraction, continuum-lorentzian-limit, horizon-area-bound]
title: Myrheim–Meyer dimension
description: The Myrheim–Meyer dimension of a causal settling is a real-valued invariant computed from the ratio of causally-related pairs to total pairs — the "ordering fraction" — via a formula calibrated against $d$-dimensional Minkowski space.
---

# Myrheim–Meyer dimension

The **Myrheim–Meyer dimension** of a causal settling is a real-valued invariant computed from the ratio of causally-related pairs to total pairs — the "ordering fraction" — via a formula calibrated against $d$-dimensional Minkowski space. It is the discrete-causal-set analog of the topological dimension of a Lorentzian manifold, computable purely from the combinatorial structure of the causal order with no reference to coordinates or a metric.

## Background: the classical estimator

In causal-set quantum gravity ([@myrheim1978], [@meyer1988]), a causal set $C$ with $N$ elements embedded in $d$-dimensional Minkowski space has an expected **ordering fraction**:

$$r_d \;:=\; \mathbb{E}\!\left[\frac{|\{(x,y) : x \prec y\}|}{\binom{N}{2}}\right] \;\xrightarrow{N \to \infty}\; f(d)$$

where $f(d)$ is a dimension-dependent constant:

$$f(d) \;=\; \frac{\Gamma(d+1)^2}{2\,\Gamma(2d+1)} \cdot d.$$

Computed values: $f(2) = 1/4$, $f(4) \approx 0.042$, with $f(d) \to 0$ as $d \to \infty$ (high-dimensional spacetimes have few causally-related pairs relative to total pairs — most pairs are spacelike).

The **Myrheim–Meyer estimator** inverts this: given an observed ordering fraction $r$ from a finite causal set, estimate the dimension as $d_\mathrm{MM} := f^{-1}(r)$ (the value of $d$ for which $f(d) = r$, solving numerically since $f$ is smooth and monotone decreasing).

## Definition in the corpus

For a [Lorentzian causal settling](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/lorentzian-causal-settling.md) $v$ on a finite causal set $(E, \preceq)$ with $|E| = N$:

**The ordering fraction** is:
$$r(v) \;:=\; \frac{|\mathrm{Apex}_v|}{\binom{N}{2}} \;=\; \frac{2\,|\mathrm{Apex}_v|}{N(N-1)},$$
where $\mathrm{Apex}_v = \{(e_1, e_2) : v(e_1, e_2) = \mathbf{t},\; e_1 \neq e_2\}$ counts strictly-ordered pairs.

**The Myrheim–Meyer dimension** of $v$ is:
$$d_\mathrm{MM}(v) \;:=\; f^{-1}(r(v)),$$
where $f^{-1}$ is the inverse of the Myrheim–Meyer function $f(d) = \Gamma(d+1)^2/(2\Gamma(2d+1)) \cdot d$, defined for $d > 0$ with $f$ extended to real $d$ via the gamma-function formula.

For $r(v) > f(2) = 1/4$: the causal set is "lower-dimensional than 2D Minkowski" — either genuinely 1-dimensional (a chain) or has atypically many causal relations.
For $r(v) < f(4) \approx 0.042$: the causal set is "higher-dimensional than 4D Minkowski."

## For causal-set substitution settlings

For a [causal-set substitution settling](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/objects/causal-set-substitution-settling.md) $v^\mathrm{CS}_\mathcal{S}$ with tower $(E_k, \prec_k)$ and substitution matrix $M$:

**The ordering fraction at level $k$** is $r_k := |\mathrm{Apex}_{v_k}| / \binom{|E_k|}{2}$.

**The asymptotic ordering fraction** is $r_\infty := \lim_{k \to \infty} r_k$ (existence proved in [myrheim-meyer-dimension-from-ordering-fraction](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/theorems/myrheim-meyer-dimension-from-ordering-fraction.md)).

**The Myrheim–Meyer dimension** of the causal-set substitution settling is:
$$d_\mathrm{MM}(\mathcal{S}) \;:=\; f^{-1}(r_\infty).$$

This is a new invariant of the causal-set substitution settling, complementing the topological invariant $\mathrm{cl\text{-}inv}^{(n)} \cong \mathbb{Z}^n$:
- $\mathrm{cl\text{-}inv}^{(n)}$ captures the topology (connectivity structure) of the causal set — how many independent cohomology classes.
- $d_\mathrm{MM}$ captures the geometry (dimension structure) — how many spacetime dimensions the causal set approximates.

The two invariants are independent: two causal-set substitution settlings can have the same $\mathrm{cl\text{-}inv}^{(n)} \cong \mathbb{Z}^n$ (same universality class) but different $d_\mathrm{MM}$ (different effective spacetime dimension).

## Example: the diamond substitution

For the diamond-substitution causal set (4 events, relations $a \prec b, a \prec c, a \prec d, b \prec d, c \prec d$):

$|\mathrm{Apex}_{v_1}| = 5$ (five strictly-ordered pairs: $(a,b), (a,c), (a,d), (b,d), (c,d)$), $|E_1| = 4$.

$r_1 = 5/\binom{4}{2} = 5/6 \approx 0.833$.

Solving $f(d) = 5/6$: since $f(2) = 1/4$ and $f(d) \to 1$ as $d \to 0^+$, we need $d < 1$. This gives $d_\mathrm{MM} \approx 0.4$ for the single-level diamond — reflecting that the diamond is "sub-1-dimensional" (it has more causal relations per pair than 1D Minkowski, because 1D Minkowski has $r = 1/2$ for a chain).

As $k$ grows, $r_k$ converges to $r_\infty$ determined by the substitution rule's self-similar structure. The asymptotic dimension $d_\mathrm{MM}(\mathcal{S}_\diamond)$ is the intrinsic "fractal dimension" of the diamond substitution causal set — an algebraic-number invariant related to $\lambda_\mathrm{PF} = 4$ and the causal-link density within the diamond pattern.

## What makes this a genuine corpus invariant

The ordering fraction $r(v)$ is computable from the apex: $|\mathrm{Apex}_v|$ is already an invariant used in the [settling Gauss–Bonnet theorem](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/theorems/settling-gauss-bonnet.md) ($\chi = |\mathrm{Apex}| - |L_\mathrm{ns}|$). The Myrheim–Meyer dimension is a non-linear function of $r$, but it is a function of $|\mathrm{Apex}|/|E|^2$ alone — so it is computable from data already present in the corpus's settling machinery.

In the Gauss–Bonnet picture: $\chi = |\mathrm{Apex}| - |L_\mathrm{ns}|$ connects topology and curvature. The Myrheim–Meyer dimension $d_\mathrm{MM} = f^{-1}(|\mathrm{Apex}|/|E|^2)$ connects geometry and combinatorics. The two together give a "spacetime portrait" of the causal settling:

$$\bigl(\\underbrace{d_\mathrm{MM}}_\text{geometry},\; \underbrace{\chi^{(n)}}_\text{topology},\; \underbrace{\mathrm{cl\text{-}inv}^{(n)}}_\text{classifying invariant}\bigr)$$

a triple of invariants capturing complementary aspects of the settling's causal structure.
