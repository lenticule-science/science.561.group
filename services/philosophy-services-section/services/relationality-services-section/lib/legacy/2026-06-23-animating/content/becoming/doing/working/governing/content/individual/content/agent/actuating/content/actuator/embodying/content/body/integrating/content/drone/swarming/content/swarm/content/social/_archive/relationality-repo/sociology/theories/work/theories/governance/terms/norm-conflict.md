---

title: "Norm Conflict"
description: "A NormConflict is a triple (N₁, N₂, R) — two norms N₁ and N₂ whose simultaneous satisfaction is impossible at history t (their required outputs are incompatible in H_t), and a resolution rule R that determines which norm yields. The defining structure: N₁ requires a ∈ H*_t and N₂ requires b ∈ H*_t but a ∧ b = ⊥ (incompatible elements). Without R, the normative system is inconsistent at t — its nucleus demands the impossible. With R, the conflict is resolved by priority: one norm's output enters H*_t; the other is defeated."
defines: NormConflict
related: Norm, NormativeSystem, Duty, HohfeldianPosition, Breach, Sanction, Rule, Judgment, Authority
date-created: 2026-03-20
---

## Formal definition

A **NormConflict** is a triple $(N_1, N_2, R)$:

$$\mathcal{NC} = (N_1 : \mathrm{Norm},\; N_2 : \mathrm{Norm},\; R : \mathrm{NormPriority})$$

where: - $N_1 = (\varphi_1, O_1, \mathcal{N})$ and $N_2 = (\varphi_2, O_2, \mathcal{N})$ are [Norm](./norm.md)s within the same normative system $\mathcal{N}$ - The **conflict condition**: at history $t$, satisfying $N_1$ requires some element $a \in H^*_t$ and satisfying $N_2$ requires some $b \in H^*_t$, but $a \wedge b = \bot$ in $H_t$ — the two requirements are incompatible; no element in $H_t$ satisfies both simultaneously - $R$ is the **resolution rule** — the priority ordering or conflict-resolution operator that selects which norm's requirement enters $H^*_t$; without $R$, the conflict renders the normative system inconsistent at $t$

**Conflict condition formally.** Let $\sigma^{N_1}_t$ and $\sigma^{N_2}_t$ be the local saturation nuclei induced by $N_1$ and $N_2$ respectively on $H_t$.
The norms conflict at $t$ iff:

$$\mathrm{Fix}(\sigma^{N_1}_t) \cap \mathrm{Fix}(\sigma^{N_2}_t) = \{\bot\}$$

Their fixed-fiber intersection is trivial — no non-trivial element of $H_t$ satisfies both simultaneously.

## Conflict taxonomy

Four structurally distinct conflict types arise in normative systems:

**Type I — Direct conflict**: $O_1(\varphi)$ and $O_2(\neg \varphi)$ — obligation to do $\varphi$ and obligation not to do $\varphi$.
The most obvious case.
Nuclear form: $\sigma^{N_1}_t$ requires $a \in H^*_t$ and $\sigma^{N_2}_t$ requires $\neg a \in H^*_t$, but $a \wedge \neg a = \bot$ in the Heyting algebra.

**Type II — Contrary-to-duty** (Chisholm's Paradox): the conflict arises from nesting.
A primary norm $O(p)$ and a secondary norm $O(\neg p \Rightarrow q)$ where $q$ is incompatible with $p$'s consequence.
The paradox: if $p$ is obligatory but violated ($\neg p$ occurs), then $q$ becomes obligatory — but satisfying $q$ may be incompatible with satisfying $p$, creating a new conflict.
Nuclear form: the conditional norm $O(\neg p \Rightarrow q)$ is only active when $\neg p \in H_t \setminus H^*_t$; once $\neg p$ occurs, a new nucleus $\sigma^{N_2}_t$ activates and conflicts with $\sigma^{N_1}_t$.
Contrary-to-duty conflicts are the formal structure of remedial obligations after breach: "[Breach](./breach.md) of D creates a new duty D' to remedy, which may conflict with other standing duties."

**Type III — Dilemma** (moral dilemma, Antigone): both norms have equal weight by any priority ordering; the conflict is genuine and cannot be resolved without residue.
Neither norm can be defeated without normative cost.
Nuclear form: $R(N_1, N_2) = \frac{1}{2}$ — the resolution rule is undefined or yields a tie.
The formal system cannot resolve this; it must be escalated to an authority with power to establish a new priority or grant an exception.

**Type IV — Temporal conflict**: $N_1$ applies at $t_1$ and $N_2$ applies at $t_2$ where $t_1$ and $t_2$ are the same history but the norms were issued at different times.
Lex posterior resolves: the later norm supersedes the earlier.
Nuclear form: the later nucleus $\sigma^{N_2}_{t_2}$ has precedence over $\sigma^{N_1}_{t_1}$ for the overlapping sub-fiber.

## Resolution rules

Five canonical resolution operators:

**Lex superior** (hierarchy of authority): $N_1 \succ N_2$ iff $N_1$ is issued by an authority higher in the hierarchy than $N_2$'s issuer.
The higher norm's fixed-fiber requirement wins.
Nuclear form: $\sigma^{N_1}_t$ has priority; the conflict is resolved by $\mathrm{Fix}(\sigma^{N_1}_t) \cap H_t$ over $\mathrm{Fix}(\sigma^{N_2}_t) \cap H_t$.

**Lex posterior** (temporal priority): $N_1 \succ N_2$ iff $N_1$ was issued later than $N_2$.
Later norms override earlier on the same subject matter.
Nuclear form: the nucleus activated by the later issuance supersedes the earlier.

**Lex specialis** (specificity): $N_1 \succ N_2$ iff $N_1$ applies to a narrower class of situations than $N_2$.
More specific norms override more general ones for the specific situation.
Nuclear form: the sub-fiber over which $N_1$ operates is smaller than $N_2$'s; within that sub-fiber, $N_1$'s nucleus applies.

**Lex mitior** (lenity): in penal contexts, the less burdensome norm prevails.
The norm creating fewer obligations or lighter sanctions is preferred where the conflict is unresolved by other rules.
Nuclear form: the nucleus with the smaller gap-demand wins.

**Explicit priority declaration**: a meta-norm $N_3$ in the normative system explicitly ranks $N_1$ over $N_2$ for conflict situations of type $\mathcal{T}$.
Nuclear form: $N_3$ introduces an ordering on the nuclei $\sigma^{N_1}_t \succ \sigma^{N_2}_t$ for elements in $\mathcal{T}$'s sub-fiber.

## Residue: the defeated norm is not erased

When $R$ resolves a conflict in favor of $N_1$ over $N_2$, $N_2$ is **defeated** — its requirement does not enter $H^*_t$ at the current conflict point.
But $N_2$ is not erased: it remains in the normative system and continues to apply in situations where it does not conflict with $N_1$.
The defeat is local; the norm persists globally.

The formal content: the nuclei $\sigma^{N_1}_t$ and $\sigma^{N_2}_t$ both exist; the resolution rule introduces a priority ordering such that $\sigma^{N_1}_t$ is applied first (or exclusively) in the conflict zone, but $\sigma^{N_2}_t$ continues to operate in its non-conflict sub-fiber.

This is the formal basis of the "moral residue" in dilemmatic situations: even when $N_2$ is defeated, the agent bears a residue obligation — a duty to acknowledge the loss, compensate, or take corrective action — because the defeated norm's demands do not vanish, they are merely overridden.

## Norm conflict in judgment

[Judgment](./judgment.md) is where norm conflicts are resolved in practice.
The officer at $(Z, I, f, \alpha)$ encounters a conflict when two or more norms within $Z$ generate incompatible requirements on $\alpha$.
The officer's phronesis includes the ability to: 1.
Identify the conflict type 2.
Apply the appropriate resolution rule $R$ 3.
Select the action $\alpha$ that satisfies the prioritized norm 4.
Acknowledge the residue of the defeated norm (if any)

An officer who resolves a norm conflict incorrectly — selecting the action required by the lower-priority norm — commits an error of judgment without necessarily violating any norm in isolation.
The conflict resolution is the distinctively *judgment* act; each individual norm is perfectly consistent.

## Nuclear reading

We work in the fiber Heyting algebra $H_t$ at a fixed history $t \in T$, with [saturation nucleus](../../../humanities/theories/math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ and [transfer nucleus](../../../humanities/theories/math/relational-history-fiber-transferring-nucleus.md) $\Delta_t$.
Both are extensive, idempotent ([Idempotence](../../../humanities/theories/math/relational-history-fiber-nucleus-idempotence.md)), meet-preserving ([Meet Preservation](../../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md)), and commuting ([Commutation](../../../humanities/theories/math/relational-history-fiber-nucleus-commutation.md)).

**Definition (Norm-induced nucleus).** A norm $N$ with required output $a_N \in H_t$ induces a nucleus $\sigma^N_t$ on $H_t$ whose fixed fiber is the principal up-set: $$\mathrm{Fix}(\sigma^N_t) = {\uparrow}a_N = \{b \in H_t : a_N \leq b\}$$ The operator $\sigma^N_t$ is extensive ($b \leq \sigma^N_t(b)$ for all $b \in H_t$, since $\sigma^N_t(b) = b \vee a_N \geq b$), idempotent ($\sigma^N_t(\sigma^N_t(b)) = \sigma^N_t(b \vee a_N) = b \vee a_N \vee a_N = b \vee a_N = \sigma^N_t(b)$), and meet-preserving ($\sigma^N_t(b_1 \wedge b_2) = (b_1 \wedge b_2) \vee a_N = (b_1 \vee a_N) \wedge (b_2 \vee a_N) = \sigma^N_t(b_1) \wedge \sigma^N_t(b_2)$, by distributivity of the Heyting algebra).
Thus $\sigma^N_t$ is a nucleus in the sense of [Meet Preservation](../../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md).

**Proposition (Norm conflict = mutual incompatibility of requirements).** Let $N_1$ require $a_1$ and $N_2$ require $a_2$.
The intersection of their fixed fibers is: $$\mathrm{Fix}(\sigma^{N_1}_t) \cap \mathrm{Fix}(\sigma^{N_2}_t) = {\uparrow}a_1 \cap {\uparrow}a_2 = {\uparrow}(a_1 \vee a_2)$$ This intersection contains only $\top_t$ iff $a_1 \vee a_2 = \top_t$.

*Proof.* An element $b$ lies in both ${\uparrow}a_1$ and ${\uparrow}a_2$ iff $a_1 \leq b$ and $a_2 \leq b$, iff $a_1 \vee a_2 \leq b$.
So ${\uparrow}a_1 \cap {\uparrow}a_2 = {\uparrow}(a_1 \vee a_2)$.
This equals $\{\top_t\}$ iff $a_1 \vee a_2 = \top_t$. $\square$

**Definition (Norm conflict at $t$).** Norms $N_1$ and $N_2$ *conflict at $t$* iff $a_1 \vee a_2 = \top_t$ in $H_t$ — equivalently, iff $\mathrm{Fix}(\sigma^{N_1}_t) \cap \mathrm{Fix}(\sigma^{N_2}_t) = \{\top_t\}$, so that the only element satisfying both norms simultaneously is $\top_t$: the normative system demands the impossible from any duty-bearer.

**Proposition (Direct conflict implies degenerate combined system).** Suppose $N_1 = O(\varphi)$ and $N_2 = O(\neg\varphi)$ — obligation to do $\varphi$ and obligation not to do $\varphi$ — with corresponding requirements $a_1 = \varphi$ and $a_2 = \neg\varphi$ where $\neg$ is the Heyting negation in $H_t$.
Then the saturation nucleus $\sigma^{N_1}_t$ requires $\varphi \in \mathrm{Fix}(\sigma^{N_1}_t)$ and $\sigma^{N_2}_t$ requires $\neg\varphi \in \mathrm{Fix}(\sigma^{N_2}_t)$.
The meet-preservation of the system's combined closure gives:

$$\sigma^{N_1}_t(\varphi \wedge \neg\varphi) = \sigma^{N_1}_t(\bot_t) = \bot_t \vee \varphi = \varphi \neq \bot_t$$

so applying $\sigma^{N_1}_t$ to $\bot_t$ yields $\varphi$, and by the same reasoning $\sigma^{N_2}_t(\bot_t) = \neg\varphi$.
The combined system $\sigma^{N_1}_t \circ \sigma^{N_2}_t$ applied to $\bot_t$ gives $\sigma^{N_1}_t(\neg\varphi)$.
In a Heyting algebra where $\varphi \wedge \neg\varphi = \bot_t$, the element $\neg\varphi$ satisfies $\varphi \leq \sigma^{N_1}_t(\neg\varphi) = \neg\varphi \vee \varphi$, which is not $\bot_t$ unless $\varphi = \bot_t$.
The normative system has no non-trivial joint fixed point: it cannot settle any element below $\top_t$ as simultaneously satisfying both norms.

*Proof.* Immediate from the Proposition above: $a_1 \vee a_2 = \varphi \vee \neg\varphi$.
In a Boolean algebra this equals $\top_t$.
In a general Heyting algebra, $\varphi \vee \neg\varphi \leq \top_t$ with equality not guaranteed; if the system is classical (Boolean) at $t$, then $\varphi \vee \neg\varphi = \top_t$ and the conflict is total. $\square$

**Remark (Consistency condition for normative systems).** A *consistent* normative system at $t$ must have $a_N < \top_t$ for every norm $N$ in force — each norm requires something strictly below $\top_t$.
Moreover the system is *jointly consistent* iff $\bigvee_N a_N < \top_t$ — the join of all requirements is not the top element, so there exist non-trivial elements satisfying all norms simultaneously.

**Proposition (Resolution rule restricts the nucleus to the conflict zone).** Given a conflict between $N_1$ and $N_2$ at $t$, with resolution rule $R$ prioritizing $N_1$: define the conflict sub-fiber $H^{\mathrm{conf}}_t = \{b \in H_t : b \leq a_1 \vee a_2\}$.
The resolved effective nucleus on $H^{\mathrm{conf}}_t$ is $\sigma^{N_1}_t|_{H^{\mathrm{conf}}_t}$, with: $$\mathrm{Fix}(\sigma^{N_1}_t|_{H^{\mathrm{conf}}_t}) = {\uparrow}a_1 \cap H^{\mathrm{conf}}_t$$ $a_1$ enters the fixed fiber on the conflict zone; $a_2$ does not.
Outside $H^{\mathrm{conf}}_t$, $\sigma^{N_2}_t$ continues to operate unchanged — the defeated norm is not erased from the wider fiber.

*Proof.* On $H^{\mathrm{conf}}_t$, $R$ instructs that $\sigma^{N_1}_t$ applies in place of $\sigma^{N_2}_t$.
Then $\mathrm{Fix}(\sigma^{N_1}_t|_{H^{\mathrm{conf}}_t}) = \{b \in H^{\mathrm{conf}}_t : a_1 \leq b\} = {\uparrow}a_1 \cap H^{\mathrm{conf}}_t$.
For $b$ outside $H^{\mathrm{conf}}_t$ (i.e., $b > a_1 \vee a_2$), neither norm is in conflict and $\sigma^{N_2}_t$ applies without restriction from $R$. $\square$

**Contrary-to-duty — conditional nucleus.** Primary norm $N_1 = O(p)$ has $\mathrm{Fix}(\sigma^{N_1}_t) = {\uparrow}p$.
Secondary norm $N_2 = O(\neg p \Rightarrow q)$ has a conditional nucleus on $H_t$: $$\sigma^{N_2}_t(b) = \begin{cases} b \vee q & \text{if } \neg p \leq b \\ b & \text{otherwise} \end{cases}$$ Before breach ($\neg p \notin H_t$ below $b$): $\sigma^{N_2}_t$ is the identity on elements not above $\neg p$ — it contributes nothing.
After breach ($\neg p$ enters $H_t$ at some successor history $t'$, so $\neg p \leq b$ for relevant $b$): $\sigma^{N_2}_t$ activates and requires $q$.
The conflict between $N_1$ and $N_2$ is not present at $t$ before breach; it arises at $t'$ only if $p \wedge q = \bot_t$.
This resolves the Chisholm paradox: the conflict is conditional on breach entering the history.

**Open question (transferred to open questions section).** Whether the degenerate case $\bot_t \in \mathrm{Fix}(\sigma^N_t)$ for some norm $N$ (i.e., $a_N = \bot_t$) implies that all elements of $H_t$ are in $\mathrm{Fix}(\sigma^N_t) = {\uparrow}\bot_t = H_t$ is immediate: ${\uparrow}\bot_t = H_t$ since $\bot_t \leq b$ for all $b$.
This is the degenerate case where a norm requires nothing (its required output is $\bot_t$), making every element of $H_t$ a fixed point of $\sigma^N_t$ — a vacuously satisfied norm.
A degenerate normative system in the stronger sense — one where the *consistent* normative reading of $\bot_t$ as "the bottom obligation" means something pathological — requires further analysis of what it means for $\bot_t$ to be normatively required rather than vacuously satisfied.
This is an open question.

## Open questions

- Whether the fixed-fiber intersection $\mathrm{Fix}(\sigma^{N_1}_t) \cap \mathrm{Fix}(\sigma^{N_2}_t) = \{\bot\}$ fully captures all types of norm conflict, or whether there are conflicts where both fixed-fibers are non-trivially inhabited but their *joint* satisfaction is behaviorally impossible for a finite agent (the resources-and-time conflict, not captured by the Heyting algebra alone).
- Whether there is a complete set of resolution rules — whether every norm conflict within a well-designed normative system can be resolved by some combination of lex superior, posterior, specialis, and explicit priority — or whether genuine dilemmas (Type III) are unavoidable in any sufficiently expressive normative system.
- Whether the contrary-to-duty conflict (Type II) can be dissolved by a more careful formulation of the Zeno-settling structure: whether the conditional obligation $O(\neg p \Rightarrow q)$ should be modeled as a nucleus that only activates at histories where $\neg p \in H_t$, making the conflict truly conditional rather than a standing tension.
