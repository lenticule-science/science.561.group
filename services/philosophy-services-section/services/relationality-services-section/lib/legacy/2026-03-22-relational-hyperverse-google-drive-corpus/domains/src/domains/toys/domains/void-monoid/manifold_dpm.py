#!/usr/bin/env python3
"""
manifold_dpm.py

3D spatiotemporal manifold of the Directional Preordered Monoid.

Grade n  →  ring of 3^n histories at height z = n * Z_SCALE.
Bypass edges  →  chords within each ring.
Prepend edges →  tendrils from grade n up to grade n+1.
Camera spirals slowly around the tower as grades materialise.

Output:  frames_manifold/  (PNG)
         grow_manifold.gif  (Pillow, always)
         grow_manifold.mp4  (ffmpeg if found)
"""

import sys, os, shutil, subprocess, math
sys.path.insert(0, os.path.dirname(__file__))

from pewpew import (make_dpm, all_histories, bypass_at,
                    possible_settled, necessary_settled, void)

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D          # noqa: F401 (registers projection)
from mpl_toolkits.mplot3d.art3d import Line3DCollection
import numpy as np
from collections import defaultdict

# ── DPM ──────────────────────────────────────────────────────────────────────
_bypass_pairs = {("a", "b"), ("b", "c")}
GEN = ["a", "b", "c"]
BYP = lambda x, y: (x, y) in _bypass_pairs


def cat(h):
    ps = possible_settled(h, BYP)
    ns = necessary_settled(h, GEN, BYP)
    return "DS" if ps and ns else "PS" if ps else "NS" if ns else "UN"


# RGBA  — we multiply alpha per-use
BASE_C = {
    "DS": np.array([0.78, 0.42, 0.87]),   # purple
    "PS": np.array([0.60, 0.90, 0.30]),   # bright green
    "NS": np.array([0.30, 0.75, 0.95]),   # sky blue
    "UN": np.array([0.95, 0.38, 0.42]),   # coral red
}
BG = np.array([0.07, 0.08, 0.12])        # almost-black navy

# ── layout ────────────────────────────────────────────────────────────────────
Z_SCALE = 1.6          # vertical spacing between grade planes
R_BASE  = 0.7          # ring radius scale
R_GROW  = 0.55         # extra radius per grade so rings widen slowly


def ring_z(n):
    return n * Z_SCALE


def ring_r(n):
    return R_BASE + n * R_GROW


def lex_rank(histories):
    """lex-sorted rank dict."""
    return {h: i for i, h in enumerate(sorted(histories))}


def grade_positions(n, histories):
    """(x, y, z) for each history on the grade-n ring."""
    total = len(histories)
    rank  = lex_rank(histories)
    r     = ring_r(n)
    z     = ring_z(n)
    pos   = {}
    for h in histories:
        if total == 1:
            theta = 0.0
        else:
            theta = 2 * math.pi * rank[h] / total
        pos[h] = np.array([r * math.cos(theta), r * math.sin(theta), z])
    return pos


# ── precompute all grade data ─────────────────────────────────────────────────
def precompute(max_n):
    data = []
    print("precomputing…")
    for n in range(max_n + 1):
        print(f"  grade {n}", flush=True)
        histories = all_histories(n, GEN)
        pos       = grade_positions(n, histories)

        bypass_edges = []
        for h in histories:
            for i in range(len(h) - 1):
                st, h2 = bypass_at(h, i, BYP)
                if st == "fired":
                    bypass_edges.append((h, h2))

        data.append({
            "n":             n,
            "histories":     histories,
            "pos":           pos,
            "bypass_edges":  bypass_edges,
        })
    return data


# ── drawing helpers ───────────────────────────────────────────────────────────
def _fade(rgb, alpha):
    return (*rgb, alpha)


def draw_grade(ax, d, alpha_node, alpha_edge, alpha_ring, glow=False):
    """Render one grade's ring, nodes, bypass chords."""
    n         = d["n"]
    histories = d["histories"]
    pos       = d["pos"]
    edges     = d["bypass_edges"]

    # ── ring outline ──────────────────────────────────────────────────────────
    r = ring_r(n)
    z = ring_z(n)
    theta = np.linspace(0, 2 * math.pi, 200)
    ax.plot(r * np.cos(theta), r * np.sin(theta),
            np.full_like(theta, z),
            color=(*BG * 1.8, alpha_ring), lw=0.6, zorder=1)

    # ── bypass edges (chords) ─────────────────────────────────────────────────
    if edges:
        segs   = []
        colors = []
        for h, h2 in edges:
            p1, p2 = pos[h], pos[h2]
            segs.append([p1, p2])
            colors.append(_fade(BASE_C[cat(h)], alpha_edge))
        lc = Line3DCollection(segs, colors=colors, linewidths=0.55, zorder=2)
        ax.add_collection3d(lc)

    # ── glow (wider, lower-alpha scatter behind nodes) ────────────────────────
    if glow and histories:
        xs = [pos[h][0] for h in histories]
        ys = [pos[h][1] for h in histories]
        zs = [pos[h][2] for h in histories]
        gc = [_fade(BASE_C[cat(h)], alpha_node * 0.25) for h in histories]
        sz = max(6, 320 / len(histories) ** 0.35)
        ax.scatter(xs, ys, zs, c=gc, s=sz * 4, zorder=3,
                   depthshade=False, edgecolors="none")

    # ── nodes ─────────────────────────────────────────────────────────────────
    if histories:
        xs = [pos[h][0] for h in histories]
        ys = [pos[h][1] for h in histories]
        zs = [pos[h][2] for h in histories]
        nc = [_fade(BASE_C[cat(h)], alpha_node) for h in histories]
        sz = max(4, 180 / len(histories) ** 0.35)
        ax.scatter(xs, ys, zs, c=nc, s=sz, zorder=4,
                   depthshade=False, edgecolors="none")


def draw_tendrils(ax, d_below, d_above, alpha):
    """Thin lines from grade n up to grade n+1 via prepend."""
    if alpha < 0.01:
        return
    segs   = []
    colors = []
    pos_n  = d_below["pos"]
    pos_n1 = d_above["pos"]
    for h in d_below["histories"]:
        for g in GEN:
            child = (g,) + h
            if child in pos_n1:
                segs.append([pos_n[h], pos_n1[child]])
                # colour from the child's category (the "future")
                colors.append(_fade(BASE_C[cat(child)], alpha))
    if segs:
        lc = Line3DCollection(segs, colors=colors, linewidths=0.3, zorder=1)
        ax.add_collection3d(lc)


# ── camera path ───────────────────────────────────────────────────────────────
def camera_at(t):
    """
    t in [0,1] over the full video.
    Growth phase (t<0.60): elevation 60→12 (god's-eye → side),  slow rotation.
    Orbit phase  (t≥0.60): dramatic swoop — dips to 5°, climbs to 55°, full 540°.
    """
    rot_speed = 360 * 1.8
    azim = (t * rot_speed) % 360

    if t < 0.60:
        elev = 60 - 50 * (t / 0.60)            # 60 → 10
    else:
        s    = (t - 0.60) / 0.40
        # swoops down to near-ground then back up
        elev = 10 + 45 * math.sin(s * math.pi)

    return elev, azim


# ── annotation overlay ────────────────────────────────────────────────────────
def add_overlay(fig, max_n_shown, all_data):
    ax2 = fig.add_axes([0.01, 0.62, 0.14, 0.34], facecolor=(0,0,0,0))
    ax2.set_xlim(0, 1); ax2.set_ylim(0, 1); ax2.axis("off")

    from matplotlib.patches import Patch
    lines = [
        Patch(facecolor=(*BASE_C["DS"], 1), label="DS = n+1",      edgecolor="none"),
        Patch(facecolor=(*BASE_C["NS"], 1), label="NS = 2^n",       edgecolor="none"),
        Patch(facecolor=(*BASE_C["PS"], 1), label="PS ~ 2.325^n",   edgecolor="none"),
        Patch(facecolor=(*BASE_C["UN"], 1), label="UN  unsettled",   edgecolor="none"),
    ]
    ax2.legend(handles=lines, loc="upper left",
               facecolor=(0.07, 0.08, 0.14, 0.75),
               edgecolor=(0.25, 0.25, 0.35, 0.6),
               labelcolor="white", fontsize=7.5,
               handlelength=1.0, borderpad=0.6)

    # grade stats
    if max_n_shown >= 0:
        from pewpew import grade_stats
        n = all_data[max_n_shown]["n"]
        total, ps, ns, ds, nc, mx = grade_stats(n, GEN, BYP)
        txt = (f"grade {n}\n"
               f"total  {total}\n"
               f"DS     {ds}\n"
               f"NS     {ns}\n"
               f"PS     {ps}\n"
               f"NC     {nc}")
        ax2.text(0.05, 0.35, txt,
                 va="top", ha="left",
                 color=(0.70, 0.70, 0.70), fontsize=7,
                 family="monospace",
                 transform=ax2.transAxes,
                 bbox=dict(facecolor=(0.07,0.08,0.14,0.75),
                           edgecolor=(0.25,0.25,0.35,0.6),
                           boxstyle="round,pad=0.4"))


# ── frame renderer ────────────────────────────────────────────────────────────
def render_frame(all_data, visible, fade_in, t, out_path, dpi=100):
    """
    visible   : list of grade indices that are fully shown
    fade_in   : (grade_idx, alpha) — the grade currently materialising
    t         : float [0,1] position in the full video (for camera)
    """
    W, H = 1600, 900
    fig  = plt.figure(figsize=(W / dpi, H / dpi), dpi=dpi,
                      facecolor=tuple(BG))
    # push axes to fill frame — mpl3d always wastes space, compensate
    ax   = fig.add_axes([0, 0, 1, 1], projection="3d")
    ax.set_facecolor(tuple(BG))
    fig.patch.set_facecolor(tuple(BG))
    ax.set_axis_off()
    # remove the grey pane backgrounds
    ax.xaxis.pane.fill = False
    ax.yaxis.pane.fill = False
    ax.zaxis.pane.fill = False
    ax.xaxis.pane.set_edgecolor((0, 0, 0, 0))
    ax.yaxis.pane.set_edgecolor((0, 0, 0, 0))
    ax.zaxis.pane.set_edgecolor((0, 0, 0, 0))

    elev, azim = camera_at(t)
    ax.view_init(elev=elev, azim=azim)

    max_vis = max(visible) if visible else 0

    # set limits so the structure fills the box
    r_max = ring_r(max_vis) + 0.8
    z_top = ring_z(max_vis) + Z_SCALE * 0.5
    z_bot = -Z_SCALE * 0.2
    # equal x/y, z stretched to match physical proportions
    ax.set_xlim(-r_max, r_max)
    ax.set_ylim(-r_max, r_max)
    ax.set_zlim(z_bot, z_top)
    ax.set_box_aspect([1, 1, (z_top - z_bot) / (2 * r_max)])

    # ── draw all fully-visible grades ─────────────────────────────────────────
    for n in visible:
        age         = max_vis - n
        a_node      = max(0.25, 1.0 - age * 0.11)
        a_edge      = max(0.10, 0.75 - age * 0.10)   # chords much more visible
        a_ring      = max(0.15, 0.70 - age * 0.10)
        is_newest   = (n == max_vis)
        draw_grade(ax, all_data[n], a_node, a_edge, a_ring, glow=is_newest)

        # tendrils to next grade if it's also visible
        if n + 1 in visible or (fade_in and fade_in[0] == n + 1):
            a_tend = max(0.02, 0.12 - age * 0.03)
            next_d = (all_data[n + 1]
                      if n + 1 <= len(all_data) - 1 else None)
            if next_d:
                draw_tendrils(ax, all_data[n], next_d, a_tend)

    # ── draw the materialising grade ─────────────────────────────────────────
    if fade_in:
        fi_n, fi_alpha = fade_in
        draw_grade(ax, all_data[fi_n],
                   alpha_node=fi_alpha * 1.00,
                   alpha_edge=fi_alpha * 0.75,
                   alpha_ring=fi_alpha * 0.85,
                   glow=True)
        if visible:
            draw_tendrils(ax, all_data[max_vis], all_data[fi_n],
                          fi_alpha * 0.45)

    # ── overlay ───────────────────────────────────────────────────────────────
    hi = max_vis if not fade_in else fade_in[0]
    add_overlay(fig, hi, all_data)

    # title
    fig.text(0.5, 0.97,
             "Directional Preordered Monoid  |  a -> b -> c",
             ha="center", va="top",
             color=(0.6, 0.6, 0.7), fontsize=11)

    plt.savefig(out_path, dpi=dpi, bbox_inches="tight",
                facecolor=fig.get_facecolor(), pad_inches=0)
    plt.close(fig)


# ── timeline builder ──────────────────────────────────────────────────────────
def build_timeline(max_n, fps=20):
    """
    Returns list of (visible_grades, fade_in_or_None, t) per frame.
    Growth: each grade gets HOLD_GROW frames.
    Final orbit: ORBIT_FRAMES extra frames with all grades.
    """
    HOLD_GROW   = fps * 2        # 2 s per new grade
    FADE_FRAMES = fps            # 1 s materialisation fade
    ORBIT_FRAMES= fps * 8        # 8 s final orbit

    frames  = []
    visible = []

    for n in range(max_n + 1):
        # fade-in phase
        for fi in range(FADE_FRAMES):
            alpha = (fi + 1) / FADE_FRAMES
            t_abs = len(frames)
            frames.append((list(visible), (n, alpha), t_abs))
        # hold phase
        visible_with = list(visible) + [n]
        for _ in range(HOLD_GROW):
            t_abs = len(frames)
            frames.append((visible_with, None, t_abs))
        visible = visible_with

    # final orbit — all grades fully visible
    for _ in range(ORBIT_FRAMES):
        t_abs = len(frames)
        frames.append((visible, None, t_abs))

    total = len(frames)
    # normalise t to [0,1]
    return [(vis, fi, i / (total - 1)) for i, (vis, fi, _) in enumerate(frames)]


# ── main ──────────────────────────────────────────────────────────────────────
def main():
    MAX_N      = 7
    FPS        = 20
    BASE       = os.path.dirname(__file__)
    FRAMES_DIR = os.path.join(BASE, "frames_manifold")
    GIF_OUT    = os.path.join(BASE, "grow_manifold.gif")
    MP4_OUT    = os.path.join(BASE, "grow_manifold.mp4")

    os.makedirs(FRAMES_DIR, exist_ok=True)

    all_data = precompute(MAX_N)
    timeline = build_timeline(MAX_N, fps=FPS)
    total    = len(timeline)
    print(f"\n{total} frames  ({total/FPS:.0f}s @ {FPS}fps)")

    png_paths = []
    print("rendering…")
    for i, (vis, fi, t) in enumerate(timeline):
        path = os.path.join(FRAMES_DIR, f"f{i:05d}.png")
        render_frame(all_data, vis, fi, t, path, dpi=100)
        png_paths.append(path)
        if i % 10 == 0:
            print(f"  {i}/{total}", flush=True)

    # ── GIF ───────────────────────────────────────────────────────────────────
    print("building GIF…")
    from PIL import Image
    imgs = [Image.open(p) for p in png_paths]
    # quantise each frame to 256-color palette for GIF
    imgs_q = [img.quantize(colors=256, method=Image.Quantize.FASTOCTREE)
              for img in imgs]
    imgs_q[0].save(
        GIF_OUT,
        save_all=True,
        append_images=imgs_q[1:],
        duration=int(1000 / FPS),
        loop=0,
        optimize=False,
    )
    print(f"  -> {GIF_OUT}")

    # ── MP4 ───────────────────────────────────────────────────────────────────
    ffmpeg = shutil.which("ffmpeg") or next(
        (p for p in [
            r"C:\ffmpeg\bin\ffmpeg.exe",
            r"C:\Program Files\ffmpeg\bin\ffmpeg.exe",
            os.path.expanduser(r"~\scoop\apps\ffmpeg\current\bin\ffmpeg.exe"),
        ] if os.path.isfile(p)), None
    )
    if ffmpeg:
        print(f"stitching MP4…")
        subprocess.run([
            ffmpeg, "-y",
            "-framerate", str(FPS),
            "-i", os.path.join(FRAMES_DIR, "f%05d.png"),
            "-vf", "scale=trunc(iw/2)*2:trunc(ih/2)*2",
            "-c:v", "libx264", "-pix_fmt", "yuv420p", "-crf", "17",
            MP4_OUT,
        ], check=True)
        print(f"  -> {MP4_OUT}")
    else:
        print(f"\nno ffmpeg found. to stitch:")
        print(f"  ffmpeg -framerate {FPS} -i {FRAMES_DIR}/f%05d.png "
              f"-c:v libx264 -pix_fmt yuv420p {MP4_OUT}")

    print("\ndone.")


if __name__ == "__main__":
    main()
