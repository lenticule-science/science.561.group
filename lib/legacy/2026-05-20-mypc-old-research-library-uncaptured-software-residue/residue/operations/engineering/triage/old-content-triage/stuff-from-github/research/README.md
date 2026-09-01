Relationality — Reference Implementation
========================================

This repository contains a Python reference implementation of
Relational mathematics and computations. It organises
relational mathematics into four layers:

- Relational Structure
- Relational Language
- Relational Geometry
- Relational Physics

and realises them as a small, testable Python library,
``relationing``, built over finite Heyting models.

The canonical relational mathematics specification lives under
``docs/math/``; this codebase mirrors those notes and provides finite,
executable witnesses to the main definitions and theorems.

Status
------

- Intended audience: internal researchers working with the Relationality
  code and the Relational Mathematics Specification via Python imports.
- Maturity: alpha; APIs and spec are still evolving.
- The ``relationing`` package currently provides:

  - **Structure layer** – basic order and Heyting-algebra abstractions,
    Relational finite Heyting algebras built from Relationlessness,
    RelationalStructure wrappers with designated Reflex endomaps, and
    Reflex iteration/quotient helpers.
  - **Language layer** – the λ_R language (types, terms, typing,
    reduction), normalization, and soundness over finite models.
  - **Structures and semantics** – type/term semantics into finite
    Heyting carriers, a finite syntactic recognition model, and a
    small implicational proof search.
  - **Geometry layer** – nuclei, flows, Disciplines, Filters, and
    finite profile construction helpers.
  - **Physics layer** – RelationalPhysicalSystem and profile-level
    physics builders over finite profiles.

Installation
------------

Prerequisites:

- Python 3.10+.

From the repository root, the recommended setup is via the Makefile:

.. code-block:: bash

   make install

This will:

- create a virtualenv in ``.venv``;
- install the project in editable mode with developer/docs/lint extras;
- install tools such as ``pytest``, ``mypy``, ``black``, ``ruff``,
  and ``sphinx`` into that environment.

Optionally, configure Git to use the repository’s hooks:

.. code-block:: bash

   git config core.hooksPath .githooks

Quickstart
----------

With the virtualenv active (for example, via ``source .venv/bin/activate``),
you can explore λ_R types and finite semantics from a Python shell:

.. code-block:: python

   from relationing.language import Type
   from relationing.library.structures.semantics import is_sequent_valid

   # A simple illustration carrier; real models use HeytingAlgebra instances.
   class TwoElementHA:
       def __init__(self, value: bool) -> None:
           self.value = value

   carrier = [TwoElementHA(False), TwoElementHA(True)]

   p = Type.atom("p")
   formula = Type.imp(p, p)  # p ⇒ p

   print(is_sequent_valid([], formula, carrier, ["p"]))  # True (on suitable carriers)

For more structured examples (including concrete finite carriers and
profiles), see the usage guide in ``docs/usage.rst`` and the tests
under ``tests/``.

Repository layout
-----------------

Top-level structure:

- ``README.md`` – this overview.
- ``pyproject.toml`` – Python project metadata.
- ``Makefile`` – standard commands for tests, docs, linting, versioning.
- ``docs/`` – Sphinx documentation:

- ``relational_core/`` – canonical Relational Mathematics Specification notes;
  - ``structure.rst``, ``language.rst``, ``geometry.rst``,
    ``physics.rst`` – layer/API docs;
  - ``system.rst`` – system and developer guide (repo methods/processes);
  - ``changelog.rst`` – project changelog.

- ``relationing/`` – main Python package:

  - ``core/structure/`` – RelationalStructure, Heyting carriers, iteration, quotients.
  - ``core/language/`` – λ_R syntax, typing, reduction, metatheory helpers.
  - ``core/geometry/`` – nuclei, flows, Disciplines, Regimes, RelationalGeometry.
  - ``core/physics/`` – observables, RelationalPhysicalSystem, profile systems.
  - ``library/structures/`` – concrete structures, semantics, syntactic model, proof search.
  - ``library/profiles/`` – finite profiles and profile-level physics helpers.
  - public facades: ``relationing.structure``,
    ``relationing.language``, ``relationing.geometry``,
    ``relationing.physics``, ``relationing.structures``,
    ``relationing.profiles``.

- ``tests/`` – test suite covering the layers and library helpers, for
  example:

  - ``test_carrier_two_element_heyting.py`` – minimal two-element Heyting carrier.
  - ``test_finite_powerset_heyting.py`` – finite powerset Heyting algebras.
  - ``test_finite_powerset_semantics.py`` – semantics over powerset carriers.
  - ``test_geometry_core.py`` – geometry core abstractions and helpers.
  - ``test_language_soundness_semantics.py`` – λ_R soundness and semantics.
  - ``test_language_typing_and_judgements.py`` – typing and judgemental equality.
  - ``test_library_morphisms_and_semantics.py`` – morphisms and semantics.
  - ``test_library_proof_search_and_unary_explorer.py`` – proof search and unary exploration.
  - ``test_physics_core.py`` – RelationalPhysicalSystem and profile physics.
  - ``test_profiles_geometry.py`` – profiles and geometry-level invariants.
  - ``test_semantics_unary_disciplines.py`` – unary λ_R disciplines.
  - ``test_structure_iteration_and_quotient.py`` – iteration, quotients, implication.
  - ``test_structure_origination_and_exclusion.py`` – origination and exclusion.
  - ``test_syntactic_model.py`` – syntactic recognition model.
  - ``test_version.py`` – version metadata is consistent.

Development
-----------

For contributors and agents, the canonical workflow is described in
``docs/system.rst`` and summarised in ``AGENTS.md``. In brief:

- **Set up:**

  - ``make install`` – create and populate ``.venv``;
  - ``git config core.hooksPath .githooks`` – enable repo hooks.

- **Run checks:**

  - ``make test`` – run the test suite;
  - ``make docs-html`` – build the Sphinx HTML docs only;
  - ``make docs`` – build both HTML and PDF docs;
  - ``make lint`` / ``make format`` / ``make typecheck`` – run ruff,
    black, and mypy.

- **Versioning and changelog:**

  - versions follow a SemVer-like policy; see ``docs/system.rst``;
  - ``make version-bump-{patch,minor,major}`` – bump version, run tests
    and docs;
  - ``make changelog-unreleased`` – generate a draft Unreleased section
    from Conventional Commit headers.

- **Hook behaviour:**

  - ``pre-commit`` runs compile, lint, format-check, tests, API/version
    checks, and (when docs change) a Sphinx build;
  - ``pre-push`` runs tests, mypy, and a docs build.

Roadmap
-------

Very high-level roadmap (see ``docs/relational_core/`` and
``docs/system.rst`` for details):

- **Phase 1 (soon/plan):** solidify core Structure/Language/Geometry/
  Physics and semantics with strong tests and documentation.
- **Phase 2 (later):** deepen the Geometry/Physics layers with richer
  nuclei/flows, Disciplines, composite and nested Regimes/Profiles,
  and profile-level physical systems.
- **Phase 3 (someday):** explore larger fragments (semantic validity ⇔
  provability ⇔ top element) and deepen the metatheory, including
  more explicit proof sketches and links between notes, tests, and
  implementation.

License
-------

The project is marked as ``Proprietary`` in ``pyproject.toml`` and is
intended for internal research use. Refer to the repository owner for
licensing and usage terms.
