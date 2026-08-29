---
type: theorem
status: sketch
depends-on:
  - wolakhota-closure-system
  - polity-cell-system
  - oceti-sakowin
  - polity
  - settling-calm-corollary
---

# Wolakȟota satisfies the autarkeia condition

**Statement.** The closure-rule system $\mathcal{S}_\mathrm{wolak}$ on the Lakota polity-cell-system $(E_\mathrm{lak}, \Pi_\mathrm{lak}, \mathcal{C}_\mathrm{lak}, w_\mathrm{lak})$ satisfies the *autarkeia certificate* of [polity](../../../objects/polity.md): for every institutional question internal to the Očhéthi Šakówiŋ (or any constituent oyate or tiyóšpaye), there exists a sequence of $\mathcal{S}_\mathrm{wolak}$-firings that settles the question to a value in $\{\mathbf{t}, \mathbf{f}, \top\}$.
The polity is *self-deciding*: no external closure-rule system is required to settle internal questions.

## Proof sketch

The autarkeia certificate requires *closure-completeness* on internal cells: for every cell in the polity's sub-base, $\mathcal{S}_\mathrm{wolak}$ contains rules that fire to settle the cell.

The seven rule-classes (W1)–(W7) of [wolakhota-closure-system](../objects/wolakhota-closure-system.md) cover the polity's internal cell-classes:

- **Kin-cells** ($\Pi^\mathrm{kin}$): settled by (W1) kin-propagation.
- **Conduct-cells** ($\Pi^\mathrm{con}$): settled by (W2) conduct-evaluation and (W3) kin-obligation.
- **Witness-cells** ($\Pi^\mathrm{wit}$): settled by (W4) witness-bearing.
- **Office-cells** ($\Pi^\mathrm{off}$): settled by (W5) office-installation.
- **Withdrawal-cells** ($\Pi^\mathrm{wdr}$): settled by (W6) withdrawal.
- **Harm/repair-cells**: settled by (W7) restorative.

The other predicate-classes ($\Pi^\mathrm{plc}$, $\Pi^\mathrm{wkn}$, $\Pi^\mathrm{std}$, $\Pi^\mathrm{cov}$) are settled by composition of the above rule-firings: place-relations propagate through kin-rules; wakȟáŋ-relations through witness-rules; standing-relations through conduct-evaluation; covenant-relations through declaration-positing (cf. [treaty-as-wakhan-declaration](../morphisms/treaty-as-wakhan-declaration.md)).

By the [predication-settling CALM corollary](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md), $\mathcal{S}_\mathrm{wolak}$'s Scott-continuity (per [wolakhota-closure-system](../objects/wolakhota-closure-system.md) §"Scott-continuity") makes the resulting settling CALM-stable: positive resolutions are coordination-free confirmable.

The polity-scale variant: a constituent oyate or tiyóšpaye has its sub-base $\mathcal{S}_\mathrm{wolak}|_P$ closure-complete on its own internal cells.
Inter-scope questions (inter-oyate questions for the oyate-scope; inter-division questions for the confederacy-scope) rise to the next scale, but this is *escalation-within-autarkeia*, not loss-of-autarkeia: the rising-scope is also operating under $\mathcal{S}_\mathrm{wolak}$. $\square$

## Failure of external autarkeia-claims

The theorem's converse — that *only* $\mathcal{S}_\mathrm{wolak}$-firings settle the polity's internal questions — is the structural-content of *the polity's rejection of external authority*.
Settler-state operations that purport to settle the polity's internal cells (federal Indian law's authority claims, tribal-government decisions made under non-Lakota statutory frameworks) fire under different closure-rule subsystems and are not $\mathcal{S}_\mathrm{wolak}$-settlements.

The cells those operations produce *coexist* in the multi-observer settling with the polity's own settlement-cells.
When they agree, the merge is benign; when they disagree, the merge is $\top$ — contested.
The Lakota polity's continuing exercise of $\mathcal{S}_\mathrm{wolak}$ on its own internal cells is the substrate-content of *autarkeia exercised under occupation*.

## Significance

The theorem is what underwrites the polity's *constitutive independence*: the polity does not require external recognition to exist.
The continuing settler-state denial of full sovereign-status to the Očhéthi Šakówiŋ — the "domestic dependent nation" framing in U.S. federal Indian law from *Cherokee Nation v.
Georgia* (1831) onward — is a *non-Lakota* substrate-fact and does not affect the polity's internal autarkeia.
The polity decides for itself by $\mathcal{S}_\mathrm{wolak}$; the settler-state's contrary cells are external-substrate-claims that the polity contests at $\top$ rather than accepts.

## Sources

- *Cherokee Nation v.
  Georgia*, 30 U.S. (5 Pet.)
  1 (1831), primary text — establishing the "domestic dependent nation" framing.
- Vine Deloria Jr., *Custer Died for Your Sins* (1969); *Behind the Trail of Broken Treaties* (1974) — the polity's structural-independence against federal-Indian-law's claims.
- Robert Williams Jr., *The American Indian in Western Legal Thought* (1990) — the historical formation of the U.S. legal-theoretic denial.
- Audra Simpson, *Mohawk Interruptus* (2014) — refusal-of-recognition as substrate-act in the structurally-parallel Haudenosaunee case.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century continuing exercise of $\mathcal{S}_\mathrm{wolak}$ under occupation.
