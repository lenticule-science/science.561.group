---

description: "The R-level output of a morphism in the relational universe. For the induced map H(f) : H_{t'} → H_t, the codomain is H_t — the fiber at the source of f in T, not the target. Distinct from Target, which is T-level."
defines: RelationalCodomain
implements: Codomain
date-created: 2026-03-18
date-modified: 2026-03-18
introduces: term
---

# Relational Codomain

## What this is

The **codomain** of a morphism in $R$ is the object the morphism arrives at — its output end.

In the relational universe, the central morphisms are induced by the contravariant fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ ([Functor](functor.md)).
For a prefix morphism $f : t \to t'$ in the history category $T$, the induced map is $H(f) : H_{t'} \to H_t$.
The codomain of $H(f)$ is $H_t$ — the fiber at $t$, the **source** of $f$ in $T$.

This is counterintuitive: the codomain of $H(f)$ lives at the source end of $f$, not the target.
Contravariance causes this.
Codomain is not the same concept as [RelationalTarget](relational-target.md).

## As a frontmatter annotation

`codomain:` is a categorical concept, not a skill annotation.
For operations and skills, use [produces:](produces.md) or [returns:](returns.md) to name the output type.
Those predicates are more specific; they build on the categorical concept of codomain but are not the same thing.

## Relationship to other concepts

- [RelationalTarget](relational-target.md) — T-level: where a prefix morphism $f$ arrives in $T$. Lives at $t'$. Not the same as codomain.
- [RelationalSource](relational-source.md) — T-level: where $f$ departs in $T$. Lives at $t$. The codomain of $H(f)$ lives here.
- [RelationalDomain](relational-domain.md) — R-level input of $H(f)$; lives at $t'$ (the target), paired with codomain to type the morphism completely.

## Open questions

