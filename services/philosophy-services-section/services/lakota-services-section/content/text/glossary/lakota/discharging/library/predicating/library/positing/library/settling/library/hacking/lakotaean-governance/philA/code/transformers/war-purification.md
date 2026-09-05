---
type: morphism
class: residue-discharge
status: draft
symbol: "\\mathrm{purify}_w"
depends-on:
  - zuya
  - count-coup
  - wicasa-wakhan-office
  - seven-rites-as-witness-morphisms
  - wakhan-as-cell-quality
realizes: [witness-bearing-morphism]
---

# War-purification

A warrior who killed during a zuya carries a $\top$-residue cell — *requires-war-purification* — that must be discharged before the warrior's substrate-state returns to peacetime-compatible.
The discharge is a multi-stage substrate-operation centered on the *iníkağapi* (sweat-lodge) rite and surrounding conduct.
Without purification, the residue accumulates and the warrior's standing-as-wolakȟota degrades.

## The residue

When a warrior $w$ kills enemy $e$ during a zuya, the following cells fire:

- $\langle w, \texttt{killed-in-war}, e\rangle = \mathbf{t}$ in the zuya-scope.
- $\langle w, \texttt{has-killed-relative-of-relative}\rangle = \top$ on the broader relational substrate (Plains-nation intermarriage means $e$ is, with high probability, kin-of-kin to someone in $w$'s relational network).
- $\langle w, \texttt{requires-war-purification}\rangle = \mathbf{t}$ — the discharge-required cell, wakȟáŋ-marked.

The $\top$ on *has-killed-relative-of-relative* is the structural-source of the requirement: the substrate's relational fabric has been damaged at a kin-of-kin link.
The damage is real even if the killing was zuya-licensed — the relation-cell carries the residue regardless of the justifying-scope.

## The discharge morphism

For warrior $w$ with $\langle w, \texttt{requires-war-purification}\rangle = \mathbf{t}$:

$$\mathrm{purify}_w : v \;\longmapsto\; v'$$

with three substrate-stages:

**Stage 1: Pre-purification withdrawal.** The warrior typically withdraws from camp activity for some period (typically days, sometimes a year) after returning.
The withdrawal-cells fire:

- $\langle w, \texttt{withdrawn-from-camp-activity}\rangle = \mathbf{t}$ temporary.
- $\langle w, \texttt{not-eating-with-family}\rangle = \mathbf{t}$ temporary (the warrior eats separately).
- $\langle w, \texttt{not-touching-children}\rangle = \mathbf{t}$ temporary.

The withdrawal is *self-imposed by the warrior* per the substrate-recognition of the residue's presence; the polity does not enforce it (no coercive cells fire).
It is also wakȟáŋ-bearing: the warrior is in a substrate-state where ordinary engagement would propagate the residue to other cells.
The withdrawal contains the residue.

**Stage 2: Iníkağapi.** A sweat-lodge is conducted by a wičháša wakȟáŋ.
The warrior participates; specific songs are sung; specific prayers are offered.
The substrate-firings:

- $\langle w, \texttt{participates-in-purification-inipi}\rangle = \mathbf{t}$, wakȟáŋ-marked.
- $\langle \texttt{wicasa-wakhan}, \texttt{conducts-purification-rite}\rangle = \mathbf{t}$.
- $\langle w, \texttt{prays-for-killed-enemy-relations}\rangle = \mathbf{t}$, wakȟáŋ-marked.
  (Yes — the warrior prays for the enemy and the enemy's relations as part of the purification.
  The substrate-content: acknowledgment of the kin-fabric damage.)

The iníkağapi fires the *residue-discharge* rule:

$$\langle w, \texttt{requires-war-purification}\rangle = \mathbf{t} \;\wedge\; \langle w, \texttt{participates-in-purification-inipi}\rangle = \mathbf{t} \;\wedge\; w_\mathrm{lak}(\cdot) = 1 \;\Longrightarrow\; \langle w, \texttt{requires-war-purification}\rangle = \bot$$

The discharge-required cell drops to $\bot$ at successful completion of the iníkağapi.

**Stage 3: Re-entry.** Following the iníkağapi (and any additional rites called for by the wičháša wakȟáŋ's reading of the case), the warrior re-engages camp activity.
The substrate-firings:

- $\langle w, \texttt{re-eats-with-family}\rangle = \mathbf{t}$.
- $\langle w, \texttt{re-touches-children}\rangle = \mathbf{t}$.
- $\langle w, \texttt{returns-to-tiyospaye-conduct}\rangle = \mathbf{t}$.

The wakȟáŋ-marking of these re-engagement cells is restored by the iníkağapi's discharge of the residue.

## When purification fails

The discharge can fail in two ways:

**Failure 1: Inadequate rite.** The iníkağapi is conducted but without proper conditions (no wičháša wakȟáŋ, no wakȟáŋ-marked songs, no proper preparation).
The discharge-rule's antecedent's wakȟáŋ-marking-condition fails; the discharge does not fire.
The warrior remains at *requires-war-purification* = $\mathbf{t}$ regardless of the rite-attempt.

**Failure 2: Repeated harms without intervening discharge.** A warrior who kills repeatedly without intervening purification accumulates residue.
The $\top$-cells on relational-substrate compound; the standing-as-wolakȟota cells drop.
In extreme cases, the agent's substrate-state passes a threshold and standing-as-Lakota-conduct drops below polity-recognition — equivalent to a soft loss-of-standing without formal banishment.
Recovery requires extended substrate-restoration work.

This is the structural-content of "war damages the warrior, not just the enemy."
The Lakota polity-form *recognizes* this in its substrate: war-cells fire residue-cells, and the residue-cells require discharge.
The substrate does not treat war as a clean activity.

## Contrast with non-purification traditions

Polity-forms that treat war as a clean activity — that have no *requires-purification* cells firing on their substrate after killing — produce different downstream substrate-states.
Western military forms typically have *no analog* of the residue-discharge requirement; the substrate-content is "the soldier acted under orders, no residue installs."
The continuing literature on PTSD and moral-injury in Western military veterans is, substrate-algebraically, the *external* presentation of residue that the substrate's closure-rule subsystem does not formally recognize.

The Lakota substrate's recognition of war-residue is not unique among Indigenous polity-forms — many Plains, Pueblo, and other traditions have parallel purification-rites for returned warriors.
The Lakota form is one substantive instantiation of the general structural-content: a polity-form whose closure-rule subsystem includes war-residue cells produces a *different downstream substrate-pattern* than a polity-form whose subsystem does not.

The contemporary work of restoring traditional warrior-return rites for Lakota and other Plains-nation veterans (the Black Hills Warriors Run, the traditional return-rites being conducted with veterans of OEF/OIF and other modern conflicts) is substrate-restoration of the discharge-pathway.
The veterans return with $\top$-residue cells that the U.S. military substrate does not recognize; the Lakota substrate's discharge-morphism fires properly to address it.

## Sources

- Walker 1980, *Lakota Belief and Ritual* — recorded purification-rite structure.
- Brown, *The Sacred Pipe* (1953) — iníkağapi structure and purpose.
- John (Fire) Lame Deer, *Lame Deer: Seeker of Visions* (1972) — twentieth-century purification-rite continuity.
- Mark St. Pierre and Tilda Long Soldier, *Walking in the Sacred Manner* (1995) — contemporary purification-rite practice.
- Joseph Marshall III, *Returning to the Lakota Way* (2002) — contemporary warrior-return practice.
- *Wopila* and Black Hills Warriors materials — contemporary Lakota veteran reintegration.
