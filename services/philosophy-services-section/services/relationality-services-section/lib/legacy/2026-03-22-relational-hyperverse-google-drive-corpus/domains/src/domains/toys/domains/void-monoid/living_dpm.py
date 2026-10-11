#!/usr/bin/env python3
"""
living_dpm.py

The DPM as a living process.

Each grade's histories start "tense" (bypass pressure).
Bypasses fire in interleaved rounds — the whole grade settles together
in a wave, deepest histories first.
Then the settled ground sprouts the next grade upward.

Visual  : 2D falling-particle layout.
          y = grade_baseline + remaining_bypass_depth (particles fall as they settle)
          x = lex rank within grade
          Older grades dim but stay as ground.
          Tendrils connect parents to children on prepend.

Audio   : generated with numpy + stdlib wave.
          Background drone  — amplitude ∝ current total tension.
          Bypass a→b        — C4 click.
          Bypass b→c        — E4 click.
          PS settlement     — soft C4+G4 bell.
          DS settlement     — richer C4+E4+G4 bell.
          Prepend           — rising whoosh (300 → 1400 Hz).
Output  : frames_living/   PNG frames
          living_dpm.wav   audio track
          ffmpeg command   to combine into MP4
"""

import sys, os, shutil, subprocess, wave as wave_mod, struct, math
sys.path.insert(0, os.path.dirname(__file__))

from pewpew import (make_dpm, all_histories, bypass_at,
                    possible_settled, necessary_settled, doubly_settled,
                    bypass_closure, void)

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
import numpy as np
from collections import defaultdict

# ── DPM ──────────────────────────────────────────────────────────────────────
_bypass_pairs = {("a", "b"), ("b", "c")}
GEN = ["a", "b", "c"]
BYP = lambda x, y: (x, y) in _bypass_pairs

FREQ = {"a": 261.63, "b": 329.63, "c": 392.00}   # C4, E4, G4


def cat(h):
    ps = possible_settled(h, BYP)
    ns = necessary_settled(h, GEN, BYP)
    return "DS" if ps and ns else "PS" if ps else "NS" if ns else "UN"


CMAP = {
    "DS": np.array([0.78, 0.42, 0.87]),
    "PS": np.array([0.45, 0.90, 0.35]),
    "NS": np.array([0.25, 0.72, 0.95]),
    "UN": np.array([0.97, 0.40, 0.30]),
}
BG = np.array([0.05, 0.06, 0.10])

# ── layout constants ──────────────────────────────────────────────────────────
Y_GRADE   = 4.0    # vertical spacing between grade baselines
Y_TENSION = 0.72   # y added per unit of bypass depth
X_SPREAD  = 9.0    # total horizontal spread per grade

# ── audio constants ───────────────────────────────────────────────────────────
SR = 44100


def bypass_depth(h):
    """Max-path length to any PS descendant (memoised globally)."""
    visited, frontier = set(), {h}
    dag = {}
    while frontier:
        cur = frontier.pop()
        visited.add(cur)
        succs = []
        for i in range(len(cur) - 1):
            st, nxt = bypass_at(cur, i, BYP)
            if st == "fired":
                succs.append(nxt)
                if nxt not in visited:
                    frontier.add(nxt)
        dag[cur] = succs

    # longest path from h to any sink
    depth_cache = {}
    for node in reversed(list(_topo(dag, h))):
        if not dag[node]:
            depth_cache[node] = 0
        else:
            depth_cache[node] = 1 + max(depth_cache.get(s, 0) for s in dag[node])
    return depth_cache.get(h, 0)


def _topo(dag, start):
    """Topological order reachable from start."""
    order, visited = [], set()
    def dfs(n):
        if n in visited: return
        visited.add(n)
        for s in dag.get(n, []):
            dfs(s)
        order.append(n)
    dfs(start)
    return order


# ── simulation ────────────────────────────────────────────────────────────────
def settlement_chain(h):
    """Greedy chain: always fire leftmost available bypass. Returns [(from,to,gen_swapped)]."""
    chain = []
    cur = h
    while not possible_settled(cur, BYP):
        for i in range(len(cur) - 1):
            st, nxt = bypass_at(cur, i, BYP)
            if st == "fired":
                chain.append((cur, nxt, cur[i]))   # gen_swapped = the bypassing generator
                cur = nxt
                break
        else:
            break
    return chain


def build_event_timeline(max_n=6):
    """
    Returns (events, particle_table, total_duration).

    events: sorted list of dicts, each:
      { type: "prepend"|"bypass"|"settle",
        time: float,
        ... event-specific fields }

    particle_table: maps (grade, initial_lex_rank) →
      { x, y_base, chain: [(form, depth_remaining)] }
    """
    events     = []
    particles  = {}   # (grade, rank) → particle data
    t          = 0.0

    # timing per grade
    T_PAUSE   = 0.55   # pause after all settled, before prepend
    T_WHOOSH  = 0.40   # duration of prepend whoosh
    T_SETTLE  = {      # time budget to settle grade n
        0: 0.0, 1: 0.0,
        2: 1.0, 3: 1.6, 4: 2.4, 5: 3.2, 6: 3.8,
    }

    # track current "live" forms (what each particle's history currently looks like)
    live_forms  = {}  # (grade, rank) → current form
    grade_ranks = {}  # grade → sorted list of (form, rank)

    for n in range(max_n + 1):
        histories  = all_histories(n, GEN)
        sorted_h   = sorted(histories)
        rank_of    = {h: i for i, h in enumerate(sorted_h)}
        total      = len(sorted_h)
        grade_ranks[n] = [(h, rank_of[h]) for h in sorted_h]

        # ── prepend event ──────────────────────────────────────────────────────
        events.append({"type": "prepend", "time": t, "grade": n})
        t += T_WHOOSH

        # register particles for this grade
        for h in sorted_h:
            rank = rank_of[h]
            x    = (rank / max(total - 1, 1)) * X_SPREAD - X_SPREAD / 2
            key  = (n, rank)
            d    = bypass_depth(h)
            particles[key] = {
                "grade":  n,
                "rank":   rank,
                "total":  total,
                "x":      x,
                "y_base": n * Y_GRADE,
                "initial_form": h,
                "chain":  settlement_chain(h),   # [(from, to, gen), ...]
            }
            live_forms[key] = h

        # ── bypass / settle events ─────────────────────────────────────────────
        t_settle_budget = T_SETTLE.get(n, 4.0)
        if t_settle_budget == 0.0 or n <= 1:
            # nothing to fire at grade 0/1
            pass
        else:
            # collect all chain steps for this grade, grouped by "round"
            # round k = the k-th bypass in each history's chain
            # interleaved: fire all round-0 steps, then all round-1 steps, etc.
            max_chain = max(len(particles[(n, rank_of[h])]["chain"])
                            for h in sorted_h)

            # sort histories by chain length desc within round
            by_chain_len = sorted(sorted_h,
                                  key=lambda h: -len(particles[(n, rank_of[h])]["chain"]))

            round_events = []  # list of (from, to, gen) in firing order
            for step_idx in range(max_chain):
                for h in by_chain_len:
                    chain = particles[(n, rank_of[h])]["chain"]
                    if step_idx < len(chain):
                        round_events.append((n, rank_of[h], step_idx, chain[step_idx]))

            n_events = len(round_events)
            for ev_i, (gn, rank, step_idx, (from_h, to_h, gen)) in enumerate(round_events):
                ev_t  = t + (ev_i / max(n_events - 1, 1)) * t_settle_budget
                key   = (gn, rank)
                d_remaining = len(particles[key]["chain"]) - step_idx - 1
                events.append({
                    "type":       "bypass",
                    "time":       ev_t,
                    "grade":      gn,
                    "rank":       rank,
                    "from":       from_h,
                    "to":         to_h,
                    "gen":        gen,
                    "depth_after": d_remaining,
                })
                if d_remaining == 0:
                    events.append({
                        "type":  "settle",
                        "time":  ev_t + 0.001,
                        "grade": gn,
                        "rank":  rank,
                        "form":  to_h,
                    })

            t += t_settle_budget

        t += T_PAUSE

    events.sort(key=lambda e: e["time"])
    return events, particles, t


# ── audio synthesis ───────────────────────────────────────────────────────────
def silence(n_samp):
    return np.zeros(n_samp)

def sine_env(freq, dur, amp=0.35, atk=0.004, rel_frac=0.6):
    n  = int(SR * dur)
    t  = np.arange(n) / SR
    s  = amp * np.sin(2 * math.pi * freq * t)
    a  = int(SR * atk)
    r  = int((n - a) * rel_frac)
    env = np.concatenate([np.linspace(0, 1, a),
                          np.ones(n - a - r),
                          np.linspace(1, 0, r)])[:n]
    return s * env

def bell(freqs, dur=0.4, amp=0.28):
    n   = int(SR * dur)
    t   = np.arange(n) / SR
    out = np.zeros(n)
    for i, f in enumerate(freqs):
        decay = 5 + i * 3
        out  += (amp / len(freqs)) * np.sin(2*math.pi*f*t) * np.exp(-decay * t)
    return out

def whoosh(f0, f1, dur=0.40, amp=0.30):
    n    = int(SR * dur)
    t    = np.arange(n) / SR
    freq = np.geomspace(f0, f1, n)
    phase = np.cumsum(2 * math.pi * freq / SR)
    tone  = amp * 0.65 * np.sin(phase)
    noise = amp * 0.35 * np.random.default_rng(42).normal(0, 1, n)
    env   = np.concatenate([np.linspace(0, 1, n // 4),
                             np.linspace(1, 0, n - n // 4)])
    return (tone + noise) * env

def generate_audio(events, total_duration, drone_tension_fn):
    """Build audio buffer, return float32 array at SR samples/s."""
    n_samp = int(SR * total_duration) + SR   # 1s extra tail
    buf    = np.zeros(n_samp)

    def add(signal, t_start):
        i = int(t_start * SR)
        end = min(i + len(signal), n_samp)
        buf[i:end] += signal[:end - i]

    for ev in events:
        t = ev["time"]
        if ev["type"] == "prepend":
            add(whoosh(280, 1400), t)

        elif ev["type"] == "bypass":
            gen = ev["gen"]
            freq = FREQ.get(gen, 300)
            add(sine_env(freq, 0.045, amp=0.22, atk=0.003, rel_frac=0.8), t)
            # subtle overtone at 1.5× for colour
            add(sine_env(freq * 1.5, 0.030, amp=0.08), t)

        elif ev["type"] == "settle":
            form = ev["form"]
            if doubly_settled(form, GEN, BYP):
                add(bell([FREQ["a"], FREQ["b"], FREQ["c"]], dur=0.55, amp=0.24), t)
            else:
                add(bell([FREQ["a"], FREQ["c"]], dur=0.38, amp=0.20), t)

    # background drone — low C2 + tension-modulated dissonance
    drone_freq  = 65.41   # C2
    tension_arr = np.array([drone_tension_fn(i / SR) for i in range(n_samp)])
    tension_arr = tension_arr / (tension_arr.max() + 1e-6)
    t_arr = np.arange(n_samp) / SR
    drone = 0.18 * tension_arr * np.sin(2 * math.pi * drone_freq * t_arr)
    # slight dissonant layer when tense
    drone += 0.07 * tension_arr * np.sin(2 * math.pi * drone_freq * 1.48 * t_arr)
    buf += drone

    # normalise to [-0.92, 0.92]
    peak = np.abs(buf).max()
    if peak > 0:
        buf = buf / peak * 0.92
    return buf.astype(np.float32)


def write_wav(samples, path):
    n_samp = len(samples)
    with wave_mod.open(path, "w") as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(SR)
        raw = (samples * 32767).astype(np.int16).tobytes()
        wf.writeframes(raw)
    print(f"  -> {path}  ({n_samp / SR:.1f}s)")


# ── visual state ──────────────────────────────────────────────────────────────
def build_visual_timeline(events, particles, total_t, fps=30):
    """
    Interpolate event stream into per-frame particle states.
    Returns: list of frame_states, each a dict:
      { particles: [(x, y, rgba, size)],
        tendrils: [(x0,y0,x1,y1,rgba)],
        tension: float (0–1) }
    """
    n_frames = int(total_t * fps) + 1

    # state per particle key: (depth_remaining, settled)
    pstate = {}
    for key, p in particles.items():
        pstate[key] = {"depth": len(p["chain"]), "settled": len(p["chain"]) == 0,
                       "form": p["initial_form"], "visible": False}

    # tendrils: (parent_key, child_key)  — shown briefly after prepend
    tendrils_active = {}   # child_key → (parent_key, expire_frame)

    event_queue = list(events)
    next_ev_idx = 0
    total_tension_cache = {}

    # precompute tension per frame for drone
    # we'll fill it after the main loop via a simple function
    grade_active_counts = defaultdict(int)   # grade → active count

    frame_states = []
    for fi in range(n_frames):
        t = fi / fps

        # process all events up to this frame's time
        while next_ev_idx < len(event_queue) and event_queue[next_ev_idx]["time"] <= t:
            ev = event_queue[next_ev_idx]
            next_ev_idx += 1

            if ev["type"] == "prepend":
                grade = ev["grade"]
                for key, p in particles.items():
                    if p["grade"] == grade:
                        pstate[key]["visible"] = True
                        d = pstate[key]["depth"]
                        grade_active_counts[grade] += (1 if d > 0 else 0)
                # register tendrils from parent grade
                if grade > 0:
                    for key, p in particles.items():
                        if p["grade"] == grade:
                            parent_form = p["initial_form"][1:]   # drop prepended gen
                            # find parent key in grade-1
                            pg = grade - 1
                            for pk, pp in particles.items():
                                if pp["grade"] == pg:
                                    # find the settled form of parent
                                    pc = pstate[pk]
                                    if pc["form"] == parent_form or pp["initial_form"] == parent_form:
                                        tendrils_active[key] = (pk, fi + int(fps * 0.8))
                                        break

            elif ev["type"] == "bypass":
                key = (ev["grade"], ev["rank"])
                if key in pstate:
                    pstate[key]["depth"] = ev["depth_after"]
                    pstate[key]["form"]  = ev["to"]

            elif ev["type"] == "settle":
                key = (ev["grade"], ev["rank"])
                if key in pstate:
                    pstate[key]["settled"] = True
                    pstate[key]["depth"]   = 0
                    pstate[key]["form"]    = ev["form"]
                    if grade_active_counts[ev["grade"]] > 0:
                        grade_active_counts[ev["grade"]] -= 1

        # expire old tendrils
        tendrils_active = {k: v for k, v in tendrils_active.items() if v[1] > fi}

        # build particle list
        pts = []
        max_grade_visible = max(
            (p["grade"] for key, p in particles.items() if pstate[key]["visible"]),
            default=0
        )
        total_tension = 0

        for key, p in particles.items():
            ps = pstate[key]
            if not ps["visible"]:
                continue
            age   = max_grade_visible - p["grade"]
            alpha = max(0.12, 1.0 - age * 0.18)
            form  = ps["form"]
            c     = cat(form)
            # smooth color blend toward PS as depth decreases
            init_depth = len(p["chain"])
            depth_frac = ps["depth"] / max(init_depth, 1)   # 1=fully tense, 0=settled
            rgb_tense  = CMAP["UN"]
            rgb_calm   = CMAP[c]
            # blend only for UN→PS transition
            if c == "PS" or c == "DS":
                blend = 1.0 - depth_frac
                rgb   = rgb_tense * (1 - blend) + rgb_calm * blend
            else:
                rgb = CMAP[c]

            x      = p["x"]
            y      = p["y_base"] + ps["depth"] * Y_TENSION
            size   = max(8, 55 - p["grade"] * 4) * (1 + depth_frac * 0.6)
            rgba   = (*rgb, alpha)
            pts.append((x, y, rgba, size))
            total_tension += ps["depth"]

        # build tendril lines
        tlines = []
        for child_key, (parent_key, _) in tendrils_active.items():
            if child_key not in pstate or parent_key not in pstate:
                continue
            if not pstate[child_key]["visible"] or not pstate[parent_key]["visible"]:
                continue
            cp = particles[child_key]
            pp = particles[parent_key]
            cps = pstate[child_key]
            cx  = cp["x"]
            cy  = cp["y_base"] + cps["depth"] * Y_TENSION
            px  = pp["x"]
            py  = pp["y_base"]
            rgba = (*CMAP[cat(cps["form"])], 0.20)
            tlines.append((px, py, cx, cy, rgba))

        frame_states.append({
            "pts":     pts,
            "tlines":  tlines,
            "tension": total_tension,
            "max_grade": max_grade_visible,
            "t": t,
        })
        total_tension_cache[fi] = total_tension

    # build drone tension function from cached values
    def tension_fn(t_sec):
        fi = min(int(t_sec * fps), n_frames - 1)
        return math.log1p(total_tension_cache.get(fi, 0))

    return frame_states, tension_fn


# ── frame render ──────────────────────────────────────────────────────────────
def render_frame(fs, out_path, dpi=100, W=1600, H=900):
    fig, ax = plt.subplots(figsize=(W/dpi, H/dpi), dpi=dpi, facecolor=tuple(BG))
    fig.subplots_adjust(left=0, right=1, top=1, bottom=0)
    ax.set_facecolor(tuple(BG))
    ax.set_axis_off()

    pts     = fs["pts"]
    tlines  = fs["tlines"]
    t       = fs["t"]
    max_g   = fs["max_grade"]

    # scrolling window: keep newest grade in upper portion, show ~3.5 grades of history
    y_top = max_g * Y_GRADE + 4.5 * Y_TENSION + 1.2
    y_bot = y_top - 14.0
    ax.set_xlim(-X_SPREAD / 2 - 1, X_SPREAD / 2 + 1)
    ax.set_ylim(y_bot, y_top)

    # grade baseline lines
    for gn in range(max_g + 1):
        y_bl = gn * Y_GRADE
        if y_bot < y_bl < y_top:
            age   = max_g - gn
            alpha = max(0.06, 0.30 - age * 0.06)
            ax.axhline(y_bl, color=(*BG * 2.5, alpha), lw=0.6, zorder=1)
            ax.text(-X_SPREAD/2 - 0.5, y_bl, f"n={gn}",
                    color=(0.45, 0.45, 0.55, max(0.2, alpha * 1.8)),
                    fontsize=7, va="center", ha="right", zorder=2)

    # tendrils
    if tlines:
        segs   = [[(x0, y0), (x1, y1)] for x0, y0, x1, y1, _ in tlines]
        colors = [rgba for _, _, _, _, rgba in tlines]
        lc = LineCollection(segs, colors=colors, linewidths=0.6, zorder=3)
        ax.add_collection(lc)

    # particles
    if pts:
        xs    = np.array([p[0] for p in pts])
        ys    = np.array([p[1] for p in pts])
        cs    = [p[2] for p in pts]
        szs   = np.array([p[3] for p in pts])
        # glow (larger, low alpha)
        ax.scatter(xs, ys, s=szs * 2.8, c=[(*c[:3], c[3] * 0.18) for c in cs],
                   edgecolors="none", zorder=4)
        ax.scatter(xs, ys, s=szs, c=cs,
                   edgecolors="none", zorder=5)

    # legend
    from matplotlib.patches import Patch
    leg_els = [Patch(facecolor=(*CMAP[k], 1), label=lbl, edgecolor="none")
               for k, lbl in [("DS","DS = n+1"), ("NS","NS = 2^n"),
                               ("PS","PS ~ 2.325^n"), ("UN","tense")]]
    ax.legend(handles=leg_els, loc="upper left",
              facecolor=(0.07,0.08,0.13,0.80),
              edgecolor=(0.25,0.25,0.35,0.5),
              labelcolor="white", fontsize=8,
              handlelength=1.0, borderpad=0.6)

    # tension meter — thin bar at right edge
    tension_norm = min(1.0, math.log1p(fs["tension"]) / math.log1p(3000))
    bar_h = (y_top - y_bot - 0.6) * tension_norm
    ax.add_patch(plt.Rectangle(
        (X_SPREAD/2 + 0.15, y_bot + 0.3), 0.10, bar_h,
        facecolor=(*CMAP["UN"], 0.50), edgecolor="none", zorder=6
    ))
    ax.text(X_SPREAD/2 + 0.20, y_bot + 0.1, "T",
            color=(0.55, 0.28, 0.28, 0.50), fontsize=6.5, ha="center")

    ax.text(0, y_top - 0.3,
            "Directional Preordered Monoid  |  a -> b -> c",
            color=(0.45, 0.45, 0.55), fontsize=9,
            ha="center", va="top", zorder=7)

    plt.savefig(out_path, dpi=dpi, bbox_inches="tight",
                facecolor=fig.get_facecolor(), pad_inches=0)
    plt.close(fig)


# ── main ──────────────────────────────────────────────────────────────────────
def main():
    MAX_N      = 6
    FPS        = 30
    BASE       = os.path.dirname(__file__)
    FRAMES_DIR = os.path.join(BASE, "frames_living")
    WAV_OUT    = os.path.join(BASE, "living_dpm.wav")
    GIF_OUT    = os.path.join(BASE, "living_dpm.gif")
    MP4_SILENT = os.path.join(BASE, "living_dpm_silent.mp4")
    MP4_OUT    = os.path.join(BASE, "living_dpm.mp4")

    os.makedirs(FRAMES_DIR, exist_ok=True)

    print("simulating…")
    events, particles, total_t = build_event_timeline(MAX_N)
    print(f"  {len(events)} events over {total_t:.1f}s")

    print("building visual timeline…")
    frame_states, tension_fn = build_visual_timeline(events, particles, total_t, fps=FPS)
    print(f"  {len(frame_states)} frames")

    print("rendering frames…")
    png_paths = []
    for fi, fs in enumerate(frame_states):
        path = os.path.join(FRAMES_DIR, f"f{fi:05d}.png")
        render_frame(fs, path, dpi=100)
        png_paths.append(path)
        if fi % 30 == 0:
            print(f"  {fi}/{len(frame_states)}", flush=True)

    print("generating audio…")
    audio = generate_audio(events, total_t, tension_fn)
    write_wav(audio, WAV_OUT)

    print("building GIF (no audio)…")
    from PIL import Image
    imgs = [Image.open(p) for p in png_paths[::2]]   # every other frame for GIF size
    imgs_q = [img.quantize(colors=256, method=Image.Quantize.FASTOCTREE) for img in imgs]
    imgs_q[0].save(GIF_OUT, save_all=True, append_images=imgs_q[1:],
                   duration=int(1000 / (FPS / 2)), loop=0, optimize=False)
    print(f"  -> {GIF_OUT}")

    # MP4 + audio via ffmpeg
    ffmpeg = shutil.which("ffmpeg") or next(
        (p for p in [r"C:\ffmpeg\bin\ffmpeg.exe",
                     r"C:\Program Files\ffmpeg\bin\ffmpeg.exe",
                     os.path.expanduser(r"~\scoop\apps\ffmpeg\current\bin\ffmpeg.exe")]
         if os.path.isfile(p)), None
    )
    if ffmpeg:
        print("stitching silent MP4…")
        subprocess.run([ffmpeg, "-y", "-framerate", str(FPS),
                        "-i", os.path.join(FRAMES_DIR, "f%05d.png"),
                        "-vf", "scale=trunc(iw/2)*2:trunc(ih/2)*2",
                        "-c:v", "libx264", "-pix_fmt", "yuv420p", "-crf", "17",
                        MP4_SILENT], check=True)
        print("adding audio…")
        subprocess.run([ffmpeg, "-y",
                        "-i", MP4_SILENT, "-i", WAV_OUT,
                        "-c:v", "copy", "-c:a", "aac", "-shortest",
                        MP4_OUT], check=True)
        print(f"  -> {MP4_OUT}")
    else:
        print("\nno ffmpeg — to make MP4 with audio:")
        print(f"  ffmpeg -framerate {FPS} -i {FRAMES_DIR}/f%05d.png "
              f"-c:v libx264 -pix_fmt yuv420p {MP4_SILENT}")
        print(f"  ffmpeg -i {MP4_SILENT} -i {WAV_OUT} -c:v copy -c:a aac {MP4_OUT}")

    print("\ndone.")


if __name__ == "__main__":
    main()
