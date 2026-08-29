#!/usr/bin/env python3
"""
grow_dpm.py
Animate the growth of the Directional Preordered Monoid.

Layout: bypass DAG with y = max-depth-to-settlement (PS at bottom, unsettled at top).
Saves: grow_dpm.gif  (always)
       frames/       (PNG frames for manual ffmpeg)
       grow_dpm.mp4  (if ffmpeg on PATH)
"""

import sys, os, subprocess, shutil
sys.path.insert(0, os.path.dirname(__file__))

from pewpew import (make_dpm, all_histories, bypass_at,
                    possible_settled, necessary_settled, doubly_settled,
                    grade_stats, void)

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
from matplotlib.patches import Patch, FancyArrowPatch
import matplotlib.patheffects as pe
import numpy as np
import networkx as nx
from collections import defaultdict

# ── DPM ──────────────────────────────────────────────────────────────────────
_bypass_pairs = {("a", "b"), ("b", "c")}
dpm = make_dpm(
    generators=["a", "b", "c"],
    bypasses=lambda x, y: (x, y) in _bypass_pairs,
)
GEN = dpm["generators"]
BYP = dpm["bypasses"]

# category colours
C = {
    "DS": "#c678dd",   # doubly-settled   — purple
    "PS": "#98c379",   # possible-settled — green
    "NS": "#61afef",   # necessary-settled — blue
    "UN": "#e06c75",   # unsettled         — red
}
BG       = "#1e2127"
PANEL_BG = "#282c34"
FG       = "#abb2bf"
DIM      = "#5c6370"

# ── helpers ──────────────────────────────────────────────────────────────────
def cat(h):
    ps = possible_settled(h, BYP)
    ns = necessary_settled(h, GEN, BYP)
    return "DS" if ps and ns else "PS" if ps else "NS" if ns else "UN"


def build_dag(n):
    """Returns (nx.DiGraph, list-of-histories)."""
    histories = all_histories(n, GEN)
    g = nx.DiGraph()
    g.add_nodes_from(histories)
    for h in histories:
        for i in range(len(h) - 1):
            status, h2 = bypass_at(h, i, BYP)
            if status == "fired":
                g.add_edge(h, h2)
    return g, histories


def max_depth_to_ps(dag, histories):
    """Longest path from each history to any PS node (= depth above settlement)."""
    depth = {}
    # DFS in reverse topological order
    for h in reversed(list(nx.topological_sort(dag))):
        succs = list(dag.successors(h))
        if not succs:
            depth[h] = 0
        else:
            depth[h] = 1 + max(depth[s] for s in succs)
    return depth


def dag_pos(dag, histories, depth):
    """
    x: jittered position within each depth level (sorted lex for stability)
    y: depth (0 = PS at top, increases downward — we negate for plot)
    """
    by_d = defaultdict(list)
    for h in histories:
        by_d[depth[h]].append(h)

    max_w = max(len(v) for v in by_d.values()) if by_d else 1
    pos = {}
    for d, hs in by_d.items():
        hs = sorted(hs)
        w = len(hs)
        for i, h in enumerate(hs):
            # spread across [-5, 5], centred
            x = (i - (w - 1) / 2) / max(max_w / 10, 1)
            pos[h] = (x, -d)
    return pos


# ── per-grade data ────────────────────────────────────────────────────────────
def grade_data(n):
    """Returns dict with everything needed to draw grade n."""
    total, ps_n, ns_n, ds_n, nc_n, mx = grade_stats(n, GEN, BYP)
    d = dict(n=n, total=total, PS=ps_n, NS=ns_n, DS=ds_n, NC=nc_n, max_ep=mx)

    if n <= 6:
        dag, histories = build_dag(n)
        depth = max_depth_to_ps(dag, histories)
        pos = dag_pos(dag, histories, depth)
        d["dag"]       = dag
        d["histories"] = histories
        d["depth"]     = depth
        d["pos"]       = pos
    else:
        # just depth histogram
        histories = all_histories(n, GEN)
        d["histories"] = histories
        # build depth histogram without keeping full graph
        dag, _ = build_dag(n)
        depth = max_depth_to_ps(dag, histories)
        d["depth_hist"] = depth

    return d


def collect_all(max_n):
    print("collecting grade data…")
    data = []
    for n in range(max_n + 1):
        print(f"  grade {n}…", end=" ", flush=True)
        d = grade_data(n)
        data.append(d)
        print(f"  total={d['total']}  PS={d['PS']}  DS={d['DS']}")
    return data


# ── rendering ────────────────────────────────────────────────────────────────
def style_ax(ax):
    ax.set_facecolor(PANEL_BG)
    ax.tick_params(colors=FG, labelsize=8)
    for spine in ax.spines.values():
        spine.set_edgecolor(DIM)
    ax.xaxis.label.set_color(FG)
    ax.yaxis.label.set_color(FG)
    ax.title.set_color(FG)


def render_frame(all_data, idx, out_path):
    d = all_data[idx]
    n = d["n"]
    max_n = all_data[-1]["n"]

    fig = plt.figure(figsize=(16, 9), dpi=100, facecolor=BG)
    gs = gridspec.GridSpec(
        2, 2, figure=fig,
        width_ratios=[2.4, 1],
        height_ratios=[3, 1.2],
        hspace=0.38, wspace=0.28,
        left=0.05, right=0.97, top=0.92, bottom=0.06,
    )
    ax_main  = fig.add_subplot(gs[0, 0])
    ax_bar   = fig.add_subplot(gs[0, 1])
    ax_curve = fig.add_subplot(gs[1, :])

    for ax in (ax_main, ax_bar, ax_curve):
        style_ax(ax)

    # ── suptitle ──────────────────────────────────────────────────────────────
    fig.suptitle(
        f"Directional Preordered Monoid   G = {{a, b, c}},  a→b  b→c",
        color=FG, fontsize=13, fontweight="bold",
    )

    # ── main panel: DAG or histogram ─────────────────────────────────────────
    if n == 0:
        ax_main.text(0.5, 0.5, "void  (grade 0)\nisolated minimum\nDS count = 1",
                     ha="center", va="center", color=C["DS"], fontsize=18,
                     transform=ax_main.transAxes, fontweight="bold")
        ax_main.set_title("Bypass DAG", fontsize=11, pad=6)
        ax_main.axis("off")

    elif n <= 6:
        dag       = d["dag"]
        histories = d["histories"]
        pos       = d["pos"]
        depth     = d["depth"]
        max_d     = max(depth.values()) if depth else 0

        node_colors = [C[cat(h)] for h in dag.nodes()]
        show_labels = (n <= 4)
        labels      = {h: "".join(h) for h in dag.nodes()} if show_labels else {}
        node_sz     = max(12, 400 - n * 55)
        font_sz     = max(5, 9 - n)

        nx.draw_networkx(
            dag, pos=pos, ax=ax_main,
            node_color=node_colors,
            labels=labels,
            with_labels=show_labels,
            node_size=node_sz,
            font_size=font_sz,
            font_color="#111111",
            arrows=True,
            arrowsize=max(6, 18 - n * 2),
            edge_color=DIM,
            width=0.7,
            alpha=0.93,
        )
        ax_main.set_title(
            f"Bypass DAG — grade {n}   ({3**n} histories,  max depth = {max_d})",
            fontsize=10, pad=6,
        )
        # depth labels on y-axis side
        for depth_val in range(max_d + 1):
            label = "PS" if depth_val == 0 else f"d={depth_val}"
            ax_main.text(
                ax_main.get_xlim()[0] if ax_main.get_xlim()[0] != 0 else -6,
                -depth_val, label,
                color=C["PS"] if depth_val == 0 else DIM,
                fontsize=7, va="center",
            )
        ax_main.axis("off")

        # legend
        legend_els = [Patch(facecolor=C[k], label=k, edgecolor="none") for k in C]
        ax_main.legend(
            handles=legend_els, loc="lower right",
            facecolor=PANEL_BG, edgecolor=DIM, labelcolor=FG, fontsize=8,
        )

    else:
        # depth histogram (stacked by category)
        histories = d["histories"]
        depth_h   = d["depth_hist"]
        max_d     = max(depth_h.values()) if depth_h else 0

        by_cat = defaultdict(lambda: defaultdict(int))
        for h in histories:
            by_cat[cat(h)][depth_h[h]] += 1

        xs      = np.arange(max_d + 1)
        bottom  = np.zeros(max_d + 1)
        for k in ["DS", "PS", "NS", "UN"]:
            counts = np.array([by_cat[k].get(dv, 0) for dv in range(max_d + 1)])
            ax_main.bar(xs, counts, bottom=bottom, color=C[k], alpha=0.85,
                        label=k, width=0.8)
            bottom += counts

        ax_main.set_xlabel("max depth to settlement", fontsize=9)
        ax_main.set_ylabel("count", fontsize=9)
        ax_main.set_title(
            f"Settlement depth distribution — grade {n}   ({3**n} histories)",
            fontsize=10, pad=6,
        )
        ax_main.legend(
            facecolor=PANEL_BG, edgecolor=DIM, labelcolor=FG, fontsize=8,
        )
        style_ax(ax_main)

    # ── bar chart: category counts ────────────────────────────────────────────
    cats   = ["Total", "PS", "NS", "DS", "NC"]
    vals   = [d["total"], d["PS"], d["NS"], d["DS"], d["NC"]]
    bcolors = ["#abb2bf", C["PS"], C["NS"], C["DS"], C["UN"]]

    bars = ax_bar.bar(cats, vals, color=bcolors, alpha=0.85, edgecolor="none")
    for bar, val in zip(bars, vals):
        ax_bar.text(
            bar.get_x() + bar.get_width() / 2,
            bar.get_height() * 1.02,
            str(val),
            ha="center", va="bottom", color=FG, fontsize=9, fontweight="bold",
        )
    ax_bar.set_title(f"Counts  —  grade {n}", fontsize=10, pad=6)
    ax_bar.set_ylabel("count", fontsize=9)

    # annotate beautiful formulas
    ax_bar.text(
        0.98, 0.97,
        f"Total = 3ⁿ = {d['total']}\n"
        f"NS    = 2ⁿ = {d['NS']}\n"
        f"DS    = n+1 = {d['DS']}\n"
        f"PS    ≈ 2.3247ⁿ ≈ {d['PS']}",
        ha="right", va="top", transform=ax_bar.transAxes,
        color=DIM, fontsize=7.5, family="monospace",
    )
    style_ax(ax_bar)

    # ── growth curves ─────────────────────────────────────────────────────────
    ns_r  = [x["n"]     for x in all_data[:idx + 1]]
    tots  = [x["total"] for x in all_data[:idx + 1]]
    pss   = [x["PS"]    for x in all_data[:idx + 1]]
    nss   = [x["NS"]    for x in all_data[:idx + 1]]
    dss   = [x["DS"]    for x in all_data[:idx + 1]]
    ncs   = [x["NC"]    for x in all_data[:idx + 1]]

    # faint ghost lines for future grades
    ns_full = [x["n"]     for x in all_data]
    tots_f  = [x["total"] for x in all_data]
    pss_f   = [x["PS"]    for x in all_data]
    ax_curve.plot(ns_full, tots_f, "--", color="#abb2bf", alpha=0.15, lw=1)
    ax_curve.plot(ns_full, pss_f,  "--", color=C["PS"],   alpha=0.15, lw=1)

    ax_curve.plot(ns_r, tots, "o-", color="#abb2bf", label="Total = 3ⁿ",       lw=2, ms=5)
    ax_curve.plot(ns_r, pss,  "o-", color=C["PS"],   label="PS  ≈ 2.325ⁿ",     lw=2, ms=5)
    ax_curve.plot(ns_r, nss,  "o-", color=C["NS"],   label="NS  = 2ⁿ",          lw=2, ms=5)
    ax_curve.plot(ns_r, dss,  "o-", color=C["DS"],   label="DS  = n+1",          lw=2, ms=5)
    ax_curve.plot(ns_r, ncs,  "o-", color=C["UN"],   label="NC",                 lw=2, ms=5)

    ax_curve.axvline(n, color="#ffffff", alpha=0.25, lw=1.5, ls="--")
    ax_curve.set_xlim(-0.4, max_n + 0.4)
    ax_curve.set_yscale("log")
    ax_curve.set_xlabel("grade n", fontsize=10)
    ax_curve.set_ylabel("count (log)", fontsize=10)
    ax_curve.set_title("Growth across grades", fontsize=10, pad=4)
    ax_curve.legend(
        ncol=5, loc="upper left",
        facecolor=PANEL_BG, edgecolor=DIM, labelcolor=FG, fontsize=8,
    )
    style_ax(ax_curve)

    plt.savefig(out_path, dpi=100, bbox_inches="tight", facecolor=fig.get_facecolor())
    plt.close(fig)


# ── main ─────────────────────────────────────────────────────────────────────
def main():
    MAX_N      = 8        # grades 0..8
    FPS        = 1        # 1 fps for GIF (each grade = 1s; duplicate frames below)
    HOLD       = 4        # frames to hold each grade
    BASE       = os.path.dirname(__file__)
    FRAMES_DIR = os.path.join(BASE, "frames_dpm")
    GIF_OUT    = os.path.join(BASE, "grow_dpm.gif")
    MP4_OUT    = os.path.join(BASE, "grow_dpm.mp4")

    os.makedirs(FRAMES_DIR, exist_ok=True)

    all_data = collect_all(MAX_N)

    # render one PNG per grade
    png_paths = []
    print("\nrendering frames…")
    for i, d in enumerate(all_data):
        path = os.path.join(FRAMES_DIR, f"frame_{i:04d}.png")
        print(f"  grade {d['n']} -> {path}", flush=True)
        render_frame(all_data, i, path)
        png_paths.append(path)

    # build GIF via Pillow (always available)
    print("\nbuilding GIF…")
    from PIL import Image
    frames_pil = [Image.open(p) for p in png_paths]

    # hold each frame HOLD times
    seq = []
    for img in frames_pil:
        for _ in range(HOLD):
            seq.append(img.copy())
    # extra hold on last frame
    for _ in range(HOLD * 3):
        seq.append(frames_pil[-1].copy())

    seq[0].save(
        GIF_OUT,
        save_all=True,
        append_images=seq[1:],
        duration=int(1000 / FPS),   # ms per frame
        loop=0,
    )
    print(f"  saved: {GIF_OUT}")

    # try ffmpeg for MP4
    ffmpeg = shutil.which("ffmpeg")
    if not ffmpeg:
        # check common Windows locations
        candidates = [
            r"C:\ffmpeg\bin\ffmpeg.exe",
            r"C:\Program Files\ffmpeg\bin\ffmpeg.exe",
            os.path.expanduser(r"~\scoop\apps\ffmpeg\current\bin\ffmpeg.exe"),
            os.path.expanduser(r"~\AppData\Local\Microsoft\WinGet\Packages\ffmpeg.exe"),
        ]
        for c in candidates:
            if os.path.isfile(c):
                ffmpeg = c
                break

    if ffmpeg:
        print(f"\nstitching MP4 via {ffmpeg}…")
        cmd = [
            ffmpeg, "-y",
            "-framerate", str(FPS * HOLD),
            "-pattern_type", "glob",
            "-i", os.path.join(FRAMES_DIR, "frame_*.png").replace("\\", "/"),
            "-vf", "scale=trunc(iw/2)*2:trunc(ih/2)*2",   # ensure even dimensions
            "-c:v", "libx264",
            "-pix_fmt", "yuv420p",
            "-crf", "18",
            MP4_OUT,
        ]
        try:
            subprocess.run(cmd, check=True)
            print(f"  saved: {MP4_OUT}")
        except subprocess.CalledProcessError as e:
            print(f"  ffmpeg failed: {e}")
    else:
        print("\nffmpeg not found — to make MP4:")
        print(f"  ffmpeg -framerate {FPS * HOLD} -i {FRAMES_DIR}/frame_%04d.png "
              f"-c:v libx264 -pix_fmt yuv420p {MP4_OUT}")

    print("\ndone.")
    print(f"  GIF  -> {GIF_OUT}")
    print(f"  PNGs -> {FRAMES_DIR}/")


if __name__ == "__main__":
    main()
