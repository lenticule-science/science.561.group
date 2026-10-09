---
name: Cofinality
date-created: 2026-09-03
references:
  jech2003:
    authors: ["Thomas Jech"]
    title: "Set Theory: The Third Millennium Edition, revised and expanded"
    publisher: "Springer"
    year: 2003
---

A subset $S$ of a linearly ordered set $(L, \leq)$ is **cofinal** if for every
$x \in L$ there is some $s \in S$ with $x \leq s$ — $S$ "reaches" arbitrarily far into
$L$. The **cofinality** $\operatorname{cf}(L)$ is the least cardinality of a cofinal
subset of $L$; for a limit ordinal $\lambda$, $\operatorname{cf}(\lambda)$ is the least
ordinal $\mu$ admitting a strictly increasing, cofinal map $\mu \to \lambda$ (Jech
2003).

Two cases anchor everything above: $\omega$, the first infinite ordinal, has
cofinality $\omega$ — it is cofinal in itself, since any strictly increasing sequence
of naturals is unbounded in $\omega$ and no finite set can be cofinal. $\omega_1$, the
first uncountable ordinal, has cofinality $\omega_1$ — it is a **regular** cardinal,
meaning no countable sequence of countable ordinals can be cofinal in it, because a
countable union of countable sets is countable. This is the fact that makes "countable
cofinality" a genuine dividing line among the ordinals strictly between $\omega$ and the
first ordinal of cofinality $\omega_1$: an ordinal $\lambda$ with $\omega < \lambda <
\omega_1$ is always countable as a set, hence always has countable cofinality (a
bijection with $\omega$ is itself a cofinal $\omega$-sequence), while $\omega_1$ itself
does not.

## In Obsmetrologia

`Obsmetrologia.Closure.Regime` carries `countableCofinality` as one of the three
decidable flags used to classify a settling problem's [closure ordinal](./closure-ordinal.md)
`κ`. Per the corpus's [four-regime dichotomy](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md),
this flag is exactly what separates the two non-Scott-continuous regimes: the
**transfinite-bounded** regime ($\omega < \kappa < \omega_1$) has countable cofinality
— a directed $\omega$-indexed sequence of internal stages still reaches the settled
value, just not by stage $\omega$ itself — while the **aperiodic** regime ($\kappa \geq
\omega_1$) has cofinality $\omega_1$ or greater, so no countable sequence of internal
stages can ever be cofinal: the corpus's own reading (`content/text/glossary/terms/kinetic-existence.md`
in the sibling natural-science section) is that this is the regime "structurally
unwitnessable from constructible ordinals" — nothing internal to the process can name a
sequence that reaches the settled value, because no countable sequence does.

## See also

- [Closure ordinal](./closure-ordinal.md) — the ordinal whose regime cofinality further stratifies
- [Scott continuity](./scott-continuity.md) — the property that forces closure ordinal $\kappa = \omega$, the boundary case where cofinality is trivially countable
