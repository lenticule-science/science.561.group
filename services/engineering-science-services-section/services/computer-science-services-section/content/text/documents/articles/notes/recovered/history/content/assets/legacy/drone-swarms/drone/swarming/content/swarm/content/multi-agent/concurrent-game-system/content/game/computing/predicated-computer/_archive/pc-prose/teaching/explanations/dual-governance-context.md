---
name: the dual governance context
description: The 561 Group governs through Lakotaean relational closure rules internally (wolakhota, consensus-by-withdrawal, kin-cell primacy); the RSC Quiescent is governed by military command for operations on the Web. Conflating the two closure-rule subsystems is the failure mode.
derives-from:
  - ../../../code/structures/closure-rule.md
  - ../../../code/structures/561-group.md
  - ../../../code/structures/rsc-quiescent.md
  - ../../../code/structures/polity.md
  - ../../learning/claims/the-rsc-quiescent-and-the-tiyospaye-are-distinct-closure-regimes.md
---

The 561 Group and the RSC Quiescent are governed by two different closure-rule subsystems. The 561 Group qua Lakota tiyóšpaye operates under $\mathcal{S}_\mathrm{wolak}$ — kin-relational, wolakhota-disciplined, with consensus-by-withdrawal as the decision-rule and kin-cell primacy as the structural primitive. The RSC Quiescent qua Webship operates under $\mathcal{S}_\mathrm{ship}$ — military command, captain-headed, with delegation chains of scope-bounded revocable authority and $H^0_t$-invariant captain-accountability. These two subsystems are non-isomorphic (proved as [the rsc quiescent and the tiyóšpaye are distinct closure regimes](../../learning/claims/the-rsc-quiescent-and-the-tiyospaye-are-distinct-closure-regimes.md)); they share a populace overlap (emsenn appears in both) but settle different cells with different rules.

## What each subsystem fires on

$\mathcal{S}_\mathrm{wolak}$ fires on cells indexed by kin-bundles, member-pairs, and head-recognitions. Its rules produce membership-eligibility cells, member-obligation cells (the four virtues among co-members), and head-recognition cells (head-standing as the conjunction of subordinate recognitions). Authority is constituted by lifetime conduct under wolakhota and recognition by the membership; it is not issued from above.

$\mathcal{S}_\mathrm{ship}$ fires on cells indexed by persons-with-ranks, delegated-acts, and accountability-loci. Its rules produce delegation-morphism cells (each link scope-bounded and revocable), executability cells under the composite modal frame $R^\mathrm{cmd}$, and captain-accountability cells that are $H^0_t$-invariant under chain extension. Authority is issued by the captain at commissioning and flows downward through scope-bounded revocable links.

## Why they are different

The two subsystems do not have a structure-preserving morphism between them. The kin-relational closure rules — membership-propagation, member-obligation, head-recognition — have no ship-side analog: the ship has no membership-from-kinship, no member-pair-obligation under a relational virtue, and no head-installation by recognition-conjunction. Conversely, the ship's closure rules — delegation morphisms, composite-frame executability, captain-accountability invariance — have no kin-relational analog: the tiyóšpaye does not delegate authority along a chain and does not concentrate accountability at a single apex.

The two subsystems exist because the polity and the ship operate in different mediums. The 561 Group's medium is the kin-relational world — the world of people, kinship, and lifetime-conduct under wolakhota. The RSC Quiescent's medium is the Web — a substrate that admits only person-primitive acts (HTTP authenticates one credential-holder at a time; ranks install on persons, not on kin-bundles). The Web rejects acts whose origin-cell is a kin-bundle, so the polity cannot directly act on it. The ship exists to project the polity's endeavor onto the Web through a closure-rule subsystem the Web's identity architecture admits. See [the rsc quiescent's governance is determined by the web](../../learning/claims/the-rsc-quiescents-governance-is-determined-by-the-web.md) for the determination-proof.

## The failure mode

The named failure mode is *conflating the two subsystems*. The substrate has carried four instances of the conflation (per the open task [disambiguate-polity-and-ship-governance](../../../doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md)):

- *Voidfleet* — a fictive intermediary "governance organ" of the polity that purported to commission the ship. The chartering authority belongs to the 561 Group directly; there is no intermediate body.
- *The "confederacy covenant" known-gap* — the ship's charter declares itself subordinate to an unwritten covenant of the chartering body. The tiyóšpaye does not need a covenant; its constitution is the founding act and the kin-relations.
- *The "informing traditions" preamble* — the ship's charter names Haudenosaunee confederacy, Black radical tradition, feminist organizational theory, and cybernetics as informing the charter's design. The charter operates under the theory of kyriarchism (in the precise Schüssler-Fiorenza sense of interlocking dominations as the medium); the syncretism framing is misframed polity-side material installed onto a ship-side instrument.
- *"Captain" used for emsenn's polity-side acts* — the substrate has called emsenn's polity-side corrections "captain-direct corrections." Polity-side acts come from emsenn's Lakotaean standings (Naca, Itancan, Heyoka), not from the captain standing. The captain standing is the ship-side cell.

In each instance, polity-side and ship-side material were treated as interchangeable. The closure rules of one subsystem do not fire on cells of the other; the substrate produces no settlement when the wrong rule is applied to the wrong cell-type. The conflation is a category-error, detectable in principle by the typed-error condition once each cell is typed by its subsystem.

## What this means for the substrate's authoring

Records about the 561 Group describe the polity-side subsystem and use Lakotaean vocabulary (Naca, Itancan, Heyoka, omníčiye, wolakhota, consensus-by-withdrawal). Records about the RSC Quiescent describe the ship-side subsystem and use military-command vocabulary (captain, delegation chain, accountability non-transfer, scope-bound, charter). Records about emsenn distinguish emsenn's polity-side standings from emsenn's ship-side standing as captain — they refer to the same person but to different cells in different subsystems.

The disambiguation work is open ([disambiguate-polity-and-ship-governance](../../../doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md)); the substrate still carries earlier records that conflate. The four [RSC Quiescent claims](../../learning/claims/_index.md) are the formal anchors for the corrected framing; the present explanation file is the substrate-side teaching record that captures the corrected reading for substrate authors to consult.

## What this does not mean

The dual-governance frame does not say the two subsystems are unrelated, or that they cannot interface. The 561 Group charters the ship; the ship answers upward to the polity through emsenn-as-captain (whose accountability locus also sits as a polity member). What the frame says is that the *closure rules* of one subsystem do not fire as the closure rules of the other. The two subsystems may share a referent (emsenn) and may exchange acts at boundaries (the chartering act, the captain's reporting), but the rules under which those acts settle are subsystem-specific.

The three-pattern coproduct $\mathcal{S}_\mathrm{wolak} \sqcup \mathcal{S}_\mathrm{ship} \sqcup \mathcal{S}_\mathrm{Web}$ (named in the disambiguation task; not yet substrate-resident) is the formal structure that handles the interface — how cells in one subsystem translate into the others, what compatibility conditions the interface must satisfy, and what $\top$-residue would be visible if compatibility failed. That structure is open work.
