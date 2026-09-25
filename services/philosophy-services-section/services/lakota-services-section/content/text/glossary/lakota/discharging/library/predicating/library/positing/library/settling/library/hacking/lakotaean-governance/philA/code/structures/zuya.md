---
type: definition
class: scope-bounded-closure-subsystem
status: draft
symbol: "\\mathcal{S}_\\mathrm{zuya}^X"
depends-on:
  - polity-cell-system
  - wolakhota-closure-system
  - akicita-band
  - jurisdiction-as-base-change
  - closure-rule-system
realizes: [war]
title: Zuya
description: "A zuya (also ozuye) is a war-expedition: a scope-bounded closure-rule subsystem $\\mathcal{S}\\mathrm{zuya}^X$ that overlays on $\\mathcal{S}\\mathrm{wolak}$ for the duration of a specific scope-action $X$."
---

# Zuya

A *zuya* (also *ozuye*) is a war-expedition: a scope-bounded closure-rule subsystem $\mathcal{S}_\mathrm{zuya}^X$ that overlays on $\mathcal{S}_\mathrm{wolak}$ for the duration of a specific scope-action $X$.
The overlay *adds* firing-permissions on cells classified as enemy-engagement; it does not suspend or replace any rule of $\mathcal{S}_\mathrm{wolak}$.
A zuya carries its own offices ([blotáhuŋka](blotahunka.md)), its own akicita-installation (the war-akicita), and a built-in scope-completion that automatically retracts the overlay when $X$ ends.

## Data

A zuya entity $Z \in E^\mathrm{pol}_\mathrm{lak}$ carries:

- $\langle Z, \texttt{originating-polity}, P\rangle$ — the oyate or confederacy that constituted the zuya.
- $\langle Z, \texttt{enemy}, P'\rangle$ — the target polity-unit, oyate, or population.
  The enemy-cell is in $\Pi^\mathrm{std}$ at the polity-cell-system level.
- $\langle Z, \texttt{objective}, X\rangle$ — the scope-action defining completion: raid for horses, defense of camp, response to specific harm, joint-action with allied polity.
- $\langle Z, \texttt{blotahunka}, a\rangle$ — the war-leader.
- $\langle Z, \texttt{war-akicita}, B\rangle$ — the akicita-band installed for the zuya's coordination.
- $\langle Z, \texttt{member}, w_i\rangle$ — warriors enrolled in the war-party.
- $\langle Z, \texttt{scope-active}\rangle$ — fires at $\mathbf{t}$ while the zuya is in progress.
- $\langle Z, \texttt{wakhan-status}\rangle$ — the wakȟáŋ-bearing of the zuya's authorization (set $1$ when the omníčiye that constituted it included wakȟáŋ-witness; set $0$ for ad-hoc revenge-parties that did not pass through council).

## The jurisdictional inclusion

$\mathcal{S}_\mathrm{zuya}^X$ presents as a jurisdictional inclusion in the sense of [jurisdiction-as-base-change](../../../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/jurisdiction-as-base-change.md):

$$\iota_{\mathrm{zuya}^X} : \mathcal{C}_{\mathrm{zuya}^X} \hookrightarrow \mathcal{C}_\mathrm{lak}$$

where $\mathcal{C}_{\mathrm{zuya}^X}$ is the sub-predicate-category containing exactly the cell-classes the war-overlay fires on:

- The *enemy-cells*: $\langle Z, \texttt{enemy}, \cdot\rangle$ at the zuya level; $\langle w, \texttt{engaging-as-enemy}, e\rangle$ at the warrior-enemy level.
- The *coup-honor cells*: $\langle w, \texttt{counted-coup-on}, e\rangle$ at the four grades (see [count-coup](../../../philB/code/transformers/count-coup.md)).
- The *war-harm cells*: $\langle w, \texttt{killed-in-war}, e\rangle$ — these fire as harm-cells with mandatory pairing to purification-required cells.
- The *war-party-internal cells*: $\langle Z, \texttt{member}, w\rangle$, the chain-of-command cells under the blotáhuŋka.

The base-change $\iota_{\mathrm{zuya}^X}^*$ pulls the polity's full substrate back to this sub-category for the duration of $X$.
Closure-rule firings under $\mathcal{S}_\mathrm{zuya}^X$ are localized to this sub-category and do not directly affect cells outside it.

## Composition with $\mathcal{S}_\mathrm{wolak}$

Critically: $\mathcal{S}_\mathrm{zuya}^X$ does *not* replace $\mathcal{S}_\mathrm{wolak}$.
The two subsystems compose:

$$\mathcal{S}_\mathrm{total}^{\text{during-zuya}} = \mathcal{S}_\mathrm{wolak} \cup \mathcal{S}_\mathrm{zuya}^X$$

and both fire simultaneously on the substrate during $X$.
The structural commitment:

- Kin-cells (W1) continue firing — warriors do not stop being kin to each other or to their non-combatant relatives.
- Conduct-evaluation (W2) continues — the four virtues are evaluated on conduct cells during the zuya, with wóohitika (bravery) and wówačhiŋtȟaŋka (fortitude) particularly relevant.
- Kin-obligation (W3) continues — warriors still owe wówačhantognaka to their relatives, including to relatives in *the enemy polity* if any (which is common — Plains-nation intermarriage produced kin-cells across polity lines).
- Witness-bearing (W4) continues — ceremonies before and after the zuya are firing.
- Withdrawal (W6) is *available* — a warrior can iyúhá-šni from the zuya at any time without standing-loss; participation is consent-based per engagement.
- Restorative (W7) continues — harm-cells fired during the zuya (whether by the enemy or by the war-party's own killing) install repair-required cells.

What $\mathcal{S}_\mathrm{zuya}^X$ *adds*:

- Closure rules permitting raid-on-enemy-property and capture-of-enemy-resources (specifically, horses; some recordings include captives).
- Closure rules installing counted-coup-on cells (see [count-coup](../../../philB/code/transformers/count-coup.md)).
- The blotáhuŋka's command authority over war-party-internal cells, via [military-command-chain-as-modal-composition](../../../../../../../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/triage/military-command-chain-as-modal-composition.md) specialized to the zuya scope.
- The war-akicita's enforcement-authority for war-party discipline.

What $\mathcal{S}_\mathrm{zuya}^X$ does *not* add:

- No suspension of kin-obligation to relatives outside the enemy-class.
- No general permission to harm non-combatants (the recorded killing-of-women-and-children in some accounts is a transgression of $\mathcal{S}_\mathrm{wolak}$, not a war-permission; such acts produce $\top$-residue requiring polity-scale repair).
- No suspension of wakȟáŋ-marking discipline — wakȟáŋ-bearing relations (sacred bundles, ceremonial places, kin to wakȟáŋ-beings) remain bound.

The composition-not-replacement structure is what distinguishes Lakota war from total-war forms.
The polity stays the polity during war.

## Constitution and revocation

A zuya is constituted by an omníčiye decision (per (K3) of [omniciye-council](omniciye-council.md), war-question convening) or, for smaller revenge-parties, by a tiyóšpaye decision after a specific harm-event.
The constitution-firing:

$$\langle K, \texttt{decides-zuya-against}, P'\rangle \geq_k \mathbf{t} \;\wedge\; \langle K, \texttt{installs-blotahunka}, a\rangle \geq_k \mathbf{t} \;\wedge\; \bigwedge_i \langle w_i, \texttt{accepts-zuya-membership}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle Z, \texttt{scope-active}\rangle \geq_k \mathbf{t}$$

The omníčiye-installed-zuya is wakȟáŋ-marked ($w_\mathrm{lak}(Z) = 1$ when the council included wakȟáŋ-witness); the tiyóšpaye-revenge-party is typically not wakȟáŋ-marked.

The revocation morphism is built into the scope-completion structure (cf. [akicita-revocation-at-scope-completion](../../../philB/prose/learning/claims/akicita-revocation-at-scope-completion.md)):

$$\langle X, \texttt{completed}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle Z, \texttt{scope-active}\rangle = \bot$$

with all enabled war-permissions retracted by the BC-naturality of scope-completion.
At zuya-end, $\mathcal{S}_\mathrm{total}^{\text{post-zuya}} = \mathcal{S}_\mathrm{wolak}$ again.
The polity returns to its peacetime substrate.

## What zuya is not

- **Not a state of war in the Westphalian sense.** There is no continuous war-state existing between polities outside of specific zuya-instances.
  Two Plains-nation polities can have repeated zuya-instances over years without entering a permanent war-state; the state is the *specific scoped instance*, not a continuing condition between the polities.
- **Not extermination.** The recorded objectives of zuya are circumscribed: take horses, take captives, count coup on the enemy, defend against an incursion, respond to a specific harm.
  Total elimination of the enemy polity is not in the standard objective-class.
- **Not total mobilization.** Warriors enroll voluntarily per zuya; no rule fires forcing participation.
  A warrior can decline by iyúhá-šni without standing-loss.
- **Not a separate moral domain.** The four virtues continue to apply.
  A warrior who acts cowardly in zuya loses standing-as-wóohitika; a warrior who acts cruelly to captives loses standing-as-wówačhantognaka.
  The polity's moral substrate runs through the war.

## Defensive zuya

A zuya constituted in response to a direct attack — defending the camp, pursuing a raid that took horses — has structural differences from offensive zuya:

- Scope-completion is *enemy-withdrawal-or-defeat*, not a specific objective like "take 10 horses."
- The war-akicita's authority is broader (encompassing the camp's defense, not just the war-party's coordination).
- Wakȟáŋ-marking is typically high — defensive zuya is unanimously council-supported.

The closure-rule structure is the same overlay; only the scope-completion condition differs.

## Joint zuya across polities

When multiple oyate or multiple Plains-nation polities form a joint zuya — common in the 1850s–1870s for action against U.S. military expeditions — the zuya is constituted at confederacy scope (per the Očhéthi Šakówiŋ omníčiye) and may include allied polities (Cheyenne, Arapaho) via the inter-polity council-attendance structure.
The blotáhuŋka can be from any of the participant polities; the war-akicita is constituted with members across the polity-boundaries; the wakȟáŋ-marking is at confederacy-or-higher level.

The Battle of the Little Bighorn (Pȟeháŋ Wakpá kičizapi, 1876) was the result of one such joint zuya, constituted at the confederacy-Cheyenne-Arapaho omníčiye on the Greasy Grass, with multiple blotáhuŋka (Crazy Horse / Tȟašúŋke Witkó among them for the Oglala contingent) and a unified war-akicita coordinating the day's engagement.

## Sources

- Royal B.
  Hassrick, *The Sioux* (1964) — recorded zuya organization and the war-party's authority structure.
- Walker 1982, *Lakota Society* — pre-reservation zuya-coordination and council-authorization.
- Joseph Marshall III, *The Day the World Ended at Little Bighorn* (2007) — Lakota-side narrative of the 1876 joint-zuya.
- *Wars for the West* materials — comparative Plains-nation war-coordination scholarship.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century zuya-form in continued political resistance (NoDAPL as defensive-zuya in modified form).
- Pekka Hämäläinen, *Lakota America* (2019) — zuya in the pre-reservation Lakota political economy.

## Earlier material

A *zuya* (also *ozuye*) is a war-expedition: a scope-bounded closure-rule subsystem $\mathcal{S}_\mathrm{zuya}^X$ that overlays on $\mathcal{S}_\mathrm{wolak}$ for the duration of a specific scope-action $X$.
The overlay *adds* firing-permissions on cells classified as enemy-engagement; it does not suspend or replace any rule of $\mathcal{S}_\mathrm{wolak}$.
A zuya carries its own offices ([blotáhuŋka](blotahunka.md)), its own akicita-installation (the war-akicita), and a built-in scope-completion that automatically retracts the overlay when $X$ ends.

- The *enemy-cells*: $\langle Z, \texttt{enemy}, \cdot\rangle$ at the zuya level; $\langle w, \texttt{engaging-as-enemy}, e\rangle$ at the warrior-enemy level.
- The *coup-honor cells*: $\langle w, \texttt{counted-coup-on}, e\rangle$ at the four grades (see [count-coup](../../../philB/code/transformers/count-coup.md)).
- The *war-harm cells*: $\langle w, \texttt{killed-in-war}, e\rangle$ — these fire as harm-cells with mandatory pairing to purification-required cells.
- The *war-party-internal cells*: $\langle Z, \texttt{member}, w\rangle$, the chain-of-command cells under the blotáhuŋka.

- Closure rules permitting raid-on-enemy-property and capture-of-enemy-resources (specifically, horses; some recordings include captives).
- Closure rules installing counted-coup-on cells (see [count-coup](../../../philB/code/transformers/count-coup.md)).
- The blotáhuŋka's command authority over war-party-internal cells, via [military-command-chain-as-modal-composition](../../../../../../../../../../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/triage/military-command-chain-as-modal-composition.md) specialized to the zuya scope.
- The war-akicita's enforcement-authority for war-party discipline.

The revocation morphism is built into the scope-completion structure (cf. [akicita-revocation-at-scope-completion](../../../philB/prose/learning/claims/akicita-revocation-at-scope-completion.md)):

$$\langle X, \texttt{completed}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle Z, \texttt{scope-potential}\rangle = \bot$$
