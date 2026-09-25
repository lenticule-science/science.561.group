#!/usr/bin/env python3
"""
Compute Anderson-Putnam Čech cohomology of a primitive substitution tiling space
from its substitution matrix M.

Background. For a primitive substitution σ on n letters with substitution matrix M
(M_ij = number of occurrences of letter i in σ(j)), Anderson and Putnam (1998)
showed that the inverse-limit tiling space Ω_σ has Čech cohomology

    Ȟ^0(Ω_σ; Z) = Z         (path-connected),
    Ȟ^1(Ω_σ; Z) = colim_k (Z^n --M^T--> Z^n --M^T--> ...).

This script computes that direct limit. For non-singular M (det ≠ 0), the colimit
is a Z-module of rank n; if M is unimodular (det = ±1), the colimit is Z^n
exactly. If det = d with |d| > 1, the colimit picks up a Z[1/d]-localisation factor.

Usage:
    python3 compute.py <name>
where <name> is one of: fibonacci, padovan, tribonacci, tetranacci, pentanacci.
Or pass --matrix "row1;row2;..." with comma-separated entries.

The script reports rank, det, Smith normal form invariants, and the Z-module
isomorphism type of the direct limit.
"""
import argparse
import sys

import sympy as sp


SUBSTITUTIONS = {
    # Corpus convention: M_{ij} = number of letter j appearing in σ(letter i).
    # Equivalently, the i-th row records the letter-counts of σ(a_i).
    # This matches the matrices appearing in the corpus example files.
    # Cohomologically: rank(colim(Z^n, M^T)) = rank(colim(Z^n, M)) = rank(M) = n
    # whenever M is non-singular, so the convention does not affect the rank result.
    #
    # Fibonacci: σ(a) = ab, σ(b) = a → row(a) = (1,1), row(b) = (1,0)
    "fibonacci": sp.Matrix([
        [1, 1],
        [1, 0],
    ]),
    # Padovan: σ(a) = b, σ(b) = c, σ(c) = ab
    # row(a) = (0,1,0), row(b) = (0,0,1), row(c) = (1,1,0)
    "padovan": sp.Matrix([
        [0, 1, 0],
        [0, 0, 1],
        [1, 1, 0],
    ]),
    # Tribonacci: σ(a) = ab, σ(b) = ac, σ(c) = a
    # row(a) = (1,1,0), row(b) = (1,0,1), row(c) = (1,0,0)
    "tribonacci": sp.Matrix([
        [1, 1, 0],
        [1, 0, 1],
        [1, 0, 0],
    ]),
    # Tetranacci: σ(a) = ab, σ(b) = ac, σ(c) = ad, σ(d) = a
    # row(a) = (1,1,0,0), row(b) = (1,0,1,0), row(c) = (1,0,0,1), row(d) = (1,0,0,0)
    "tetranacci": sp.Matrix([
        [1, 1, 0, 0],
        [1, 0, 1, 0],
        [1, 0, 0, 1],
        [1, 0, 0, 0],
    ]),
    # Pentanacci-style analogue.
    "pentanacci": sp.Matrix([
        [1, 1, 0, 0, 0],
        [1, 0, 1, 0, 0],
        [1, 0, 0, 1, 0],
        [1, 0, 0, 0, 1],
        [1, 0, 0, 0, 0],
    ]),
}


def is_primitive(M: sp.Matrix, max_power: int = 10) -> bool:
    """Test whether some power of M is strictly positive (Perron-Frobenius primitivity)."""
    n = M.shape[0]
    P = M.copy()
    for _ in range(max_power):
        if all(P[i, j] > 0 for i in range(n) for j in range(n)):
            return True
        P = P * M
    return False


def smith_invariants(M: sp.Matrix) -> list:
    """Return the diagonal invariants of the Smith normal form of M over Z.

    If M = U D V with U, V in GL(n, Z) and D diagonal with d_1 | d_2 | ... | d_r
    and zeros below, return [d_1, ..., d_r] (with zeros if M is rank-deficient).
    """
    # SymPy doesn't have a direct Smith normal form; compute via elementary divisors.
    # We use the determinantal-divisors formulation: d_i = (i-th determinantal divisor) /
    # (i-1-th determinantal divisor).
    n = M.shape[0]
    minors = [1]  # 0-th determinantal divisor is 1 by convention
    for k in range(1, n + 1):
        # k-th determinantal divisor = gcd of all k×k minors of M
        gcd_val = 0
        for rows in sp.utilities.iterables.subsets(range(n), k):
            for cols in sp.utilities.iterables.subsets(range(n), k):
                sub = M.extract(list(rows), list(cols))
                gcd_val = sp.gcd(gcd_val, sub.det())
        minors.append(gcd_val)
    invariants = []
    for k in range(1, n + 1):
        if minors[k] == 0:
            invariants.append(0)
        else:
            invariants.append(minors[k] / minors[k - 1])
    return invariants


def colim_structure(M: sp.Matrix) -> str:
    """Describe the Z-module isomorphism type of colim(Z^n --M^T--> ...).

    For non-singular M, the rank is n. If M is unimodular (det = ±1) the colim is Z^n.
    If det = d with |d| > 1, the colim is a localisation Z[1/d]^n_{appropriate}.
    """
    n = M.shape[0]
    Mt = M.T
    d = Mt.det()
    rank = Mt.rank()
    if d == 0:
        return f"singular: rank {rank} < {n}; colim has rank {rank} (with kernel torsion)"
    if abs(d) == 1:
        return f"Z^{n} (unimodular: det M^T = {d})"
    # General non-singular: colim picks up localisations at the prime factors of d.
    primes = sp.factorint(abs(d))
    factors = " * ".join(f"Z[1/{p}]" for p in primes)
    return f"rank {n}, localised at det = {d}: ≅ {factors} ⊗ Z^{n} (i.e. Z-rank {n})"


def report(name: str, M: sp.Matrix) -> None:
    n = M.shape[0]
    print(f"\n=== {name} (n = {n}) ===")
    print(f"M =\n{M}")
    print(f"det(M) = {M.det()}")
    print(f"primitive: {is_primitive(M)}")
    char_poly = M.charpoly().as_expr()
    print(f"characteristic polynomial: {char_poly}")

    # Perron eigenvalue: largest real root
    roots = sp.solve(char_poly, sp.Symbol("lambda"))
    real_roots = [sp.N(r, 6) for r in roots if r.is_real]
    if real_roots:
        perron = max(real_roots)
        print(f"Perron eigenvalue (numerical): {perron}")

    # AP cohomology
    inv = smith_invariants(M.T)
    print(f"Smith invariants of M^T: {inv}")
    print(f"Ȟ^0(Ω_σ) = Z")
    print(f"Ȟ^1(Ω_σ) = {colim_structure(M)}")
    print(f"  rank Ȟ^1 = {n}: {n == M.T.rank()}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", help="named substitution (fibonacci, padovan, ...)")
    ap.add_argument("--matrix", help="custom matrix as 'row1;row2;...' with comma entries")
    ap.add_argument("--all", action="store_true", help="compute for all named substitutions")
    args = ap.parse_args()

    if args.all:
        for name, M in SUBSTITUTIONS.items():
            report(name, M)
        return

    if args.matrix:
        rows = [list(map(int, r.split(","))) for r in args.matrix.split(";")]
        M = sp.Matrix(rows)
        report(args.name or "custom", M)
        return

    if args.name and args.name in SUBSTITUTIONS:
        report(args.name, SUBSTITUTIONS[args.name])
        return

    print(f"Unknown: {args.name}; choices: {list(SUBSTITUTIONS)} or --matrix")
    sys.exit(1)


if __name__ == "__main__":
    main()
