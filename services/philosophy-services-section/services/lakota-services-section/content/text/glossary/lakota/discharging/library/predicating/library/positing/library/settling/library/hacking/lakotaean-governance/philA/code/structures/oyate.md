---
type: definition
class: polity-unit
status: draft
symbol: "O"
depends-on:
  - polity-cell-system
  - tiyospaye
  - wolakhota-closure-system
realizes: [polity]
title: Oyáte
description: "An oyáte — band, people — is the mid-scale polity of the Lakota nation: a confederation of tiyóšpaye that share a winter-camp territory, share a council, and recognize each other as one people for purposes of war, hunt, and ceremony."
---

# Oyáte

An *oyáte* — band, people — is the mid-scale polity of the Lakota nation: a confederation of tiyóšpaye that share a winter-camp territory, share a council, and recognize each other as one people for purposes of war, hunt, and ceremony.
Seven oyate compose the Tȟitȟúŋwaŋ (Teton) division — Oglala, Sicangu (Brulé), Mnikȟówožu (Miniconjou), Itȟázipčho (Sans Arc), Sihásapa (Blackfoot Sioux), Oóhenuŋpa (Two Kettle), Húŋkpapȟa — and seven divisions plus Yankton, Yanktonai, and the Santee divisions compose the [Oceti Sakowin](oceti-sakowin.md).

## Constituent predications

An oyate entity $O \in E^\mathrm{pol}_\mathrm{lak}$ carries:

- $\langle O, \texttt{tiyospaye-member}, T\rangle$ for each [tiyóšpaye](tiyospaye.md) within the oyate.
- $\langle O, \texttt{naca}, a\rangle$ for the head naca of the oyate.
  The oyate has more than one naca in the wider sense (several elder-naca, who together form the council); the head-naca-cell settles when one is recognized as the senior speaker.
- $\langle O, \texttt{wakichunza}, a\rangle$ for each [wakíčhuŋza](wakichunza-office.md) — the decision-chiefs who run day-to-day affairs.
- $\langle O, \texttt{omniciye}, K\rangle$ for the council body.
  See [omniciye-council](omniciye-council.md).
- $\langle O, \texttt{akicita-band}, B\rangle$ for the standing [akicita band](../../../philB/code/structures/akicita-band.md) (and additional war- or hunt-akicita bands as activated).
- $\langle O, \texttt{winter-camp-place}, p\rangle$ for the place where the oyate winters; the place-cell is kin-marked, not property-marked.
- $\langle O, \texttt{division-member}, D\rangle$ for the division (Tȟitȟúŋwaŋ, Yankton, etc.) the oyate sits within.
- $\langle O, \texttt{oceti-sakowin-member}, \Omega\rangle$ for the full confederacy.

## Closure rules over the oyate

Six rules in $\mathcal{S}_\mathrm{wolak}$ are oyate-scoped:

**(O1) Composition.** $\langle O, \texttt{tiyospaye-member}, T\rangle \geq_k \mathbf{t} \;\wedge\; \langle T, \texttt{member}, a\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle O, \texttt{populace}, a\rangle \geq_k \mathbf{t}$.
The oyate's populace is the union of its tiyóšpaye's members.

**(O2) Council convening.** Convening conditions (seasonal turnover, intra-oyate dispute, inter-oyate concern) settle the $\langle O, \texttt{omniciye-active}\rangle$ cell at $\mathbf{t}$; the council operates while this cell is at $\mathbf{t}$.
See [omniciye-deliberation](../../../philB/code/transformers/omniciye-deliberation.md) for the firing structure.

**(O3) Inter-oyate kinship.** $\langle a, \texttt{married-to}, b\rangle \geq_k \mathbf{t} \;\wedge\; a \in \mathrm{pop}(O_1) \;\wedge\; b \in \mathrm{pop}(O_2) \;\Longrightarrow\; \langle O_1, \texttt{kin-with-oyate}, O_2\rangle \geq_k \mathbf{t}$.
Inter-oyate marriage installs inter-oyate kinship at the polity-scale.
This is the structural mechanism by which the confederacy is held together: kin-cells across oyate-boundaries accumulate over generations.

**(O4) Camp-circle formation.** When the oyate convenes for a major event — sun dance, big hunt, treaty council — the constituent tiyóšpaye arrange themselves in the camp-circle (*hoȟčokata*) in a definite order; the order is settled at $\mathbf{t}$ and persists across years.
The order encodes the tiyóšpaye's standing within the oyate.

**(O5) Akicita installation for hunt or war.** When a hunt or war party is to be formed, the oyate's omniciye settles which akicita-band has the scope: $\langle B, \texttt{scope}, X\rangle \geq_k \mathbf{t}$ for $X$ the action under akicita-authority.
The akicita-band's authority is in force until $X$ completes; see [akicita-band](../../../philB/code/structures/akicita-band.md), [akicita-delegation](../morphisms/akicita-delegation.md), and [akicita-revocation-at-scope-completion](../../../philB/prose/learning/claims/akicita-revocation-at-scope-completion.md).

**(O6) Wakȟáŋ infrastructure.** $\langle O, \texttt{wakichunza}, a\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, \texttt{ceremonial-eligibility-cell}\rangle \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(\cdot) = 1 \;\Longrightarrow\; \langle O, \texttt{conducts-ceremony-cell}\rangle$ settles.
The oyate's polity-scale ceremonial-acts (sun dance, the seven rites at population scale) require wakȟáŋ-bearing officer-cells.

## Autarkeia and escalation

The oyate has *complete autarkeia on internal questions*: head-naca recognition, akicita-installation, intra-oyate disputes, ceremonial calendar.
It has *escalating autarkeia on inter-oyate questions*: marriage-arrangement, inter-oyate hostility, joint hunt or war is convened at division- or confederacy-scale; the oyate's council carries the question upward by appointing a delegate (typically the head naca) to a wider council.

The autarkeia certificate: $\mathcal{S}_\mathrm{wolak}$ restricted to the oyate's sub-base is closure-complete on the oyate's relevant cells, in the sense of the [predication-settling CALM corollary](../../../../../../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md).
Distributed confirmation of an oyate-internal resolution is coordination-free: a tiyóšpaye that observes the resolution-cells can confirm without round-tripping to a central authority.

## Withdrawal, fission, and migration

Three oyate-level transitions correspond to standard substrate-operations:

- **Tiyóšpaye departure**: a tiyóšpaye exercises iyúhá-šni from oyate membership.
  The tiyóšpaye-member-cell drops to $\bot$ at the oyate; the underlying kin-cells with other tiyóšpaye persist.
  The departing tiyóšpaye may join a different oyate by reciprocal recognition.
- **Oyate fission**: a sufficiently large oyate splits into two oyate.
  Historical: the Sicangu (Brulé) splitting into Upper Brulé and Lower Brulé in the 19th century.
  The fission is a colimit-pushout in the temporal 2-category: a single initial-state oyate becomes two oyate sharing constituent-power but with disjoint subsequent settlings.
- **Migration**: the oyate's $\texttt{winter-camp-place}$ cell settles at a different place.
  The new place becomes kin-marked over years; the old place remains kin-marked through the ancestor-relation (people are buried there).

## The historical seven Tȟitȟúŋwaŋ

The seven Tȟitȟúŋwaŋ oyate as of mid-19th century — Oglala, Sicangu, Mnikȟówožu, Itȟázipčho, Sihásapa, Oóhenuŋpa, Húŋkpapȟa — each have a continuous lineage from the Tȟitȟúŋwaŋ division-founding and an ongoing autarkeia within the contemporary reservation-and-treaty context.
The oyate-cell-system continues to fire on each: the Oglala on Pine Ridge Reservation, the Sicangu on Rosebud, the Mnikȟówožu on Cheyenne River, etc. The U.S. federal recognition system installs *tribal-government cells* over each oyate that fire under a different closure-rule subsystem ($\mathcal{S}_\mathrm{IRA}$, after the 1934 Indian Reorganization Act); the relationship between the two settlings is itself a multi-observer system in the technical sense, with cohomological residue at the cells where the two subsystems disagree.

## Sources

- Walker 1982, *Lakota Society* — division and oyate structure.
- Ella Deloria, *Speaking of Indians* (1944) — oyate-level political organization.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century oyate dynamics, including the relationship with federally-imposed tribal governments.
- White Hat, *Life's Journey — Zuya* (2012) — Sicangu Lakota oyate-life in contemporary Sicangu voice.
- DeMallie, *The Sioux at the Time of European Contact*, in *Handbook of North American Indians* vol.
  13 — historical oyate enumeration and migration.
