#!/usr/bin/env python3
"""
zeno.py -- The Zeno Settling Composition.

One trace. Void, then the harmonic series of C2 assembled one voice at a time,
timing and amplitude compressed by the golden ratio.

VoidKernel instance:
  Trace   = {h_1, h_3, h_5, h_7, ...}   -- set of active harmonic voices
  Moment  = h_n                           -- the n-th harmonic of C2
  Bypasses(h_a, h_b) = True for all a != b  (all voices independent)
  Gradient(t1, t2) = tension(t1) <= tension(t2)
  Void    = {}                            -- silence, tension 0
  Excite  = add a new harmonic voice

Prime-limit zone of harmonic n (from the odd part of n):
  1-limit (n = 2^k):        ++   settled, tonic octaves
  3-limit (n = 3 * 2^k):    +-   perfect fifths
  5-limit (n = 5 * 2^k):    -+   major thirds
  7/11/13-limit:            --   shadows (Transfer-stable, Saturation-unstable)

These are the four nuclear zones. The 7th harmonic IS in C2's overtone series
(Transfer-stable) but does not "settle" cleanly in the tonal center
(Saturation-unstable). It is the shadow.

Harmonic ordering: prime-limit sorted, then octave-family fills.
  k=0: h1  (C2)   ++   root
  k=1: h3  (G3)   +-   fifth
  k=2: h5  (E4)   -+   third
  k=3: h7  (Bb4)  --   shadow
  k=4: h11 (~F5)  --   shadow
  k=5: h13 (~Ab5) --   shadow
  k=6: h9  (D5)   -+   witness for h7 (9 = 3^2, same 3-limit as fifth)
  k=7: h15 (B5)   -+   witness for shadows (15 = 3*5)
  k=8: h2  (C3)   ++   octave drop
  k=9: h4  (C4)   ++   settling
  k=10:h6  (G4)   +-
  k=11:h8  (C5)   ++
  k=12:h10 (E5)   -+
  k=13:h12 (G5)   +-
  k=14:h14 (~Bb5) --
  k=15:h16 (C6)   ++

Entry times: t_k = T_zeno * (1 - phi^{-k}), converging to T_zeno.
  k=0:   0.00s
  k=1:   5.73s  (phi^{-1} * T)
  k=2:   9.27s  (golden section of T)
  k=3:  11.46s
  k=4:  12.81s
  k=5:  13.65s
  ...
  k=8:  14.67s  (octave settling begins)
  ...  (rapid convergence)

Amplitudes: A0 * phi^{-k}. Sum = A0 * phi^2.

Overtone weights for note k (harmonic n_k), partial j:
  w(k, j) = phi^{ j*(n_k - 2) + 1 - k }   [before normalization]

  n_k = 1 (C2, k=0):  w proportional to phi^{1-j}  -- decreasing from fundamental (warm)
  n_k = 2 (C3, k=8):  w proportional to phi^{1-k}  -- flat spectrum (hollow)
  n_k = 3 (G3, k=1):  w proportional to phi^{j}    -- increasing (bright)
  n_k = 7 (Bb4, k=3): w proportional to phi^{5j-2} -- steeply increasing (blazing)

Shadow harmonics are BRIGHTEST (most overtone energy per unit amplitude).
Tonic octaves are WARMEST (most energy in fundamental).

This is the two-temperature duality: shadows are thermodynamically hot (high internal
energy) but appear faint (phi^{-k} amplitude). Settling notes are cool but warming.

The Zeno sum: sum_{k>=0} phi^{-k} = phi^2. Total energy = phi^2 * A0.
Each settling step costs phi^{-1} of the previous: self-funding.
"""

from __future__ import annotations
import math
import wave
from pathlib import Path

import numpy as np

PHI  = (1.0 + math.sqrt(5.0)) / 2.0
BASE = 65.40639  # C2 Hz (equal temperament A4=440)
RNG  = np.random.default_rng(561)  # reproducible phases; 561 = the group

# -- Harmonic sequence ---------------------------------------------------------
# Prime-limit ordered: odd primes first (new structure), then octave fills.
# Shadow group (7, 11, 13) before their witnesses (9, 15).

HARMONIC_SEQ = [1, 3, 5, 7, 11, 13, 9, 15, 2, 4, 6, 8, 10, 12, 14, 16]

# -- Zone classification -------------------------------------------------------

def _odd_part(n: int) -> int:
    while n % 2 == 0:
        n //= 2
    return n

def prime_limit(n: int) -> int:
    """Largest prime factor of n."""
    m = _odd_part(n)
    if m == 1:
        return 2
    for p in [3, 5, 7, 11, 13, 17, 19, 23]:
        if m % p == 0:
            return p
    return m  # for primes > 23

def zone(n: int) -> str:
    """Nuclear zone of the n-th harmonic by prime-limit classification."""
    lim = prime_limit(n)
    if lim <= 2:  return '++'
    if lim == 3:  return '+-'
    if lim == 5:  return '-+'
    return '--'   # 7, 11, 13, ... shadows

ATTACK_S = {'++': 0.30, '+-': 0.07, '-+': 0.018, '--': 0.004}

# -- Overtone weight profile ---------------------------------------------------

def overtone_weights(n_k: int, k: int, J: int) -> np.ndarray:
    """
    Raw weight for partial j of note k (harmonic n_k), before normalization.

      w(k, j) = phi^{ j*(n_k - 2) + 1 - k }

    n_k=1 (root):  phi^{1-j}     -- decreasing, warm
    n_k=2 (octave): phi^{1-k}    -- flat (same weight for all j)
    n_k=3 (fifth): phi^{j}       -- increasing, bright
    n_k=7 (shadow): phi^{5j-2}   -- steeply increasing, blazing

    After normalizing to max=1, this gives the TIMBRE SHAPE of the note.
    """
    js = np.arange(1, J + 1, dtype=float)
    exps = js * (n_k - 2) + (1 - k)
    ws = PHI ** exps
    # Normalize so the loudest partial = 1 (amplitude is set by amp_k separately)
    return ws / ws.max()

# -- Synthesis -----------------------------------------------------------------

def render_zeno(
    path: str,
    T_zeno:   float = 15.0,  # seconds for Zeno compression zone
    T_sustain: float = 7.0,  # all notes held together
    T_decay:  float = 8.0,   # fade out
    sr:       int   = 44100,
    A0:       float = 0.45,
    J:        int   = 8,     # overtones per note
) -> None:
    total  = T_zeno + T_sustain + T_decay
    N_samp = int(total * sr)
    mix    = np.zeros(N_samp, dtype=np.float64)

    print(f'  Zeno settling composition')
    print(f'  {len(HARMONIC_SEQ)} harmonics  J={J} overtones each')
    print(f'  T_zeno={T_zeno}s  T_sustain={T_sustain}s  T_decay={T_decay}s  total={total}s')
    print()
    print(f'  {"k":>2}  {"h_n":>4}  zone  t_entry(s)  amp     partial-shape')

    for k, n_k in enumerate(HARMONIC_SEQ):
        t_start = T_zeno * (1.0 - PHI ** (-k)) if k > 0 else 0.0
        s_start = int(t_start * sr)
        n_samp  = N_samp - s_start

        z       = zone(n_k)
        atk_s   = ATTACK_S[z]
        amp_k   = A0 * PHI ** (-k)
        ws      = overtone_weights(n_k, k, J)

        # Describe timbre shape
        if ws[-1] > ws[0] * 2:
            shape = 'rising (bright/shadow)'
        elif abs(ws[-1] - ws[0]) < 0.1:
            shape = 'flat (hollow/octave)'
        else:
            shape = 'falling (warm/root)'

        print(f'  {k:>2}  h{n_k:<3}  {z}   {t_start:>9.2f}   {amp_k:.4f}  {shape}')

        # Random phase offsets (one per partial) for richness
        phases = RNG.uniform(0, 2 * np.pi, J)

        t_local = np.arange(n_samp, dtype=np.float64) / sr
        sig     = np.zeros(n_samp)

        for j_idx in range(J):
            j    = j_idx + 1
            freq = n_k * j * BASE
            if freq >= sr / 2:
                break  # above Nyquist
            sig += ws[j_idx] * np.sin(2.0 * np.pi * freq * t_local + phases[j_idx])

        # Attack envelope
        a_samp = min(int(atk_s * sr), n_samp // 3)
        if a_samp > 0:
            ramp = np.linspace(0.0, 1.0, a_samp)
            sig[:a_samp] *= ramp

        # Scale by note amplitude
        mix[s_start:] += amp_k * sig

    # Master envelope: flat during sustain, linear fade during decay
    t_arr  = np.arange(N_samp, dtype=np.float64) / sr
    fade0  = T_zeno + T_sustain
    master = np.where(
        t_arr < fade0,
        1.0,
        np.clip(1.0 - (t_arr - fade0) / T_decay, 0.0, 1.0)
    )
    mix *= master

    # Normalize
    peak = np.max(np.abs(mix))
    if peak > 0:
        mix = mix / peak * 0.88

    with wave.open(path, 'w') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(sr)
        wf.writeframes((mix * 32767).astype(np.int16).tobytes())

    print()
    print(f'  wrote  {path}  ({total:.1f}s  {sr}Hz  mono)')

# -- Zone portrait at each depth -----------------------------------------------

def print_trace_portrait() -> None:
    """Print the zone, prime-limit, and timing for each depth step."""
    print('Trace portrait:')
    print(f'  {"k":>2}  {"h_n":>4}  zone  p-lim  t_entry(s)  phi^-k    cumul-tension')
    T = 15.0
    tension = 0

    # Consonance distance from C (by pitch class in equal temperament)
    CONS = {0:0, 7:1, 4:2, 9:2, 5:3, 3:3, 8:3, 2:4, 10:4, 11:5, 1:5, 6:6}

    for k, n_k in enumerate(HARMONIC_SEQ):
        t_k  = T * (1.0 - PHI ** (-k)) if k > 0 else 0.0
        amp  = PHI ** (-k)
        z    = zone(n_k)
        lim  = prime_limit(n_k)
        # Approximate pitch class from harmonic number (mod octave)
        # freq = n_k * BASE; nearest semitone above C2
        semitones_above_C2 = 12 * math.log2(n_k)  # exact for JI
        pc = round(semitones_above_C2) % 12
        t_val = CONS.get(pc, 4)
        tension += t_val
        print(f'  {k:>2}  h{n_k:<3}  {z}   {lim:>4}   {t_k:>9.2f}  {amp:.4f}   {tension:>4}')
    print()

# -- Main ----------------------------------------------------------------------

if __name__ == '__main__':
    print_trace_portrait()
    out = Path(__file__).parent / 'zeno_settling.wav'
    render_zeno(str(out))
