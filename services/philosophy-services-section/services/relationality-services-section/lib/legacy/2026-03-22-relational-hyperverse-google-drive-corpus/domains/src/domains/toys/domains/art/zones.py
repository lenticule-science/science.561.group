#!/usr/bin/env python3
"""
zones.py  ─  Void zone structure as spatial reaction-diffusion.

The grid is partitioned using the trace-tree: each cell belongs to a trace,
determined by its radius (= depth) and angle (= base-3 moment sequence).
That trace's zone membership — Possible, Necessary, Absurd, Done — sets
the local Gray-Scott parameters, so different zones grow different organisms.

As the (asc, desc) pair rotates, zones sweep across the grid.  Old patterns
reorganize under new parameters.  The boundaries between zones are where
different chemistry collides.

The math is doing real work here:
  - Trace-tree angular tiling:  angle/(2π) → base-3 → moment sequence
  - Zone predicates (VoidPossible, VoidNecessary, …) → (F, k) at each cell
  - DifferentialBypass → site-equivalent sectors share zone (visible symmetry)
  - Zone lattice (Possible⊆Done, Absurd⊆Necessary) → visible from the chemistry

    python src/toys/art/zones.py
    → writes zones.mp4

Dependencies: numpy, scipy, PIL, av (pyav)
"""

from __future__ import annotations
import sys
import math
import pathlib
import numpy as np
from scipy.ndimage import gaussian_filter
from PIL import Image, ImageDraw, ImageFont
import av

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

# ── Kernel constants ───────────────────────────────────────────────────────────

MOMENTS   = (0, 1, 2)
NAMES     = {0: 'A', 1: 'B', 2: 'C'}
MAX_DEPTH = 3

# ── Zone predicates (vectorized) ───────────────────────────────────────────────
#
# Each cell maps to a trace of length depth[r,c].
# Moments stored in m[0..2]: m[0] is the outermost (first) moment.

def make_zone_maps(asc: int, desc: int, H: int, W: int):
    """
    For each grid cell, compute the trace determined by its position and
    return the zone signature (4-bit int), plus zone-derived F and k maps.

    Trace from position:
      - radius < R1: depth 1 (3 sectors)
      - R1 ≤ radius < R2: depth 2 (9 sectors)
      - R2 ≤ radius: depth 3 (27 sectors)
      - radius < eps: depth 0 = Void
    Angle encodes trace moments as base-3 digits of angle/(2π).
    """
    cx, cy    = W / 2.0, H / 2.0
    max_r     = min(cx, cy) * 0.96
    R1, R2    = max_r / 3.0, max_r * 2.0 / 3.0

    ys = np.arange(H)[:, None]
    xs = np.arange(W)[None, :]
    dy = ys - cy
    dx = xs - cx
    radius     = np.sqrt(dx ** 2 + dy ** 2)
    angle_norm = (np.arctan2(dy, dx) % (2 * np.pi)) / (2 * np.pi)  # [0,1)

    # Depth from radius
    depth = np.where(radius < 6,  0,
            np.where(radius < R1, 1,
            np.where(radius < R2, 2, 3))).astype(int)

    # Moment sequence from angle (base-3 digits of angle_norm)
    frac = angle_norm.copy()
    m    = np.zeros((3, H, W), dtype=int)
    for d in range(3):
        frac3  = frac * 3
        m[d]   = np.clip(frac3.astype(int), 0, 2)
        frac   = frac3 - m[d]

    # ── Zone predicates ────────────────────────────────────────────────────────

    # Possible: t == () or t[0] == asc
    possible = (depth == 0) | (m[0] == asc)

    # Absurd: t == ()
    absurd = (depth == 0)

    # Done: t == () or t[0] in {asc, desc}
    done = (depth == 0) | (m[0] == asc) | (m[0] == desc)

    # Necessary: strip leading asc's, then () or starts-with-desc
    # Vectorized: count leading asc-moments up to depth
    k_count = np.zeros((H, W), dtype=int)
    for d_idx in range(3):
        k_count = np.where(
            (k_count == d_idx) & (depth > d_idx) & (m[d_idx] == asc),
            d_idx + 1, k_count
        )
    rest_empty = k_count >= depth
    m_at_k     = np.where(k_count == 0, m[0],
                 np.where(k_count == 1, m[1], m[2]))
    necessary  = rest_empty | ((~rest_empty) & (m_at_k == desc))
    necessary  = (depth == 0) | necessary

    # 4-bit signature
    sig = (
        (possible.astype(int)  << 3) |
        (necessary.astype(int) << 2) |
        (absurd.astype(int)    << 1) |
        (done.astype(int)      << 0)
    )

    # ── Zone → (F, k) ──────────────────────────────────────────────────────────
    #
    # Each zone drives a distinct Gray-Scott regime.
    # Zone lattice holds: Possible→Done (F_poss > F_done in one direction only
    # in the sense that poss regions are "energetic"), Absurd⊆Necessary.
    #
    # 0b1111 (Void, all zones):     F=0.025 k=0.060  worms / tendrils
    # 0b1101 (poss+nec+done):       F=0.037 k=0.060  isolated spots
    # 0b1001 (poss+done):           F=0.055 k=0.062  traveling mitosis
    # 0b0101 (nec+done):            F=0.029 k=0.057  labyrinths
    # 0b0001 (done only):           F=0.013 k=0.050  Turing waves
    # 0b0000 (vacuum):              F=0.008 k=0.075  chemical death

    FK = {
        0b1111: (0.025, 0.060),
        0b1101: (0.037, 0.060),
        0b1001: (0.055, 0.062),
        0b0101: (0.029, 0.057),
        0b0001: (0.013, 0.050),
        0b0000: (0.008, 0.075),
    }
    F_map = np.full((H, W), 0.008, dtype=np.float32)
    k_map = np.full((H, W), 0.075, dtype=np.float32)
    for s, (f, k) in FK.items():
        mask = (sig == s)
        F_map[mask] = f
        k_map[mask] = k

    # Smooth boundaries so patterns blend at zone edges
    F_map = gaussian_filter(F_map, sigma=4.0).astype(np.float32)
    k_map = gaussian_filter(k_map, sigma=4.0).astype(np.float32)

    return sig, F_map, k_map, depth, m


# ── Zone background colors ─────────────────────────────────────────────────────

ZONE_BG = {
    0b1111: np.array([60,  5, 30], dtype=np.float32),    # Void     dark crimson
    0b1101: np.array([12, 10, 55], dtype=np.float32),    # poss+nec dark indigo
    0b1001: np.array([ 0, 30, 60], dtype=np.float32),    # poss+done dark navy
    0b0101: np.array([45, 35,  5], dtype=np.float32),    # nec+done  dark amber
    0b0001: np.array([ 5, 45, 25], dtype=np.float32),    # done      dark green
    0b0000: np.array([ 5,  5, 12], dtype=np.float32),    # vacuum    near-black
}

PATTERN_COLOR = np.array([255, 245, 175], dtype=np.float32)   # warm gold


def colorize(v: np.ndarray, sig: np.ndarray, t: float) -> np.ndarray:
    """Map v concentration + zone sig to RGB."""
    H, W  = v.shape
    bg    = np.zeros((H, W, 3), dtype=np.float32)
    for s, rgb in ZONE_BG.items():
        mask = (sig == s)
        bg[mask] = rgb

    v_norm = np.clip(v / 0.38, 0, 1)[:, :, None]
    # Gamma 0.6: brighter pop on patterns
    lum    = v_norm ** 0.6
    rgb    = bg * (1 - lum) + PATTERN_COLOR * lum
    # Subtle hue shift at zone edges: slightly desaturate boundary pixels
    return np.clip(rgb, 0, 255).astype(np.uint8)


# ── Vignette ───────────────────────────────────────────────────────────────────

def vignette(img: np.ndarray, H: int, W: int) -> np.ndarray:
    """Darken toward corners."""
    ys = np.linspace(-1, 1, H)[:, None]
    xs = np.linspace(-1, 1, W)[None, :]
    d  = np.sqrt(xs ** 2 + ys ** 2)
    v  = np.clip(1.0 - 0.5 * d ** 1.6, 0.1, 1.0)[:, :, None]
    return (img * v).astype(np.uint8)


# ── Gray-Scott simulation ──────────────────────────────────────────────────────

Du, Dv = 0.21, 0.105
DT     = 1.0


def laplacian(z: np.ndarray) -> np.ndarray:
    return (
        0.05 * (np.roll(z, (-1,-1), (0,1)) + np.roll(z, (-1,1), (0,1)) +
                np.roll(z, ( 1,-1), (0,1)) + np.roll(z, ( 1,1), (0,1))) +
        0.20 * (np.roll(z,  -1, 0) + np.roll(z,  1, 0) +
                np.roll(z,  -1, 1) + np.roll(z,  1, 1)) - z
    )


def step(u, v, F_map, k_map):
    uvv  = u * v * v
    u   += DT * (Du * laplacian(u) - uvv + F_map * (1.0 - u))
    v   += DT * (Dv * laplacian(v) + uvv - (F_map + k_map) * v)
    np.clip(u, 0, 1, out=u)
    np.clip(v, 0, 1, out=v)
    return u, v


def init_grid(H, W, sig_map, seed=42):
    """
    Seed the grid: u=1, v=0 everywhere, then small patches of (u=0.5, v=0.25).
    Seeds are placed only in non-vacuum zones so they actually grow.
    """
    rng  = np.random.default_rng(seed)
    u    = np.ones((H, W), dtype=np.float32)
    v    = np.zeros((H, W), dtype=np.float32)
    live = sig_map != 0b0000   # avoid seeding vacuum cells

    rows, cols = np.where(live)
    n_seeds    = 35
    for _ in range(n_seeds):
        i    = rng.integers(len(rows))
        r, c = rows[i], cols[i]
        sz   = rng.integers(3, 9)
        r0, r1 = max(0, r-sz), min(H, r+sz)
        c0, c1 = max(0, c-sz), min(W, c+sz)
        u[r0:r1, c0:c1] = 0.50 + rng.uniform(-0.02, 0.02, (r1-r0, c1-c0))
        v[r0:r1, c0:c1] = 0.25 + rng.uniform(0.00,  0.02, (r1-r0, c1-c0))

    return u.astype(np.float32), v.astype(np.float32)


# ── Overlay text ───────────────────────────────────────────────────────────────

def draw_overlay(img_arr: np.ndarray, asc: int, desc: int, H: int, W: int) -> np.ndarray:
    img  = Image.fromarray(img_arr)
    draw = ImageDraw.Draw(img)
    try:
        font = ImageFont.truetype('cour.ttf', 16)
    except Exception:
        font = ImageFont.load_default()

    pair = f'pair  {NAMES[asc]} \u2192 {NAMES[desc]}'
    draw.text((16, H - 36), pair, fill=(180, 175, 255), font=font)
    draw.text((16, H - 16),
              'Void zone tiling  \u00b7  Gray-Scott per zone  \u00b7  boundaries collide',
              fill=(60, 60, 100), font=font)
    return np.array(img)


# ── Pair schedule ──────────────────────────────────────────────────────────────
#
# Rotate through 3 pairs, 6 seconds each = 18 s loop.
# Pairs chosen so each moment takes a turn as asc (dominant / "possible" zone).

PAIR_SCHEDULE = [
    (0.0,   0, 1),   # A→B: A-sector is possible, B-sector necessary, C vacuum
    (6.0,   1, 2),   # B→C: B-sector possible, C-sector necessary, A vacuum
    (12.0,  2, 0),   # C→A: C-sector possible, A-sector necessary, B vacuum
    (18.0,  0, 1),   # wrap
]


def get_pair(t: float):
    for i in range(len(PAIR_SCHEDULE) - 1):
        t0, a0, d0 = PAIR_SCHEDULE[i]
        t1, a1, d1 = PAIR_SCHEDULE[i + 1]
        if t0 <= t < t1:
            return a0, d0
    return PAIR_SCHEDULE[-1][1], PAIR_SCHEDULE[-1][2]


# ── Main ───────────────────────────────────────────────────────────────────────

def main():
    G          = 360      # simulation grid (square)
    OUT        = 720      # output pixel size
    FPS        = 24
    DURATION   = 18.0
    FRAMES     = int(DURATION * FPS)   # 432
    STEPS_PER  = 22

    out_path   = pathlib.Path(__file__).parent / 'zones.mp4'

    print(f'Void zone reaction-diffusion  {G}x{G} grid  ->  {OUT}x{OUT}  {FRAMES} frames')

    # Initial pair
    asc0, desc0 = 0, 1
    sig, F_map, k_map, depth, m = make_zone_maps(asc0, desc0, G, G)

    print('  seeding and pre-running 700 steps ...')
    u, v = init_grid(G, G, sig)
    for _ in range(700):
        u, v = step(u, v, F_map, k_map)

    # Cache zone maps per pair so we don't recompute every frame
    cached_pair = (asc0, desc0)
    cached_maps = (sig, F_map, k_map)

    # pyav MP4 writer
    container = av.open(str(out_path), mode='w')
    stream    = container.add_stream('libx264', rate=FPS)
    stream.width   = OUT
    stream.height  = OUT
    stream.pix_fmt = 'yuv420p'
    stream.options = {'crf': '18', 'preset': 'fast'}

    # Transition state
    prev_pair  = (asc0, desc0)
    in_transit = False

    print(f'  rendering {FRAMES} frames ...')
    for f in range(FRAMES):
        t        = f / FPS
        asc, desc = get_pair(t)

        # Recompute zone maps when pair changes
        if (asc, desc) != cached_pair:
            cached_pair = (asc, desc)
            sig, F_map, k_map, depth, m = make_zone_maps(asc, desc, G, G)
            cached_maps = (sig, F_map, k_map)
        else:
            sig, F_map, k_map = cached_maps

        for _ in range(STEPS_PER):
            u, v = step(u, v, F_map, k_map)

        rgb = colorize(v, sig, t)
        rgb = vignette(rgb, G, G)
        rgb = draw_overlay(rgb, asc, desc, G, G)

        # Upscale to output size
        img  = Image.fromarray(rgb).resize((OUT, OUT), Image.NEAREST)
        frame = av.VideoFrame.from_ndarray(np.array(img), format='rgb24')
        for pkt in stream.encode(frame):
            container.mux(pkt)

        if (f + 1) % FPS == 0 or f == 0:
            print(f'  frame {f+1:>4}/{FRAMES}  pair={NAMES[asc]}->{NAMES[desc]}')

    for pkt in stream.encode():
        container.mux(pkt)
    container.close()

    size_mb = out_path.stat().st_size / 1e6
    print(f'  wrote {out_path}  ({FRAMES} frames  {DURATION:.0f}s  {FPS}fps  {size_mb:.1f}MB)')


if __name__ == '__main__':
    main()
