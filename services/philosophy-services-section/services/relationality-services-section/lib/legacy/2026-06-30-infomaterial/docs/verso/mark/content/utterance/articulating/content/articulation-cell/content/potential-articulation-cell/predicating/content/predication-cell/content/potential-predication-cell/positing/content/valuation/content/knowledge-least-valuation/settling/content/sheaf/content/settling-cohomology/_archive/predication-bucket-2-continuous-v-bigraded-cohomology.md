---
type: question
class: internal
status: open
explores:
  - bigraded-settling-cohomology
  - bigraded-aperiodic-regime-trichotomy
  - bigraded-realizability-refinement
  - continuous-valued-step-n-cohomological-rank
  - d-frame-cohomology-comparison
  - q-enriched-cohomology
---

# Continuous-V bigraded cohomology

The bilattice case has [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) splitting the $H^1$-class into truth-axis and knowledge-axis components, with the [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md) stratifying aperiodic settlings into consistent / paraconsistent / mixed sub-strata. The [bigraded realizability refinement theorem](../theorems/bigraded-realizability-refinement.md) gives the realizable family.

The corpus's [continuous-L predication settlings question](continuous-L-predication-settlings.md) flagged "bigraded-cohomology in the continuous case" as open. The [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) gives a rank-$n$ structure on the continuous-V classifying invariant; the bigraded refinement would split this into per-axis components.

This question sets up the work to extend the bigraded cohomology to continuous-V values.

## What the corpus has

- [Bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) (defined): the $\mathbf{Ab}$-valued bigraded structure.
- [Bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md) (proved): consistent / paraconsistent / mixed sub-strata.
- [Bigraded realizability refinement theorem](../theorems/bigraded-realizability-refinement.md) (proved): independent realizability of the two axes on discrete predicate categories.
- [Bigraded cohomology via mapping cone theorem](../theorems/bigraded-cohomology-via-mapping-cone.md) (proved): mapping-cone presentation.
- [Continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) (sketch): rank-$n$ continuous-V structure.
- [D-frame cohomology comparison theorem](../theorems/d-frame-cohomology-comparison.md) (proved): connects d-frame cohomology to abelian shadow with per-side rank data.
- No continuous-V bigraded structure.

## What the public literature has that this question needs to read

- **Standard bigraded / multigraded homological algebra** — Brown, Cartan–Eilenberg.
- **Mapping-cone constructions in derived categories** — standard; the bilattice corpus uses them (per the [bigraded cohomology via mapping cone theorem](../theorems/bigraded-cohomology-via-mapping-cone.md)).
- **Multigraded sheaf cohomology** — Hartshorne; the projective-variety multigraded analog.
- **Q-enriched cohomology refinements** — the Lawvere–Laplacian / Tarski–Lawvere fixed-point structure for $\mathcal{V}$-graded cochains.
- **Recent bigraded persistence cohomology** — for the multi-parameter persistence side.

## The question

Does the bilattice [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) extend to continuous-V values, splitting the $\mathcal{V}^n$ classifying invariant into per-axis components $(\mathcal{V}^{n_+}, \mathcal{V}^{n_-})$ with $n_+ + n_- = n$?

## Sub-questions

### (a) Continuous-V bigraded structure definition

In the bilattice case, the bigraded cohomology has $H^1_{\mathbf{t}}$ (truth-side $H^1$) and $H^1_{\mathbf{k}}$ (knowledge-side $H^1$) — or, in a refined splitting, four sub-components per the mapping-cone trichotomy. The continuous-V analog should have continuous-V truth-side and knowledge-side cohomologies $H^1_\mathcal{V, t}$ and $H^1_\mathcal{V, k}$ as $\mathcal{V}$-modules.

Sub-question (a) asks: define the continuous-V bigraded cohomology precisely. The expected form: paired Q-enriched cochain complex $(\mathcal{F}^t_\mathcal{V}, \mathcal{F}^k_\mathcal{V})$ with mapping-cone or product structure.

### (b) Bigraded refinement of the continuous-V rank-$n$ theorem

The [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) gives $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V} \cong \mathcal{V}^n$. The bigraded refinement should split this:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}_\mathcal{V} \;\cong\; \mathcal{V}^{n_+} \oplus \mathcal{V}^{n_-}, \qquad n_+ + n_- = n,$$

with per-letter truth-/falsity-side allocation determined by the substitution rule's default valuation (per [benchmark-1-fibonacci](../examples/benchmark-1-fibonacci.md), where $a \mapsto \mathbf{t}$ and $b \mapsto \mathbf{f}$ give $(n_+, n_-) = (1, 1)$ for Fibonacci).

Sub-question (b) asks: state and prove the bigraded refinement theorem. The bilattice case's proof structure should transfer.

### (c) Bigraded continuous-V trichotomy

The [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md) classifies bilattice settlings as consistent ($n_- = 0$), paraconsistent ($n_+ = n_- = n/2$ in some sense), or mixed. The continuous-V trichotomy should give an analogous classification with continuous-V coefficients.

Sub-question (c) asks: state the continuous-V trichotomy. The substantively new content is that *intermediate* per-axis weights can occur — a continuous-V settling can have a fractional-axis split that the discrete bilattice case cannot.

### (d) Bigraded realizability in continuous-V

The [bigraded realizability refinement theorem](../theorems/bigraded-realizability-refinement.md) gives the realizable bigraded family in the bilattice case. The continuous-V analog: which $(\mathcal{V}^{n_+}, \mathcal{V}^{n_-})$ pairs are realized by continuous-V settlings?

Sub-question (d) asks: characterize the realizable continuous-V bigraded family. The expected structure: a $\mathcal{V}$-parameterized family of pairs of initial segments, generalizing the bilattice's discrete two-parameter family.

### (e) Connection to MV-spectrum / Priestley split

If the [MV-bilattice spectrum duality question](mv-bilattice-spectrum-duality.md) is settled, the bigraded structure on the algebraic side should dualize to a paired-spectrum split on the topological side: $\mathrm{Spec}_+(\mathbf{L})$ and $\mathrm{Spec}_-(\mathbf{L})$ as the two components of the paired MV-spectrum.

Sub-question (e) asks: verify that the bigraded continuous-V cohomology corresponds dually to per-component MV-spectrum cohomology.

## What would settle the question

Five deliverables:

1. **Continuous-V bigraded structure definition** (a).
2. **Bigraded refinement of the rank-$n$ theorem** (b) — the main mathematical deliverable.
3. **Continuous-V trichotomy** (c).
4. **Bigraded continuous-V realizability** (d).
5. **Spectrum-side correspondence** (e) — depends on MV-spectrum duality.

Deliverables 1–3 are session-to-cluster scale. Deliverables 4–5 are research-program-scale.

## Why this question

The bigraded cohomology is one of the corpus's distinctive features — the truth-axis / knowledge-axis split that the public bilattice / sheaf-cohomology literature does not have. Extending it to continuous-V:

- Completes the continuous-V cohomology program at the per-axis-resolved level.
- Gives the trichotomy (consistent / paraconsistent / mixed) a continuous-V refinement, where the per-axis weights can be fractional.
- Makes the bigraded realizability program continuous-V-aware.

What the corpus's machinery would yield specifically:

- *Continuous-V trichotomy with fractional sub-strata* — a structurally new feature; the bilattice case has only three discrete sub-strata, but the continuous-V case has a $\mathcal{V}$-parameterized family.
- *Per-axis $\mathcal{V}$-rank decomposition* — extends the bilattice rank-$n$ to $(\mathcal{V}^{n_+}, \mathcal{V}^{n_-})$.

## Position in the program

This question is the per-axis-resolved companion to the [continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md). It depends on the rank-$n$ theorem being settled and on the [Q-enriched aperiodic direct-limit cohomology question](q-enriched-aperiodic-direct-limit-cohomology.md) being substantively addressed.

It interlocks with:

- [Continuous-valued step-$n$ cohomological rank theorem](../theorems/continuous-valued-step-n-cohomological-rank.md) — gives the unified rank.
- [MV-bilattice spectrum duality question](mv-bilattice-spectrum-duality.md) — for the spectrum-side correspondence.
- [Continuous-V d-frame structure question](continuous-V-d-frame-structure.md) — d-frames give the natural bigraded structure.
- [Q-enriched aperiodic direct-limit cohomology question](q-enriched-aperiodic-direct-limit-cohomology.md) — the foundational Q-enriched direct-limit framework.

This question stays `open` until sub-question (a) defines the continuous-V bigraded structure.
