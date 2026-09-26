---
type: theorem
status: sketch
depends-on:
  - treaty-as-wakhan-declaration
  - oceti-sakowin
  - wolakhota-closure-system
  - wakhan-as-cell-quality
  - declarations-as-comprehension-positing
title: Treaty binding iff wakȟáŋ-marked
description: Statement.
---

# Treaty binding iff wakȟáŋ-marked

**Statement.** A treaty-cell $\langle P_1, \texttt{bound-by-treaty-with}, P_2\rangle$ is substrate-binding under $\mathcal{S}_\mathrm{wolak}$ if and only if $w_\mathrm{lak}(\texttt{treaty-cell}) = 1$.

That is: the wakȟáŋ-marking is necessary and sufficient for the treaty-cell to fire the downstream (Ω3) clause-binding rules of [oceti-sakowin](../objects/oceti-sakowin.md).

## Proof sketch

**Sufficient.** If $w_\mathrm{lak}(\texttt{treaty-cell}) = 1$, then (Ω3) of [wolakhota-closure-system](../../../../philA/code/structures/wolakhota-closure-system.md) and of [oceti-sakowin](../objects/oceti-sakowin.md) fires:

$$\langle \Omega, \texttt{great-council-active}\rangle \geq_k \mathbf{t} \;\wedge\; \langle \Omega, \texttt{treaty-with-party-}P\rangle \geq_k \mathbf{t} \;\wedge\; w_\mathrm{lak}(\cdot) = 1 \;\Longrightarrow\; \langle \Omega, \texttt{bound-by-treaty-with}, P\rangle$$

The binding-cell settles at $\mathbf{t}$ at confederacy scope.
By [declarations-as-comprehension-positing](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/declarations-as-comprehension-positing.md), the binding cells then act as declaration-supporting positing morphisms on the treaty's clause-cells: each clause $c$ in the treaty's content has $\langle P_i, \texttt{treaty-clause}, c\rangle$ settle at $\mathbf{t}$ and the closure rules condition downstream cells on this clause-content.

**Necessary.** If $w_\mathrm{lak}(\texttt{treaty-cell}) = 0$, the (Ω3) rule does not fire.
The treaty-cell may be at $\mathbf{t}$ (its content is asserted), but the *binding* downstream rules — those that condition on $w_\mathrm{lak} = 1$ — do not propagate.
The treaty-cell is at $\mathbf{t}$ but is not *binding* in the substrate-sense: it asserts content without producing the binding-cell at confederacy-scope.

This is the structural mechanism by which $\mathcal{S}_\mathrm{wolak}$ distinguishes wakȟáŋ-bearing treaties (substrate-binding) from non-wakȟáŋ agreements (asserted content but not binding at the substrate-rule level). $\square$

## Corollary: the 1877 act is not substrate-binding

The 1877 Act of Congress purporting to seize Pȟahá Sápa was a *non-wakȟáŋ-marked* operation: no Lakota signatory, no pipe ceremony, no wičháša-wakȟáŋ witness, no confederacy-scope omníčiye consent.
Whatever its U.S.-substrate-binding (under $\mathcal{S}_\mathrm{US-stat}$, the U.S. statutory closure-rule subsystem), it is *not* substrate-binding under $\mathcal{S}_\mathrm{wolak}$.

Consequence: the 1868 wakȟáŋ-marked treaty's clause-cells remain at $\mathbf{t}$ and wakȟáŋ-marked under $\mathcal{S}_\mathrm{wolak}$; the 1877 operation's cells are in $\mathcal{S}_\mathrm{US-stat}$'s scope and are *not* binding on the Lakota substrate.
The two assertions coexist at $\top$ at the cells where they overlap.
The polity's persistent assertion of the 1868 treaty's continuing-binding is substrate-correct.

## Corollary: the 1980 settlement is not a substrate-resolution

The 1980 *United States v.
Sioux Nation* settlement was a U.S.-substrate operation under $\mathcal{S}_\mathrm{US-stat}$: it asserted compensation-cells in lieu of land-restoration.
The settlement is *not* a wakȟáŋ-marked Lakota-side operation — no Lakota wakȟáŋ-witness, no confederacy-scope omníčiye consenting to substitute compensation for the kin-cell over Pȟahá Sápa.

By this theorem and by [paha-sapa-kin-cell-resists-property-substitution](paha-sapa-kin-cell-resists-property-substitution.md), the U.S.-substrate operation does not produce a substrate-binding-on-the-Lakota-polity.
The settlement-cells exist on the U.S. side; the Lakota substrate's $\phi_\mathrm{PS}$ kin-cell and the 1868 wakȟáŋ-marked treaty-cells continue.
The Lakota polity's continuing iyúhá-šni from the settlement is the substrate-respecting response.

## Significance

The theorem is the structural-content of "you cannot unilaterally end a wakȟáŋ-marked treaty by non-wakȟáŋ-marked operation."
Treaty-breach by the non-wakȟáŋ side is not treaty-termination; it is *contested-cell-installation* at the cells where the two sides' assertions overlap.
The wakȟáŋ-marked side persists; the non-wakȟáŋ-marked side persists; the conflict is at $\top$ until both sides reach a wakȟáŋ-marked resolution (which the polity has not been offered and would not, under current substrate-conditions, accept).

This explains the substrate-content of "the treaties are still in force."
Not as a rhetorical claim but as a *theorem about which closure-rule operations can affect which cells*.
The 1868 treaty is in force *under $\mathcal{S}_\mathrm{wolak}$*.
No subsequent non-wakȟáŋ-marked operation has removed it.

## Sources

- Charles J.
  Kappler, *Indian Affairs: Laws and Treaties* (1904), vol.
  2 — treaty texts.
- *United States v.
  Sioux Nation of Indians*, 448 U.S. 371 (1980), primary text.
- Edward Lazarus, *Black Hills, White Justice* (1991) — the treaty-breach history.
- Robert Williams Jr., *Linking Arms Together: American Indian Treaty Visions of Law and Peace* (1997) — comparative-treaty-tradition analysis including the pipe-ceremony as substrate.
- Vine Deloria Jr., *Behind the Trail of Broken Treaties* (1974) — substrate-content of treaty-binding from Lakota perspective.
- Estes, *Our History is the Future* (2019) — continuing assertion of the 1868 treaty.
