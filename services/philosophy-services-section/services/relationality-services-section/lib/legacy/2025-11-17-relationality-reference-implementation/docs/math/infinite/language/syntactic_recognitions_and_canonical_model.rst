Syntactic Recognitions and Canonical Model
==========================================

Definition — ***Syntactic Entailment***
--------------------------------------

For types :math:`A, B` under context :math:`\Gamma` in
*:math:`\lambda_R`*, write :math:`A \leq_\Gamma B` when
:math:`\Gamma \vdash \lambda x\!:\!A.\, t : A \Rightarrow B` for some
term :math:`t` (or, equivalently, when :math:`\Gamma, x\!:\!A \vdash u : B`
for some :math:`u`). Write :math:`A \equiv_\Gamma B` when
:math:`A \leq_\Gamma B` and :math:`B \leq_\Gamma A`.


Definition — ***Syntactic Recognitions***
----------------------------------------

Let :math:`R_\Gamma` be equivalence classes :math:`[A]` under
:math:`\equiv_\Gamma`. Define
operations on classes by:

- :math:`[A] \wedge [B] \coloneqq [A \wedge B]`,
- :math:`[A] \vee [B] \coloneqq [A \vee B]`,
- :math:`[A] \Rightarrow [B] \coloneqq [A \Rightarrow B]`,
- :math:`\bot \coloneqq [\bot]`,
- :math:`\top \coloneqq [\top]`.

Define order :math:`[A] \leq [B]` iff :math:`A \leq_\Gamma B`.


Lemma — Well-Defined Operations
-------------------------------

The operations :math:`\wedge, \vee, \Rightarrow` on :math:`R_\Gamma`
are well-defined with respect to :math:`\equiv_\Gamma` and are
monotone in each argument.

**Proof.** By congruence of :math:`\lambda_R` typing under substitution
and the introduction/elimination rules; mutual derivability preserves
and is preserved by forming :math:`\wedge, \vee, \Rightarrow` types and
the corresponding terms. ∎


Theorem — Syntactic Structure
-----------------------------

The tuple :math:`(R_\Gamma, \leq, \wedge, \vee, \Rightarrow, \bot, \top)`
is a *Relational Structure* (*RelationalStructure*). The Residuation Law
Lemma holds for :math:`\Rightarrow` in :math:`R_\Gamma`; hence
:math:`R_\Gamma` is a Heyting algebra.

**Proof.** Use the Well-Defined Operations Lemma and interpret
:math:`\leq_\Gamma` as entailment in :math:`\lambda_R`. The
connectives :math:`\wedge` and :math:`\vee` satisfy the bounded
distributive lattice laws by the :math:`\lambda_R` rules. The
Residuation Law mirrors :math:`\Rightarrow`‑intro/elim. Reflex acts as
the identity on types (:math:`\rho` preserves types) and is monotone
on recognition types when interpreted by a monotone Reflex endomap. ∎
