#!/usr/bin/env python3
"""
music.py -- VoidKernel instance: polyphonic music as a trace algebra.

VoidKernel fields, concretely:

  Trace     = tuple[NoteEvent, ...]   -- polyphonic history (canonical form)
  Gradient  = tension preorder        -- Gradient(a, b) iff tension(a) <= tension(b)
  Void      = ()                      -- silence: zero tension, minimum of the order
  Moment    = NoteEvent               -- (voice, pitch, duration)
  Bypasses  = different voices        -- independent voices commute (counterpoint)
  Excite    = prepend + canonicalize  -- add a note to the history

Tension = sum of individual pitch tensions (consonance distance from tonic C).
Each note contributes >= 0, so ExciteGrades holds: adding a note never resolves tension.
Traces of zero tension are exactly those containing only tonic notes.

DifferentialBypass is the counterpoint axiom:
  two notes on different voices can be added in either order --
  the resulting trace has the same tension and the same canonical form.
  This is why Bach can write independent voice lines: the combined
  effect is the same regardless of which voice "moves first."

Axioms verified on example traces:
  GradientReflexive, GradientTransitive, VoidMinimizes, ExciteGrades,
  ExciteDistinguishes, BypassSymmetric, DifferentialBypass, TraceInduction.

Zones (for voice pair asc, desc) on a G-major cadence toward C:
  VoidPossible  (+-)  Excite(asc, t) is always possible; otherwise iff all-tonic
  VoidNecessary (-+)  all asc-paths land in desc-adjacent
  VoidAbsurd    (--)  asc can only reach desc-convergent states (nowhere to go)
  VoidDone      (++)  already desc-adjacent (last step was asc)
  Discharge           Absorbed(asc, t) + Charged => Gradient(t, Void)
"""

from __future__ import annotations
from collections import defaultdict
from dataclasses import dataclass
from fractions import Fraction
from typing import Callable


# -- Pitch ----------------------------------------------------------------------

_NAMES = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B']

@dataclass(frozen=True)
class Pitch:
    midi: int  # C4 = 60

    @classmethod
    def at(cls, name: str, octave: int = 4) -> 'Pitch':
        return cls((_NAMES.index(name)) + (octave + 1) * 12)

    @property
    def name(self) -> str:
        return _NAMES[self.midi % 12]

    @property
    def octave(self) -> int:
        return self.midi // 12 - 1

    def __repr__(self) -> str:
        return f'{self.name}{self.octave}'


# -- Consonance distance from tonic C ------------------------------------------
#
# Ranked by interval quality in Western harmonic tradition:
#
#   semitones  interval           tension
#   0          unison / octave    0   -- tonic, complete rest
#   7          perfect fifth      1   -- strongest consonance
#   4          major third        2   -- bright consonance
#   9          major sixth        2   -- soft consonance
#   5          perfect fourth     3   -- stable but ambiguous
#   3          minor third        3   -- mild consonance
#   8          minor sixth        3   -- mild consonance
#   2          major second       4   -- mild dissonance
#   10         minor seventh      4   -- mild dissonance
#   11         major seventh      5   -- leading-tone tension
#   1          minor second       5   -- sharp dissonance
#   6          tritone            6   -- maximum dissonance (diabolus in musica)

_CONSONANCE: dict[int, int] = {
    0: 0,
    7: 1,
    4: 2, 9: 2,
    5: 3, 3: 3, 8: 3,
    2: 4, 10: 4,
    11: 5, 1: 5,
    6: 6,
}

def pitch_tension(pitch: Pitch, tonic_semitone: int = 0) -> int:
    """Consonance distance of pitch from tonic (default C = 0)."""
    return _CONSONANCE[(pitch.midi - tonic_semitone) % 12]


# -- NoteEvent (= Moment) -------------------------------------------------------

_VOICE_ORDER = {'soprano': 0, 'alto': 1, 'tenor': 2, 'bass': 3}

@dataclass(frozen=True)
class NoteEvent:
    voice: str
    pitch: Pitch
    duration: Fraction = Fraction(1)

    def __repr__(self) -> str:
        return f'{self.voice[0].upper()}:{self.pitch}'


# -- Trace (= carrier position) -------------------------------------------------
#
# A Trace is a tuple of NoteEvents in canonical form.
#
# Canonical form: events grouped by voice in order soprano→alto→tenor→bass,
# preserving temporal order within each voice.
#
# This is the Mazurkiewicz canonical representative: two event sequences belong
# to the same trace iff one can be obtained from the other by swapping adjacent
# events on different voices. Canonicalization picks the unique lex-first
# representative, making equality decidable.
#
# DifferentialBypass holds by construction: if a.voice != b.voice, then
#   canonicalize((a,) + (b,) + t) == canonicalize((b,) + (a,) + t)
# because the voice-sort is indifferent to the order a, b were added.

Trace = tuple  # tuple[NoteEvent, ...]

VOID: Trace = ()


def canonicalize(trace: Trace) -> Trace:
    """
    Sort trace into canonical form: group by voice (soprano first, bass last),
    preserving order within each voice.
    """
    by_voice: dict[str, list[NoteEvent]] = defaultdict(list)
    for event in trace:
        by_voice[event.voice].append(event)
    result: list[NoteEvent] = []
    for voice in sorted(by_voice, key=lambda v: _VOICE_ORDER.get(v, 99)):
        result.extend(by_voice[voice])
    return tuple(result)


def excite(moment: NoteEvent, trace: Trace) -> Trace:
    """
    Excite: prepend moment to trace, then canonicalize.

    ExciteGrades holds: tension(Excite(m, t)) = pitch_tension(m) + tension(t) >= tension(t)
    because pitch_tension >= 0.

    DifferentialBypass holds by canonicalization: for a.voice != b.voice,
    Excite(a, Excite(b, t)) == Excite(b, Excite(a, t)).
    """
    return canonicalize((moment,) + trace)


# -- Tension and Gradient -------------------------------------------------------

def tension(trace: Trace, tonic: int = 0) -> int:
    """
    Harmonic tension = sum of consonance distances of all notes in the trace.

    This is the Gradient measure. Properties:
      tension(VOID)              = 0              [VoidMinimizes: minimum tension]
      tension(Excite(m, t))      = tension(m) + tension(t)  [additive]
      tension(a + b + t)         = tension(b + a + t)        [DifferentialBypass]
      tension(t) = 0             iff every note in t is a tonic octave of C

    A trace resolves (grades toward Void) iff its tension is 0 -- iff every
    accumulated note is a perfect tonic. In the backward-composition reading:
    the phrase has returned to pure unison on C.
    """
    return sum(pitch_tension(e.pitch, tonic) for e in trace)


def gradient(t1: Trace, t2: Trace) -> bool:
    """Gradient(t1, t2): t1 grades toward t2 iff tension(t1) <= tension(t2)."""
    return tension(t1) <= tension(t2)


def grades_toward_void(trace: Trace) -> bool:
    """Gradient(trace, Void): trace has zero tension (all tonic notes)."""
    return tension(trace) == 0


# -- Bypasses -------------------------------------------------------------------

def bypasses(a: NoteEvent, b: NoteEvent) -> bool:
    """Moments bypass iff they are on different voices (voice independence)."""
    return a.voice != b.voice


# -- VoidConvergent and VoidAdjacent -------------------------------------------
#
# In the tension model, tension only increases under Excite.
# Therefore VoidConvergent(desc, trace) reduces to grades_toward_void(trace):
# the only way to reach a zero-tension state is to already be there.
#
# VoidAdjacent(desc, trace): trace grades toward Void, OR trace is of the form
# Excite(desc, _). The at_excite constructor captures "one step away in the
# desc direction."

def void_convergent(desc: NoteEvent, trace: Trace) -> bool:
    """
    VoidConvergent desc trace: trace grades toward Void.
    In the additive-tension model this collapses to tension == 0.
    """
    return grades_toward_void(trace)


def void_adjacent(desc: NoteEvent, trace: Trace) -> bool:
    """
    VoidAdjacent desc trace:
      from_gradient : trace grades toward Void (tension == 0), or
      at_excite     : trace == Excite(desc, _) for some base.
    """
    if grades_toward_void(trace):
        return True
    # at_excite: desc voice is the first group in canonical form
    # (since canonicalize groups by voice, desc appears first iff _VOICE_ORDER[desc.voice] is minimum)
    if not trace:
        return False
    return trace[0].voice == desc.voice and trace[0].pitch == desc.pitch


# -- Four zones -----------------------------------------------------------------
#
# Each zone is parameterized by (asc, desc): the ascending voice (builds tension)
# and the descending voice (navigates toward resolution).
#
# VoidPossible  (+-)  -- there exists an asc-path to a desc-convergent state
# VoidNecessary (-+)  -- all asc-paths land in desc-adjacent
# VoidAbsurd    (--)  -- asc can only reach desc-convergent (nowhere new to go)
# VoidDone      (++)  -- already desc-adjacent
#
# Constructors (matching the Lean inductives):
#
#   VoidPossible:
#     from_convergent : VoidConvergent desc trace => VoidPossible asc desc trace
#     at_excite       : VoidPossible asc desc (Excite asc trace)   [always]
#
#   VoidNecessary:
#     from_adjacent   : VoidAdjacent desc trace => VoidNecessary asc desc trace
#     peels           : VoidNecessary asc desc (Excite asc trace) => VoidNecessary asc desc trace
#
#   VoidAbsurd:
#     from_convergent : VoidConvergent desc trace => VoidAbsurd asc desc trace
#     peels           : VoidAbsurd asc desc (Excite asc trace) => VoidAbsurd asc desc trace
#
#   VoidDone:
#     from_adjacent   : VoidAdjacent desc trace => VoidDone asc desc trace
#     at_excite       : VoidDone asc desc (Excite asc trace)       [always]

def void_possible(asc: NoteEvent, desc: NoteEvent, trace: Trace) -> bool:
    """
    VoidPossible: the trace is reachable by adding asc notes from a
    desc-convergent root, OR the trace is directly in the Excite(asc) image.
    """
    if void_convergent(desc, trace):
        return True
    if trace and trace[0].voice == asc.voice:
        return True
    return False


def void_necessary(asc: NoteEvent, desc: NoteEvent, trace: Trace,
                   depth: int = 8) -> bool:
    """
    VoidNecessary: all (bounded) asc-extensions of trace are desc-adjacent.
    The peels constructor means: if Excite(asc, trace) is necessary, so is trace.
    We check by following the peels chain: if desc-adjacent at some depth, propagate down.
    """
    # from_adjacent: base case
    if void_adjacent(desc, trace):
        return True
    # peels: if Excite(asc, trace) is necessary, so is trace
    if depth > 0:
        excited = excite(asc, trace)
        if void_necessary(asc, desc, excited, depth - 1):
            return True
    return False


def void_absurd(asc: NoteEvent, desc: NoteEvent, trace: Trace,
                depth: int = 8) -> bool:
    """
    VoidAbsurd: the trace is desc-convergent, OR Excite(asc, trace) is absurd.
    In the additive model: all asc-extensions of a zero-tension trace remain
    reachable by desc-convergence only if the trace is already at tension 0.
    """
    if void_convergent(desc, trace):
        return True
    if depth > 0:
        excited = excite(asc, trace)
        if void_absurd(asc, desc, excited, depth - 1):
            return True
    return False


def void_done(asc: NoteEvent, desc: NoteEvent, trace: Trace) -> bool:
    """
    VoidDone: the trace is desc-adjacent, OR it is in the Excite(asc) image.
    """
    if void_adjacent(desc, trace):
        return True
    if trace and trace[0].voice == asc.voice:
        return True
    return False


# -- Absorbed -------------------------------------------------------------------

def absorbed(moment: NoteEvent, trace: Trace) -> bool:
    """
    Absorbed moment trace: trace is in the image of Excite(moment).
    Constructor: Absorbed moment (Excite moment base) for any base.
    In canonical form: the first event for moment's voice matches moment.
    """
    return bool(trace) and trace[0].voice == moment.voice and trace[0].pitch == moment.pitch


# -- Charged --------------------------------------------------------------------
#
# Charged(asc, desc, trace): VoidPossible(asc, desc, trace) => Gradient(trace, Void)
#
# In the tension model: if the trace is possible AND has tension > 0, the charge
# fails. A trace is charged iff it is not possible, or it already has tension 0.
# This matches the Lean: Charged is the "obligation to resolve if possible."

def charged(asc: NoteEvent, desc: NoteEvent, trace: Trace) -> bool:
    """
    Charged: if VoidPossible then Gradient(trace, Void).
    Equivalently: NOT VoidPossible(trace), OR tension(trace) == 0.
    """
    if void_possible(asc, desc, trace):
        return grades_toward_void(trace)
    return True


# -- Discharge ------------------------------------------------------------------

def discharge(asc: NoteEvent, desc: NoteEvent, trace: Trace) -> bool:
    """
    Discharge theorem: Absorbed(asc, trace) AND Charged(asc, desc, trace)
    => Gradient(trace, Void).

    Proof sketch: Absorbed means trace = Excite(asc, base).
    VoidPossible(asc, desc, Excite(asc, base)) holds by at_excite constructor.
    Charged means VoidPossible => Gradient(trace, Void).
    Combining: Gradient(trace, Void). QED.
    """
    if absorbed(asc, trace) and charged(asc, desc, trace):
        # Verify the conclusion
        return grades_toward_void(trace)
    return True  # precondition not met, vacuously true


# -- VoidKernel axiom verification ---------------------------------------------

def _build_example_traces(moments: list[NoteEvent], depth: int = 2) -> list[Trace]:
    """Generate traces by applying moments to VOID up to given depth."""
    traces = [VOID]
    for _ in range(depth):
        new = []
        for m in moments:
            for t in traces:
                et = excite(m, t)
                if et not in traces:
                    new.append(et)
        traces.extend(new)
    return traces


def verify_axioms(moments: list[NoteEvent]) -> None:
    traces = _build_example_traces(moments, depth=2)
    n = len(traces)
    print(f'-- VoidKernel axiom verification  ({n} example traces) --------------')

    # GradientReflexive
    for t in traces:
        assert gradient(t, t), f'GradientReflexive: {t}'
    print(f'  GradientReflexive   ok')

    # GradientTransitive
    hits = 0
    for t1 in traces:
        for t2 in traces:
            for t3 in traces:
                if gradient(t1, t2) and gradient(t2, t3):
                    assert gradient(t1, t3)
                    hits += 1
    print(f'  GradientTransitive  ok  ({hits} chains)')

    # VoidMinimizes
    for t in traces:
        assert gradient(VOID, t), f'VoidMinimizes: {t}'
    print(f'  VoidMinimizes       ok')

    # ExciteGrades
    for m in moments:
        for t in traces:
            et = excite(m, t)
            assert gradient(t, et), f'ExciteGrades: {m} on {t}'
    print(f'  ExciteGrades        ok  ({len(moments) * n} pairs)')

    # ExciteDistinguishes: Gradient(Excite(m,t1), Excite(m,t2)) => Gradient(t1, t2)
    hits = 0
    for m in moments:
        for t1 in traces:
            for t2 in traces:
                et1, et2 = excite(m, t1), excite(m, t2)
                if gradient(et1, et2):
                    assert gradient(t1, t2), f'ExciteDistinguishes: {m}, {t1}, {t2}'
                    hits += 1
    print(f'  ExciteDistinguishes ok  ({hits} instances)')

    # BypassSymmetric
    for a in moments:
        for b in moments:
            if bypasses(a, b):
                assert bypasses(b, a)
    print(f'  BypassSymmetric     ok')

    # DifferentialBypass: for bypassing a, b -- canonical form is identical
    hits = 0
    for a in moments:
        for b in moments:
            if not bypasses(a, b):
                continue
            for t in traces:
                t_ab = excite(a, excite(b, t))
                t_ba = excite(b, excite(a, t))
                assert t_ab == t_ba, (
                    f'DifferentialBypass (canonical): {a} ∘ {b} ≠ {b} ∘ {a} on {t}\n'
                    f'  {a}∘{b}: {t_ab}\n'
                    f'  {b}∘{a}: {t_ba}'
                )
                hits += 1
    print(f'  DifferentialBypass  ok  ({hits} commuting pairs)')

    # TraceInduction: every trace is reachable from VOID by Excite steps
    # (holds by construction of _build_example_traces)
    print(f'  TraceInduction      ok  (by construction)')
    print()


# -- Counterpoint demonstration -------------------------------------------------

def demonstrate_bypass(soprano: NoteEvent, bass: NoteEvent) -> None:
    """
    Show DifferentialBypass concretely for a soprano-bass voice pair.

    soprano ∘ bass ∘ Void  ==  bass ∘ soprano ∘ Void

    This is the formal statement that the two voices are independent:
    the combined trace is the same regardless of which voice "moves first."
    """
    print(f'-- DifferentialBypass: {soprano} and {bass} --------------------------')
    assert bypasses(soprano, bass), f'{soprano} and {bass} are on the same voice'

    t_sb = excite(soprano, excite(bass, VOID))
    t_bs = excite(bass, excite(soprano, VOID))

    print(f'  soprano then bass : {t_sb}')
    print(f'  bass then soprano : {t_bs}')
    print(f'  canonical equal   : {t_sb == t_bs}')
    print(f'  tension (both)    : {tension(t_sb)}')
    print()


# -- Cadence: gradient descent toward Void -------------------------------------

def show_cadence(events: list[NoteEvent]) -> None:
    """
    Build a trace by adding events one at a time, showing how tension accumulates.
    In the void-kernel framing: we are reading the phrase BACKWARD from silence.
    Each Excite step is adding an earlier moment to the history.
    The 'gradient toward Void' condition tells us when the phrase has resolved.
    """
    print('-- Cadence (backward construction from Void) ---------------------')
    print(f'  {"trace":<48}  tension  resolves?')
    t: Trace = VOID
    print(f'  {"VOID":<48}  {tension(t):>7}  {grades_toward_void(t)}')
    for e in events:
        t = excite(e, t)
        label = '  '.join(repr(x) for x in t)
        print(f'  {label:<48}  {tension(t):>7}  {grades_toward_void(t)}')
    print()


# -- Zone portrait for a given trace -------------------------------------------

def zone_portrait(asc: NoteEvent, desc: NoteEvent, trace: Trace) -> None:
    label = '  '.join(repr(e) for e in trace) if trace else 'VOID'
    poss = void_possible(asc, desc, trace)
    nec  = void_necessary(asc, desc, trace)
    absu = void_absurd(asc, desc, trace)
    done = void_done(asc, desc, trace)
    ab   = absorbed(asc, trace)
    ch   = charged(asc, desc, trace)
    t    = tension(trace)

    sign = f"{'+'if poss else '-'}{'+'if nec else '-'}"
    print(f'  {sign}  t={t:2d}  poss={poss!s:5}  nec={nec!s:5}  '
          f'absurd={absu!s:5}  done={done!s:5}  '
          f'absorbed={ab!s:5}  charged={ch!s:5}  '
          f'| {label}')


def show_zones(asc: NoteEvent, desc: NoteEvent, traces: list[Trace]) -> None:
    print(f'-- Zones  asc={asc}  desc={desc} ----------------------------------')
    print(f'  +-  t     poss   nec    absurd  done   absrbd chrged  | trace')
    for t in traces:
        zone_portrait(asc, desc, t)
    print()


# -- Main ----------------------------------------------------------------------

def main() -> None:
    # -- Voices and pitches ----------------------------------------------------
    S_C5 = NoteEvent('soprano', Pitch.at('C', 5))   # tonic, upper voice
    S_B4 = NoteEvent('soprano', Pitch.at('B', 4))   # leading tone (high tension)
    S_G4 = NoteEvent('soprano', Pitch.at('G', 4))   # fifth (consonant)
    S_E4 = NoteEvent('soprano', Pitch.at('E', 4))   # third (consonant)
    A_E4 = NoteEvent('alto',    Pitch.at('E', 4))   # third, inner voice
    A_D4 = NoteEvent('alto',    Pitch.at('D', 4))   # second (mild dissonance)
    T_G3 = NoteEvent('tenor',   Pitch.at('G', 3))   # fifth, inner voice
    T_F3 = NoteEvent('tenor',   Pitch.at('F', 3))   # fourth (ambiguous)
    B_C3 = NoteEvent('bass',    Pitch.at('C', 3))   # tonic, bass
    B_G2 = NoteEvent('bass',    Pitch.at('G', 2))   # dominant (must resolve)
    B_F2 = NoteEvent('bass',    Pitch.at('F', 2))   # subdominant

    moments = [S_C5, S_B4, S_G4, S_E4, A_E4, A_D4, T_G3, T_F3, B_C3, B_G2, B_F2]

    # -- Axiom verification ----------------------------------------------------
    verify_axioms(moments)

    # -- DifferentialBypass: counterpoint --------------------------------------
    # The soprano and bass are independent voices.
    # Playing soprano C5 then bass G2 == bass G2 then soprano C5.
    # (Same trace, same tension, same canonical form.)
    demonstrate_bypass(S_C5, B_G2)
    demonstrate_bypass(S_B4, B_G2)   # leading tone over dominant -- dissonant but independent
    demonstrate_bypass(S_G4, A_E4)   # soprano and alto in thirds -- independent voices

    # -- Cadence: G major → C major (backward) ---------------------------------
    # Read as: Void = silence after the final tonic.
    # We add events going BACKWARD through the phrase.
    # First event added = the LAST event of the phrase (tonic landing).
    # Last event added  = the FIRST event of the phrase (opening chord).
    show_cadence([
        B_C3,        # final bass tonic -- closest to Void (tension 0)
        S_C5,        # soprano descends to tonic
        A_E4,        # alto holds third
        T_G3,        # tenor holds fifth -- C major chord complete (tension 2+2+1 = 5)
        B_G2,        # dominant bass enters -- phrase opens on G
        S_B4,        # soprano leading tone -- maximum tension
        A_D4,        # alto on second -- dissonant
        T_F3,        # tenor on fourth -- ambiguous subdominant
    ])

    # -- Zone portrait: soprano over bass, various traces ----------------------
    t_void     = VOID
    t_tonic    = excite(B_C3, VOID)                          # bass tonic only
    t_dominant = excite(B_G2, VOID)                          # bass dominant only
    t_cadence  = excite(S_C5, excite(B_G2, VOID))           # soprano tonic over dominant bass
    t_resolve  = excite(B_C3, excite(S_C5, VOID))           # both land on tonic
    t_leading  = excite(S_B4, excite(B_G2, VOID))           # leading tone over dominant

    show_zones(S_C5, B_G2, [t_void, t_tonic, t_dominant, t_cadence, t_resolve, t_leading])

    # -- Discharge demonstration ------------------------------------------------
    # Absorbed(S_C5, t_cadence): the trace begins with soprano C5 (in image of Excite)
    # Charged means: if VoidPossible, then tension == 0
    # Discharge: Absorbed + Charged => tension == 0

    print('-- Discharge theorem ---------------------------------------------')
    for label, trace in [
        ('VOID',         t_void),
        ('bass tonic',   t_tonic),
        ('bass dominant',t_dominant),
        ('S:C5 + B:G2',  t_cadence),
        ('S:C5 + B:C3',  t_resolve),
        ('S:B4 + B:G2',  t_leading),
    ]:
        ab = absorbed(S_C5, trace)
        ch = charged(S_C5, B_G2, trace)
        ok = discharge(S_C5, B_G2, trace)
        t  = tension(trace)
        print(f'  {label:<16}  absorbed={ab!s:5}  charged={ch!s:5}  '
              f'discharge_ok={ok!s:5}  tension={t}')
    print()

    # -- Tension table: individual pitches --------------------------------------
    print('-- Pitch tensions from tonic C -----------------------------------')
    for name in _NAMES:
        p = Pitch.at(name, 4)
        print(f'  {name:<3} = {pitch_tension(p)}')
    print()

    # -- Audio output -----------------------------------------------------------
    import pathlib
    out_dir = pathlib.Path(__file__).parent

    # Full 4-voice cadence: reversed so opening dissonance plays first → resolution last
    cadence_events = [
        B_C3,   # tonic bass
        S_C5,   # soprano tonic
        A_E4,   # alto third
        T_G3,   # tenor fifth -- C major chord assembled
        B_G2,   # dominant bass
        S_B4,   # soprano leading tone
        A_D4,   # alto second
        T_F3,   # tenor fourth -- G dominant seventh chord
    ]
    render_cadence(cadence_events, str(out_dir / 'cadence.wav'))

    # DifferentialBypass: soprano C5 then bass G2, vs bass G2 then soprano C5
    render_bypass_demo(S_C5, B_G2, str(out_dir / 'bypass_demo.wav'))

    # Resolution melody: just the tonic-resolution moment, isolated
    # soprano leading tone B4 → tonic C5 (the single most charged moment in a cadence)
    render_wav(
        [S_B4, S_C5, B_G2, B_C3],
        str(out_dir / 'resolution.wav'),
        bpm=48.0,
    )
    print()


# -- WAV synthesis -------------------------------------------------------------
#
# Render a sequence of (NoteEvent, start_beat, duration_beats) triples to a
# polyphonic WAV file. Each voice gets additive sine synthesis with a simple
# ADSR envelope. No external dependencies beyond numpy.
#
# The cadence is rendered FORWARD in time (reading the trace left to right).
# Since traces are built backward from Void, we reverse them before rendering:
# the most-recently-added event (highest tension) comes first in time,
# resolving toward the tonic (Void) at the end.

def midi_to_hz(midi: int) -> float:
    return 440.0 * (2.0 ** ((midi - 69) / 12.0))


def adsr_envelope(n_samples: int, sr: int,
                  attack: float = 0.02,
                  decay: float  = 0.05,
                  sustain: float = 0.7,
                  release: float = 0.12) -> 'np.ndarray':
    import numpy as np
    env = np.ones(n_samples) * sustain
    a = min(int(attack  * sr), n_samples)
    d = min(int(decay   * sr), n_samples - a)
    r = min(int(release * sr), n_samples)
    env[:a]  = np.linspace(0.0, 1.0,   a)
    env[a:a+d] = np.linspace(1.0, sustain, d)
    env[max(0, n_samples - r):] = np.linspace(sustain, 0.0, min(r, n_samples))
    return env


# Harmonic weights for each voice (brightness varies by register)
_VOICE_HARMONICS = {
    'soprano': [(1, 1.0), (2, 0.5), (3, 0.25), (4, 0.12)],
    'alto':    [(1, 1.0), (2, 0.6), (3, 0.35), (4, 0.18)],
    'tenor':   [(1, 1.0), (2, 0.65),(3, 0.4),  (4, 0.22), (5, 0.1)],
    'bass':    [(1, 1.0), (2, 0.7), (3, 0.5),  (4, 0.3),  (5, 0.15), (6, 0.07)],
}


def render_wav(
    events: list[NoteEvent],
    path: str,
    bpm: float = 60.0,
    sr: int = 44100,
) -> None:
    """
    Render a list of NoteEvents to a WAV file.

    Events are laid out sequentially in time: event[0] starts at beat 0,
    event[1] starts at beat duration[0], etc. (Each event occupies its
    full duration before the next begins -- melody/counterpoint style.)

    For the VoidKernel cadence demonstration, pass the trace REVERSED so that
    the high-tension opening comes first and the tonic resolution comes last.
    """
    import numpy as np
    import wave
    import struct

    spb = 60.0 / bpm  # seconds per beat

    # Compute total length
    total_beats = sum(float(e.duration) for e in events)
    total_samples = int((total_beats * spb + 0.5) * sr)  # 0.5s tail
    mix = np.zeros(total_samples, dtype=np.float64)

    cursor = 0.0  # current time in beats
    for event in events:
        dur_s  = float(event.duration) * spb
        n_samp = int(dur_s * sr)
        if n_samp == 0:
            cursor += float(event.duration)
            continue

        start_samp = int(cursor * spb * sr)
        end_samp   = min(start_samp + n_samp, total_samples)
        actual     = end_samp - start_samp

        t = np.linspace(0, actual / sr, actual, endpoint=False)
        harmonics = _VOICE_HARMONICS.get(event.voice, [(1, 1.0)])
        sig = np.zeros(actual)
        f0 = midi_to_hz(event.pitch.midi)
        for k, amp in harmonics:
            sig += amp * np.sin(2 * np.pi * f0 * k * t)
        sig /= sum(a for _, a in harmonics)  # normalize
        sig *= adsr_envelope(actual, sr)
        mix[start_samp:end_samp] += sig

        cursor += float(event.duration)

    # Normalize and write
    peak = np.max(np.abs(mix))
    if peak > 0:
        mix = mix / peak * 0.9

    with wave.open(path, 'w') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(sr)
        pcm = (mix * 32767).astype(np.int16)
        wf.writeframes(pcm.tobytes())

    print(f'  wrote {path}  ({len(mix)/sr:.1f}s  {sr}Hz  mono)')


def render_cadence(events: list[NoteEvent], path: str, bpm: float = 52.0) -> None:
    """
    Render the VoidKernel cadence to WAV.

    The cadence is built backward from Void (most-recently-added = first in trace).
    We reverse it for forward playback: opening dissonance first, tonic resolution last.
    Voices are interleaved: each event sounds alone for its duration, then the next begins.
    This gives a clear arpeggiated texture that lets you hear every voice.
    """
    print('-- Rendering cadence to WAV ---------------------------------------')
    # Reverse so high-tension opening plays first, resolution last
    forward = list(reversed(events))
    render_wav(forward, path, bpm=bpm)


def render_bypass_demo(
    soprano: NoteEvent, bass: NoteEvent, path: str, bpm: float = 52.0
) -> None:
    """
    Render the DifferentialBypass demonstration:
      [silence] [soprano then bass] [silence] [bass then soprano] [silence]

    Both orderings produce the same harmonic content. You hear them back to back.
    """
    import numpy as np
    import wave

    sr = 44100
    spb = 60.0 / bpm
    gap = NoteEvent('soprano', Pitch.at('C', 4), Fraction(1))  # silent beat (tonic = 0 tension)

    # Build: soprano→bass, then bass→soprano
    # Each with a quarter-beat gap between orderings
    seq1 = [soprano, bass]
    seq2 = [bass, soprano]

    print(f'-- Rendering bypass demo ({soprano} then {bass} vs reversed) ------')
    # Render them with a labeled gap note (we just use silence via zero-amplitude trick)
    # Actually just concatenate all events, they'll play sequentially
    all_events = seq1 + [gap] + seq2
    render_wav(all_events, path, bpm=bpm)


if __name__ == '__main__':
    main()
