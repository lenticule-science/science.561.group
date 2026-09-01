# Okaga

A region of the [emsean paracosm](../README.md). Older than the
code-side work on Teraum: Okaga shows up first in stories and fictions
and in the older racket-mud user guides as a referenced setting.

The Okaga is also a starship — emsenn's personal starship in the
Okagan paracosm — with a navigable interior (airlock, bridge, quarters,
passageways, engine-room, galley, library, immersim, cargo bay,
hallways, teleporter room, air ducts) extracted from the qtops Racket
and TAB Fennel MUD archives.

The ship has cross-paracosm connections to Teraum: an Immersim that
opens onto the swirl beside Fort Kelly in the Central Plains, and a
teleporter from Cargo Bay Four to the "ironic crack in the south wall"
of Forth & Wahl in Bellybrush.

## Layout

- `places/` — the ship's compartments and the Okagan paracosm's
  starsystems (currently 14 places: ship overview + 13 rooms).
- `beings/` — characters. Currently 1 (Ikmu, the bridge cat).
- `things/` — objects, artifacts. Currently 3 (bridge fixtures).
- `terms/` — Okaga-local vocabulary (to be created as needed).
- `texts/` — prose, lore. Currently 2: the original draft of *The
  Okaga* and the synopsis *Okaga Comes To Ben*.

See [the schema](../../SCHEMA.md) for entry conventions.

## Cross-paracosm links

- [`okaga:immersim`](places/immersim.md) ↔
  [`teraum:fort-kelly`](../teraum/places/eastlands/central-plains/fort-kelly.md)
  (the swirl by the Kingsroad)
- [`okaga:cargo-bay-four`](places/cargo-bay-four.md) ↔
  [`teraum:forth-and-wahl`](../teraum/places/eastlands/green-delta/game/bellybrush/forth-and-wahl.md)
  (the ironic crack in the south wall)
