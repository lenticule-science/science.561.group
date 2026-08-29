Treatise–Code Mapping
=====================

This document lists the main conceptual artefacts from the Relational
Core notes and their current counterparts in the codebase.

Relational Structure
--------------------

- **Recognitions and Heyting algebra**
  - `relationing/core/structure/heyting_algebra.py`
    - `HeytingAlgebra` protocol and `neg` method (Heyting negation).
  - `relationing/core/structure/` and `relationing/library/structures/`
    - Relational finite Heyting carriers built from Relationlessness
      (via exclusion atoms and articulation) and their finite
      substructures.
- **RelationalStructure**
  - `relationing/core/structure/relational_structure.py`
    - `RelationalStructure[A, R]` bundling a carrier and a Reflex
      endomap (as `MonotoneEndomap`).
- **Endomaps and fixed points**
  - `relationing/core/structure/monotone_endomap.py`
    - `MonotoneEndomap` protocol.
  - `relationing/geometry/__init__.py`
    - `Nucleus`, `Flow`, `FixedPointRegime`.
- **Morphisms and substructures**
  - `relationing/structures/morphisms.py`
    - `RelationalMorphism` protocol.
    - `IdentityMorphism`.
    - `FiniteSubstructure` with closure checks.

Relational Language (λ_R)
-------------------------

- **Types and terms**
  - `relationing/language/__init__.py`
    - `TypeKind`, `Type` (⊥, ⊤, ∧, ∨, ⇒, atoms, and derived ¬).
    - `Var`, `Term` (variables, λ/app, products, sums, abort, reflex).
    - `Context`, `type_of`.
- **Operational semantics**
  - `relationing/language/__init__.py`
    - substitution helper and `_step`/`normalize` for small-step reduction.
- **Soundness and completeness (partial)**
  - `relationing/structures/semantics.py`
    - `interpret_type`, `interpret_type_in_structure` for types.
    - `interpret_term`, `interpret_term_in_structure` for a fragment
      of terms, including ρ via Reflex.
    - `is_sequent_valid`, `is_sequent_valid_in_structure`, and
      `typing_sound_in_model` on finite models.
  - `tests/test_semantics.py`, `tests/test_soundness.py`
    - Concrete checks of valid formulas and typings in finite
      Relational models.

Relational Geometry
-------------------

- **Nuclei and flows**
  - `relationing/geometry/__init__.py`
    - `Nucleus`, `Flow` interfaces and law-checking helpers.
- **Dynamic residuation**
  - `tests/test_examples.py`
    - checks of dynamic residuation laws on small finite examples.
- **Disciplines, Filters, Regimes**
  - `relationing/geometry/__init__.py`
    - `Discipline`, `Filter`, `Regime`, `FixedPointRegime`.
  - `relationing/library/profiles/geometry/profiles.py`
    - `FiniteProfile` (finite analogue of Profile(Filter)).
    - `finite_profile_from_filter`.
    - `is_filter_reflex_compatible` to gate Filters that commute with
      Reflex (Treatise-style Disciplines) as profile roots.
  - `tests/test_examples.py`, `tests/test_profiles.py`
    - Heyting-closure and composite/nested/Reflex-induced profile
      behaviour on finite carriers, including Reflex-compatibility
      checks.

Relational Physics
------------------

- **Global systems**
  - `relationing/physics/__init__.py`
    - `RelationalPhysicalSystem` with structure, flow, nuclei,
      observables.
- **Profile-level systems**
  - `relationing/physics/__init__.py`
    - `ProfilePhysicalSystem` restricted to a `FiniteProfile`.
  - `tests/test_profile_physics.py`
    - Invariant checks for nucleus-fixed states under evolution and
      profile-level logical validity on Reflex-induced profiles.

Filters and Profile Towers
--------------------------

The Treatise describes Composite Profiles and nested Profile towers.
Currently implemented:

- Single-level Reflex-compatible profiles and composite/nested profiles
  on small finite carriers (via `FiniteProfile` and composite/nested
  profile helpers).

Not yet implemented:

- General composite filters over arbitrary carriers.
- A separate ProfileLanguage (we reuse the global λ_R with restricted
  carriers) and explicit profile-local syntactic models beyond the
  current tests.
