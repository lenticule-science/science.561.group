#!/usr/bin/env python3
"""
composition.py -- VoidKernel: The Nuclear Quartet in C

One trace. Four zones. Discharge fires at the end.

The nuclear quartet (fiber nucleus commutation axiom):
  At every history t, the saturation nucleus sigma_t and transfer nucleus
  Delta_t commute: sigma ∘ Delta = Delta ∘ sigma.
  Their four fixed-point spaces form a square:

       H_t --sigma--> Fix(sigma)
        |                 |
       Delta             Delta
        |                 |
     Fix(Delta) --sigma-> H_t*    <-- doubly stable, the resolved state

  H_t*  =  Fix(sigma) ∩ Fix(Delta)  =  zone ++  (VoidDone, fully settled)

Journey through the four corners:
  ++  VoidDone        sigma-stable AND Delta-stable    C major (tonic)
  +-  VoidPossible    sigma-unstable, Delta-stable     F major (pre-dominant)
  --  VoidAbsurd      sigma-unstable, Delta-unstable   B dim   (shadow)
  -+  VoidNecessary   sigma-stable,   Delta-unstable   G7      (dominant)

Zeno section durations: T, T/phi, T/phi^2, T/phi^3, then resolve.
Total settling cost across all levels = phi * T  (Zeno-phi identity).

Voice structure (4 voices, all pairs bypass = independent):
  Zone ++:  C5 / E4 / G3 / C2     I in C major
  Zone +-:  F5 / A4 / F3 / F2     IV in C major  (pre-dominant, wandering)
  Zone --:  B4 / F4 / D3 / B1     vii° in C      (shadow, no direct path home)
  Zone -+:  D5 / F4 / B3 / G1     V7 in C major  (necessary, inevitable pull)
  Zone ++:  C5 / E4 / G3 / C2     I in C major   (return, resolution)

Voice leading:
  Soprano: C5 → F5 → B4 → D5 → C5   (up, leap, step, step — shape of tension/release)
  Alto:    E4 → A4 → F4 → F4 → E4   (up a fourth, down a third, hold, half-step home)
  Tenor:   G3 → F3 → D3 → B3 → G3   (down a step, down a third, up a sixth, down a third)
  Bass:    C2 → F2 → B1 → G1 → C2   (up a fourth, down a dim fifth, down a third, up a fourth)

DifferentialBypass: soprano and bass are on different voices.
  Excite(soprano, Excite(bass, trace)) == Excite(bass, Excite(soprano, trace))
  The 4-voice chord sounds the same regardless of which voice "moves first."
  This is why all 4 voices can be composed independently (counterpoint).

Discharge at the final ++:
  Soprano C5 is Absorbed(soprano, trace): the trace starts with soprano's note.
  The trace is Charged: VoidPossible(soprano, bass, trace) → Gradient(trace, Void).
  Therefore Discharge fires: Gradient(trace, Void). The music resolves to tonic.

Synthesis: phi-weighted decaying overtone series, ADSR envelope.
  Overtone j of any note: amplitude = phi^{-(j-1)}.  (phi^0=1, phi^-1=0.618, ...)
  This is the VoidKernel trace generating its own overtones: each Excite step
  at depth k contributes phi^{-k} amplitude — the same Zeno series.
  The timbre of a single note IS the Zeno settling of its own harmonic series.
"""

from __future__ import annotations
import math
import wave
from pathlib import Path

import numpy as np

PHI  = (1.0 + math.sqrt(5.0)) / 2.0
SR   = 44100  # Hz


# -- Pitch helpers -------------------------------------------------------------

def midi_hz(m: int) -> float:
    """MIDI note number to Hz (A4=440)."""
    return 440.0 * 2.0 ** ((m - 69) / 12.0)

# Named pitches used in the composition
C2 = 36; C3 = 48; C4 = 60; C5 = 72
E4 = 64; F4 = 65; F5 = 77; A4 = 69
G1 = 31; G3 = 55; G4 = 67
B1 = 35; B3 = 59; B4 = 71
D3 = 50; D5 = 74
F2 = 41; F3 = 53


# -- Voice definitions ---------------------------------------------------------
#
# Each voice has a timbre profile: overtone count and brightness.
# Soprano: clear, 4 overtones; Bass: rich, 6 overtones.
# Brightness = how fast overtones fall off (1.0 = phi-series, >1 = brighter).

VOICE_PROFILE = {
    'soprano': dict(n_harmonics=5, brightness=1.0),
    'alto':    dict(n_harmonics=5, brightness=1.0),
    'tenor':   dict(n_harmonics=6, brightness=1.0),
    'bass':    dict(n_harmonics=7, brightness=1.0),
}

VOICE_AMPLITUDE = {
    'soprano': 0.35,
    'alto':    0.30,
    'tenor':   0.28,
    'bass':    0.40,
}


# -- ADSR envelope -------------------------------------------------------------

def adsr(n: int, attack_s=0.02, decay_s=0.08, sustain=0.70, release_s=0.18) -> np.ndarray:
    env = np.ones(n) * sustain
    a = min(int(attack_s * SR), n)
    d = min(int(decay_s  * SR), n - a)
    r = min(int(release_s * SR), n)
    env[:a]  = np.linspace(0.0, 1.0, a)
    env[a:a+d] = np.linspace(1.0, sustain, d)
    env[max(0, n - r):] *= np.linspace(1.0, 0.0, min(r, n))
    return env


# -- Note synthesis -------------------------------------------------------------

def synthesize_note(
    midi: int,
    duration_s: float,
    voice: str,
    amplitude: float,
    phase_seed: int = 0,
) -> np.ndarray:
    """
    Synthesize one note for one voice.

    Overtone j (j=1 is fundamental) has amplitude: A * phi^{-(j-1)}.
    This is the Zeno series: each overtone is phi^{-1} softer than the previous.
    The overtone series of a single note IS the Zeno settling in miniature.
    """
    profile = VOICE_PROFILE[voice]
    J       = profile['n_harmonics']
    rng     = np.random.default_rng(phase_seed + midi * 100)
    phases  = rng.uniform(0, 2 * math.pi, J)

    n    = max(int(duration_s * SR), 1)
    t    = np.arange(n, dtype=float) / SR
    f0   = midi_hz(midi)
    sig  = np.zeros(n)

    for j in range(1, J + 1):
        freq = f0 * j
        if freq >= SR / 2:
            break
        w = amplitude * PHI ** (-(j - 1))
        sig += w * np.sin(2.0 * math.pi * freq * t + phases[j - 1])

    sig *= adsr(n)
    return sig


# -- Section builder -----------------------------------------------------------
#
# A section is a set of (voice, midi) pairs played simultaneously.
# Duration follows the Zeno series: section_k lasts T * phi^{-k}.
# All voices in a section bypass each other (independent voices, counterpoint).

def build_section(
    voices_midi: dict[str, int],
    duration_s: float,
    seed_offset: int = 0,
) -> np.ndarray:
    n   = int(duration_s * SR)
    mix = np.zeros(n)
    for i, (voice, midi) in enumerate(voices_midi.items()):
        amp  = VOICE_AMPLITUDE[voice]
        note = synthesize_note(midi, duration_s, voice, amp, phase_seed=seed_offset + i * 7)
        length = min(len(note), n)
        mix[:length] += note[:length]
    return mix


# -- The composition -----------------------------------------------------------
#
# Five sections. Zone sequence: ++ → +- → -- → -+ → ++
# The final ++ is the Discharge: Absorbed + Charged → Gradient(trace, Void).

def compose(T: float = 4.0, ring_out: float = 5.0) -> np.ndarray:
    """
    Build the full composition as a numpy array.

    T: base section duration (seconds). Zeno-series sections follow.
    ring_out: extra seconds on the final tonic chord (the resolved state).
    """
    # Zeno section durations: T, T/phi, T/phi^2, T/phi^3, T/phi^4 + ring_out
    durations = [T * PHI ** (-k) for k in range(5)]
    durations[-1] += ring_out  # let the resolution breathe

    # Zone sequence with voice-leading across four nuclear corners
    sections = [
        # Section 0: ++ (VoidDone, tonic — the grounded home state)
        {
            'zone':  '++',
            'label': 'I  (C major)  -- VoidDone: sigma-stable AND Delta-stable',
            'voices': {'soprano': C5, 'alto': E4, 'tenor': G3, 'bass': C2},
        },
        # Section 1: +- (VoidPossible, pre-dominant — sigma-unstable, Delta-stable)
        # Soprano leaps up a perfect fourth (C5→F5): exploratory, opening outward.
        # Bass drops a fifth (C2→F2): the harmony opens from the bottom.
        {
            'zone':  '+-',
            'label': 'IV (F major)  -- VoidPossible: Delta-stable, sigma-unstable',
            'voices': {'soprano': F5, 'alto': A4, 'tenor': F3, 'bass': F2},
        },
        # Section 2: -- (VoidAbsurd, shadow — sigma-unstable AND Delta-unstable)
        # Soprano leaps down a tritone (F5→B4): the most shocking interval.
        # This is the 7-limit shadow: present in the harmonic series (Delta-stable)
        # but not consonant with the tonic (sigma-unstable).
        # The vii° chord is as far from home as the harmony gets.
        {
            'zone':  '--',
            'label': 'vii°(B dim)   -- VoidAbsurd: sigma-unstable AND Delta-unstable',
            'voices': {'soprano': B4, 'alto': F4, 'tenor': D3, 'bass': B1},
        },
        # Section 3: -+ (VoidNecessary, dominant — sigma-stable, Delta-unstable)
        # Soprano steps up (B4→D5): the seventh of V7, the most "necessary" pitch.
        # Alto holds (F4→F4): the seventh of G7 pulls down to E4.
        # Bass drops a major third (B1→G1): the dominant arrives in the bass.
        # All paths from here lead to I. Inevitable.
        {
            'zone':  '-+',
            'label': 'V7 (G7)       -- VoidNecessary: sigma-stable, Delta-unstable',
            'voices': {'soprano': D5, 'alto': F4, 'tenor': B3, 'bass': G1},
        },
        # Section 4: ++ again (VoidDone, return to tonic — Discharge fires)
        # Soprano resolves by step (D5→C5): the seventh resolves upward by step.
        # Alto resolves by half-step (F4→E4): the fourth resolves down to the third.
        # Tenor drops (B3→G3): completes the tonic chord.
        # Bass jumps a perfect fourth (G1→C2): perfect authentic cadence.
        #
        # Discharge theorem: Absorbed(soprano, trace) + Charged(soprano, bass, trace)
        # → Gradient(trace, Void). The soprano is absorbed (trace starts with soprano C5).
        # The chord is VoidDone (Charged: VoidPossible → tension == 0).
        # Therefore the trace grades toward Void. Resolution.
        {
            'zone':  '++',
            'label': 'I  (C major)  -- VoidDone: Discharge fires, resolution',
            'voices': {'soprano': C5, 'alto': E4, 'tenor': G3, 'bass': C2},
        },
    ]

    assert len(sections) == len(durations)

    parts = []
    print()
    print('VoidKernel: The Nuclear Quartet in C')
    print()
    print(f'  T = {T:.2f}s  phi = {PHI:.6f}  total sections = {len(sections)}')
    print()
    print(f'  {"k":>1}  {"zone":>4}  {"dur":>7}  voices (SATB in MIDI)')
    print()
    for k, (sec, dur) in enumerate(zip(sections, durations)):
        print(f'  {k}  {sec["zone"]}  {dur:>6.2f}s  '
              f'S={sec["voices"]["soprano"]}  A={sec["voices"]["alto"]}  '
              f'T={sec["voices"]["tenor"]}  B={sec["voices"]["bass"]}')
        print(f'     {sec["label"]}')
        print()
        parts.append(build_section(sec['voices'], dur, seed_offset=k * 31))

    # Concatenate sections
    total = np.concatenate(parts)

    # Normalize
    peak = np.max(np.abs(total))
    if peak > 0:
        total = total / peak * 0.88

    return total


# -- WAV output ----------------------------------------------------------------

def write_wav(path: str, audio: np.ndarray) -> None:
    with wave.open(path, 'w') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(SR)
        wf.writeframes((audio * 32767).astype(np.int16).tobytes())
    dur = len(audio) / SR
    print(f'  wrote  {path}  ({dur:.1f}s)')


# -- Main ----------------------------------------------------------------------

if __name__ == '__main__':
    out = Path(__file__).parent / 'nuclear_quartet.wav'
    audio = compose(T=4.0, ring_out=5.0)
    write_wav(str(out), audio)
