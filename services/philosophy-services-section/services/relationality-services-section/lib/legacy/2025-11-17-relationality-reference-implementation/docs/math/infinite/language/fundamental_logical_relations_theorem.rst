Fundamental Theorem of Logical Relations
========================================

Theorem — Fundamental Theorem of Logical Relations
--------------------------------------------------

If :math:`\Gamma \vdash t : A` and :math:`E` is a reducible
environment for :math:`\Gamma`, then :math:`t[E] \in \llbracket A \rrbracket`.

**Proof.** This is precisely the Substitution Lemma for Reducibility
stated above. ∎

For closed :math:`\vdash t : A`, take the empty environment; by the
Fundamental Theorem, :math:`t \in \llbracket A \rrbracket`, hence
:math:`\mathrm{SN}(t)`. Together with Progress this yields
Normalization for well-typed closed terms.

