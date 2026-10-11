#!/usr/bin/env python3
"""
bloom.py  ─  Gray-Scott reaction-diffusion rendered as an animated GIF.

Two abstract chemicals, u and v, react and diffuse across a grid.
Their concentrations produce organic forms that look alive: spots, mazes,
coral, worms, labyrinths. The parameters (feed rate F, kill rate k) are
slowly morphed across the animation, causing the living patterns to
reorganize into new shapes mid-frame.

    python src/toys/art/bloom.py
    → writes bloom.gif to the same directory

No math in the output — just the organisms.
"""

from __future__ import annotations
import sys
import math
import pathlib
import numpy as np
from PIL import Image

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

# ── Simulation grid ────────────────────────────────────────────────────────────

W, H           = 300, 300    # simulation grid (upscaled 2.5x for output)
Du, Dv         = 0.21, 0.105  # diffusion rates (u spreads faster than v)
DT             = 1.0          # time step
STEPS_PER_FRAME = 20
FPS            = 18
DURATION       = 14.0
FRAMES         = int(DURATION * FPS)   # 252


# ── Parameter path ─────────────────────────────────────────────────────────────
#
# (time_in_seconds, F, k) waypoints.
# F = feed rate: how fast u is replenished from outside
# k = kill rate: how fast v is removed
#
# Each (F, k) region produces a different class of pattern:
#   F=0.037 k=0.060  →  isolated spots
#   F=0.030 k=0.057  →  labyrinthine mazes
#   F=0.025 k=0.060  →  worms / tendrils
#   F=0.055 k=0.062  →  traveling waves of spots
#   F=0.014 k=0.047  →  Turing-stripe spirals

WAYPOINTS = [
    (0.0,   0.037, 0.060),   # spots
    (3.5,   0.030, 0.057),   # mazes
    (7.0,   0.025, 0.060),   # worms
    (10.5,  0.055, 0.062),   # traveling wave
    (14.0,  0.037, 0.060),   # back to spots (seamless loop)
]


def get_params(t: float):
    """Linearly interpolate F and k from the waypoint table."""
    for i in range(len(WAYPOINTS) - 1):
        t0, f0, k0 = WAYPOINTS[i]
        t1, f1, k1 = WAYPOINTS[i + 1]
        if t0 <= t <= t1:
            alpha = (t - t0) / (t1 - t0)
            # Ease in-out
            alpha = alpha * alpha * (3 - 2 * alpha)
            return f0 + alpha * (f1 - f0), k0 + alpha * (k1 - k0)
    return WAYPOINTS[-1][1], WAYPOINTS[-1][2]


# ── Laplacian ──────────────────────────────────────────────────────────────────

def laplacian(z: np.ndarray) -> np.ndarray:
    """9-point weighted Laplacian with periodic boundary."""
    return (
        0.05 * (np.roll(z, (-1, -1), (0, 1)) + np.roll(z, (-1, 1), (0, 1)) +
                np.roll(z, ( 1, -1), (0, 1)) + np.roll(z, ( 1, 1), (0, 1))) +
        0.20 * (np.roll(z, -1, 0) + np.roll(z, 1, 0) +
                np.roll(z, -1, 1) + np.roll(z, 1, 1)) -
        z
    )


# ── Initial conditions ─────────────────────────────────────────────────────────

def init_grid(seed: int = 42) -> tuple[np.ndarray, np.ndarray]:
    """
    Start with u=1 everywhere and v=0, then seed several small square
    patches of (u=0.5, v=0.25) scattered across the grid.
    More seeds → richer interaction from the start.
    """
    rng = np.random.default_rng(seed)
    u = np.ones((H, W), dtype=np.float32)
    v = np.zeros((H, W), dtype=np.float32)

    n_seeds = 22
    for _ in range(n_seeds):
        r = rng.integers(10, H - 10)
        c = rng.integers(10, W - 10)
        size = rng.integers(3, 9)
        u[r:r+size, c:c+size] = 0.50
        v[r:r+size, c:c+size] = 0.25

    # Tiny noise to break symmetry
    u += rng.uniform(-0.01, 0.01, u.shape).astype(np.float32)
    v += rng.uniform(0.00,  0.01, v.shape).astype(np.float32)
    u  = np.clip(u, 0, 1)
    v  = np.clip(v, 0, 1)
    return u, v


# ── Simulation step ────────────────────────────────────────────────────────────

def step(u: np.ndarray, v: np.ndarray, F: float, k: float) -> tuple[np.ndarray, np.ndarray]:
    uvv  = u * v * v
    Lu   = laplacian(u)
    Lv   = laplacian(v)
    u   += DT * (Du * Lu - uvv + F * (1.0 - u))
    v   += DT * (Dv * Lv + uvv - (F + k) * v)
    np.clip(u, 0, 1, out=u)
    np.clip(v, 0, 1, out=v)
    return u, v


# ── Colormap ───────────────────────────────────────────────────────────────────
#
# Map v concentration (roughly 0..0.45) to RGB.
# Five control points: navy → electric blue → teal → gold → white.

_CM_STOPS = np.array([
    [0.000,   6,   8,  35],
    [0.060,  15,  40, 130],
    [0.160,   0, 170, 210],
    [0.280, 220, 175,  15],
    [0.380, 255, 245, 160],
    [0.500, 255, 255, 255],
], dtype=np.float32)   # columns: v_level, R, G, B


def colormap(v: np.ndarray, brightness: float = 1.0) -> np.ndarray:
    """
    Map a 2-D float array (v concentration) to an H×W×3 uint8 image.
    Uses linear interpolation between the control points above.
    """
    levels = _CM_STOPS[:, 0]
    rgb    = _CM_STOPS[:, 1:]

    # Vectorized: find segment for each pixel
    v_flat  = v.ravel()
    out_rgb = np.empty((v_flat.size, 3), dtype=np.float32)

    for i in range(len(levels) - 1):
        lo, hi   = levels[i], levels[i + 1]
        mask     = (v_flat >= lo) & (v_flat < hi)
        if not mask.any():
            continue
        alpha    = (v_flat[mask] - lo) / (hi - lo)
        alpha    = alpha[:, None]
        out_rgb[mask] = rgb[i] * (1 - alpha) + rgb[i + 1] * alpha

    # Clamp above last stop
    out_rgb[v_flat >= levels[-1]] = rgb[-1]
    out_rgb[v_flat < levels[0]]   = rgb[0]

    out_rgb *= brightness
    return np.clip(out_rgb, 0, 255).astype(np.uint8).reshape(H, W, 3)


# ── Post-processing ────────────────────────────────────────────────────────────

def vignette(img: np.ndarray) -> np.ndarray:
    """Soft dark vignette toward the edges."""
    ys = np.linspace(-1, 1, img.shape[0])[:, None]
    xs = np.linspace(-1, 1, img.shape[1])[None, :]
    dist = np.sqrt(xs ** 2 + ys ** 2)
    fade = np.clip(1.0 - 0.55 * (dist ** 1.8), 0.0, 1.0)[:, :, None]
    return (img * fade).astype(np.uint8)


def grain(img: np.ndarray, rng: np.random.Generator, strength: float = 4.0) -> np.ndarray:
    """Subtle film grain."""
    noise = rng.uniform(-strength, strength, img.shape).astype(np.int16)
    return np.clip(img.astype(np.int16) + noise, 0, 255).astype(np.uint8)


# ── Main ───────────────────────────────────────────────────────────────────────

def main() -> None:
    OUT_W, OUT_H = 750, 750   # output pixel size (upscaled from W×H)
    rng          = np.random.default_rng(7)

    print(f'Gray-Scott reaction-diffusion  {W}x{H} grid  →  {OUT_W}x{OUT_H}  {FRAMES} frames')

    u, v = init_grid()

    # Pre-run: let patterns establish before recording
    print('  pre-running 600 steps ...')
    F0, k0 = WAYPOINTS[0][1], WAYPOINTS[0][2]
    for _ in range(600):
        u, v = step(u, v, F0, k0)

    frames: list[Image.Image] = []
    sim_t = 0.0   # simulation time in seconds

    for f in range(FRAMES):
        t      = f / FPS
        F, k   = get_params(t)

        for _ in range(STEPS_PER_FRAME):
            u, v = step(u, v, F, k)
        sim_t += STEPS_PER_FRAME * DT / FPS   # (not really used, just tracking)

        # Brightness: gentle pulse tied to frame time
        brightness = 0.92 + 0.08 * math.sin(t * 0.4)

        rgb = colormap(v, brightness=brightness)
        rgb = vignette(rgb)
        rgb = grain(rgb, rng, strength=3.0)

        img = Image.fromarray(rgb, 'RGB')
        img = img.resize((OUT_W, OUT_H), Image.NEAREST)
        frames.append(img)

        if (f + 1) % FPS == 0 or f == 0:
            print(f'  frame {f+1:>4}/{FRAMES}  F={F:.4f}  k={k:.4f}')

    out_path = pathlib.Path(__file__).parent / 'bloom.gif'
    print(f'Saving {out_path} ...')
    frames[0].save(
        out_path,
        save_all=True,
        append_images=frames[1:],
        duration=int(1000 / FPS),
        loop=0,
        optimize=False,
    )
    size_mb = out_path.stat().st_size / 1e6
    print(f'  wrote {out_path}  ({FRAMES} frames  {DURATION:.0f}s  {FPS}fps  {size_mb:.1f}MB)')


if __name__ == '__main__':
    main()
