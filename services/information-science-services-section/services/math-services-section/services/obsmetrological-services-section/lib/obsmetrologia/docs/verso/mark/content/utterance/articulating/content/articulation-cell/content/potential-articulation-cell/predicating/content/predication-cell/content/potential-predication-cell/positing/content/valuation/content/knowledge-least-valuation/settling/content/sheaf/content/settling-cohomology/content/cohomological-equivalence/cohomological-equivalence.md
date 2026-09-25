---
type: concept
class: equivalence-relation
symbol: "\\sim_H"
depends-on: [settling-associated-sheaf, mutually-locally-derivable, settling-bound]
---

# Cohomological equivalence

The coarsest of three natural equivalences on settlings over a fixed base.
Two settlings $v, v'$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ are **cohomologically equivalent** — written $v \sim_H v'$ — iff there exists an ordinal shift $\delta \in \lambda$ and a sheaf isomorphism

$$\mathcal{F}_U \;\cong\; \mathcal{F}_{U'}[\delta]$$

on the [bitopological settling site](../../../../../bitopological-settling-site/bitopological-settling-site.md), where $\mathcal{F}_{U'}[\delta]$ is the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) of $v'$ shifted by $\delta$.

## Why sheaf-iso, not $H^n$-agreement

A first attempt at defining cohomological equivalence by the conjunction "$H^0$-ranks agree" + "$H^1$-classifying classes agree" *fails* to capture stage-by-stage settling structure.
Counterexample over $B = (\mathbf{2}, \{a, b\}, \{P\}, \omega + 1)$:

- $v_1$: initial state $\{P(a, a) = \mathbf{t}\}$ with closure rule $P(a, a) \Rightarrow P(b, b)$.
- $v_2$: initial state $\{P(a, a) = \mathbf{t},\; P(b, b) = \mathbf{t}\}$ with no closure rule.

Both are strict-regime settlings reaching the same quiescent state; $H^0(\mathcal{F}_U)$ has rank 2 for each; $H^1 = 0$ for both.
But $v_1$ designates $(a, a)$ at stage 0 and $(b, b)$ at stage 1, while $v_2$ designates both at stage 0 — different stage-by-stage designation patterns, *non-isomorphic* $\mathcal{F}_U$-sheaves, and $v_1 \not\sim_{\mathrm{MLD}} v_2$ (no cellwise bijection maps $v_{1, 0}$'s 1-cell support to $v_{2, 0}$'s 2-cell support).
The sheaf-isomorphism condition captures what $H^0$-rank agreement alone misses.

## Relation to MLD

[Mutually-locally-derivable equivalence](mutually-locally-derivable.md) implies cohomological equivalence: an invertible settling-morphism induces a sheaf isomorphism on $\mathcal{F}_U$.
The partial converse — cohomological equivalence implies MLD — holds on each [regime stratum](../../../../../../references/four-regime-dichotomy.md) under the appropriate hypothesis ([biequivalence-cohomological collapse](../../references/biequivalence-cohomological-collapse.md)).

## The hierarchy

Strict isomorphism (cell-by-cell identical at every stage) is strictly finer than MLD; MLD coincides with biequivalence in the categorical 2-category of settlings over a fixed base; biequivalence implies cohomological equivalence with regime-by-regime collapse.
See [equivalence hierarchy](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/equivalence-hierarchy.md).
