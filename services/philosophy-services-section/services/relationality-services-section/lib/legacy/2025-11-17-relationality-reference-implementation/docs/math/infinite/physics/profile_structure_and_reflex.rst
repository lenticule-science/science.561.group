ProfileStructure and Reflex
===========================

Definition — ***Reflex Restriction on Profiles***
-------------------------------------------------

Assume :math:`R` carries the designated Reflex endomap
:math:`\rho : R \to R`. If :math:`\mathrm{Filter}` commutes with
:math:`\rho`, i.e.,

.. math::

   \mathrm{Filter}(\rho(x)) = \rho(\mathrm{Filter}(x))

for all :math:`x \in R`, define

.. math::

   \rho_{\mathrm{Profile}}(x) := \rho(x)

for :math:`x \in \mathrm{Profile}(\mathrm{Filter})`.


Lemma — Reflex Stability on Profiles
------------------------------------

If :math:`x \in \mathrm{Profile}(\mathrm{Filter})`, then
:math:`\rho(x) \in \mathrm{Profile}(\mathrm{Filter})`.

**Proof.** :math:`\mathrm{Filter}(x) = x` and
:math:`\mathrm{Filter}(\rho(x)) = \rho(\mathrm{Filter}(x)) = \rho(x)`,
hence :math:`\rho(x)` is Filter-stable. ∎


Corollary — ProfileStructure with Reflex
----------------------------------------

Under the hypotheses above, the tuple

.. math::

   \mathrm{ProfileRStruct}(\mathrm{Filter}) :=\\
   (\mathrm{Profile}(\mathrm{Filter}),
    \le, \wedge, \vee, \Rightarrow, \bot, \top, \rho_{\mathrm{Profile}})

is a *Relational Structure* with designated Reflex.
