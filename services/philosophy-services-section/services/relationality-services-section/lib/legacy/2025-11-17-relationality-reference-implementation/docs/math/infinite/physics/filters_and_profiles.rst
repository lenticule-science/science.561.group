Filters and Profiles
====================

Definition — ***Filter***
-------------------------

Let *Relational Geometry*
(:class:`relationing.core.geometry.RelationalGeometry`) ***Geom*** be
given with carrier :math:`R`, nuclei :math:`\{\nu_i\}`, and flow
:math:`F`. A ***Filter*** on *Geom* is a Discipline

.. math::

   \mathrm{Filter} : R \to R

such that, for all recognitions :math:`x, y \in R`:

1. *Monotonicity*:
   :math:`x \le y \Rightarrow \mathrm{Filter}(x) \le \mathrm{Filter}(y)`.
2. *Stability*:
   :math:`\mathrm{Filter}(\mathrm{Filter}(x)) = \mathrm{Filter}(x)`.
3. *Algebraic preservation*:

   - :math:`\mathrm{Filter}(x \wedge y)
     = \mathrm{Filter}(x) \wedge \mathrm{Filter}(y)`,
   - :math:`\mathrm{Filter}(x \vee y)
     = \mathrm{Filter}(x) \vee \mathrm{Filter}(y)`,
   - :math:`\mathrm{Filter}(x \Rightarrow y)
     \le \mathrm{Filter}(x) \Rightarrow \mathrm{Filter}(y)`.

4. *Nucleus compatibility*: for each nucleus :math:`\nu_i`,

   - :math:`\mathrm{Filter}(\nu_i(x)) = \nu_i(\mathrm{Filter}(x))`.

5. *Flow compatibility*:

   - :math:`\mathrm{Filter}(F(x)) = F(\mathrm{Filter}(x))`.


Definition — ***Profile***
--------------------------

Given a Filter, define the *Profile* of that Filter as

.. math::

   \mathrm{Profile}(\mathrm{Filter})
      := \{\, x \in R \mid \mathrm{Filter}(x) = x \,\}.

Elements of :math:`\mathrm{Profile}(\mathrm{Filter})` are called
*Filter-stable recognitions*.


Proposition — Profile as RelationalStructure
--------------------------------------------

The profile :math:`\mathrm{Profile}(\mathrm{Filter})`, with the
inherited operations

.. math::

   (\le, \wedge, \vee, \Rightarrow, \bot, \top),

forms a *Relational Structure*.

*Proof.* Since :math:`\mathrm{Filter}` is a Discipline, this follows
from the “Regime(D) Forms a RelationalStructure” proposition applied
to :math:`D := \mathrm{Filter}`. ∎
