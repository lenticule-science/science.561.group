---
id: relational-domain
description: "The R-level input of a morphism in the relational universe. For the induced map H(f) : H_{t'} → H_t, the domain is H_{t'} — the fiber at the target of f in T, not the source. Distinct from Source, which is T-level."
implements: Domain
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  morphism: relational-universe-morphism
  target-history: relational-history
output: relational-universe
ast:
  contravariant-domain:
    - morphism
    - target-history:
        - morphism
---

# Relational Domain

## What this is

The **domain** of a morphism in $R$ is the object the morphism departs from — its input end.

In the relational universe, the central morphisms are induced by the contravariant fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ ([Functor](functor.md)).
For a prefix morphism $f : t \to t'$ in the history category $T$, the induced map is $H(f) : H_{t'} \to H_t$.
The domain of $H(f)$ is $H_{t'}$ — the fiber at $t'$, the **target** of $f$ in $T$.

This is counterintuitive: the domain of $H(f)$ lives at the target end of $f$, not the source.
Contravariance causes this.
Domain is not the same concept as [RelationalSource](relational-source.md).

## As a frontmatter annotation

`domain:` is a categorical concept, not a skill annotation.
For operations and skills, use [takes:](takes.md) to name the input type.
`takes:` is the specific predicate for structural input receipt; it builds on the categorical concept of domain but is not the same thing.

## Relationship to other concepts

- [RelationalSource](relational-source.md) — T-level: where a prefix morphism $f$ departs in $T$. Lives at $t$. Not the same as domain.
- [RelationalTarget](relational-target.md) — T-level: where $f$ arrives in $T$. Lives at $t'$. The domain of $H(f)$ lives here.
- [RelationalCodomain](relational-codomain.md) — R-level output of $H(f)$; lives at $t$ (the source), paired with domain to type the morphism completely.

## Open questions

