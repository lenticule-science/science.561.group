#!/usr/bin/env python3
"""
flow.py  ─  Void charge algebra as particle flow on the trace tree.

Every element of the visualization is derived directly from the void/ formal system.
Nothing here is borrowed from other fields.

════════════════════════════════════════════════════════════════════════════════
WHAT IS DERIVED FROM THE MATH
════════════════════════════════════════════════════════════════════════════════

  Particles        Traces (tuples of moments, depth ≤ 3).
  Node positions   Radial tree: depth = Excite-distance from Void,
                   angle = base-3 digits of angle/(2π) → moment sequence.
  Gradient edges   The Gradient relation: t ≤ Excite(m, t) drawn as lines.
  Bypass arcs      DifferentialBypass: site-equivalent pairs arc-connected.
  Move weights     zone_sig(asc, desc, t) drives every transition probability:
                     Possible  (+-)  →  excite outward via asc  (energize)
                     Necessary (-+)  →  peel inward              (discharge toward Void)
                     Absurd    (--)  →  fast peel                (Void as strong attractor)
                     Done      (++)  →  gentle stay + asc drift
                     Vacuum    (00)  →  random walk
  Discharge flash  NuclearDischarge: particle at t = (asc,…) with Possible zone
                   jumps to (desc,)+t via ExciteShift.  Bright streak drawn.
  Node glow        ExciteKernel witness depth for zone_necessary → glow radius.
  Node color       zone_sig(asc, desc, t) → ZONE_RGB.
  Pair symmetry    SiteInvariant: site-equivalent nodes have equal particle density
                   (visible: bypass-arc pairs pulse together).

════════════════════════════════════════════════════════════════════════════════

    python src/toys/art/flow.py
    → writes flow.mp4

Dependencies: numpy, scipy, PIL, av (pyav)
"""

from __future__ import annotations
import sys
import math
import pathlib
import itertools
import numpy as np
from PIL import Image, ImageDraw, ImageFont
import av

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')

# ── Kernel instance ────────────────────────────────────────────────────────────

MOMENTS   = (0, 1, 2)
NAMES     = {0: 'A', 1: 'B', 2: 'C'}
VOID: tuple = ()
MAX_DEPTH = 3


def all_traces(max_depth: int) -> list[tuple]:
    result = [VOID]
    for d in range(1, max_depth + 1):
        result.extend(itertools.product(MOMENTS, repeat=d))
    return result


# ── Zone predicates ────────────────────────────────────────────────────────────

def zone_possible(asc, desc, t):
    return t == VOID or bool(t and t[0] == asc)

def zone_necessary(asc, desc, t):
    i = 0
    while i < len(t) and t[i] == asc:
        i += 1
    rest = t[i:]
    return rest == VOID or bool(rest and rest[0] == desc)

def zone_absurd(asc, desc, t):
    return t == VOID

def zone_done(asc, desc, t):
    return t == VOID or bool(t and t[0] in (asc, desc))

def zone_sig(asc, desc, t) -> int:
    return (
        (zone_possible(asc, desc, t)  << 3) |
        (zone_necessary(asc, desc, t) << 2) |
        (zone_absurd(asc, desc, t)    << 1) |
        (zone_done(asc, desc, t)      << 0)
    )

def nuc_glow(asc, desc, t, max_k=6) -> float:
    """ExciteKernel witness depth for zone_necessary → glow intensity."""
    cur = t
    for k in range(max_k):
        if zone_necessary(asc, desc, cur):
            return 1.0 - k / max_k
        cur = (desc,) + cur
    return 0.0


# ── Zone colors and glyphs ─────────────────────────────────────────────────────

ZONE_RGB = {
    0b0000: (18,  18,  50),
    0b0001: (10,  215, 110),
    0b0100: (220, 185,  10),
    0b0101: (55,  215, 155),
    0b1001: (0,   240, 165),
    0b1101: (210, 205,  50),
    0b1111: (255, 255, 255),
}

ZONE_GLYPH = {
    0b0000: '  ', 0b0001: '++', 0b0100: '-+',
    0b0101: '=+', 0b1001: '+-', 0b1101: '**', 0b1111: 'VD',
}

MOMENT_EDGE_RGB = {0: (30, 80, 175), 1: (30, 145, 55), 2: (165, 95, 20)}


# ── Transition matrix ──────────────────────────────────────────────────────────
#
# For each (asc, desc) pair: a |traces| × |traces| stochastic matrix.
# T[i, j] = probability that a particle at traces[i] moves to traces[j] per step.
# Derived entirely from zone_sig(asc, desc, traces[i]).

def build_transition_matrix(
    asc: int,
    desc: int,
    traces: list[tuple],
    t2i: dict[tuple, int],
) -> np.ndarray:
    N = len(traces)
    T = np.zeros((N, N), dtype=np.float64)

    for i, t in enumerate(traces):
        sig = zone_sig(asc, desc, t)
        P   = bool(sig & 8)
        Ne  = bool(sig & 4)
        Ab  = bool(sig & 2)
        D   = bool(sig & 1)

        def w(dest: tuple, weight: float):
            if dest in t2i and len(dest) <= MAX_DEPTH:
                T[i, t2i[dest]] += weight

        if t == VOID:
            # Void is the birth point: particles emerge strongly toward asc
            w((asc,),  0.50)
            w((desc,), 0.25)
            for m in MOMENTS:
                if m != asc and m != desc:
                    w((m,), 0.125)

        elif Ab:
            # Absurd (= Void in our model, handled above)
            w(t[1:], 0.80)
            T[i, t2i[t]] += 0.20

        elif P and Ne:
            # Possible + Necessary: energetic AND must peel → oscillating
            w((asc,) + t, 0.32)
            w(t[1:],      0.35)
            w((desc,) + t, 0.08)
            if len(t) >= 2:
                sw = (t[1], t[0]) + t[2:]
                if sw != t:
                    w(sw, 0.08)
            T[i, t2i[t]] += 0.17

        elif P:
            # Possible only: outward energy via asc
            w((asc,) + t,  0.42)
            w((desc,) + t, 0.10)
            for m in MOMENTS:
                if m != asc and m != desc:
                    w((m,) + t, 0.04)
            w(t[1:], 0.18)
            if len(t) >= 2:
                sw = (t[1], t[0]) + t[2:]
                if sw != t:
                    w(sw, 0.06)
            T[i, t2i[t]] += 0.16

        elif Ne:
            # Necessary only: strong inward pull
            w(t[1:],      0.58)
            w((asc,) + t, 0.08)
            if len(t) >= 2:
                sw = (t[1], t[0]) + t[2:]
                if sw != t:
                    w(sw, 0.10)
            T[i, t2i[t]] += 0.24

        elif D:
            # Done only: mild stay with slow asc drift
            w(t[1:],      0.22)
            w((asc,) + t, 0.20)
            for m in MOMENTS:
                if m != asc:
                    w((m,) + t, 0.03)
            T[i, t2i[t]] += 0.49

        else:
            # Vacuum: aimless random walk
            for m in MOMENTS:
                w((m,) + t, 0.08)
            if t:
                w(t[1:], 0.18)
            T[i, t2i[t]] += 0.50

        # Renormalize row
        row_sum = T[i].sum()
        if row_sum > 0:
            T[i] /= row_sum
        else:
            T[i, i] = 1.0

    return T.astype(np.float32)


# ── Radial tree layout ─────────────────────────────────────────────────────────

def compute_layout(traces: list[tuple], W: int, H: int) -> dict[tuple, tuple[float, float]]:
    cx, cy = W / 2.0, H / 2.0
    pos = {VOID: (cx, cy)}
    for d in range(1, MAX_DEPTH + 1):
        layer = [t for t in traces if len(t) == d]
        n = len(layer)
        rx = cx * 0.88 * d / MAX_DEPTH
        ry = cy * 0.82 * d / MAX_DEPTH
        for i, t in enumerate(layer):
            angle = 2 * math.pi * i / n - math.pi / 2
            pos[t] = (cx + rx * math.cos(angle), cy + ry * math.sin(angle))
    return pos


# ── Rendering helpers ──────────────────────────────────────────────────────────

def add_glow(buf, cx, cy, color, radius, intensity):
    r, g, b = color[0]/255.0, color[1]/255.0, color[2]/255.0
    x0 = max(0, int(cx - radius * 3))
    x1 = min(buf.shape[1], int(cx + radius * 3) + 1)
    y0 = max(0, int(cy - radius * 3))
    y1 = min(buf.shape[0], int(cy + radius * 3) + 1)
    if x1 <= x0 or y1 <= y0:
        return
    xs = np.arange(x0, x1); ys = np.arange(y0, y1)
    xx, yy = np.meshgrid(xs, ys)
    a = intensity * np.exp(-((xx-cx)**2 + (yy-cy)**2) / (2*radius**2))
    a = np.clip(a, 0, 1)
    buf[y0:y1, x0:x1, 0] += r * a
    buf[y0:y1, x0:x1, 1] += g * a
    buf[y0:y1, x0:x1, 2] += b * a
    buf[y0:y1, x0:x1, 3] += a


def draw_line_aa(buf, x1, y1, x2, y2, color, alpha):
    r, g, b = color[0]/255.0, color[1]/255.0, color[2]/255.0
    steps = max(2, int(math.hypot(x2-x1, y2-y1)))
    for k in range(steps+1):
        t = k/steps
        xi, yi = int(round(x1+(x2-x1)*t)), int(round(y1+(y2-y1)*t))
        if 0 <= yi < buf.shape[0] and 0 <= xi < buf.shape[1]:
            a = alpha * 0.6
            buf[yi,xi,0] += r*a; buf[yi,xi,1] += g*a
            buf[yi,xi,2] += b*a; buf[yi,xi,3] += a


def draw_bypass_arc(buf, x1, y1, x2, y2, color, alpha, phase):
    r, g, b = color[0]/255.0, color[1]/255.0, color[2]/255.0
    dx, dy  = x2-x1, y2-y1
    length  = math.hypot(dx, dy)
    if length < 1:
        return
    nx, ny  = -dy/length, dx/length
    steps   = max(3, int(length*1.5))
    for k in range(steps+1):
        frac = k/steps
        wave = math.sin(frac*math.pi*3 + phase) * min(7.0, length*0.10)
        xi   = int(round(x1 + dx*frac + nx*wave))
        yi   = int(round(y1 + dy*frac + ny*wave))
        if 0 <= yi < buf.shape[0] and 0 <= xi < buf.shape[1]:
            a = alpha*0.65
            buf[yi,xi,0] += r*a; buf[yi,xi,1] += g*a
            buf[yi,xi,2] += b*a; buf[yi,xi,3] += a


def buf_to_image(buf: np.ndarray) -> np.ndarray:
    rgb = buf[:,:,:3] / np.maximum(buf[:,:,3:4], 0.001)
    rgb = 1.0 - np.exp(-rgb * 1.9)
    return np.clip(rgb * 255, 0, 255).astype(np.uint8)


# ── Frame renderer ─────────────────────────────────────────────────────────────

GLOW_RADIUS = {0: 28, 1: 18, 2: 13, 3: 9}


def render_frame(
    counts:     np.ndarray,      # particle count per trace, shape (N,)
    traces:     list[tuple],
    pos:        dict[tuple, tuple[float,float]],
    t2i:        dict[tuple, int],
    grad_edges: list[tuple[tuple,tuple]],
    bypass_edges: list[tuple[tuple,tuple]],
    asc:        int,
    desc:       int,
    t_anim:     float,
    discharges: list[tuple[float, tuple, tuple]],  # (t_fire, t_from, t_to)
    W: int,
    H: int,
) -> np.ndarray:

    buf = np.zeros((H, W, 4), dtype=np.float64)

    # Background: radial dark gradient
    cx, cy = W/2.0, H/2.0
    ys = np.arange(H)[:,None]; xs = np.arange(W)[None,:]
    dist = np.sqrt(((xs-cx)/cx)**2 + ((ys-cy)/cy)**2)
    buf[:,:,0] = np.clip(0.06 + 0.02*dist, 0, 0.10)
    buf[:,:,1] = np.clip(0.05 + 0.01*dist, 0, 0.07)
    buf[:,:,2] = np.clip(0.18 + 0.06*dist, 0, 0.26)
    buf[:,:,3] = 1.0

    # Gradient edges
    for (parent, child) in grad_edges:
        m     = child[0]
        base  = MOMENT_EDGE_RGB[m]
        pulse = 0.28 + 0.18 * math.sin(t_anim*2.1 + m*1.1 + hash(child)%9*0.5)
        ec    = tuple(int(c*pulse) for c in base)
        draw_line_aa(buf, *pos[parent], *pos[child], ec, 0.90)  # type: ignore[arg-type]

    # Bypass arcs
    for (ta, tb) in bypass_edges:
        bp    = t_anim*2.8 + hash((ta,tb))%7*0.9
        inten = 0.55 + 0.30*abs(math.sin(bp))
        col   = (int(140*inten), 0, int(200*inten))
        draw_bypass_arc(buf, *pos[ta], *pos[tb], col, 0.85, bp)  # type: ignore[arg-type]

    # Discharge streaks: bright lines from absorbed trace to desc-extended
    for (t_fire, t_from, t_to) in discharges:
        dt = t_anim - t_fire
        if dt < 0 or dt > 0.6:
            continue
        alpha = 1.2 * math.exp(-dt * 5.0)
        if t_from not in pos or t_to not in pos:
            continue
        draw_line_aa(buf, *pos[t_from], *pos[t_to], (255, 255, 200), alpha)

    # Node glows: intensity proportional to particle count
    max_count = max(counts.max(), 1)
    for i, tr in enumerate(traces):
        if tr not in pos:
            continue
        x, y   = pos[tr]
        sig    = zone_sig(asc, desc, tr)
        glow   = nuc_glow(asc, desc, tr)
        base   = ZONE_RGB.get(sig, (80, 80, 80))
        pulse  = t_anim*1.9 + sum(tr)*0.85 + hash(tr)%6*0.5
        bright = 0.55 + 0.25*math.sin(pulse) + 0.15*glow

        if tr == VOID:
            beat   = abs(math.sin(t_anim*2.5))
            bright = 0.75 + 0.25*beat

        color    = tuple(int(c*bright) for c in base)
        density  = (counts[i] / max_count) ** 0.55   # gamma to boost dim nodes
        r_glow   = GLOW_RADIUS.get(len(tr), 8)

        # Outer glow (density-scaled)
        add_glow(buf, x, y, color, r_glow + 4*glow,  # type: ignore[arg-type]
                 intensity=0.45 * density + 0.10)
        # Inner core (always lit, just dimmer when empty)
        add_glow(buf, x, y, color, r_glow * 0.4,     # type: ignore[arg-type]
                 intensity=1.5 * density + 0.20)

    rgb  = buf_to_image(buf)
    img  = Image.fromarray(rgb)
    draw = ImageDraw.Draw(img)

    try:
        font_g = ImageFont.truetype('cour.ttf', 13)
        font_s = ImageFont.truetype('cour.ttf', 14)
    except Exception:
        font_g = font_s = ImageFont.load_default()

    # Node glyphs + dim labels
    for i, tr in enumerate(traces):
        if tr not in pos:
            continue
        x, y  = pos[tr]
        sig   = zone_sig(asc, desc, tr)
        glyph = ZONE_GLYPH.get(sig, '  ')
        base  = ZONE_RGB.get(sig, (80, 80, 80))
        bright = 0.70 + 0.30*(counts[i]/max(counts.max(),1))**0.5
        if tr == VOID:
            bright = 0.90 + 0.10*abs(math.sin(t_anim*2.5))
        color = tuple(min(255, int(c*bright)) for c in base)
        if glyph.strip():
            draw.text((int(x)-7, int(y)-7), glyph, fill=color, font=font_g)
        if len(tr) <= 2:
            label = '()' if tr == VOID else ''.join(NAMES[m] for m in tr)
            lc = tuple(min(255, int(c*0.32)) for c in base)
            draw.text((int(x)-5, int(y)+7), label, fill=lc, font=font_g)

    # Status bar
    try:
        font_bar = ImageFont.truetype('cour.ttf', 15)
    except Exception:
        font_bar = ImageFont.load_default()
    pair = f'{NAMES[asc]} \u2192 {NAMES[desc]}'
    draw.text((16, H-36), f'VOID FLOW   pair: {pair}', fill=(170,170,255), font=font_bar)
    draw.text((16, H-16),
              'particles = traces  \u00b7  transitions = zone predicates  \u00b7  flashes = NuclearDischarge',
              fill=(55,55,90), font=font_bar)

    return np.array(img)


# ── Pair schedule ──────────────────────────────────────────────────────────────

PAIR_SCHEDULE = [
    (0.0,   0, 1),
    (6.0,   1, 2),
    (12.0,  2, 0),
    (18.0,  0, 1),
]


def get_pair(t: float) -> tuple[int, int]:
    for i in range(len(PAIR_SCHEDULE)-1):
        t0, a, d = PAIR_SCHEDULE[i]
        t1, _,_  = PAIR_SCHEDULE[i+1]
        if t0 <= t < t1:
            return a, d
    return PAIR_SCHEDULE[-1][1], PAIR_SCHEDULE[-1][2]


# ── Main ───────────────────────────────────────────────────────────────────────

def main():
    W, H     = 720, 720
    FPS      = 24
    DURATION = 18.0
    FRAMES   = int(DURATION * FPS)
    N_PART   = 4000
    STEPS_PF = 18         # simulation steps per frame
    DISCHARGE_PROB = 0.06  # per step, if absorbed+possible

    traces   = all_traces(MAX_DEPTH)
    N        = len(traces)
    t2i      = {t: i for i, t in enumerate(traces)}

    pos = compute_layout(traces, W, H)

    grad_edges = [(t[1:], t) for t in traces if t and t[1:] in t2i]
    bypass_edges: list[tuple[tuple,tuple]] = []
    seen: set = set()
    for t in traces:
        if len(t) >= 2:
            sw = (t[1],t[0]) + t[2:]
            if sw != t and sw in t2i:
                key = (min(t,sw), max(t,sw))
                if key not in seen:
                    seen.add(key); bypass_edges.append((t, sw))

    # Precompute transition matrices for all 6 (asc,desc) pairs
    print('Precomputing transition matrices ...')
    pairs      = [(a,d) for a in MOMENTS for d in MOMENTS if a!=d]
    trans_mats = {(a,d): build_transition_matrix(a,d,traces,t2i) for a,d in pairs}

    # Particles: array of trace indices
    rng       = np.random.default_rng(42)
    particles = np.zeros(N_PART, dtype=np.int32)   # all start at Void

    # Pre-run 400 steps at first pair
    print('Pre-running 400 steps ...')
    asc0, desc0 = 0, 1
    T_cur = trans_mats[(asc0, desc0)]
    cum   = np.cumsum(T_cur, axis=1)
    for _ in range(400):
        r            = rng.random(N_PART)
        per_p_cum    = cum[particles]
        particles[:] = (per_p_cum < r[:,None]).sum(axis=1).clip(0, N-1)

    # Precompute discharge lookup per pair (vectorized NuclearDischarge check)
    print('Precomputing discharge tables ...')
    absorbed_possible: dict[tuple,np.ndarray] = {}
    discharge_dest:    dict[tuple,np.ndarray] = {}
    for (a, d) in pairs:
        ap = np.array([bool(t and t[0]==a and zone_sig(a,d,t)&8) for t in traces], dtype=bool)
        dd = np.array([t2i.get((d,)+t, -1) for t in traces], dtype=np.int32)
        absorbed_possible[(a,d)] = ap
        discharge_dest[(a,d)]    = dd

    # MP4 writer
    out_path  = pathlib.Path(__file__).parent / 'flow.mp4'
    container = av.open(str(out_path), mode='w')
    stream    = container.add_stream('libx264', rate=FPS)
    stream.width   = W
    stream.height  = H
    stream.pix_fmt = 'yuv420p'
    stream.options = {'crf': '17', 'preset': 'fast'}

    discharges: list[tuple[float,tuple,tuple]] = []
    prev_pair  = (asc0, desc0)
    cum        = np.cumsum(trans_mats[(asc0, desc0)], axis=1)
    ap         = absorbed_possible[(asc0, desc0)]
    dd         = discharge_dest[(asc0, desc0)]

    print(f'Rendering {FRAMES} frames ...')
    for f in range(FRAMES):
        t_anim    = f / FPS
        asc, desc = get_pair(t_anim)

        if (asc, desc) != prev_pair:
            prev_pair = (asc, desc)
            cum = np.cumsum(trans_mats[(asc, desc)], axis=1)
            ap  = absorbed_possible[(asc, desc)]
            dd  = discharge_dest[(asc, desc)]

        # Simulation steps — fully vectorized
        for _ in range(STEPS_PF):
            # NuclearDischarge: vectorized — absorbed+possible particles fire to (desc,)+t
            fire_mask  = ap[particles] & (rng.random(N_PART) < DISCHARGE_PROB)
            fire_mask &= (dd[particles] >= 0)
            if fire_mask.any():
                fire_idx = np.where(fire_mask)[0]
                old_tis  = particles[fire_idx].copy()
                particles[fire_idx] = dd[old_tis]
                for ti in old_tis[:8]:   # record a few events for the visual streak
                    di = int(dd[ti])
                    if di >= 0:
                        discharges.append((t_anim, traces[ti], traces[di]))

            # Zone-driven transitions
            r            = rng.random(N_PART)
            per_p_cum    = cum[particles]
            particles[:] = (per_p_cum < r[:,None]).sum(axis=1).clip(0, N-1)

        # Cull old discharges
        discharges = [(tf,ta,tb) for (tf,ta,tb) in discharges if t_anim - tf < 0.7]

        # Count particles per trace
        counts = np.bincount(particles, minlength=N).astype(np.float32)

        rgb = render_frame(
            counts, traces, pos, t2i,
            grad_edges, bypass_edges,
            asc, desc, t_anim, discharges, W, H,
        )
        frame = av.VideoFrame.from_ndarray(rgb, format='rgb24')
        for pkt in stream.encode(frame):
            container.mux(pkt)

        if (f+1) % FPS == 0 or f == 0:
            top3 = sorted(enumerate(counts), key=lambda x: -x[1])[:3]
            hot  = '  '.join(f'{traces[i]!r}:{int(c)}' for i,c in top3)
            print(f'  frame {f+1:>4}/{FRAMES}  {NAMES[asc]}->{NAMES[desc]}  hot={hot}')

    for pkt in stream.encode():
        container.mux(pkt)
    container.close()

    size_mb = out_path.stat().st_size / 1e6
    print(f'  wrote {out_path}  ({FRAMES} frames  {DURATION:.0f}s  {FPS}fps  {size_mb:.1f}MB)')


if __name__ == '__main__':
    main()
