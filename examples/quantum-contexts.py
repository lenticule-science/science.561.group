#!/usr/bin/env python3
"""Reproduce the finite probability examples in quantum-contexts-and-probability.

Python standard library only. Fractions keep every tabulated quantity exact.
This is a calculation for one specified family, not a general contextuality
solver, quantum experiment, or new derivation of quantum mechanics.

Run from the publication repository: python3 examples/quantum-contexts.py
"""

from fractions import Fraction
from itertools import product
import json


SETTINGS = tuple(product((0, 1), repeat=2))
OUTCOMES = tuple(product((0, 1), repeat=2))
# An assignment fixes the four otherwise separately measured outcomes.
ASSIGNMENTS = tuple(product((0, 1), repeat=4))  # a0, a1, b0, b1
VISIBILITIES = (Fraction(0), Fraction(1, 2), Fraction(3, 5),
                Fraction(3, 4), Fraction(1))


def probability(v, x, y, a, b):
    return (1 + v * (-1) ** (a + b + x * y)) / 4


def deterministic_chsh(assignment):
    a0, a1, b0, b1 = ((-1) ** bit for bit in assignment)
    return a0 * b0 + a0 * b1 + a1 * b0 - a1 * b1


def project_distribution(weights, x, y, a, b):
    return sum((weight for assignment, weight in zip(ASSIGNMENTS, weights)
                if (assignment[x], assignment[2 + y]) == (a, b)), Fraction(0))


def support_assignments(v):
    return tuple(assignment for assignment in ASSIGNMENTS
                 if all(probability(v, x, y, assignment[x], assignment[2 + y]) > 0
                        for x, y in SETTINGS))


def main():
    chsh_values = tuple(deterministic_chsh(a) for a in ASSIGNMENTS)
    assert set(chsh_values) == {-2, 2}
    boundary = tuple(a for a in ASSIGNMENTS if deterministic_chsh(a) == 2)
    assert len(boundary) == 8
    boundary_weights = tuple(Fraction(1, 8) if a in boundary else Fraction(0)
                             for a in ASSIGNMENTS)
    assert sum(boundary_weights) == 1
    for x, y in SETTINGS:
        for a, b in OUTCOMES:
            assert project_distribution(boundary_weights, x, y, a, b) == \
                probability(Fraction(1, 2), x, y, a, b)

    cases = []
    for v in VISIBILITIES:
        rows = []
        correlations = []
        for x, y in SETTINGS:
            probabilities = tuple(probability(v, x, y, a, b) for a, b in OUTCOMES)
            assert all(p >= 0 for p in probabilities)
            assert sum(probabilities) == 1
            alice = tuple(sum(probability(v, x, y, a, b) for b in (0, 1))
                          for a in (0, 1))
            bob = tuple(sum(probability(v, x, y, a, b) for a in (0, 1))
                        for b in (0, 1))
            assert alice == bob == (Fraction(1, 2), Fraction(1, 2))
            correlation = sum(((-1) ** (a + b)) * probability(v, x, y, a, b)
                              for a, b in OUTCOMES)
            assert correlation == v * (-1) ** (x * y)
            # The incumbent WDist carrier uses natural-number weights. These
            # integers encode the rational example without rounding or a new
            # real-valued probability carrier. Other measurements' filler
            # assignments are intentionally not invented by this table.
            p, q = v.numerator, v.denominator
            integer_weights = tuple(q + p * (-1) ** (a + b + x * y)
                                    for a, b in OUTCOMES)
            assert all(weight >= 0 for weight in integer_weights)
            assert sum(integer_weights) == 4 * q
            assert tuple(Fraction(weight, 4 * q) for weight in integer_weights) == probabilities
            correlations.append(correlation)
            rows.append({"settings": [x, y],
                         "probabilities_00_01_10_11": list(map(str, probabilities)),
                         "natural_weights_00_01_10_11": list(integer_weights),
                         "natural_weight_total": 4 * q,
                         "alice_marginal_0_1": list(map(str, alice)),
                         "bob_marginal_0_1": list(map(str, bob)),
                         "correlation": str(correlation)})

        chsh = sum(correlations[:3]) - correlations[3]
        assert chsh == 4 * v
        compatible = support_assignments(v)
        assert len(compatible) == (0 if v == 1 else 16)
        local = v <= Fraction(1, 2)
        case = {"v": str(v), "rows": rows, "chsh": str(chsh),
                "global_support_assignments": len(compatible),
                "global_probability_distribution_exists_for_this_family": local,
                # Exact rational comparison with v <= 1/sqrt(2); the
                # scientific justification is the article's analytic proof.
                "quantum_realizable_for_this_family": 2 * v * v <= 1}
        if local:
            weights = tuple(2 * v * w + (1 - 2 * v) * Fraction(1, 16)
                            for w in boundary_weights)
            assert all(w >= 0 for w in weights)
            assert sum(weights) == 1
            for x, y in SETTINGS:
                for a, b in OUTCOMES:
                    assert project_distribution(weights, x, y, a, b) == \
                        probability(v, x, y, a, b)
            case["local_witness_weights_in_assignment_order"] = list(map(str, weights))
        else:
            assert chsh > 2
            case["global_probability_obstruction"] = "CHSH > 2"
        cases.append(case)

    # The four PR conditions require parities (0, 0, 0, 1). Every
    # deterministic assignment has even XOR across the four conditions.
    for a0, a1, b0, b1 in ASSIGNMENTS:
        assert (a0 ^ b0) ^ (a0 ^ b1) ^ (a1 ^ b0) ^ (a1 ^ b1) == 0
    assert 0 ^ 0 ^ 0 ^ 1 == 1
    assert support_assignments(Fraction(1)) == ()
    assert [case["chsh"] for case in cases] == ["0", "2", "12/5", "3", "4"]

    result = {
        "scope": "Exact finite teaching calculation; no experimental data; no general LP solver.",
        "probability_formula": "P_v(a,b|x,y) = (1 + v*(-1)^(a+b+x*y))/4",
        "quantum_classification_basis": (
            "Analytic Pauli/Bell-state realization and Tsirelson bound in the companion article; "
            "this enumeration does not independently prove that bound."),
        "assignment_coordinates": ["a0", "a1", "b0", "b1"],
        "assignment_order": [list(a) for a in ASSIGNMENTS],
        "deterministic_chsh_values": list(chsh_values),
        "local_boundary": {
            "v": "1/2", "assignments_with_chsh_2": [list(a) for a in boundary],
            "weight_per_listed_assignment": "1/8", "all_context_rows_reconstructed": True},
        "pr_support_obstruction": {"required_parities": [0, 0, 0, 1],
                                   "xor_for_any_global_assignment": 0,
                                   "xor_of_required_parities": 1},
        "cases": cases,
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
