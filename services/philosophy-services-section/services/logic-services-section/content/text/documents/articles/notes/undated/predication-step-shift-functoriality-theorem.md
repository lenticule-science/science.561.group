---
type: theorem
status: proved
depends-on: [step-shift-morphism, step-n-moduli-substack, step-n-substitution-rule, step-n-cohomological-rank-theorem, canonical-step-shift-morphism]
title: Step-shift functoriality theorem
description: The step-shift morphism is functorial on the family of step-$n$ moduli sub-stacks once the extension-vector data is fixed, with composition realising multi-step extensions and a colimit existing in the 2-category of stacks.
---

# Step-shift functoriality theorem

The [step-shift morphism](../../research/2026/07/31/lenticule-import/morphisms/step-shift-morphism.md) is functorial on the family of [step-$n$ moduli sub-stacks](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/content/step-n-moduli-substack/step-n-moduli-substack.md) once the extension-vector data is fixed, with composition realising multi-step extensions and a colimit existing in the 2-category of stacks. **The colimit's independence from extension-data choices is open** — it is the [canonical step-shift morphism question](../../research/2026/07/31/lenticule-import/from-predicate-category/questions/canonical-step-shift-morphism.md).

## Statement

Let $\mathbf{ExtData}$ denote the category whose objects are sequences $\boldsymbol{e} = \{(\mathbf{c}_n, \mathbf{r}_n)\}_{n \geq 2}$ of extension-vector pairs $(\mathbf{c}_n, \mathbf{r}_n) \in \mathbb{N}^n \times \mathbb{N}^n$ satisfying the primitivity-preserving condition (some component of $\mathbf{c}_n$ and some component of $\mathbf{r}_n$ are non-zero), with morphisms termwise comparison.

**Theorem (step-shift functoriality).** *For each fixed extension-data sequence $\boldsymbol{e} \in \mathbf{ExtData}$:*

1. *Each $\sigma_n^{n+1}[\mathbf{c}_n, \mathbf{r}_n] : \mathscr{M}^{(n)} \to \mathscr{M}^{(n+1)}$ is a $1$-morphism in the $2$-category of stacks.*

2. *Composition $\sigma_{n+1}^{n+2}[\mathbf{c}_{n+1}, \mathbf{r}_{n+1}] \circ \sigma_n^{n+1}[\mathbf{c}_n, \mathbf{r}_n]$ is a two-step extension morphism whose substitution-matrix extension is the concatenation*

$$M \;\mapsto\; \begin{pmatrix} M & \mathbf{c}_n & \mathbf{c}'_{n+1} \\ \mathbf{r}_n & 0 & c \\ \mathbf{r}'_{n+1} & r & 0 \end{pmatrix}$$

*for appropriate sub-block data, and is associative in the standard sense.*

3. *The ascending chain $\mathscr{M}^{(2)} \xrightarrow{\sigma[\boldsymbol{e}]} \mathscr{M}^{(3)} \xrightarrow{\sigma[\boldsymbol{e}]} \cdots$ has a $2$-categorical colimit*

$$\mathscr{M}^{(\infty)}[\boldsymbol{e}] \;:=\; \mathrm{colim}_n \mathscr{M}^{(n)}$$

*in the $2$-category of stacks.*

*The colimit's dependence on $\boldsymbol{e}$ is non-trivial in general: different choices of $\boldsymbol{e}$ produce $2$-categorically distinct $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$.*

## Proof

### Part 1: each $\sigma_n^{n+1}[\mathbf{c}_n, \mathbf{r}_n]$ is a stack morphism

The step-shift acts on a step-$n$ substitution rule $\mathcal{S}$ with matrix $M$ by producing the step-$(n+1)$ rule with extended matrix

$$M' \;=\; \begin{pmatrix} M & \mathbf{c}_n \\ \mathbf{r}_n & 0 \end{pmatrix} \in \mathrm{Mat}_{(n+1) \times (n+1)}(\mathbb{N}).$$

The primitivity-preservation condition on $(\mathbf{c}_n, \mathbf{r}_n)$ ensures $M'$ is primitive (some power of $M'$ is strictly positive); the assignment $\mathcal{S} \mapsto \sigma_n^{n+1}[\mathbf{c}_n, \mathbf{r}_n](../../research/2026/07/31/lenticule-import/from-predicate-category/\mathcal{S})$ is well-defined on representatives.

Closure-equivalence-respecting: closure-equivalent rules $\mathcal{S}, \mathcal{S}'$ have the same closure operator, hence the same substitution matrix up to base-change in $\mathrm{GL}(n, \mathbb{Z})$. The extended matrices $M', M''$ differ by the same base change extended by the identity on the new coordinate, so they are $\mathrm{GL}(n+1, \mathbb{Z})$-equivalent and produce closure-equivalent step-$(n+1)$ rules. Hence the assignment descends to closure-equivalence classes — i.e., to meta-points in $\mathscr{M}^{(n+1)}$.

Stack-morphism conditions (descent along covers in the parameter base $J_\mathbf{B}$) follow by the [meta-moduli stack theorem](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-stack-theorem.md)'s descent — the step-shift's matrix-extension construction is base-invariant, so it descends along any cover.

### Part 2: composition

Composition $\sigma_{n+1}^{n+2}[\mathbf{c}_{n+1}, \mathbf{r}_{n+1}] \circ \sigma_n^{n+1}[\mathbf{c}_n, \mathbf{r}_n]$ takes a step-$n$ matrix $M$ to

$$\begin{pmatrix} M & \mathbf{c}_n & \mathbf{c}'_{n+1} \\ \mathbf{r}_n & 0 & c \\ \mathbf{r}'_{n+1} & r & 0 \end{pmatrix}$$

where $\mathbf{c}'_{n+1}, \mathbf{r}'_{n+1}$ are the first $n$ components of $\mathbf{c}_{n+1}, \mathbf{r}_{n+1}$, and $c, r$ are the $(n+1)$-th components. Associativity is immediate: $(\sigma_{n+2}^{n+3} \circ \sigma_{n+1}^{n+2}) \circ \sigma_n^{n+1} = \sigma_{n+2}^{n+3} \circ (\sigma_{n+1}^{n+2} \circ \sigma_n^{n+1})$ since both sides give the same three-step extended matrix.

### Part 3: colimit existence

Stacks form a 2-category in which all small (filtered) colimits exist (a standard result; see e.g. [@lurie2009] §6.1). The ascending chain $\mathscr{M}^{(2)} \to \mathscr{M}^{(3)} \to \cdots$ is a filtered diagram, so its 2-colimit exists and is well-defined as a 2-stack.

### Dependence on $\boldsymbol{e}$

Different extension-data sequences $\boldsymbol{e}, \boldsymbol{e}' \in \mathbf{ExtData}$ produce different chains of step-shifts, hence in general different 2-colimits. To see this concretely: the [Fibonacci → Padovan via step-shift example](../../research/2026/07/31/lenticule-import/examples/fibonacci-to-padovan-step-shift.md) exhibits two different extension-data choices producing two different step-$3$ rules from Fibonacci, neither of which is Padovan's actual substitution. Successive iterations multiply these differences, so the colimit depends genuinely on $\boldsymbol{e}$.

$\square$

## What this proves and what it doesn't

**Proven.**

- For each fixed $\boldsymbol{e}$, the step-shift family $\{\sigma_n^{n+1}[\mathbf{c}_n, \mathbf{r}_n]\}$ is associatively composable and gives a well-defined ascending chain in the 2-category of stacks, with a colimit $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$.

**Not proven.**

- Whether there is a *canonical* choice of $\boldsymbol{e}$ such that $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$ has structurally-distinguished properties (e.g., RG-fixed-point status). This is the [canonical step-shift morphism question](../../research/2026/07/31/lenticule-import/from-predicate-category/questions/canonical-step-shift-morphism.md).
- Whether all $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$ for varying $\boldsymbol{e}$ are 2-categorically equivalent (the optimistic case, where the colimit is canonical-up-to-equivalence). This would resolve the canonical-step-shift question favourably.
- Whether $\mathscr{M}^{(\infty)}[\boldsymbol{e}]$ for any $\boldsymbol{e}$ has the structural content claimed in the [step-n fixed-point object](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/content/step-n-moduli-substack/content/step-n-fixed-point/step-n-fixed-point.md) — particularly the candidate RG-fixed-point interpretation. The [critical exponents at step-n fixed point theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md) depends on resolving this.

## RG-flow interpretation

The step-shift's iteration provides a candidate *renormalization-group flow* on the moduli family: each iteration $\sigma$ "renormalizes" by extending substitution complexity by one. The colimit is a candidate fixed point.

The canonical-step-shift question is *the* obstruction to this RG framework: without a canonical $\boldsymbol{e}$, the flow's "fixed point" is a $\boldsymbol{e}$-indexed family of candidates rather than a single object. Compare with the standard substitution-tilings RG framework [@williams1974; @anderson-putnam1998; @sadun2003-inverse-limits], which uses *iteration* of a fixed substitution as the RG operator (an inverse-limit construction with a different renormalization meaning).

See [renormalization-group-flow narrative](renormalization-group-flow.md) for the integrating discussion.
