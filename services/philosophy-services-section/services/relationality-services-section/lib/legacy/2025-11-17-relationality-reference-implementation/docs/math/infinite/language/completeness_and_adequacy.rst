Completeness and Adequacy
=========================

Definition — ***Semantic Entailment***
-------------------------------------

``Γ`` *entails* ``A``, written ``Γ ⊨ A``, when for every
``RelationalStructure`` ``RStruct`` and interpretation of ``Γ`` into
``R``, the denotation of ``Γ`` is ``≤`` the denotation of ``A``.


Theorem — Syntactic Completeness
--------------------------------

If ``Γ ⊨ A`` then ``Γ ⊢ t : A`` for some ``t`` in ``λ_R``.

**Proof.** Suppose not. Then ``A`` does not lie in the upward closure
of ``Γ`` in the preorder ``≤_Γ``. In the syntactic recognitions
structure ``R_Γ``, interpret each type by its class ``[·]``. By
construction, the denotation of ``Γ`` is not ``≤`` the denotation of
``A`` (since such an inequality would witness a derivation). This
contradicts ``Γ ⊨ A``. Hence ``Γ ⊢ A``. ∎


Corollary — Adequacy
--------------------

``λ_R`` is both sound (Soundness Theorem) and complete (Syntactic
Completeness Theorem) for ``RelationalStructure``\ s in the sense
defined here.

.. todo::

   :phase: plan

   Refine and extend the finite completeness witnesses so that the
   Adequacy corollary is exercised on clearly stated finite fragments
   with explicit finite spec entries under ``docs/math/finite`` and
   corresponding focused tests.
