# Art

Image and video generation toys. Each script renders some aspect of the
relational-order / void / nuclear-quartet algebra to a visual medium —
GIF, MP4, or PNG — and writes output to `build/art/`. Nothing here is
borrowed from other fields; every visual element is *derived* from the
formal system.

## Toys

- [`bloom.py`](bloom.py) — Gray-Scott reaction-diffusion rendered as an
  animated GIF. Two abstract chemicals react and diffuse; their
  concentrations produce organic forms (spots, mazes, coral, worms,
  labyrinths). Feed and kill parameters morph slowly across the
  animation, reorganizing the living patterns mid-frame. *No math in
  the output — just the organisms.*
- [`flow.py`](flow.py) — Void charge algebra as particle flow on the
  trace tree. Particles are traces (depth ≤ 3), positioned radially by
  Excite-distance from Void with angles encoded in base-3 digits. The
  Gradient relation appears as edges; DifferentialBypass as arcs; zone
  signatures drive the move weights; NuclearDischarge fires as bright
  streaks.
- [`zones.py`](zones.py) — Void zone structure as spatial
  reaction-diffusion. Trace-tree angular tiling partitions the grid;
  each cell's zone membership (Possible / Necessary / Absurd / Done)
  sets local Gray-Scott parameters. Different zones grow different
  organisms, and zone boundaries are where chemistry collides.
- [`quasicrystal-1.py`](quasicrystal-1.py),
  [`quasicrystal-2.py`](quasicrystal-2.py),
  [`quasicrystal-3.py`](quasicrystal-3.py) — Quasicrystalline
  visualization of the nuclear quartet. Two sets of plane waves at
  golden-ratio frequencies represent the saturation (sigma) and
  transfer (Delta) nuclei; their interference produces a 5-fold
  quasicrystalline pattern colored by the four fixed-point zones.
- [`tower-dynamics.py`](tower-dynamics.py) — Direct-numpy-pixel
  rendering of the void-monoid tower's growth dynamics, output as
  video.
- [`void_crystal.py`](void_crystal.py) — Crystal-seed visualization of
  the void monoid's algebra.
- [`hyperverse-video.py`](hyperverse-video.py),
  [`hyperverse-video2.py`](hyperverse-video2.py),
  [`hyperverse-video-manim.py`](hyperverse-video-manim.py) — 60-second
  videos of the relational hyperverse. The first two use direct numpy
  pixel rendering → imageio MP4; the manim variant uses Manim for
  smoother typography and transitions.
- [`ribbon-field.py`](ribbon-field.py) — Render the Relational ∞-Topos
  as a ribbon field over an archive of `id:` references. Background
  draws all id→id relations as thin translucent blue ribbons; primary
  `:node-relations:` overlay as thick red curves with stronger gravity
  in the spring layout. Reads an archive.txt as input.
- [`rasterizer.py`](rasterizer.py) — Convert a `(Y, R)` pair or a
  `GeometricCell` into a 2D raster image (numpy + Pillow). Real
  graphics rather than text rendering of the relational object.
- [`eidonic.py`](eidonic.py) — Single aesthetic image with perceptual
  targets: 1/f spectrum, opponent-balanced palette, multi-frequency
  Perlin, curvature/flow lines. Standalone numpy + Pillow.

## Output conventions

- Default output dir: `build/art/` (created if absent).
- Common dependencies: `numpy`, `Pillow`, `imageio`, `scipy`,
  `matplotlib`, `manim` (only for the manim variant).
- Most scripts assume Python 3.10+ and run as `python <script>.py`.
