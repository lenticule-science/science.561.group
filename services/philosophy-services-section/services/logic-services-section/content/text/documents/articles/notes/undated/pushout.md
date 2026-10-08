---
name: pushout
description: "The universal cocone over a span — the fiber coproduct. Given morphisms f : C → A and g : C → B, the pushout Q = A +_C B is the object equipped with injections ι_1 : A → Q and ι_2 : B → Q such that ι_1 ∘ f = ι_2 ∘ g, universal among such commutative squares. Dual to pullback."
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
title: pushout
---

A **pushout** of a span $f : C \to A$, $g : C \to B$ in a category $\mathcal{C}$ is an object $Q$ (often written $A +_C B$) together with injection morphisms $\iota_1 : A \to Q$ and $\iota_2 : B \to Q$ satisfying [@maclane1971, Ch. III §4; @awodey2010, §5.5]:

$$\iota_1 \circ f = \iota_2 \circ g$$

and the universal property dual to [pullback](pullback.md):

> For every $(Z, z_1 : A \to Z, z_2 : B \to Z)$ with $z_1 \circ f = z_2 \circ g$, there exists a unique morphism $u : Q \to Z$ such that $u \circ \iota_1 = z_1$ and $u \circ \iota_2 = z_2$.

**Examples by category.**

- In Set, the pushout is the disjoint union $A \sqcup B$ with the equivalence relation identifying $f(c) \sim g(c)$ for every $c \in C$. The pushout object is the quotient $(A \sqcup B) / \sim$.
- In Top, the pushout is the adjunction space — gluing $A$ and $B$ along the images of $C$.
- In Grp, the pushout is the amalgamated free product.

**Examples in topology and surgery.** Pushouts are foundational in topology for constructions like CW complexes (attaching cells along boundary maps), connected sums, and surgery — all are pushouts of specific spans.

**Colimit-form.** Pushout is the colimit of a span-shaped diagram. The general [colimit](colimit.md) record's `pushout` branch handles this case directly.
