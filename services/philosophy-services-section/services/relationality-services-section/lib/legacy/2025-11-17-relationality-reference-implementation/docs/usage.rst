Usage Guide
===========

This page is a crash course in how to use the :mod:`relationing`
library from Python and how that use fits into the project’s three
stories:

- the **Relational Mathematics Specification** (infinite spec);
- the **Computational API** (finite/transfinite implementations); and
- the **Testing Documentation** (finite witnesses and experiments).

It assumes the four strands introduced on the index page:

- ***Algebra of Relational Structure*** (*Relational Algebra*);
- ***Calculus of Relational Language*** (*Relational Calculus*);
- ***Dynamics of Relational Geometry*** (*Relational Dynamics*);
- ***Mechanics of Relational Physics*** (*Relational Mechanics*).

The examples below show how to work with each strand via the public
APIs. For extending the mathematics or implementation, see also
:doc:`guides/mathematics` and :doc:`guides/computation`.

All examples assume you have installed the project in editable mode
inside a virtualenv (for example via ``pip install -e .[dev,docs,lint]``)
and are running Python from the repository root.

If you want to *extend* the library (new maths, helpers, or tests),
see also :doc:`guides/mathematics` and :doc:`guides/computation` for
development-oriented guidance.


Relational Structure basics
---------------------------

The Structure layer provides Relationlessness, HeytingAlgebra, and
RelationalStructure. A typical starting point is to fix a
Relationlessness "void" and a Reflex on a chosen carrier, then build a
RelationalStructure bundling them::

   >>> from relationing.core.structure import Relationlessness, RelationalStructure, IdentityReflex
   >>> void = Relationlessness()
   >>> structure = RelationalStructure(reflex=IdentityReflex())

Concrete finite Heyting carriers are supplied by the caller (for
example, small application-specific HeytingAlgebra implementations) or
via helper constructions in the :mod:`relationing.library.structures`
package; the core library does not fix a single canonical finite
carrier.


Relational Language and Semantics
---------------------------------

The Language layer provides λ_R types, terms, typing, and reduction.
The Semantics layer interprets types and terms into finite
RelationalStructures.

Types and sequents
~~~~~~~~~~~~~~~~~~

You can build λ_R types and check sequent validity in a finite Heyting
algebra using :mod:`relationing.language` and
``relationing.library.structures.semantics``. Assuming you have a finite
carrier implementing :class:`relationing.structure.HeytingAlgebra`::

   >>> from relationing.language import Type
   >>> from relationing.library.structures.semantics import is_sequent_valid
   >>> carrier = [...]  # your finite HeytingAlgebra elements
   >>> p = Type.atom("p")
   >>> formula = Type.imp(p, p)  # p ⇒ p
   >>> is_sequent_valid([], formula, carrier, ["p"])
   True

Terms, typing, and denotation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To work with λ_R terms, import from :mod:`relationing.language` and
use ``type_of`` and ``normalize``::

   >>> from relationing.language import Context, Term, type_of, normalize
   >>> ctx = Context.empty()
   >>> term = Term.star()
   >>> ty = type_of(ctx, term)
   >>> ty == Type.top()
   True
   >>> normalize(term) == term
   True

You can interpret closed terms against a finite carrier using the
semantics helpers. For example, given a RelationalStructure and a
finite carrier compatible with its Reflex::

   >>> from relationing.core.structure import RelationalStructure, IdentityReflex
   >>> from relationing.library.structures.semantics import denote_closed_in_structure
   >>> structure = RelationalStructure(reflex=IdentityReflex())
   >>> carrier = [...]  # your finite HeytingAlgebra elements
   >>> v = denote_closed_in_structure(structure, carrier, term)


Profiles and Physical Systems
-----------------------------

The Geometry and Physics layers build Profiles and physical systems on
top of RelationalStructures.

Profiles and fixed points
~~~~~~~~~~~~~~~~~~~~~~~~~

The profiles module provides finite fixed-point profiles and compatibility checks
for Filters and Disciplines on arbitrary finite carriers. For example,
given a Filter and a finite carrier of recognitions::

   >>> from relationing.profiles.geometry.profiles import finite_filter_fixed_profile
   >>> profile = finite_filter_fixed_profile(filter_, carrier)

The resulting :class:`relationing.profiles.geometry.profiles.FiniteFixedProfile`
can then be used to restrict global RelationalPhysicalSystems to a
finite domain via the physics builders.

Global and profile-level physics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Physics layer exposes :class:`relationing.physics.RelationalPhysicalSystem`
and :class:`relationing.physics.ProfilePhysicalSystem`. Starting from a
RelationalStructure, flow, nuclei, and observables, you can build a
global system and then restrict it to a finite profile via::

   >>> from relationing.physics import RelationalPhysicalSystem, profile_physical_system_from_filter
   >>> system = RelationalPhysicalSystem(structure, flow, nuclei, observables)
   >>> profile_system = profile_physical_system_from_filter(system, filter_, carrier)

For detailed behaviour (flows, nuclei, invariants), refer to the
Geometry/Physics sections of the documentation.
