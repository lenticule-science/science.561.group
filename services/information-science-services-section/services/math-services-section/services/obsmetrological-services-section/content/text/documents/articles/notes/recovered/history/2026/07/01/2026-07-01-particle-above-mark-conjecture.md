---
title: "Particle above Mark: verified anchors and open conjecture"
date: "2026-07-01"
status: "verified corpus reading with explicit open conjecture"
claim: "the best current candidate for particle is one Articulating node, not Mark and not Cell; the tile/bead/crystal/quasicrystal chain is a material-layer spine that still lacks a proved particle-realization map"
local-anchors:
  - "Infomaterial/Primitive/Mark.lean"
  - "Infomaterial/Articulation/Articulating.lean"
  - "Infomaterial/Articulation/Articulating/Cell.lean"
  - "Infomaterial/Articulation/Articulating/FourCorner.lean"
  - "Infomaterial/Relational/Material/Glass.lean"
  - "Infomaterial/Relational/Material/SectorPhaseDiagram.lean"
  - "Infomaterial/Relational/FilterFiberSector.lean"
  - "Infomaterial/Persistence/Aperiodic/Moduli.lean"
  - "sites/infography.emsenn.net/lib/articulation/utterance.mts"
---

## Question

The working question is whether `particle` should name the general term one
level above `Mark`: the smallest unit of substance that can react to change.
The related question is whether this particle is what becomes tile, bead,
crystal, and quasicrystal along the named coordinates phase, sector, fiber,
and modulus.

This note does not add a Lean declaration. It records what is currently
verified, states the strongest conjecture I can state without faking a proof,
and separates the genuinely open part.

The recovery transcript constraint is also live: the user explicitly said the
object was "Chu spaces in some ways" but "not it", then proposed particles as
the smallest unit of substance that can react to change. That was checked in
`~/.claude/projects/-home-emsenn-info/0f4df4e4-6ddd-4ca8-b8f7-e7d56d1d6968.jsonl`
at JSONL line 399. I do not re-propose Chu spaces here.

## Verification method

Lean declaration names used below were checked with the active
`infomaterial-lean-lsp` server using `lean_local_search` before citation. The
active MCP tool list in this session did not expose a `lean_verify` command, so
axiom cleanliness was checked through the same LSP with `#print axioms` inside
`lean_run_code`.

## Independently verified

### Mark is the admitted opaque atom

Infography's runtime articulation module says `Mark` is the opaque atom, that a
`Token` and `Claim` each carry a `Mark`, that `Utterance = (Token, Claim)`, and
that public morphisms normalize through `Mark -> Utterance -> articulate`
(`sites/infography.emsenn.net/lib/articulation/utterance.mts:1-10`). The same
file defines the raw mark boundary before token/claim pairing
(`sites/infography.emsenn.net/lib/articulation/utterance.mts:27-39`) and the
`Mark` class as an immutable carrier wrapping one present value
(`sites/infography.emsenn.net/lib/articulation/utterance.mts:119-129`).

Infomaterial's Lean `Mark` is the arbitrary atomic primitive with a finite
surface presentation, and `Kind` gives only the two positional roles `token`
and `claim` (`Infomaterial/Primitive/Mark.lean:13-29`). That proves the
negative side of the particle question: `Mark` is too small to be particle if
particle means "reacts to change." Mark carries surface/role admission, not
movement.

### Articulating is the first verified reaction carrier

`Articulating` is the base morphism and one-way recursion: either `utter u` or
`pair u a` (`Infomaterial/Articulation/Articulating.lean:31-47`). The file
explicitly says it is inverse-less and one-way, and that it is the recursion
through which downstream morphisms are reached
(`Infomaterial/Articulation/Articulating.lean:11-26`).

Lean currently exposes the two readouts needed by the particle conjecture:

- `Articulating.head : Articulating -> Utterance`
- `Articulating.moved : Articulating -> Bool`
- `Articulating.head_moved_joint_onto`

Those were checked by LSP. The theorem statement is:

```text
Infomaterial.Articulating.head_moved_joint_onto
  (u : Infomaterial.Utterance) (b : Bool) :
  exists a, a.head = u and a.moved = b
```

`#print axioms` reported no axioms for
`Infomaterial.Articulating.head_moved_joint_onto`. The source lines define
`head`, `depth`, `floor`, and `moved`
(`Infomaterial/Articulation/Articulating.lean:51-75`) and prove joint
surjectivity of head and movement status
(`Infomaterial/Articulation/Articulating.lean:100-107`).

This supports, but does not prove as a named theorem, the reading:

```text
particle = one Articulating node,
           the object whose substance-readout is head
           and whose reaction/readout is moved
```

### Cell is downstream of the candidate particle

`Articulating.Cell` is an utterance plus two status booleans,
`tokenArticulated` and `claimArticulated`
(`Infomaterial/Articulation/Articulating/Cell.lean:28-34`). Its four `Corner`
names are `potential`, `active`, `absurd`, and `stable`
(`Infomaterial/Articulation/Articulating/Cell.lean:42-53`), and the headline
finite result is `Articulating.Corner.card_eq_four`
(`Infomaterial/Articulation/Articulating/Cell.lean:87-90`), which LSP reported
axiom-clean.

`Articulating.FourCorner` is `Bool x Bool`, and
`Infomaterial.articulation_phase_is_charge` proves that a cell's four-corner
readout is its articulation/charge corner
(`Infomaterial/Articulation/Articulating/FourCorner.lean:27-67`). LSP reported
no axioms for `Infomaterial.articulation_phase_is_charge`.

This is why the earlier `particle = Cell` guess should stay corrected:
`Cell` is the four-corner token/claim interrogation of an utterance. It is not
yet the minimal process-substance unit itself.

### Tile, bead, crystal, quasicrystal are a verified material-layer spine

`Infomaterial.Relational.Material.Glass` packages a finite material chain:
`Tiles` carry finite local rules, `Beads` add the lenticular ported thread
walk, `Crystals` add a finite ordered occupation pattern, and `Quasicrystals`
add finite diffraction over that pattern
(`Infomaterial/Relational/Material/Glass.lean:17-25`).

The bead layer is explicit: `Beads` carries `tiles`, a `Lenticule` type, a
thread, thread legality, four adjacency readings, a finite site-level material
realization, and a placement graph
(`Infomaterial/Relational/Material/Glass.lean:181-198`). `Crystals` are
bead-supported finite occupation patterns
(`Infomaterial/Relational/Material/Glass.lean:328-335`), and `Substance` reads
tile, bead, crystal, and quasicrystal layers out of one glass substance
(`Infomaterial/Relational/Material/Glass.lean:654-664`).

The theorem
`Infomaterial.Relational.Material.Glass.Substance.beads_between_tiles_and_crystals`
states:

```text
(G : Substance) : G.crystals.beads = G.beads
```

LSP reported no axioms for that theorem. The source line describes it as:
"Beads are the intermediate layer between tiles and crystals"
(`Infomaterial/Relational/Material/Glass.lean:709-711`).

The stronger bead-spine theorems were also checked:

- `Infomaterial.Relational.Material.Glass.Crystals.bead_phase_spine`
- `Infomaterial.Relational.Material.Glass.Quasicrystals.bead_phase_spine`

Current LSP `#print axioms` reported `[propext, Quot.sound]` for both. This
matters because at least one existing note's certificate says `none`; the live
LSP result is the one used here.

### Phase, sector, fiber, and moduli are not a flat four-step ladder

`Diffraction.lean` defines a finite predictor-level `PhaseSubstitution`, a
`phaseType`, a finite diffraction component, and
`phaseType_readings_agree`
(`Infomaterial/Persistence/Aperiodic/Diffraction.lean:305-369`). LSP reported
no axioms for `Infomaterial.Persistence.Aperiodic.phaseType_readings_agree`.

`SectorPhaseDiagram.lean` explicitly says informational matter does not sit on
one phase ladder. It carries parallel sector readouts over the same material
point, transport/metallization is fibered over the structural predictor side,
and a modulus sits inside that transport fiber
(`Infomaterial/Relational/Material/SectorPhaseDiagram.lean:4-27`).

The same file defines exactly three `MaterialSector` constructors:
`structural`, `transport`, and `topological`
(`Infomaterial/Relational/Material/SectorPhaseDiagram.lean:35-41`). It then
defines structural, transport, topological, and thermal-control data as
separate objects, with thermal data kept outside the sector list
(`Infomaterial/Relational/Material/SectorPhaseDiagram.lean:49-163`).

`FilterFiberSector.lean` gives the general hygiene rule: filters select points
inside named fibers, fibers are indexed families, sectors are axis-indexed
fibers, and full material phase points are sections across sector axes
(`Infomaterial/Relational/FilterFiberSector.lean:5-19`). Its material sector
family has structural, transport, and topological axes, with transport retaining
ordinal/moduli indices
(`Infomaterial/Relational/FilterFiberSector.lean:113-129`).

`Moduli.lean` defines `ModuliPoint` as `Quot CohEquiv`, where
modulus/moduli is first earned as an actual carrier in that file
(`Infomaterial/Persistence/Aperiodic/Moduli.lean:182-188`).

## Conjecture

Full-strength conjecture:

> A particle is one `Articulating` node: the smallest presently verified
> process-substance unit above `Mark`, with `head` as its substance readout and
> `moved` as its reaction-to-change readout. It is not a `Mark`, because a Mark
> only admits opaque surface material; it is not an `Articulating.Cell`, because
> Cell is a downstream token/claim status interrogation of an utterance.

This is not a Lean theorem yet. The verified evidence is that `Articulating` is
one-way recursion, every node has a head utterance and a movement readout, and
the pair of readouts is jointly onto. That proves the local readout substrate,
not the name `particle`.

The material-layer conjecture should be stated separately:

> Tile, bead, crystal, and quasicrystal are not four depths of an individual
> particle. They are finite material carriers/layers built over supports. A
> particle may be what supplies local substance to those supports only after a
> realization map from `Articulating` nodes into the relevant tile/bead/crystal
> support carrier is defined and proved to preserve the required readouts.

This avoids the false lighter version "particle becomes tile, bead, crystal,
quasicrystal." The live formal corpus proves a material spine, not a particle
realization theorem for that spine.

The phase/sector/fiber/moduli conjecture is therefore:

> Phase, sector, fiber, and moduli are coordinates/readouts around material
> particle organization, not chronological transformations of a particle. Phase
> is a finite predictor-level regime readout; sector is a parallel axis product;
> fiber is indexed dependence over a base or sector; moduli is a quotient/coarse
> class inside the transport fiber.

This is already close to the live `SectorPhaseDiagram` wording, but the word
`particle` is not yet formalized there.

## Genuinely open

1. There is no `Infomaterial.Particle` declaration and no `Particle` declaration
   was found by `lean_local_search`. The name is currently conjectural.

2. There is no proved realization map:

```text
Articulating node -> tile support
Articulating node -> bead lenticule/thread support
Articulating node -> crystal occupation support
Articulating node -> quasicrystal finite diffraction support
```

Without such a map, the material spine is verified but the particle-to-material
reading remains open.

3. There is no theorem that the `head`/`moved` particle readouts mechanically
generate the `tokenArticulated`/`claimArticulated` booleans of
`Articulating.Cell`. Until such a bridge exists, `Cell` stays downstream of
particle rather than being identified with it.

4. There is no replacement for the rejected Chu-space framing. The live reason
to avoid Chu is not that point/test pairing is absent; it is that bare pairing
does not supply the one-way recursive movement that `Articulating` supplies.

5. The singular word `modulus` has no active declaration found by
`lean_local_search`; the earned carrier is `ModuliPoint`. If `modulus` is to
name a particle coordinate, it needs a declaration or a precise prose rule that
does not collapse moduli, sector, and transport into one axis.

## Working conclusion

Use `particle` only as a frontier term for now:

```text
Mark
  -> Utterance
  -> Articulating node  = candidate particle
  -> Cell/FourCorner    = downstream bit/charge interrogation
  -> material supports  = tile/bead/crystal/quasicrystal carriers, if realized
```

The strongest current answer is therefore not "particle is a Chu space" and not
"particle is a tile." It is:

> particle is the candidate name for one `Articulating` process-substance node,
> whose ensemble/support realizations may later underwrite tile, bead, crystal,
> and quasicrystal material carriers once the missing realization theorem is
> stated.
