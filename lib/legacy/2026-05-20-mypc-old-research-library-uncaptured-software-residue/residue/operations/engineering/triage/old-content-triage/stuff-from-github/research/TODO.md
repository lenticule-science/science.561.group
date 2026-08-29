# TODO: Deepening Reflex-Centred Term Semantics

This file tracks the planned phases for enriching λ_R term semantics,
using Reflex as the primary guide for resolving design choices.

Semantic principles
-------------------

- Reflex-world. We work relative to a fixed RelationalStructure
  `(A, ρ)`. Recognitions live in its Heyting algebra carrier `A`, and
  Reflex is the designated monotone endomap `ρ : A -> A`.
- Definable function space. The intended function space for arrow
  types consists of λ_R-definable endomaps on `A` built from Reflex
  and related structure, not arbitrary `MonotoneEndomap`s. Concretely,
  we treat `LambdaEndomap`-style maps (obtained from λ-terms via
  Reflex-aware semantics) as the canonical inhabitants of arrow types.
- Reflex-compatibility. Good maps in this function space are expected
  to commute with Reflex (or at least be compatible with its action)
  across the carrier; empirical tests over finite carriers act as
  sanity checks for this property.

Plan
----

Near-term work should follow these Reflex-first principles. The items
below are open research directions:

- **Extend the Reflex-friendly fragment.** Systematically explore a
  small implicational fragment (for example, over one atom and bounded
  depth) to find new unary `A ⇒ A` types whose proof-search
  inhabitants have a clear Reflex-world geometric meaning as
  Disciplines/Flows, Regimes or Profiles (as already established for
  `p ⇒ p` and `⊤ ⇒ ⊤`).

- **Reflex-based metatheory triangle.** For each such type/operator
  that passes the Reflex-world test above:
  - check validity/top-ness in the finite syntactic model and in the
    BoolHA/ThreeHA structures;
  - check inhabitation via proof search; and
  - characterise the induced λ_R-defined Discipline/Regime/Profile,
    adding tests that exhibit a small triangle
    (validity ⇔ top ⇔ inhabitation ⇔ geometric behaviour).

- **Richer structures and geometries.** When the Treatise specifies
  further RelationalStructures and geometries, add finite instances
  and investigate how λ_R-definable Disciplines and their higher-order
  operators interact with these in small models.
