---
title: The Jeandel–Rao aperiodicity certificate program
date-created: 2026-06-22
description: This note is the durable record of an exploratory program (originally a Python "aperiodicity lab" + a long proof-agent briefing, both staged in the now-deleted 561-group/triage/).
references:
  - id: andersonputnam1995
    type: article-journal
    author:
      - family: Anderson
        given: J.
      - family: Putnam
        given: I.
    title: Topological invariants for substitution tilings and their associated C*-algebras
    issued:
      date-parts:
        - [1995]
  - id: bargediamondhuntonsadun2008
    type: article
    author:
      - family: Barge
        given: M.
      - family: Diamond
        given: B.
      - family: Hunton
        given: J.
      - family: Sadun
        given: L.
    title: Cohomology of Substitution Tiling Spaces
    number: arXiv:0811.2507
    issued:
      date-parts:
        - [2008]
    URL: https://arxiv.org/abs/0811.2507
    accessed:
      date-parts:
        - [2026, 6, 22]
  - id: greenfeldtao2024
    type: article-journal
    author:
      - family: Greenfeld
        given: Rachel
      - family: Tao
        given: Terence
    title: A counterexample to the periodic tiling conjecture
    container-title: Annals of Mathematics
    volume: 200
    issue: 1
    issued:
      date-parts:
        - [2024]
  - id: husainov2023
    type: article
    author:
      - family: Husainov
        given: A.
    title: Čech cohomology of partially ordered sets
    number: arXiv:2310.05577
    issued:
      date-parts:
        - [2023]
    URL: https://arxiv.org/abs/2310.05577
    accessed:
      date-parts:
        - [2026, 6, 22]
  - id: jeandelrao2015
    type: article
    author:
      - family: Jeandel
        given: Emmanuel
      - family: Rao
        given: Michaël
    title: An aperiodic set of 11 Wang tiles
    number: arXiv:1506.06492
    issued:
      date-parts:
        - [2015]
    URL: https://arxiv.org/abs/1506.06492
    accessed:
      date-parts:
        - [2026, 6, 22]
  - id: labbe2018
    type: article
    author:
      - family: Labbé
        given: Sébastien
    title: Substitutive structure of Jeandel–Rao aperiodic tilings
    number: arXiv:1808.07768
    issued:
      date-parts:
        - [2018]
    URL: https://arxiv.org/abs/1808.07768
    accessed:
      date-parts:
        - [2026, 6, 22]
  - id: smithmyerskaplangoodmanstrauss2023
    type: article
    author:
      - family: Smith
        given: David
      - family: Myers
        given: Joseph Samuel
      - family: Kaplan
        given: Craig S.
      - family: Goodman-Strauss
        given: Chaim
    title: An aperiodic monotile
    number: arXiv:2303.10798
    issued:
      date-parts:
        - [2023]
    URL: https://arxiv.org/abs/2303.10798
    accessed:
      date-parts:
        - [2026, 6, 22]
keywords:
  - aperiodic
  - Jeandel-Rao
  - Wang-tiles
  - cohomology
  - certificate
  - substitution
  - witness
  - Lean
---
# The Jeandel–Rao aperiodicity certificate program

This note is the durable record of an exploratory program (originally a Python "aperiodicity lab" + a long proof-agent briefing, both staged in the now-deleted `561-group/_triage/`).
Its mathematical output is formalized in [`RelMath/Aperiodic/Witness/JeandelRao.lean`](../../../RelMath/Aperiodic/Witness/JeandelRao.lean); this note preserves the program, the source certificate data, and the staged plan so the lab scripts themselves are not needed.

## Thesis

Not a universal tiling solver — a **certificate-extraction program** for structured hierarchical aperiodic systems.
The question: *can we extract small, proof-bearing cohomological witness objects from hierarchical aperiodic systems, in a form a proof assistant can check?* The test object is the **Jeandel–Rao** aperiodic Wang set (11 tiles / 4 colours, the minimal aperiodic Wang set; Jeandel–Rao 2015), with Labbé's (2018) substitutive marker structure as the route to hierarchy.
RelMath supplies the target architecture: `ClosureRuleSystem` (local rules as an immediate-consequence lfp), the Alexandrov/Husainov finite-site bridge, the bitopological "no temporal covers" discipline (cross-stage content lives in morphisms/direct limits, *not* covers), and `AperiodicClassification` (`cl-inv` as a direct limit of finite-stage cohomologies).

The key methodological lesson the lab learned the hard way: **a raw finite `H¹` rank is not a certificate** (periodic systems have nonzero finite `H¹`; large collared `H¹` mostly records decoration/fault-line data).
A certificate must be a specific nonzero closed cochain that survives through marker/desubstitution *maps* toward a persistent direct-limit class.

## What is formalized (two finite bricks)

Both are instances of one abstract `OneVertexComplex` (a finite one-vertex Anderson–Putnam cochain complex: `C0 = ℤ` so `δ⁰ = 0`, hence a nonzero cocycle = a nonzero `H¹` class).
Both proofs are dependency-free, `sorry`-free, axiom-clean (`propext` only).

### Brick 1 — the marker-ring quotient `b3` core (`markerRing_b3_nonzero_h1_projection`)

The marker-ring quotient of the 444 collared Jeandel–Rao states (marker subset `(0,1)`): 4 quotient faces `g0…g3`, 7 quotient edges `q0…q6`, boundary

    ∂g0 = q1 − q2,  ∂g1 = 0,  ∂g2 = q2 − q5,  ∂g3 = −q1 + q5.

The three nonzero columns are dependent (`∂g0 + ∂g2 + ∂g3 = 0`), so `rank ∂ = 2` and `H¹` has rank `7 − 2 = 5`.
The isolated meaningful class is `b3 = q1 + q2 + q5`, supported on the core edges `[1,2,5]`; the nonzero-boundary core faces are `[0,2,3]`.
(Source: `…_b3_incidence_v15.json`.)

### Brick 2 — the decorated witness `φ` (`jeandelRaoMarker01_nonzero_h1_projection`)

The decorated witness subcomplex (marker subset `(0,1)`, vertical marker-domino steps `V/exactly-one → V/first-marker`, macro-marker policy `first-component`), from `jeandel_rao_marker_01_decorated_certificate_v20.json`.
`C1 = ℤ⁶` (`e0…e5`), `C2 = ℤ³` (`f0…f2`), boundary

    ∂f0 = e0 − e1 + e2 − e3,   ∂f1 = ∂f2 = e2 − e3 + e4 − e5,

(`rank ∂ = 2`, `h1 = 4`, `h2 = 1`).
The decorated cochain `φ` has values `[0,0,1,1,0,0]` (supported on `{e2,e3}`); it is closed (`φ(∂f) = 0` on all three faces) and nonzero (`φ e2 = 1`).
`φ` is the *decorated pullback* of `b3`.

## Honest scope (what is NOT proved)

Per the proof-agent briefing, the scope is kept exact.
These bricks do **not** prove:

- that every Jeandel–Rao tiling is non-periodic (JR aperiodicity);
- that the witness subcomplex is the full AP complex of the JR shift / Labbé minimal subsystem;
- that `[φ]` persists through the marker/desubstitution stages to a nonzero **direct-limit** class (the genuine `cl-inv` bridge);
- that the class is a complete `cl-inv` for mutual-local-derivability.

`[φ]` is a *candidate local representative* of a future `cl-inv` projection, not `cl-inv`.
It supplies the first genuine cohomological content under `AperiodicClassification`'s "`cl-inv` can be nonzero in the aperiodic regime" (whose `aperiodicWitness := ⟨1⟩` was a bare free coordinate).
Blueprint: green `thm:jeandel-rao-b3`, `thm:jeandel-rao-witness`; red `thm:jeandel-rao-persistence`.

## The staged persistence plan (climbing the red node)

The open frontier `thm:jeandel-rao-persistence` is reached in stages (each a real brick):

1. the decorated pullback chain map `g` with `g*(b3) = φ`.
  The lab's *successful* decorated pullback is v18/v19 (`…_decorated_b3_pullback_v18.json`: `closed = true`, `nonzero = true`, `coboundary_defects = 0`); the v17 record was the **failed under-decorated** attempt (`closed = false`).
  But this pullback is **geometric, not a transcribable integer matrix**: `decorated_pullback_b3_for_composed_stage` (lab v18, line 3276) labels each decorated edge `(kind, colour, b3-side-value)` and *defines* `φ(edge)` as the `b3`-side-value witnessed on that edge's **tile-completion collar** (`_side_value_in_completion`), with closedness = `Rv − Lv + Tv − Bv = 0` per completed witness face.
  So `φ = g#(b3)` holds by construction, but `g` is mediated by the tile-completion geometry, not a finite `Face → Edge` incidence matrix.
  Formalizing it faithfully therefore requires formalizing the collar/completion machinery — fabricating an integer `g` that merely reproduces `g#(b3) = φ` would be inventing data.
  (Note: `markerRingComplex`/`b3` were cross-checked against `…_certificate_v13.json`, whose `d2` and `H¹` basis confirm `∂g0 = q1−q2, ∂g1 = 0, ∂g2 = q2−q5, ∂g3 = −q1+q5` and `b3 = q1+q2+q5`.)
2. chain maps for each Labbé marker/desubstitution stage (recognizable substitutions, fault-line decorations, shear conjugacy), replacing the crude domino steps;
3. a directed system of witness complexes with those chain maps;
4. compatibility of `[φ]` across the system → nonzero-ness in the colimit (`DirectedSystem` / `Colimit` of `AperiodicClassification`);
5. only then connect to `cl-inv` as a complete MLD invariant.

The incidence audit (`…_b3_incidence_v15.json`) found that the `V/exactly-one` two-step path is the one that sees the **full** `b3` edge support `[1,2,5]` (single steps see only a proper part) — the empirical reason stage 1 uses that path.

## References

- Jeandel & Rao, *An aperiodic set of 11 Wang tiles*, arXiv:1506.06492 (2015).
- Labbé, *Substitutive structure of Jeandel–Rao aperiodic tilings*, arXiv:1808.07768 (2018).
- Smith–Myers–Kaplan–Goodman-Strauss, *An aperiodic monotile*, arXiv:2303.10798 (2023).
- Anderson & Putnam, *Topological invariants for substitution tilings…*, 1995.
- Barge–Diamond–Hunton–Sadun, *Cohomology of Substitution Tiling Spaces*, arXiv:0811.2507 (2008).
- Husainov, *Čech cohomology of partially ordered sets*, arXiv:2310.05577 (2023).
- Greenfeld & Tao, *A counterexample to the periodic tiling conjecture*, Ann. of Math.
  200(1) (2024).
