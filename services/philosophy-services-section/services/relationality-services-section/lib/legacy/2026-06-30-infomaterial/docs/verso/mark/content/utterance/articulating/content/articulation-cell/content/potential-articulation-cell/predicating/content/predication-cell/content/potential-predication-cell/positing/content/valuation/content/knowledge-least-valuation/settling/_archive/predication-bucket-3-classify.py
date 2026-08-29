#!/usr/bin/env python3
"""
Regime classifier for spatiotemporal-knowledge settlings.

Step 2 of the computation protocol (narratives/computation-protocol.md): given
a settling specification, determine its closure ordinal κ and which of the four
regimes it falls into:

  - strict:              κ < ω             (finite closure)
  - Scott-continuous:    κ = ω             (countable convergence at ω)
  - transfinite-bounded: ω < κ < ω₁        (countable but transfinite)
  - aperiodic:           κ ≥ ω₁            (uncountable closure)

The classifier supports two input modes:

  (A) substitution_matrix mode: takes an integer matrix M describing a
      substitution rule. Uses the primitivity check + Pisot eigenvalue test
      to classify. For primitive non-singular M this is unconditionally
      aperiodic with κ = ω₁ (per the corpus's step-n cohomological rank
      theorem).

  (B) settling_stages mode: takes an explicit list of (stage, firings) data
      describing where non-Scott-continuous firings occur. Computes κ as the
      supremum of stage indices and classifies accordingly.

Generic closure-rule cases (epistemic Kripke frames, CRDT systems,
transfinite-induction rules) require their own bridge tools that produce
input in one of the two supported formats.

Usage:

  python3 classify.py --substitution fibonacci
  python3 classify.py --substitution-matrix "1,1;1,0"
  python3 classify.py --stages "0,3,7,omega" --stages-format ordinal-list
"""
from __future__ import annotations

import argparse
import sys

import sympy as sp


# Pre-defined substitution matrices (matching tools/anderson-putnam-cohomology/compute.py)
SUBSTITUTIONS = {
    "fibonacci": sp.Matrix([[1, 1], [1, 0]]),
    "thue-morse": sp.Matrix([[1, 1], [1, 1]]),  # σ(0)=01, σ(1)=10 — non-primitive in this convention; see note
    "padovan": sp.Matrix([[0, 1, 0], [0, 0, 1], [1, 1, 0]]),
    "tribonacci": sp.Matrix([[1, 1, 0], [1, 0, 1], [1, 0, 0]]),
    "tetranacci": sp.Matrix([[1, 1, 0, 0], [1, 0, 1, 0], [1, 0, 0, 1], [1, 0, 0, 0]]),
}


def is_primitive(M: sp.Matrix, max_power: int = 12) -> tuple[bool, int]:
    """Check whether some power of M is strictly positive. Returns
    (is_primitive, witness_power_or_-1)."""
    n = M.shape[0]
    P = M.copy()
    for k in range(1, max_power + 1):
        if all(P[i, j] > 0 for i in range(n) for j in range(n)):
            return True, k
        P = P * M
    return False, -1


def perron_eigenvalue(M: sp.Matrix) -> sp.Expr:
    """The largest real eigenvalue of M (the Perron-Frobenius eigenvalue for
    a non-negative primitive matrix). Returns sp.nan if no real eigenvalue."""
    char = M.charpoly().as_expr()
    var = list(char.free_symbols)[0]
    roots = sp.solve(char, var)
    real = [r for r in roots if r.is_real]
    if not real:
        return sp.nan
    return max(real)


def is_pisot(M: sp.Matrix, perron: sp.Expr) -> bool:
    """Check whether perron is a Pisot number: real algebraic integer > 1
    whose Galois conjugates have absolute value < 1.

    For an integer-matrix Perron eigenvalue the algebraic-integer property
    holds automatically. We just check perron > 1 and all other eigenvalues
    have |·| < 1."""
    if perron is sp.nan:
        return False
    if not (perron > 1):
        return False
    char = M.charpoly().as_expr()
    var = list(char.free_symbols)[0]
    roots = sp.solve(char, var)
    for r in roots:
        if r == perron:
            continue
        if abs(sp.N(r, 10)) >= 1:
            return False
    return True


def classify_substitution_matrix(M: sp.Matrix) -> dict:
    """Classify a settling specified by a substitution matrix.

    Returns a dict with: regime, kappa, primitive, perron, pisot, alphabet_size,
    notes."""
    n = M.shape[0]
    primitive, witness = is_primitive(M)
    det = M.det()
    perron = perron_eigenvalue(M)
    pisot = is_pisot(M, perron) if perron is not sp.nan else False

    notes: list[str] = []
    if det == 0:
        notes.append("singular matrix — settling has rank-deficient cohomology")
    if not primitive:
        notes.append(f"non-primitive matrix — no power within {12} is strictly positive")

    if primitive and det != 0:
        # Per the step-n cohomological rank theorem and the four-regime dichotomy:
        # primitive non-singular substitution matrices give aperiodic settlings.
        regime = "aperiodic"
        kappa = "ω₁"
    elif det == 0:
        # Singular: degenerate case. Cohomological rank < n; regime depends on details.
        regime = "needs-investigation"
        kappa = "?"
        notes.append(
            "singular substitution matrix doesn't fit the standard primitive-aperiodic case; "
            "regime requires explicit settling-stage analysis"
        )
    else:
        # Non-primitive but non-singular: unusual but possible.
        regime = "needs-investigation"
        kappa = "?"
        notes.append(
            "non-primitive substitution matrix — settling may not reach κ = ω₁; "
            "classify by explicit stage analysis"
        )

    return {
        "input_mode": "substitution_matrix",
        "alphabet_size": n,
        "regime": regime,
        "kappa": kappa,
        "primitive": primitive,
        "primitivity_witness_power": witness if primitive else None,
        "det": int(det),
        "perron_eigenvalue": float(sp.N(perron, 8)) if perron is not sp.nan else None,
        "pisot": pisot,
        "characteristic_polynomial": str(M.charpoly().as_expr()),
        "notes": notes,
    }


def classify_settling_stages(stages: list[str]) -> dict:
    """Classify a settling specified by an explicit list of firing-stage
    indices (as ordinal expressions: '0', '3', 'omega', 'omega+1', 'omega_1', etc.).

    Returns a dict with: regime, kappa, ns_firing_count, notes."""
    notes: list[str] = []

    # Parse each stage spec to a category: "finite" / "omega" / "omega_plus_finite" /
    # "omega_omega" / "omega_1" / "between_omega_and_omega_1" / "above_omega_1".
    has_omega_1 = False
    has_above_omega_1 = False
    has_between_omega_omega_1 = False
    has_omega = False
    max_finite = -1

    for s in stages:
        s = s.strip().lower()
        if s in ("omega_1", "ω_1", "ω₁", "omega1"):
            has_omega_1 = True
        elif s in ("omega", "ω"):
            has_omega = True
        elif s.startswith("omega+") or s.startswith("ω+"):
            has_between_omega_omega_1 = True
        elif s.startswith("omega"):
            # omega·n, omega^n, etc. — countable but transfinite
            has_between_omega_omega_1 = True
        elif s.startswith(">omega_1") or s.startswith("ω_1+"):
            has_above_omega_1 = True
        else:
            try:
                k = int(s)
                max_finite = max(max_finite, k)
            except ValueError:
                notes.append(f"unparsed stage: {s!r}")

    if has_above_omega_1 or has_omega_1:
        regime = "aperiodic"
        kappa = "ω₁ (or above)"
    elif has_between_omega_omega_1:
        regime = "transfinite-bounded"
        kappa = "ω < κ < ω₁"
    elif has_omega:
        regime = "scott-continuous"
        kappa = "ω"
    else:
        regime = "strict"
        kappa = f"{max_finite} (finite)" if max_finite >= 0 else "0 (empty)"

    return {
        "input_mode": "settling_stages",
        "stage_count": len(stages),
        "regime": regime,
        "kappa": kappa,
        "max_finite_stage": max_finite if max_finite >= 0 else None,
        "has_omega_firing": has_omega,
        "has_between_omega_omega_1_firing": has_between_omega_omega_1,
        "has_omega_1_firing": has_omega_1,
        "notes": notes,
    }


def report(result: dict) -> str:
    lines: list[str] = []
    lines.append(f"=== Regime classification ({result['input_mode']}) ===")
    lines.append(f"Regime:           {result['regime']}")
    lines.append(f"Closure ordinal:  κ = {result['kappa']}")
    lines.append("")
    if result["input_mode"] == "substitution_matrix":
        lines.append(f"Alphabet size n:  {result['alphabet_size']}")
        lines.append(f"Primitive:        {result['primitive']}"
                     + (f" (witness M^{result['primitivity_witness_power']})"
                        if result["primitive"] else ""))
        lines.append(f"det(M):           {result['det']}")
        lines.append(f"Perron eigenvalue: {result['perron_eigenvalue']}")
        lines.append(f"Pisot:            {result['pisot']}")
        lines.append(f"Char polynomial:  {result['characteristic_polynomial']}")
    elif result["input_mode"] == "settling_stages":
        lines.append(f"Stage count:                  {result['stage_count']}")
        lines.append(f"Max finite stage:             {result['max_finite_stage']}")
        lines.append(f"ω firing present:             {result['has_omega_firing']}")
        lines.append(f"ω < κ < ω₁ firing present:    {result['has_between_omega_omega_1_firing']}")
        lines.append(f"ω₁ firing present:            {result['has_omega_1_firing']}")
    if result.get("notes"):
        lines.append("")
        lines.append("Notes:")
        for note in result["notes"]:
            lines.append(f"  - {note}")
    return "\n".join(lines)


def parse_matrix_string(s: str) -> sp.Matrix:
    """Parse a matrix from 'r1c1,r1c2,...;r2c1,r2c2,...;...' format."""
    rows = [list(map(int, r.split(","))) for r in s.split(";")]
    return sp.Matrix(rows)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--substitution", help="named substitution from the predefined set")
    ap.add_argument("--substitution-matrix", help="custom substitution matrix as 'r1c1,r1c2;r2c1,r2c2;...'")
    ap.add_argument("--stages", help="comma-separated list of firing stages (e.g. '0,3,7,omega')")
    ap.add_argument("--list", action="store_true", help="list predefined substitutions")
    args = ap.parse_args()

    if args.list:
        for name in SUBSTITUTIONS:
            print(f"  {name}")
        return 0

    if args.substitution:
        if args.substitution not in SUBSTITUTIONS:
            print(f"Unknown substitution: {args.substitution}", file=sys.stderr)
            print(f"Available: {list(SUBSTITUTIONS)}", file=sys.stderr)
            return 1
        result = classify_substitution_matrix(SUBSTITUTIONS[args.substitution])
    elif args.substitution_matrix:
        M = parse_matrix_string(args.substitution_matrix)
        result = classify_substitution_matrix(M)
    elif args.stages:
        stages = args.stages.split(",")
        result = classify_settling_stages(stages)
    else:
        ap.print_help()
        return 1

    print(report(result))
    return 0


if __name__ == "__main__":
    sys.exit(main())
