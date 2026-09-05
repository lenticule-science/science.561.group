ProfilePhysics and Soundness
============================

.. meta::
   :xref-spec: math/infinite/physics/index (ProfilePhysics)

Definition — ***Profile Physics***
----------------------------------

Let :math:`\mathrm{RPhys} := (\mathrm{Geom}, \mathrm{Obs})` be a
*Relational Physical System*. Given a Filter on *Geom*, define the
***Profile Physics*** of that Filter as

.. math::

   \mathrm{ProfilePhys}(\mathrm{Filter}) :=\\
   (\mathrm{ProfileGeom}(\mathrm{Filter}),
    \mathrm{Obs}_{\mathrm{Profile}}),

where :math:`\mathrm{Obs}_{\mathrm{Profile}}` is any chosen family of
observables restricted to :math:`\mathrm{Profile}(\mathrm{Filter})`
or newly declared observables internal to
:math:`\mathrm{ProfileGeom}(\mathrm{Filter})`.

States are recognitions in :math:`\mathrm{Profile}(\mathrm{Filter})`;
evolution is given by :math:`F|_{\mathrm{Profile}}`; measurement /
idealisation is given by the restricted nuclei
:math:`\{\nu_i|_{\mathrm{Profile}}\}`.


Theorem — ProfilePhysics Soundness
----------------------------------

Interpreting :math:`\lambda_{\mathrm{Profile}}` in
:math:`\mathrm{ProfilePhys}(\mathrm{Filter})` yields:

If :math:`\Gamma \vdash t : A` in :math:`\lambda_{\mathrm{Profile}}`,
then under any evolution by :math:`F|_{\mathrm{Profile}}` and any
nucleus :math:`\nu_i|_{\mathrm{Profile}}`, denotations respect
:math:`\le` and all invariants declared by
:math:`\mathrm{ProfileGeom}(\mathrm{Filter})` are maintained.

**Proof.** This is an instance of the Soundness of Physical Semantics
Theorem, applied to :math:`\mathrm{ProfileGeom}(\mathrm{Filter})`.
All required compatibility properties hold by restriction from
*Geom*. ∎
