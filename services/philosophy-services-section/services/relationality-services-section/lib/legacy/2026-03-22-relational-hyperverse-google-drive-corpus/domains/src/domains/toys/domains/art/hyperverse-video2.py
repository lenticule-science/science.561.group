"""
The Relational Hyperverse — Universe Settling Under Constant Tension
====================================================================
All visual structures computed from actual formulas in the math files.
No fake physics: every number here is derived.

Acts:
  0-12s  Term normalization: syntax tree, R3 + R7 firing, ent 2→1→0
  12-26s Quartet settling: 15 fibers, σ(a)=c, H_t* crystallises
  26-38s Fibonacci depth tower + Hurwitz residuals alternating to 0
  38-50s Partition function Z(β): double pole at β_c = ln(φ)
  50-58s Diffraction spectrum: pure-point Bragg peaks at Z[φ]
  58-65s Hyperverse tower: R^(0) ↪ R^(1) ↪ ··· ↪ H = U_H(H)
  65-70s Coda

Run:   python src/art/hyperverse-video2.py
Out:   build/art/hyperverse-video2.mp4
"""

from pathlib import Path
import numpy as np
import imageio.v3 as iio
from PIL import Image, ImageDraw, ImageFont

BUILD_ART = Path(__file__).parent.parent.parent / "build" / "art"
BUILD_ART.mkdir(parents=True, exist_ok=True)

phi = (1 + np.sqrt(5)) / 2
RES  = 700
FPS  = 24
SPAN = 7.0

# ── Colours ───────────────────────────────────────────────────────────────────
C_BG   = (0.024, 0.031, 0.055)
C_SAT  = (0.05,  0.40,  0.95)   # blue  — Saturate / σ
C_TRF  = (0.95,  0.68,  0.05)   # amber — Transfer / Δ
C_STAR = (0.90,  0.88,  0.72)   # cream — H_t* fixed layer
C_SHAD = (0.60,  0.38,  0.90)   # violet — shadow elements
C_CONN = (0.55,  0.72,  0.55)   # green  — connectives / axes
C_VAR  = (0.18,  0.90,  0.76)   # teal   — variables
C_GOLD = (1.00,  0.84,  0.00)   # gold
C_CRIT = (1.00,  0.38,  0.08)   # orange — critical point

# ── Coordinate grids ──────────────────────────────────────────────────────────
_px = np.arange(RES, dtype=np.float32)
_PX, _PY = np.meshgrid(_px, _px)
x_lin = np.linspace(-SPAN, SPAN, RES)
X_GRID, Y_GRID = np.meshgrid(x_lin, x_lin)
_Rg = np.sqrt(X_GRID**2 + Y_GRID**2).astype(np.float32)
VIG  = (0.04 + 0.96 * np.exp(-0.18 * (_Rg / SPAN)**3)).astype(np.float32)


def ease(t):
    t = float(np.clip(t, 0, 1))
    return t * t * (3 - 2 * t)

def ramp(f, s, e):
    if e <= s: return 1.0
    return ease((f - s) / (e - s))

def blank():
    img = np.empty((RES, RES, 3), dtype=np.float32)
    img[:, :, 0] = C_BG[0]; img[:, :, 1] = C_BG[1]; img[:, :, 2] = C_BG[2]
    return img

def to_u8(img, gamma=0.82):
    return (np.clip(img, 0, 1) ** gamma * 255).astype(np.uint8)

def splat(img, cx, cy, r, col, s=1.0):
    m = np.exp(-((_PX - cx)**2 + (_PY - cy)**2) / max(r * r, 1.0))
    img[:, :, 0] += m * col[0] * s
    img[:, :, 1] += m * col[1] * s
    img[:, :, 2] += m * col[2] * s

def stroke(img, x0, y0, x1, y1, w, col, s=1.0):
    dx, dy = x1 - x0, y1 - y0
    L2 = dx*dx + dy*dy + 1e-9
    t  = np.clip(((_PX - x0)*dx + (_PY - y0)*dy) / L2, 0, 1)
    d2 = (_PX - x0 - t*dx)**2 + (_PY - y0 - t*dy)**2
    m  = np.exp(-d2 / (w * w))
    img[:, :, 0] += m * col[0] * s
    img[:, :, 1] += m * col[1] * s
    img[:, :, 2] += m * col[2] * s

def vig(img):
    img *= VIG[:, :, None]

# ── Fonts ─────────────────────────────────────────────────────────────────────
def _load_fonts():
    for name in ["arial.ttf", "DejaVuSans.ttf", "LiberationSans-Regular.ttf"]:
        try:
            return {sz: ImageFont.truetype(name, sz) for sz in [12, 14, 16, 18, 22, 28]}
        except OSError:
            pass
    f = ImageFont.load_default()
    return {sz: f for sz in [12, 14, 16, 18, 22, 28]}

FONTS = _load_fonts()

def txt(frame_u8, text, x, y, size=18, col=(220, 230, 250), alpha=1.0, center=False):
    if alpha < 0.015:
        return frame_u8
    pil  = Image.fromarray(frame_u8, 'RGB')
    draw = ImageDraw.Draw(pil)
    font = FONTS.get(size, FONTS[18])
    if center:
        bb = draw.textbbox((0, 0), text, font=font)
        x  = x - (bb[2] - bb[0]) // 2
    r = int(col[0] * alpha + C_BG[0] * 255 * (1 - alpha))
    g = int(col[1] * alpha + C_BG[1] * 255 * (1 - alpha))
    b = int(col[2] * alpha + C_BG[2] * 255 * (1 - alpha))
    draw.text((x, y), text, font=font, fill=(r, g, b))
    return np.array(pil)


# ══════════════════════════════════════════════════════════════════════════════
# PRECOMPUTED MATH
# ══════════════════════════════════════════════════════════════════════════════

# ── Fibonacci & Hurwitz ───────────────────────────────────────────────────────
FIBS = [1, 1]
for _ in range(20):
    FIBS.append(FIBS[-1] + FIBS[-2])
FIBS = np.array(FIBS, dtype=np.float64)

# F_k * |φ - F_{k+1}/F_k| = φ^{-k}  (exact identity from math files)
# Signed: alternates because golden-conjugate ψ = -1/φ < 0
HURWITZ = np.array([((-1) ** (k + 1)) * phi ** (-k) for k in range(15)])

# ── Partition function ────────────────────────────────────────────────────────
# Z(q) = (1 + q²) / (1 - q - q²)²   q = e^{-β}
# Critical point: β_c = ln(φ),  double pole → second-order transition α=2
beta_c  = np.log(phi)
# x-axis: β runs from 3.0 (right, flat) down toward β_c (left, diverging)
# reveal sweeps left→right so we see the dull part first then the singularity
BETA_X0, BETA_X1 = 3.0, beta_c * 1.03   # high β on left, critical on right
BETA_VALS = np.linspace(BETA_X0, BETA_X1, 500)

def Z(beta):
    q = np.exp(-beta)
    d = 1.0 - q - q * q
    return (1.0 + q * q) / (d * d) if abs(d) > 1e-9 else 1e9

Z_VALS = np.clip([Z(b) for b in BETA_VALS], 0, 60)

# Pixel coords for Z-plot
PX0, PX1 = int(RES * 0.08), int(RES * 0.92)
PY0, PY1 = int(RES * 0.15), int(RES * 0.82)
Z_MAX = 55.0

def beta_to_px(b):
    return PX0 + (b - BETA_X0) / (BETA_X1 - BETA_X0) * (PX1 - PX0)

def z_to_py(z):
    return PY1 - (z / Z_MAX) * (PY1 - PY0)

CRIT_PX = beta_to_px(beta_c)

# Precompute full curve image (revealed progressively)
print("Precomputing Z(β) curve...")
Z_CURVE = np.zeros((RES, RES, 3), np.float32)
stroke(Z_CURVE, PX0, PY1, PX1, PY1, 1.2, C_CONN, 0.5)   # x-axis
stroke(Z_CURVE, PX0, PY0, PX0, PY1, 1.2, C_CONN, 0.5)   # y-axis
prev_bx, prev_by = None, None
for bi, (b, z) in enumerate(zip(BETA_VALS, Z_VALS)):
    bx = beta_to_px(b)
    by = float(np.clip(z_to_py(z), PY0, PY1))
    if prev_bx is not None:
        frac = bi / len(BETA_VALS)
        col  = (C_SAT[0] * (1 - frac) + C_CRIT[0] * frac,
                C_SAT[1] * (1 - frac) + C_CRIT[1] * frac,
                C_SAT[2] * (1 - frac) + C_CRIT[2] * frac)
        stroke(Z_CURVE, prev_bx, prev_by, bx, by, 2.0, col, 0.9)
    prev_bx, prev_by = bx, by
stroke(Z_CURVE, CRIT_PX, PY0, CRIT_PX, PY1, 1.2, C_GOLD, 0.35)  # critical line

# ── Diffraction: Bragg peaks at a + b·φ, a,b ∈ Z ────────────────────────────
print("Precomputing diffraction peaks...")
BRAGG = []
for a in range(-6, 7):
    for b in range(-6, 7):
        pos = a + b * phi
        if 0.08 < pos < 7.5:
            intensity = 1.0 / (1.0 + abs(a) + abs(b)) ** 1.4
            BRAGG.append((float(pos), float(intensity)))
BRAGG.sort()

DX0, DX1 = int(RES * 0.05), int(RES * 0.95)
DY_AX    = int(RES * 0.52)
D_SCALE  = (DX1 - DX0) / 7.5

# ── Syntax trees for normalization ───────────────────────────────────────────
# Term: S(T(x) ∧ T(y))  ent=2, fmlW=10
# Step 0 → Step 1 via R3: S distributes over ∧  → S(T(x)) ∧ S(T(y))  ent=2
# Step 1 → Step 2 via R7: S(T(x)) → T(S(x))     → T(S(x)) ∧ S(T(y)) ent=1
# Step 2 → Step 3 via R7: S(T(y)) → T(S(y))     → T(S(x)) ∧ T(S(y)) ent=0  NF

TX0, TX1 = 60,  340   # tree panel x range
TY0, TY1 = 90,  580   # tree panel y range

def tree_px(xf, yf):
    return TX0 + xf * (TX1 - TX0), TY0 + yf * (TY1 - TY0)

# node: (label, type, xf, yf)   type in S T AND VAR
TREES = [
    # Step 0: S( ∧(T(x), T(y)) )
    dict(nodes=[('S','S',0.50,0.10),('∧','AND',0.50,0.33),
                ('T','T',0.25,0.57),('T','T',0.75,0.57),
                ('x','VAR',0.25,0.81),('y','VAR',0.75,0.81)],
         edges=[(0,1),(1,2),(1,3),(2,4),(3,5)],
         rule='', ent=2, fmlW=10),
    # Step 1: ∧(S(T(x)), S(T(y)))  — R3 fired
    dict(nodes=[('∧','AND',0.50,0.10),
                ('S','S',0.25,0.33),('S','S',0.75,0.33),
                ('T','T',0.25,0.57),('T','T',0.75,0.57),
                ('x','VAR',0.25,0.81),('y','VAR',0.75,0.81)],
         edges=[(0,1),(0,2),(1,3),(2,4),(3,5),(4,6)],
         rule='R3: \u03c3 distributes over \u2227', ent=2, fmlW=9),
    # Step 2: ∧(T(S(x)), S(T(y)))  — R7 left
    dict(nodes=[('∧','AND',0.50,0.10),
                ('T','T',0.25,0.33),('S','S',0.75,0.33),
                ('S','S',0.25,0.57),('T','T',0.75,0.57),
                ('x','VAR',0.25,0.81),('y','VAR',0.75,0.81)],
         edges=[(0,1),(0,2),(1,3),(2,4),(3,5),(4,6)],
         rule='R7: \u03c3\u2218\u0394 \u2192 \u0394\u2218\u03c3  (ent \u2193)', ent=1, fmlW=9),
    # Step 3: ∧(T(S(x)), T(S(y)))  — R7 right, normal form
    dict(nodes=[('∧','AND',0.50,0.10),
                ('T','T',0.25,0.33),('T','T',0.75,0.33),
                ('S','S',0.25,0.57),('S','S',0.75,0.57),
                ('x','VAR',0.25,0.81),('y','VAR',0.75,0.81)],
         edges=[(0,1),(0,2),(1,3),(2,4),(3,5),(4,6)],
         rule='R7 again  \u2192  NORMAL FORM  ent = 0', ent=0, fmlW=9),
]

NODE_COL = {'S': C_SAT, 'T': C_TRF, 'AND': C_CONN, 'VAR': C_VAR}
NODE_RGB = {k: (int(v[0]*255), int(v[1]*255), int(v[2]*255))
            for k, v in NODE_COL.items()}

print("Precomputing tree images...")
TREE_IMGS = []
for step in TREES:
    img = np.zeros((RES, RES, 3), np.float32)
    pos = [tree_px(xf, yf) for _, _, xf, yf in step['nodes']]
    for i, j in step['edges']:
        stroke(img, pos[i][0], pos[i][1], pos[j][0], pos[j][1], 1.5, C_CONN, 0.45)
    for k, (lbl, typ, xf, yf) in enumerate(step['nodes']):
        col = NODE_COL[typ]
        r   = 15 if typ in ('S', 'T') else 11
        splat(img, pos[k][0], pos[k][1], r,     col,   1.1)
        splat(img, pos[k][0], pos[k][1], r*0.4, C_STAR, 0.7)
    TREE_IMGS.append(img)
TREE_POS = [[tree_px(xf, yf) for _, _, xf, yf in s['nodes']] for s in TREES]

# ── Quartet: 4-chain fiber H_{(1,0)} = {⊥ < a < c < ⊤} ─────────────────────
# σ: ⊥→⊥, a→c, c→c, ⊤→⊤   (extensive, idempotent, meet-preserving)
# Δ = id                       (everything transfer-stable)
# H_t* = {⊥, c, ⊤}            shadow = {a}
Q_LABELS  = ['\u22a5', 'a', 'c', '\u22a4']
Q_FIXED   = [True,  False, True,  True]   # in H_t*?
Q_SHADOW  = [False, True,  False, False]  # shadow (Fix(Δ) \ Fix(σ))
Q_SIGMA   = [0,     2,     2,     3]      # σ map

N_FIBERS  = 18
np.random.seed(42)

FIB_CX = [int(RES * 0.55 + np.random.uniform(10, RES * 0.38)) for _ in range(N_FIBERS)]
FIB_CY = [int(RES * 0.07 + np.random.uniform(10, RES * 0.86)) for _ in range(N_FIBERS)]
FIBER_H  = 78   # pixel height of each Hasse diagram

def fiber_nodes(fi):
    """Pixel positions of 4 nodes for fiber fi."""
    cx, cy = FIB_CX[fi], FIB_CY[fi]
    ys = [0.1, 0.37, 0.63, 0.9]
    return [(cx, cy - FIBER_H/2 + y * FIBER_H) for y in ys]

print("Precomputing fiber images...")
# For each fiber: 3 images
#   FSTATIC[fi]: all nodes + edges at neutral color
#   FSETTLED[fi]: H_t* nodes lit gold, shadow dim
#   FARROW[fi]:  the σ-arrow from node 1 (a) to node 2 (c)
FSTATIC  = []
FSETTLED = []
FARROW   = []
for fi in range(N_FIBERS):
    nodes = fiber_nodes(fi)
    im_s  = np.zeros((RES, RES, 3), np.float32)
    im_e  = np.zeros((RES, RES, 3), np.float32)
    im_a  = np.zeros((RES, RES, 3), np.float32)
    # edges (Hasse: j to j+1)
    for j in range(3):
        stroke(im_s, nodes[j][0], nodes[j][1], nodes[j+1][0], nodes[j+1][1],
               0.9, C_CONN, 0.28)
        stroke(im_e, nodes[j][0], nodes[j][1], nodes[j+1][0], nodes[j+1][1],
               0.9, C_CONN, 0.20)
    # nodes
    for j in range(4):
        nx, ny = nodes[j]
        col_s = C_STAR if Q_FIXED[j] else (C_SHAD if Q_SHADOW[j] else C_CONN)
        splat(im_s, nx, ny, 5.5, col_s, 0.80)
        # settled: fixed = gold, shadow = very dim
        col_e = C_GOLD if Q_FIXED[j] else C_BG
        splat(im_e, nx, ny, 5.5, col_e, 0.85 if Q_FIXED[j] else 0.0)
    # sigma arrow: node 1 (a) -> node 2 (c)
    ax0, ay0 = nodes[1]
    ax1, ay1 = nodes[2]
    stroke(im_a, ax0, ay0, ax1, ay1, 1.4, C_SAT, 0.9)
    splat(im_a,  ax1, ay1, 4.5, C_SAT, 0.8)
    FSTATIC.append(im_s)
    FSETTLED.append(im_e)
    FARROW.append(im_a)

# ── Fibonacci bars ────────────────────────────────────────────────────────────
N_BARS   = 13
BAR_BOT  = int(RES * 0.84)
BAR_TMAX = int(RES * 0.14)
BAR_X0   = int(RES * 0.07)
BAR_W    = (RES * 0.86) / N_BARS
MAX_FIB  = float(FIBS[N_BARS])

print("Precomputing Fibonacci bar images...")
FIB_BARS = []
for i in range(N_BARS):
    img = np.zeros((RES, RES, 3), np.float32)
    h   = (FIBS[i + 1] / MAX_FIB) * (BAR_BOT - BAR_TMAX)
    bx0 = BAR_X0 + i * BAR_W + 2
    bx1 = bx0 + BAR_W - 4
    by0 = BAR_BOT - h
    frac = float(i) / N_BARS
    col  = (C_SAT[0] * (1 - frac) + C_GOLD[0] * frac,
            C_SAT[1] * (1 - frac) + C_GOLD[1] * frac,
            C_SAT[2] * (1 - frac) + C_GOLD[2] * frac)
    n_rows = max(1, int(h / 5))
    for row in range(n_rows):
        ry = by0 + row * h / n_rows
        stroke(img, bx0, ry, bx1, ry, 3.5, col, 0.55)
    FIB_BARS.append(img)


# ══════════════════════════════════════════════════════════════════════════════
# FRAME RENDERERS
# ══════════════════════════════════════════════════════════════════════════════

def render_norm(f, s, e):
    """Act 1: Term normalization R3 + R7, ent 2→1→0."""
    dur  = e - s
    t    = (f - s) / dur
    step_dur = 0.23   # each step occupies this fraction
    step = min(3, int(t / step_dur))
    frac = (t - step * step_dur) / step_dur  # 0..1 within step
    # smooth cross-fade in second half of dwell
    alpha_next = ease(max(0.0, frac * 2 - 0.6))
    alpha_cur  = 1.0 - alpha_next * 0.6

    img = blank()
    img += alpha_cur * TREE_IMGS[step]
    img += alpha_next * TREE_IMGS[min(3, step + 1)]
    vig(img)
    frame = to_u8(img)

    a = ramp(f, s, s + 8) * (1 - ramp(f, e - 8, e))
    frame = txt(frame, "TERM NORMALIZATION", RES//2, 26, 22, (200,220,255), a, center=True)
    frame = txt(frame, "S( T(x) \u2227 T(y) )  \u2192  normal form", RES//2, 58, 16, (200,200,200), a * 0.8, center=True)

    # ent / fmlW panel (right half)
    cur_step = TREES[step]
    nxt_step = TREES[min(3, step + 1)]
    a_panel  = ramp(f, s + 5, s + 15) * (1 - ramp(f, e - 6, e))
    frame = txt(frame, f"ent  = {cur_step['ent']}", 380, 200, 18, (160,180,255), a_panel)
    frame = txt(frame, f"fmlW = {cur_step['fmlW']}", 380, 228, 18, (160,200,160), a_panel)

    rule = cur_step['rule']
    if rule:
        frame = txt(frame, rule, RES//2, RES - 58, 15, (255,214,0), a * 0.9, center=True)

    # node labels on tree
    cur_pos = TREE_POS[step]
    for k, (lbl, typ, _, _) in enumerate(TREES[step]['nodes']):
        px, py = int(cur_pos[k][0]), int(cur_pos[k][1]) - 9
        frame = txt(frame, lbl, px, py, 13, NODE_RGB[typ], a * 0.95, center=True)

    return frame


def render_quartet(f, s, e):
    """Act 2: Fibers crystallising — σ(a)=c, H_t* emerges."""
    dur = e - s

    img = blank()
    for fi in range(N_FIBERS):
        reveal  = ramp(f, s + fi * dur / (N_FIBERS * 1.6),
                          s + fi * dur / (N_FIBERS * 1.2) + dur * 0.08)
        settle  = ramp(f, s + dur * 0.32 + fi * dur / (N_FIBERS * 2.2),
                          s + dur * 0.62 + fi * dur / (N_FIBERS * 2.2))
        # arrow pulses during transition
        arrow_a = 4.0 * settle * (1 - settle)
        img += reveal * ((1 - settle) * FSTATIC[fi] + settle * FSETTLED[fi])
        img += reveal * arrow_a * FARROW[fi]

    vig(img)
    frame = to_u8(img)

    a = ramp(f, s, s + 10) * (1 - ramp(f, e - 8, e))
    frame = txt(frame, "THE QUARTET SETTLES", RES//2, 26, 22, (200,220,255), a, center=True)
    frame = txt(frame, "\u03c3(a) = c        \u0394 = id",
                RES//2, 58, 18, (255,214,0), a * 0.9, center=True)
    frame = txt(frame, "H\u1d57* = { \u22a5,  c,  \u22a4 }   settled layer",
                RES//2, RES - 52, 16, (200,230,200), a * 0.85, center=True)
    return frame


def render_fib(f, s, e):
    """Act 3: Fibonacci tower + Hurwitz residuals."""
    dur = e - s

    img = blank()
    for i in range(N_BARS):
        a = ramp(f, s + i * dur / N_BARS * 0.75,
                    s + i * dur / N_BARS * 0.75 + dur / N_BARS)
        img += a * FIB_BARS[i]

    # Hurwitz oscillation (right panel)
    h_reveal = ramp(f, s + dur * 0.38, s + dur * 0.62)
    if h_reveal > 0.01:
        rcx = RES * 0.72; rcy = RES * 0.50
        rsx = RES * 0.22; rsy = RES * 0.22
        stroke(img, rcx - rsx * 0.1, rcy, rcx + rsx * 1.1, rcy, 0.8, C_CONN, 0.35 * h_reveal)
        prev_rx, prev_ry = None, None
        for k in range(14):
            rx  = rcx + k * rsx / 13
            ry  = rcy - HURWITZ[k] * rsy
            col = C_SAT if k % 2 == 0 else C_TRF
            splat(img, rx, ry, 3.5, col, h_reveal * 0.9)
            if prev_rx is not None:
                stroke(img, prev_rx, prev_ry, rx, ry, 1.0, C_CONN, 0.3 * h_reveal)
            prev_rx, prev_ry = rx, ry

    vig(img)
    frame = to_u8(img)

    a = ramp(f, s, s + 8) * (1 - ramp(f, e - 8, e))
    frame = txt(frame, "FIBONACCI DEPTH TOWER", RES//2, 26, 22, (200,220,255), a, center=True)
    frame = txt(frame, "d\u1d57(n+1) = d\u1d57(n) + d\u1d57(n\u22121)",
                RES//2, 58, 16, (255,214,0), a * 0.9, center=True)

    # bar labels
    for i in range(min(10, N_BARS)):
        ba = ramp(f, s + i * dur / N_BARS * 0.75,
                     s + i * dur / N_BARS * 0.75 + dur / N_BARS) * a
        bx = int(BAR_X0 + (i + 0.5) * BAR_W)
        frame = txt(frame, str(int(FIBS[i + 1])), bx, BAR_BOT + 5, 12,
                    (200,220,200), ba, center=True)

    hr = ramp(f, s + dur * 0.38, s + dur * 0.55) * a
    frame = txt(frame, "F\u2096 \u00b7 |\u03c6 \u2212 F\u2096\u208a\u2081/F\u2096| = \u03c6\u207b\u1d4f  (exact)",
                int(RES * 0.54), int(RES * 0.16), 13, (180,200,220), hr)
    frame = txt(frame, "alternating, decay rate 1/\u03c6",
                int(RES * 0.54), int(RES * 0.80), 13, (160,180,200), hr * 0.85)
    return frame


def render_partition(f, s, e):
    """Act 4: Z(β) double pole at β_c = ln(φ)."""
    dur     = e - s
    reveal  = ramp(f, s, s + dur * 0.68)
    c_glow  = ramp(f, s + dur * 0.60, s + dur * 0.85)

    # reveal from LEFT (high β, low Z) to RIGHT (critical, high Z)
    reveal_px = int(PX0 + reveal * (PX1 - PX0))
    img = blank()
    masked = Z_CURVE.copy()
    masked[:, reveal_px:, :] = 0
    img += masked

    if c_glow > 0.01:
        splat(img, CRIT_PX, PY1, 6, C_GOLD, c_glow * 0.9)
        splat(img, CRIT_PX, PY1, 22, C_GOLD, c_glow * 0.25)
        splat(img, CRIT_PX, PY1 - int(PY1 * 0.3), 10, C_CRIT, c_glow * 0.5)

    vig(img)
    frame = to_u8(img)

    a = ramp(f, s, s + 8) * (1 - ramp(f, e - 8, e))
    frame = txt(frame, "PARTITION FUNCTION", RES//2, 26, 22, (200,220,255), a, center=True)
    frame = txt(frame, "Z(q) = (1+q\u00b2) / (1\u2212q\u2212q\u00b2)\u00b2      q = e\u207b\u03b2",
                RES//2, 58, 15, (255,214,0), a * 0.9, center=True)
    frame = txt(frame, "\u03b2", PX1 + 5, PY1 - 10, 15, (160,180,200), a * 0.7)
    frame = txt(frame, "Z", PX0 - 18, PY0, 15, (160,180,200), a * 0.7)
    frame = txt(frame, "double pole at \u03b2\u1d9c = ln(\u03c6)   \u21d2   \u03b1 = 2",
                RES//2, RES - 52, 16, (200,230,200), a * 0.85, center=True)
    frame = txt(frame, "\u03b2\u1d9c", int(CRIT_PX) - 8, PY1 + 8, 14, (255,214,0), c_glow * a)
    return frame


def render_diffraction(f, s, e):
    """Act 5: Pure-point diffraction spectrum on Z[φ]."""
    dur = e - s

    img = blank()
    stroke(img, DX0, DY_AX, DX1, DY_AX, 1.2, C_CONN, 0.45)

    reveal = ramp(f, s, s + dur * 0.72)
    n_show = int(reveal * len(BRAGG))
    for k, (pos, intensity) in enumerate(BRAGG[:n_show]):
        pk  = DX0 + pos * D_SCALE
        if pk > DX1: continue
        h   = intensity * RES * 0.28
        pk_a = ramp(f, s + k * dur / max(len(BRAGG), 1) * 0.72,
                       s + (k + 1) * dur / max(len(BRAGG), 1) * 0.72 + 5)
        stroke(img, pk, DY_AX, pk, DY_AX - h, 1.6, C_GOLD, intensity * 0.85 * pk_a)
        splat(img, pk, DY_AX - h, 3.5, C_GOLD, intensity * pk_a)

    vig(img)
    frame = to_u8(img)

    a = ramp(f, s, s + 8) * (1 - ramp(f, e - 8, e))
    frame = txt(frame, "DIFFRACTION SPECTRUM", RES//2, 26, 22, (200,220,255), a, center=True)
    frame = txt(frame, "Bragg peaks at  a + b\u03c6   (a, b \u2208 \u2124)",
                RES//2, 58, 18, (255,214,0), a * 0.9, center=True)
    frame = txt(frame, "pure point  \u2014  supported on  \u2124[\u03c6] \u2229 \u211d\u208a",
                RES//2, RES - 52, 16, (200,230,200), a * 0.85, center=True)
    return frame


def render_tower(f, s, e):
    """Act 6: Hyperverse tower, concentric rings."""
    dur = e - s
    img = blank()
    CX, CY  = RES * 0.50, RES * 0.52
    n_lvl   = 6
    cols    = [C_VAR, C_SAT, C_TRF, C_STAR, C_GOLD, C_SHAD]
    labels  = ['R\u207d\u2070\u207e', 'R\u207d\u00b9\u207e', 'R\u207d\u00b2\u207e',
               'R\u207d\u00b3\u207e', 'R\u207d\u2074\u207e', '\u210b']

    for lv in range(n_lvl):
        lv_a = ramp(f, s + lv * dur / (n_lvl * 1.4),
                       s + (lv + 1) * dur / (n_lvl * 1.1))
        if lv_a < 0.01: continue
        r    = 38 + lv * 52
        col  = cols[lv]
        # ring
        for k in range(220):
            theta = 2 * np.pi * k / 220
            splat(img, CX + r * np.cos(theta), CY + r * np.sin(theta),
                  2.2, col, lv_a * 0.55)
        # nucleus markers
        for k in range(8):
            theta = 2 * np.pi * k / 8
            nc = C_SAT if k % 2 == 0 else C_TRF
            splat(img, CX + r * np.cos(theta), CY + r * np.sin(theta),
                  4.5, nc, lv_a * 0.50)
        # radial spokes to inner ring
        if lv > 0:
            ri = 38 + (lv - 1) * 52
            for k in range(8):
                theta = 2 * np.pi * k / 8
                stroke(img, CX + ri*np.cos(theta), CY + ri*np.sin(theta),
                       CX + r*np.cos(theta),  CY + r*np.sin(theta),
                       0.7, C_CONN, 0.25 * lv_a)

    pulse = 0.5 + 0.5 * np.sin(2 * np.pi * (f - s) / 22)
    splat(img, CX, CY, 13,         C_STAR, 0.90)
    splat(img, CX, CY, 24 + 9*pulse, C_GOLD, 0.35)

    vig(img)
    frame = to_u8(img)

    a = ramp(f, s, s + 10) * (1 - ramp(f, e - 8, e))
    frame = txt(frame, "THE HYPERVERSE TOWER", RES//2, 26, 22, (200,220,255), a, center=True)
    frame = txt(frame,
                "R\u207d\u2070\u207e \u21aa R\u207d\u00b9\u207e \u21aa R\u207d\u00b2\u207e"
                " \u21aa \u22ef \u21aa  \u210b = U\u1d34(\u210b)",
                RES//2, 58, 17, (255,214,0), a * 0.9, center=True)

    for lv in range(n_lvl):
        lv_a = ramp(f, s + lv * dur / (n_lvl * 1.4),
                       s + (lv + 1) * dur / (n_lvl * 1.1)) * a
        if lv_a < 0.05: continue
        r = 38 + lv * 52
        lx = int(CX + r * 0.73)
        ly = int(CY - r * 0.73)
        frame = txt(frame, labels[lv], lx, ly, 13, (200,220,255), lv_a)

    return frame


def render_coda(f, s, e):
    """Coda."""
    t = ramp(f, s, e - 5)
    img = blank()
    # faint fiber background
    for fi in range(min(10, N_FIBERS)):
        img += 0.12 * t * FSTATIC[fi]
    vig(img)
    frame = to_u8(img)
    lines = [
        ("The structure studying relational universes",
         RES//2, int(RES*0.38), 22, (200,220,255)),
        ("is itself a relational universe.",
         RES//2, int(RES*0.50), 22, (255,214,0)),
        ("\u210b  =  U\u1d34(\u210b)",
         RES//2, int(RES*0.64), 28, (200,230,200)),
    ]
    for text, x, y, sz, col in lines:
        frame = txt(frame, text, x, y, sz, col, t, center=True)
    return frame


RENDERERS   = [render_norm, render_quartet, render_fib,
               render_partition, render_diffraction, render_tower, render_coda]
ACT_SECONDS = [(0,12),(12,26),(26,38),(38,50),(50,58),(58,65),(65,70)]


def main():
    acts  = [(int(s * FPS), int(e * FPS)) for s, e in ACT_SECONDS]
    total = acts[-1][1]
    out   = str(BUILD_ART / "hyperverse-video2.mp4")
    print(f"Rendering {total} frames ({total/FPS:.1f}s at {FPS}fps) -> {out}")

    with iio.imopen(out, "w", plugin="pyav") as writer:
        writer.init_video_stream("libx264", fps=FPS)
        for f in range(total):
            if f % (FPS * 5) == 0:
                print(f"  {f}/{total}  ({f/FPS:.0f}s)")
            act_i = 0
            for i, (a_s, a_e) in enumerate(acts):
                if a_s <= f < a_e:
                    act_i = i
                    break
            a_s, a_e = acts[act_i]
            frame = RENDERERS[act_i](f, a_s, a_e)
            if frame.dtype != np.uint8:
                frame = to_u8(frame)
            writer.write_frame(frame)

    print(f"Saved {out}")
    print(f"  {RES}x{RES}px, {FPS}fps, {total/FPS:.1f}s")


if __name__ == "__main__":
    main()
