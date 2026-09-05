---
type: morphism
class: declaration-positing
status: draft
symbol: "\\mathrm{treaty}_{(P_1, P_2, X)}"
depends-on:
  - polity-cell-system
  - oceti-sakowin
  - omniciye-council
  - wicasa-wakhan-office
  - wakhan-as-cell-quality
  - declarations-as-comprehension-positing
realizes: [declaration]
---

# Treaty as wakȟáŋ-bearing declaration

A treaty between Lakota polities and other polities is a *declaration-supporting positing morphism* on the polities' joint substrate.
The morphism installs binding-cells whose stability depends on wakȟáŋ-marking.
The Fort Laramie treaties of 1851 and 1868 are the central instances with the United States; treaty-relations with Cheyenne, Arapaho, and other neighboring polities precede and parallel these.

## The morphism

For two polity-units $P_1, P_2$ and a treaty-content $X$ (a finite list of agreed clauses):

$$\mathrm{treaty}_{(P_1, P_2, X)} : (v^{P_1}, v^{P_2}) \;\longmapsto\; (v^{P_1\prime}, v^{P_2\prime})$$

where:

- $\langle P_1, \texttt{bound-by-treaty-with}, P_2\rangle$ and $\langle P_2, \texttt{bound-by-treaty-with}, P_1\rangle$ settle at $\mathbf{t}$.
- $\langle P_i, \texttt{treaty-clause}, c\rangle$ settles at $\mathbf{t}$ for each clause $c \in X$.
- The signed-witness cells $\langle P_i, \texttt{signed-by}, a\rangle$ settle at $\mathbf{t}$ for each signatory $a$.
- The wakȟáŋ-marking $w_\mathrm{lak}$ on the treaty-cells is set to $1$ iff the ceremonial conditions held during the signing (see below).

## The wakȟáŋ-marking condition

The treaty's binding-cell's wakȟáŋ-marking is the condition that makes it substrate-binding under (Ω3) of $\mathcal{S}_\mathrm{wolak}$ at confederacy scope (cf. [oceti-sakowin](../objects/oceti-sakowin.md)).

For $w_\mathrm{lak}(\texttt{treaty-cell}) = 1$:

1. **Wakȟáŋ-witness present.** A wičháša wakȟáŋ must witness the signing (cf. [wicasa-wakhan-office](../objects/wicasa-wakhan-office.md)).
2. **The pipe was smoked.** The pipe-ceremony (čhaŋnúŋpa) is the substrate-act that wakȟáŋ-marks the resulting cells.
  A treaty unaccompanied by the pipe is not wakȟáŋ-marked regardless of other formalities.
3. **The signing was conducted at confederacy scope.** Treaty-questions are confederacy-scope per (K2) of [omniciye-council](../objects/omniciye-council.md); a signing by individuals or by a lower-scope body does not bind at the polity level the way confederacy-scope wakȟáŋ-witnessed signing does.

The Fort Laramie 1851 and 1868 treaties had all three conditions: the pipe was passed, wičháša wakȟáŋ witnessed, and the signing was the result of confederacy-scope (or close-to-confederacy-scope) council convocation.
They are wakȟáŋ-marked.

The 1877 unilateral congressional act seizing Pȟahá Sápa, by contrast, was a *unilateral* United States operation with no Lakota signatory and no wakȟáŋ-bearing conduct.
It is not a treaty in the substrate-algebraic sense; it is a non-Lakota-polity operation that asserts cells the Lakota polity did not assert.

## Declaration-supporting structure

The treaty-morphism is a *declaration-supporting positing morphism* in the precise sense of [declarations-as-comprehension-positing](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/declarations-as-comprehension-positing.md): the saying *constitutes* the doing.
The substrate-content:

- Before the signing, the treaty-cells $\langle P_i, \texttt{bound-by-treaty-with}, P_j\rangle$ are at $\bot$ (the relation has not been declared).
- The signing-morphism is a positing of these cells at $\mathbf{t}$ accompanied by the institutional/ceremonial conditions (the pipe, the wakȟáŋ-witness).
- The closure-rule subsystem $\mathcal{S}_\mathrm{wolak}$, by (Ω3), recognizes the wakȟáŋ-marked treaty-cells and propagates binding-cells through downstream clauses.

The self-validation: the treaty-cell *is* binding because the polity (through its wakȟáŋ-witnessed council) *declared* it binding.
No external validation is required; no court or higher polity certifies the binding.
The substrate-mechanism is internal to the polities involved.

## Persistent breach and $\top$ at polity scale

When one party breaches the treaty (acts in violation of the wakȟáŋ-marked clauses), the breach is a positing-against-the-treaty-cells.
Two outcomes:

**Case 1: Wakȟáŋ-recognized renegotiation.** If both parties convene wakȟáŋ-bearing council and renegotiate the treaty, the new wakȟáŋ-marked declaration supersedes the old.
The substrate-binding moves to the new cells.

**Case 2: Unilateral breach by a non-wakȟáŋ-marked operation.** If a party (typically the United States) issues a non-wakȟáŋ-bearing act in violation of the treaty (the 1877 Black Hills seizure, the various trust-land takings, the Pick-Sloan dams), the operation *does not* propagate through the wakȟáŋ-conditioned rules.
The wakȟáŋ-marked treaty-cell *persists*; the breaching cells coexist with it; the substrate-state at the cells is $\top$ (contested).

By [contestation-positing-morphism](../../../../../../../../math/theories/categories/theories/predication-categories/morphisms/contestation-positing-morphism.md) and the bilattice's paraconsistency, this $\top$ is *not trivializing*: it does not cause every cell to be contested.
The contested treaty-cell persists at $\top$ indefinitely, recording both the Lakota polity's continuing assertion of the wakȟáŋ-marked binding and the U.S.'s continuing breach.
The contestation is structural, not procedural — it cannot be resolved by any operation that is not itself wakȟáŋ-bearing.

The continuing $\top$ at polity scale is what the Lakota polity's continuing treaty-defense work is about: *holding* the contested cell rather than letting it be resolved-by-default toward the breaching side.
The iyúhá-šni machinery (refusing to accept settlements that would resolve the $\top$ toward the breach) is the structural mechanism.

## The Fort Laramie treaties' substrate-content

The 1851 Fort Laramie treaty established polity-recognition between the United States and the major Plains-nation polities (the Sioux, the Cheyenne, the Arapaho, the Crow, the Shoshone, the Assiniboine, the Mandan-Hidatsa-Arikara, the Pawnee, the Ute).
The treaty's substrate-content was *mutual polity-recognition* plus *specified territorial relations*.
The relevant cells:

- $\langle \mathrm{Lakota}, \texttt{recognized-polity-of}, \mathrm{US}\rangle = \mathbf{t}$, wakȟáŋ-marked.
- $\langle \mathrm{US}, \texttt{recognized-polity-of}, \mathrm{Lakota}\rangle = \mathbf{t}$, wakȟáŋ-marked (from Lakota perspective; the U.S. substrate-marking is more ambiguous).
- $\langle \mathrm{Lakota}, \texttt{kin-relation-with-territory}, T_{1851}\rangle$ for the recognized territory.

The 1868 treaty was the consequential one for Pȟahá Sápa.
It ended Red Cloud's War, closed the Bozeman Trail, established the Great Sioux Reservation (most of present-day western South Dakota, including Pȟahá Sápa), and committed the United States to specific obligations regarding the territory.
The relevant cells:

- $\langle \mathrm{Lakota}, \texttt{kin-relation-with-territory}, T_{1868}\rangle = \mathbf{t}$, wakȟáŋ-marked.
- $\langle \mathrm{Lakota}, \texttt{kin-relation-with}, \mathrm{Paha\text{-}Sapa}\rangle = \mathbf{t}$, wakȟáŋ-marked (this cell was wakȟáŋ-marked long before 1868; 1868 codified its inter-polity recognition).
- $\langle \mathrm{US}, \texttt{obligated-to-protect}, T_{1868}\rangle = \mathbf{t}$, wakȟáŋ-marked from Lakota perspective.

The 1877 unilateral act breached the treaty.
The breach cells coexist at $\top$ with the 1868 wakȟáŋ-marked cells.
The Lakota polity has not at any subsequent point exchanged its wakȟáŋ-marked treaty for a non-wakȟáŋ replacement; the 1868 treaty persists at $\top$ in the substrate.

## Sources

- *Treaty of Fort Laramie (1851)* and *Treaty of Fort Laramie (1868)*, primary texts.
  The 1868 treaty is published in Charles J.
  Kappler, *Indian Affairs: Laws and Treaties* (1904), vol.
  2.
- Edward Lazarus, *Black Hills, White Justice* (1991) — the legal and political history including the 1877 Act and the 1980 Supreme Court ruling.
- Vine Deloria Jr., *Behind the Trail of Broken Treaties* (1974) — the structural mismatch between Lakota and U.S. treaty-conceptions.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century treaty-defense work.
- Joseph M.
  Marshall III, *The Day the World Ended at Little Bighorn* (2007) — Lakota-side narrative including treaty-context.
- Robert Williams Jr., *Linking Arms Together: American Indian Treaty Visions of Law and Peace* (1997) — comparative treaty-tradition analysis including pipe-ceremony as substrate.
