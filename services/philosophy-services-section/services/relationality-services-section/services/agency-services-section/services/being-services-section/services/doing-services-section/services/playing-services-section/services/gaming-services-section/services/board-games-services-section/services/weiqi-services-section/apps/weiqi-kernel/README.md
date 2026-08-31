# weiqi-kernel

`@lenticule-science/weiqi-kernel` — from `package.json`: "Pure, dependency-free weiqi rules
kernel: position model, rulesets, scoring, SGF, and the semantic event layer that annotates
play with glossary-vocabulary events. The engine is the executable form of the glossary." No
network, no keys, no clock it was not handed — see the
[Weiqi Kernel Constitution](../../content/text/documents/articles/notes/weiqi-kernel-constitution.md)
for the full purpose/authority/refusal-conditions record, including the 2026-08-19
materialization decision that settled this package's address as `apps/weiqi-kernel` (bare
name, no `-service` suffix — pure, no-network packages sit under `apps/` per the board's
product-spine derivation).

## Doctrine this code implements

- [Rulesets](../../content/text/documents/articles/notes/rulesets.md) — the five-ruleset
  comparison table (Chinese, Japanese, AGA, New Zealand, Ing) whose stable identifiers
  `rulesets.mts`'s `RULESETS` object transcribes directly, one ruleset per `Ruleset` record.
- [Regression Positions](../../content/text/documents/articles/notes/regression-positions.md)
  — thirteen hand-verified board positions (ko, superko, suicide, seki, dead-stone settlement,
  both scoring modes, handicap) that `test/*.test.mts` assert against by `id` (`R1`, `R6`,
  `R9`, ...), so doctrine and code cite each other rather than drifting apart.

## Running tests

```
npm test    # node --test 'test/*.test.mts'
```

Current state: **71 tests, 0 failures**, ~1.5s total, covering board/position mechanics,
every ruleset, all thirteen regression positions, scoring (area, territory, seki, dead-stone
removal), SGF round-tripping, the semantic event layer, and property-based invariant checks.

## Public API at a glance

Everything re-exports from `src/index.mts`:

- **`board.mts`** — `Color`/`Cell` constants (`BLACK`, `WHITE`, `EMPTY`), coordinate
  conversion (`coordToPoint`, `pointToCoord`), `findGroup` (stones + liberties via flood fill).
- **`position.mts`** — `Position` (immutable: board, `toMove`, prisoner counts, both Zobrist
  hashes), `createEmptyPosition`, `applyStonePlacement` (captures + suicide check),
  `applyPass`. Every mutator returns a new `Position`; none mutate in place.
- **`rulesets.mts`** — `Ruleset`, the `RULESETS` table (`chinese`/`japanese`/`aga`/`new_zealand`/
  `ing`), `getRuleset(name)`, `handicapPoints(size, count)`.
- **`game.mts`** — `Game`, the stateful orchestrator: holds history for ko/superko,
  exposes `play(move)` returning a `PlayOutcome` (`{ ok: true, events, passStreak }` or
  `{ ok: false, reason: IllegalReason }`), and `isLegal(move)`.
- **`scoring.mts`** — `computeTerritory` (seki-aware flood fill), `removeDeadStones`,
  `scoreArea`, `scoreTerritory`.
- **`sgf.mts`** — a generic recursive-descent SGF parser/serializer
  (`parseSgfCollection`/`serializeSgfCollection`, full variation trees) plus the convenience
  main-line layer (`gameRecordToSgf`/`sgfToGameRecord`).
- **`zobrist.mts`** — `boardHash`, `situationalHash`, for superko detection and position
  comparison.
- **`events.mts`** — the semantic event layer; see below.

## Semantic event vocabulary

`annotateMove`/`annotatePass` (`events.mts`) turn one move's before/after position diff into
`SemanticEvent[]`. Each event's `term` is a glossary term slug and its `termRef` is that
term's file path (via `TERM_PATH`), so a UI can hover-card or a post-game timeline can link
straight to this section's own corpus definition — the executable-glossary motto, literally:

| event type | term | termRef |
|---|---|---|
| `atari-given`, `atari-escaped` | `atari` | `atari.md` |
| `capture` | `capture` | `capture.md` |
| `ko-started`, `ko-resolved` | `ko` | `ko.md` |
| `connection` | `connection` | `connection.md` |
| `eye-formed` | `eye` | `eye.md` |
| `group-killed` | `life-and-death` | `life-and-death.md` |
| `pass`, `game-ended` | `pass` | `pass.md` |

`cut`, `false-eye`, `seki`, and `group-settled` are deliberately **not** detected here — each
needs a real life-and-death read (or, for `cut`, a `cut.md` that doesn't exist yet), not a
sound one-move board diff. `events.mts`'s module doc explains each deferral; house doctrine is
that this code stays a sound model of the theory rather than merely something that runs.
`eye-formed` itself ships only the smallest sound approximation available to a move diff (a
"simple eye": every orthogonal neighbor the same color, no diagonal-control check).
