Nuclei, Flows, and Fixed Points
===============================

.. meta::
   :xref-spec: math/infinite/geometry/index (Nuclei, Flows, Fixed Points)

This file isolates the Relational Geometry definitions and laws for
Relational nuclei and flows:

- nucleus-like endomaps satisfying closure or interior conditions;
- flows as monotone endomaps with lax-idempotence and directional
  properties; and
- compatibility, fixed-point existence, and transport properties
  relating nuclei, flows, and fixed-point sets.

Relational Flow
---------------

Definition — ***Relational Flow*** (*Flow*)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Given a *Relational Geometry* (:class:`relationing.core.geometry.RelationalGeometry`)
on a carrier ***R***, a ***Relational Flow*** (*Flow*) is an endomap
:math:`F : R \to R` such that for all :math:`x, y \in R`:

- *Monotone*: :math:`x \le y \Rightarrow F(x) \le F(y)`;
- *Lax-idempotent*: :math:`F(F(x)) \le F(x)` (optionally equality);
- *Directionality*: either (inflationary) :math:`x \le F(x)` or
  (deflationary) :math:`F(x) \le x`;
- *Nucleus interaction*: declared laws, for example,
  :math:`F \circ \nu \le \nu \circ F` (closure-like) or
  :math:`\nu \circ F \le F \circ \nu` (interior-like).


Further derived laws for flows and nuclei are split into the separate
notes :doc:`flow_fixed_sets_and_existence`,
:doc:`flow_nucleus_compatibility_and_transport`,
:doc:`derived_nucleus_and_flow_laws`, and :doc:`temporal_closure`.
