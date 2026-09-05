#!/usr/bin/env python3
"""
Strong-MLD orbit-type classifier for spatiotemporal-knowledge settlings.

Step 6 of the computation protocol: classify a settling's composed-duality
orbit type per the [strong-MLD theorem] and the [firing-pattern characterization
of self-duality]. Verifies the theorem's claim:

  "A settling is q-fuzzy self-dual under the composed duality D = D_sp ∘ D_val
   iff every firing of v is a ⊤-firing."

The composed duality D acts on settlings by composing the spatial Verdier
duality D_sp (sheaf ↔ cosheaf) with the value-category duality D_val (bilattice
negation, swapping L_+ and L_-). For each firing μ:

  - Truth-only (D_μ = (Z, 0, ...))    →  D_val swaps to falsity-only (D_μ = (0, Z, ...))
  - Falsity-only (D_μ = (0, Z, ...))  →  D_val swaps to truth-only
  - ⊤-firing (D_μ = (Z, Z, ...))      →  D_val fixes (up to canonical iso)
  - ⊥-firing (D_μ = (0, 0, ...))      →  D_val fixes (trivially)

So a settling is D-self-dual iff it has no truth-only or falsity-only firings —
equivalently, every firing is ⊤ or ⊥.

The orbit classification:
  - **Self-dual**: orbit size 1 under D (every firing is ⊤ or ⊥).
  - **Exchange-paired**: orbit size 2 under D (some asymmetric firings; pairs with
    its bilattice-negation counterpart).
  - **Mixed**: complex orbit structure (both ⊤/⊥ AND asymmetric firings).

Usage:
  python3 compute.py --substitution fibonacci
  python3 compute.py --all
"""
from __future__ import annotations

import argparse
import sys

import sympy as sp


SUBSTITUTIONS = {
    "fibonacci": (sp.Matrix([[1, 1], [1, 0]]), ["a", "b"]),
    "thue-morse": (sp.Matrix([[1, 1], [1, 1]]), ["0", "1"]),
    "padovan": (sp.Matrix([[0, 1, 0], [0, 0, 1], [1, 1, 0]]), ["a", "b", "c"]),
    "tribonacci": (sp.Matrix([[1, 1, 0], [1, 0, 1], [1, 0, 0]]), ["a", "b", "c"]),
    "tetranacci": (sp.Matrix([[1, 1, 0, 0], [1, 0, 1, 0], [1, 0, 0, 1], [1, 0, 0, 0]]),
                   ["a", "b", "c", "d"]),
}

DEFAULT_VALUATIONS = {
    "fibonacci":  {"a": "t", "b": "f"},
    "thue-morse": {"0": "f", "1": "t"},
    "padovan":    {"a": "t", "b": "f", "c": "top"},
    "tribonacci": {"a": "t", "b": "f", "c": "top"},
    "tetranacci": {"a": "bot", "b": "t", "c": "f", "d": "top"},
}

NEGATION = {"t": "f", "f": "t", "top": "top", "bot": "bot"}
CONFLATION = {"t": "t", "f": "f", "top": "bot", "bot": "top"}
DOUBLE = {"t": "f", "f": "t", "top": "bot", "bot": "top"}  # negation × conflation

INVOLUTIONS = {
    "negation": NEGATION,
    "conflation": CONFLATION,
    "double": DOUBLE,
}

# Fixed-point sets: the bilattice values fixed by each involution.
# Negation fixes {top, bot}; conflation fixes {t, f}; double fixes nothing.
INVOLUTION_FIXED = {
    "negation":   {"top", "bot"},
    "conflation": {"t", "f"},
    "double":     set(),
}


def classify_orbit_type(valuation: dict[str, str]) -> dict:
    """Compute the orbit-type stratification of a settling's firings."""
    counts = {"truth-only": 0, "falsity-only": 0, "⊤-firing": 0, "⊥-firing": 0}
    for ell, v in valuation.items():
        if v == "t":
            counts["truth-only"] += 1
        elif v == "f":
            counts["falsity-only"] += 1
        elif v == "top":
            counts["⊤-firing"] += 1
        elif v == "bot":
            counts["⊥-firing"] += 1
        else:
            raise ValueError(f"unknown value {v!r}")

    n_truth = counts["truth-only"]
    n_falsity = counts["falsity-only"]
    n_top = counts["⊤-firing"]
    n_bot = counts["⊥-firing"]

    # Per the firing-pattern characterization of self-duality:
    if n_truth == 0 and n_falsity == 0:
        orbit_type = "self-dual"
        orbit_size = 1
        explanation = ("Every firing is ⊤ or ⊥. D_val fixes both (⊤ canonically, "
                       "⊥ trivially). Settling is fixed under composed D up to canonical iso.")
    elif n_top == 0 and n_bot == 0:
        # Pure asymmetric firings only.
        if n_truth > 0 and n_falsity == 0:
            orbit_type = "truth-only orbit"
            orbit_size = 2
            explanation = ("All firings are truth-only. D_val swaps to all-falsity-only, "
                           "giving a Z/2 exchange orbit with the negated settling.")
        elif n_falsity > 0 and n_truth == 0:
            orbit_type = "falsity-only orbit"
            orbit_size = 2
            explanation = ("All firings are falsity-only. D_val swaps to all-truth-only.")
        else:
            orbit_type = "exchange-mixed"
            orbit_size = 2
            explanation = ("Mix of truth-only and falsity-only firings, no symmetric. "
                           "D_val swaps t↔f within each firing, producing a paired settling.")
    else:
        orbit_type = "mixed"
        orbit_size = "depends on per-firing structure"
        explanation = ("Both symmetric (⊤/⊥) and asymmetric (truth-only/falsity-only) "
                       "firings present. Orbit structure is mixed: D_val fixes the "
                       "symmetric firings and swaps the asymmetric ones.")

    # Compute the negated settling's valuation:
    negated_valuation = {ell: NEGATION[v] for ell, v in valuation.items()}

    # Self-test: orbit size 1 case should have negated valuation iso to original.
    is_self_negation = (valuation == negated_valuation)

    return {
        "valuation": valuation,
        "negated_valuation": negated_valuation,
        "is_self_negation": is_self_negation,
        "firing_counts": counts,
        "orbit_type": orbit_type,
        "orbit_size": orbit_size,
        "explanation": explanation,
    }


def verify_firing_pattern_self_duality(valuation: dict[str, str],
                                         involution: str = "negation") -> bool:
    """A settling is firing-pattern self-dual under a bilattice involution iff
    every firing's value is fixed by that involution.

    For negation: every firing in {⊤, ⊥} (matches d-frame Verdier composition theorem).
    For conflation: every firing in {t, f} (the dual statement).
    For double (negation × conflation): no value is fixed, so only the trivial
       (no-firing) settling can be self-dual under double.
    """
    fixed = INVOLUTION_FIXED[involution]
    return all(v in fixed for v in valuation.values())


def involution_permutation(letters: list[str], valuation: dict[str, str],
                             involution: str = "negation") -> list[int] | None:
    """The alphabet permutation induced by a bilattice involution, returned as
    a permutation of indices. Letter ell is mapped to whatever letter has the
    involution-image value.

    Returns None if the involution isn't a permutation of letters (e.g., a
    value appears in valuation but its involution-image value doesn't, so
    there's no letter to map to).
    """
    inv = INVOLUTIONS[involution]
    by_value: dict[str, list[str]] = {}
    for ell in letters:
        v = valuation[ell]
        by_value.setdefault(v, []).append(ell)

    perm: list[int] = []
    for ell in letters:
        v = valuation[ell]
        v_img = inv[v]
        if v_img not in by_value:
            return None  # no letter has the image value; permutation undefined
        candidates = by_value[v_img]
        if v == v_img and ell in candidates:
            partner = ell
        else:
            partner = candidates[0]
        perm.append(letters.index(partner))
    return perm


# Legacy alias (negation-specific).
def negation_permutation(letters: list[str], valuation: dict[str, str]) -> list[int] | None:
    return involution_permutation(letters, valuation, "negation")


def verify_substitution_self_duality(M: sp.Matrix, letters: list[str],
                                      valuation: dict[str, str],
                                      involution: str = "negation") -> dict:
    """Check whether the substitution matrix M commutes with the
    involution-induced alphabet permutation.

    For an alphabet permutation σ (as a permutation matrix P), 'M commutes
    with σ' means M·P = P·M. This is a stronger structural property than
    firing-pattern self-duality — it says the substitution RULE respects
    the involution, not just that individual firings are fixed.
    """
    n = M.shape[0]
    perm = involution_permutation(letters, valuation, involution)
    if perm is None:
        return {
            "involution": involution,
            "perm": None,
            "commutes": False,
            "reason": (f"Bilattice {involution} does not give a well-defined alphabet "
                       f"permutation under this valuation (some image value has no letter)."),
        }
    P = sp.zeros(n)
    for i, j in enumerate(perm):
        P[i, j] = 1
    M_P = M * P
    P_M = P * M
    commutes = (M_P == P_M)
    return {
        "involution": involution,
        "perm": perm,
        "perm_matrix": P,
        "M_P": M_P,
        "P_M": P_M,
        "commutes": commutes,
    }


def report_one_involution(name: str, M: sp.Matrix, letters: list[str],
                            valuation: dict[str, str], involution: str) -> list[str]:
    """Report on a single involution (negation, conflation, or double)."""
    lines: list[str] = []
    inv = INVOLUTIONS[involution]
    fixed = INVOLUTION_FIXED[involution]

    fp = verify_firing_pattern_self_duality(valuation, involution)
    sub = verify_substitution_self_duality(M, letters, valuation, involution)

    sym_label = {
        "negation":   "negation (¬: t↔f, ⊥/⊤ fixed)",
        "conflation": "conflation (-: ⊥↔⊤, t/f fixed)",
        "double":     "double involution (¬·-: t↔f and ⊥↔⊤)",
    }[involution]

    lines.append(f"### Under {sym_label}")
    lines.append(f"  Fixed values: {fixed if fixed else '(none)'}")
    lines.append(f"  (1) Firing-pattern self-duality: every firing's value is "
                 f"{involution}-fixed.")
    lines.append(f"      Result: {fp}")
    lines.append(f"  (2) Substitution-rule self-duality: M commutes with the "
                 f"{involution}-induced alphabet permutation.")
    if sub["perm"] is None:
        lines.append(f"      Result: not applicable — {sub['reason']}")
    else:
        perm_str = ", ".join(f"{letters[i]}↦{letters[sub['perm'][i]]}"
                             for i in range(len(letters)))
        lines.append(f"      Permutation: {perm_str}")
        lines.append(f"      Result: {sub['commutes']}")
    return lines


def report(name: str, M: sp.Matrix, letters: list[str], valuation: dict[str, str],
            involution: str | None = None) -> str:
    """Report on the settling. If involution is None, report all three Klein-four
    involutions; otherwise just the chosen one."""
    lines: list[str] = []
    lines.append(f"=== Strong-MLD orbit type: {name} ===")
    lines.append("")
    lines.append("Letter → bilattice value:")
    for ell, v in valuation.items():
        lines.append(f"  {ell} ↦ {v}")
    lines.append("")

    classification = classify_orbit_type(valuation)
    lines.append("Firing-type counts:")
    for ft, c in classification["firing_counts"].items():
        lines.append(f"  {ft:14}: {c}")
    lines.append("")
    lines.append(f"Orbit type (under negation): **{classification['orbit_type']}**")
    lines.append(f"Orbit size under D: {classification['orbit_size']}")
    lines.append(f"Explanation: {classification['explanation']}")
    lines.append("")

    if involution is None:
        # Report all three Klein-four involutions.
        lines.append("## Klein-four group analysis: per-involution self-duality")
        lines.append("")
        for inv in ["negation", "conflation", "double"]:
            lines.extend(report_one_involution(name, M, letters, valuation, inv))
            lines.append("")
        # Summary
        results: dict[str, dict] = {}
        for inv in ["negation", "conflation", "double"]:
            results[inv] = {
                "fp": verify_firing_pattern_self_duality(valuation, inv),
                "sub": verify_substitution_self_duality(M, letters, valuation, inv),
            }
        lines.append("### Summary across involutions")
        lines.append("")
        lines.append("|             | firing-pattern self-dual | sub-rule self-dual |")
        lines.append("|-------------|--------------------------|--------------------|")
        for inv in ["negation", "conflation", "double"]:
            r = results[inv]
            sub_result = ("N/A" if r["sub"]["perm"] is None
                          else str(r["sub"]["commutes"]))
            lines.append(f"| {inv:11} | {str(r['fp']):24} | {sub_result:18} |")
        lines.append("")

        # Klein-four orbit-type interpretation
        all_fp = [results[inv]["fp"] for inv in ["negation", "conflation", "double"]]
        if any(all_fp):
            sd_invs = [inv for inv in ["negation", "conflation", "double"] if results[inv]["fp"]]
            lines.append(f"Settling is firing-pattern self-dual under: {', '.join(sd_invs)}.")
        else:
            lines.append("Settling is firing-pattern self-dual under: (none).")
    else:
        lines.extend(report_one_involution(name, M, letters, valuation, involution))

    return "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--substitution", help="named substitution")
    ap.add_argument("--all", action="store_true")
    ap.add_argument("--involution", choices=["negation", "conflation", "double", "all"],
                    default="all", help="which Klein-four involution to analyze")
    args = ap.parse_args()

    inv = None if args.involution == "all" else args.involution

    if args.all:
        for name in SUBSTITUTIONS:
            M, letters = SUBSTITUTIONS[name]
            valuation = DEFAULT_VALUATIONS[name]
            print(report(name, M, letters, valuation, inv))
            print()
        return 0

    if not args.substitution:
        ap.print_help()
        return 1
    if args.substitution not in SUBSTITUTIONS:
        print(f"Unknown: {args.substitution}", file=sys.stderr)
        return 1

    M, letters = SUBSTITUTIONS[args.substitution]
    valuation = DEFAULT_VALUATIONS[args.substitution]
    print(report(args.substitution, M, letters, valuation, inv))
    return 0


if __name__ == "__main__":
    sys.exit(main())
