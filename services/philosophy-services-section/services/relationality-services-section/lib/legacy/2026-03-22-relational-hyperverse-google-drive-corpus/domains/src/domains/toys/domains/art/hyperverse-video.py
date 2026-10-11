"""
The Relational Hyperverse — 60 Second Video
============================================
Same infrastructure as tower-dynamics.py: direct numpy pixel rendering → imageio MP4.
All slow geometry is precomputed; the frame loop does only scalar blends.

Run:
    python src/art/hyperverse-video.py

Output:
    build/art/hyperverse-video.mp4  (~62 s, 700×700, 24 fps)
"""

from pathlib import Path
import numpy as np
import imageio.v3 as iio
from PIL import Image, ImageDraw, ImageFont

BUILD_ART = Path(__file__).parent.parent.parent / "build" / "art"
BUILD_ART.mkdir(parents=True, exist_ok=True)

phi = (1 + np.sqrt(5)) / 2

RES = 700
FPS = 24
SPAN = 7.0

# float (0-1) colour triples
C_BG    = (0.024, 0.031, 0.055)
C_SIG   = (0.05,  0.40,  0.95)
C_DEL   = (0.95,  0.68,  0.05)
C_STAR  = (0.95,  0.92,  0.80)
C_REL   = (0.20,  0.95,  0.80)
C_UNIV  = (0.72,  0.32,  1.00)
C_DM    = (0.60,  0.40,  0.88)
C_DE    = (0.99,  0.54,  0.12)
C_GOLD  = (1.00,  0.84,  0.00)


# ── Coordinate grids ──────────────────────────────────────────────────────────
_px = np.arange(RES, dtype=np.float32)
_PX, _PY = np.meshgrid(_px, _px)   # pixel coords  (Y,X)
x_lin = np.linspace(-SPAN, SPAN, RES)
X_GRID, Y_GRID = np.meshgrid(x_lin, x_lin)


def ease(t):
    t = float(np.clip(t, 0, 1))
    return t * t * (3 - 2 * t)


def ease_ramp(f, s, e):
    if e <= s:
        return 1.0
    return ease((f - s) / (e - s))


def w2p(wx, wy):
    """World → pixel (float)."""
    px = (wx + SPAN) / (2 * SPAN) * RES
    py = (SPAN - wy) / (2 * SPAN) * RES
    return float(px), float(py)


# ── Vignette ──────────────────────────────────────────────────────────────────
_R = np.sqrt(X_GRID ** 2 + Y_GRID ** 2).astype(np.float32)
VIG = (0.04 + 0.96 * np.exp(-0.18 * (_R / SPAN) ** 3)).astype(np.float32)


def blank():
    img = np.empty((RES, RES, 3), dtype=np.float32)
    img[:, :, 0] = C_BG[0]; img[:, :, 1] = C_BG[1]; img[:, :, 2] = C_BG[2]
    return img


def to_u8(img, gamma=0.80):
    return (np.clip(img, 0, 1) ** gamma * 255).astype(np.uint8)


# ── Soft primitives (precomputed once, not per frame) ─────────────────────────

def soft_dot_mask(cx, cy, r):
    """Gaussian blob at pixel (cx,cy), radius r. Returns (RES,RES) float."""
    return np.exp(-((_PX - cx) ** 2 + (_PY - cy) ** 2) / max(r ** 2, 1))


def soft_line_mask(px0, py0, px1, py1, thick=2.5):
    """Soft Gaussian line segment from pixel (px0,py0) to (px1,py1)."""
    dx, dy = px1 - px0, py1 - py0
    L2 = dx * dx + dy * dy + 1e-9
    t = np.clip(((_PX - px0) * dx + (_PY - py0) * dy) / L2, 0, 1)
    cx = px0 + t * dx
    cy = py0 + t * dy
    d2 = (_PX - cx) ** 2 + (_PY - cy) ** 2
    return np.exp(-d2 / (thick ** 2))


def coloured_layer(mask, colour, strength=1.0):
    """Expand a (RES,RES) mask into a (RES,RES,3) float image."""
    img = np.zeros((RES, RES, 3), dtype=np.float32)
    img[:, :, 0] = mask * colour[0] * strength
    img[:, :, 1] = mask * colour[1] * strength
    img[:, :, 2] = mask * colour[2] * strength
    return img


# ── Wave field helper ─────────────────────────────────────────────────────────

def wave_quartet(freq_s, freq_d, n_fold=5, rotation=0.0):
    s_thin = np.zeros((RES, RES), np.float32)
    s_glow = np.zeros_like(s_thin)
    d_thin = np.zeros_like(s_thin)
    d_glow = np.zeros_like(s_thin)
    for i in range(n_fold):
        a = 2 * np.pi * i / n_fold + rotation
        proj = np.cos(a) * X_GRID + np.sin(a) * Y_GRID
        cs = np.cos(2 * np.pi * freq_s * proj)
        cd = np.cos(2 * np.pi * freq_d * proj)
        s_thin += np.exp(-cs ** 2 / 0.009)
        s_glow += np.exp(-cs ** 2 / 0.055)
        d_thin += np.exp(-cd ** 2 / 0.009)
        d_glow += np.exp(-cd ** 2 / 0.055)
    for arr in (s_thin, s_glow, d_thin, d_glow):
        mx = arr.max(); arr /= max(mx, 1e-9)
    jt = (s_thin * d_thin);  jt = (jt / max(jt.max(), 1e-9)) ** 0.4
    jg = (s_glow * d_glow);  jg = (jg / max(jg.max(), 1e-9)) ** 0.35
    return s_thin, d_thin, s_glow, d_glow, jt, jg


def compose(s_t, d_t, s_g, d_g, jt, jg, ws, wd, wj):
    img = blank()
    img[:, :, 0] += ws*(0.03*s_g+0.07*s_t)*C_SIG[0]
    img[:, :, 1] += ws*(0.10*s_g+0.27*s_t)*C_SIG[1]
    img[:, :, 2] += ws*(0.22*s_g+0.55*s_t)*C_SIG[2]
    img[:, :, 0] += wd*(0.30*d_g+0.65*d_t)*C_DEL[0]
    img[:, :, 1] += wd*(0.14*d_g+0.35*d_t)*C_DEL[1]
    img[:, :, 2] += wd*(0.01*d_g+0.04*d_t)*C_DEL[2]
    img[:, :, 0] += wj*(0.65*jg+1.0*jt)*C_STAR[0]
    img[:, :, 1] += wj*(0.55*jg+0.9*jt)*C_STAR[1]
    img[:, :, 2] += wj*(0.38*jg+0.7*jt)*C_STAR[2]
    img *= VIG[:, :, None]
    return img


# ── Precompute all geometry ───────────────────────────────────────────────────
print("Precomputing wave fields…")
ST, DT, SG, DG, JT, JG = wave_quartet(1.0, phi)

TOWER_FIELDS = []
for _lv, _freq in enumerate([1.0, phi, phi**2, phi**3]):
    print(f"  tower level {_lv}…")
    TOWER_FIELDS.append(wave_quartet(_freq, _freq * phi, rotation=_lv * 0.22))

print("Precomputing dark-energy field…")
DE_FIELD = np.zeros((RES, RES), np.float32)
for i in range(5):
    a = 2 * np.pi * i / 5
    DE_FIELD += np.cos(2 * np.pi * phi ** 2 * (np.cos(a)*X_GRID + np.sin(a)*Y_GRID))
DE_FIELD = ((DE_FIELD - DE_FIELD.min()) /
            (DE_FIELD.max() - DE_FIELD.min())).astype(np.float32)

# ── Act 1 geometry: history network ──────────────────────────────────────────
print("Precomputing Act 1 geometry…")
np.random.seed(7)
N_NODES = 13
NODES = np.random.uniform(-5.0, 5.0, (N_NODES, 2))
EDGES = [(0,1),(0,4),(1,3),(1,5),(2,5),(3,6),(4,5),(4,7),
         (5,6),(5,8),(6,9),(7,8),(7,10),(8,11),(9,12)]

# Precompute node glow images (one per node)
NODE_IMGS = []
for nx, ny in NODES:
    px, py = w2p(nx, ny)
    NODE_IMGS.append(coloured_layer(soft_dot_mask(px, py, 8), C_REL, 0.9))

# Precompute edge images (one per edge)
EDGE_IMGS = []
for i, j in EDGES:
    px0, py0 = w2p(*NODES[i])
    px1, py1 = w2p(*NODES[j])
    EDGE_IMGS.append(coloured_layer(soft_line_mask(px0, py0, px1, py1, 1.8),
                                    C_REL, 0.85))

# ── Act 3 geometry: self-generation rings ────────────────────────────────────
print("Precomputing Act 3 geometry…")
RING_COLORS = [C_REL, C_SIG, C_DEL, C_UNIV, C_STAR, C_GOLD]
RING_IMGS = []
for level in range(6):
    ring_r = 0.5 + level * 1.0
    ring_mask = np.zeros((RES, RES), np.float32)
    for k in range(180):
        theta = 2 * np.pi * k / 180
        rpx, rpy = w2p(ring_r * np.cos(theta), ring_r * np.sin(theta))
        ring_mask += soft_dot_mask(rpx, rpy, 3) * (1 / 180)
    RING_IMGS.append(coloured_layer(ring_mask, RING_COLORS[level % 6], 0.55))

SEED_IMGS = []
for i in range(5):
    angle = 2 * np.pi * i / 5
    sx, sy = 2.0 * np.cos(angle), 2.0 * np.sin(angle)
    spx, spy = w2p(sx, sy)
    SEED_IMGS.append(coloured_layer(soft_dot_mask(spx, spy, 10), C_REL, 0.8))

# ── Act 5: DM dots ────────────────────────────────────────────────────────────
print("Precomputing Act 5 dark-matter dots…")
np.random.seed(13)
N_DM = 28
DM_POS = np.random.uniform(-5.0, 5.0, (N_DM, 2))
DM_IMGS = []
for wx, wy in DM_POS:
    px, py = w2p(wx, wy)
    DM_IMGS.append(coloured_layer(soft_dot_mask(px, py, 6), C_DM, 0.7))
DM_ALL = sum(DM_IMGS)  # summed DM field (animated by alpha only)


# ── Text overlay ──────────────────────────────────────────────────────────────
def text_alpha(f, a_start, a_end):
    fi = a_start + 8
    fo = a_end - 8
    return max(0.0, ease_ramp(f, a_start, fi) * (1 - ease_ramp(f, fo, a_end)))


def overlay(frame_u8, lines, f, a_start, a_end):
    """lines: list of (text, y_frac, size, color_rgb_255)"""
    a = text_alpha(f, a_start, a_end)
    if a < 0.02:
        return frame_u8
    pil = Image.fromarray(frame_u8, 'RGB')
    draw = ImageDraw.Draw(pil)
    try:
        font_lg = ImageFont.truetype("arial.ttf", 28)
        font_sm = ImageFont.truetype("arial.ttf", 20)
        font_xs = ImageFont.truetype("arial.ttf", 16)
    except OSError:
        try:
            font_lg = ImageFont.truetype("DejaVuSans.ttf", 28)
            font_sm = ImageFont.truetype("DejaVuSans.ttf", 20)
            font_xs = ImageFont.truetype("DejaVuSans.ttf", 16)
        except OSError:
            font_lg = font_sm = font_xs = ImageFont.load_default()
    size_map = {28: font_lg, 20: font_sm, 16: font_xs}

    for (text, y_frac, sz, col) in lines:
        font = size_map.get(sz, font_sm)
        bbox = draw.textbbox((0, 0), text, font=font)
        tw = bbox[2] - bbox[0]; th = bbox[3] - bbox[1]
        x = (RES - tw) // 2
        y = int(RES * y_frac) - th // 2
        r = int(col[0] * a + C_BG[0]*255*(1-a))
        g = int(col[1] * a + C_BG[1]*255*(1-a))
        b = int(col[2] * a + C_BG[2]*255*(1-a))
        draw.text((x, y), text, font=font, fill=(r, g, b))
    return np.array(pil)


# ── Act text definitions ──────────────────────────────────────────────────────
_G = (255, 214, 0); _S = (220, 230, 250); _D = (80, 100, 120)
_P = (187, 85, 255); _O = (255, 180, 50); _R = (200, 255, 200)
ACT_TEXT = [
    # Act 1
    [("THE RELATIONAL HYPERVERSE",         0.10, 28, _S),
     ("Relations first.  Objects after.",  0.88, 20, _D)],
    # Act 2
    [("THE FIBER NUCLEAR QUARTET",          0.10, 28, _G),
     ("\u03c3\u1d57 \u2218 \u0394\u1d57  =  \u0394\u1d57 \u2218 \u03c3\u1d57     AXIOM",
                                            0.88, 20, _G)],
    # Act 3
    [("SELF-GENERATION",                    0.10, 28, _P),
     ("R  =  U\u0262(R)     least fixed point",
                                            0.88, 20, _P)],
    # Act 4
    [("THE GOLDEN RATIO IS FORCED",         0.10, 28, _G),
     ("\u03bb\u00b2 \u2212 \u03bb \u2212 1 = 0   \u21d2   \u03c6 = (1+\u221a5)/2 \u2248 1.618     not chosen \u2014 forced",
                                            0.88, 16, _G)],
    # Act 5
    [("THE PHYSICS CORRESPONDENCE",         0.10, 28, _S),
     ("H\u209a / H\u2091  =  \u03c6^(1/6)  \u2248  1.0835     0.016\u202f% match  (Planck\u202f+\u202fSH0ES)",
                                            0.88, 16, _O)],
    # Act 6
    [("THE HYPERVERSE TOWER",               0.10, 28, _P),
     ("R \u21aa R\u207d\u00b9\u207e \u21aa R\u207d\u00b2\u207e \u21aa \u22ef \u21aa \u210b  =  U\u1d34(\u210b)",
                                            0.88, 20, _P)],
    # Act 7
    [("The program studying relational universes", 0.40, 28, _S),
     ("is itself a relational universe.",          0.54, 28, _G)],
]


# ── Frame renderers (cheap: scalar blends on precomputed images) ──────────────

def render_act1(f, s, e):
    dur = e - s
    t_n = ease_ramp(f, s, s + dur * 0.33)
    t_ed = ease_ramp(f, s + dur * 0.33, e - 5)
    img = blank()
    for i, ni in enumerate(NODE_IMGS):
        a = ease(min(1.0, t_n * N_NODES / max(i + 0.5, 1)))
        img += a * ni
    n_show = int(t_ed * len(EDGES))
    for k in range(n_show):
        a = ease_ramp(f,
                      s + dur * 0.33 + k * dur / (len(EDGES) * 3),
                      s + dur * 0.33 + (k + 1) * dur / len(EDGES))
        img += a * EDGE_IMGS[k]
    img *= VIG[:, :, None]
    return img


def render_act2(f, s, e):
    dur = e - s
    ws = ease_ramp(f, s, s + dur * 0.35)
    wd = ease_ramp(f, s + dur * 0.35, s + dur * 0.70)
    wj = ease_ramp(f, s + dur * 0.70, e - 5) * 1.3
    return compose(ST, DT, SG, DG, JT, JG, ws, wd, wj)


def render_act3(f, s, e):
    dur = e - s
    img = blank()
    for i, si in enumerate(SEED_IMGS):
        a = ease_ramp(f, s + i * dur / 20, s + i * dur / 15 + dur * 0.2)
        img += a * si
    for level, ri in enumerate(RING_IMGS):
        a = ease_ramp(f, s + level * dur / len(RING_IMGS) * 0.9, e - int(dur*0.08))
        img += a * ri
    img *= VIG[:, :, None]
    return img


def render_act4(f, s, e):
    dur = e - s
    t_f = ease_ramp(f, s, s + dur * 0.45)
    t_t = ease_ramp(f, s + dur * 0.45, e - 5)
    img = compose(ST, DT, SG, DG, JT, JG, t_f, t_f, t_f * 0.8)
    S2, D2, SG2, DG2, JT2, JG2 = TOWER_FIELDS[1]
    img2 = compose(S2, D2, SG2, DG2, JT2, JG2, t_t, t_t, t_t * 1.2)
    return np.clip(img + img2 * 0.55, 0, 1)


def render_act5(f, s, e):
    dur = e - s
    t_dm  = ease_ramp(f, s, s + dur * 0.35)
    t_dis = ease_ramp(f, s + dur * 0.30, s + dur * 0.65)
    t_de  = ease_ramp(f, s + dur * 0.50, e - 3)
    img = blank()
    dm_a = t_dm * (1 - t_dis)
    img += dm_a * DM_ALL
    de_s = t_de * 0.6
    img[:, :, 0] += de_s * DE_FIELD * C_DE[0] * VIG * 0.5
    img[:, :, 1] += de_s * DE_FIELD * C_DE[1] * VIG * 0.25
    img[:, :, 2] += de_s * DE_FIELD * C_DE[2] * VIG * 0.05
    img *= VIG[:, :, None]
    return img


def render_act6(f, s, e):
    dur = e - s
    TCOLS = [C_REL, C_SIG, C_DEL, C_STAR]
    img = blank()
    for level, (fields, cs) in enumerate(zip(TOWER_FIELDS, TCOLS)):
        t = ease_ramp(f, s + level * dur / 5, e - 3)
        S_, D_, SG_, DG_, JT_, JG_ = fields
        img[:, :, 0] += t*(0.03*SG_+0.07*S_)*cs[0]
        img[:, :, 1] += t*(0.08*SG_+0.22*S_)*cs[1]
        img[:, :, 2] += t*(0.20*SG_+0.50*S_)*cs[2]
        img[:, :, 0] += t*(0.60*JG_+1.0*JT_)*C_STAR[0]
        img[:, :, 1] += t*(0.50*JG_+0.9*JT_)*C_STAR[1]
        img[:, :, 2] += t*(0.30*JG_+0.7*JT_)*C_STAR[2]
    img *= VIG[:, :, None]
    return img


def render_act7(f, s, e):
    t = ease_ramp(f, s, e - 3)
    pulse = 0.5 + 0.5 * np.sin(2 * np.pi * (f - s) / 18)
    return compose(ST, DT, SG, DG, JT, JG,
                   t * 0.9, t * 0.9, t * (0.8 + 0.6 * pulse))


RENDERERS = [render_act1, render_act2, render_act3, render_act4,
             render_act5, render_act6, render_act7]

ACT_SECONDS = [(0,9),(9,22),(22,33),(33,44),(44,54),(54,59),(59,62)]


# ── Main ──────────────────────────────────────────────────────────────────────
def main():
    acts = [(int(s*FPS), int(e*FPS)) for s, e in ACT_SECONDS]
    total = acts[-1][1]
    out = str(BUILD_ART / "hyperverse-video.mp4")
    print(f"Rendering {total} frames ({total/FPS:.0f}s at {FPS}fps) -> {out}")

    with iio.imopen(out, "w", plugin="pyav") as writer:
        writer.init_video_stream("libx264", fps=FPS)
        for f in range(total):
            if f % (FPS * 5) == 0:
                print(f"  {f}/{total} ({f/FPS:.0f}s)")
            # find act
            act_i = 0
            for i, (a_s, a_e) in enumerate(acts):
                if a_s <= f < a_e:
                    act_i = i
                    break
            a_s, a_e = acts[act_i]
            img = RENDERERS[act_i](f, a_s, a_e)
            frame = to_u8(img)
            frame = overlay(frame, ACT_TEXT[act_i], f, a_s, a_e)
            writer.write_frame(frame)

    print(f"Saved {out}")
    print(f"  {RES}x{RES}px, {FPS}fps, {total/FPS:.0f}s")


if __name__ == "__main__":
    main()
