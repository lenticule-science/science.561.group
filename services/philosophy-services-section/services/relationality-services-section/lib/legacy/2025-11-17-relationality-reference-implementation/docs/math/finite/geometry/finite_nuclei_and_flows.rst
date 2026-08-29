Finite nuclei and flows
=======================

.. meta::
   :xref-spec: math/infinite/geometry/relational_nucleus, math/infinite/geometry/nuclei_and_flows
   :xref-code: code/core/geometry/nucleus, code/core/geometry/flow, code/core/geometry/flow_laws, code/core/geometry/flow_nucleus_compatibility, code/core/geometry/transport_flow_fixed_points, code/core/geometry/transport_nucleus_fixed_points
   :xref-tests: tests/core/geometry/test_nucleus_laws_on_two_element_ha, tests/core/geometry/test_flow_laws_and_endomap_flow_wrapper, tests/core/geometry/test_discipline_commutes_with_nucleus_and_flow

Statement
---------

Finite nuclei and flows instantiate the ***Relational Nucleus*** and
***Relational Flow*** axioms on explicit finite Heyting carriers. The
core Geometry helpers construct:

- nuclei whose closure/interior-like laws can be checked by the finite
  law checkers; and
- flows whose lax-idempotence and compatibility with nuclei can be
  validated on two-element and other small carriers.

The tests listed above exercise these finite witnesses, confirming that
the nucleus and flow axioms from the infinite Geometry notes hold on
explicit finite models and that flow–nucleus compatibility and fixed-
point transport behave as specified.
