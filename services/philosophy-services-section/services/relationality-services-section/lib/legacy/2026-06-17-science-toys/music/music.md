# Music

Polyphonic music as a VoidKernel trace algebra. Each toy here treats
music as a concrete instance of the formal system — Trace = sequence of
note events, Gradient = tension preorder, Void = silence, Excite =
prepend-and-canonicalize, DifferentialBypass = the counterpoint axiom
(notes on different voices commute).

The four nuclear zones map directly to harmonic function:
- **++ VoidDone** → C major (tonic, doubly stable)
- **+- VoidPossible** → F major (pre-dominant, transfer-stable)
- **-+ VoidNecessary** → G7 (dominant, saturation-stable)
- **-- VoidAbsurd** → B diminished (shadow, neither stable)

## Toys

- [`music.py`](music.py) — VoidKernel instance: polyphonic music as
  trace algebra. Tension is sum of individual pitch tensions
  (consonance distance from tonic C); each note contributes ≥ 0, so
  ExciteGrades holds — adding a note never resolves tension. Verifies
  the axioms (GradientReflexive, Transitive, VoidMinimizes,
  ExciteGrades, DifferentialBypass) on example traces.
- [`composition.py`](composition.py) — *VoidKernel: The Nuclear Quartet
  in C.* One trace, four zones, discharge fires at the end. Journeys
  through the four corners (++ → +- → -- → -+) with each zone played
  in its tonal function.
- [`quartet.py`](quartet.py) — *The Nuclear Quartet in C
  (Polyphonic).* DifferentialBypass made audible as counterpoint. Each
  voice is an independent Excite stream; voices interleave freely
  because Bypasses(a, b) holds whenever a and b are on different
  voices. Zone-rhythm correspondence: ++ long settled notes,
  +- medium wandering, -- short tense oscillations, -+ held inevitable
  static chord. This *is* counterpoint, derived from first principles.
- [`zeno.py`](zeno.py) — *The Zeno Settling Composition.* Void, then
  the harmonic series of C2 assembled one voice at a time, with
  timing and amplitude compressed by the golden ratio. Prime-limit
  zone of harmonic n maps to nuclear zone: 1-limit ↔ ++, 3-limit ↔ +-,
  5-limit ↔ -+, 7/11/13-limit ↔ -- (the shadow, Transfer-stable but
  Saturation-unstable — the harmonic *is* in the overtone series but
  doesn't settle in the tonal center).
- [`ritm-live.py`](ritm-live.py) — *Hear the Relational ∞-Topos.*
  Builds a `RelationalCell`, computes `normalized_entropy`,
  `relational_curvature`, `coherence_index`; turns those into a WAV
  via numpy and plays through `aplay` / `ffplay` / `afplay`. The
  cell's measurements drive the sound directly.
- [`ritm-duet.py`](ritm-duet.py) — Two-voice live performance via
  pygame MIDI. Voice A walks the truth-set Y; voice B derives chords
  from the relation R; cohesion measurements modulate dynamics.

## Output conventions

- Audio output: WAV files in `build/music/`. Some toys also emit MIDI.
- Common dependencies: `numpy`, `scipy.io.wavfile`. Toys composition,
  music, quartet, zeno are self-contained. ritm-live and ritm-duet
  rely on the cohesion library files (`cell.py`, `cell_rules.py`,
  `analysis.py`, `category.py`, `geometry.py`) shipped alongside.
