Finite RelationalPhysicalSystem
===============================

.. meta::
   :xref-spec: math/infinite/physics/relational_physical_system
   :xref-code: code/core/physics/system
   :xref-tests: tests/core/physics/test_relational_physical_system_evolve

Statement
---------

Finite ***Relational Physical System*** (*RelationalPhysicalSystem*)
instances instantiate the Physics-layer system definition on explicit
finite carriers. Given a finite *Relational Structure* with flow,
nuclei, and observables, the core Physics helpers construct finite
RelationalPhysicalSystem values whose evolution behaviour can be
checked directly in tests.

The tests listed above exercise such finite systems on a two-element
Heyting carrier with an identity-like flow and nuclei, providing
concrete witnesses to the RelationalPhysicalSystem axioms on small
models.
