Cyclic Profile Physics and Time-Symmetric Evolution
===================================================

Lemma — *Cyclic Profile Physics and Time-Symmetric Evolution*
-------------------------------------------------------------

.. meta::
   :induced-by: math/infinite/geometry/lemma_cyclic_flow_adjoint_collapse

Let a *RelationalPhysicalSystem* (``RelationalPhysicalSystem``)

.. math::

   RPhys = (\mathrm{Geom}, \mathrm{Obs})

have carrier :math:`R`, Relational Geometry :math:`\mathrm{Geom}`
(``RelationalGeometry``) with Flow :math:`F : R \to R`, nuclei, and
observables as in the Physics spec. Let a Filter on
``RelationalGeometry`` induce a Profile Geometry
``ProfileGeom(Filter)`` with finite profile

.. math::

   P = \mathrm{Profile}(\mathrm{Filter}) \subseteq R,

and assume:

- The profile :math:`P` is a finite chain of recognitions

  .. math::

     P = \{ p_0, \dots, p_{n-1} \},
     \quad
     p_0 \leq \dots \leq p_{n-1},

  with the inherited order from :math:`R`.

- The restricted Flow :math:`F\!\restriction_P` is a cycle on
  :math:`P`:

  .. math::

     F(p_i) = p_{i+1} \quad (0 \leq i < n-1),
     \qquad
     F(p_{n-1}) = p_0,

  as in the cyclic Flow lemma.

- There is an endomap :math:`G : R \to R` whose restriction to
  :math:`P` is the inverse cycle and which is a relational adjoint of
  :math:`F` on :math:`P`:

  .. math::

     F\!\restriction_P \dashv G\!\restriction_P \dashv F\!\restriction_P

  in the sense of the Geometry lemma.

Then the profile-level physical system

.. math::

   \mathrm{ProfilePhys}(\mathrm{Filter})
   = (\mathrm{ProfileGeom}(\mathrm{Filter}), \mathrm{Obs}_{\mathrm{Profile}})

admits a canonical time-symmetric evolution pair:

- *forward evolution* given by :math:`F\!\restriction_P`, and
- *backward evolution* given by :math:`G\!\restriction_P`,

such that, for all profile states :math:`x \in P`:

- *Exact reversibility on the profile.*

  .. math::

     G(F(x)) = x = F(G(x)).

- *Adjoint evolution.*

  For all :math:`x, y \in P`:

  .. math::

     F(x) \leq y \;\Leftrightarrow\; x \leq G(y),
     \qquad
     G(x) \leq y \;\Leftrightarrow\; x \leq F(y),

  so “evolving forward then comparing” is equivalent to “comparing then
  evolving backward”, and dually.

- *Profile-physics invariance.*

  Observables in :math:`\mathrm{Obs}_{\mathrm{Profile}}`, being
  restrictions of observables in :math:`RPhys`, respect the adjoint
  evolution: any invariant or law expressible as an inequality or
  nucleus condition on :math:`P` is preserved both by forward
  evolution :math:`F\!\restriction_P` and backward evolution
  :math:`G\!\restriction_P`.

Thus a RelationalPhysicalSystem whose profile Flow is cyclic in this
sense carries an internally defined, time-symmetric dynamics on that
profile, determined purely by its Relational Geometry.

*Proof (sketch).* By the Geometry lemma, on the profile :math:`P` we
have:

- :math:`F\!\restriction_P` is a bijection with inverse
  :math:`G\!\restriction_P`; and
- the adjoint laws

  .. math::

     F\!\restriction_P \dashv G\!\restriction_P \dashv F\!\restriction_P

  hold with respect to the profile order.

Exact reversibility follows immediately from
:math:`G\!\restriction_P = (F\!\restriction_P)^{-1}`:

.. math::

   \forall x \in P:\quad G(F(x)) = x = F(G(x)).

The adjoint evolution equivalences are exactly the statements

.. math::

   F(x) \leq y \;\Leftrightarrow\; x \leq G(y),
   \qquad
   G(x) \leq y \;\Leftrightarrow\; x \leq F(y),

already established geometrically for all :math:`x, y \in P`.

For profile-physics invariance, we use that
:math:`\mathrm{ProfilePhys}(\mathrm{Filter})` is constructed by
restricting Geometry and observables to the profile
(:math:`\mathrm{ProfileGeom}(\mathrm{Filter})`,
:math:`\mathrm{Obs}_{\mathrm{Profile}}`). The Flow restriction
:math:`F\!\restriction_P` is required to preserve the profile and its
nuclei; the same holds for :math:`G\!\restriction_P` whenever we treat
it as a Discipline/endomap on the profile. Observables on :math:`P`
are compatible with the profile geometry, and since the profile order
and nuclei are preserved under both evolutions, inequalities
expressing invariants are stable under forward and backward evolution.

Thus within the ProfilePhysicalSystem we obtain a canonical
forward/backward evolution pair that is reversible, adjoint in the
relational sense, and preserves all profile-level geometric and
physical invariants. :math:`\square`

