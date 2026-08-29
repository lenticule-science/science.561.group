---
id: relational-target
description: "The history at which a prefix morphism arrives in T. Target is a T-level concept, distinct from codomain, which is R-level."
defines: RelationalTarget
implements: Target
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational Target

## What this is

The **target** of a morphism $f : t \to t'$ in the history category $T$ is $t'$ — the longer history at which the prefix map arrives.

Target is a concept at the level of $T$, the history category.
It is not a concept at the level of $R$, the relational universe.

This distinction matters because the fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is contravariant ([Functor](functor.md)).
For $f : t \to t'$ in $T$, the induced map is $H(f) : H_{t'} \to H_t$ — direction reversed.
The target of $f$ in $T$ is $t'$, but the domain of $H(f)$ in $R$ departs from $H_{t'}$.
Target and domain share a location, but they are not the same concept.

## As a frontmatter relation

`target:` on a spec or skill names the T-level destination of the step or operation.
It MUST name a history type or a named position in the history poset.
It MUST NOT be used as a synonym for [RelationalCodomain](./relational-codomain.md).

## Relationship to other concepts

- [RelationalSource](./relational-source.md) — the history the morphism departs from in $T$; $t$ for $f : t \to t'$.
- [RelationalCodomain](./relational-codomain.md) — the R-level output of the induced map $H(f)$; lives at $t$ (the source), not $t'$ (the target), due to contravariance.
- [RelationalDomain](./relational-domain.md) — the R-level input of $H(f)$; lives at $t'$ (the target).

## Open questions


---

<!-- source: archive/terms/relational-target.md -->

## Imported source: archive/terms/relational-target.md

---
id: relational-target
description: "The history at which a prefix morphism arrives in T. Target is a T-level concept, distinct from codomain, which is R-level."
defines: RelationalTarget
implements: Target
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational Target

## What this is

The **target** of a morphism $f : t \to t'$ in the history category $T$ is $t'$ — the longer history at which the prefix map arrives.

Target is a concept at the level of $T$, the history category.
It is not a concept at the level of $R$, the relational universe.

This distinction matters because the fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is contravariant ([Functor](functor.md)).
For $f : t \to t'$ in $T$, the induced map is $H(f) : H_{t'} \to H_t$ — direction reversed.
The target of $f$ in $T$ is $t'$, but the domain of $H(f)$ in $R$ departs from $H_{t'}$.
Target and domain share a location, but they are not the same concept.

## As a frontmatter relation

`target:` on a spec or skill names the T-level destination of the step or operation.
It MUST name a history type or a named position in the history poset.
It MUST NOT be used as a synonym for [RelationalCodomain](relational-codomain.md).

## Relationship to other concepts

- [RelationalSource](relational-source.md) — the history the morphism departs from in $T$; $t$ for $f : t \to t'$.
- [RelationalCodomain](relational-codomain.md) — the R-level output of the induced map $H(f)$; lives at $t$ (the source), not $t'$ (the target), due to contravariance.
- [RelationalDomain](relational-domain.md) — the R-level input of $H(f)$; lives at $t'$ (the target).

## Open questions
