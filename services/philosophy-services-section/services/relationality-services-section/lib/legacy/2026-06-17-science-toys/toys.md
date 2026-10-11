# Toys (science)

Computational toys exploring the project's relational-order / VoidKernel /
nuclear-quartet algebra. Each toy is a small Python program (or in some
cases a Racket / Fennel / Rust artefact handled in
[`operations/engineering/toys/`](../../../engineering/toys/)) that
instantiates the formal system in a sensorial medium — image, animation,
sound, structured data — to make the algebra legible and falsifiable.

The science-side toys are **content** instances of the algebra: the math
shows up as music, art, or structured measurement. The engineering-side
toys (MUDs, RSA sandboxes, narrators) are **tooling** instances: the
algebra shows up as runtime systems.

## Layout

- [`art/`](art/) — image and video generation. Reaction-diffusion,
  quasicrystal interference, particle flow on trace trees, void-zone
  spatial chemistry. All visualizations are *derived* from the void/
  formal system rather than borrowed.
- [`music/`](music/) — polyphonic composition as VoidKernel trace
  algebra. Counterpoint emerges from DifferentialBypass; tension
  ordering follows the Gradient relation; harmonic stability maps to
  the four nuclear zones (++/+-/--/-+).
- [`math/`](math/) — algebraic measurements without rendering. Orbit
  graphs of the bypass DAG, free-monoid growth dynamics, meaning-
  compression benchmarks, crystal-seed axiom systems, the Collatz
  problem under the modal operators, a Heyting/KZ modal lab, the
  cohesion stack, and a lax-idempotent Flow REPL.
- [`games/`](games/) — CLI games and idle-sims that turn the modal
  algebra into an interactive medium. ritm_idle_plus, slime→crystal
  ontogeny, RITM-OS shell, single-file MUD over typed-edge store.

## Conventions

- Each toy is a self-contained script with a substantial docstring
  explaining what formal object it instantiates. The docstring is the
  primary documentation — these READMEs only summarize.
- Output (GIFs, MP4s, PNGs) is written to `build/art/` or similar; do
  not commit generated files.
- Toys frequently share the four-zone vocabulary: **++ Done** (doubly
  stable), **+- Possible** (transfer-stable), **-+ Necessary**
  (saturation-stable), **-- Absurd** (neither). When a toy uses these
  labels, they refer to the same nuclear-quartet structure.
