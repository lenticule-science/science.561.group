Relational Morphisms and Substructures
======================================

Definition — ***Relational Morphism*** (*RelationalMorphism*)
-------------------------------------------------------------

Given *Relational Structures*
:math:`\mathrm{RStruct} = (R, \le, \wedge, \vee, \Rightarrow, \bot, \top, \dots)`
and
:math:`\mathrm{RStruct}' = (R', \le', \wedge', \vee', \Rightarrow', \bot', \top', \dots)`,
a ***Relational Morphism*** (*RelationalMorphism*) is a map
:math:`f : R \to R'` such that for all :math:`x, y \in R`:

- *Monotone*:
  :math:`x \le y \Rightarrow f(x) \le' f(y)`;
- *Bounds*:
  :math:`f(\bot) = \bot'` and :math:`f(\top) = \top'`;
- *Meets/Joins*:
  :math:`f(x \wedge y) = f(x) \wedge' f(y)` and
  :math:`f(x \vee y) = f(x) \vee' f(y)`;
- *Implication*:
  :math:`f(x \Rightarrow y) \le' (f(x) \Rightarrow' f(y))`.

Proposition — Identity and composition
--------------------------------------

Identity maps are *Relational Morphisms*. The composite of
*Relational Morphisms* is a *Relational Morphism*.

Definition — ***Substructure***
-------------------------------

A ***Substructure*** of a *Relational Structure* is a subset
:math:`S \subseteq R` that is closed under
:math:`\wedge, \vee, \Rightarrow` and contains
:math:`\bot, \top`, equipped with the inherited order. The inclusion
:math:`i : S \hookrightarrow R` is a RelationalMorphism.

The full development and proofs remain in the Structure notes; this file
provides an atomic anchor for the library morphism and finite
substructure helpers together with their tests.
