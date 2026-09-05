#!/usr/bin/env python3
"""
The Relational Hyperverse — 60 Second Video
============================================
A mathematical animation exploring how a single axiom (σ∘Δ = Δ∘σ) forces
the golden ratio at two independent structural levels, generates the universe
from itself, and resolves dark matter, dark energy, and the Hubble tension —
all as theorems, not assumptions.

Requirements:
    pip install manim          (already installed if you got this far)
    No LaTeX installation needed — all text uses unicode math characters.

Run (high quality, ~10 min render):
    manim -pqh hyperverse_video.py RelationalHyperverseVideo

Run (preview, fast):
    manim -pql hyperverse_video.py RelationalHyperverseVideo

Run (single last-frame PNG, instant):
    manim -s -ql hyperverse_video.py RelationalHyperverseVideo

Output: media/videos/hyperverse_video/480p15/RelationalHyperverseVideo.mp4
"""

from manim import *
import numpy as np

# ── Palette ──────────────────────────────────────────────────────────────────
_BG     = "#06080E"
_PAST   = "#FF3355"   # σ  — saturation, closing the past
_FUTR   = "#2299FF"   # Δ  — transfer, witnessing the future
_SETTL  = "#FFD700"   # H* — the fixed, settled, real layer
_REL    = "#33FFCC"   # history / relation edges
_UNIV   = "#BB55FF"   # universe / topos level
_DIM    = "#556677"
_SOFT   = "#D8E8F8"
_DM     = "#9966DD"   # dark matter (unsettled spectral mass)
_DE     = "#FF8833"   # dark energy (vacuum energy)
PHI = (1 + np.sqrt(5)) / 2   # 1.6180…


# ── Helpers ──────────────────────────────────────────────────────────────────

def history_label(*parts, font_size=22, **kw):
    """Text mob with unicode math, no LaTeX needed."""
    return Text(*parts, font_size=font_size, **kw)


def heyting_diamond(center=ORIGIN, scale=1.0):
    """Five-node Hasse diagram: ⊥ < a < ⊤, ⊥ < b < ⊤."""
    s = scale
    coords = {
        "top": center + UP   * 1.4 * s,
        "a":   center + LEFT * 0.9 * s + UP * 0.4 * s,
        "b":   center + RIGHT* 0.9 * s + UP * 0.4 * s,
        "bot": center + DOWN * 0.6 * s,
    }
    edges = VGroup(
        Line(coords["bot"], coords["a"],   stroke_width=1.5, color=_DIM),
        Line(coords["bot"], coords["b"],   stroke_width=1.5, color=_DIM),
        Line(coords["a"],   coords["top"], stroke_width=1.5, color=_DIM),
        Line(coords["b"],   coords["top"], stroke_width=1.5, color=_DIM),
    )
    dots = VGroup(*[Dot(p, radius=0.09 * s, color=_SOFT) for p in coords.values()])
    labels = VGroup(
        Text("⊤", font_size=int(20*s), color=_SOFT).next_to(coords["top"], UP*0.4),
        Text("a", font_size=int(18*s), color=_SOFT).next_to(coords["a"],   LEFT*0.4),
        Text("b", font_size=int(18*s), color=_SOFT).next_to(coords["b"],   RIGHT*0.4),
        Text("⊥", font_size=int(20*s), color=_SOFT).next_to(coords["bot"], DOWN*0.4),
    )
    return VGroup(edges, dots, labels), coords


def fibonacci_bars(n=9, width=0.40, x_start=-4.3, y_base=-2.6):
    """Fibonacci bar chart, colored from _FUTR to _SETTL."""
    fibs = [1, 1]
    while len(fibs) < n:
        fibs.append(fibs[-1] + fibs[-2])
    max_f = fibs[-1]
    bar_colors = color_gradient([_FUTR, _SETTL], n)
    bars, lbls = VGroup(), VGroup()
    for i, f in enumerate(fibs):
        h = 3.0 * f / max_f
        rect = Rectangle(
            width=width, height=h,
            fill_color=bar_colors[i],
            fill_opacity=0.85, stroke_width=0.8, stroke_color=_SOFT,
        )
        rect.move_to([x_start + i * (width + 0.11), y_base + h / 2, 0])
        bars.add(rect)
        lbl = Text(str(f), font_size=10, color=_DIM)
        lbl.next_to(rect, DOWN, buff=0.06)
        lbls.add(lbl)
    return bars, lbls


# ── Main Scene ────────────────────────────────────────────────────────────────

class RelationalHyperverseVideo(Scene):
    def construct(self):
        self.camera.background_color = _BG
        self.act1_relations()
        self.act2_nuclear_quartet()
        self.act3_self_generation()
        self.act4_golden_forced()
        self.act5_physics()
        self.act6_tower()
        self.act7_recursion()

    # ── ACT 1: The Primitive  (≈9 s) ─────────────────────────────────────────
    def act1_relations(self):
        title = Text("THE RELATIONAL HYPERVERSE",
                     font_size=34, color=_SOFT, weight=BOLD)
        title.to_edge(UP, buff=0.45)
        self.play(Write(title), run_time=1.2)

        # History nodes
        np.random.seed(7)
        pts = [np.array([np.random.uniform(-5.3, 5.3),
                          np.random.uniform(-2.5, 1.1), 0]) for _ in range(13)]
        dots = VGroup(*[Dot(p, radius=0.07, color=_REL) for p in pts])
        self.play(
            LaggedStart(*[FadeIn(d, scale=2.5) for d in dots], lag_ratio=0.06),
            run_time=2.0,
        )

        # Directed arrows — the history category T
        pairs = [(0,1),(0,4),(1,3),(1,5),(2,5),(3,6),(4,5),(4,7),
                 (5,6),(5,8),(6,9),(7,8),(7,10),(8,11),(9,12)]
        arrows = VGroup(*[
            Arrow(pts[i], pts[j], buff=0.10, color=_REL,
                  stroke_width=1.4, tip_length=0.12,
                  max_tip_length_to_length_ratio=0.4)
            for i, j in pairs
        ])
        self.play(
            LaggedStart(*[GrowArrow(a) for a in arrows], lag_ratio=0.07),
            run_time=2.4,
        )

        cap = Text("Relations first.  Objects after.",
                   font_size=22, color=_DIM)
        cap.to_edge(DOWN, buff=0.55)
        self.play(FadeIn(cap, shift=UP * 0.12), run_time=0.6)
        self.wait(1.4)

        t_lbl = Text("history category  T", font_size=18, color=_REL)
        t_lbl.move_to(RIGHT * 3.5 + DOWN * 2.8)
        self.play(FadeIn(t_lbl), run_time=0.4)
        self.wait(0.6)

        self.play(FadeOut(VGroup(title, dots, arrows, cap, t_lbl)), run_time=0.7)

    # ── ACT 2: Nuclear Quartet  (≈13 s) ──────────────────────────────────────
    def act2_nuclear_quartet(self):
        header = Text("THE FIBER NUCLEAR QUARTET",
                      font_size=26, color=_SETTL, weight=BOLD)
        header.to_edge(UP, buff=0.45)
        self.play(Write(header), run_time=0.8)

        # Heyting algebra diamond
        c = LEFT * 3.2 + DOWN * 0.3
        diag, coords = heyting_diamond(center=c, scale=0.95)
        ht = Text("Hₜ", font_size=22, color=_SOFT)
        ht.next_to(diag, RIGHT, buff=0.15)
        self.play(Create(diag), FadeIn(ht), run_time=1.3)
        self.wait(0.3)

        # σ: saturation (past, red)
        sig_txt = Text("σₜ : Hₜ → Hₜ", font_size=21, color=_PAST)
        sig_txt.move_to(RIGHT * 1.8 + UP * 2.1)
        sig_dsc = Text("Saturate — close the past", font_size=16, color=_PAST)
        sig_dsc.next_to(sig_txt, DOWN, buff=0.16)
        self.play(Write(sig_txt), FadeIn(sig_dsc), run_time=0.9)

        sig_arrows = VGroup(
            Arrow(coords["bot"], coords["a"],   color=_PAST, buff=0.11,
                  stroke_width=2.5, tip_length=0.15),
            Arrow(coords["a"],   coords["top"], color=_PAST, buff=0.11,
                  stroke_width=2.5, tip_length=0.15),
        )
        self.play(LaggedStart(*[GrowArrow(a) for a in sig_arrows], lag_ratio=0.4),
                  run_time=1.1)
        self.wait(0.4)
        self.play(FadeOut(sig_arrows), run_time=0.3)

        # Δ: transfer (future, blue)
        del_txt = Text("Δₜ : Hₜ → Hₜ", font_size=21, color=_FUTR)
        del_txt.move_to(RIGHT * 1.8 + UP * 0.7)
        del_dsc = Text("Transfer — witness the future", font_size=16, color=_FUTR)
        del_dsc.next_to(del_txt, DOWN, buff=0.16)
        self.play(Write(del_txt), FadeIn(del_dsc), run_time=0.9)

        del_arrows = VGroup(
            Arrow(coords["bot"], coords["b"],   color=_FUTR, buff=0.11,
                  stroke_width=2.5, tip_length=0.15),
            Arrow(coords["b"],   coords["top"], color=_FUTR, buff=0.11,
                  stroke_width=2.5, tip_length=0.15),
        )
        self.play(LaggedStart(*[GrowArrow(a) for a in del_arrows], lag_ratio=0.4),
                  run_time=1.1)
        self.wait(0.4)
        self.play(FadeOut(del_arrows), run_time=0.3)

        # The Commutativity Axiom
        box = SurroundingRectangle(VGroup(sig_txt, del_txt),
                                   color=_SETTL, buff=0.22, corner_radius=0.08)
        com = Text("σₜ ∘ Δₜ  =  Δₜ ∘ σₜ", font_size=26, color=_SETTL)
        com.next_to(box, DOWN, buff=0.28)
        axm = Text("A X I O M", font_size=13, color=_SETTL, weight=BOLD)
        axm.next_to(com, DOWN, buff=0.1)
        self.play(Create(box), Write(com), FadeIn(axm), run_time=1.2)
        self.wait(0.5)

        # H* lights up
        glow = Dot(coords["top"], radius=0.20, color=_SETTL, fill_opacity=0.0)
        hs_lbl = Text("Hₜ*", font_size=22, color=_SETTL)
        hs_lbl.next_to(coords["top"], RIGHT, buff=0.28)
        hs_eq = Text("Hₜ* = Fix(σₜ) ∩ Fix(Δₜ)", font_size=19, color=_SETTL)
        hs_eq.to_edge(DOWN, buff=0.55)
        self.play(
            glow.animate.set_fill(opacity=0.85),
            FadeIn(hs_lbl), Write(hs_eq),
            run_time=1.1,
        )
        settled = Text("What is settled.", font_size=19, color=_SETTL)
        settled.next_to(hs_eq, DOWN, buff=0.18)
        self.play(FadeIn(settled), run_time=0.5)
        self.wait(0.8)

        self.play(
            FadeOut(VGroup(header, diag, ht,
                           sig_txt, sig_dsc, del_txt, del_dsc,
                           box, com, axm,
                           glow, hs_lbl, hs_eq, settled)),
            run_time=0.7,
        )

    # ── ACT 3: Self-Generation  (≈11 s) ──────────────────────────────────────
    def act3_self_generation(self):
        header = Text("SELF-GENERATION",
                      font_size=26, color=_UNIV, weight=BOLD)
        header.to_edge(UP, buff=0.45)
        self.play(FadeIn(header, shift=DOWN * 0.15), run_time=0.7)

        # Atoms 𝒜
        a_lbl = Text("𝒜", font_size=30, color=_REL)
        a_lbl.move_to(LEFT * 4.5)
        atoms = VGroup(*[
            Dot(LEFT * 4.5 + np.array([np.cos(i*TAU/5)*0.44,
                                        np.sin(i*TAU/5)*0.44, 0]),
                radius=0.08, color=_REL)
            for i in range(5)
        ])
        a_dsc = Text("atoms  (representables)", font_size=16, color=_DIM)
        a_dsc.next_to(atoms, DOWN, buff=0.3)
        self.play(FadeIn(a_lbl),
                  LaggedStart(*[FadeIn(a, scale=3) for a in atoms], lag_ratio=0.12),
                  FadeIn(a_dsc), run_time=1.3)

        # Depth filtration: nested circles
        depth_c = RIGHT * 0.3 + DOWN * 0.2
        radii  = [0.45, 0.85, 1.30, 1.75]
        colors = [_REL, _FUTR, _UNIV, _SETTL]
        names  = ["R₀", "R₁", "R₂", "R₃"]
        circles = VGroup()
        c_lbls  = VGroup()
        ug_txt  = Text("Uɢ", font_size=22, color=_SOFT)
        ug_txt.move_to(depth_c + UP * 0.15)
        self.play(FadeIn(ug_txt), run_time=0.4)

        for r, col, name in zip(radii, colors, names):
            circ = Circle(radius=r, color=col,
                          fill_opacity=0.0, stroke_width=1.8 + r * 0.4)
            circ.move_to(depth_c)
            circles.add(circ)
            lbl = Text(name, font_size=16, color=col)
            lbl.move_to(depth_c + np.array([r + 0.17, 0, 0]))
            c_lbls.add(lbl)
            self.play(Create(circ), FadeIn(lbl), run_time=0.65)

        chain = Text("R₀ ↪ R₁ ↪ R₂ ↪ ···", font_size=19, color=_DIM)
        chain.to_edge(DOWN, buff=1.5)
        self.play(FadeIn(chain), run_time=0.5)
        self.wait(0.4)

        # Fixed-point equation
        fixed = Text("R  =  Uɢ(R)", font_size=46, color=_SETTL)
        fixed.to_edge(DOWN, buff=0.55)
        lfp = Text("The universe is its own least fixed point.",
                   font_size=17, color=_DIM)
        lfp.next_to(fixed, DOWN, buff=0.22)

        outer_gold = circles[-1].copy().set_color(_SETTL).set_stroke(width=4)
        self.play(
            Write(fixed),
            Transform(circles[-1], outer_gold),
            FadeOut(chain),
            run_time=1.2,
        )
        self.play(FadeIn(lfp), run_time=0.7)
        self.wait(1.1)

        self.play(
            FadeOut(VGroup(header, a_lbl, atoms, a_dsc,
                           circles, c_lbls, ug_txt, fixed, lfp)),
            run_time=0.7,
        )

    # ── ACT 4: The Golden Ratio is Forced  (≈12 s) ───────────────────────────
    def act4_golden_forced(self):
        header = Text("THE GOLDEN RATIO IS FORCED",
                      font_size=26, color=_SETTL, weight=BOLD)
        header.to_edge(UP, buff=0.45)
        self.play(FadeIn(header, shift=DOWN * 0.15), run_time=0.7)

        # Transfer matrix
        M = Text("M  =  ⎡1  1⎤\n          ⎣1  0⎦",
                 font_size=28, color=_SOFT)
        M.move_to(LEFT * 2.8 + UP * 0.8)
        self.play(Write(M), run_time=1.0)

        # Two independent sources
        fiber_lbl = Text("fiber level  (σ∘Δ = Δ∘σ)", font_size=16, color=_PAST)
        tower_lbl = Text("tower level  (shadow resolution)", font_size=16, color=_FUTR)
        fiber_lbl.next_to(M, UP, buff=0.38).shift(LEFT * 0.3)
        tower_lbl.next_to(M, DOWN, buff=0.38).shift(LEFT * 0.3)

        fa = Arrow(fiber_lbl.get_right(), M.get_corner(UL) + RIGHT * 0.4,
                   color=_PAST, buff=0.05, stroke_width=2, tip_length=0.13)
        ta = Arrow(tower_lbl.get_right(), M.get_corner(DL) + RIGHT * 0.4,
                   color=_FUTR, buff=0.05, stroke_width=2, tip_length=0.13)
        self.play(FadeIn(fiber_lbl, shift=RIGHT*0.2), GrowArrow(fa), run_time=0.7)
        self.play(FadeIn(tower_lbl, shift=RIGHT*0.2), GrowArrow(ta), run_time=0.7)

        note = Text("Two independent sources.  Same matrix.", font_size=16, color=_SETTL)
        note.next_to(M, RIGHT, buff=0.9).shift(UP * 0.1)
        self.play(FadeIn(note), run_time=0.5)
        self.wait(0.5)

        # Characteristic polynomial
        char = Text("λ²  −  λ  −  1  =  0", font_size=30, color=_SOFT)
        char.move_to(RIGHT * 2.2 + UP * 0.8)
        self.play(Write(char), run_time=0.9)

        phi_line = Text("φ  =  (1+√5)/2  ≈  1.618", font_size=26, color=_SETTL)
        phi_line.next_to(char, DOWN, buff=0.45)
        self.play(Write(phi_line), run_time=0.9)
        self.wait(0.3)

        not_chosen = Text("Not chosen.  Forced by the algebra.",
                          font_size=18, color=_SETTL, weight=BOLD)
        not_chosen.next_to(phi_line, DOWN, buff=0.28)
        self.play(FadeIn(not_chosen), run_time=0.6)
        self.wait(0.4)

        self.play(FadeOut(VGroup(fiber_lbl, fa, tower_lbl, ta, note)), run_time=0.4)

        # Fibonacci bars
        bars, bar_lbl = fibonacci_bars()
        fib_t = Text("Fibonacci:  F_{n+1}/F_n  →  φ",
                     font_size=15, color=_DIM)
        fib_t.move_to(LEFT * 1.8 + DOWN * 3.45)
        self.play(
            LaggedStart(*[GrowFromEdge(b, DOWN) for b in bars], lag_ratio=0.09),
            run_time=1.4,
        )
        self.play(FadeIn(bar_lbl), FadeIn(fib_t), run_time=0.5)
        self.wait(0.4)

        # Five extremalities
        ext_lines = [
            "★  minimum Perron–Frobenius eigenvalue  (any prim. 2×2 matrix)",
            "★  most irrational rotation  [0; 1, 1, 1, …]",
            "★  canonical quasicrystal from ℤ²",
            "★  pure point diffraction  supp ⊂ ℤ[φ]",
            "★  Hurwitz approximation extremum",
        ]
        exts = VGroup(*[
            Text(t, font_size=13, color=_SETTL).move_to(
                RIGHT * 2.3 + UP * (1.85 - i * 0.44))
            for i, t in enumerate(ext_lines)
        ])
        self.play(
            LaggedStart(*[FadeIn(t, shift=LEFT*0.15) for t in exts], lag_ratio=0.14),
            run_time=1.5,
        )
        self.wait(0.7)

        self.play(
            FadeOut(VGroup(header, M, char, phi_line, not_chosen,
                           bars, bar_lbl, fib_t, exts)),
            run_time=0.7,
        )

    # ── ACT 5: Physics  (≈11 s) ──────────────────────────────────────────────
    def act5_physics(self):
        header = Text("THE PHYSICS CORRESPONDENCE",
                      font_size=26, color=_SOFT, weight=BOLD)
        header.to_edge(UP, buff=0.45)
        self.play(FadeIn(header, shift=DOWN * 0.15), run_time=0.7)

        # Dark matter = spectral mass
        dm_eq = Text("Mₜ(δ) = Tr(δₜ)", font_size=28, color=_DM)
        dm_eq.move_to(LEFT * 2.8 + UP * 1.6)
        dm_dsc = Text("spectral mass  =  dark matter", font_size=16, color=_DM)
        dm_dsc.next_to(dm_eq, DOWN, buff=0.18)
        dm_inv = Text("invisible to the stable layer", font_size=13, color=_DIM)
        dm_inv.next_to(dm_dsc, DOWN, buff=0.13)

        np.random.seed(13)
        unsettled = VGroup(*[
            Dot(LEFT * 2.8 + np.array([
                np.random.uniform(-1.7, 1.7),
                np.random.uniform(-1.9, -0.2), 0,
            ]), radius=0.055, color=_DM, fill_opacity=0.7)
            for _ in range(22)
        ])

        self.play(Write(dm_eq), FadeIn(dm_dsc), run_time=0.9)
        self.play(
            LaggedStart(*[FadeIn(d, scale=2) for d in unsettled], lag_ratio=0.04),
            run_time=0.7,
        )
        self.play(FadeIn(dm_inv), run_time=0.35)
        self.wait(0.35)

        # Dark energy: cohomological tunneling
        de_eq = Text("Mₜ(δ) → 0   ⟹   ρ_Λ ↑", font_size=24, color=_DE)
        de_eq.move_to(RIGHT * 2.2 + UP * 1.6)
        de_dsc = Text("cohomological tunneling\n→ dark energy grows",
                      font_size=15, color=_DE)
        de_dsc.next_to(de_eq, DOWN, buff=0.18)
        con_eq = Text("ρ_Λ · ρ_DM^(1/3)  =  const", font_size=20, color=_DE)
        con_eq.next_to(de_dsc, DOWN, buff=0.2)

        self.play(Write(de_eq), FadeIn(de_dsc), run_time=0.9)
        # Animate dots drifting to the right and fading (DM → DE)
        tgt = RIGHT * 2.2 + DOWN * 0.4
        self.play(
            LaggedStart(*[
                d.animate.move_to(tgt + np.random.randn(3) * 0.35)
                          .set_color(_DE)
                          .set_opacity(0.0)
                for d in unsettled
            ], lag_ratio=0.05),
            run_time=1.3,
        )
        self.play(Write(con_eq), run_time=0.6)
        self.wait(0.35)

        # Hubble tension box
        h_box = RoundedRectangle(
            width=10.4, height=2.55, corner_radius=0.18,
            color=_SETTL, fill_color=_BG, fill_opacity=0.95, stroke_width=2,
        )
        h_box.to_edge(DOWN, buff=0.35)
        h_eq = Text("H_late / H_early  =  φ^(1/6)  ≈  1.0835",
                    font_size=28, color=_SETTL)
        h_eq.move_to(h_box.get_center() + UP * 0.35)
        h_obs = Text("observed:  73.04 / 67.4  ≈  1.0837    (0.016 % agreement)",
                     font_size=17, color=_DIM)
        h_obs.next_to(h_eq, DOWN, buff=0.2)
        h_note = Text("Not modelled.  Derived.",
                      font_size=16, color=_SETTL, weight=BOLD)
        h_note.next_to(h_obs, DOWN, buff=0.16)

        self.play(Create(h_box), run_time=0.4)
        self.play(Write(h_eq), run_time=0.9)
        self.play(FadeIn(h_obs), run_time=0.5)
        self.play(FadeIn(h_note), run_time=0.35)
        self.wait(0.9)

        self.play(
            FadeOut(VGroup(header, dm_eq, dm_dsc, dm_inv,
                           de_eq, de_dsc, con_eq,
                           h_box, h_eq, h_obs, h_note)),
            run_time=0.7,
        )

    # ── ACT 6: The Hyperverse Tower  (≈6 s) ──────────────────────────────────
    def act6_tower(self):
        header = Text("THE HYPERVERSE TOWER",
                      font_size=26, color=_UNIV, weight=BOLD)
        header.to_edge(UP, buff=0.45)
        self.play(FadeIn(header, shift=DOWN * 0.15), run_time=0.6)

        levels = [
            ("R⁽⁰⁾ = R",  0.7,  _REL),
            ("R⁽¹⁾",      1.15, _FUTR),
            ("R⁽²⁾",      1.65, _UNIV),
            ("R⁽³⁾",      2.15, _SETTL),
            ("ℋ",          2.70, _SOFT),
        ]
        ctr = DOWN * 0.3
        boxes, box_lbls = VGroup(), VGroup()
        for name, sz, col in levels:
            rect = RoundedRectangle(
                width=sz * 3.2, height=sz * 1.8,
                corner_radius=0.14 * sz,
                color=col, fill_opacity=0.0, stroke_width=1.6,
            )
            rect.move_to(ctr)
            boxes.add(rect)
            lbl = Text(name, font_size=17, color=col)
            lbl.move_to(ctr + np.array([sz * 1.6 + 0.12, 0, 0]))
            box_lbls.add(lbl)
            self.play(Create(rect), FadeIn(lbl), run_time=0.45)

        chain = Text("R ↪ R⁽¹⁾ ↪ R⁽²⁾ ↪ ··· ↪ ℋ",
                     font_size=20, color=_DIM)
        chain.to_edge(DOWN, buff=0.55)
        self.play(FadeIn(chain), run_time=0.5)
        self.wait(0.25)

        meta = Text("ℋ  =  Uℋ(ℋ)", font_size=34, color=_SOFT)
        meta.to_edge(DOWN, buff=1.3)
        self.play(Write(meta), run_time=0.9)
        self.wait(0.8)

        self.play(
            FadeOut(VGroup(header, boxes, box_lbls, chain, meta)),
            run_time=0.7,
        )

    # ── ACT 7: The Recursion  (≈3 s) ─────────────────────────────────────────
    def act7_recursion(self):
        line1 = Text("The program studying relational universes",
                     font_size=22, color=_SOFT)
        line2 = Text("is itself a relational universe.",
                     font_size=22, color=_SETTL, weight=BOLD)
        final = VGroup(line1, line2).arrange(DOWN, buff=0.25)
        final.move_to(ORIGIN)

        self.play(FadeIn(final, shift=UP * 0.25), run_time=0.9)
        self.wait(0.7)

        closing = Text("ℋ  =  Uℋ(ℋ)", font_size=50, color=_SETTL)
        closing.to_edge(DOWN, buff=1.0)
        self.play(Write(closing), run_time=0.7)
        self.wait(0.7)

        self.play(FadeOut(VGroup(final, closing), scale=0.7), run_time=0.8)
