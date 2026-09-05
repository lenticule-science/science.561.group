Relational Mathematics
======================

This part of the documentation states the **Relational Mathematics**
that serves as the formal specification for the implementation. It is
organised along the four layers of Relationality:

- *Relational Structure*;
- *Relational Language*;
- *Relational Geometry*; and
- *Relational Physics*.

All concepts are defined internally in a purely relational vocabulary,
starting from ***Relationlessness*** and a primitive act of ***Reflex***.
The infinite notes describe this theory without size bounds; the finite
and transfinite notes record fragments and constructions used by the
library and reserved extensions respectively.


Introduction
------------

Relationality presents a frame-agnostic foundation of relational
mathematics. The Relational Mathematics notes here present that
foundation as a specification: they fix the definitions, lemmas,
propositions, theorems, and corollaries that the code and tests must
respect. Nothing in this section assumes finiteness; finite and
transfinite fragments are treated as specialisations of the infinite
theory and are tracked explicitly under the finite and transfinite
Relationality trees (:doc:`finite/index` and :doc:`transfinite/index`).


.. rubric:: Naming convention

Formal concepts are named using a small spec–code convention:

- Each concept is introduced with a ***Strong Italic Title Case***
  mathematical name and, when appropriate, its primary code symbol in
  parentheses. For example::

     Definition — ***Relational Structure*** (*RelationalStructure*)

  Here ***Relational Structure*** names the mathematical notion, and
  ``RelationalStructure`` is the corresponding implementation object
  under :mod:`relationing`.

- Subsequent references in the notes and documentation use
  *Italic Title Case* for the mathematical name, optionally followed
  by the code symbol in parentheses, for example
  *Relational Structure* (*RelationalStructure*).

Section headings may use natural language. Cross-references use
explicit names (for example, ``Residuation Law Lemma``,
``Flow–Nucleus Compatibility Proposition``) rather than numeric
labels.

This Sphinx tree (rooted under :doc:`math/index`) is intended to carry
the full mathematical content of the Relational Mathematics:
every formal definition, lemma, proposition, theorem, and corollary is
organised into Structure / Language / Geometry / Physics files, together
with small library-level fragments. The reStructuredText here is the
canonical, up-to-date mathematical reference for the Python
implementation.


Infinite Relationality
----------------------

The infinite Relationality subtree records the unconstrained
Relational Mathematics Specification: no cardinality or finiteness assumptions are
made. The primary organisation is by layer:

- Infinite Relational Structure;
- Infinite Relational Language;
- Infinite Relational Geometry; and
- Infinite Relational Physics.

Each layer index explains its role and then delegates to one-file-per-
element notes for definitions, lemmas, propositions, and theorems.

.. toctree::
   :maxdepth: 2

   infinite/structure/index
   infinite/language/index
   infinite/geometry/index
   infinite/physics/index


Finite Relationality
--------------------

The finite Relationality subtree records finite *witnesses* of the
Relational Mathematics Specification: finite models, finite proof-search
fragments, and other constructions stated explicitly for finite
carriers or structures. These notes do not change the infinite theory;
instead they specialise it to the finite setting used by the current
Python implementation.

Over time this tree will mirror the Infinite Relationality layers
(Structure / Language / Geometry / Physics). At present, most finite
material lives in the library-level fragments.

.. toctree::
   :maxdepth: 2

   finite/index


Transfinite Relationality
-------------------------

The transfinite Relationality subtree is reserved for future
transfinite extensions of the Relational Mathematics Specification. It will
eventually mirror the Infinite and Finite Relationality trees with
Structure, Language, Geometry, and Physics layers at transfinite
scales.

.. toctree::
   :maxdepth: 2

   transfinite/index


Library-level fragments
-----------------------

Small, library-aligned mathematical notes that cut across the layers
are collected under:

.. toctree::
   :maxdepth: 1

   library/index


Open TODOs overview
~~~~~~~~~~~~~~~~~~~

Open TODO items for the Relational Mathematics Specification, code,
and tests are aggregated once in :doc:`todo`.  Individual spec pages
may carry local ``.. todo::`` entries, but this index is the canonical
place to review and navigate them, grouped by phase.
