---

title: "Norm"
description: "A Norm is a triple (φ, O, N) — a proposition φ expressing what agents in situation S should do or refrain from doing, a deontic modality O selecting among obligation, permission, and prohibition, and a normative system N within which the norm is operative and from which it derives its force. The defining structure: a norm is not a regularity (a pattern of behavior that happens to occur) but a prescription (a standard whose authority is independent of whether it is followed). Violated norms remain norms; violated regularities simply turn out not to be regularities."
date-created: 2026-03-20
---

## Formal definition

A **Norm** is a triple $\mathcal{N} = (\varphi, O, N)$:

$$\mathcal{N} = (\varphi : \mathrm{PropositionContent},\; O \in \{\mathrm{Obl}, \mathrm{Per}, \mathrm{Proh}\},\; N : \mathrm{NormativeSystem})$$

where:
- $\varphi$ is the **propositional content** — the act, state, or situation that the norm is about; $\varphi$ may be specific ("pay your taxes by April 15") or abstract ("honor your contracts"); complex norms have conditional structure: "if $\psi$ then $O(\varphi)$" — the norm applies when condition $\psi$ holds
- $O$ is the **deontic operator** — the modality that specifies the normative valence:
  - $\mathrm{Obl}(\varphi)$: it is **obligatory** to $\varphi$ — the agent must perform $\varphi$ or face normative deficiency
  - $\mathrm{Per}(\varphi)$: it is **permitted** to $\varphi$ — no norm in $N$ prohibits $\varphi$; the agent may $\varphi$ without violation
  - $\mathrm{Proh}(\varphi)$: it is **prohibited** to $\varphi$ — the agent must not perform $\varphi$; $\mathrm{Proh}(\varphi) \equiv \mathrm{Obl}(\neg\varphi)$
- $N$ is the **normative system** — the [NormativeSystem](./normative-system.md) or [Institution](./institution.md) within which the norm is operative; norms are not free-floating — they exist within some normative order that specifies their scope, their priority, and their enforcement; the same proposition $\varphi$ may be obligatory in $N_1$ and merely permitted in $N_2$

**Four invariants.** $\mathcal{N}$ is a norm iff:

1. **Independence from compliance**: a norm remains a norm even when violated. If drivers routinely run red lights, the norm "stop at red lights" remains operative — it is not falsified by violation, only violated. This is what distinguishes a norm from a regularity: regularities are descriptive (they hold when they are observed to hold); norms are prescriptive (they hold by their authority, not by their compliance rate).

2. **Authority-derived force**: the norm's prescriptive force derives from its authority source $N$ — whether statute, contract, custom, or professional standard. Remove $N$ and $\varphi$ is merely a suggestion or a prediction, not a norm. Authority is what makes the norm's force content-independent: "you must pay your taxes" does not depend on whether you agree that taxation is wise.

3. **Deontic consistency** (SDL Axiom D): $\mathrm{Obl}(\varphi) \Rightarrow \mathrm{Per}(\varphi)$ — obligation implies permission. A norm cannot simultaneously oblige and prohibit $\varphi$ within a consistent normative system. Genuine normative dilemmas (cases where both $\mathrm{Obl}(\varphi)$ and $\mathrm{Proh}(\varphi)$ appear to hold) are either inconsistencies in the normative system or apparent dilemmas that resolve under a priority rule.

4. **Normative force generates Hohfeldian relations**: an operative norm $\mathrm{Obl}(\varphi)$ in $N$ creates [Duty](./duty.md)-type Hohfeldian relations for the agents subject to $N$ — they acquire a duty to $\varphi$ with a correlative claim-right in the relevant counterparty. A norm is not a mere fact about the normative system; it actively constitutes the deontic profile of agents within it.

## The Kelsen structure: conditional norms

Hans Kelsen (*General Theory of Law and State*, 1945; *Pure Theory of Law*, 1960) identifies the canonical structure of a legal norm as:

$$\text{If } [F_1 \text{ (delict)}, \text{ then } O(\text{sanction } F_2)]$$

"If there is murder, then there ought to be punishment." The norm does not predict what will happen; it prescribes what ought to happen. The primary fact $F_1$ (the delict) is the condition; the normative consequence $F_2$ (the sanction) is what the norm prescribes.

Two further structural features:

**Validity**: a norm is **valid** (in force) iff it was created by an authorized authority through the appropriate procedure *and* is part of the hierarchy of norms tracing back to the Grundnorm. Validity is not truth — a norm is valid when it is in force, not when its content is correct. An unjust law is a valid norm if properly enacted; an admirable principle not enacted is not a valid norm in the legal sense.

**The Grundnorm**: Kelsen's solution to the regress of norm validity. Every norm derives its validity from a higher norm ("this statute is valid because it was enacted pursuant to the constitution"). The constitution is valid because... there must be a foundational presupposition. The Grundnorm is the presupposed foundation: "the historically first constitution ought to be obeyed." It is not itself a positive norm; it is a transcendental presupposition that makes the normative system's validity possible. Without the Grundnorm, the regress is infinite; with it, the system has a foundation — albeit a presupposed rather than enacted one.

**Derogation**: a norm in Kelsen is not retracted by a later inconsistent norm automatically — it must be **derogated** (explicitly repealed or overridden) or it remains valid alongside the inconsistent one, creating a normative conflict that requires resolution.

## Hart: primary and secondary rules

H.L.A. Hart (*The Concept of Law*, 1961) distinguishes two types of norms:

**Primary rules**: rules that impose duties or confer permissions directly on individuals. "Do not steal," "you must file a tax return," "you may speak in your own defense" — these directly regulate human behavior. A society with *only* primary rules is possible (a pre-legal society of custom) but deficient in three ways:
1. **Uncertainty**: no authoritative identification of which rules are the rules (no rule of recognition)
2. **Static quality**: no mechanism for deliberately changing rules
3. **Inefficiency**: no authoritative way to determine when a rule has been violated (no adjudication procedure)

**Secondary rules**: rules about rules — they confer powers to create, modify, or extinguish primary rules, or to determine questions of compliance. Secondary rules are the solution to the three deficiencies:
1. **Rule of recognition**: a secondary rule that identifies which primary rules are in force; the rule of recognition is not itself a primary rule but a practice among officials — a shared acceptance of a criterion of validity
2. **Rules of change**: secondary rules that authorize some person or body to introduce, modify, or repeal primary rules
3. **Rules of adjudication**: secondary rules that confer authority on individuals to determine whether a primary rule has been violated on a particular occasion

The union of primary and secondary rules is what Hart calls a **legal system**: not merely a set of norms, but a system with a rule of recognition (providing unity and identity), rules of change (providing dynamism), and rules of adjudication (providing effective enforcement.

Hart's insight about the rule of recognition: it is not itself a valid rule in the Kelsenian sense — it does not derive its validity from a higher rule. Instead, it is **accepted** as an ultimate criterion of validity by officials. This replaces Kelsen's presupposed Grundnorm with a social fact about official acceptance. Legal systems are distinguished not by what their norms prescribe but by their having a rule of recognition that officials accept and apply.

## Bicchieri: social norms and normative expectations

Cristina Bicchieri (*The Grammar of Society*, 2006) offers a game-theoretic account of social norm internalization. Her formulation: a norm is a **behavioral rule** $R$ in a population $P$ for situation $S$ such that:

1. Most members of $P$ know $R$ exists (**empirical expectation** condition)
2. Most members prefer to conform to $R$ if:
   a. They believe most others will conform (**empirical expectations** — descriptive, about what others will do), AND
   b. They believe most others think they *should* conform and might sanction non-conformance (**normative expectations** — prescriptive, about what others expect)

The critical distinction: a **social convention** (like driving on the right) requires only empirical expectations — you do it because others do it, and it works as long as most people coordinate. A **social norm** (like not cheating in tests) additionally requires normative expectations — you conform because you believe others think you *should* conform and would disapprove of violations.

A social norm is not merely a regularity plus its having been there a long time. It is a regularity sustained by *two kinds of expectations together*: descriptive (others will comply) and normative (others think I should comply). Bicchieri's diagnostic: if you manipulate the normative expectations without changing the empirical expectations (by telling people that others comply out of fear, not genuine endorsement), social norms collapse; conventions do not. This shows that the normative expectation is a real, independent component.

**Norm sensitivity**: agents vary in their sensitivity to normative expectations. Some agents are "norm followers" — they comply when normative expectations hold, regardless of empirical expectations. Some are "conditional cooperators" — they comply only when both expectations hold. Some are "free riders" — they defect when they think they can. The distribution of types in a population determines whether a social norm is stable (enough norm followers to sustain normative expectations even with some free riding) or fragile (a small shock in normative expectations collapses the norm).

## Lewis: conventions as coordination equilibria

David Lewis (*Convention*, 1969) gives the game-theoretic account of conventions — a restricted class of norms:

A **convention** in population $P$ for situation $S$ is a regularity $R$ such that:
1. Everyone in $P$ conforms to $R$ in $S$
2. Everyone in $P$ believes others will conform to $R$ in $S$
3. Everyone prefers to conform given others do (coordination payoff)
4. There is an alternative $R'$ that everyone would prefer if everyone conformed to $R'$ instead
5. This is common knowledge

A convention solves a coordination problem: there was no pre-existing reason to use $R$ rather than $R'$ (drive on the right vs. drive on the left), but once enough people use $R$, everyone prefers $R$ because others use $R$. The convention is self-reinforcing without being mandatory: no one has a duty to drive on the right (they do so because it is strategically rational given others' behavior), though the convention generates an expectation.

Lewis's framework is important for distinguishing **moral norms** (which bind regardless of others' compliance — you should not murder even if everyone else does) from **conventional norms** (which bind only given sufficient compliance — you drive on the right because others do). The distinction is not absolute: some legal norms are conventional (traffic rules); others are not (prohibitions on murder). The game-theoretic account captures the conventional-norm floor; the Kelsen/Hart accounts capture the validity-based analysis.

## Nuclear reading

**Definitions.** A norm $\mathcal{N} = (\varphi, O, N)$ at history $t$ is given by:

- $\mathrm{Obl}(\varphi)$ operative at $t$ iff $\varphi \in \mathrm{Fix}(\sigma_t)$: the saturation nucleus $\sigma_t$ has closed on $\varphi$ — the restriction profile of $\varphi$ to all sub-histories $t_0 < t$ has reached equilibrium ([Saturation Nucleus](../../humanities/theories/math/relational-history-fiber-saturating-nucleus.md): $\sigma_t(a) = \max\{b \in H_t \mid \rho_{t_0}(b) \leq \rho_{t_0}(a)\ \forall\, t_0 < t\}$).
- $\mathrm{Per}(\varphi)$ at $t$ iff $\neg\varphi \notin \mathrm{Fix}(\sigma_t)$.
- $\mathrm{Proh}(\varphi) \equiv \mathrm{Obl}(\neg\varphi)$ at $t$ iff $\neg\varphi \in \mathrm{Fix}(\sigma_t)$.
- $\varphi$ is **violated at $t$** iff $\varphi \in \mathrm{Fix}(\sigma_t)$ but $\varphi \notin \mathrm{Fix}(\Delta_t)$: the obligation is meaning-settled but not execution-settled — committed forward by the past but not yet present in every one-step extension.

---

**Proposition 1 (Obligation-conjunction):** If $\mathrm{Obl}(\varphi)$ and $\mathrm{Obl}(\psi)$ are both operative at $t$, then $\mathrm{Obl}(\varphi \wedge \psi)$ is operative at $t$.

*Proof.* $\varphi, \psi \in \mathrm{Fix}(\sigma_t)$ means $\sigma_t(\varphi) = \varphi$ and $\sigma_t(\psi) = \psi$. By [meet-preservation](../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md): $\sigma_t(\varphi \wedge \psi) = \sigma_t(\varphi) \wedge \sigma_t(\psi) = \varphi \wedge \psi$. So $\varphi \wedge \psi \in \mathrm{Fix}(\sigma_t)$. $\square$

This is the SDL axiom (C): $\mathrm{Obl}(\varphi) \wedge \mathrm{Obl}(\psi) \to \mathrm{Obl}(\varphi \wedge \psi)$ — derivable here from the meet-preservation of the saturation nucleus.

---

**Proposition 2 (Norm persistence at the moment of violation):** Let $\varphi \in \mathrm{Fix}(\sigma_t)$ (the norm is operative at $t$), and let $a \in H_t$ be an agent's action with $a \not\geq \varphi$ (non-compliance). Then $\sigma_t(\varphi) = \varphi$ — the saturation nucleus is unchanged.

*Proof.* By [definition](../../humanities/theories/math/relational-history-fiber-saturating-nucleus.md), $\sigma_t(\varphi)$ is determined entirely by the restriction maps $H(i_{t_0,t}) : H_t \to H_{t_0}$ for all $t_0 < t$. These maps are part of the presheaf structure over the history site $(T, J)$; they are not modified by any element $a \in H_t$. Since $a$ is an element of $H_t$ and not a modification of any restriction map, the restriction profile of $\varphi$ is unaffected: $\sigma_t(\varphi) = \varphi$ persists. $\square$

This is the mathematical content of "violated norms remain norms." The norm exists as a fixed point of the sheafification structure; a non-compliant act is an element that fails to reach $\varphi$, but this failure does not retroactively change the sheaf's restriction profile.

---

**Proposition 3 (Idempotence collapses the Kelsenian validity chain):** For any $n \geq 1$ and any $\varphi_0 \in H_t$: $\sigma_t^n(\varphi_0) = \sigma_t(\varphi_0)$.

*Proof.* By [idempotence](../../humanities/theories/math/relational-history-fiber-nucleus-idempotence.md): $\sigma_t(\sigma_t(\varphi_0)) = \sigma_t(\varphi_0)$. Inductively $\sigma_t^n = \sigma_t$ for all $n \geq 1$. $\square$

*Consequence.* The Kelsenian validity chain — statute validated by constitution validated by Grundnorm — cannot be represented as iterated application of $\sigma_t$ on a single fiber, because every iteration after the first is a no-op. The hierarchical derivation must instead be encoded in the VERTICAL structure of the site: the Grundnorm is not a repeated application of $\sigma_t$ but a proposition at a DIFFERENT HISTORY (a higher stratum in the tower), with restriction maps connecting strata. The chain $\varphi_{\mathrm{statute}} \leq \sigma_{t'}(\varphi_0) = \varphi_0$ (at a higher stratum $t'$) is the tower-level reading of norm derivation, not within-fiber iteration.

---

**Proposition 4 (Deontic consistency requires an additional axiom):** The nuclear axioms (extensiveness, idempotence, meet-preservation, commutation) do not prevent $\mathrm{Obl}(\varphi)$ and $\mathrm{Proh}(\varphi)$ from being simultaneously operative at $t$.

*Proof.* Suppose $\varphi, \neg\varphi \in \mathrm{Fix}(\sigma_t)$. By Proposition 1: $\varphi \wedge \neg\varphi = \bot_t \in \mathrm{Fix}(\sigma_t)$, meaning $\sigma_t(\bot_t) = \bot_t$. This is consistent with all nuclear axioms: extensiveness requires $\bot_t \leq \sigma_t(\bot_t)$, which holds with equality; idempotence and meet-preservation are satisfied trivially by $\bot_t$ being fixed. No nuclear axiom is violated. $\square$

An additional axiom is required: **a consistent normative system $N$ is one for which $\bot_t \notin \mathrm{Fix}(\sigma_t)$** — the bottom element is not meaning-settled as an obligation. This is a condition on the normative system $N$, not on the nucleus $\sigma_t$ in isolation. A fiber with $\bot_t \in \mathrm{Fix}(\sigma_t)$ is a degenerate (trivially obligating) normative system.

---

**Hart's secondary rules: topology, not fiber elements.** Primary norms are elements of $H_t$. Secondary rules do NOT operate by "adding or removing elements from $\mathrm{Fix}(\sigma_t)$" — this would be incoherent, since $\mathrm{Fix}(\sigma_t)$ is determined by the restriction maps of the presheaf, which are part of the sheaf structure, not something that legal authorization can modify. The correct reading:

- **Rule of recognition**: the Grothendieck topology $J$ on $T$ — the specification of which covering families count as valid. $J$ determines which compatible families of sections amalgamate to global sections in $\mathbf{Sh}(T, J)$, i.e., which local normative facts count as globally valid. Hart's "internal point of view" is the sheaf gluing condition: a normative fact is legally valid iff its local sections, wherever officials operate, cohere into a global section.
- **Rule of change**: a condition on which STEPS $s \in \Sigma$ are legally operative — which actions generate new histories by extending $t$ to $s \star t$. A legislative act is an authorized step that generates a new history $s_{\mathrm{leg}} \star t$, at which $\sigma_{s_{\mathrm{leg}} \star t}$ is freshly defined, and the new fiber $H_{s_{\mathrm{leg}} \star t}$ may contain new fixed points not present at $t$. Changing norms is changing histories, not changing fixed-point sets.
- **Rule of adjudication**: a covering sieve that makes a disputed norm's validity decidable — an authorized procedure (a judicial covering) that forces the compatibility condition in $J$ to resolve in a specific direction.

## Open questions

- Whether Kelsen's Grundnorm has a formal nuclear representation — whether there is an element $g \in H_t$ such that $\sigma_t(g) = g$ and every other obligation in $\mathrm{Fix}(\sigma_t)$ is derivable from $g$ by closure; and whether $g$'s status as Grundnorm is itself constituted by a [StatusFunctionDeclaration](./status-function-declaration.md) or presupposed without constitution.
- Whether Bicchieri's two-tier expectation condition (empirical + normative) corresponds to the two nuclei: empirical expectations tracking $\mathrm{Fix}(\Delta_t)$ (what has actually been done, executed, propagated) and normative expectations tracking $\mathrm{Fix}(\sigma_t)$ (what is meaning-settled as required). The social norm is stable when both nuclei fix the same elements; instability arises when $\mathrm{Fix}(\sigma_t) \neq \mathrm{Fix}(\Delta_t)$ — when what is normatively expected diverges from what is actually done.
- Whether Hart's rule of recognition is a global section of the sheaf of normative systems over the history site — a coherent specification of which norms are valid at every history that is compatible with how norms are recognized across contexts.
- Whether there is a formal category of norms — with norms as objects and "derivation" or "entailment" as morphisms — and whether the Grundnorm derivability condition corresponds to the norm of norms being an initial object in this category.
