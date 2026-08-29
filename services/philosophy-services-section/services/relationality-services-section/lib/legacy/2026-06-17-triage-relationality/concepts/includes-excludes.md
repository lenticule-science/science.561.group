---
title: "Includes / Excludes"
kind: term
---
The two predicates that structure the field of recognition. **Includes** measures containment — one recognition subsumed by another. **Excludes** measures incompatibility — no shared recognition.

## What they are

`Includes(a, b)` holds when $\llbracket a \rrbracket$ is contained within $\llbracket b \rrbracket$ — every mark recognized by $a$ is recognized by $b$. Reflexive, transitive. `Excludes(a, b)` holds when $\llbracket a \rrbracket$ and $\llbracket b \rrbracket$ share no common recognition. Symmetric, irreflexive.

Set-theoretically, on a powerset with closure $c$, Includes is $\subseteq$ on $\text{Fix}(c)$ and Excludes is empty intersection. Categorically, Includes is the subobject ordering ($m_1 \leq m_2$ iff $\exists i$ with $m_1 = m_2 \circ i$); Excludes is disjointness (their pullback is empty).

The two predicates are the *conditions* (in the [triadic engine](triadic-engine.md) sense) produced when [Differentiate](differentiate.md) is taken seriously: *inclusion* is the condition of being something; *exclusion* is the condition of not being something else.

## Properties

- **Includes**: reflexive, transitive — a preorder on the field.
- **Excludes**: symmetric, irreflexive.
- **Cross-stability**: if `Includes(a, b)` and `Excludes(b, c)`, then `Excludes(a, c)`.
- Together they constitute the *reflexive order* — the field of recognition.

## Note on naming

There is a useful distinction between the *acts* of including and excluding (the dynamics) and the *conditions* of inclusion and exclusion (what those acts maintain). The verb forms `Includes` / `Excludes` cover both. Older drafts use either form; the act/condition split clarifies what's what.
