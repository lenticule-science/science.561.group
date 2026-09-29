---
name: the rsc quiescent and the tiyóšpaye are distinct closure regimes
description: The 561 Group's closure-rule subsystem (wolakhota, kin-relational) and the RSC Quiescent's (military command, person-primitive) are non-isomorphic. They share a populace overlap (emsenn appears in both) but settle different cells with different rules. Conflating them is the named failure mode.
status: sketch
derives-from:
  - ../../../code/structures/rsc-quiescent.md
  - ../../../code/structures/closure-rule.md
  - the-rsc-quiescent-is-governed-by-military-command.md
  - the-rsc-quiescents-governance-is-determined-by-the-web.md
  - ../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theories/predicated-lakotaean-governance/code/structures/tiyospaye.md
  - ../../teaching/explanations/dual-governance-context.md
---

**Claim.** Let $\mathcal{S}_\mathrm{wolak}$ be the closure-rule subsystem governing the 561 Group qua Lakota tiyóšpaye, and let $\mathcal{S}_\mathrm{ship}$ be the closure-rule subsystem governing the RSC Quiescent qua Webship. These are *non-isomorphic* subsystems: they have different signatures, fire on different cell-types, and produce different settlings on cells in their overlap. emsenn holds positions in both — Naca, Itancan, and Heyoka in the polity; captain on the ship — but these positions are not the same position wearing different hats; they are distinct substrate-cells in distinct closure-rule subsystems.

The named failure mode (per [dual-governance-context.md](../../teaching/explanations/dual-governance-context.md)): conflating the two — settling a polity-side question by captain-attestation, or settling a ship-side question by kin-recognition. Both fail because the closure rules don't fire on the wrong cell-types.

## Proof sketch

**$\mathcal{S}_\mathrm{wolak}$.** Per [tiyospaye.md](../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/theories/predicated-lakotaean-governance/code/structures/tiyospaye.md), the tiyóšpaye-scoped closure rules include:

- (T1) Membership-propagation. Fires on kin-relation cells; produces eligibility cells.
- (T2) Member-obligation. Fires on member-pair cells; produces cells of the form $\langle a, \texttt{owes-wówačhantognaka-to}, b\rangle$.
- (T3) Head-recognition. Fires on the conjunction $\bigwedge_a \langle a, \texttt{recognizes-as-head}, h\rangle$; produces the head-cell.

The cells $\mathcal{S}_\mathrm{wolak}$ produces are indexed by: kin-bundles, member-pairs, head-recognitions. The cells it consumes are indexed by: kinship, co-camping, recognition-status.

**$\mathcal{S}_\mathrm{ship}$.** Per [the-rsc-quiescent-is-governed-by-military-command](the-rsc-quiescent-is-governed-by-military-command.md), the ship-scoped closure rules include:

- Per-link delegation morphisms with the four invariants (derivative, accountability non-transfer, scope-bounded, revocable).
- Composite modal frame $R^\mathrm{cmd}$ producing executability cells $\Diamond_{R^\mathrm{cmd}} u$.
- $H^0_t$-invariant captain-accountability cells $\langle\text{captain}, \texttt{accountable-for}, X\rangle$.

The cells $\mathcal{S}_\mathrm{ship}$ produces are indexed by: persons-with-ranks, delegated-acts, accountability-loci. The cells it consumes are indexed by: captain-attestation, delegation-status, scope-bounds.

**Non-isomorphism.** A structure-preserving morphism $\mathcal{S}_\mathrm{wolak} \to \mathcal{S}_\mathrm{ship}$ would need to map (T1)–(T3) to ship-rules. There is no such map:

- (T1) Membership-propagation has no ship-side analog. The ship has no membership-from-kinship; ship-roles install by captain-act, not by kin-relation.
- (T2) Member-obligation has no ship-side analog. Crew owe duty *to the captain* (a single locus), not to each other under a relational virtue.
- (T3) Head-recognition has no ship-side analog. The captain's authority comes from the chartering act, not from a conjunction of subordinate-recognitions. Crew cannot install a captain by withdrawing recognition of an alternative.

The reverse direction also fails:

- Delegation morphisms have no $\mathcal{S}_\mathrm{wolak}$ analog. The tiyóšpaye does not delegate authority along a chain; authority is held in standings (Naca, Itancan, Heyoka) constituted by kin-relations and lifetime-conduct, not by upward-issued license.
- The captain-accountability $H^0_t$-invariance has no $\mathcal{S}_\mathrm{wolak}$ analog. Accountability in the tiyóšpaye is distributed across kin-relations under the four virtues, not concentrated at a single apex.

Therefore $\mathcal{S}_\mathrm{wolak}$ and $\mathcal{S}_\mathrm{ship}$ are non-isomorphic. They are different closure-rule subsystems, not different presentations of the same one.

## Overlap and conflation

Where do the two subsystems touch? At the person *emsenn*. emsenn is:

- in $\mathcal{S}_\mathrm{wolak}$: Naca, Itancan, Heyoka. Standings constituted by kin-relations, lifetime-conduct, and recognition under wolakhota.
- in $\mathcal{S}_\mathrm{ship}$: captain. Standing constituted by the commissioning act and the captain's deontic profile installed at that act.

These are four distinct cells at three distinct standings, all referring to emsenn-the-person. They share a *referent* but they are not the same cell. The conflation failure mode is recording one as the other — describing a polity-side act of emsenn's as "the captain's act," or describing a ship-side act as "the Naca's act." The closure rules of one subsystem won't fire on the cells of the other; the substrate produces no settlement.

The surveys' repeated use of "captain-direct correction" for polity-side corrections (called out in [disambiguate-polity-and-ship-governance.md](../../../doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md)) is the conflation in plain text. Polity-side corrections come from Naca/Itancan/Heyoka standings; ship-side corrections come from captain standing. The substrate must distinguish.

## What this earns

- *A typed-error condition for the substrate.* Any cell asserting a $\mathcal{S}_\mathrm{wolak}$-output where a $\mathcal{S}_\mathrm{ship}$-output is required, or vice versa, is a category-error. The substrate can in principle detect these at edit-time once each cell is typed by its subsystem.
- *A clear locus for the disambiguate-polity-and-ship-governance task's work.* The task's "Done when" criteria can be checked against this claim: the polity-side concept files (Naca, Itancan, Heyoka) must be authored in $\mathcal{S}_\mathrm{wolak}$ terms, not in $\mathcal{S}_\mathrm{ship}$ terms.
- *A formal frame for the three-pattern coproduct.* The disambiguate task identifies the 561 Group as in a three-pattern coproduct $\mathcal{S}_\mathrm{wolak} \sqcup \mathcal{S}_\mathrm{ship} \sqcup \mathcal{S}_\mathrm{Web}$. The present claim handles the $\mathcal{S}_\mathrm{wolak} \sqcup \mathcal{S}_\mathrm{ship}$ pair as non-isomorphic; the broader three-pattern question (compatibility-rules, translation-morphisms, $\top$-residue) remains open work.

## Proof obligations for promotion to proved-status

- A formal substrate record of $\mathcal{S}_\mathrm{ship}$ as a closure-rule subsystem with its rules enumerated. The present claim cites it via the military-command theorem but does not give the full rule-list separately.
- The translation-morphism between $\mathcal{S}_\mathrm{wolak}$ and $\mathcal{S}_\mathrm{ship}$ (per [disambiguate-polity-and-ship-governance.md](../../../doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md)) at both entity- and cell-level. The present claim establishes non-isomorphism; the translation-morphism is the *partial* structure-preserving map between the two subsystems where they do interface.
- A worked example of an attempted conflation and its detected failure. This would make the typed-error condition concrete.

## Position

This is the *non-conflation* claim — the formal statement of the failure mode the corpus has been working against. Together with the three preceding claims (Webship type, military-command governance, governance-determined-by-Web), this claim closes the basic structural picture of the RSC Quiescent within the 561 Group's substrate.
