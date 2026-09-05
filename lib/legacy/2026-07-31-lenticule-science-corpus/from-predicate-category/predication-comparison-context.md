---
type: definition
class: structure
symbol: "\\mathfrak{C}"
depends-on: [predicatory-comparison, comparison-standard, predication-settling, predication-cell]
see-also: [comparison-witness-object]
---

# Comparison context

A **comparison context** is the data that makes a comparison well-typed.

For a fixed base $B$, a comparison context is a tuple

$$\mathfrak{C} = (X,\ I,\ S,\ T)$$

where:

- $X$ is the finite or small family of input valuations or settlings to compare;
- $I \subseteq \Phi$ is the selected cell region;
- $S$ is the [comparison standard](teaching/explanations/comparison-standard.md);
- $T \subseteq \lambda$ is the stage or interval over which comparison is performed.

The context fixes the domain and standard before any comparison morphism is applied.

## Typed restriction

Given a valuation $v$, write $v|_{\mathfrak{C}}$ for its restriction to the cell region $I$ and temporal interval $T$. Two valuations are comparable under $\mathfrak{C}$ only after this restriction and only relative to the standard $S$.

Thus a comparison context is a typed restriction object: it specifies what part of the predication data is being compared and which mathematical relation is being applied there.
