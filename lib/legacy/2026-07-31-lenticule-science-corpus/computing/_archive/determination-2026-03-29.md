---
title: "Determination"
date-created: 2026-03-29
type: term
requires: [morphism]
restricts: morphism
---

Determination is when knowing one thing lets you compute another. If you know the churn rate, you can compute the customer lifetime value. Churn rate determines lifetime value. The value is a function of the input — not caused by it, not correlated with it, but computable from it.

In database theory this is called a functional dependency: column A determines column B when every row with the same value in A has the same value in B. In mathematics it is just a function: a morphism from one set to another where each input maps to exactly one output.

Determination is weaker than causation. Cost of goods sold determines gross margin — not because COGS causes margin, but because margin is defined as revenue minus COGS. The relationship is definitional, not causal. It is also weaker than equivalence — knowing A gives you B, but knowing B may not give you A.

When this library uses `determines` as a predicate, knowing the subject lets you compute the object. `determined-by` is the reverse: the subject is computed from the object.
