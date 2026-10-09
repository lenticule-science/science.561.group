---
title: Constraint effect equivalence predicate
description: constraint effect equivalence predicate The constraint effect equivalence predicate (E) is induced by the behavioral closure of constraint functions within a shared evaluation domain.
---
constraint effect equivalence predicate  
The constraint effect equivalence predicate (`E`) is induced by the behavioral closure of constraint functions within a shared evaluation domain.

When two constraint functions produce indistinguishable behavior over the same domain,  
they are effect-equivalent — members of the same constraint effect class.

E(f₁, f₂, D) := ∀ x ∈ D: f₁(x) ≡ f₂(x)

Where `≡` denotes behavioral equivalence within the range of the functions.

That is, two constraint functions are equivalent when they produce the same effects over the same region of evaluation.
