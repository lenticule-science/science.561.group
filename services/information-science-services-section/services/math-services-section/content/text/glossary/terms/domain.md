---
name: "Domain"
description: "The domain of a function f: A → B is A — the set of inputs the function is defined on. Every element of the domain has exactly one output under f."
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

is-a: set
component-of: function, binary-relation
paired-with: codomain
type: page
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

## Earlier material

The domain of a [function](../../documents/articles/research/2026/07/morphisms/function.md) $f: A \to B$ is the [set](set.md) $A$ — the collection of all allowed inputs. Every [element](element.md) of the domain must be assigned exactly one output. A function is not permitted to leave any input unaccounted for. This totality requirement — that $f$ be defined on every element of its domain — is part of what distinguishes a function from a partial function or a relation.

The domain is not a byproduct of the function's rule; it is part of the function's specification. Two functions with the same formula but different domains are different functions. The function $f(x) = x^2$ with domain $\mathbb{N}$ (the natural numbers) is a different function from $g(x) = x^2$ with domain $\mathbb{R}$ (the real numbers), even though they agree on every input where both are defined. They have different domains, and therefore different properties: $f$ is a function from $\mathbb{N}$ to $\mathbb{N}$, while $g$ is a function from $\mathbb{R}$ to $\mathbb{R}$. The first can never take a negative input; the second can.

Specifying a function completely requires three things: its domain, its [codomain](../../documents/articles/research/2026/07/31/lenticule-import/_archive/codomain.md), and the assignment rule. Leaving out the domain is like leaving out the subject of a sentence — the function is not fully determined. In practice, when mathematicians write "$f(x) = \sqrt{x}$" without specifying a domain, they implicitly mean the largest set on which the rule makes sense (the nonnegative reals, in this case). But this convention hides a choice, and in rigorous work the domain must be stated.

The domain of a [binary relation](binary-relation.md) $R \subseteq A \times B$ is the set $A$ from which the first components of the [ordered pairs](ordered-pair.md) are drawn. Unlike a function, a relation does not require every element of $A$ to participate — some elements of $A$ may not appear in any pair.

In a [category](../../documents/articles/research/2026/07/31/categories/theories/ordinary-categories/objects/category.md), the domain of a morphism $f: A \to B$ is the source object $A$. Every morphism has a domain and a codomain. Composition $g \circ f$ is defined only when the codomain of $f$ equals the domain of $g$ — this matching condition is the basic constraint that governs which morphisms can be chained together, and it is the categorical analogue of the requirement that a function's output land in the next function's input set.

The **image** (or *range*) of $f$ is $\mathrm{im}(f) = \{f(a) \mid a \in A\} \subseteq B$ — the actual set of outputs. The codomain says where $f$ is *allowed* to land; the image says where it *does* land. Always $\mathrm{im}(f) \subseteq \mathrm{cod}(f)$, with equality iff $f$ is surjective.

The domain of a [function](../../documents/articles/research/2026/07/31/terms/function.md) $f : A \to B$ is the [set](set.md) A — the collection of all allowed inputs. Every [element](element.md) of the domain must be assigned an output. A function is not permitted to leave any input unaccounted for. This totality requirement is part of what makes a function a function.

Specifying a function requires specifying three things: its domain, its [codomain](../../documents/articles/research/2026/07/31/lenticule-import/_archive/codomain.md), and the assignment rule. Two functions with the same rule but different domains are different functions. "Square each natural number" and "square each real number" are distinct functions, even where they agree, because the domain of the first is $\mathbb{N}$ and the domain of the second is $\mathbb{R}$.

The domain of a [binary relation](binary-relation.md) $R \subseteq A \times B$ is the set A — the set from which the first components of the [ordered pairs](ordered-pair.md) are drawn. Unlike a function, a relation does not require every element of A to appear in some pair.

In a [category](../../documents/articles/research/2026/07/31/lenticule-import/categories/domains/ordinary-categories/terms/category.md), the domain of a morphism $f : A \to B$ is the source object A. Every morphism has a domain and a codomain. Composition $g \circ f$ requires the codomain of $f$ to equal the domain of $g$ — this matching condition is what makes composition possible.

The set of allowed inputs to a function or relation — where the mapping starts.

Specifying a function requires specifying three things: its domain, its [codomain](../../documents/articles/research/2026/07/31/lenticule-import/_archive/codomain.md), and the assignment rule. Two functions with the same rule but different domains are different functions. &ldquo;Square each natural number&rdquo; and &ldquo;square each real number&rdquo; are distinct functions, even where they agree, because the domain of the first is $\mathbb{N}$ and the domain of the second is $\mathbb{R}$.

In a [category](../../documents/articles/research/2026/07/31/lenticule-import/categories/domains/ordinary-categories/terms/category.md), the domain of a morphism $f : A \to B$ is the source object A. Every morphism has a domain and a codomain. Composition $g \circ f$ requires the codomain of $f$ to equal the domain of $g$ — this matching condition is what makes composition possible.

The domain is not a byproduct of the function&rsquo;s rule; it is part of the function&rsquo;s specification. Two functions with the same formula but different domains are different functions. The function f(x)=x2f(x) = x^2 with domain $\mathbb{N}$ (the natural numbers) is a different function from g(x)=x2g(x) = x^2 with domain $\mathbb{R}$ (the real numbers), even though they agree on every input where both are defined. They have different domains, and therefore different properties: $f$ is a function from $\mathbb{N}$ to $\mathbb{N}$, while $g$ is a function from $\mathbb{R}$ to $\mathbb{R}$. The first can never take a negative input; the second can.

The domain of a [binary relation](binary-relation.md) $R \subseteq A \times B$ is the set $A$ from which the first components of the [ordered pairs](ordered-pair.md) are drawn. Unlike a function, a relation does not require every element of $A$ to participate — some elements of $A$ may not appear in any pair.

In a [category](../../documents/articles/research/2026/07/31/lenticule-import/categories/domains/ordinary-categories/terms/category.md), the domain of a morphism $f: A \to B$ is the source object $A$. Every morphism has a domain and a codomain. Composition $g \circ f$ is defined only when the codomain of $f$ equals the domain of $g$ — this matching condition is the basic constraint that governs which morphisms can be chained together, and it is the categorical analogue of the requirement that a function&rsquo;s output land in the next function&rsquo;s input set.

The domain of a function f: A → B is A — the set of inputs the function is defined on. Every element of the domain has exactly one output under f.

Let $f : A \to B$ be a function.

**Definition.** The **domain** of $f$ is the set $A$. We write $\mathrm{dom}(f) = A$.

Every element $a \in A$ has exactly one value $f(a) \in B$. The function $f$ is undefined outside $\mathrm{dom}(f)$.

**Proposition.** Two functions $f, g : A \to B$ with the same domain, codomain, and rule ($f(a) = g(a)$ for all $a \in A$) are equal. Two functions with the same rule but different domains are distinct.

**Definition.** The **codomain** of $f : A \to B$ is the set $B$. The **image** (or range) of $f$ is im(f)={f(a)∣a∈A}⊆B\mathrm{im}(f) = \{f(a) \mid a \in A\} \subseteq B.

**Proposition.** $\mathrm{im}(f) \subseteq \mathrm{cod}(f)$, with equality iff $f$ is surjective.

In set theory, a function $f : A \to B$ is a subset $f \subseteq A \times B$ satisfying the unique-value condition: for each $a \in A$, there is exactly one $b \in B$ with $(a, b) \in f$.
