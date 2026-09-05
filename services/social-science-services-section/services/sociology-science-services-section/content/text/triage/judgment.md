---
id: judgment
description: "A Judgment is a four-tuple (Z, I, f, α) — a conferred zone Z delimiting the officer's authorized action-space, an operative intent I = (E, ρ, T, R) specifying what purpose governs action within the zone, a situation f describing current conditions, and a chosen action α selected from Z ∩ R(f). The defining invariants: zone legitimacy (α ∈ Z, else excess of jurisdiction), intent-satisfaction (α ∈ R(f), else abuse of discretion), non-determinism (Z ∩ R(f) contains multiple candidates, else the act is calculation not judgment), and situation-responsiveness (α tracks f). Judgment is the act by which an officer bridges from intent and situation to specific action. Aristotle's phronesis is the philosophical ground: the capacity to identify the right particular act in the particular situation, irreducible to rule-following."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  zone: authority
  intent: relational-universe-morphism
  situation: relational-universe
  chosen-action: relational-universe-morphism
output: relational-history-fiber-fixed-layer
ast:
  discretionary-act:
    - intent:
        - situation
        - zone
    - chosen-action:
        - zone
        - intent
---

# Judgment

## Formal definition

A **Judgment** is a four-tuple $\mathcal{J} = (Z, \mathcal{I}, f, \alpha)$:

$$\mathcal{J} = (Z : \mathrm{Zone},\; \mathcal{I} : \mathrm{Intent},\; f : \mathrm{Situation},\; \alpha : \mathrm{Action})$$

where:
- $Z$ is the **conferred zone** — the subset of the action space that the officer's position, mandate, charter, and deontic profile jointly authorize; $Z$ is not chosen by the officer but is received from the officer's position $p$ in the normative system $N$; it is defined as the intersection of: the mandate scope (what the officer is competent to do), the deontic profile (what they are permitted to do), and the charter constraint (what serves the vessel's purpose); $Z$ is the space within which the officer is authorized to choose — acting outside $Z$ is not discretion but trespass; acting inside $Z$ is subject to the officer's judgment
- $\mathcal{I} = (E, \rho, T, R)$ is the **operative intent** — the reconstruction operator the officer is bound to serve; $\mathcal{I}$ is an [Intent](intent.md) issued by superior authority or constructed from the [Charter](./charter.md) when no specific superior intent has been transmitted; the critical component for judgment is the reconstruction function $R : \mathrm{Situation} \to \mathcal{P}(\mathrm{Action})$ — the function that takes the current situation and returns the set of actions the intent sanctions; $\mathcal{I}$ is what makes judgment more than mere zone-selection: two officers with the same $Z$ but different $\mathcal{I}$ should select differently in the same situation
- $f$ is the **situation** — the officer's current assessment of the state of affairs; $f$ is not a raw sense datum but a structured assessment: what is known, what is uncertain, what requires action; $f \in H_t$ is an element of the current fiber, describing the operational context as the officer understands it; $f$ is the officer's own; two officers at the same history may hold different situations if their epistemic access differs
- $\alpha$ is the **chosen action** — the officer's selection from $Z \cap R(f)$; $\alpha$ is the output of the judgment; $\alpha$ is not the unique output of a formula but a discriminated selection among multiple candidates that are all zone-legitimate and intent-sanctioned; the judgment is the act of discrimination

**Four invariants.** $\mathcal{J}$ is an instance of judgment iff:

1. **Zone legitimacy**: $\alpha \in Z$. The chosen action must be within the officer's conferred zone. An action outside $Z$ is not an exercise of discretion but an excess of jurisdiction — it is void or voidable, not merely erroneous. Excess of jurisdiction is the gravest judgment failure: the officer acts beyond their authority and the act has no legal or institutional force.

2. **Intent-satisfaction**: $\alpha \in R(f)$. The chosen action must be sanctioned by the reconstruction function applied to the current situation. An action that is within the zone but contrary to the intent is an abuse of discretion — it falls within the officer's authority but violates the purpose for which that authority was conferred. $R(f)$ is what connects the abstract authority $Z$ to the specific situation $f$; without it, $Z$ would license arbitrary action.

3. **Non-determination**: $|Z \cap R(f)| > 1$ in the general case. If $Z \cap R(f)$ contains only one element, the act is not judgment but calculation — the unique answer is determined by the rules, and the officer merely applies them. Judgment exists where $Z \cap R(f)$ contains multiple candidates and the officer must discriminate. This is the defining structure of discretion: the authority does not determine a unique output; the officer's selection within the zone is their own.

4. **Situation-responsiveness**: $\alpha$ is selected in light of $f$. If $\alpha$ would be the same regardless of $f$ — if the officer selects $\alpha$ without attending to the situation — the act fails as judgment. Judgment is responsive to the particular: a different $f$ (same $Z$, same $\mathcal{I}$) should in general produce a different $\alpha$. The situation is not merely the trigger for judgment; it is the material on which judgment operates.

## Judgment vs. Mandate: the discretion boundary

A [Mandate](./mandate.md) $\mathcal{M} = (A, \varphi, C)$ is the limiting case where $Z = \{\varphi\}$ — the zone contains only the prescribed act, which leaves no room for selection. When $|Z \cap R(f)| = 1 = \{varphi\}$, there is no judgment — only discharge of the mandated act. Mandamus lies against a mandate-holder who refuses; no analogous writ lies against a judgment-holder for choosing $\alpha_1$ over $\alpha_2$ within the zone.

The structural contrast:

| | Mandate | Judgment |
|---|---|---|
| **Zone** | $Z = \{\varphi\}$ — singleton | $Z$ — set with multiple elements |
| **Selection** | None — $\varphi$ is prescribed | Officer selects $\alpha \in Z \cap R(f)$ |
| **Failure mode** | Refusal when triggered | Excess of jurisdiction, abuse of discretion, paralysis |
| **Review** | Mandamus for refusal | Unreasonableness review for abuse; quashing for excess |
| **Accountability** | For non-performance | For manner of selection |

The mandate is the pole of complete rule-determination; the judgment is the pole of officer-selection within authority. Most institutional acts fall between: they have a zone that is not singleton but is not infinitely open — the framework narrows the space to $Z$, and within $Z$, the officer exercises judgment.

## The zone $Z$ in depth: three determining components

The zone $Z$ is not a simple given — it is the intersection of three determining structures:

**1. Mandate scope** (the floor): what the officer is competent to do under their mandate. An officer whose mandate covers maritime safety cannot exercise judgment about cargo manifests. Competence is the external constraint on $Z$: acts outside competence are outside the zone, regardless of purpose.

**2. Deontic profile** (the lattice): what the officer is permitted, required, and prohibited to do under their position's norms. The deontic profile is the Hohfeldian structure of the office: the constellation of duties, liberties, powers, and immunities that constitute the position. Judgment operates in the permission-space of the profile: the acts that are permitted but not required, where the officer is free to choose but not compelled to choose any specific option.

**3. Charter constraint** (the purpose-filter): what actions serve the charter's governing purpose. The charter does not determine $\alpha$ directly but it constrains $Z$ teleologically — acts that are formally within mandate and deontic profile but contrary to the charter's purpose are outside the effective zone. The charter is the normative background that gives the zone its purposive shape.

The zone is therefore: $Z = \mathrm{Scope}(\mathcal{M}) \cap \mathrm{Permitted}(\mathrm{DeonticProfile}(p)) \cap \mathrm{PurposeConsistent}(\mathrm{Charter})$.

## Phronesis: the philosophical ground

Aristotle's analysis of **phronesis** (practical wisdom) in the *Nicomachean Ethics* (Book VI) provides the deepest philosophical grounding for judgment as a formal structure.

Aristotle distinguishes three intellectual virtues bearing on action:
- **Episteme**: scientific knowledge of necessary and universal truths; demonstrable, teachable by proof; but cannot guide particular action because particulars are not universal
- **Techne**: craft knowledge of how to make things; follows rules and procedures; can be specified in advance; the craftsman applies the rule to the case
- **Phronesis**: practical wisdom about what to do in the particular situation; cannot be reduced to rule-following; concerns particulars that could be otherwise; requires experience, not just knowledge of the universal

The crucial Aristotelian point: **no rule suffices for the particular case**. A rule tells you what to do in cases the rule anticipates. But the particular situation is always this situation — singular, concrete, partly unanticipated. The practically wise person perceives the morally salient features of THIS situation and responds appropriately. This perception is not algorithmic; it is cultivated through experience and virtuous habituation.

Formally: phronesis is what the officer applies when $Z \cap R(f)$ contains multiple candidates and must be discriminated. The rules (the mandate, the deontic profile) determine $Z$; the intent's reconstruction function determines $R(f)$; but the selection within $Z \cap R(f)$ is the officer's practical wisdom — the perception of which candidate fits THIS situation best.

The phronimos (practically wise person) is thus the officer who:
- Knows the zone $Z$ (their authority)
- Understands the intent $\mathcal{I}$ (the purpose and end-state)
- Reads the situation $f$ accurately
- Selects the $\alpha \in Z \cap R(f)$ that serves the purpose best in this particular

Aristotle's warning: the person of phronesis cannot be replaced by a rule-book. A rule-book expands $Z$ without providing the discrimination within $Z \cap R(f)$. Giving an officer more rules does not substitute for practical wisdom — it may even impede it by pre-committing to responses that cannot anticipate the situation's particularity.

## Administrative law: the discretionary zone

Administrative law develops the zone structure with the greatest institutional precision. The core concepts:

**Ultra vires** (excess of jurisdiction): an administrative act beyond the authority conferred is void. $\alpha \notin Z$ — the agency has acted outside its statutory grant. Ultra vires acts have no legal force regardless of their merit; the agency lacks the power to do them.

**Wednesbury unreasonableness** (*Associated Provincial Picture Houses v. Wednesbury Corporation*, [1948] 1 KB 223): a discretionary act within the zone is nonetheless reviewable for unreasonableness. The standard: a decision "so unreasonable that no reasonable authority could ever have come to it." This is not the court substituting its judgment for the authority's — the court defers to the authority's judgment within $Z$. The Wednesbury test catches $\alpha \in Z$ but $\alpha \notin R(f)$ for any reasonable $R$ — abuse of the discretion, not excess.

**Chevron deference** (*Chevron U.S.A., Inc. v. Natural Resources Defense Council*, 467 U.S. 837 (1984)): when Congress has not spoken directly to the precise question, the agency's interpretation of its own statute is entitled to deference if reasonable. This is the institutional encoding of the zone principle: the agency's judgment within the ambiguous zone is authoritative; the court does not substitute its own interpretation.

**Proportionality** (EU/ECHR administrative law): an act within the zone is nonetheless reviewable for proportionality — whether the means chosen are proportionate to the legitimate aim. Proportionality is a finer-grained constraint than Wednesbury: it checks whether $\alpha$, though zone-legitimate, is disproportionate to $f$. This maps to intent-satisfaction ($\alpha \in R(f)$) with a proportionality metric.

The common thread: in administrative law, excess of jurisdiction renders the act void; abuse of discretion renders it voidable. The zone is the outer boundary; intent-satisfaction is the inner constraint on how the zone is used.

## Military doctrine: Auftragstaktik and initiative

**Auftragstaktik** (mission tactics), developed in the 19th-century Prussian army and adopted across modern militaries as "mission command," is the operational doctrine for judgment under friction.

The core principle: subordinate officers are given the intent (mission, end-state, purpose) rather than specific orders. When specific orders become inapplicable — due to [Friction](friction.md), unexpected developments, or communications failure — the subordinate must exercise judgment: select $\alpha \in Z \cap R(f)$ where $\mathcal{I}$ is the commander's intent and $f$ is the current situation.

The Prussian formulation (Moltke the Elder): "In war, circumstances change so rapidly that it is often impossible to issue orders in time for them to be obeyed. The subordinate must act on his own judgment within the spirit of the commander's intention." The "spirit of the commander's intention" is exactly $R(f)$: the reconstruction of what the commander would have ordered given the current situation.

**The failure to exercise judgment** is as grave as excess of jurisdiction in Auftragstaktik doctrine. An officer who waits for orders when the situation demands action — who refuses to select $\alpha$ when $Z \cap R(f) \neq \varnothing$ and action is required — fails the doctrine as completely as one who acts outside the zone. This is the **paralysis** failure mode:

$$Z \cap R(f) \neq \varnothing \quad \text{and} \quad \text{action required} \quad \text{and} \quad \alpha = \varnothing$$

Paralysis violates invariant 4 (situation-responsiveness): the officer has assessed $f$ but failed to select $\alpha$ responsive to it.

**Initiative** is the positive doctrine of non-paralysis: the officer actively monitors $f$ and selects $\alpha$ when $Z \cap R(f)$ is non-empty and $\mathcal{I}$ calls for action. Initiative is not license — it is $\alpha \in Z \cap R(f)$, not $\alpha \notin Z$. The officer who seizes an initiative outside the zone has not exercised judgment but exceeded authority.

## Judgment failure modes: a taxonomy

| Failure | Formal condition | Legal analog | Doctrine |
|---|---|---|---|
| **Excess of jurisdiction** | $\alpha \notin Z$ | Ultra vires, void | Zone trespass |
| **Abuse of discretion** | $\alpha \in Z$ but $\alpha \notin R(f)$ | Wednesbury unreasonableness, voidable | Purpose violation |
| **Paralysis** | $Z \cap R(f) \neq \varnothing$ but $\alpha = \varnothing$ | Failure to act, mandamus-analogous | Non-exercise of judgment |
| **Situation-blindness** | $\alpha$ selected without attending to $f$ | Arbitrariness | Non-responsive |
| **Rule-fetishism** | $\alpha$ determined solely by $Z$ without consulting $R(f)$ | Inflexibility | Intent-blind |

The last two are failures of phronesis even when zone-legitimate: an officer who acts within $Z$ but ignores the situation, or who mechanically applies $Z$ without consulting intent, has exercised authority but not judgment.

## Nuclear reading

We work in the fiber Heyting algebra $H_t$ at history $t$, with [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ and [transfer nucleus](../math/relational-history-fiber-transferring-nucleus.md) $\Delta_t$. Both are extensive, idempotent ([Idempotence](../math/relational-history-fiber-nucleus-idempotence.md)), meet-preserving ([Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md)), and commuting ([Commutation](../math/relational-history-fiber-nucleus-commutation.md)). The fixed fiber is $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$.

**Definition (Judgment proposition).** A judgment at history $t$ is a proposition $j \in H^*_t$ — an element of the doubly-stable fixed fiber. Being in $H^*_t$ has two components:
- $\sigma_t(j) = j$: the judgment is *recognized* — it is past-saturated; the accumulated record of sub-histories fully determines $j$'s status as settled law.
- $\Delta_t(j) = j$: the judgment is *operative* — it is present in the image of every forward restriction map $H(i_{s,t}) : H_{s \star t} \to H_t$ for all $s \perp t$; the judgment binds every future step from $t$.

**Definition (Void judgment).** A proposition $j \in \mathrm{Fix}(\sigma_t) \setminus \mathrm{Fix}(\Delta_t)$ is a *void judgment*: it has been recognized as a judgment (past-saturated) but is not operative in every forward extension — it was issued, but does not propagate to bind future histories. The void gap is $[j, \Delta_t(j)]$ in $H_t$, nonempty since $j \notin \mathrm{Fix}(\Delta_t)$.

**Proposition (Judgments are closed under finite meets).** If $j_1, j_2 \in H^*_t$, then $j_1 \wedge j_2 \in H^*_t$.

*Proof.* By [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md), $\sigma_t(j_1 \wedge j_2) = \sigma_t(j_1) \wedge \sigma_t(j_2) = j_1 \wedge j_2$, so $j_1 \wedge j_2 \in \mathrm{Fix}(\sigma_t)$. Likewise $\Delta_t(j_1 \wedge j_2) = \Delta_t(j_1) \wedge \Delta_t(j_2) = j_1 \wedge j_2$, so $j_1 \wedge j_2 \in \mathrm{Fix}(\Delta_t)$. Therefore $j_1 \wedge j_2 \in H^*_t$. $\square$

**Corollary (Conjunction of judgments is a judgment).** Any finite conjunction of legal effects that are doubly stable is itself doubly stable. A court issuing two valid judgments thereby issues their conjunction as a valid judgment.

**Zone, situation, and chosen action in the nuclear model.** The judgment tuple $\mathcal{J} = (Z, \mathcal{I}, f, \alpha)$ at $t$ has the following fiber interpretation:

- *Zone as sub-lattice*: $Z_t \subseteq H_t$ is a sublattice — closed under meets (by the proposition above if $Z_t \subseteq H^*_t$, or more generally as given by the officer's mandate) — containing exactly the propositions the officer's position authorizes.
- *Situation*: $f \in H_t$ is the officer's assessed state, an element of the current fiber.
- *Intent-sanctioned actions*: the subset $R_t(f) = \{\alpha \in Z_t : \sigma_t(f \wedge \alpha) = f \wedge \alpha\} \subseteq Z_t$ — the zone-elements whose conjunction with the situation is meaning-settled; acting on such $\alpha$ does not contradict the accumulated record.
- *Chosen action*: $\alpha \in Z_t \cap R_t(f)$, the judgment selection.

**Proposition (Excess of jurisdiction has no legal effect).** If $\alpha \notin Z_t$, then $\alpha \notin H^*_t$ as a valid judgment of the officer's role: the act falls outside the doubly-stable sub-algebra authorized by the officer's position.

*Proof.* $Z_t$ is the sub-lattice of propositions authorized by the officer's position. If $\alpha \notin Z_t$, then even if $\alpha \in \mathrm{Fix}(\sigma_t)$ (recognized as a fact), it is not recognized *as an exercise of this officer's authority* — the relevant fixed-fiber for the officer is $H^*_t \cap Z_t$, and $\alpha$ is outside it. $\square$

**Proposition (Abuse of discretion: zone-legitimate but not intent-settled).** If $\alpha \in Z_t$ but $\alpha \notin R_t(f)$ — that is, $\sigma_t(f \wedge \alpha) \neq f \wedge \alpha$ — then the conjunction of the situation and the chosen action is not meaning-settled: the choice is zone-legitimate but not consistent with the intent's fixed fiber.

*Proof.* By definition of $R_t(f)$, membership requires $\sigma_t(f \wedge \alpha) = f \wedge \alpha$. Failure of this condition means $\sigma_t(f \wedge \alpha) > f \wedge \alpha$ (by extensiveness), so $f \wedge \alpha \notin \mathrm{Fix}(\sigma_t)$: the conjunction of situation and action is not past-saturated and is therefore not settled law. $\square$

**Remark (Acts do not change $\sigma_t$).** The saturation nucleus $\sigma_t$ is determined by the history site topology and the restriction maps to sub-histories already in place at $t$. The officer's exercise of judgment at $t$ does not modify $\sigma_t$; it advances history to $t' = s_\alpha \star t$, where a new nucleus $\sigma_{t'}$ reflects the act. The distinction between being in $\mathrm{Fix}(\sigma_t)$ vs. $\mathrm{Fix}(\sigma_{t'})$ is the distinction between what was already settled law before the judgment and what the judgment settles as law going forward.

## Open questions

- Whether the zone $Z$ is always a sublattice of $H_t$ or whether some positions confer non-lattice-structured authority — and whether non-sublattice zones are coherent or always reducible to sublattice structure via appropriate normalization.
- Whether the selection within $Z \cap R(f)$ (the phronetic discrimination) can be given a formal nuclear criterion beyond "maximal in the Heyting order" — whether there is a canonical $\alpha^*$ that judgment should in general converge on, or whether the selection is genuinely non-deterministic and different reasonable selections are equally valid.
- Whether **paralysis** has a fiber analog — whether the condition "action required but $\alpha = \varnothing$" can be formally characterized as a condition on the fiber that makes the officer's non-action itself a kind of action (a selection of the null action $\bot$), and whether $\bot \in Z_t \cap R_t(f)$ is always false when action is operationally required.
- Whether the zone $Z$ changes dynamically during the course of an operation — whether a superior authority can narrow or widen $Z$ by issuing new mandates, and whether such changes are instantaneous (the zone shifts at the history step when the new mandate is issued) or whether the officer is entitled to act on their understanding of $Z$ at the time of the act.
- Whether **judgment under uncertainty** — where $f$ is imprecise or only partially assessed — requires a formal treatment distinguishing the situation the officer holds ($f^{\mathrm{held}}$) from the actual situation ($f^{\mathrm{true}}$), and whether excess of jurisdiction can arise from acting on $f^{\mathrm{held}}$ when $Z_{f^{\mathrm{held}}} \neq Z_{f^{\mathrm{true}}}$.

## Consolidated material from judgment-2026-03-20.md

---

title: "Judgment"
description: "A Judgment is a four-tuple (Z, I, f, α) — a conferred zone Z delimiting the officer's authorized action-space, an operative intent I = (E, ρ, T, R) specifying what purpose governs action within the zone, a situation f describing current conditions, and a chosen action α selected from Z ∩ R(f). The defining invariants: zone legitimacy (α ∈ Z, else excess of jurisdiction), intent-satisfaction (α ∈ R(f), else abuse of discretion), non-determinism (Z ∩ R(f) contains multiple candidates, else the act is calculation not judgment), and situation-responsiveness (α tracks f). Judgment is the act by which an officer bridges from intent and situation to specific action. Aristotle's phronesis is the philosophical ground: the capacity to identify the right particular act in the particular situation, irreducible to rule-following."
defines: Judgment
related: Intent, Friction, Mandate, Duty, Authority, Charter, HohfeldianPosition, NormativeSystem, Endeavor, Person, Office
date-created: 2026-03-20
---

where:
- $Z$ is the **conferred zone** — the subset of the action space that the officer's position, mandate, charter, and deontic profile jointly authorize; $Z$ is not chosen by the officer but is received from the officer's position $p$ in the normative system $N$; it is defined as the intersection of: the mandate scope (what the officer is competent to do), the deontic profile (what they are permitted to do), and the charter constraint (what serves the vessel's purpose); $Z$ is the space within which the officer is authorized to choose — acting outside $Z$ is not discretion but trespass; acting inside $Z$ is subject to the officer's judgment
- $\mathcal{I} = (E, \rho, T, R)$ is the **operative intent** — the reconstruction operator the officer is bound to serve; $\mathcal{I}$ is an [Intent](../../../../../../../science/theories/information/terms/intent.md) issued by superior authority or constructed from the [Charter](./charter.md) when no specific superior intent has been transmitted; the critical component for judgment is the reconstruction function $R : \mathrm{Situation} \to \mathcal{P}(\mathrm{Action})$ — the function that takes the current situation and returns the set of actions the intent sanctions; $\mathcal{I}$ is what makes judgment more than mere zone-selection: two officers with the same $Z$ but different $\mathcal{I}$ should select differently in the same situation
- $f$ is the **situation** — the officer's current assessment of the state of affairs; $f$ is not a raw sense datum but a structured assessment: what is known, what is uncertain, what requires action; $f \in H_t$ is an element of the current fiber, describing the operational context as the officer understands it; $f$ is the officer's own; two officers at the same history may hold different situations if their epistemic access differs
- $\alpha$ is the **chosen action** — the officer's selection from $Z \cap R(f)$; $\alpha$ is the output of the judgment; $\alpha$ is not the unique output of a formula but a discriminated selection among multiple candidates that are all zone-legitimate and intent-sanctioned; the judgment is the act of discrimination

A [Mandate](./mandate.md) $\mathcal{M} = (A, \varphi, C)$ is the limiting case where $Z = \{\varphi\}$ — the zone contains only the prescribed act, which leaves no room for selection. When $|Z \cap R(f)| = 1 = \{varphi\}$, there is no judgment — only discharge of the mandated act. Mandamus lies against a mandate-holder who refuses; no analogous writ lies against a judgment-holder for choosing $\alpha_1$ over $\alpha_2$ within the zone.

We work in the fiber Heyting algebra $H_t$ at history $t$, with [saturation nucleus](../../humanities/theories/math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ and [transfer nucleus](../../humanities/theories/math/relational-history-fiber-transferring-nucleus.md) $\Delta_t$. Both are extensive, idempotent ([Idempotence](../../humanities/theories/math/relational-history-fiber-nucleus-idempotence.md)), meet-preserving ([Meet Preservation](../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md)), and commuting ([Commutation](../../humanities/theories/math/relational-history-fiber-nucleus-commutation.md)). The fixed fiber is $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$.

*Proof.* By [Meet Preservation](../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md), $\sigma_t(j_1 \wedge j_2) = \sigma_t(j_1) \wedge \sigma_t(j_2) = j_1 \wedge j_2$, so $j_1 \wedge j_2 \in \mathrm{Fix}(\sigma_t)$. Likewise $\Delta_t(j_1 \wedge j_2) = \Delta_t(j_1) \wedge \Delta_t(j_2) = j_1 \wedge j_2$, so $j_1 \wedge j_2 \in \mathrm{Fix}(\Delta_t)$. Therefore $j_1 \wedge j_2 \in H^*_t$. $\square$
