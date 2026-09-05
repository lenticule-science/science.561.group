Composite Filter
================

Definition — ***Composite Filter***
-----------------------------------

Let :math:`\mathrm{Filter}_1, \mathrm{Filter}_2 : R \to R` be Filters
on a *Relational Geometry* *Geom*. They *commute* when

.. math::

   \mathrm{Filter}_1(\mathrm{Filter}_2(x))
     = \mathrm{Filter}_2(\mathrm{Filter}_1(x))

for all :math:`x \in R`.

In this case define the *Composite Filter*

.. math::

   \mathrm{Filter}_{12}
      := \mathrm{Filter}_1 \circ \mathrm{Filter}_2
       = \mathrm{Filter}_2 \circ \mathrm{Filter}_1.

The same definition applies to any finite family
:math:`\{\mathrm{Filter}_i\}` that commute pairwise.
