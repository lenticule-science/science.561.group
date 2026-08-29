ProfileLanguage and Soundness
=============================

.. meta::
   :xref-spec: math/infinite/physics/index (ProfileLanguage)

Definition — ***Profile Language***
-----------------------------------

Let :math:`\mathrm{ProfileRStruct}(\mathrm{Filter})` be the
Profile-level *Relational Structure* induced by a Filter. The
***Profile Language*** :math:`\lambda_{\mathrm{Profile}}` is the
λ-like calculus obtained by interpreting the *Relational Language*
:math:`\lambda_R` in :math:`\mathrm{ProfileRStruct}(\mathrm{Filter})`:

- types denote Profile recognitions;
- contexts denote finite meets of these types; and
- terms denote monotone operations respecting inherited constructors.


Proposition — ProfileLanguage Soundness
---------------------------------------

If :math:`\Gamma \vdash t : A` in :math:`\lambda_{\mathrm{Profile}}`,
then in :math:`\mathrm{ProfileRStruct}(\mathrm{Filter})` we have
:math:`\llbracket \Gamma \rrbracket \le \llbracket A \rrbracket`, and
equalities are preserved.

**Proof.** This is an instance of the Soundness Theorem for
:math:`\lambda_R`, since
:math:`\mathrm{ProfileRStruct}(\mathrm{Filter})` is a *Relational
Structure*. ∎
