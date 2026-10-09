---
name: Global Time Function
date-created: 2026-09-03
references:
  hawking-ellis1973:
    authors: ["Stephen W. Hawking", "George F. R. Ellis"]
    title: "The Large Scale Structure of Space-Time"
    publisher: "Cambridge University Press"
    year: 1973
---

A **global time function** on a Lorentzian spacetime $(M, g)$ is a smooth function
$t : M \to \mathbb{R}$ that is strictly increasing along every future-directed causal
curve — moving forward in time, by any causal path, always increases $t$. Hawking's
**stable causality theorem** (Hawking & Ellis 1973) states that a spacetime is *stably
causal* — remains free of closed causal curves under every sufficiently small
perturbation of its metric — if and only if it admits a global time function. Stable
causality sits partway up the standard causality hierarchy (chronological, causal,
stably causal, strongly causal, globally hyperbolic), and the existence of a global time
function is what makes "the spacetime has a well-defined notion of before and after,
robustly" a precise, checkable statement.

## In Obsmetrologia

`Obsmetrologia.CausalSets.Causal.RegimeSection` builds the discrete refinement of this
theorem on a causal set: the **past count** $t(x) = |\{z : z \prec x\}|$, the number of
events causally preceding $x$, is proved strictly monotone along the causal order
(`timeSection_strict_mono`) — $x \prec y \implies t(x) < t(y)$ — because transitivity
makes the causal past of $x$ a *proper* subset of the causal past of $y$ whenever
$x \prec y$. The module's own header states the regime reading directly: this section
lands in $\mathbb{N}$, the ordinals below $\omega$, so a finite causal set (the strict
regime, $\kappa \leq 3$) always carries a sub-$\omega$ ordinal time section — "the green
half of 'an ordinal time section exists iff the settling is non-aperiodic'." The
existence direction is proved (green); the full biconditional — that the aperiodic
regime is exactly where no bounded-ordinal time section can exist — is the corpus's
stated open converse, not proved by this module. The measured axiom profile of
`timeSection_strict_mono` is `propext, Quot.sound`.

This is the source of the sub-corpus's own name in the corpus: `RegimeSection`, because
this global time function is the section of the [closure ordinal](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-ordinal.md)'s
regime ladder that a causal set's own time structure provides.

## See also

- [Causal set](./causal-set.md) — the discrete structure this theorem is refined over
- [Closure ordinal](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-ordinal.md) — causal existence sits at $\kappa = \omega$, the Scott regime
