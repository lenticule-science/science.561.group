"""
The Depth Tower Building Itself — MP4 video, ~60 seconds, 80 tower levels.

This shows the ACTUAL DYNAMICS of the relational universe construction:

  1. APPEAR: New unsettled modes fade in at tower level n
     (a quasicrystalline pattern at frequency phi^n)

  2. SIGMA SETTLES: The saturation nucleus acts.
     Backward-stable structure crystallizes — blue geometric edges form.
     This is sigma closing under sub-history data.

  3. DELTA SETTLES: The transfer nucleus acts.
     Forward-stable structure crystallizes — gold geometric edges form.
     This is Delta closing under one-step extensions.

  4. H* EMERGES: The joint fixed point.
     Where both networks agree, bright white vertices persist.
     Everything else fades to dim.

  5. TOWER-FIBER SEEDING: H* at level n becomes the carrier at level n+1.
     The persisted fixed points seed new, finer structure.

  6. REPEAT: Each cycle adds one tower level. The pattern gets richer.
     The universe builds itself from nothing.

The animation IS the depth tower R_0 -> R_1 -> ... -> R.
Each cycle is one application of U_G.
The fixed points that persist are the self-generation theorem in real time.
"""

from pathlib import Path
import numpy as np
BUILD_ART = Path(__file__).parent.parent.parent / "build" / "art"
BUILD_ART.mkdir(parents=True, exist_ok=True)
import imageio.v3 as iio

phi = (1 + np.sqrt(5)) / 2

# --- Settings ---
res = 700        # pixel resolution
span = 7.0       # coordinate span
n_fold = 5       # 5-fold symmetry
n_levels = 20    # tower levels to animate
fps = 24         # frames per second

# 20 levels × 72 frames/level = 1440 frames = 60 s at 24 fps
n_appear = 15    # new modes fade in
n_sigma  = 20    # sigma settles
n_delta  = 20    # delta settles
n_fixed  = 12    # H* glows, non-fixed fades
n_pause  = 5     # brief pause before next level

frames_per_level = n_appear + n_sigma + n_delta + n_fixed + n_pause  # = 72

x = np.linspace(-span, span, res)
y = np.linspace(-span, span, res)
X, Y = np.meshgrid(x, y)
R_dist = np.sqrt(X**2 + Y**2)

# Gentle vignette
vig = 0.04 + 0.96 * np.exp(-0.2 * (R_dist / span) ** 3)


def ease(t):
    """Smooth ease-in-out."""
    return t * t * (3 - 2 * t)


def to_frame(r, g, b):
    """Convert float arrays to uint8 numpy array (H×W×3)."""
    r = np.clip(r * vig, 0, 1)
    g = np.clip(g * vig, 0, 1)
    b = np.clip(b * vig, 0, 1)
    gamma = 0.78
    r = r ** gamma
    g = g ** gamma
    b = b ** gamma
    rgb = np.stack([r, g, b], axis=-1)
    return (np.clip(rgb, 0, 1) * 255).astype(np.uint8)


# --- Precompute wave fields for each tower level ---
print(f"Precomputing wave fields for {n_levels} levels...")
levels = []
for level in range(n_levels):
    freq = phi ** (level * 0.5)
    rot = level * 2 * np.pi / (n_fold * phi ** 2)
    amp_scale = phi ** (-level * 0.25)

    sigma = np.zeros_like(X)
    delta = np.zeros_like(X)

    for i in range(n_fold):
        angle = 2 * np.pi * i / n_fold + rot
        kx, ky = np.cos(angle), np.sin(angle)
        proj = kx * X + ky * Y
        sigma += np.cos(2 * np.pi * freq * proj)
        delta += np.cos(2 * np.pi * freq * phi * proj)

    sigma = amp_scale * sigma / n_fold
    delta = amp_scale * delta / n_fold

    s_edge = np.exp(-sigma**2 / 0.008)
    d_edge = np.exp(-delta**2 / 0.008)
    s_glow = np.exp(-sigma**2 / 0.04)
    d_glow = np.exp(-delta**2 / 0.04)

    noise = np.abs(sigma) + np.abs(delta)
    noise = noise / max(noise.max(), 1e-10)

    joint = s_edge * d_edge
    joint = (joint / max(joint.max(), 1e-10)) ** 0.4

    levels.append({
        's_edge': s_edge, 'd_edge': d_edge,
        's_glow': s_glow, 'd_glow': d_glow,
        'noise': noise, 'joint': joint,
    })

# --- Stream frames directly to MP4 ---
out = str(BUILD_ART / 'tower-dynamics.mp4')

settled_r = np.full((res, res), 0.003)
settled_g = np.full((res, res), 0.002)
settled_b = np.full((res, res), 0.006)

total_frames = n_levels * frames_per_level
print(f"Generating {total_frames} frames ({total_frames/fps:.1f} s at {fps} fps)...")

with iio.imopen(out, 'w', plugin='pyav') as writer:
    writer.init_video_stream('libx264', fps=fps)

    frame_count = 0

    for level in range(n_levels):
        L = levels[level]
        s_e = L['s_edge']
        d_e = L['d_edge']
        s_g = L['s_glow']
        noise = L['noise']
        joint = L['joint']

        if (level + 1) % 5 == 0 or level == 0:
            print(f"  Level {level+1}/{n_levels} ...")

        # ── Phase 1: APPEAR ──
        for i in range(n_appear):
            t = ease(i / max(n_appear - 1, 1))
            n_vis = t * noise
            writer.write_frame(to_frame(
                settled_r + n_vis * 0.25,
                settled_g + n_vis * 0.18,
                settled_b + n_vis * 0.25,
            ))
            frame_count += 1

        # ── Phase 2: SIGMA SETTLES ──
        for i in range(n_sigma):
            t = ease(i / max(n_sigma - 1, 1))
            n_rem = (1 - t) * noise
            s_vis = t * s_e
            s_gv  = t * s_g
            writer.write_frame(to_frame(
                settled_r + n_rem * 0.15 + 0.015 * s_gv + 0.03 * s_vis,
                settled_g + n_rem * 0.10 + 0.08  * s_gv + 0.20 * s_vis,
                settled_b + n_rem * 0.15 + 0.20  * s_gv + 0.50 * s_vis,
            ))
            frame_count += 1

        # ── Phase 3: DELTA SETTLES ──
        for i in range(n_delta):
            t = ease(i / max(n_delta - 1, 1))
            d_vis = t * d_e
            d_gv  = t * L['d_glow']
            writer.write_frame(to_frame(
                settled_r + 0.015*s_g + 0.03*s_e + 0.20*d_gv + 0.50*d_vis,
                settled_g + 0.08 *s_g + 0.20*s_e + 0.10*d_gv + 0.25*d_vis,
                settled_b + 0.20 *s_g + 0.50*s_e + 0.01*d_gv + 0.03*d_vis,
            ))
            frame_count += 1

        # ── Phase 4: H* EMERGES ──
        for i in range(n_fixed):
            t = ease(i / max(n_fixed - 1, 1))
            fade = 1 - 0.75 * t
            s_dim = fade * s_e * (1 - joint) + s_e * joint
            d_dim = fade * d_e * (1 - joint) + d_e * joint
            j_bright = t * joint
            writer.write_frame(to_frame(
                settled_r + 0.01 * s_dim + 0.15 * d_dim * fade + 0.70 * j_bright,
                settled_g + 0.06 * s_dim + 0.08 * d_dim * fade + 0.60 * j_bright,
                settled_b + 0.15 * s_dim + 0.01 * d_dim * fade + 0.40 * j_bright,
            ))
            frame_count += 1

        # ── Update settled pattern ──
        persist = joint * 0.25
        trace_s = s_e * 0.04
        trace_d = d_e * 0.04
        settled_r = settled_r + persist * 0.55 + trace_d * 0.15
        settled_g = settled_g + persist * 0.45 + (trace_s + trace_d) * 0.04
        settled_b = settled_b + persist * 0.30 + trace_s * 0.15

        # ── Pause frames ──
        hold = to_frame(settled_r, settled_g, settled_b)
        for _ in range(n_pause):
            writer.write_frame(hold)
            frame_count += 1

print(f"Saved {out}")
print(f"  {frame_count} frames at {fps} fps = {frame_count/fps:.1f} seconds")
print(f"  {res}x{res} pixels, {n_levels} tower levels")
