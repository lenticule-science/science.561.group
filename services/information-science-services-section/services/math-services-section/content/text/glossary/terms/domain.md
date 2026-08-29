---
title: "Domain"
description: "The domain of a function f: A → B is A — the set of inputs the function is defined on. Every element of the domain has exactly one output under f."
defines: Domain
mathematical-object: function
references:
  ref1:
    title: "Mac Lane, Categories for the Working Mathematician, 2nd ed., Springer, 1998"
date-modified: 2026-03-19
id: domain
params:
  function: relational-universe-morphism
output: relational-universe
ast:
  source-object:
    - function
type: term

---

Let $f : A \to B$ be a function.

This entry uses **domain** for the source of a function or morphism. It does not define domain theory or a subject-matter domain.

**Definition.** The **domain** of $f$ is the set $A$. We write $\mathrm{dom}(f) = A$.

Every element $a \in A$ has exactly one value $f(a) \in B$. The function $f$ is undefined outside $\mathrm{dom}(f)$.

**Proposition.** Two functions $f, g : A \to B$ with the same domain, codomain, and rule ($f(a) = g(a)$ for all $a \in A$) are equal. Two functions with the same rule but different domains are distinct.

**Definition.** The **codomain** of $f : A \to B$ is the set $B$. The **image** (or range) of $f$ is $\mathrm{im}(f) = \{f(a) \mid a \in A\} \subseteq B$.

**Proposition.** $\mathrm{im}(f) \subseteq \mathrm{cod}(f)$, with equality iff $f$ is surjective.

In set theory, a function $f : A \to B$ is a subset $f \subseteq A \times B$ satisfying the unique-value condition: for each $a \in A$, there is exactly one $b \in B$ with $(a, b) \in f$.

In category theory, the domain (also called *source*) of a morphism $f : A \to B$ is the object $A$.

## Open questions
