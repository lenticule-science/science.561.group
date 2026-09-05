Substitution Lemma for Reducibility
===================================

Lemma — Substitution Lemma for Reducibility
-------------------------------------------

If :math:`\Gamma \vdash t : A` and :math:`E` is a reducible
environment for :math:`\Gamma`, then :math:`t[E] \in \llbracket A \rrbracket`.

**Proof.** By induction on the typing derivation of :math:`t` using
the definitions of the reducibility candidates :math:`\llbracket A \rrbracket`.
Representative cases:

- Variables: :math:`x` reduces to :math:`E(x)` which lies in
  :math:`\llbracket A \rrbracket` by hypothesis on environments.
- Conjunction, disjunction, implication: use the closure conditions in
  the candidate definitions and the induction hypothesis for subterms.
- :math:`\bot`‑elim and :math:`\top`‑intro: immediate from definitions
  and :math:`\mathrm{SN}` closure.
- :math:`\rho`: if :math:`\Gamma \vdash t : A` then by IH
  :math:`t[E] \in \llbracket A \rrbracket`, and by :math:`\rho`‑closure
  :math:`\rho(t[E]) \in \llbracket A \rrbracket`. ∎

