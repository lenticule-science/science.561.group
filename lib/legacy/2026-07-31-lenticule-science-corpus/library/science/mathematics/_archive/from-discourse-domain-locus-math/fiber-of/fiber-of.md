---

title: "fiber-of"
description: "A positional frontmatter relation declaring that the subject is the fiber of a named functor F evaluated at a base object t. Always paired with base: t. Coarsest valid answer: relational-universe."
defines: FiberOf
mathematical-object: functor
references:
  - id: ref1
    type: document
    title: Mac Lane, Categories for the Working Mathematician, 2nd ed., Springer, 1998
specialization: relation
component-of: flatfile-agential-resource-system
date-modified: 2026-03-19
---

Let $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ be a functor (presheaf) and let $t$ be an object of $\mathcal{C}$.

**Definition.** The **fiber of $F$ at $t$** is the set $F(t)$ — the value of the functor $F$ evaluated at the object $t$.

The two fields `fiber-of:` and `base:` are inseparable: $F(t)$ requires specifying both $F$ and $t$.

**Proposition.** For a morphism $g : t' \to t$ in $\mathcal{C}$, functoriality gives a restriction map $F(g) : F(t) \to F(t')$. The fiber $F(t)$ together with these restriction maps determines the local behavior of $F$ at $t$.

**Distinction from related notions:**
- `component-of: X` — structural projection $\pi : X \to A$ (a retraction with named section)
- `fiber-of: F` / `base: t` — categorical fiber: evaluation of a functor at an object
- `element-of: X` — algebraic membership (global element $1 \to X$)

## Open questions

- Whether `fiber-of` should also require the restriction maps (naturality squares) to be named.
