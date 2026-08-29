---
type: theorem
status: sketch
depends-on:
  - polity-cell-system
  - wolakhota-closure-system
  - oceti-sakowin
  - conflict-of-laws-as-beck-chevalley-failure
  - federation-cohomology-as-mayer-vietoris
  - restorative-retributive-norm-conflict
realizes: [conflict-of-laws-as-beck-chevalley-failure]
---

# The reservation overlay is a Beck–Chevalley failure with restorative-retributive accountability-disposition conflict

**Statement.** The post-1880s reservation period structurally instantiates two predicated-governance theorems simultaneously: (i) [conflict-of-laws-as-beck-chevalley-failure](../../../theorems/conflict-of-laws-as-beck-chevalley-failure.md) on the Lakota-jurisdiction/U.S.-federal-jurisdiction cover, and (ii) [restorative-retributive-norm-conflict](../../../theorems/restorative-retributive-norm-conflict.md) on the resulting accountability-disposition cells.
The substrate-state of the reservation is therefore not a "policy disagreement" but a structural BC failure with cohomologically-computable consequences.
The resolution-paths are blocked because the retributive closure-rules were installed by external authority whose authority-gate the Lakota polity does not hold.

## Setup

Two jurisdictions on the reservation overlap:

- $\mathcal{J}_\mathrm{Lak}$ — the Lakota polity's jurisdiction, with closure-rule system $\mathcal{S}_\mathrm{wolak}$ (cf. [wolakhota-closure-system](../objects/wolakhota-closure-system.md)).
- $\mathcal{J}_\mathrm{US\text{-}fed}$ — the U.S. federal-Indian-law jurisdiction, with closure-rule system $\mathcal{S}_\mathrm{US\text{-}fed}$ encompassing the Major Crimes Act (1885), the Indian Reorganization Act (1934), and subsequent statutory and case-law accretion.

The reservation territory is the overlap:

$$\mathcal{C}_{J_{12}} = \mathcal{C}_{\mathrm{Lak}} \cap \mathcal{C}_{\mathrm{US\text{-}fed}}$$

containing cells on which both subsystems fire: cells about persons resident on the reservation, cells about harm-events occurring there, cells about land relations within reservation boundaries, cells about kin-affiliation and tribal-membership.

## Statement and proof

(a) **The reservation BC square fails.** Per [conflict-of-laws-as-beck-chevalley-failure](../../../theorems/conflict-of-laws-as-beck-chevalley-failure.md), failure of BC on $J_{12}$ is the substrate-content of conflict-of-laws.
The Lakota-path and the U.S.-federal-path through the inter-jurisdictional BC square produce non-isomorphic cell-patterns on the overlap.

Specific instances of non-isomorphism:

- *Harm-cell consequents*: $\mathcal{S}_\mathrm{wolak}$'s (W7) fires *relation-requires-repair* and *owes-repair-to* cells. $\mathcal{S}_\mathrm{US\text{-}fed}$'s criminal-law subsystem fires *owes-sanction*, *confined-for*, *criminal-record-cell* cells.
  The BC square's two paths produce these different cell-sets on the same harm-event.
- *Membership-cell consequents*: $\mathcal{S}_\mathrm{wolak}$'s membership-cells (cf. [tiyospaye](../objects/tiyospaye.md), [oyate](../objects/oyate.md)) settle through kinship-conduct.
  The $\mathcal{S}_\mathrm{US\text{-}fed}$'s blood-quantum and enrollment-roll cells settle through statutory definition.
  The two paths through the membership-BC give non-isomorphic membership-patterns.
- *Land-relation cells*: $\mathcal{S}_\mathrm{wolak}$'s $\Pi^\mathrm{plc}$ kin-cells (per [paha-sapa-kin-cell](../objects/paha-sapa-kin-cell.md)). $\mathcal{S}_\mathrm{US\text{-}fed}$'s allotment-statute, fee-simple, trust-land property-cells.
  The two paths give incompatible land-class assignments.

By statement (a) of the conflict-of-laws theorem, the BC failure is the precise substrate-algebraic content of "the two legal systems conflict on the reservation."

(b) **The accountability-disposition cells go to $\top$.** Per [restorative-retributive-norm-conflict](../../../theorems/restorative-retributive-norm-conflict.md), when both restorative and retributive accountability norms fire on the same harm-event, the accountability-disposition cell settles at $\top$:

$$\langle V, \texttt{accountability-disposition}\rangle = \mathbf{t} \vee_K \mathbf{f} = \top$$

On the reservation: every harm-event produces (W7) restorative-process firing from $\mathcal{S}_\mathrm{wolak}$ *and* retributive-sanction firing from $\mathcal{S}_\mathrm{US\text{-}fed}$.
The accountability-disposition is over-determined.

(c) **The resolution paths are blocked.** The three resolution paths for the accountability-disposition conflict — adjudication, norm-revision, visible automorphism — are constrained:

- **Adjudication**: provisional.
  Federal courts and tribal courts can each adjudicate individual cases (federal courts under $\mathcal{S}_\mathrm{US\text{-}fed}$; tribal courts under a constrained subset of $\mathcal{S}_\mathrm{wolak}$).
  Each case-adjudication moves *that case's* disposition cell off $\top$, but new harm-events re-trigger the collision.
- **Norm revision** — removing the retributive norms from $\mathcal{S}_\mathrm{US\text{-}fed}$ — requires the U.S. federal authority-gate.
  The Lakota polity does not hold this gate.
  The path is *structurally* unavailable to the polity.
- **Visible automorphism** — restructuring the joint normative system — requires both polities' authority.
  The Lakota polity has its $\mathcal{S}_\mathrm{wolak}$; it does not have authority over $\mathcal{S}_\mathrm{US\text{-}fed}$.

By restorative-retributive theorem, this is the substrate-algebraic content of *legal pluralism under colonial constraint*: the resolution is blocked by authority-gate restrictions the polity does not control.

(d) **The federation-level $H^1$ obstruction is non-trivial.** By [federation-cohomology-as-mayer-vietoris](../../../theorems/federation-cohomology-as-mayer-vietoris.md), the BC failure contributes a non-trivial class in $H^0(\mathcal{F}^{J_{12}})$.
The class lifts to a federation-level $\delta$-image $H^1(\mathcal{F}^{J_\mathrm{tot}})$ obstruction when it is not in the image of the cohomological difference map — when no constituent pair $(\alpha_\mathrm{Lak}, \alpha_\mathrm{US})$ collectively realizes the overlap-content.

For the reservation overlap, several BC-failure-induced classes are *demonstrably* outside the constituent-pair image:

- The kin-cell over Pȟahá Sápa is in $\Pi^\mathrm{plc}$ at the $\mathcal{S}_\mathrm{wolak}$ side.
  There is no $\mathcal{S}_\mathrm{US\text{-}fed}$-side cell in the *same predicate-class* — the U.S. side only has $\Pi^\mathrm{off}$ property-cells over the same place.
  No constituent pair $(\alpha_\mathrm{Lak}, \alpha_\mathrm{US})$ can collectively present a class living solely in $\Pi^\mathrm{plc}$ — the U.S. side lacks the predicate-class.
  By [paha-sapa-kin-cell-resists-property-substitution](paha-sapa-kin-cell-resists-property-substitution.md), no cross-class conversion morphism in $\mathcal{S}_\mathrm{wolak}$ can collapse this gap.
- The restorative-disposition cells on (W7) firings have no counterpart in $\mathcal{S}_\mathrm{US\text{-}fed}$.
  The U.S. criminal-law subsystem does not contain relation-repair-cell-firing rules.
  The constituent pair cannot realize the (W7)-class through the U.S. constituent alone.

Each of these is a federation-level $H^1$ class — the substrate-content of *"there is overlap-content the constituents cannot jointly express."* The federation-level adjudication burden is the *cokernel of the difference map* (per (d) of the federation-cohomology theorem) and is *non-trivial and persistent*.

(e) **Temporal-BC failure produces retroactivity conflict.** Per (e) of [conflict-of-laws-as-beck-chevalley-failure](../../../theorems/conflict-of-laws-as-beck-chevalley-failure.md), when the BC failure is in the temporal direction, retroactivity conflicts arise.
On the reservation: the temporal-BC is in *permanent permissive failure*.
Pre-1880s events are judged by $\mathcal{S}_\mathrm{wolak}$ from the Lakota side; the same events are reframed retrospectively under $\mathcal{S}_\mathrm{US\text{-}fed}$ by the federal-judicial overlay.
The 1868 treaty is judged binding under $\mathcal{S}_\mathrm{wolak}$ (it is, per [treaty-binding-iff-wakhan-marked](treaty-binding-iff-wakhan-marked.md)); the same treaty is judged terminated under $\mathcal{S}_\mathrm{US\text{-}fed}$'s post-1877 framework.
The temporal-BC failure makes "what was the case" itself BC-failed.

## Cohomological signature

The reservation overlay's cohomological signature is computable via the federation-cohomology Mayer–Vietoris sequence.
The substantive content:

- $H^0(\mathcal{F}^{J_\mathrm{tot}})$ — facts both polities agree on (e.g., specific geographic boundaries set by treaty, specific dated events).
  Small.
- $H^0(\mathcal{F}^{J_\mathrm{Lak}}) \oplus H^0(\mathcal{F}^{J_\mathrm{US}})$ — facts the constituents assert from their own sides.
  Large.
- $H^0(\mathcal{F}^{J_{12}})$ — facts on the overlap.
  The cokernel of the difference map is the structurally-irresolvable substrate.
- $H^1(\mathcal{F}^{J_\mathrm{tot}})$ — federation-level obstructions.
  The connecting-homomorphism image is the *adjudication burden* the federation cannot resolve through either constituent.
  Large and persistent.

By the [four-regime dichotomy](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), the merged settling on the reservation overlap is in the *transfinite-bounded or aperiodic* regime: the closure-rule subsystems' interaction produces non-Scott-continuous firings (each new harm-event re-triggers the entire (b)-mechanism; the cohomology grows as cases accumulate).

This is structurally different from peacetime $\mathcal{S}_\mathrm{wolak}$ alone, which lives in the strict or Scott-continuous regime.
The reservation has *lifted the polity into a higher cohomological regime* by the imposition of the overlapping system.

## What this entails for resolution strategies

The structural diagnosis suggests which resolution-strategies engage the substrate and which do not:

**Strategies engaging the substrate:**

- Tribal-court reform — moving more adjudication into tribal-court settings firing $\mathcal{S}_\mathrm{wolak}$-tier rules, narrowing the overlap by contraction of $\mathcal{S}_\mathrm{US\text{-}fed}$'s reach.
- Treaty-defense litigation — keeping the wakȟáŋ-marked 1868 treaty cells visible in $\mathcal{S}_\mathrm{wolak}$ and contesting attempts to *de-mark* them.
- LandBack — restoration of $\Pi^\mathrm{plc}$ kin-cells over places, *not* as property-substitution but as direct $\mathcal{S}_\mathrm{wolak}$-firing.
- Restorative-justice reforms within tribal jurisdiction — reactivating (W7) firings on cases the federal system would otherwise route to retributive disposition.

**Strategies not engaging the substrate:**

- Pure procedural reform (better attorneys, more federal funding for tribal courts) — these move adjudication but do not resolve the BC failure.
- Monetary compensation (the $1.9B Pȟahá Sápa offer is the central instance) — these are cross-predicate-class substitutions that the substrate algebra disallows.
- "Self-determination" framed as expanded operation within $\mathcal{S}_\mathrm{US\text{-}fed}$ — these expand the U.S. constituent's role without contracting $\mathcal{S}_\mathrm{US\text{-}fed}$'s firing on the overlap; the BC failure remains.

## Significance

The reservation is not a legal jurisdiction in the standard Western sense.
It is the *site of a persistent Beck–Chevalley failure between two closure-rule subsystems* with one constituent (the Lakota polity) blocked from the standard resolution-paths because it does not hold the authority-gate over the other constituent's rule-set.
The structural-algebraic content of the reservation-situation is precisely what the predication-categories framework's BC-failure and restorative-retributive-conflict theorems compute.

Contemporary substrate-restoration work — language revitalization, ceremony reclamation, treaty-defense, tribal-court reform, LandBack — is not "reform" in the procedural sense.
It is the polity's continuing exercise of $\mathcal{S}_\mathrm{wolak}$ on its own jurisdiction, slowly contracting the overlap on which the BC failure lives.

## Sources

- *Cherokee Nation v.
  Georgia*, 30 U.S. (5 Pet.)
  1 (1831) — establishment of the "domestic dependent nation" framework that institutes the BC failure.
- *Major Crimes Act*, 23 Stat.
  385 (1885) — federal-criminal subsystem imposition.
- *Indian Reorganization Act*, 25 U.S.C. §§ 461 et seq.
  (1934) — IRA tribal-government overlay.
- Charles Wilkinson, *American Indians, Time, and the Law* (1987) — federal-Indian-law's structural framework.
- Robert Williams Jr., *Like a Loaded Weapon* (2005) — the federal-Indian-law's continuing structural injustices.
- Audra Simpson, *Mohawk Interruptus* (2014) — comparative analysis of refusal-of-recognition under similar conditions.
- Estes, *Our History is the Future* (2019) — twentieth- and twenty-first-century continuing exercise of $\mathcal{S}_\mathrm{wolak}$ under the overlay.
- Glenn Coulthard, *Red Skin, White Masks* (2014) — structural critique of recognition-based politics under similar substrate-conditions.
