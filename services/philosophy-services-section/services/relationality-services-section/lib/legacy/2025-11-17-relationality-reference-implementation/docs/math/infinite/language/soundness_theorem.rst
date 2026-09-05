Soundness Theorem
=================

Theorem — Soundness
-------------------

If :math:`\Gamma \vdash t : A` in :math:`\lambda_R`, then for every
Relational model of the Structure layer the denotation of
*:math:`\Gamma`* is below the denotation of *:math:`A`* and the
denotation of *:math:`t`* respects this ordering.

**Proof sketch.** Interpret types as recognitions in a Heyting
algebra carrier and terms as recognition-transforming maps satisfying
the typing rules. Show that each typing rule is sound with respect to
this interpretation and that reduction preserves denotation. The
Fundamental Theorem below gives the key inductive step. ∎

