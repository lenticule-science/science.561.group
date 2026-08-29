Iteration and Eventual Equivalence
==================================

.. meta::
   :xref-spec: math/infinite/structure/index (Stabilization and ≡_S)

This file records the definitions and basic properties of Reflex-step
iteration and the eventual-equivalence relation :math:`x \equiv_S y`
from the Structure layer:

- iterates :math:`S^n(x)` under a monotone Reflex step :math:`S`;
- stabilisation depth and persistence :math:`\mathrm{Persist}_S(x)`;
  and
- eventual equivalence :math:`x \equiv_S y` when iterates of :math:`x`
  and :math:`y` eventually coincide.


Definition — ***Reflex Step Endomap***
-------------------------------------

Fix a *:doc:`Relational Structure <math/infinite/structure/relational_structure>`*
(:class:`relationing.core.structure.RelationalStructure`) ***R***.
A *Reflex step* is a designated endomap :math:`S : R \to R` that
models one reflexive articulation on recognitions. When stated,
results about :math:`S` will assume monotonicity
(:math:`x \leq y \Rightarrow S(x) \leq S(y)`).


Definition — ***Iterates of S***
--------------------------------

Define :math:`S^0(x) \coloneqq x` and
:math:`S^{n+1}(x) \coloneqq S(S^n(x))`.


Theorem — ***Iteration***
-------------------------

For any recognition :math:`x` and any :math:`n \in \mathbb{N}`,
the iterate :math:`S^n(x)` is a recognition
(:math:`S^n(x) \in R`).

**Proof.** By induction on :math:`n`. Base :math:`n = 0`:
:math:`S^0(x) = x \in R`. Step: if :math:`S^n(x) \in R`, then by the
Articulation Theorem, applying :math:`S` yields a recognition; hence
:math:`S^{n+1}(x) \in R`. ∎


Definition — ***Stabilisation Depth and Persistence***
------------------------------------------------------

A recognition :math:`x` *stabilises* (or *persists*) under :math:`S`
if there exists :math:`N \in \mathbb{N}` such that for all
:math:`n \geq N`, :math:`S^{n+1}(x) = S^n(x)`. Write
:math:`\mathrm{Persist}_S(x)` for this property. Any
:math:`y \coloneqq S^n(x)` with :math:`n \geq N` is then a fixed point
of :math:`S`.


Definition — ***Baseline Convergence (relative to :math:`\bot`)***
-----------------------------------------------------------------

Say :math:`x` *collapses (relative to :math:`\bot`)* under :math:`S`
if there exists :math:`N \in \mathbb{N}` such that for all
:math:`n \geq N`, :math:`S^n(x) = S^n(\bot)`.


Definition — ***Iterative Persistence, Baseline Limit, Eventual Equivalence***
-----------------------------------------------------------------------------

- *Iterative Persistence* (*Iterative Persistence*): the property
  :math:`\mathrm{Persist}_S(x)` holds.
- *Baseline Limit* (*Baseline Limit*): the eventual limit of the
  :math:`S`‑sequence when
  :math:`x` converges to the :math:`\bot`‑baseline; notation
  :math:`x \searrow` (defined only when baseline convergence holds).
  This limit is distinct from Heyting negation
  :math:`\neg x \coloneqq (x \Rightarrow \bot)`.
- *Eventual Equivalence* (*Eventual Equivalence*): :math:`x \equiv_S y`
  if there exists :math:`N` such that for all :math:`n \geq N`,
  :math:`S^n(x) = S^n(y)`.


Proposition — *Eventual Equivalence is an Equivalence Relation*
----------------------------------------------------------------

.. meta::
   :induced-by: math/infinite/structure/iteration_and_equivalence (Reflex Step Endomap), math/infinite/structure/iteration_and_equivalence (Iterative Persistence, Baseline Limit, Eventual Equivalence)

*Eventual Equivalence* is reflexive, symmetric, and transitive.

**Proof.** Reflexive: take :math:`N = 0`. Symmetric: equality is
symmetrical. Transitive: if :math:`S^n(x) = S^n(y)` for all
:math:`n \geq N` and :math:`S^n(y) = S^n(z)` for all :math:`n \geq M`,
then for all :math:`n \geq \max(N, M)`, :math:`S^n(x) = S^n(z)`. ∎
