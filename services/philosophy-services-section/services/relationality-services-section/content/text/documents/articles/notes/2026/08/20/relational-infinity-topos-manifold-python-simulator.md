---
id: 9cf85efc-36d0-4194-85db-fa17af777d01
title: Relational Infinity-Topos Manifold Python Simulator RITM Simulator — Canonical Functional Edition (normalized, referenced)
date-created: 2025-10-14
description: This file tangles to ritm-simulator.py{.verbatim} and implements a finite, functional model of RITM where graphs/relations are 0/1 matrices.
---

# Header

This file tangles to `ritm-simulator.py`{.verbatim} and implements a finite, functional model of RITM where graphs/relations are 0/1 matrices. (Core §2.1)

``` python
from __future__ import annotations
from typing import Iterable, List, Tuple
```

# Utilities

Basic matrix and list helpers used throughout the simulator. (Core §2.1)

## Matrix constructors

### zeros

Create an n×m matrix of zeros. (Core §2.1)

``` python
def zeros(n: int, m: int) -> List[List[int]]:
    return [[0]*m for _ in range(n)]
```

### identity

Return an n×n identity matrix. (Core §3.1)

``` python
def identity(n: int) -> List[List[int]]:
    A = zeros(n, n)
    for i in range(n):
        A[i][i] = 1
    return A
```

## Boolean operations

### mat<sub>boolmul</sub>

Compute boolean matrix product (∨ over ∧), used to realize coKleisli composition at the matrix level. (Physics §2.1)

``` python
def mat_bool_mul(A: List[List[int]], B: List[List[int]]) -> List[List[int]]:
    n, k = len(A), len(A[0]) if A else 0
    m = len(B[0]) if B else 0
    C = zeros(n, m)
    for i in range(n):
        for j in range(m):
            for t in range(k):
                if A[i][t] and B[t][j]:
                    C[i][j] = 1
                    break
    return C
```

### transpose

Return the transpose Aᵗ, reversing edge direction in a graph. (Core §2.2)

``` python
def transpose(A: List[List[int]]) -> List[List[int]]:
    if not A: return []
    n, m = len(A), len(A[0])
    T = zeros(m, n)
    for i in range(n):
        for j in range(m):
            T[j][i] = A[i][j]
    return T
```

### mat<sub>eq</sub>

Return True iff A and B have identical shape and entries, used to check Cr = r. (Physics §2.3)

``` python
def mat_eq(A: List[List[int]], B: List[List[int]]) -> bool:
    if len(A)!=len(B): return False
    if not A and not B: return True
    if A and B and len(A[0])!=len(B[0]): return False
    for i in range(len(A)):
        for j in range(len(A[0])):
            if A[i][j]!=B[i][j]:
                return False
    return True
```

### mat<sub>xor</sub>

Compute elementwise XOR A ⊕ B for residuals. (Physics §4.2)

``` python
def mat_xor(A: List[List[int]], B: List[List[int]]) -> List[List[int]]:
    n, m = len(A), len(A[0]) if A else 0
    X = zeros(n, m)
    for i in range(n):
        for j in range(m):
            X[i][j] = 1 if A[i][j]^B[i][j] else 0
    return X
```

### count<sub>ones</sub>

Count the total number of 1s in a matrix, used as $\|$ρ\|\|₀. (Physics §4.3)

``` python
def count_ones(A: List[List[int]]) -> int:
    return sum(sum(row) for row in A)
```

# Graph builders

Construct adjacency matrices representing directed graphs. (Core §3.1)

## graph<sub>fromedges</sub>

Build an n×n adjacency A from a list of directed edges i→j, optionally adding reflexive loops. (Core §3.1)

``` python
def graph_from_edges(n:int, edges:Iterable[Tuple[int,int]], reflexive:bool=False) -> List[List[int]]:
    A = zeros(n,n)
    if reflexive:
        for i in range(n): A[i][i]=1
    for i,j in edges: A[i][j]=1
    return A
```

## line<sub>graph</sub>

Return the linear chain 0→1→…→n−1. (Core §3.1)

``` python
def line_graph(n:int)->List[List[int]]:
    return graph_from_edges(n,((i,i+1) for i in range(n-1)))
```

## cycle<sub>graph</sub>

Return the cycle 0→1→…→n−1→0. (Core §3.1)

``` python
def cycle_graph(n:int)->List[List[int]]:
    return graph_from_edges(n,((i,(i+1)%n) for i in range(n)))
```

## star<sub>graph</sub>

Return a star with `center→i`{.verbatim} for all i≠center. (Core §3.1)

``` python
def star_graph(n:int,center:int=0)->List[List[int]]:
    return graph_from_edges(n,((center,i) for i in range(n) if i!=center))
```

# Modalities

Implement □ (forward closure), ◇ (backward closure), and C = □∘◇ on graphs. (Physics §2.1)

## <sub>closureforwardon</sub>

Compute forward transitive closure via Warshall-style propagation. (Physics §2.1)

``` python
def _closure_forward_on(A:List[List[int]])->List[List[int]]:
    n=len(A); C=[row[:] for row in A]
    for k in range(n):
        for i in range(n):
            if C[i][k]:
                for j in range(n):
                    if C[k][j]:
                        C[i][j]=1
    return C
```

## box

Return □A, the forward transitive closure of A. (Physics §2.1)

``` python
def box(A:List[List[int]])->List[List[int]]:
    return _closure_forward_on(A)
```

## diamond

Return ◇A, the backward transitive closure, computed as □ on the transposed graph. (Core §2.2)

``` python
def diamond(A:List[List[int]])->List[List[int]]:
    return transpose(_closure_forward_on(transpose(A)))
```

## C

Return C(A) = □(◇A), the comonad action on graphs. (Physics §2.1)

``` python
def C(A:List[List[int]])->List[List[int]]:
    return box(diamond(A))
```

## epsilon

Given A<sub>C</sub> = C(A<sub>orig</sub>), drop edges not in the original to realize the counit ε. (Physics §2.1)

``` python
def epsilon(A_C:List[List[int]],A_orig:List[List[int]])->List[List[int]]:
    n=len(A_orig); E=zeros(n,n)
    for i in range(n):
        for j in range(n):
            E[i][j]=1 if A_orig[i][j] and A_C[i][j] else 0
    return E
```

## delta

Return δ(A<sub>C</sub>), which is A<sub>C</sub> itself in this idempotent closure model. (Physics §2.1)

``` python
def delta(A_C:List[List[int]])->List[List[int]]:
    return A_C
```

# Relations

Relations are boolean matrices R of shape \|X\|×\|Y\| representing cells X→C Y. (Physics §2.2)

## relation<sub>frompairs</sub>

Create relation matrix R from index pairs (i,j) ⊆ X×Y. (Physics §2.2)

``` python
def relation_from_pairs(nx:int,ny:int,pairs:Iterable[Tuple[int,int]])->List[List[int]]:
    R=zeros(nx,ny)
    for i,j in pairs: R[i][j]=1
    return R
```

## compose<sub>rel</sub>

Compose relations by boolean product to realize coKleisli composition. (Physics §2.1)

``` python
def compose_rel(R:List[List[int]],S:List[List[int]])->List[List[int]]:
    return mat_bool_mul(R,S)
```

## box<sub>rel</sub>

Retype R against □Y (closing codomain) without changing entries in this finite model. (Core §5.1)

``` python
def box_rel(R:List[List[int]],Y:List[List[int]])->List[List[int]]:
    _=box(Y)
    return [row[:] for row in R]
```

## diamond<sub>rel</sub>

Retype R against ◇Y (backward-closed codomain) without changing entries in this finite model. (Core §5.1)

``` python
def diamond_rel(R:List[List[int]],Y:List[List[int]])->List[List[int]]:
    _=diamond(Y)
    return [row[:] for row in R]
```

## apply<sub>Concodomain</sub>

Retype R as X→C Y by applying C to the codomain Y (entries unchanged here). (Physics §2.3)

``` python
def apply_C_on_codomain(R:List[List[int]],Y:List[List[int]])->List[List[int]]:
    _=C(Y)
    return [row[:] for row in R]
```

## iterate<sub>modal</sub>

Compute r⁽ⁿ⁺¹⁾ = (□r⁽ⁿ⁾) ∘ (◇r) for k≥1 starting at r⁽¹⁾=R. (Physics §2.2)

``` python
def iterate_modal(R:List[List[int]],k:int,Y:List[List[int]])->List[List[int]]:
    assert k>=1
    base=R; r=R
    for _ in range(1,k):
        r_box=box_rel(r,Y)
        r_dia=diamond_rel(base,Y)
        r=compose_rel(r_box,r_dia)
    return r
```

## stabilizes

Return True iff Cr = r (row-wise equality), i.e., on-shell in this boolean model. (Physics §4.3)

``` python
def stabilizes(R:List[List[int]],Y:List[List[int]])->bool:
    return mat_eq(R,apply_C_on_codomain(R,Y))
```

## defect<sub>rows</sub>

Return indices i with row<sub>i</sub>(R) = row<sub>i</sub>(Cr), the discrete analogue of Def(r). (Physics §2.5)

``` python
def defect_rows(R:List[List[int]],Y:List[List[int]])->List[int]:
    Cr=apply_C_on_codomain(R,Y)
    return [i for i in range(len(R)) if R[i]==Cr[i]]
```

# Residuals and Energetics

Compute residual ρ, action S, and normalized stabilization σ. (Physics §4.2–§4.3)

## residual<sub>rho</sub>

Return ρ(r) = C r − r as an elementwise XOR matrix. (Physics §4.2)

``` python
def residual_rho(R:List[List[int]],Y:List[List[int]])->List[List[int]]:
    Cr=apply_C_on_codomain(R,Y)
    return mat_xor(Cr,R)
```

## action<sub>S</sub>

Return S\[r\] = ½‖ρ‖₀ as a scalar guiding minimization toward on-shell. (Physics §4.3)

``` python
def action_S(R:List[List[int]],Y:List[List[int]])->float:
    rho=residual_rho(R,Y)
    return 0.5*float(count_ones(rho))
```

## sigma<sub>score</sub>

Return σ ∈ \[0,1\] as 1 − (#ρ-bits)/(#total-bits), a normalized stabilization score. (Core §5.2)

``` python
def sigma_score(R:List[List[int]],Y:List[List[int]])->float:
    rho=residual_rho(R,Y)
    total=len(R)*(len(R[0]) if R else 0)
    return 1.0 if total==0 else 1.0-(count_ones(rho)/float(total))
```

# Pretty print

Return a string rendering of matrix M for logging and Org display. (Core §2.1)

``` python
def show_matrix(M:List[List[int]])->str:
    return "\n".join(" ".join(str(x) for x in row) for row in M)
```

# Demo

Demonstrate modal iteration and stabilization on a small X↝Y cell. (Physics §2.2)

``` python
if __name__=="__main__":
    X=line_graph(4); Y=cycle_graph(4)
    pairs=[(i,i%4) for i in range(4)]+[(i,(i+1)%4) for i in range(4)]
    R=relation_from_pairs(4,4,pairs)
    print("R:\n",show_matrix(R))
    R3=iterate_modal(R,3,Y)
    print("\nR^(3):\n",show_matrix(R3))
    print("\nDefect:",defect_rows(R3,Y))
    print("S =",action_S(R3,Y),"  σ =",sigma_score(R3,Y))
```
