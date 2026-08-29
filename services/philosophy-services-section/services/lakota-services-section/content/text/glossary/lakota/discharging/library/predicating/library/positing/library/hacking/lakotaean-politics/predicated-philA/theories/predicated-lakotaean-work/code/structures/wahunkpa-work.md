---
type: definition
class: work-class
status: draft
symbol: "\\Pi^{\\mathrm{wah\\acute{u}\\eta kpa}}"
depends-on:
  - work-cell-system
  - oyate
  - oceti-sakowin
  - annual-cycle
realizes: [work-type-as-closure-structure, multi-agent-work-as-crdt]
---

# Wahúŋkpa-work

Wahúŋkpa-work is the work-class whose cells fire on *collective-coordination* predicates — the work of forming the camp-circle, of coordinating the big hunt, of preparing the sun-dance, of conducting the migration, of running the giveaway.
The class is structurally distinguished by:

1. Cells require *multiple agents* firing in coordination — no single-agent firing produces wahúŋkpa-cell-completion.
2. Coordination is by *wakíčhuŋza-and-akicita* direction at oyate scope, by *omníčiye* at confederacy scope.
3. The work-pattern matches the multi-agent CRDT structure: distributed firing with merge-convergence under $\leq_k$-join.

## Cells in the class

$\Pi^\mathrm{wahúŋkpa}$ contains:

- *Participates-in-camp-circle-formation* — the assembly-of-lodges-in-order at the seasonal gathering.
- *Coordinates-hunt*, *participates-in-big-hunt* — the buffalo-hunt-coordination as multi-agent work.
- *Prepares-sun-dance*, *constructs-sun-dance-arbor*, *participates-in-sun-dance-preparation*.
- *Participates-in-migration*, *moves-with-camp*, *coordinates-migration-route*.
- *Participates-in-giveaway* (otúhaŋ) — both givers and receivers fire cells.
- *Defends-camp* (overlap with wówašake-w) — coordinated defense.
- *Participates-in-omníčiye* — council-participation as work.

## CRDT structure on wahúŋkpa-w cells

Per [multi-agent-work-as-crdt](../../../../../../work/theories/predicated-work/theorems/multi-agent-work-as-crdt.md), multi-agent work-cells with $\leq_k$-monotone progress satisfy the CRDT convergence property: distributed replicas converge under merge.

Wahúŋkpa-w cells *do* satisfy this.
Each agent's contribution to the camp-circle-formation, to the hunt-coordination, to the sun-dance-preparation, fires the agent's individual cell at $\mathbf{t}$.
The merged cell across the polity's observer-set fires the collective-completion cell when all required-contribution cells have fired.

Substantively: a tiyóšpaye that arrives at the camp-circle and raises its lodge in the correct position fires its *participates-in-camp-circle-formation* cell.
Each tiyóšpaye fires individually; the merged cell across all tiyóšpaye fires *camp-circle-complete* when all positions are taken.

The CRDT property means: no central authority needs to track each tiyóšpaye's contribution.
The collective-completion cell is the $\vee_k$-merge of the individual contributions, and the merge is associative-commutative-idempotent — distributed agreement on completion follows automatically.

## The hochókata structure

The *hochókata* (the camp-circle center) at a seasonal gathering has structural significance:

- The center is reserved for ceremonial space (sun-dance arbor, council space, wakȟáŋ-bearing items).
- The tiyóšpaye-lodges arrange around the center in a specific order — typically by oyate-position with the senior oyate at the east entrance.
- The arrangement is *recorded substrate* — known to all the participants, sustained across years.

Substrate-algebraically: the hochókata structure is a *spatial-cellular complex* on the entity-set $E^\mathrm{plc}_\mathrm{lak}$ specialized to the gathering.
The complex has:

- 0-cells: tiyóšpaye-positions in the circle.
- 1-cells: adjacency-relations (this tiyóšpaye camps next to that one).
- 2-cells: the bounded regions (the central space, the perimeter, the entrance-corridor).

This is a Priestley-dual-like structure on the polity's gathering-space.
The structural property: the complex is *the same shape every year*, even though the specific agents and specific tiyóšpaye-occupants of each position may differ.
The structural-stability across years is what makes the gathering substrate-recognizable from arrival.

## Wahúŋkpa-w as the polity's largest substrate-firing-event

A confederacy-scope sun-dance gathering (Bloketu) fires wahúŋkpa-w cells at the largest possible scale: every tiyóšpaye of every oyate of every Tȟitȟúŋwaŋ division (and historically, all seven divisions when they could gather) is firing wahúŋkpa-w cells over the multi-week gathering.
The aggregate cell-firing is the polity's most-intense substrate-activity-period of the annual cycle.

Substrate-events during the gathering: - Multiple confederacy-scope omníčiye sessions firing. - The sun-dance morphism (cf. [sun-dance-as-polity-renewal](../../../../../work/theories/predicated-work/theories/predicated-governance/theories/predicated-lakotaean-governance/morphisms/sun-dance-as-polity-renewal.md)) firing across the days. - Major giveaways firing in multiple tiyóšpaye. - Inter-oyate marriages being arranged and concluded (firing kin-cells per (Ω4) of [oceti-sakowin](../../../../../work/theories/predicated-work/theories/predicated-governance/theories/predicated-lakotaean-governance/objects/oceti-sakowin.md)). - Naming ceremonies for new adults firing standing-cells. - Inter-band trade and gift-exchange firing economic-substrate.

The aggregate effect is *polity-scale substrate-renewal*: the cells fired during the gathering carry the polity forward through the rest of the annual cycle.

## Suppression and the camp-circle's continuing form

The 1880s–1934 sun-dance ban and the broader confinement-to-reservation prevented confederacy-scope camp-circle-formation.
The structure persisted at smaller scale within reservation boundaries (community gatherings, school events, cultural conferences) and resumed at full scope after AIRFA 1978.

The contemporary sun-dance gatherings on Pine Ridge, Rosebud, Cheyenne River, Standing Rock, and at Pȟahá Sápa are wahúŋkpa-w firing at confederacy-scale, with attendance from multiple oyate, intermarriage-renewal occurring, omníčiye-style deliberation around contemporary polity-questions.
The substrate-restoration is operative.

## Sources

- Walker 1917, *The Sun Dance and Other Ceremonies* — detailed recording of wahúŋkpa-w around the sun dance.
- Walker 1982, *Lakota Society* — camp-circle and gathering structure.
- Hassrick, *The Sioux* (1964) — camp-organization and migration coordination.
- Estes, *Our History is the Future* (2019) — contemporary confederacy-scope gatherings as wahúŋkpa-w restoration.
- The annual sun-dance materials from contemporary Lakota oyate publications.
