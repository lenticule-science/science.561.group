---
type: definition
class: office-scope-bounded
status: draft
symbol: "B_l"
depends-on:
  - polity-cell-system
  - zuya
  - office-as-double-settlement
  - military-command-chain-as-modal-composition
  - omniciye-council
realizes: [office, war-leader]
title: Blotáhuŋka
description: "A blotáhuŋka is the war-leader of a zuya: the office at the top of the temporary chain-of-command that constitutes the war-party's authority structure."
---

# Blotáhuŋka

A *blotáhuŋka* is the war-leader of a zuya: the office at the top of the temporary chain-of-command that constitutes the war-party's authority structure.
Distinct from the naca (consultative-speaker) and the wakíčhuŋza (executive-decision), the blotáhuŋka holds *command-authority* — the right to give orders binding on the war-party for the zuya's duration.
The office is constituted at zuya-installation and revoked at scope-completion.

## Data

A blotáhuŋka office entity $B_l \in E^\mathrm{off}_\mathrm{lak}$ carries:

- $\langle B_l, \texttt{incumbent}, a\rangle$ — the agent in the role.
- $\langle B_l, \texttt{zuya-scope}, Z\rangle$ — the [zuya](zuya.md) the office serves.
- $\langle B_l, \texttt{appointed-by}, K\rangle$ — the omníčiye (or tiyóšpaye, for small revenge-parties) that constituted the office.
- $\langle B_l, \texttt{command-frame}, R^{B_l}\rangle$ — the bilattice accessibility relation that defines the office's authorized continuations on war-party-cells.
- $\langle B_l, \texttt{prior-zuya-record}\rangle$ — the recorded standing of the agent as a war-leader from prior zuya.
  Blotáhuŋka are typically selected from warriors with high coup-cell counts and demonstrated wóohitika and wóksape.

## Installation

The blotáhuŋka closure rule:

$$\langle a, \texttt{has-prior-zuya-standing}\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, \texttt{has-standing-as-wóohitika}\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, \texttt{has-standing-as-wóksape}\rangle \geq_k \mathbf{t} \;\wedge\; \langle K, \texttt{appoints-blotahunka-for}, Z\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, \texttt{accepts-blotahunka}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle B_l, \texttt{incumbent}, a\rangle \geq_k \mathbf{t}$$

Five conditions: prior zuya-standing, two named virtues (wóohitika for bravery, wóksape for wisdom-in-judgment), council-appointment, candidate-acceptance.

Notable absence: wówačhantognaka (generosity) and wówačhiŋtȟaŋka (fortitude) are not in the installation conditions.
They remain relevant — the blotáhuŋka's standing-as-wolakhota requires them — but the installation gate is on the specifically-zuya-relevant virtue-pair.
A generous and patient warrior who lacks bravery and judgment in battle is not a blotáhuŋka candidate.

## The command-frame structure

By [military-command-chain-as-modal-composition](../../../../../../../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/triage/military-command-chain-as-modal-composition.md), the blotáhuŋka's authority is a bilattice modal frame $R^{B_l}$: the set of authorized continuations from any war-party state.
For an action-payload $u_X$ (a candidate war-party action), the modal possibility operator

$$\Diamond_{R^{B_l}} u_X$$

evaluates to $\mathbf{t}$ iff the action is authorized under the blotáhuŋka's command.
The frame $R^{B_l}$ is *restricted* — narrower than the omníčiye's general authority frame — to the war-party-internal cells of zuya $Z$.

The chain of command extends below the blotáhuŋka:

- **Blotáhuŋka** ($r_1$): top of the chain; appointed by the omníčiye.
- **War-akicita** ($r_2$): the band installed under the zuya, with their own akicita-leaders.
  The war-akicita's frame $R^{r_2}$ is the blotáhuŋka's frame restricted to the akicita-coordination cells.
- **Warriors** ($r_3$): individual war-party members.
  Their frame $R^{r_3}$ is the war-akicita's frame restricted to individual actions.

By the chain-of-command bound (statement (c) of [military-command-chain-as-modal-composition](../../../../../../../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/triage/military-command-chain-as-modal-composition.md)):

$$\Diamond_{R^{r_3}} u \leq_t \Diamond_{R^{r_2}} u \leq_t \Diamond_{R^{r_1}} u = \Diamond_{R^{B_l}} u$$

No warrior's authorized continuations exceed the blotáhuŋka's.
This is *structural*, not policy.

## Accountability $H^0_t$ invariant

By statement (d) of the chain-of-command theorem: accountability does not transfer down the chain.
The blotáhuŋka's $\langle B_l, \texttt{accountable-for}, X\rangle$ cells persist regardless of which warrior executed the action.
The substrate-content of "the blotáhuŋka answers for the war-party" is the $H^0_t$-invariance of these cells under the chain-composition.

This is what makes the blotáhuŋka's installation gating so strict: the office accumulates *accountability-cells* over the course of the zuya that are not delegable.
A war-party that took unnecessary harm, that violated the wakȟáŋ-marking of an enemy's relations, that killed when coup-counting was available — these residual-cells accumulate on the blotáhuŋka's record, not on the individual warriors'.
A blotáhuŋka with multiple recorded zuya producing high $\top$-residue does not get appointed again.

## Distinction from naca and wakichunza

| Office | Authority type | Term | Coercive force |
|---|---|---|---|
| Naca | Consultative-speaker | Continuous | None (moral suasion) |
| Wakíčhuŋza | Executive-decision | Until next sun dance / council-recall | Limited to decision-scope |
| Blotáhuŋka | Command | Until zuya scope-completion | Direct command for zuya duration |
| Wičháša wakȟáŋ | Ceremonial-substrate-authority | Continuous | None (substrate-witness) |

The blotáhuŋka is the *only office* in the polity with direct command-authority.
Command-authority is exclusively scope-bounded; the polity has no standing command-office.

This is structurally constitutive.
A polity that *had* a standing command-office would have a closure-rule subsystem firing command-authority on cells continuously — a $\mathcal{S}_\mathrm{standing-command}$ that overlays $\mathcal{S}_\mathrm{wolak}$ persistently.
The Lakota polity does not have such a subsystem.
Command-authority is reserved for the temporary $\mathcal{S}_\mathrm{zuya}$ overlays.

## Multiple blotáhuŋka

A large zuya may have multiple blotáhuŋka — one per major-contingent.
The Little Bighorn engagement involved multiple blotáhuŋka simultaneously: Crazy Horse for the Oglala contingent, Gall for the Húŋkpapȟa, others for the Cheyenne and Arapaho allies.
The blotáhuŋka coordinated in a war-council that was itself a small omníčiye-deliberation, with no single ultimate-commander.

Substrate-algebraically: the war's command structure is a *coproduct* of per-contingent command-chains $R^{B_l^{(i)}}$ rather than a *composition*.
The unified action emerges from omníčiye-style settling among the blotáhuŋka, with no super-blotáhuŋka above them.
This is the distinguishing structural feature from Western armies' single-commander forms: the joint zuya is a *flat-confederation* of war-parties at the top, not a single chain.

## Revocation at scope-completion

When the zuya's scope-action $X$ completes, the blotáhuŋka's office-cells are revoked by the scope-completion morphism (per [akicita-revocation-at-scope-completion](../../../philB/prose/learning/claims/akicita-revocation-at-scope-completion.md)).
The frame $R^{B_l}$ goes inactive.
The agent retains:

- Their virtue-standing cells (wóohitika, wóksape) — these are *agent-level* cells, not office-level.
- Their accumulated coup-cells from the zuya.
- The recorded blotáhuŋka-cell for *that* zuya — a historical record, not an active office.

The agent does *not* retain:

- Command-authority on war-party-cells.
  The frame is inactive.
- Accountability-cells for war-party actions outside the recorded zuya — those are scope-bounded.

Re-appointment to blotáhuŋka in a subsequent zuya is on the same conditions as initial appointment, with the addition of the prior zuya's record contributing to the prior-zuya-standing cell.
A successful prior blotáhuŋka is a strong candidate for the next; an unsuccessful one's prior-zuya-standing cell is at lower $\leq_k$-value and they are unlikely to be appointed.

## Sources

- Marshall, *The Journey of Crazy Horse* (2004) — extended treatment of Tȟašúŋke Witkó as blotáhuŋka.
- Stanley Vestal, *Sitting Bull, Champion of the Sioux* (1932) — Húŋkpapȟa blotáhuŋka context.
- Walker 1982, *Lakota Society* — blotáhuŋka office structure.
- Royal B.
  Hassrick, *The Sioux* (1964) — comparative office structure across Sioux divisions.
- Hämäläinen, *Lakota America* (2019) — blotáhuŋka in the polity's command-structure.
