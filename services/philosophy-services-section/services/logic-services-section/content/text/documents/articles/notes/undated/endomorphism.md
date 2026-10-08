---
name: endomorphism
description: "A morphism f : A → A whose domain and codomain are the same object. Endomorphisms at a single object form a monoid under composition; the monoid End(A) is the canonical example of a one-object category viewed inside a larger one."
specializing: transformer
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
title: endomorphism
---

An **endomorphism** of an object $A$ in a category $\mathcal{C}$ is a morphism $f : A \to A$ — domain and codomain both equal $A$ [@maclane1971, Ch. I §1].

The collection of all endomorphisms of $A$, denoted $\mathrm{End}_{\mathcal{C}}(A)$ or $\mathrm{Hom}_{\mathcal{C}}(A, A)$, forms a **monoid** under composition. The monoid operation is composition; the unit is the identity morphism $\mathrm{id}_A$. This makes any object $A$'s endomorphisms a one-object subcategory of $\mathcal{C}$ — or equivalently a monoid viewed as a one-object category.

**Specializing shape.** The schema specializes [transformer](transformer.md) by recording the endomorphism's object via a single `at-object` cell — the object both endpoints of the morphism reference. The transformer-level `domain` and `codomain` cells both equal `at-object`; the equality is the defining structural condition, recorded by carrying only `at-object` in the schema. A separate transformer verifies that the morphism's stored domain and codomain agree with `at-object`.

**Examples.** In Set, the endomorphisms of a set $A$ are all functions $A \to A$; $\mathrm{End}(A) \cong A^A$ as a monoid. In Grp, the endomorphisms of a group $G$ are the group homomorphisms $G \to G$; the subset of bijective endomorphisms forms the automorphism group $\mathrm{Aut}(G)$.

**Specializations.** An [automorphism](automorphism.md) is an endomorphism that is also an [isomorphism](isomorphism.md) — the schema is `allOf endomorphism, isomorphism`. The automorphism group of $A$, $\mathrm{Aut}(A) \subseteq \mathrm{End}(A)$, is the group of invertible endomorphisms. The **idempotent endomorphisms** ($e : A \to A$ with $e \circ e = e$) characterize splittings; in categories where every idempotent splits, idempotent-completeness gives a useful closure property.
