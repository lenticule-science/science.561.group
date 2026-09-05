Preservation and Progress
=========================

.. meta::
   :xref-spec: math/infinite/language/index (Preservation and Progress)

This file isolates the standard Preservation and Progress results for
the ***Relational Language*** (*RelationalLanguage*) :math:`\lambda_R`.

Theorem — Preservation
----------------------

If :math:`\Gamma \vdash t : A` and :math:`t \to t'`, then
:math:`\Gamma \vdash t' : A`.

**Proof.** By induction on the typing derivation of ``t``; each
reduction case corresponds to the matching introduction/elimination
typing rule. ``ρ`` preserves typing by definition. ∎


Theorem — Progress
------------------

If :math:`\vdash t : A` in the empty context, then either :math:`t`
is in normal form or there exists :math:`t'` with :math:`t \to t'`.

**Proof.** By induction on typing and canonical forms for
:math:`\wedge, \vee, \Rightarrow, \bot, \top`. Closed values are
either :math:`\lambda`‑abstractions, pairs of values, injections of
values, :math:`\star`, or an elimination redex exists; :math:`\rho`
does not block progress. ∎
