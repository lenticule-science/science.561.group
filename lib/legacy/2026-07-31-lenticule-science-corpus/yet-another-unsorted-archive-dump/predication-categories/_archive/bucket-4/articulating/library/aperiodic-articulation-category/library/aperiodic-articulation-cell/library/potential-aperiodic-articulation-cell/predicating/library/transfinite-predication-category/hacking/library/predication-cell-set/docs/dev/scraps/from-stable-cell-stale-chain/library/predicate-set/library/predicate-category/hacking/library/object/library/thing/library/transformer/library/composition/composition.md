---
name: composition
description: "The partial binary operation ∘ : Hom(B, C) × Hom(A, B) → Hom(A, C) that pairs two transformers whose codomain-domain match and produces their composite. Associative and admits identity morphisms as neutral elements."
specializing: transformer
references:
  - id: eilenbergmaclane1945
    type: article-journal
    title: General theory of natural equivalences
    volume: 58
    issue: 2
    author:
      - literal: Eilenberg, Samuel
      - literal: Mac Lane, Saunders
    container-title: Transactions of the American Mathematical Society
    page: 231-294
    issued:
      - year: 1945
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

A **composition** is the partial binary operation $\circ : \mathrm{Hom}_{\mathcal{C}}(B, C) \times \mathrm{Hom}_{\mathcal{C}}(A, B) \to \mathrm{Hom}_{\mathcal{C}}(A, C)$ in a category $\mathcal{C}$ [@eilenbergmaclane1945; @maclane1971, Ch. I §1; @awodey2010, §1.1]. Given a first morphism $f : A \to B$ and a second morphism $g : B \to C$ — where the codomain of $f$ equals the domain of $g$ — the composition produces a composite morphism $g \circ f : A \to C$.

Composition is **partial**: a pair $(f, g)$ has a composite only when $\mathrm{cod}(f) = \mathrm{dom}(g)$. The codomain-domain matching condition is the gating predicate.

Composition satisfies two laws that distinguish a category from a bare directed graph (a [quiver](../../../../../../../../graph-theory/code/structures/quiver.md)):

1. **Associativity.** For composable $f, g, h$: $h \circ (g \circ f) = (h \circ g) \circ f$.
2. **Unit (identity).** For every object $A$, the [identity morphism](../identity-morphism/identity-morphism.md) $\mathrm{id}_A$ satisfies $f \circ \mathrm{id}_A = f$ and $\mathrm{id}_B \circ f = f$ for every $f : A \to B$.

The schema captures the inherent data — `first-morphism`, `second-morphism`, `composite` — and uses `unevaluatedProperties: false` to lock the leaf surface. The codomain-domain matching condition and the associativity / unit laws are universally-quantified equations on morphism triples and quadruples; JSON Schema cannot express them. They are checked by composition-axiom transformers operating over a candidate category instance.

**Read of the composition record.** A composition record is not the morphism $g \circ f$ itself (that morphism is one transformer instance); it is the *witness* that $g \circ f$ arose as the composition of $g$ after $f$. Composition records accumulate as cells in the parent thing's `.jsonl` log, recording which composites have been computed.
