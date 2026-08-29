---
type: morphism
class: operator
symbol: "\\mathrm{conflcmp}_{\\mathfrak{C}}"
status: draft
depends-on: [comparison-morphism, predicatory-confluence, confluence-join, comparison-witness-object]
see-also: [positing-generated-confluence, beckmann-moser2024]
---

# Confluence comparison morphism

A **confluence comparison morphism** compares divergent settling branches by asking whether they admit a common successor under the operations allowed by the context.

For branches

$$v \Rightarrow^* u,\qquad v \Rightarrow^* w,$$

the order-theoretic candidate is

$$u \vee_k w.$$

The witness records:

- whether $u \vee_k w$ exists in the ambient settling category;
- whether it is reachable by the allowed operations;
- which operations witness reachability;
- which cells become contested in the join;
- the size or height of the joining diagram when that data is part of the context.

Thus confluence comparison is a comparison into a witness object, not only the computation of a joined value.
