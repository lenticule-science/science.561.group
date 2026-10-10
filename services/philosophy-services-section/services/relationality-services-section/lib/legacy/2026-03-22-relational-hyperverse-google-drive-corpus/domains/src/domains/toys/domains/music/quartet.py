#!/usr/bin/env python3
"""
quartet.py -- VoidKernel: The Nuclear Quartet in C (Polyphonic)

DifferentialBypass made audible as counterpoint.

Each voice is an independent stream of Excite steps.
Because Bypasses(a, b) holds whenever a and b are on different voices,
voices can interleave freely -- the canonical trace is the same
regardless of which voice "moves first."

This IS counterpoint, derived from first principles.

Zone-rhythm correspondence (zone stability governs note length):
  ++  VoidDone:      long notes, settled, voices breathe slowly
  +-  VoidPossible:  medium notes, exploring, wandering upward
  --  VoidAbsurd:    short oscillating notes, tense, trapped
  -+  VoidNecessary: held static chord, inevitable, pointing home

Section timeline (Zeno-phi compressed durations):
  k   zone  start     dur       harmonic function
  0   ++    0.000s    4.000s    I   C major  -- VoidDone: home
  1   +-    4.000s    2.472s    IV  F major  -- VoidPossible: wandering
  2   --    6.472s    1.528s    vii B dim    -- VoidAbsurd: shadow
  3   -+    8.000s    0.944s    V7  G7       -- VoidNecessary: inevitable
  4   ++    8.944s    5.584s    I   C major  -- Discharge fires, resolution

Voice leading:
  Soprano: C5 - F5 - B4 - D5 - C5  (arch up, shadow, ninth, resolve)
  Alto:    E4 - A4 - F4 - F4 - E4  (fourth up, third down, hold, half-step)
  Tenor:   G3 - E3 - D3 - B3 - G3  (stepwise down, leap up, third down)
  Bass:    C2 - F2 - B1 - G1 - C2  (fourth up, dim fifth down, PAC)

Counterpoint within sections:
  S0: soprano ascending arch C->D->E->D->C; tenor neighbor G->A->G
  S1: all voices descend/neighbor toward dim chord approach
  S2: soprano oscillates B->A->B; tenor steps E->D; bass+alto static
  S3: all hold -- stillness IS the inevitability
  S4: soprano brief arch then long settle; voices return to tonic

Discharge at final ++:
  Absorbed(soprano, trace): trace opens with soprano's C5
  Charged(soprano, bass, trace): VoidPossible resolved to VoidDone
  => Gradient(trace, Void). Resolution.
"""

from __future__ import annotations
import math
import wave
from pathlib import Path

import numpy as np

PHI = (1.0 + math.sqrt(5.0)) / 2.0
SR  = 44100


# -- Pitch constants (MIDI note numbers) ------------------------------------

C2, F2         = 36, 41
B1, G1         = 35, 31
C3, D3, E3     = 48, 50, 52
F3, G3, A3, B3 = 53, 55, 57, 59
D4, E4, F4, G4, A4, B4 = 62, 64, 65, 67, 69, 71
C5, D5, E5, F5, G5     = 72, 74, 76, 77, 79


# -- Voice profiles ---------------------------------------------------------

VOICE_PROFILE = {
    'soprano': dict(n_harmonics=5),
    'alto':    dict(n_harmonics=5),
    'tenor':   dict(n_harmonics=6),
    'bass':    dict(n_harmonics=7),
}

VOICE_AMPLITUDE = {
    'soprano': 0.35,
    'alto':    0.30,
    'tenor':   0.28,
    'bass':    0.40,
}


# -- ADSR -------------------------------------------------------------------

def adsr(n: int, attack_s=0.015, decay_s=0.06, sustain=0.72, release_s=0.12) -> np.ndarray:
    env = np.ones(n) * sustain
    a   = min(int(attack_s * SR), n)
    d   = min(int(decay_s  * SR), n - a)
    r   = min(int(release_s * SR), n)
    env[:a]                   = np.linspace(0.0, 1.0, a)
    env[a:a+d]                = np.linspace(1.0, sustain, d)
    env[max(0, n - r):]      *= np.linspace(1.0, 0.0, min(r, n))
    return env


# -- Note synthesis ---------------------------------------------------------

def synthesize_note(
    midi:       int,
    duration_s: float,
    voice:      str,
    amplitude:  float,
    seed:       int = 0,
) -> np.ndarray:
    """phi-weighted decaying overtone synthesis (same as composition.py)."""
    J      = VOICE_PROFILE[voice]['n_harmonics']
    rng    = np.random.default_rng(seed + midi * 100)
    phases = rng.uniform(0, 2 * math.pi, J)
    n      = max(int(duration_s * SR), 1)
    t      = np.arange(n, dtype=float) / SR
    f0     = 440.0 * 2.0 ** ((midi - 69) / 12.0)
    sig    = np.zeros(n)
    for j in range(1, J + 1):
        freq = f0 * j
        if freq >= SR / 2:
            break
        sig += amplitude * PHI**(-(j-1)) * np.sin(2.0 * math.pi * freq * t + phases[j-1])
    sig *= adsr(n)
    return sig


# -- Score ------------------------------------------------------------------
#
# Format: list of (onset_s, duration_s, voice, midi_note)
#
# Voices move independently within each section (DifferentialBypass).
# The section boundaries define the harmonic rhythm (Zeno-phi compressed).
# Within sections, voices have their own rhythmic patterns.

def build_score(T: float = 4.0, ring_out: float = 5.0) -> list[tuple[float, float, str, int]]:
    """
    Build the full polyphonic score as note events.

    Section durations: T, T/phi, T/phi^2, T/phi^3, T/phi^4 + ring_out
    Within each section, voices move at their own rhythm.
    """
    # Section durations
    dur = [T * PHI**(-k) for k in range(5)]
    dur[4] += ring_out

    # Section start times
    beg = [sum(dur[:k]) for k in range(5)]
    s0, s1, s2, s3, s4 = beg
    d0, d1, d2, d3, d4 = dur

    # Beat units per section (derived from section length)
    # Section 0 (++): q0 = d0/4 = 1.0s  -- long, settled
    # Section 1 (+-): q1 = d1/3          -- medium, wandering
    # Section 2 (--): q2 = d2/3          -- short, oscillating
    # Section 3 (-+): whole section is one beat (too short for motion)
    # Section 4 (++): q4 = d4/6          -- varied, settling

    q0 = d0 / 4
    q1 = d1 / 3
    q2 = d2 / 3
    q4 = d4 / 6

    events: list[tuple[float, float, str, int]] = []

    # ---------- Section 0: ++ C major I (VoidDone) -------------------------
    # Stable, grounded. Bass pedal. Soprano makes a gentle ascending arch
    # C5->D5->E5->D5->C5 -- the first Excite steps of the trace, settling.
    # Tenor neighbor G->A->G mirrors the soprano at the octave below.
    # Alto has a brief anticipation of IV (F4) then returns.

    # Bass: whole-note pedal on tonic
    events.append((s0, d0, 'bass', C2))

    # Tenor: G3, upper neighbor A3, return G3
    events.append((s0,        2*q0, 'tenor', G3))
    events.append((s0 + 2*q0, q0,   'tenor', A3))
    events.append((s0 + 3*q0, q0,   'tenor', G3))

    # Alto: E4 (long), brief anticipation F4, return E4
    events.append((s0,          2.5*q0, 'alto', E4))
    events.append((s0 + 2.5*q0, 0.5*q0, 'alto', F4))
    events.append((s0 + 3.0*q0, q0,     'alto', E4))

    # Soprano: ascending arch C5->D5->E5->D5->C5
    events.append((s0,          q0,     'soprano', C5))
    events.append((s0 + q0,     q0,     'soprano', D5))
    events.append((s0 + 2*q0,   q0,     'soprano', E5))
    events.append((s0 + 3*q0,   0.5*q0, 'soprano', D5))
    events.append((s0 + 3.5*q0, 0.5*q0, 'soprano', C5))

    # ---------- Section 1: +- F major IV (VoidPossible) --------------------
    # Wandering outward. Soprano reaches G5 -- the peak.
    # Tenor descends G->F->E, preparing the approach to dim.
    # Alto neighbors A->G->A.
    # Bass pedal on F2.

    events.append((s1, d1, 'bass', F2))

    # Tenor: stepwise descent G3->F3->E3
    events.append((s1,        q1, 'tenor', G3))
    events.append((s1 + q1,   q1, 'tenor', F3))
    events.append((s1 + 2*q1, q1, 'tenor', E3))

    # Alto: A4, neighbor G4, return A4
    events.append((s1,          d1/2, 'alto', A4))
    events.append((s1 + d1/2,   d1/4, 'alto', G4))
    events.append((s1 + 3*d1/4, d1/4, 'alto', A4))

    # Soprano: F5->G5 (up), G5->F5 (return)
    events.append((s1,        q1, 'soprano', F5))
    events.append((s1 + q1,   q1, 'soprano', G5))
    events.append((s1 + 2*q1, q1, 'soprano', F5))

    # ---------- Section 2: -- B dim vii° (VoidAbsurd) ----------------------
    # Shadow zone. Soprano trapped oscillating on B4->A4->B4 -- the shadow tone.
    # Tenor continues descent E3->D3 -- stepwise, into the diminished chord.
    # Alto holds F4 (tritone over B1 -- the defining shadow interval).
    # Bass holds B1 (dark, static).

    events.append((s2, d2, 'bass', B1))

    # Tenor: E3->D3 (step down into shadow chord)
    events.append((s2,        d2/2, 'tenor', E3))
    events.append((s2 + d2/2, d2/2, 'tenor', D3))

    # Alto: hold tritone (F4 over B = the shadow interval)
    events.append((s2, d2, 'alto', F4))

    # Soprano: oscillate on shadow tone B4->A4->B4
    events.append((s2,        q2, 'soprano', B4))
    events.append((s2 + q2,   q2, 'soprano', A4))
    events.append((s2 + 2*q2, q2, 'soprano', B4))

    # ---------- Section 3: -+ G7 V7 (VoidNecessary) -----------------------
    # All voices hold their dominant-seventh chord tones.
    # The STILLNESS is the inevitability -- sigma-stable, Delta-unstable.
    # Every voice knows exactly where it needs to go. Nothing to do but wait.

    events.append((s3, d3, 'bass',    G1))  # G1: open dominant
    events.append((s3, d3, 'tenor',   B3))  # B3: leading tone (sigma-stable)
    events.append((s3, d3, 'alto',    F4))  # F4: seventh (Delta-unstable)
    events.append((s3, d3, 'soprano', D5))  # D5: ninth (will step to C5)

    # ---------- Section 4: ++ C major I (VoidDone, Discharge) --------------
    # Resolution. Discharge fires.
    # Absorbed(soprano, trace): soprano C5 starts the trace.
    # Charged(soprano, bass, trace): VoidPossible -> VoidDone.
    # => Gradient(trace, Void). The music resolves.
    #
    # Soprano: D5->C5 resolution, then a brief decorative arch, then long settle.
    # Tenor: G3 with one neighbor motion mid-section.
    # Alto: E4 with brief passing D4.
    # Bass: tonic pedal, whole section.

    events.append((s4, d4, 'bass', C2))

    # Tenor: G3(2q), A3(q), G3(3q) -- gentle motion, then settle
    events.append((s4,          2*q4, 'tenor', G3))
    events.append((s4 + 2*q4,   q4,   'tenor', A3))
    events.append((s4 + 3*q4,   3*q4, 'tenor', G3))

    # Alto: E4(2.5q), D4(0.5q), E4(3q) -- brief passing, then settle
    events.append((s4,            2.5*q4, 'alto', E4))
    events.append((s4 + 2.5*q4,  0.5*q4, 'alto', D4))
    events.append((s4 + 3.0*q4,  3.0*q4, 'alto', E4))

    # Soprano: C5(1.5q), brief D5(0.5q), C5(0.5q), B4(0.5q), then final C5(3q)
    events.append((s4,            1.5*q4, 'soprano', C5))
    events.append((s4 + 1.5*q4,  0.5*q4, 'soprano', D5))   # brief upper
    events.append((s4 + 2.0*q4,  0.5*q4, 'soprano', C5))
    events.append((s4 + 2.5*q4,  0.5*q4, 'soprano', B4))   # brief lower neighbor
    events.append((s4 + 3.0*q4,  3.0*q4, 'soprano', C5))   # final long resolution

    return events


# -- Render -----------------------------------------------------------------

def render(events: list[tuple[float, float, str, int]], total_s: float) -> np.ndarray:
    """Mix all note events into a single audio buffer."""
    N   = int(total_s * SR)
    mix = np.zeros(N)
    for i, (onset, dur, voice, midi) in enumerate(events):
        amp  = VOICE_AMPLITUDE[voice]
        note = synthesize_note(midi, dur, voice, amp, seed=i * 17 + midi)
        s    = int(onset * SR)
        end  = min(s + len(note), N)
        mix[s:end] += note[:end - s]
    return mix


# -- WAV output -------------------------------------------------------------

def write_wav(path: str, audio: np.ndarray) -> None:
    peak = np.max(np.abs(audio))
    if peak > 0:
        audio = audio / peak * 0.88
    with wave.open(path, 'w') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(SR)
        wf.writeframes((audio * 32767).astype(np.int16).tobytes())
    print(f'  wrote  {path}  ({len(audio)/SR:.1f}s)')


# -- Main -------------------------------------------------------------------

def main(T: float = 4.0, ring_out: float = 5.0) -> None:
    dur = [T * PHI**(-k) for k in range(5)]
    dur[4] += ring_out
    beg = [sum(dur[:k]) for k in range(5)]
    total = sum(dur)

    ZONES  = ['++', '+-', '--', '-+', '++']
    LABELS = [
        'I   C major  VoidDone: home',
        'IV  F major  VoidPossible: wandering',
        'vii B dim    VoidAbsurd: shadow',
        'V7  G7       VoidNecessary: inevitable',
        'I   C major  Discharge fires, resolution',
    ]

    print()
    print('VoidKernel: The Nuclear Quartet in C  [polyphonic]')
    print()
    print(f'  T={T:.2f}s  phi={PHI:.6f}  total={total:.2f}s')
    print()
    print(f'  {"k":>1}  {"zone":>4}  {"start":>7}  {"dur":>6}  label')
    print()
    for k in range(5):
        print(f'  {k}  {ZONES[k]}   {beg[k]:>6.3f}s  {dur[k]:>5.3f}s  {LABELS[k]}')
    print()

    events = build_score(T, ring_out)
    audio  = render(events, total)

    out = Path(__file__).parent / 'nuclear_quartet_poly.wav'
    write_wav(str(out), audio)


if __name__ == '__main__':
    main()
