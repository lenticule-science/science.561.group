Mathematics Guide
=================

This guide is for people working on the Relational Mathematics:
reading the spec, and developing new definitions, lemmas, and
theorems together with finite and transfinite witnesses. It complements
the shared :doc:`repository` guide and follows
the four main strands:

- ***Algebra of Relational Structure*** (*Relational Algebra*) –
  recognitions, order, algebraic constructions (including Heyting
  carriers), iteration, fixed points, and quotients.
- ***Calculus of Relational Language*** (*Relational Calculus*) –
  λ_R syntax, typing, reduction, and metatheory.
- ***Dynamics of Relational Geometry*** (*Relational Dynamics*) –
  nuclei, flows, Disciplines, Filters, and profiles.
- ***Mechanics of Relational Physics*** (*Relational Mechanics*) –
  global systems, profile-level systems, and profile towers built from
  Geometry.

Using the mathematics
---------------------

- Start at :doc:`math/index` for the overall Relational Mathematics
  layout.
- Each layer’s chapter (:doc:`structure`, :doc:`language`,
  :doc:`geometry`, :doc:`physics`) links to its infinite spec under
  ``docs/math/infinite/<layer>/`` and to any finite/transfinite
  fragments.
- Treat:

  - ``docs/math/infinite/*`` as the canonical infinite theory;
  - ``docs/math/finite/*`` as finite witnesses;
  - ``docs/math/transfinite/*`` as transfinite extensions.

When you see a concept in code or tests, you should be able to trace
it back to an atomic spec file under ``docs/math`` (and conversely).

Developing new mathematics
--------------------------

When adding or refining maths, follow the repository method as
captured in :doc:`repository` and specialised here for the spec:

- Work in the order Structure → Language → Geometry → Physics, and
  only then extend library-level constructions.
- Keep each formal element in its own atomic file:

  - definitions in ``definition_*`` files;
  - lemmas in ``lemma_*`` files;
  - propositions in ``proposition_*`` files;
  - theorems in ``theorem_*`` files.

- At definition:

  - use ***Strong Italic Title Case*** for the mathematical name;
  - give the primary code symbol in parentheses in monospace, when
    relevant;
  - whenever possible, make the name itself a ``:doc:`` link to the
    defining file.

- Before and after definition:

  - use *Italic Title Case* for mentions of concepts;
  - link the first mention in a paragraph to the defining spec or, in
    code/test docs, to the relevant API page.

- For each atomic spec file:

  - add a ``.. meta::`` block with ``:induced-by:`` listing the
    earlier spec atoms that induce it;
  - once code/tests exist, add ``:xref-code:`` and ``:xref-tests:``
    pointing at the matching code and test docs.

Finite and transfinite witnesses
--------------------------------

The method expects every important infinite result to have explicit
finite (and, where relevant, transfinite) witnesses or a clearly
phased TODO:

- Put finite witnesses under ``docs/math/finite/<layer>/`` or
  ``docs/math/finite/library/*`` as appropriate.
- Put transfinite witnesses under
  ``docs/math/transfinite/<layer>/`` or
  ``docs/math/transfinite/library/*``.
- Use TODOs with ``:phase: spec-math`` or ``spec-test`` when a finite
  or transfinite witness is still missing, and make sure tests and
  code refer only to the finite/transfinite fragments they actually
  implement.

When in doubt about phases, see the “TODOs, backlog, and phases”
section of :doc:`guides/computation` and the TODOs section of the
shared :doc:`repository` guide.
