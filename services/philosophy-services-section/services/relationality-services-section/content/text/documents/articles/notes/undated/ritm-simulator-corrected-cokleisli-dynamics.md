---
title: RITM Simulator — Corrected CoKleisli Dynamics {#ritm-simulator-corrected-cokleisli-dynamics}
description: Implements faithful modal closure and residual/action mechanics according to the relational physics (Core §C, Physics §Residual/Action).
---
# RITM Simulator — Corrected CoKleisli Dynamics {#ritm-simulator-corrected-cokleisli-dynamics}

Implements faithful modal closure and residual/action mechanics according to the relational physics (Core §C, Physics §Residual/Action).

## Forward reachability (reflexive transitive closure)

Return the boolean forward reachability matrix F for graph Y where F\[j,k\]=1 iff j→\*k in Y.

``` python
from typing import List

def reach_forward(Y: List[List[int]]) -> List[List[int]]:
    n = len(Y)
    F = [[1 if i==j or Y[i][j] else 0 for j in range(n)] for i in range(n)]
    for k in range(n):
        F = [[1 if F[i][j] or (F[i][k] and F[k][j]) else 0 for j in range(n)] for i in range(n)]
    return F
```

## Backward reachability

Return the boolean backward reachability matrix B for graph Y where B\[j,k\]=1 iff k→\*j in Y.

``` python
def reach_backward(Y: List[List[int]]) -> List[List[int]]:
    F = reach_forward(Y)
    n = len(F)
    B = [[F[k][j] for k in range(n)] for j in range(n)]
    return B
```

## Boolean matrix product

Return boolean (∨/∧) product of A (m×p) and B (p×n).

``` python
def bool_matmul(A: List[List[int]], B: List[List[int]]) -> List[List[int]]:
    m, p, n = len(A), len(A[0]), len(B[0])
    C = [[0]*n for _ in range(m)]
    for i in range(m):
        Ai = A[i]
        for k in range(p):
            if Ai[k]:
                Bk = B[k]
                for j in range(n):
                    C[i][j] = 1 if (C[i][j] or Bk[j]) else 0
    return C
```

## Apply C on the codomain of a relation (Core §C on relations)

Return R lifted to X→C(Y) by expanding each chosen target along C(Y)’s reachability (i.e., columns spread forward then backward under Y).

``` python
def apply_C_on_codomain(R: List[List[int]], Y: List[List[int]]) -> List[List[int]]:
    F = reach_forward(Y)
    B = reach_backward(Y)
    CY = bool_matmul(F, B)
    RC = bool_matmul(R, CY)
    return RC
```

## □ on relations (propagate forward along Y) {#on-relations-propagate-forward-along-y}

Return the relation whose columns are closed forward along Y: (□R)\[i,\*\] = R\[i,\*\]·reach<sub>forward</sub>(Y).

``` python
def box_rel(R: List[List[int]], Y: List[List[int]]) -> List[List[int]]:
    F = reach_forward(Y)
    return bool_matmul(R, F)
```

## ◇ on relations (propagate backward along Y) {#on-relations-propagate-backward-along-y}

Return the relation whose columns are closed backward along Y: (◇R)\[i,\*\] = R\[i,\*\]·reach<sub>backward</sub>(Y).

``` python
def diamond_rel(R: List[List[int]], Y: List[List[int]]) -> List[List[int]]:
    B = reach_backward(Y)
    return bool_matmul(R, B)
```

## Modal iteration step (coKleisli shadow)

Return next relation r<sub>t+1</sub> by applying □ then ◇ in the codomain: r<sub>t+1</sub> = r<sub>t</sub> · (reach<sub>forward</sub>(Y) · reach<sub>backward</sub>(Y)).

``` python
def iterate_modal(R_t: List[List[int]], Y: List[List[int]]) -> List[List[int]]:
    F = reach_forward(Y)
    B = reach_backward(Y)
    K = bool_matmul(F, B)
    return bool_matmul(R_t, K)
```

## Residual ρ (physics: “Cr − r” in the boolean shadow) {#residual-ρ-physics-cr-r-in-the-boolean-shadow}

Return the boolean residual matrix ρ = (C·R) ⊖ R where ⊖ is XOR bitwise.

``` python
def residual_rho(R: List[List[int]], Y: List[List[int]]) -> List[List[int]]:
    RC = apply_C_on_codomain(R, Y)
    m, n = len(R), len(R[0])
    return [[1 if (RC[i][j] ^ R[i][j]) else 0 for j in range(n)] for i in range(m)]
```

## Action S (Euler–Lagrange: on-shell iff ρ=0)

Return scalar action S as the density of ones in ρ (i.e., $\|$ρ\|\|₁ divided by matrix size).

``` python
def action_S(R: List[List[int]], Y: List[List[int]]) -> float:
    rho = residual_rho(R, Y)
    m, n = len(rho), len(rho[0])
    ones = sum(sum(row) for row in rho)
    return ones / (m * n) if m and n else 0.0
```

## σ score (stability)

Return σ = 1 − S so that σ=1 iff R is on-shell (stabilized) under C.

``` python
def sigma_score(R: List[List[int]], Y: List[List[int]]) -> float:
    return 1.0 - action_S(R, Y)
```

## Defect rows (equalizer / stabilized rows) {#defect-rows-equalizer-stabilized-rows}

Return list of row indices i whose rows are already on-shell, i.e., (C·R)\[i,\*\] == R\[i,\*\].

``` python
def defect_rows(R: List[List[int]], Y: List[List[int]]) -> list:
    RC = apply_C_on_codomain(R, Y)
    stable = []
    for i, (ri, rci) in enumerate(zip(R, RC)):
        if all((a == b) for a, b in zip(ri, rci)):
            stable.append(i)
    return stable
```

## Simulation loop (energy and sigma log)

Run iterative stabilization, printing E (action S) and σ per step.

``` python
def simulate(R0: List[List[int]], Y: List[List[int]], steps: int = 20) -> None:
    R = R0
    for t in range(steps):
        E = action_S(R, Y)
        sigma = sigma_score(R, Y)
        print(f"Step {t:03d}: E={E:.4f}, σ={sigma:.3f}")
        R = iterate_modal(R, Y)
```

## Self-referential simulation loop (Y<sub>t</sub> = R<sub>tᵀRt</sub>) {#self-referential-simulation-loop-yt-rtᵀrt}

At each step the codomain graph Y<sub>t</sub> is recomputed from the current relation, so the topology emerges endogenously.

``` python
def simulate_self_referential(R0: List[List[int]], steps: int = 20) -> None:
    R = R0
    for t in range(steps):
        # codomain graph from current relation
        Rt = R
        # Y_t = R_tᵀ · R_t  (boolean product)
        Rt_T = list(map(list, zip(*Rt)))
        Yt = bool_matmul(Rt_T, Rt)

        E = action_S(Rt, Yt)
        sigma = sigma_score(Rt, Yt)
        print(f"Step {t:03d}: E={E:.4f}, σ={sigma:.3f}")

        # update relation by modal iteration using its own emergent graph
        R = iterate_modal(Rt, Yt)
```

## Main demonstration (self-referential)

Runs without any external graph; Y<sub>t</sub> evolves from R<sub>t</sub>.

``` python
def main():
    # initial relation (seed)
    R0 = [
        [1,0,0],
        [0,1,0],
        [1,0,1]
    ]

    print("Initial relation:")
    for row in R0:
        print(row)

    print("\nRunning self-referential simulation...\n")
    simulate_self_referential(R0, steps=10)

if __name__ == "__main__":
    main()
```
