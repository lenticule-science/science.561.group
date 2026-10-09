---
name: the rsc quiescent is a webship
description: The RSC Quiescent is an instance of the Webship type — a body politic chartered by a polity to project that polity's acts onto the Web. Type-membership root for the ship's substrate-side records.
status: sketch
derives-from:
  - ../../../code/structures/rsc-quiescent.md
  - ../../../code/structures/561-group.md
  - ../../../code/structures/closure-rule.md
  - ../../../code/structures/polity.md
---

**Claim.** The Relational Settlement Carrier *Quiescent* is an instance of the type *Webship*. A Webship is a body politic with four defining predications:

- *(W1) Chartered.* A polity $P$ installs the ship by a commissioning act. The ship's existence as a normative entity dates from that act; before it, the ship does not exist.
- *(W2) Captained.* A person holds the captain's deontic profile — powers, duties, privileges, immunities — installed at commissioning under $P$'s authority. The captain-cell is single-holder; succession occurs at decommissioning or recommissioning.
- *(W3) Web-projecting.* The ship's function is the projection of $P$'s endeavor through acts on the Web whose recipients lie outside $P$'s governance. $P$ does not perform the Web-acts itself; the ship does, and the ship's acts count as $P$-authorized.
- *(W4) Constituted in writing.* The ship is its records. An act is real when its record is written into the ship's substrate; an unrecorded act has not happened in the ship's sense.

The RSC Quiescent satisfies all four:

- *(W1):* Commissioned 2026-04-05 by the 561 Group ([code/structures/rsc-quiescent.md](../../../code/structures/rsc-quiescent.md); commissioning record at `old-archive/triage/.../561-group/triage/commissioning/rsc-quiescent-2026-04-05.md`).
- *(W2):* emsenn installed as captain at commissioning. Captain-cell $\langle\text{RSC Quiescent}, \texttt{captain}, \text{emsenn}\rangle = \mathbf{t}$, persisting until decommissioning.
- *(W3):* Function declared at commissioning: the pursuit of Black Liberation and Indigenous Sovereignty. This is the 561 Group's endeavor; the ship is the means through which the polity acts on the Web for that endeavor.
- *(W4):* The repository at `/home/emsenn/561` is the ship. The substrate at `work/governance/assets/computing/web/webships/rsc-quiescent/` is the ship's operational asset-record; the records and the ship are not separable.

## Why the type matters

The RSC Quiescent's existing substrate record at [code/structures/rsc-quiescent.md](../../../code/structures/rsc-quiescent.md) describes the ship's structure but does not name the type *Webship*. The corpus uses the term throughout — the ship is "the 561 Group's primary Webship" in [code/structures/561-group.md](../../../code/structures/561-group.md), in the survey [rsc-quiescent-may-2026.md](../surveys/rsc-quiescent-may-2026.md), and in the asset path `webships/rsc-quiescent/` — without a substrate record defining the type. This claim makes the type explicit so downstream records can cite type-membership rather than re-stating the constituent predications.

The type is distinct from neighboring types:

- *Polity.* A polity is chartered (or self-constituting) but is not necessarily Web-projecting; it may act through its own governance directly. A Webship is always a polity-projection at one scope.
- *Ship (general).* A ship is a body politic chartered by some polity and operating outside that polity's home governance. A Webship is a ship whose medium of operation is the Web specifically.
- *Drone swarm.* A drone swarm is a structure-agnostic embodied-participant collective. A Webship is a body politic with the four predications above; it may or may not be implemented as a drone swarm. The RSC Quiescent's implementation happens to be an agentic drone swarm, but the type does not entail this.

## Proof obligations for promotion to proved-status

- A `code/structures/webship.md` record stating the type as a substrate entity with (W1)–(W4) as its constituent predications, separable from the general `ship` type. The present claim assumes the type without defining it formally; the structure record is the missing piece.
- A definition of the Web as a substrate with its own closure-rule subsystem $\mathcal{S}_\mathrm{Web}$ (referenced in [doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md](../../../doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md) but not yet substrate-resident).
- A statement of the relationship between $\mathcal{S}_\mathrm{Web}$ and the ship's own closure-rule subsystem $\mathcal{S}_\mathrm{ship}$ — whether the latter is a sub-system, an adapter, or a separate-but-compatible discipline.

## Position

This is the type-membership root claim for the RSC Quiescent. All downstream claims about the ship — its governance form, its determination by the Web, its non-conflation with the chartering polity — cite this claim as a precondition.
