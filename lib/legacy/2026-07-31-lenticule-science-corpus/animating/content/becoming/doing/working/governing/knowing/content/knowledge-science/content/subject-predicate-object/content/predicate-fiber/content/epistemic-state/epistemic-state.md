---

introduces: value
description: "The state of knowledge about an assertion: unattested, affirmed, denied, or contested. The four values of Belnap's bilattice."
defines: epistemic-state
aliases: [epistemic states, epistemic value]
values: ["⊥ (unattested)", "t (affirmed)", "f (denied)", "⊤ (contested)"]
represented-by: bilattice
twist-product-representation: "{0,1}²"
orderings: [truth-ordering, knowledge-ordering]
tracked-as-resources-in: linear-logic
values-of: predicate-fiber
carried-by: subject-predicate-object
introduced-by: belnap-1977
algebraic-structure: "2 ⊗ 2"
free-on: one-generator
after-closure: "{t, f, ⊤}"
date-created: 2026-03-30
---

An epistemic state is the state of knowledge about an assertion in a system that receives information from multiple sources (Belnap 1977).

There are four states:

- $\bot$ (**unattested**): no source has said anything about this assertion.
- $t$ (**affirmed**): at least one source says true; no source says false.
- $f$ (**denied**): at least one source says false; no source says true.
- $\top$ (**contested**): at least one source says true AND at least one says false.

These four states form the four-valued [bilattice](../../math/theories/algebra/terms/bilattice.md) $\{\bot, t, f, \top\}$, which is the [twist product](../../math/theories/algebra/terms/twist-product.md) $\mathbf{2} \otimes \mathbf{2}$ (Fitting 1991). The first component tracks positive evidence; the second tracks negative evidence.

The states carry two orderings. The **truth ordering** ranks by assertion strength: $f \leq \bot \leq t$ and $f \leq \top \leq t$. The **knowledge ordering** ranks by information content: $\bot \leq t \leq \top$ and $\bot \leq f \leq \top$.

Epistemic states are not truth values in the classical sense. A classical system has two states (true, false). A three-valued system adds "unknown." Belnap's system adds "contested" — the state where contradictory information is present, which is not the same as unknown. A system can have both much information ($\top$) and no resolution.
