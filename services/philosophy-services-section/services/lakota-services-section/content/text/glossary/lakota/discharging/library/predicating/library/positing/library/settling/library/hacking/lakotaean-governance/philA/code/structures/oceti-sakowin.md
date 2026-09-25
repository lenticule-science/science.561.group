---
type: definition
class: confederation
status: draft
symbol: "\\Omega"
depends-on:
  - polity-cell-system
  - oyate
  - wolakhota-closure-system
realizes: [polity]
title: Očhéthi Šakówiŋ
description: "The Očhéthi Šakówiŋ — Seven Council Fires — is the full Lakota/Dakota/Nakota confederacy: seven divisions, each composed of one or more oyate, sharing a constituent council that meets when matters of national concern arise."
---

# Očhéthi Šakówiŋ

The *Očhéthi Šakówiŋ* — Seven Council Fires — is the full Lakota/Dakota/Nakota confederacy: seven divisions, each composed of one or more oyate, sharing a constituent council that meets when matters of national concern arise.
The seven divisions:

1. **Mdewákhaŋthuŋwaŋ** (Mdewakanton) — Eastern Dakota
2. **Waȟpékhute** (Wahpekute) — Eastern Dakota
3. **Waȟpéthuŋwaŋ** (Wahpeton) — Eastern Dakota
4. **Sisíthuŋwaŋ** (Sisseton) — Eastern Dakota
5. **Iháŋkthuŋwaŋ** (Yankton) — Western Dakota / Nakota
6. **Iháŋkthuŋwaŋna** (Yanktonai) — Western Dakota / Nakota
7. **Tȟitȟúŋwaŋ** (Teton) — Lakota (the seven oyate of the western division)

The Tȟitȟúŋwaŋ is the largest division and itself a confederation of seven oyate (see [oyate](oyate.md)); the four-times-four-times-… structure recurs at scales.

## Constituent predications

The Očhéthi Šakówiŋ entity $\Omega \in E^\mathrm{pol}_\mathrm{lak}$ carries:

- $\langle \Omega, \texttt{division-member}, D_i\rangle$ for each of the seven divisions $D_1, \ldots, D_7$.
- $\langle \Omega, \texttt{council-fire-place}, p_i\rangle$ for each division's council-fire location; the seven fires give the confederacy its name.
- $\langle \Omega, \texttt{constituent-power}, C_\Omega\rangle$ where $C_\Omega$ is the cosmogonic-and-historical founding: see §"Constituent power" below.
- $\langle \Omega, \texttt{great-council-active}\rangle$ — the cell that fires when the seven-divisions great council is in session.
- $\langle \Omega, \texttt{paha-sapa-kin}\rangle$ — the kin-cell between the people and Pȟahá Sápa (the Black Hills); structurally constitutive (the people's standing as a people is grounded in the kin-relation to Pȟahá Sápa).
  See [paha-sapa-kin-cell](../../../philB/code/structures/paha-sapa-kin-cell.md).

## Closure rules

Six confederacy-scoped rules in $\mathcal{S}_\mathrm{wolak}$:

**(Ω1) Aggregation.** $\bigwedge_i \langle \Omega, \texttt{division-member}, D_i\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle \Omega, \texttt{exists}\rangle \geq_k \mathbf{t}$.
The confederacy exists when the seven divisions recognize the confederacy and each other.
The aggregation is a conjunctive cell: lapse of one division-cell does not collapse the confederacy entirely (the historical Dakota-Sioux War of 1862, after which the four eastern Dakota divisions were expelled from Minnesota and partially reconstituted elsewhere, was the closest the confederacy came to (Ω1)-collapse).

**(Ω2) Great council convocation.** Conditions for convening (treaty negotiation, joint war, cosmological emergency) settle $\langle \Omega, \texttt{great-council-active}\rangle$ at $\mathbf{t}$.
The great council was rare even before settler disruption — convening it was a polity-scale event.

**(Ω3) Treaty-bearing.** $\langle \Omega, \texttt{great-council-active}\rangle \geq_k \mathbf{t} \;\wedge\; \langle \Omega, \texttt{treaty-with-party-}P\rangle \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(\cdot) = 1 \;\Longrightarrow\; \langle \Omega, \texttt{bound-by-treaty-with}, P\rangle$ settles.
The wakȟáŋ-marking is essential: a treaty is binding *as wakȟáŋ-bearing declaration* (cf. [treaty-as-wakhan-declaration](../../../philB/code/transformers/treaty-as-wakhan-declaration.md)).

**(Ω4) Inter-division kinship.** $\langle a, \texttt{married-to}, b\rangle \;\wedge\; a \in \mathrm{pop}(D_i)\;\wedge\; b \in \mathrm{pop}(D_j) \;\Longrightarrow\; \langle D_i, \texttt{kin-with-division}, D_j\rangle$.
Inter-division kinship is the structural glue of the confederacy.
The (Ω4) rule fires Scott-continuously as marriages accumulate.

**(Ω5) Pȟahá Sápa kin-marking.** The $\langle \Omega, \texttt{paha-sapa-kin}\rangle$ cell is wakȟáŋ-marked by the seven rites' practice in the Black Hills.
The rule: $\langle \Omega, \texttt{ceremony-conducted-at-paha-sapa}\rangle \geq_k \mathbf{t} \;\Longrightarrow\; w_\mathrm{lak}(\texttt{paha-sapa-kin}) = 1$.
The kin-cell's wakȟáŋ-marking is sustained by continuing ceremonial practice.

**(Ω6) Confederation-scale wicozani.** The confederacy is in wicozani at $\tau$ when the per-division wicozani conditions hold *and* the inter-division kinship structure has not persistent contradictions.
The (Ω6) rule aggregates the per-division wicozani-cells into the polity-scale wicozani-cell; see [wicozani-as-quiescence](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/wicozani-as-quiescence.md) §"Polity scale."

## Constituent power

The Očhéthi Šakówiŋ's constituent power $C_\Omega$ has two components:

**Cosmogonic component.** The relational substrate the confederacy operates on is Íŋyaŋ-emptied-into-everything.
The constituent power *as substrate-shape* is the cosmogonic founding — the always-present substrate-condition Íŋyaŋ's self-emptying produced.
The polity is not constituted by a specific historical contract; it is constituted by the structure of the relational cosmos.

**Historical component.** The seven divisions' specific historical organization — the seven-fires confederacy as a named, recognized political structure — has a historical-founding date that pre-dates documented Lakota history and was already in place at first European contact in the seventeenth century.
The historical-component of $C_\Omega$ is the *recognition-cells* among the seven divisions that the confederacy is the configuration of their relations.

The two components together: the cosmogonic substrate is always-present; the historical confederation is the people's continuing recognition of how to organize themselves on that substrate.
The confederation is "founded" by a continuing act of recognition, not by a single founding moment.

## Autarkeia under occupation

The Očhéthi Šakówiŋ's full pre-occupation autarkeia included questions of war, peace, treaty, jurisdiction over allies and dependents, ceremonial calendar, hunt-coordination across the Plains.
The post-1880 forced-reservation period drastically restricted the confederacy's *exercisable* autarkeia: settler-state powers asserted jurisdiction over war, treaty (or refused to honor treaties), hunt (by exterminating the buffalo), and ceremony (by criminalizing the seven rites).

The *substrate* autarkeia continued: the closure-rule subsystem $\mathcal{S}_\mathrm{wolak}$ at confederacy-scale did not vanish from the cells; the confederation's recognition-of-itself persisted.
The *exercise* of autarkeia was suppressed.
The substrate-content of the continuing struggle (treaty-defense, language and ceremony reclamation, LandBack, the Standing Rock NoDAPL stand of 2016, the current Pȟahá Sápa reclamation initiatives) is the polity *re-exercising* autarkeia that has been continuously substrate-present.

This is the structural content of "we are still here."
The confederacy did not stop existing; its exercise was constrained.
The substrate-algebra distinguishes existence-of-the-cells from exercisability-of-the-rules; both are real; only the second is what the settler-state could (partially, temporarily) suppress.

## Inter-polity relations

The confederacy's relations with other polities — neighboring Indigenous polities (Cheyenne, Arapaho, Crow, Pawnee, Mandan, Hidatsa, Arikara, others), the United States, Canada — are settled via:

- **Treaty** ([treaty-as-wakhan-declaration](../../../philB/code/transformers/treaty-as-wakhan-declaration.md)) for ceremonially-binding covenants.
  The 1851 and 1868 Fort Laramie treaties are the central instances with the United States.
- **Diplomatic visit and gift exchange** (the substrate-form of recognition between sovereigns) for ongoing relations.
- **War** (the bounded akicita-scope at confederacy-scale) for hostilities.
- **Adoption** (huŋkápi at polity-scale) for incorporation of allies or dependents.

The substrate distinguishes treaty-relations (wakȟáŋ-marked) from non-treaty agreements (not wakȟáŋ-marked).
The latter can be made or broken; the former cannot, structurally — see [treaty-binding-iff-wakhan-marked](../../../philB/prose/learning/claims/treaty-binding-iff-wakhan-marked.md).
The settler-state's pretension to have *terminated* the 1868 treaty by the 1877 unilateral act and the 1980 Supreme Court ruling is a *non-wakȟáŋ-marked operation* on a wakȟáŋ-marked cell — substrate-algebraically, the operation does not propagate, and the wakȟáŋ-marked treaty-cell persists.

## Sources

- Walker 1980, 1982, 1983 — recorded confederation-scale structure.
- Estes, *Our History is the Future* (2019) — confederation-scale continuing political life.
- Vine Deloria Jr., *Custer Died for Your Sins* (1969); *We Talk, You Listen* (1970); *Behind the Trail of Broken Treaties* (1974) — the confederacy's twentieth-century legal-political situation.
- Edward Lazarus, *Black Hills, White Justice* (1991) — confederation-scale treaty-defense and the 1980 Supreme Court ruling.
- *We Are the Land*, ed. Damon Akins and William Bauer Jr. (UC Press, 2021) — pan-Indigenous polity-history context.

## Earlier material

- $\langle \Omega, \texttt{division-member}, D_i\rangle$ for each of the seven divisions $D_1, \ldots, D_7$.
- $\langle \Omega, \texttt{council-fire-place}, p_i\rangle$ for each division's council-fire location; the seven fires give the confederacy its name.
- $\langle \Omega, \texttt{constituent-power}, C_\Omega\rangle$ where $C_\Omega$ is the cosmogonic-and-historical founding: see §"Constituent power" below.
- $\langle \Omega, \texttt{great-council-potential}\rangle$ — the cell that fires when the seven-divisions great council is in session.
- $\langle \Omega, \texttt{paha-sapa-kin}\rangle$ — the kin-cell between the people and Pȟahá Sápa (the Black Hills); structurally constitutive (the people's standing as a people is grounded in the kin-relation to Pȟahá Sápa).
  See [paha-sapa-kin-cell](../../../philB/code/structures/paha-sapa-kin-cell.md).

**(Ω3) Treaty-bearing.** $\langle \Omega, \texttt{great-council-potential}\rangle \geq_k \mathbf{t} \;\wedge\; \langle \Omega, \texttt{treaty-with-party-}P\rangle \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(\cdot) = 1 \;\Longrightarrow\; \langle \Omega, \texttt{bound-by-treaty-with}, P\rangle$ settles.
The wakȟáŋ-marking is essential: a treaty is binding *as wakȟáŋ-bearing declaration* (cf. [treaty-as-wakhan-declaration](../../../philB/code/transformers/treaty-as-wakhan-declaration.md)).

- **Treaty** ([treaty-as-wakhan-declaration](../../../philB/code/transformers/treaty-as-wakhan-declaration.md)) for ceremonially-binding covenants.
  The 1851 and 1868 Fort Laramie treaties are the central instances with the United States.
- **Diplomatic visit and gift exchange** (the substrate-form of recognition between sovereigns) for ongoing relations.
- **War** (the bounded akicita-scope at confederacy-scale) for hostilities.
- **Adoption** (huŋkápi at polity-scale) for incorporation of allies or dependents.
