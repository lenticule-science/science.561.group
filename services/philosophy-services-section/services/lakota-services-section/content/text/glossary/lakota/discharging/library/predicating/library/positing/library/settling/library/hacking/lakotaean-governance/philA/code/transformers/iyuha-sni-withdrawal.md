---
type: morphism
class: positing-retraction
status: draft
symbol: "\\mathrm{iyuha\\text{-}sni}_{(a,\\omega)}"
depends-on:
  - polity-cell-system
  - wolakhota-closure-system
  - omniciye-council
realizes: [unrelating]
title: Iyúhá-šni withdrawal
description: The iyúhá-šni morphism is the substrate-operation by which an agent or polity-unit refuses an engagement without severing the underlying relation.
---

# Iyúhá-šni withdrawal

The iyúhá-šni morphism is the substrate-operation by which an agent or polity-unit refuses an *engagement* without severing the underlying *relation*.
It is the polity's primary mechanism for dissent, refusal-of-coercion, and the right-of-non-participation.

## The morphism

For an agent $a \in E^\mathrm{hum}_\mathrm{lak}$ (or a polity-unit $T \in E^\mathrm{pol}_\mathrm{lak}$) and an *engagement* $\omega$ — a specific scope-action, council-question, hunt-membership, war-party membership, treaty-signatory status, etc.:

$$\mathrm{iyuha\text{-}sni}_{(a, \omega)} : v \;\longmapsto\; v'$$

where the result-settling $v'$ has:

- $\langle a, \texttt{participates-in-engagement}, \omega\rangle$ moved to $\bot$ from whatever its prior value was.
- All standing-cells *over $\omega$* that referred to $a$'s participation: $\langle a, p\text{-for-engagement-}\omega, \cdot\rangle = \bot$ for each $p \in \Pi^\mathrm{std}$.
- All *non-engagement* cells preserved: $a$'s kin-cells, $a$'s witness-cells outside $\omega$, $a$'s standing in other engagements, all unaffected.

The morphism is *not* a positing morphism in the standard sense — it is a *scoped retraction* that respects the substrate's $\leq_k$-monotone family by interpreting the scoped-cells as engagement-window-bound (cf. [akicita-band](../../../philB/code/structures/akicita-band.md) §"Revocation at scope-completion" for the parallel structure).

## What iyúhá-šni does *not* do

Five distinctions from severance:

1. **Does not retract kinship.** The agent's kin-cells with other parties remain at their pre-withdrawal values.
  Withdrawing from an oyate-engagement does not unmake the agent's tȟakúye-link with co-members.
2. **Does not retract witness.** Witnesses borne by the agent in past ceremonies (yuhápi cells) remain.
3. **Does not retract honor-cells.** Coup-counted honors, virtue-standing cells, ceremonial-eligibility cells outside the withdrawn engagement persist.
4. **Does not retract obligation outside the engagement.** Owes-cells under (W3) of $\mathcal{S}_\mathrm{wolak}$ to kin remain in force.
5. **Does not block re-entry.** The withdrawn agent can rejoin the engagement at any time by positing acceptance — there is no waiting-period or readmission-procedure substrate-required.

## Standard sites of iyúhá-šni

The morphism is the polity's primary mechanism in several routine sites:

**Council-question withdrawal.** A council member who cannot consent to an emerging consensus on a specific question withdraws from the question-engagement.
The merged-settling proceeds over the engaged-majority; the withdrawing-member's standing in *other* council-questions and in the council generally is preserved.

**War-party non-joining.** When a war party is being formed and an akicita-installation is in progress, an individual warrior can decline to join.
The agent's standing as a warrior is not affected; only the participation-cell over that specific war party is at $\bot$.

**Marriage refusal.** A young person can refuse an arranged marriage.
The kin-relations with the proposing family persist; only the marriage-engagement is withdrawn.

**Tiyóšpaye departure.** A member of one tiyóšpaye can withdraw and join another (typically through marriage or by accepting hospitality).
The new tiyóšpaye membership rule fires on positive acceptance; the old tiyóšpaye-membership-cell drops to $\bot$; underlying kin-cells with both tiyóšpaye persist.

**Oyate-fragment exit.** A subset of a large oyate withdraws to form a new oyate (historical: Lower Brulé from Sicangu).
The withdrawing fragment's oyate-membership-cell drops; their division-membership (Tȟitȟúŋwaŋ) and confederacy-membership remain.

**Treaty-signatory withdrawal.** A polity-unit can withdraw its signatory-cell from a treaty.
The withdrawal is itself a wakȟáŋ-bearing operation if the original signing was wakȟáŋ-bearing; non-wakȟáŋ withdrawal does not affect a wakȟáŋ-marked treaty.

## Asymmetry with positing

Iyúhá-šni is *not the converse* of positing.
Standard positing is $\leq_k$-monotone (raising cells); iyúhá-šni is the *scoped completion of engagement* (cells drop to $\bot$ when scope closes).
The asymmetry is what allows the polity to operate without information-loss in the substrate while still permitting withdrawal as an authentic substrate-act.

By the Klein-four $\sim$-symmetry of the bilattice, the *negation* of a withdrawal (continuing-to-participate) is *not* a withdrawal-of-the-withdrawal.
The substrate's symmetry is on truth-class (assert vs deny), not on engagement (participate vs withdraw); these are different axes.

## Polity-scale iyúhá-šni

The morphism scales: a tiyóšpaye, an oyate, or the confederacy itself can iyúhá-šni from an engagement at its scale.
Three load-bearing historical instances:

- **The 1862 Dakota division split**: the four eastern Dakota divisions iyúhá-šni from the confederacy-scope consensus on peace with the United States during the Minnesota uprising.
  The kin-cells between eastern and western divisions persisted; the engagement-cell over the peace-with-US question dropped.
- **The 1868 Fort Laramie pre-signing iyúhá-šni**: Red Cloud and others withheld signature until specific conditions (closure of the Bozeman Trail, abandonment of the forts) were met.
  The signing was an engagement; the withholding was iyúhá-šni from the engagement.
- **The 1980 $1.9 billion settlement refusal**: the polity at confederacy scope continues to iyúhá-šni from the offered-settlement-engagement.
  The kin-cell with Pȟahá Sápa is preserved; the engagement of accepting the settler-state's monetary substitution is refused.
  The interest accumulating on the unaccepted settlement (~$1.9B in 1980, over $2B today by some accounts) is a substrate-record of the continuing refusal.

## The morphism's necessity

Why $\mathcal{S}_\mathrm{wolak}$ includes (W6) (the withdrawal rule-class): a polity that *cannot* iyúhá-šni is a polity that has only two responses to disagreement — full agreement (which over-constrains and prevents decision) or full severance (which fractures kinship).
Both are substrate-corrosive.
The iyúhá-šni morphism is the third option that lets the polity function without forcing one of the two corrosive extremes.

The structural content: the polity is held together by *kinship*, which is not consent-based; political *engagements* are consent-based and are decoupled from the kinship-substrate.
The polity decides; non-consenting members withdraw from the decision; everyone remains kin.
This is the substantive form of "the polity is constituted by kinship, not by consent to a particular government."

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — the right-of-withdrawal as structurally constitutive.
- Walker 1982, *Lakota Society* — withdrawal in council-context and tiyóšpaye dynamics.
- Audra Simpson, *Mohawk Interruptus* (2014) — the politics-of-refusal in the structurally-analogous Haudenosaunee tradition.
- Estes, *Our History is the Future* (2019) — iyúhá-šni at polity scale in twentieth- and twenty-first-century treaty politics, including the Black Hills settlement refusal.
- Coulthard, *Red Skin, White Masks* (2014) — refusal-of-recognition as structurally distinct from severance.
