---
id: relational-codomain
description: "The R-level output of a morphism in the relational universe. For the induced map H(f) : H_{t'} → H_t, the codomain is H_t — the fiber at the source of f in T, not the target. Distinct from Target, which is T-level."
implements: Codomain
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  morphism: relational-universe-morphism
output: relational-universe
ast:
  contravariant-arrival:
    - morphism:
        - induced-fiber-map
        - source-end-fiber
instance-of: Codomain
---

# Relational Codomain

## What this is

The **codomain** of a morphism in $R$ is the object the morphism arrives at — its output end.

In the relational universe, the central morphisms are induced by the contravariant fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ ([Functor](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/functor.md)).
For a prefix morphism $f : t \to t'$ in the history category $T$, the induced map is $H(f) : H_{t'} \to H_t$.
The codomain of $H(f)$ is $H_t$ — the fiber at $t$, the **source** of $f$ in $T$.

This is counterintuitive: the codomain of $H(f)$ lives at the source end of $f$, not the target.
Contravariance causes this.
Codomain is not the same concept as [RelationalTarget](../../../../services/relationality-services-section/content/text/glossary/terms/relational-target.md).

## As a frontmatter annotation

`codomain:` is a categorical concept, not a skill annotation.
For operations and skills, use [produces:](../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/produces.md) or [returns:](../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/returns.md) to name the output type.
Those predicates are more specific; they build on the categorical concept of codomain but are not the same thing.

## Relationship to other concepts

- [RelationalTarget](../../../../services/relationality-services-section/content/text/glossary/terms/relational-target.md) — T-level: where a prefix morphism $f$ arrives in $T$. Lives at $t'$. Not the same as codomain.
- [RelationalSource](../../../../services/relationality-services-section/content/text/glossary/terms/relational-source.md) — T-level: where $f$ departs in $T$. Lives at $t$. The codomain of $H(f)$ lives here.
- [RelationalDomain](../../../../services/relationality-services-section/content/text/glossary/terms/relational-domain.md) — R-level input of $H(f)$; lives at $t'$ (the target), paired with codomain to type the morphism completely.

## Open questions
