---
type: definition
class: deliberative-body
status: draft
symbol: "K"
depends-on:
  - polity-cell-system
  - naca-office
  - wakichunza-office
  - wolakhota-closure-system
realizes: [council]
title: Omníčiye council
description: The omníčiye — council — is the deliberative body at oyate and confederacy scale.
---

# Omníčiye council

The *omníčiye* — council — is the deliberative body at oyate and confederacy scale.
The council convenes the polity's elder naca (and at confederacy scale, the senior naca from each oyate); deliberation produces settled cells on the polity's substantive questions; the settling-mechanism is consensus-by-withdrawal (not majority vote).

## Constituent predications

An omníčiye entity $K \in E^\mathrm{pol}_\mathrm{lak}$ carries:

- $\langle K, \texttt{polity-scope}, P\rangle$ for the polity $K$ serves.
- $\langle K, \texttt{member}, a\rangle$ for each elder naca who is a member of $K$.
  At oyate scope, all elder naca; at confederacy scope, the senior naca of each constituent oyate (or each constituent division).
- $\langle K, \texttt{convening-condition}, c\rangle$ for the condition that has caused $K$ to convene.
- $\langle K, \texttt{active}\rangle$ — the cell that fires while the council is in session.
- $\langle K, \texttt{question}, q\rangle$ for each question $K$ is settling.
  The council can hold multiple questions simultaneously; each has its own subsetlling.
- $\langle K, \texttt{wakhan-witnessed-by}, M\rangle$ for the wičháša wakȟáŋ witnessing major omníčiye decisions; for treaty-questions and ceremonial-questions, wakȟáŋ-witnessing is required.

## Convening conditions

The council does not stand permanently.
It convenes when a substrate-condition has fired one of the convening-rules:

**(K1) Annual convocation**: the sun dance gathers all seven Tȟitȟúŋwaŋ oyate; the omníčiye at confederacy scope is structurally co-active with the sun dance.
The cell $\langle K, \texttt{active}\rangle$ settles at $\mathbf{t}$ during the sun-dance period.

**(K2) Treaty-question**: an inter-polity matter requiring wakȟáŋ-bearing decision (a treaty offer, a treaty breach response, a treaty negotiation) fires the convening-rule.
The council convenes specifically for the treaty-question and may dispense with other matters.

**(K3) War-question**: a question of joint hostilities — convening with neighbors to plan or respond.
The convening is typically followed by [akicita-band](../../../philB/code/structures/akicita-band.md) constitution for the resulting action.

**(K4) Internal-conflict question**: a dispute between tiyóšpaye or between oyate that has not settled at lower-scope mediation.
The council convenes to settle the harm-cells through restorative work.

**(K5) Substrate-emergency question**: a question affecting the polity's substrate-condition — loss of the buffalo, loss of a wičháša wakȟáŋ chain, threat to Pȟahá Sápa, language emergency.
The council convenes to assess and to convene wider response.

## Speaking-in-council

A council member's substrate-operation during deliberation is *speaking-in-council* — a positing morphism on the council's question-cells.
The structure:

A speaker takes the floor, speaks, sits.
While speaking, the speaker posits at the question's cells: their statement of opinion, recollection, principle, or proposal is recorded in the council's substrate-record.

The positing is *agentive*: the cell records *who said what*.
The multi-observer-system structure (cf. [multi-observer-system](../../../../../../../../../../../../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md)) is at council-scope: each council member is an observer with their own settling of the question-cells; the merged settling is the council's joint state.

Speaking is *unconstrained in length and timing*: a speaker takes the floor for as long as the substrate-content requires, returning to the question over hours, days, or successive convocations.
The council does not adjourn until either (a) the question's cell has settled to a quiescence (consensus reached), or (b) the question has been carried to a higher scope, or (c) the question has been deferred for further substrate-work outside the council.

## Settling: consensus-by-withdrawal

The council's settling-mechanism is *not* a vote-tally.
The structure:

The council holds the question's cell in the under-determined position $\bot$ (Škáŋ) while speakers contribute.
Each speaker's posit moves the merged-cell toward $\mathbf{t}$ or $\mathbf{f}$ depending on the speaker's truth-class.
As contributions accumulate:

- If all positing speakers settle toward the same truth-class without contesting posits, the merged-cell rises to $\mathbf{t}$ (or $\mathbf{f}$).
  The cell has reached quiescence.
- If contesting posits arise (some speakers asserting, others denying), the merged-cell rises to $\top$ (Íŋyaŋ) — contested.
  The council does not move past $\top$ by tally; it either deliberates further (continuing to posit until a truth-class consensus emerges) or carries the question up.

The third mechanism, *iyúhá-šni withdrawal*, is what allows the council to complete despite continuing disagreement:

A council member who cannot consent to the emerging consensus exercises [iyúhá-šni](../transformers/iyuha-sni-withdrawal.md) from the question-engagement.
The withdrawing member's standing-cell on the question drops to $\bot$ for that engagement.
The merged-settling now operates over the *engaged-majority* — the members who did not withdraw.

By the [consensus-by-withdrawal yields quiescence theorem](../../../philB/prose/learning/claims/consensus-by-withdrawal-yields-quiescence.md), if the engaged-majority can converge to a truth-class (no contesting positions among the engaged), the question-cell settles to that truth-class at council-scale, and the withdrawn-members' refusal is not coerced into agreement: their underlying cells (kinship-cells, standing-cells outside the engagement) are preserved.

This is structurally what allows the polity to *decide* without *requiring unanimity*.
Majority-vote coerces dissenters; unanimity-requirement blocks decision; consensus-by-withdrawal lets the engaged-majority proceed while preserving the withdrawn party's standing.

## Confederacy-scope omníčiye

At confederacy scope (Očhéthi Šakówiŋ), the council convenes the senior naca of each constituent division.
Some questions are *only* settleable at this scope:

- Treaty with foreign powers (the United States, neighboring large polities).
- Joint war.
- Pȟahá Sápa-question — the kin-relation to Pȟahá Sápa is a confederacy-level cell, not an oyate-level cell.
- Sun-dance scheduling and conduct.

The confederacy-scope omníčiye operates by the same consensus-by-withdrawal mechanism, but with the structural feature that *whole divisions* (not individuals) can iyúhá-šni from a question.
The 1862 Dakota War / Dakota Uprising in Minnesota was structurally a partial confederacy-fragmentation: the four eastern Dakota divisions and the western divisions had diverged on the question of war with the United States, and the convocation could not settle.
The four eastern divisions made their own decision under their own oyate-scope omníčiyes; the consequences propagated unevenly across the confederacy.

## Wakȟáŋ-witnessing of major decisions

Decisions on certain question-classes are required to be wakȟáŋ-witnessed:

- Treaty-decisions (the wakȟáŋ-bearing of the binding depends on it).
- Major-ceremony decisions (sun-dance scheduling, conduct of any of the seven rites).
- Office-installation at confederacy scope (a senior naca speaking-for-the-confederacy must be wakȟáŋ-recognized).
- Pȟahá Sápa-question decisions.

Without wakȟáŋ-witnessing on a decision in these classes, the resulting cell is not wakȟáŋ-marked and so does not propagate through the rule-classes that condition on wakȟáŋ-marking.
The decision can be *made* but does not carry the substrate-weight of a wakȟáŋ-marked decision.

## Sources

- Walker 1982, *Lakota Society* — the omníčiye and its convening structure.
- Ella Deloria, *Speaking of Indians* (1944) — consensus-by-withdrawal as the structural form of Dakota/Lakota political settlement.
- DeMallie 2001, *Handbook of North American Indians* vol.
  13 — council structure across the seven Tȟitȟúŋwaŋ oyate.
- Vine Deloria Jr., *Behind the Trail of Broken Treaties* (1974) — confederacy-scope decision and the structural difference from Western parliamentary procedure.
- White Hat, *Life's Journey — Zuya* (2012) — contemporary council practice and the partial replication in tribal-government structure.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century council reconstitution including the Standing Rock councils.

## Earlier material

**(K3) War-question**: a question of joint hostilities — convening with neighbors to plan or respond.
The convening is typically followed by [akicita-band](../../../philB/code/structures/akicita-band.md) constitution for the resulting action.

A council member who cannot consent to the emerging consensus exercises [iyúhá-šni](../transformers/iyuha-sni-withdrawal.md) from the question-engagement.
The withdrawing member's standing-cell on the question drops to $\bot$ for that engagement.
The merged-settling now operates over the *engaged-majority* — the members who did not withdraw.

By the [consensus-by-withdrawal yields quiescence theorem](../../../philB/prose/learning/claims/consensus-by-withdrawal-yields-quiescence.md), if the engaged-majority can converge to a truth-class (no contesting positions among the engaged), the question-cell settles to that truth-class at council-scale, and the withdrawn-members' refusal is not coerced into agreement: their underlying cells (kinship-cells, standing-cells outside the engagement) are preserved.
