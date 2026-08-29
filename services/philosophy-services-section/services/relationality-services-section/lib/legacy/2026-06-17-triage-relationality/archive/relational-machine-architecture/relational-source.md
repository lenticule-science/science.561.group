---

description: "The history from which a prefix morphism departs in T. Source is a T-level concept, distinct from domain, which is R-level."
defines: RelationalSource
implements: Source
date-created: 2026-03-18
date-modified: 2026-03-19
introduces: term
---

# Relational Source

## What this is

The **source** of a morphism $f : t \to t'$ in the history category $T$ is $t$ — the shorter history from which the prefix map departs.

Source is a concept at the level of $T$, the history category.
It is not a concept at the level of $R$, the relational universe.

This distinction matters because the fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is contravariant ([Functor](functor.md)).
For $f : t \to t'$ in $T$, the induced map is $H(f) : H_{t'} \to H_t$ — direction reversed.
The source of $f$ in $T$ is $t$, but the codomain of $H(f)$ in $R$ also lands at $H_t$.
Source and codomain share a location, but they are not the same concept.

## As a frontmatter relation

`source:` on a spec or skill names the T-level origin of the step or operation.
It MUST name a history type or a named position in the history poset.
It MUST NOT be used as a synonym for [RelationalDomain](relational-domain.md).

## Relationship to other concepts

- [RelationalTarget](relational-target.md) — the history the morphism arrives at in $T$; $t'$ for $f : t \to t'$.
- [RelationalDomain](relational-domain.md) — the R-level input of the induced map $H(f)$; lives at $t'$ (the target), not $t$ (the source), due to contravariance.
- [RelationalCodomain](relational-codomain.md) — the R-level output of $H(f)$; lives at $t$ (the source).

## Open questions

