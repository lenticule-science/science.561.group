ProfileGeometry and RelationalGeometry
======================================

.. meta::
   :xref-spec: math/infinite/physics/index (ProfileGeometry)

Definition — ***Profile Geometry***
-----------------------------------

Let *Relational Geometry*
(:class:`relationing.core.geometry.RelationalGeometry`) ***Geom*** be
given with carrier :math:`R`, nuclei :math:`\{\nu_i\}`, and flow
:math:`F`. Let :math:`\mathrm{Filter}` be a Filter commuting with all
:math:`\nu_i` and with :math:`F`. The ***Profile Geometry*** of
:math:`\mathrm{Filter}` is defined as

.. math::

   \mathrm{ProfileGeom}(\mathrm{Filter}) :=\\
   (\mathrm{Profile}(\mathrm{Filter}),
    \le, \wedge, \vee, \Rightarrow, \bot, \top;\
    \{\nu_i|_{\mathrm{Profile}}\}, F|_{\mathrm{Profile}}),

where :math:`\nu_i|_{\mathrm{Profile}}` and :math:`F|_{\mathrm{Profile}}`
are the restrictions of :math:`\nu_i` and :math:`F` to
:math:`\mathrm{Profile}(\mathrm{Filter})`.

Proposition — ProfileGeometry is a RelationalGeometry
-----------------------------------------------------

Assume :math:`\mathrm{Filter}` satisfies the Filter axioms (monotone,
stable, algebraic-preserving, nucleus-compatible, flow-compatible) on
*Geom*. Then :math:`\mathrm{ProfileGeom}(\mathrm{Filter})` satisfies
the axioms of a *Relational Geometry*.

*Proof.* Closure of :math:`\mathrm{Profile}(\mathrm{Filter})` under
the restricted nuclei and flow follows from the Nucleus Compatibility
and Flow Compatibility clauses in the Filter definition. The remaining
axioms are inherited from *Geom*. ∎
