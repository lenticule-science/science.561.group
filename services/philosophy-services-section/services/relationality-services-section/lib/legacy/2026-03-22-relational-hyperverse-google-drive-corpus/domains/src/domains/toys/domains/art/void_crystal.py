#!/usr/bin/env python3
"""
void_crystal.py  ─  The Void Kernel rendered as an animated GIF.

    python src/toys/art/void_crystal.py
    → writes void_crystal.gif to the same directory

════════════════════════════════════════════════════════════════════════════════
KERNEL INSTANCE
────────────────────────────────────────────────────────────────────────────────
  Trace   = finite tuples over Moments {A, B, C}
  Void    = ()
  Excite(m, t) = (m,) + t          [prepend]
  Gradient(a, b) ↔ a is a suffix of b
  All moment pairs bypass each other

════════════════════════════════════════════════════════════════════════════════
ZONE SEMANTICS  (pair asc, desc)
────────────────────────────────────────────────────────────────────────────────
  Possible  (+-):  t == () or t[0] == asc
  Necessary (-+):  strip leading asc's → () or starts with desc
  Absurd    (--):  t == ()                           [only Void]
  Done      (++):  t == () or t[0] ∈ {asc, desc}

  Zone lattice (VoidFrame): Absurd ⊆ Necessary,  Possible ⊆ Done

════════════════════════════════════════════════════════════════════════════════
NUCLEAR SEMANTICS
────────────────────────────────────────────────────────────────────────────────
  ExciteKernel(m, P, t) ↔ ∃k≥0 : P(m^k ++ t)
  Glow intensity = reciprocal witness depth for zone_necessary via desc-kernel.

════════════════════════════════════════════════════════════════════════════════
VISUAL ENCODING
────────────────────────────────────────────────────────────────────────────────
  Radial tree: Void at center, depth-d traces in ring d.
  Node glyph: 2-char zone symbol, colored by zone membership.
  Gradient edges: dotted lines from suffix (parent) outward, moment-colored.
  Bypass arcs: curved purple lines between site-equivalent pairs.
  NuclearDischarge ripple: expanding wave from Void every ~5 s.
  (asc, desc) pair rotates across the animation.
════════════════════════════════════════════════════════════════════════════════
"""

from __future__ import annotations
import sys
import math
import itertools
import pathlib
from typing import Dict, List, Tuple

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

import numpy as np
from PIL import Image, ImageDraw, ImageFont

# ── Kernel instance ────────────────────────────────────────────────────────────

MOMENTS = (0, 1, 2)
NAMES   = {0: 'A', 1: 'B', 2: 'C'}
VOID: Tuple[int, ...] = ()


def all_traces(max_depth: int) -> List[Tuple[int, ...]]:
    result: List[Tuple[int, ...]] = [VOID]
    for d in range(1, max_depth + 1):
        result.extend(itertools.product(MOMENTS, repeat=d))
    return result


# ── Zone predicates ────────────────────────────────────────────────────────────

def zone_possible(asc: int, desc: int, t: Tuple) -> bool:
    return t == VOID or bool(t and t[0] == asc)


def zone_necessary(asc: int, desc: int, t: Tuple) -> bool:
    i = 0
    while i < len(t) and t[i] == asc:
        i += 1
    rest = t[i:]
    return rest == VOID or bool(rest and rest[0] == desc)


def zone_absurd(asc: int, desc: int, t: Tuple) -> bool:
    return t == VOID


def zone_done(asc: int, desc: int, t: Tuple) -> bool:
    return t == VOID or bool(t and t[0] in (asc, desc))


def zone_sig(asc: int, desc: int, t: Tuple) -> int:
    return (
        (zone_possible(asc, desc, t)  << 3) |
        (zone_necessary(asc, desc, t) << 2) |
        (zone_absurd(asc, desc, t)    << 1) |
        (zone_done(asc, desc, t)      << 0)
    )


# ── Nuclear zones ──────────────────────────────────────────────────────────────

def nuc_glow(asc: int, desc: int, t: Tuple, max_k: int = 7) -> float:
    """
    Reciprocal witness depth for ExciteKernel(desc, zone_necessary, t).
    1.0 if immediately necessary (k=0), decays, 0.0 if unreachable.
    """
    cur = t
    for k in range(max_k):
        if zone_necessary(asc, desc, cur):
            return 1.0 - k / max_k
        cur = (desc,) + cur
    return 0.0


# ── Zone color palette ─────────────────────────────────────────────────────────
#
# Bit signature: bit3=Possible, bit2=Necessary, bit1=Absurd, bit0=Done

ZONE_RGB: Dict[int, Tuple[int, int, int]] = {
    0b0000: (22,  22,  55),    # vacuum         near-black indigo
    0b0001: (10,  220, 110),   # done           emerald
    0b0100: (225, 185,  10),   # necessary      amber
    0b0101: (55,  215, 155),   # nec + done     teal
    0b1001: (0,   240, 165),   # poss + done    aquamarine
    0b1101: (210, 205,  50),   # poss+nec+done  gold
    0b1111: (255, 255, 255),   # all zones      white (Void)
}

ZONE_GLYPH: Dict[int, str] = {
    0b0000: '  ',
    0b0001: '++',
    0b0100: '-+',
    0b0101: '=+',
    0b1001: '+-',
    0b1101: '**',
    0b1111: 'VD',
}

MOMENT_EDGE_RGB = {
    0: (35,  90, 185),   # A  deep blue
    1: (30, 150,  55),   # B  deep green
    2: (170, 95,  20),   # C  deep orange
}


# ── Layout ─────────────────────────────────────────────────────────────────────

def compute_layout(
    traces: List[Tuple],
    max_depth: int,
    W: int,
    H: int,
) -> Dict[Tuple, Tuple[float, float]]:
    """
    Void at center. Depth-d traces placed in an elliptical ring.
    Returns (x, y) with y increasing downward (pixel convention).
    """
    cx, cy = W / 2.0, H / 2.0
    pos: Dict[Tuple, Tuple[float, float]] = {VOID: (cx, cy)}
    for d in range(1, max_depth + 1):
        layer = [t for t in traces if len(t) == d]
        n = len(layer)
        rx = cx * 0.88 * d / max_depth
        ry = cy * 0.82 * d / max_depth
        for i, t in enumerate(layer):
            angle = 2 * math.pi * i / n - math.pi / 2
            x = cx + rx * math.cos(angle)
            y = cy + ry * math.sin(angle)
            pos[t] = (x, y)
    return pos


# ── Pixel rendering helpers ────────────────────────────────────────────────────

def _clamp(v: float) -> int:
    return max(0, min(255, int(v)))


def add_glow(
    buf: np.ndarray,
    cx: float,
    cy: float,
    color: Tuple[int, int, int],
    radius: float,
    intensity: float,
) -> None:
    """Add a soft radial glow to the RGBA float buffer (values 0–1)."""
    r, g_ch, b_ch = color[0] / 255.0, color[1] / 255.0, color[2] / 255.0
    x0 = max(0, int(cx - radius * 3))
    x1 = min(buf.shape[1], int(cx + radius * 3) + 1)
    y0 = max(0, int(cy - radius * 3))
    y1 = min(buf.shape[0], int(cy + radius * 3) + 1)
    xs = np.arange(x0, x1)
    ys = np.arange(y0, y1)
    xx, yy = np.meshgrid(xs, ys)
    dist2 = ((xx - cx) ** 2 + (yy - cy) ** 2)
    alpha = intensity * np.exp(-dist2 / (2 * radius ** 2))
    alpha = np.clip(alpha, 0, 1)
    buf[y0:y1, x0:x1, 0] += r * alpha
    buf[y0:y1, x0:x1, 1] += g_ch * alpha
    buf[y0:y1, x0:x1, 2] += b_ch * alpha
    buf[y0:y1, x0:x1, 3] += alpha


def add_ripple(
    buf: np.ndarray,
    cx: float,
    cy: float,
    radius: float,
    width: float,
    intensity: float,
) -> None:
    """Paint an expanding ring ripple."""
    if intensity < 0.01:
        return
    x0 = max(0, int(cx - radius - width * 3))
    x1 = min(buf.shape[1], int(cx + radius + width * 3) + 1)
    y0 = max(0, int(cy - radius - width * 3))
    y1 = min(buf.shape[0], int(cy + radius + width * 3) + 1)
    if x1 <= x0 or y1 <= y0:
        return
    xs = np.arange(x0, x1)
    ys = np.arange(y0, y1)
    xx, yy = np.meshgrid(xs, ys)
    # Aspect-ratio adjusted to look circular
    dist = np.sqrt(((xx - cx) / 1.0) ** 2 + ((yy - cy) / 1.0) ** 2)
    ring = intensity * np.exp(-((dist - radius) ** 2) / (2 * width ** 2))
    ring = np.clip(ring, 0, 1)
    buf[y0:y1, x0:x1, 0] += ring
    buf[y0:y1, x0:x1, 1] += ring
    buf[y0:y1, x0:x1, 2] += ring
    buf[y0:y1, x0:x1, 3] += ring


def draw_line_aa(
    buf: np.ndarray,
    x1: float,
    y1: float,
    x2: float,
    y2: float,
    color: Tuple[int, int, int],
    alpha: float,
    width: float = 0.8,
) -> None:
    """Anti-aliased line via glow blobs along the path."""
    r, g, b = color[0] / 255.0, color[1] / 255.0, color[2] / 255.0
    length = math.hypot(x2 - x1, y2 - y1)
    steps = max(2, int(length))
    for k in range(steps + 1):
        t = k / steps
        x = x1 + (x2 - x1) * t
        y = y1 + (y2 - y1) * t
        xi, yi = int(round(x)), int(round(y))
        if 0 <= yi < buf.shape[0] and 0 <= xi < buf.shape[1]:
            a = alpha * 0.6
            buf[yi, xi, 0] += r * a
            buf[yi, xi, 1] += g * a
            buf[yi, xi, 2] += b * a
            buf[yi, xi, 3] += a
            # 1-pixel wide AA fringe
            for dx, dy in ((-1, 0), (1, 0), (0, -1), (0, 1)):
                nx, ny = xi + dx, yi + dy
                if 0 <= ny < buf.shape[0] and 0 <= nx < buf.shape[1]:
                    fa = alpha * 0.15
                    buf[ny, nx, 0] += r * fa
                    buf[ny, nx, 1] += g * fa
                    buf[ny, nx, 2] += b * fa
                    buf[ny, nx, 3] += fa


def draw_bypass_arc(
    buf: np.ndarray,
    x1: float,
    y1: float,
    x2: float,
    y2: float,
    color: Tuple[int, int, int],
    alpha: float,
    t_phase: float,
) -> None:
    """
    Sinusoidal arc between two bypass-equivalent nodes.
    The arc oscillates perpendicular to the chord, giving a
    wavy line that visually distinguishes it from gradient edges.
    """
    r, g, b = color[0] / 255.0, color[1] / 255.0, color[2] / 255.0
    dx, dy = x2 - x1, y2 - y1
    length = math.hypot(dx, dy)
    if length < 1:
        return
    # Perpendicular unit vector
    nx, ny = -dy / length, dx / length
    steps = max(3, int(length * 1.5))
    for k in range(steps + 1):
        frac = k / steps
        x = x1 + dx * frac
        y = y1 + dy * frac
        # Wavy offset
        wave = math.sin(frac * math.pi * 3 + t_phase) * min(8.0, length * 0.12)
        x += nx * wave
        y += ny * wave
        xi, yi = int(round(x)), int(round(y))
        if 0 <= yi < buf.shape[0] and 0 <= xi < buf.shape[1]:
            a = alpha * 0.7
            buf[yi, xi, 0] += r * a
            buf[yi, xi, 1] += g * a
            buf[yi, xi, 2] += b * a
            buf[yi, xi, 3] += a


def buf_to_image(buf: np.ndarray) -> Image.Image:
    """Convert float RGBA buffer (accumulated, may exceed 1) to RGB PIL image."""
    rgb = buf[:, :, :3] / np.maximum(buf[:, :, 3:4], 0.001)
    rgb = np.clip(rgb, 0, 1)
    # Tone-map: soft clip via tanh-ish curve to preserve highlights
    rgb = 1.0 - np.exp(-rgb * 1.8)
    return Image.fromarray((rgb * 255).astype(np.uint8), 'RGB')


# ── Legend rendering ────────────────────────────────────────────────────────────

def draw_legend(draw: ImageDraw.ImageDraw, W: int, H: int, asc: int, desc: int) -> None:
    """Overlay text information at the bottom of the frame."""
    try:
        font_sm = ImageFont.truetype('cour.ttf', 14)
        font_lg = ImageFont.truetype('cour.ttf', 20)
    except Exception:
        font_sm = ImageFont.load_default()
        font_lg = font_sm

    # Pair label
    pair = f'{NAMES[asc]} \u2192 {NAMES[desc]}'
    draw.text((18, H - 72), f'VOID CRYSTAL   pair: {pair}', fill=(180, 180, 255), font=font_lg)

    # Zone legend
    legend = [
        ('+-', (0, 240, 165), 'Possible'),
        ('-+', (225, 185, 10), 'Necessary'),
        ('--', (255, 60, 60),  'Absurd'),
        ('++', (10, 220, 110), 'Done'),
    ]
    x = 18
    draw.text((x, H - 46), 'zones:', fill=(120, 120, 170), font=font_sm)
    x += 62
    for glyph, color, name in legend:
        draw.text((x, H - 46), f'{glyph} {name}', fill=color, font=font_sm)
        x += len(name) * 9 + 38

    # Bottom hint
    draw.text((18, H - 24),
              'ExciteKernel resonance glowing  \u00b7  DifferentialBypass arcs pulsing  \u00b7  NuclearDischarge rippling',
              fill=(60, 60, 100), font=font_sm)


# ── Frame renderer ─────────────────────────────────────────────────────────────

def render_frame(
    traces: List[Tuple],
    pos: Dict[Tuple, Tuple[float, float]],
    grad_edges: List[Tuple[Tuple, Tuple]],
    equiv_edges: List[Tuple[Tuple, Tuple]],
    W: int,
    H: int,
    asc: int,
    desc: int,
    t: float,
    ripple_events: List[float],
) -> Image.Image:
    """Render one animation frame, returning an RGB PIL Image."""

    # RGBA accumulation buffer (float)
    buf = np.zeros((H, W, 4), dtype=np.float64)

    # ── Background gradient: near-black indigo deepening from center ──────────
    cx, cy = W / 2.0, H / 2.0
    ys = np.arange(H)[:, None]
    xs = np.arange(W)[None, :]
    dist_norm = np.sqrt(((xs - cx) / cx) ** 2 + ((ys - cy) / cy) ** 2)
    bg_r = 0.065 + 0.015 * dist_norm
    bg_g = 0.065 + 0.010 * dist_norm
    bg_b = 0.20  + 0.05  * dist_norm
    buf[:, :, 0] = np.clip(bg_r, 0, 0.12)
    buf[:, :, 1] = np.clip(bg_g, 0, 0.09)
    buf[:, :, 2] = np.clip(bg_b, 0, 0.28)
    buf[:, :, 3] = 1.0

    # ── Ripple events (NuclearDischarge from Void) ─────────────────────────────
    vx, vy = pos[VOID]
    for t0 in ripple_events:
        dt = t - t0
        if dt < 0 or dt > 2.6:
            continue
        radius  = dt * (min(W, H) * 0.25)
        width   = max(2.0, min(W, H) * 0.012)
        rip_int = 0.55 * math.exp(-dt * 1.5)
        add_ripple(buf, vx, vy, radius, width, rip_int)

    # ── Gradient edges (parent = t[1:]) ───────────────────────────────────────
    for (parent, child) in grad_edges:
        m     = child[0]
        base  = MOMENT_EDGE_RGB[m]
        pulse = 0.28 + 0.18 * math.sin(t * 2.1 + m * 1.1 + hash(child) % 9 * 0.5)
        color = tuple(int(c * pulse) for c in base)
        x1, y1 = pos[parent]
        x2, y2 = pos[child]
        draw_line_aa(buf, x1, y1, x2, y2, color, alpha=0.90)  # type: ignore[arg-type]

    # ── Bypass arcs (site-equivalent pairs) ───────────────────────────────────
    for (ta, tb) in equiv_edges:
        bp_phase   = t * 2.8 + hash((ta, tb)) % 7 * 0.9
        intensity  = 0.55 + 0.30 * abs(math.sin(bp_phase))
        arc_color  = (int(140 * intensity), 0, int(200 * intensity))
        x1, y1    = pos[ta]
        x2, y2    = pos[tb]
        draw_bypass_arc(buf, x1, y1, x2, y2, arc_color, alpha=0.85, t_phase=bp_phase)  # type: ignore[arg-type]

    # ── Node glows ────────────────────────────────────────────────────────────
    for tr in traces:
        if tr not in pos:
            continue
        x, y   = pos[tr]
        sig    = zone_sig(asc, desc, tr)
        glow   = nuc_glow(asc, desc, tr)
        base   = ZONE_RGB.get(sig, (90, 90, 90))
        pulse  = t * 1.9 + sum(tr) * 0.85 + hash(tr) % 6 * 0.5
        bright = 0.55 + 0.25 * math.sin(pulse) + 0.15 * glow

        # Void heartbeat
        if tr == VOID:
            beat   = abs(math.sin(t * 2.5))
            bright = 0.80 + 0.20 * beat

        color = tuple(int(c * bright) for c in base)

        # Ripple brightening
        for t0 in ripple_events:
            dt = t - t0
            if dt < 0 or dt > 2.6:
                continue
            vx2, vy2 = pos[VOID]
            dist = math.hypot(x - vx2, y - vy2)
            wave_r = dt * (min(W, H) * 0.25)
            rip = 0.5 * math.exp(-((dist - wave_r) ** 2) / (2 * (min(W, H) * 0.015) ** 2))
            rip *= math.exp(-dt * 1.5)
            color = tuple(min(255, int(c + 220 * rip)) for c in color)

        # Outer glow
        glow_radius = 22 + 10 * glow + (30 if tr == VOID else 0)
        add_glow(buf, x, y, color, glow_radius, intensity=0.55 + 0.20 * glow)  # type: ignore[arg-type]

        # Inner core
        core_radius = 7 if tr == VOID else 5
        add_glow(buf, x, y, color, core_radius, intensity=1.8)  # type: ignore[arg-type]

    # ── Convert to image and add text overlay ─────────────────────────────────
    img  = buf_to_image(buf)
    draw = ImageDraw.Draw(img)

    # Node glyphs
    try:
        font_glyph = ImageFont.truetype('cour.ttf', 13)
        font_label = ImageFont.truetype('cour.ttf', 10)
    except Exception:
        font_glyph = ImageFont.load_default()
        font_label = font_glyph

    for tr in traces:
        if tr not in pos:
            continue
        x, y  = pos[tr]
        sig   = zone_sig(asc, desc, tr)
        glyph = ZONE_GLYPH.get(sig, '  ')
        if glyph == '  ':
            continue
        base   = ZONE_RGB.get(sig, (90, 90, 90))
        glow   = nuc_glow(asc, desc, tr)
        pulse  = t * 1.9 + sum(tr) * 0.85 + hash(tr) % 6 * 0.5
        bright = 0.75 + 0.25 * math.sin(pulse)
        color  = tuple(_clamp(c * bright) for c in base)
        if tr == VOID:
            beat   = abs(math.sin(t * 2.5))
            color  = (_clamp(210 + 45 * beat),) * 3

        xi, yi = int(x), int(y)
        draw.text((xi - 7, yi - 7), glyph, fill=color, font=font_glyph)

        # Dim trace label below node (depth ≤ 2)
        if len(tr) <= 2:
            label = '()' if tr == VOID else ''.join(NAMES[m] for m in tr)
            lc    = tuple(_clamp(c * 0.35) for c in base)
            draw.text((xi - 5, yi + 7), label, fill=lc, font=font_label)

    draw_legend(draw, W, H, asc, desc)
    return img


# ── Main ───────────────────────────────────────────────────────────────────────

def main() -> None:
    W, H      = 1280, 720
    FPS       = 20
    DURATION  = 18.0           # seconds
    MAX_DEPTH = 3

    traces = all_traces(MAX_DEPTH)
    pos    = compute_layout(traces, MAX_DEPTH, W, H)

    # Pair schedule: 3 pairs × 6 s each = 18 s
    pair_schedule = [(0, 1), (1, 2), (2, 0)]   # (A→B), (B→C), (C→A)

    # Gradient edges: parent = t[1:]
    grad_edges: List[Tuple[Tuple, Tuple]] = [
        (t[1:], t) for t in traces if t != VOID and t[1:] in pos
    ]

    # Bypass arcs: swap first two moments
    equiv_edges: List[Tuple[Tuple, Tuple]] = []
    seen: set = set()
    for t in traces:
        if len(t) >= 2:
            swap = (t[1], t[0]) + t[2:]
            if swap != t and swap in pos:
                key = (min(t, swap), max(t, swap))
                if key not in seen:
                    seen.add(key)
                    equiv_edges.append((t, swap))

    # Ripple times: every ~5 s
    ripple_times = [r for r in np.arange(1.0, DURATION, 5.2)]

    total_frames = int(DURATION * FPS)
    frames: List[Image.Image] = []

    print(f'Rendering {total_frames} frames at {W}×{H} ...')
    for f in range(total_frames):
        t         = f / FPS
        pair_idx  = int(t / (DURATION / len(pair_schedule))) % len(pair_schedule)
        asc, desc = pair_schedule[pair_idx]

        active_ripples = [t0 for t0 in ripple_times if 0 <= t - t0 < 3.0]

        img = render_frame(
            traces, pos, grad_edges, equiv_edges,
            W, H, asc, desc, t, active_ripples,
        )
        frames.append(img)

        if (f + 1) % 20 == 0 or f == 0:
            print(f'  frame {f+1:>4}/{total_frames}  pair={NAMES[asc]}\u2192{NAMES[desc]}')

    out_path = pathlib.Path(__file__).parent / 'void_crystal.gif'
    print(f'Saving {out_path} ...')
    frames[0].save(
        out_path,
        save_all=True,
        append_images=frames[1:],
        duration=int(1000 / FPS),
        loop=0,
        optimize=False,
    )
    print(f'  wrote {out_path}  ({total_frames} frames, {DURATION:.0f}s, {FPS}fps)')


if __name__ == '__main__':
    main()
