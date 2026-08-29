---

title: "Constitution"
description: "A Constitution is a triple (X, Y, C) — a raw entity or event X, an institutional status Y, and a context C — governed by the constitutive rule 'X counts as Y in C': the application of the rule transforms X into Y within C without consuming X. The defining structure: constitution creates without copying — the same X that is a physical object also IS the institutional fact Y, in C. No new thing is created; a new description-level is activated. Constitution is the relation underlying every institution, office, and status function."
defines: Constitution
related: StatusFunctionDeclaration, Institution, Office, Act, Investiture, NormativeSystem, Grounding, HohfeldianPosition, Recognition
date-created: 2026-03-20
---

## Formal definition

A **Constitution** is a triple $(X, Y, C)$:

$$(X : \mathrm{Entity},\; Y : \mathrm{InstitutionalStatus},\; C : \mathrm{Context})$$

governed by the **constitutive rule** $R_{XYC}$:

$$R_{XYC} : X \times C \to Y \qquad x \in X,\; c \in C \;\Rightarrow\; R_{XYC}(x, c) = y \in Y$$

where: - $X$ is the **raw entity** — the physical, biological, or prior-institutional entity that serves as the substrate; $X$ exists independently of context $C$; pieces of paper exist whether or not they are money, sounds exist whether or not they are words - $Y$ is the **institutional status** — the new level of description $X$ acquires within $C$; $Y$ is not a new object — it is a new way of counting $X$; the status carries [Hohfeldian](theories/hohfeldian/terms/hohfeldian-position.md) deontic powers, duties, privileges, and immunities - $C$ is the **context** — the institutional setting within which the rule applies; outside $C$, $X$ may not count as $Y$ (a king's crown is a hat outside the kingdom's institutional frame)

**Application.** The constitutive rule $R_{XYC}$ applies to $x \in X$ within context $c \in C$ and produces $y = R_{XYC}(x, c) \in Y$.
The rule is *non-consumptive*: $x$ continues to exist as the physical entity it was; $y$ is the institutional fact that $x$ is now ALSO.
Both descriptions are simultaneously valid — constitution is not replacement.

**Searle's formulation** (The Construction of Social Reality, 1995): "X counts as Y in context C."
The formula is exact: "counts as" is not "becomes" or "produces" — it is the introduction of a new institutional level of description onto the same entity.
Sounds count as words.
Pieces of metal count as legal tender.
A human counts as a king.
A pattern of moves counts as checkmate.

## What this is

**Constitution** is the relation that makes institutional reality possible.
Without constitutive rules, there are only physical facts.
With them, a physical substrate acquires institutional status — and institutional status carries deontic force that the physical substrate does not.

The difference between **constitution** and **causation**: causation produces a new entity (striking a match causes a flame — new entity); constitution introduces a new description level of the same entity (placing certain shapes on paper constitutes a valid contract — same entities, new description level active).

The difference between **constitution** and **regulation**: regulation applies to pre-existing statuses (rules governing how cars must behave).
Constitution creates the statuses in the first place (rules that constitute what counts as a car for traffic law purposes).

The difference between **constitution** and **grounding**: [Grounding](grounding.md) ($A$ grounds $B$) is a relation between propositions — $B \leq \sigma_t(A)$.
Constitution ($X$ counts as $Y$ in $C$) is a relation between entity-descriptions across levels — the physical fact grounds the institutional fact, but constitution is what makes the grounding relation apply in this direction rather than another.

## Nuclear reading

The fiber Heyting algebra $H_t$ at history $t$ contains propositions about what holds at $t$.
Among these are propositions of the form "$x$ counts as $Y$ in context $c$ at $t$" — the output of a constitutive rule application.
We write $y_{xc} \in H_t$ for the proposition "$R_{XYC}(x, c)$ holds at $t$."

**Definition (constitutional validity).** A proposition $y_{xc} \in H_t$ is **constitutionally valid** at $t$ iff $y_{xc} \in \mathrm{Fix}(\sigma_t)$: the proposition is a fixed point of the saturation nucleus, meaning it is already past-saturated — it carries the same restriction profile to all sub-histories as itself, and no further saturation can enlarge it.
Constitutional validity is not a claim about agents' actions; it is the condition $\sigma_t(y_{xc}) = y_{xc}$, which is determined entirely by the restriction maps of the fiber bundle.

This is a definition, not a theorem.
Calling $y_{xc}$ "constitutionally valid" is a name for the condition $y_{xc} \in \mathrm{Fix}(\sigma_t)$; it does not add content.

**Proposition 1 (closure of Fix(σ_t) under finite meets).** If $\varphi, \psi \in \mathrm{Fix}(\sigma_t)$, then $\varphi \wedge \psi \in \mathrm{Fix}(\sigma_t)$.

*Proof.* The saturation nucleus $\sigma_t$ preserves finite meets: $\sigma_t(\varphi \wedge \psi) = \sigma_t(\varphi) \wedge \sigma_t(\psi)$ (see [Meet Preservation](../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md)).
Since $\varphi \in \mathrm{Fix}(\sigma_t)$ we have $\sigma_t(\varphi) = \varphi$, and since $\psi \in \mathrm{Fix}(\sigma_t)$ we have $\sigma_t(\psi) = \psi$.
Therefore $\sigma_t(\varphi \wedge \psi) = \varphi \wedge \psi$, so $\varphi \wedge \psi \in \mathrm{Fix}(\sigma_t)$. $\square$

**Corollary (conjunction of constitutional provisions).** If two institutional-status propositions $y_{x_1 c}$ and $y_{x_2 c}$ are both constitutionally valid at $t$, their conjunction $y_{x_1 c} \wedge y_{x_2 c}$ is also constitutionally valid at $t$.
The set of constitutionally valid propositions is closed under conjunction.
This is the formal basis of the intuition that a constitution is internally consistent: you cannot have two provisions, each individually valid, whose conjunction is not.

**Proposition 2 (idempotence: constitutional validity is not iterated).** For any $\varphi \in H_t$, $\sigma_t(\sigma_t(\varphi)) = \sigma_t(\varphi)$.

*Proof.* This is idempotence of $\sigma_t$ (see [Idempotence](../../humanities/theories/math/relational-history-fiber-nucleus-idempotence.md)). $\square$

This means: applying the saturation nucleus twice is the same as applying it once.
There is no "more saturated" beyond the first application.
Accordingly, a constitutive rule applied to an already-constitutionally-valid input does not produce a strictly more settled output — $\sigma_t(y_{xc}) = y_{xc}$ and $\sigma_t(\sigma_t(y_{xc})) = y_{xc}$ are the same condition.

**What is not derivable from the nuclear axioms alone.** The claim that a specific physical entity $x$ counts as institutional status $Y$ in context $C$ — i.e., that $y_{xc} \in H_t$ (that such a proposition exists in the fiber at all) — is not a consequence of the nuclear axioms.
The nuclear axioms govern the closure structure of $H_t$ once propositions are present; they do not determine which constitutive rules are in force or what institutional contexts obtain.
The existence of $y_{xc}$ in $H_t$ requires an additional specification of the constitutive rule $R_{XYC}$ as part of the system's normative structure.
This is not derivable from $\sigma_t$, $\Delta_t$, or their axioms.

**Remark (constitution and the transfer nucleus).** A proposition $y_{xc} \in H_t$ is in $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ iff it is both past-saturated (constitutionally valid by the above definition) and transfer-stable (already witnessed by every independent forward step from $t$).
Transfer-stability says: for every step $s \perp t$, there exists a proposition in $H_{s \star t}$ restricting to $y_{xc}$ under $H(i_{s,t})$ (see [Transfer Nucleus](../../humanities/theories/math/relational-history-fiber-transferring-nucleus.md)).
The commutation of $\sigma_t$ and $\Delta_t$ (see [Commutation](../../humanities/theories/math/relational-history-fiber-nucleus-commutation.md)) means that the two fixed-point conditions are compatible: $\mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is the correct joint notion of full settlement.

## Constitution and the status function declaration

A [StatusFunctionDeclaration](./status-function-declaration.md) is the *act* of applying a constitutive rule at a specific moment: "I hereby declare $x$ to count as $Y$ in context $C$."
The declaration is successful when the rule $R_{XYC}$ applies and the declaration has the appropriate authority (the authorizing act $A$ with felicity conditions met).

The **Constitution** triple $(X, Y, C)$ is the *rule* — the general standing condition.
The **StatusFunctionDeclaration** $(x, y, C, A)$ is a *token application* of that rule — a specific instance.
Both are necessary: the rule provides the general schema; the declaration applies it to a particular entity at a particular history.

## Examples

| Raw entity $X$ | Context $C$ | Institutional status $Y$ | Constitutive rule |
|---|---|---|---|
| Human being | Legal order | Legal person with rights | Legal personhood rules |
| Piece of paper | Banking system | Legal tender | Currency constitution |
| Sound sequence | Language community | Word with meaning | Linguistic convention |
| Move in chess | Chess rules | Check/checkmate | Chess constitutive rules |
| Agent in a normative system | Officer roster | Officer with authority and duties | Officer installation rules |
| Record content + history | Rule-based system | Settled record $H^*_t$ | Nucleus fixed-point condition |

## Open questions

- Whether the constitutive rule $R_{XYC}$ can be formalized as a morphism in the category of fibers — a natural transformation between the raw-entity fiber bundle and the institutional-status fiber bundle, with the context fiber as an additional input; and whether this formalization gives a precise account of what it means for a rule to be "in force" at a given history.
- Whether constitution is transitive: if $X$ counts as $Y$ in $C_1$ and $Y$ counts as $Z$ in $C_2$ (and $C_2 \supseteq C_1$), does $X$ thereby count as $Z$ in $C_2$?
  Searle suggests yes (sounds count as words count as promises); but institutional systems may block transitive constitution (a person counts as an officer does not automatically mean the person counts as the Captain's officer in every sub-context).
- Whether there is a minimal context $C^* = C^*(X, Y)$ for each constitutive pair $(X, Y)$ — the smallest institutional context in which $X$ can count as $Y$ — and whether this minimal context is unique.
