---
type: morphism
class: witness-bearing-honor-installation
status: draft
symbol: "\\mathrm{coup}_{(w, e, g)}"
depends-on:
  - polity-cell-system
  - zuya
  - wakhan-as-cell-quality
  - four-bilattice
  - twist-product
realizes: [witness-bearing-morphism, honor-installation]
---

# Count coup

The counting-coup morphism installs honor-cells on a warrior $w$ for demonstrated bravery against an enemy $e$ during a zuya, in one of four ranked grades.
The morphism is the polity's primary honor-substrate-installation: it is what produces a warrior's standing as a fighter.
The structurally distinguishing feature: *touching the living enemy without killing them is the highest grade*.
Killing is honored but is lower than the first coup.

The bilattice-residue argument for the ordering — why the polity ranks demonstrated-bravery-without-killing above lethal-conduct — is the substantive content of this entry.

## The morphism

For a warrior $w$, an enemy $e$, a grade $g \in \{1, 2, 3, 4\}$, and a witness-set $W = \{w_1, \ldots, w_k\}$ of war-party members who observed the act:

$$\mathrm{coup}_{(w, e, g, W)} : v \;\longmapsto\; v'$$

with effects:

- $\langle w, \texttt{counted-coup-on-grade-}g, e\rangle \geq_k \mathbf{t}$, wakȟáŋ-marked when the witness-set includes a wakȟáŋ-bearing war-party member (typically yes; war-parties include blotáhuŋka and akicita-leaders whose presence supplies wakȟáŋ-witness).
- $\langle w_i, \texttt{witnessed-coup-by}, w\rangle \geq_k \mathbf{t}$ for each $w_i \in W$, recording the witnessing-substrate.
- $\langle w, \texttt{honor-grade}\rangle$ rises in $\leq_k$ proportionate to $g$.
- The warrior gains right-to-cells: $\langle w, \texttt{wears-feather}\rangle$ at specific feather-types corresponding to $g$, $\langle w, \texttt{sings-coup-song}\rangle$ at the gatherings, $\langle w, \texttt{counts-coup-at-council}\rangle$ during omníčiye when prior-act recounting is appropriate.

The morphism is a [yuhápi](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/yuhapi.md) witness-bearing morphism: the witnesses *carry* the coup forward as a substrate-record.
Without witnesses, the coup-cell does not install at full strength (a coup claimed without witnesses settles at lower $\leq_k$-value than a witnessed coup).

## The four grades

The grades, in descending honor:

| Grade $g$ | Act | Honor-cell content |
|---|---|---|
| 1 | Touched living enemy with hand or coup-stick | First coup; the highest honor a warrior can earn |
| 2 | Touched living enemy second, after another had counted first | Second coup; still substantial |
| 3 | Touched living enemy third | Third coup |
| 4 | Touched living enemy fourth | Fourth coup |

Killing the enemy fires a *separate* cell — $\langle w, \texttt{killed-in-war}, e\rangle$ at $\mathbf{t}$ — which is its own honored act but is *not* a coup-cell.
The structural ordering: a warrior who touched the living enemy is honored above a warrior who killed without touching.
A warrior who *both* touched (grade 1) and killed the same enemy receives both cells; the touching is higher.

Specific war-honors decorate the warrior's persistent appearance: an eagle-feather with notch for first-coup, two notches for the same enemy's second-coup, red-painted for killed-but-not-counted, and various symbol-cells the polity reads at sight.

## The bilattice-residue argument: why touching > killing

The polity's structural commitment that coup-on-living outranks killing is *not* an arbitrary virtue-preference.
It tracks a precise bilattice-residue calculation.

Consider the cell-effects of the two acts on the relational substrate:

**Touching the living enemy (grade 1 coup) installs:**

- $\langle w, \texttt{counted-coup-on}, e\rangle = \mathbf{t}$ — honor-cell, *no paired-harm-cell*.
- Witness-cells across the war-party recording the act.
- No firing on the relation-cells between the polities (the act demonstrates engagement but does not install severance).

The residue in the substrate is *clean*: the honor-cell is at $\mathbf{t}$ with no $\top$-content produced anywhere on the broader relational substrate.
The Klein-four orbit of the coup-cell is contained — $\sim$-negation, $-$-conflation give predictable companion-cells (did-not-count-coup-on, possible-but-uncertain-coup), none of which is at $\top$.

**Killing the enemy in war installs:**

- $\langle w, \texttt{killed-in-war}, e\rangle = \mathbf{t}$ in the war-scope — honored.
- *Paired with* a harm-cell: $\langle w, \texttt{has-killed-relative-of-relative}\rangle$, which fires at $\top$ on the broader relational substrate because Plains-nation intermarriage means the enemy $e$ is, with high probability, kin-of-kin to someone in the war-party's wider relational network.
- A *purification-required* cell: $\langle w, \texttt{requires-war-purification}\rangle = \mathbf{t}$, which fires the inípi (sweat-lodge) and additional rite-cells.
- Possible firing on inter-polity relation-cells: the killing accumulates with prior killings to push the inter-polity-relation cell toward $\top$.

The residue in the substrate is *not clean*: the honor-cell at $\mathbf{t}$ is paired with downstream $\top$-cells and purification-required cells.
The Klein-four orbit includes a $-$-conflation move ($\bot \mapsto \top$) on the killed-cell that lifts undetermined cells (was-it-justified, did-the-enemy-have-kin-here) into contested status; these don't resolve without ceremonial work.

**The polity's structural preference**: the polity prefers cells that install *clean honor-residue* over cells that install *honor-paired-with-substrate-contamination*.
The coup-cell is clean; the kill-cell is contaminated.
The honor-ordering coup > kill *is* the bilattice-residue accounting.

The polity could have made a different choice.
Some polities do: a polity that prioritizes lethal-conduct as the highest honor is making a different bilattice-preference, accepting the $\top$-residue as the price of the kill-honor.
The Lakota polity makes the cleaner choice, and the polity-form that results — warriors competing for demonstrated bravery rather than body-count — is the downstream substrate-consequence.

## Counting coup at council

A warrior who has counted coups recounts them at the omníčiye, at gatherings, at namings.
The recounting fires the witness-cells forward in time: each retelling renews $\langle w_i, \texttt{witnessed-coup-by}, w\rangle$ at $\mathbf{t}$ on the audience.
The honor-cell is sustained by *continuing recitation* — it is not a permanent fact installed once but a wakȟáŋ-bearing substrate-fact maintained by continuing yuhápi-bearing.

When the warrior dies, the coups remain in the polity's substrate-memory through the winter-counts (waniyetu-iyawapi) and through the recounting of the named-deceased's deeds at the wanáǧi yuhápi keeping-of-the-soul rite.
The honor-substrate persists into the ancestor-relation.

## What kills-without-coup looks like

A warrior who only kills, never touching the living enemy first, accumulates kill-cells without coup-cells.
Such a warrior is honored for the killing but does not achieve the highest standing-as-wóohitika cells.
The polity's substrate distinguishes them from the high-coup-grade warriors; the distinction is visible at council (different feathers worn) and in the polity's recounting.

Conversely, a warrior who touches multiple living enemies without ever killing accumulates high coup-cells and very high standing-as-wóohitika.
Crazy Horse (Tȟašúŋke Witkó) is the iconic historical figure here — his recorded coup-count was extensive; his kill-count, while real, is not the substrate-fact that grounds his standing in the polity's continuing memory.

## The contemporary continuation

Counting-coup as a substrate-operation does not require a war-party scope to fire.
Contemporary substrate-instances:

- Demonstrated-bravery without harm: e.g., the Standing Rock water protectors' direct-action conduct against the militarized police line.
  The conduct fires honor-cells in the polity's substrate substantially similar to coup-cells.
- The conduct of AIM-era warriors in non-lethal civil-disobedience actions, the Pine Ridge-era patrols, the contemporary LandBack actions.

The structural-content: the polity's preference for demonstrated-bravery-without-lethal-conduct produces a substrate-form in which contemporary direct-action work *can* be honored at the same substrate-level as historical coup-counting — the same morphism fires when the substrate-conditions are met.

## Sources

- Stanley Vestal, *Sitting Bull, Champion of the Sioux* (1932) — Húŋkpapȟa material with detailed coup-counting recording.
- Joseph Marshall III, *The Day the World Ended at Little Bighorn* (2007) and *The Journey of Crazy Horse* (2004) — Lakota-side narratives with coup-counting content.
- George Bird Grinnell, *The Fighting Cheyenne* (1915) — comparable Plains-nation coup-counting practice.
- Walker 1982, *Lakota Society* — coup-counting in the polity's social structure.
- John Stands in Timber and Margot Liberty, *Cheyenne Memories* (1967) — comparable Plains-nation tradition with extensive coup-detail.
- Pekka Hämäläinen, *Lakota America* (2019) — coup-counting as polity-substrate-practice.
- Estes, *Our History is the Future* (2019) — contemporary continuation of the honor-substrate.
