---
name: terminal-object
description: "An object T in a category C such that for every object A there exists a unique morphism A → T. The categorical reference point all other objects map into uniquely. Dual to initial-object; unique up to unique isomorphism when it exists."
specializing: object
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    series: Graduate Texts in Mathematics
    volume: 5
    publisher: Springer-Verlag
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: awodey2010
    type: book
    title: Category Theory
    edition: "2"
    series: Oxford Logic Guides
    volume: 52
    publisher: Oxford University Press
    location: Oxford
    author:
      - literal: Awodey, Steve
    issued:
      - year: 2010
---

A **terminal object** $T$ in a category $\mathcal{C}$ is an object satisfying the universal property [@maclane1971, Ch. III §3; @awodey2010, §3.4]:

> For every object $A \in \mathrm{Ob}(\mathcal{C})$, there exists exactly one morphism $A \to T$.

The morphism $A \to T$ is uniquely determined by $A$ and $T$; it has no further data beyond its existence. The terminal object is the categorical analogue of a "singleton" — an object such that every other object has a canonical unique reference into it.

**Uniqueness.** Terminal objects, when they exist, are unique up to *unique* isomorphism. If $T$ and $T'$ are both terminal, there is exactly one morphism $T \to T'$ and exactly one $T' \to T$, and their composites must be the unique morphisms $T \to T$ and $T' \to T'$ — both of which are identity by terminality. So $T \cong T'$ canonically. This uniqueness lets us speak of *the* terminal object up to isomorphism.

**Examples by category.**

- In Set, the terminal object is any one-element set (all are canonically isomorphic). $\{*\}$ is the conventional choice.
- In Top, the terminal object is the one-point space.
- In Grp, the terminal object is the trivial group $\{e\}$.
- In a partial order viewed as a thin category, the terminal object is the greatest element (if it exists).
- In Cat (the category of small categories), the terminal object is the terminal category $\mathbf{1}$ (one object, one morphism — its identity).

**Const-pinned witness.** The schema records the universal-property witness via `const` on a subtree. Every terminal-object instance carries the exact same witness shape — a typed assertion that the universal property holds at this object. This demonstrates JSON Schema 2020-12's `const`-for-whole-subtrees feature: the witness is not parameterized data, it is a fixed identity-tag whose presence (and const-equality) certifies the universal property at the schema level. The actual checking of the universal property — for-every-A-exists-unique — is universally quantified and remains transformer territory.

**Dual.** The dual notion is [initial-object](../initial-object/initial-object.md) — an object I such that for every A there is exactly one morphism $I \to A$. Some categories have terminal objects but not initial (or vice versa); some have both (and rarely the two coincide, giving a *zero object*).
