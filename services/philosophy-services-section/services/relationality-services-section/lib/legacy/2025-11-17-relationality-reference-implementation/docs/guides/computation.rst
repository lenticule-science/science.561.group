Computation and API Guide
=========================

This guide is for people using the project as a Python library and
for contributors implementing code and tests. It complements the
Mathematics Guide and the shared :doc:`repository` guide, and
organises the implementation around the same
four strands:

- ***Algebra of Relational Structure*** (*Relational Algebra*) –
  core Structure APIs and finite carriers.
- ***Calculus of Relational Language*** (*Relational Calculus*) – λ_R
  APIs and semantics.
- ***Dynamics of Relational Geometry*** (*Relational Dynamics*) –
  geometry APIs, Disciplines, and profiles.
- ***Mechanics of Relational Physics*** (*Relational Mechanics*) –
  system and profile-level physics APIs.

Using the library
-----------------

For everyday use:

- Start from :doc:`usage` for end-to-end examples.
- Use the stable public entrypoints:

  - ``relationing.structure``
  - ``relationing.language``
  - ``relationing.geometry``
  - ``relationing.physics``
  - ``relationing.structures``
  - ``relationing.profiles``

- Each layer page (:doc:`structure`, :doc:`language`,
  :doc:`geometry`, :doc:`physics`, :doc:`unary`) summarises the
  concepts, links to the specs, and points at the relevant core and
  library API docs.

In general, treat ``relationing.core.*`` as internal building blocks
and the ``relationing.*`` facades as the supported surface.

Developing code and tests
-------------------------

When extending the implementation or tests, follow the repository
method as captured in :doc:`repository` and specialised here for code
and tests:

- Start from the spec:

  - identify the atomic spec files under ``docs/math/*`` that your
    change relies on or extends;
  - if a spec element does not exist yet, add it first (or add a
    TODO with an appropriate ``:phase:``).

- Implement core abstractions under ``relationing.core.*`` and finite
  or transfinite witnesses under ``relationing.library.*``; avoid
  mixing tiers in a single module.

- Use intention-revealing, law-based names:

  - reflect algebraic laws (idempotent, monotone, involutive, etc.);
  - reflect the domain (Structure/Language/Geometry/Physics/Profile);
  - reflect tier where appropriate (``Finite*`` / ``Transfinite*``
    types; ``finite_*`` / ``transfinite_*`` builders).

- Keep modules and test files small and concept-focused, mirroring
  the atomic spec structure.

- For each new code module or test:

  - add or update a doc page under ``docs/code/*`` or ``docs/tests/*``;
  - include ``.. meta::`` with ``:xref-spec:`` pointing at the spec
    atoms and ``:xref-code:`` / ``:xref-tests:`` where appropriate.

Planned package layout (Algebra / Calculus / Dynamics / Mechanics)
------------------------------------------------------------------

The current code layout still reflects the older
Structure/Language/Geometry/Physics naming. Over time we intend to
align the package structure with the four strands used in the
mathematics and guides:

- ***Algebra of Relational Structure*** (*Relational Algebra*)
- ***Calculus of Relational Language*** (*Relational Calculus*)
- ***Dynamics of Relational Geometry*** (*Relational Dynamics*)
- ***Mechanics of Relational Physics*** (*Relational Mechanics*)

In outline, this means evolving the modules towards shapes like:

- ``relationing.algebra`` (currently ``relationing.core.structure``)
- ``relationing.calculus`` (currently ``relationing.core.language``)
- ``relationing.dynamics`` (currently ``relationing.core.geometry``)
- ``relationing.mechanics`` (currently ``relationing.core.physics``)
- ``relationing.dynamics.finite`` / ``relationing.dynamics.transfinite``
  for Geometry lemmas and helpers that are intrinsically finite or
  transfinite;
- ``relationing.mechanics.finite`` / ``relationing.mechanics.transfinite``
  for finite/transfinite Physics-specific helpers; and
- ``relationing.library.carriers`` / ``relationing.library.profiles`` /
  ``relationing.library.morphisms`` for concrete witnesses shared
  across strands.

The detailed refactor will require coordinated changes to code,
imports, tests, and docs, together with an explicit versioning
decision (whether to provide temporary aliases or treat this as a
breaking MAJOR change).

.. todo::

   :phase: plan

   Implement the module layout refactor sketched above: move the
   existing ``relationing.core.*`` modules into top-level
   ``relationing.algebra``, ``relationing.calculus``,
   ``relationing.dynamics``, and ``relationing.mechanics``, refine the
   ``relationing.library.*`` subpackages (for example, carriers,
   profiles, morphisms), update all imports and documentation, and
   make an explicit versioning choice about deprecations versus a
   clean breaking rename.

Tooling and workflow
--------------------

The key pieces for day-to-day work are:

- ``make install`` – create a local virtualenv in ``.venv`` and
  install the project in editable mode with developer, docs, and
  linting extras.
- ``make test`` – run the test suite via ``pytest -q``.
- ``make docs-html`` / ``make docs-pdf`` – build the HTML and PDF
  documentation.
- ``make docs-clean`` – remove Sphinx build artefacts.
- ``make lint`` – run ``ruff`` over the codebase.
- ``make format`` – run ``black`` to format the codebase.
- ``make typecheck`` – run ``mypy`` over ``relationing`` and
  ``tests``.

Version bump helpers are centralised through the Makefile. When
changing the package version, prefer:

- ``make version-bump-patch`` – increment the ``PATCH`` component;
- ``make version-bump-minor`` – increment ``MINOR`` and reset
  ``PATCH`` to zero;
- ``make version-bump-major`` – increment ``MAJOR`` and reset
  ``MINOR`` and ``PATCH`` to zero.

These targets update both ``pyproject.toml`` and
``relationing/__init__.py`` so that ``relationing.__version__``
remains consistent with the project metadata. ``make
version-bump-patch`` refuses to run if any public API files under
``relationing`` have changed since the last tag, enforcing the rule
that PATCH bumps are only for non-breaking, in-flight work at or
after ``phase: spec-test``.

For branch management in line with the TODO method, the Makefile
also provides:

- ``make branch-work name=<branch>`` – from ``main``, run tests and
  docs, then create and check out a short‑lived work branch
  ``<branch>``.
- ``make branch-task task=<name>`` – from a work branch, create and
  check out a task branch named after the current branch plus
  ``-<name>`` (for example,
  ``codex-session-lambda/derivation-objects``), intended for a single
  TODO chain.
- ``make branch-merge-main`` – from a work branch, run tests and docs,
  then merge that work branch back into ``main`` with a
  non–fast-forward merge.

Git hooks under ``.githooks/`` provide lightweight automation:

- ``pre-commit`` compiles the code, runs ``ruff`` and ``black --check``,
  runs ``pytest -q``, checks that public API changes are accompanied
  by a suitable version bump, and, when docs or ``README.md`` change,
  builds the Sphinx HTML docs.
- ``commit-msg`` enforces Conventional Commits–style headers on the
  first line and, for release commits of the form
  ``chore(release): vX.Y.Z``, checks that version and changelog files
  are staged and consistent.
- ``pre-push`` runs tests, ``mypy``, and a Sphinx HTML docs build.

Fix the underlying issues rather than bypassing these hooks.

TODOs, backlog, and phases
--------------------------

Open TODO items are aggregated in :doc:`todo` and recorded as
``.. todo::`` entries throughout the docs. The shared :doc:`repository`
guide defines the phase vocabulary and how TODOs move through the
pipeline; this section focuses on how that interacts with code and
tests.

In particular:

- Treat ``docs/todo.rst`` as the canonical backlog view when deciding
  which code or tests to touch next.
- When a user or contributor asks for new work, log or refine the
  corresponding TODO(s) and decide whether they should come before or
  after existing items based on their phases.
- As you move from spec to tests to code and docs (for example, from
  ``spec-math`` through ``code-module`` and ``cross-doc``), keep the
  TODO's ``:phase:`` up to date and ensure the spec–code–tests
  triangle stays tight:

  - small, focused code changes that directly witness spec items;
  - tests that exercise those witnesses on finite examples; and
  - docs that cross-link the two back to the maths.
