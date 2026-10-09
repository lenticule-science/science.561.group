---
author: em senn (literate extraction prepared by assistant)
title: RITM Simulator (single-hop C) — Literate Source
date-created: 2025-10-17
description: A literate, single-file presentation of the RITM simulator corresponding to the attached sim.py{.verbatim}, with one function per subtree.
---

A literate, single-file presentation of the *RITM* simulator corresponding to the attached `sim.py`{.verbatim}, with one function per subtree. Each subtree opens with a one-sentence description that ties the operation to our formalism, with a pointer into the papers **(RITM)** and **(Physics)**.

- Tangle target: `ritm-sim.py`{.verbatim} (safe target; won’t overwrite your uploaded `sim.py`{.verbatim}).
- Modal tick: atomic `C_graph = box_step ∘ diamond_step`{.verbatim} (single-hop nuclei).

# Preamble

This module implements a granular **single-hop** comonadic tick $C=□∘◇$ on boolean matrices representing directed graphs and relations (RITM §3.1.4; Physics §1).

``` python
from typing import List, Tuple
```

# Boolean matrix algebra (base category)

These operations form the boolean-linear substrate for relations and spaces in our constructive model (RITM §3.1.4 “Explicit Action”).

## `zeros`{.verbatim} — allocate blank boolean matrix {#zeros-allocate-blank-boolean-matrix}

Allocate an n×m zero matrix used throughout the simulator (RITM §3.1.4).

``` python
def zeros(n:int,m:int)->List[List[int]]:
    return [[0]*m for _ in range(n)]
```

## `transpose`{.verbatim} — linear dual along hom-swapping {#transpose-linear-dual-along-hom-swapping}

Swap axes of a matrix, corresponding to direction reversal on a digraph (RITM §3.1.4).

``` python
def transpose(A:List[List[int]])->List[List[int]]:
    return [list(row) for row in zip(*A)]
```

## `mat_bool_or`{.verbatim} — pointwise join (∨) of relations {#mat_bool_or-pointwise-join-of-relations}

Compute the boolean union of two relations with identical shape (RITM §3.1.4).

``` python
def mat_bool_or(A:List[List[int]],B:List[List[int]])->List[List[int]]:
    n,m=len(A),len(A[0])
    return [[1 if (A[i][j] or B[i][j]) else 0 for j in range(m)] for i in range(n)]
```

## `mat_bool_mul`{.verbatim} — relational composition (∨∧) {#mat_bool_mul-relational-composition}

Boolean matrix product encoding “there exists a path via t” (RITM §3.1.4).

``` python
def mat_bool_mul(A:List[List[int]],B:List[List[int]])->List[List[int]]:
    n,k=len(A),len(A[0]); m=len(B[0])
    C=zeros(n,m)
    for i in range(n):
        for j in range(m):
            for t in range(k):
                if A[i][t] and B[t][j]:
                    C[i][j]=1; break
    return C
```

## `mat_xor`{.verbatim} — symmetric difference (⊕) on entries {#mat_xor-symmetric-difference-on-entries}

Pointwise XOR, used to form the residual defect ρ (Physics §4.2).

``` python
def mat_xor(A:List[List[int]],B:List[List[int]])->List[List[int]]:
    n,m=len(A),len(A[0])
    return [[A[i][j]^B[i][j] for j in range(m)] for i in range(n)]
```

## `count_ones`{.verbatim} — Hamming weight {#count_ones-hamming-weight}

Count active entries to measure energy and coherence (Physics §4.2).

``` python
def count_ones(A:List[List[int]])->int:
    return sum(sum(r) for r in A)
```

## `show_matrix`{.verbatim} — pretty-print a matrix {#show_matrix-pretty-print-a-matrix}

Render a matrix for logs and debugging (RITM §3.1.4).

``` python
def show_matrix(M:List[List[int]])->str:
    return "\n".join(" ".join(str(x) for x in row) for row in M)
```

# Modal nuclei and comonadic tick

We realize single-hop nuclei □ and ◇ and their comonadic product C=□∘◇ (Physics §1–2).

## `add_reflexive`{.verbatim} — add diagonal identities {#add_reflexive-add-diagonal-identities}

Insert identity edges to enforce reflexivity in closure steps (RITM Def. 2.2; Physics §2.1).

``` python
def add_reflexive(A:List[List[int]])->List[List[int]]:
    n=len(A); C=[row[:] for row in A]
    for i in range(n): C[i][i]=1
    return C
```

## `box_step`{.verbatim} — one-hop □ (forward nucleus) {#box_step-one-hop-forward-nucleus}

Forward single-hop closure with reflexivity as nucleus □ (Physics §1 “Modal Foundations”).

``` python
def box_step(A:List[List[int]])->List[List[int]]:
    """□: one-hop forward closure + reflexivity."""
    return add_reflexive(mat_bool_or(A, mat_bool_mul(A, A)))
```

## `diamond_step`{.verbatim} — one-hop ◇ (backward nucleus) {#diamond_step-one-hop-backward-nucleus}

Backward single-hop closure via transpose-conjugation (Physics §1; RITM §2.2.3).

``` python
def diamond_step(A:List[List[int]])->List[List[int]]:
    """◇: one-hop backward closure + reflexivity (via transpose)."""
    return transpose(box_step(transpose(A)))
```

## `C_graph`{.verbatim} — atomic comonadic tick C=□∘◇ {#c_graph-atomic-comonadic-tick-c}

Compose nuclei to obtain the comonad’s action on spaces (Physics §1–2).

``` python
def C_graph(Y:List[List[int]])->List[List[int]]:
    """Atomic comonadic tick: C = □∘◇ with each nucleus single-hop."""
    return box_step(diamond_step(Y))
```

# Measures: residual ρ, action S, coherence σ

We compute the linearized defect ρ and its induced measures (Physics §4 “Defect and Linear Reflection”).

## `apply_C_on_codomain`{.verbatim} — push R through C(Y) {#apply_c_on_codomain-push-r-through-cy}

Apply C to the codomain topology and propagate R forward (Physics §4.2).

``` python
def apply_C_on_codomain(R:List[List[int]], Y:List[List[int]])->List[List[int]]:
    CY = C_graph(Y)
    return mat_bool_mul(R, CY)
```

## `residual_rho`{.verbatim} — categorical residual ρ {#residual_rho-categorical-residual-ρ}

Compute ρ := (R∘C(Y)) ⊕ R, the stabilization defect (Physics Thm 4.3).

``` python
def residual_rho(R:List[List[int]], Y:List[List[int]])->List[List[int]]:
    # ρ = (R ∘ C(Y)) ⊕ R
    return mat_xor(apply_C_on_codomain(R, Y), R)
```

## `action_S`{.verbatim} — quadratic energy from ρ {#action_s-quadratic-energy-from-ρ}

Action S := ½‖ρ‖₁, minimized at stabilized cells (Physics Cor. 4.4).

``` python
def action_S(R:List[List[int]], Y:List[List[int]])->float:
    return 0.5 * float(count_ones(residual_rho(R, Y)))
```

## `sigma_score`{.verbatim} — coherence fraction σ∈\[0,1\] {#sigma_score-coherence-fraction-σ01}

Coherence σ := 1 − (‖ρ‖₁ / \|R\|) with σ=1 at stabilization (Physics §4.2).

``` python
def sigma_score(R:List[List[int]], Y:List[List[int]])->float:
    rho = residual_rho(R, Y)
    n=len(rho); m=len(rho[0]) if n>0 else 0
    tot = n*m
    return 1.0 if tot==0 else 1.0 - count_ones(rho)/float(tot)
```

# Evolution (pure, minimal)

One atomic tick per step with topology imprint from RᵀR; stop when σ and ΔS hit thresholds (Physics §2.2; §4.4).

## `evolve_step`{.verbatim} — single step of internal C-dynamics {#evolve_step-single-step-of-internal-c-dynamics}

Advance R by C(Y) and Y by C(Y) ∪ RᵀR; return measures (Physics §2; §4).

``` python
def evolve_step(R:List[List[int]], Y:List[List[int]])->Tuple[List[List[int]],List[List[int]],float,float]:
    """
    One internal application of C (no externalities).
    Update R on codomain; update Y by its comonadic closure plus RᵀR imprint.
    """
    CY = C_graph(Y)
    Rn = mat_bool_mul(R, CY)
    Yn = mat_bool_or(CY, mat_bool_mul(transpose(R), R))
    S  = action_S(Rn, Yn)
    sig = sigma_score(Rn, Yn)
    return Rn, Yn, S, sig
```

## `evolve`{.verbatim} — iterate until stabilization or limit {#evolve-iterate-until-stabilization-or-limit}

Iterate `evolve_step`{.verbatim} until σ≥σ\* and \|ΔS\|≤ε, or a step cap (Physics §2; §4).

``` python
def evolve(
    R0: List[List[int]],
    Y0: List[List[int]],
    *,
    sigma_target: float = 1.0,
    delta_S_max: float = 0.0,
    step_limit: int = 100
) -> List[Tuple[List[List[int]], List[List[int]], float, float]]:
    R, Y = [row[:] for row in R0], [row[:] for row in Y0]
    hist = []
    prev_S = None

    for step in range(step_limit):
        R, Y, S, sigma = evolve_step(R, Y)
        hist.append((R, Y, S, sigma))

        if prev_S is not None:
            if sigma >= sigma_target and abs(S - prev_S) <= delta_S_max:
                break
        prev_S = S

    return hist
```

# Seed topologies

Canonical sparse seeds used in tests and demos (RITM §3.1.4).

## `line_graph`{.verbatim} — directed line {#line_graph-directed-line}

Adjacency with edges i→i+1 for i\<n−1 (RITM §3.1.4).

``` python
def line_graph(n:int)->List[List[int]]:
    return [[1 if j==i+1 else 0 for j in range(n)] for i in range(n)]
```

## `cycle_graph`{.verbatim} — directed cycle {#cycle_graph-directed-cycle}

Adjacency with edges i→(i+1) mod n (RITM §3.1.4).

``` python
def cycle_graph(n:int)->List[List[int]]:
    return [[1 if j==(i+1)%n else 0 for j in range(n)] for i in range(n)]
```

# Demo (script entry)

Reproduce the `__main__`{.verbatim} experiment exactly as in the attached file, showcasing stabilization logs (Physics §7 “Witness Topos” as empirical environment).

``` python
if __name__ == "__main__":
    # Size of the relational domain
    n = 10

    # Seed topology (directed line)
    Y0 = line_graph(n)

    # Seed relation (identity + next-edge)
    R0 = [[1 if (j == i or j == i + 1) else 0 for j in range(n)] for i in range(n)]

    # Display initial condition
    print("Initial topology Y₀:")
    print(show_matrix(Y0))
    print("\n--- Beginning comonadic evolution ---")

    # Run until stabilization or safety limit
    hist = evolve(
        R0,
        Y0,
        sigma_target=1.0,      # stop when coherence σ ≥ 1.0
        delta_S_max=0.0,       # and energy change ΔS ≤ 0.0
        step_limit=50          # fallback hard limit
    )

    # Per-step log
    for t, (_, _, S, sigma) in enumerate(hist):
        print(f"t={t:02d}  S={S:.6f}  σ={sigma:.6f}")

    # Report termination summary
    final_step = len(hist) - 1
    final_S = hist[-1][2]
    final_sigma = hist[-1][3]

    if final_sigma >= 1.0 and final_S == hist[-1][2]:
        reason = "stabilization condition reached"
    elif final_step + 1 >= 50:
        reason = "safety step-limit reached"
    else:
        reason = "custom threshold satisfied"

    print(f"\nEvolution halted after {final_step} steps ({reason}).")
    print(f"  Final S = {final_S:.6f}")
    print(f"  Final σ = {final_sigma:.6f}")

    print(f"\nFinal topology Y_{final_step}:")
    print(show_matrix(hist[-1][1]))
```
