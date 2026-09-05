# Changelog

All notable changes to `@lenticule-science/metrologic/bilattice` are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.2] — unreleased

### Added

- `test/` — the kernel's 41 property tests (`laws.mjs`, `descent.mjs`, `structure.mjs`), ported from `@561/development.active.math-kernel` and retargeted at this package's named exports, reshaped into discrete `node:test` cases. Previously the recreation was validated once via the byte-for-byte parity check below but shipped no runnable suite of its own; `node --test` now runs the algebraic laws, the descent integration properties, and the structural morphism properties directly against `../src/*.mjs` on every run.

## [0.0.1] — unreleased

### Added

- `charge` — the carrier and its value-algebra: `present`, `isTop`, the two involutions (`negate`, `conflate`), the knowledge and truth joins/meets, `leqKnowledge`, `compareKnowledge`, `aggregate`.
- `descent` — the four-regime descent (`articulate`, `predicate`, `cohere`, `posit`, `commutate`), the modal generators (`possibilize`/`necessitate` on both orders, with their `raise`/`lower` steps), `settle`, and `compare` (the consistent / paraconsistent split).
- `cone` — the cone duals: `brim`, `adjudicate`, `presume`.
- `void` — the void reads (`gap`, `vanish`), the transfinite complement (`estrange`), and the aperiodic monad (`saturate`, `transfer`, `twistor`, `precipitate`).
- Property/law test suites (charge algebra, descent end-to-end, cones, void).
- The kernel's `docs/learning/` (tutorials / how-to / reference / explanation), rewritten for this package's named-export layout.

This is a from-scratch, best-practices recreation of `@561/development.active.math-kernel`, verified byte-for-byte against it (145 deep-strict-equal parity checks across the charge algebra, the descent, both cone pairs, the void reads, and the aperiodic monad).
It is a recreation, not a move: the old kernel remains in place so consumers migrate at their own pace.
