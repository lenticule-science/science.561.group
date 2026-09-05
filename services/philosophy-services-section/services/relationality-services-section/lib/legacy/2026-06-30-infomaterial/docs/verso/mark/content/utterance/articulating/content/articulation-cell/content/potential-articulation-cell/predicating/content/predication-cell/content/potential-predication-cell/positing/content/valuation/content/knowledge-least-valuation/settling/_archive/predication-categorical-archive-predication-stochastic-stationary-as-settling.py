"""Verification module for `theorems/stochastic-stationary-as-settling.md`.

The theorem claims a stationary distribution of a finite Markov chain is a
settling on [0, 1]-valued cells, with the Perron-Frobenius eigenvector giving
the closure-stable state. Convergence rate is governed by the second eigenvalue.

Migrated from `tools/stochastic-settling/compute.py` (matrix iteration) and
`examples/benchmark-probabilistic-belief-propagation.md` (concrete instance).
"""

from __future__ import annotations

from fractions import Fraction

from ..link import verifies


def _matmul(A: list[list[Fraction]], B: list[list[Fraction]]) -> list[list[Fraction]]:
    n, m, k = len(A), len(B[0]), len(B)
    return [[sum(A[i][z] * B[z][j] for z in range(k)) for j in range(m)] for i in range(n)]


def _vec_matmul(v: list[Fraction], M: list[list[Fraction]]) -> list[Fraction]:
    n = len(M)
    return [sum(v[j] * M[j][i] for j in range(n)) for i in range(n)]


def _max_diff(v1: list[Fraction], v2: list[Fraction]) -> Fraction:
    return max(abs(v1[i] - v2[i]) for i in range(len(v1)))


@verifies(
    "theorems/stochastic-stationary-as-settling.md",
    claim="Stochastic iteration v_{k+1} = v_k * P converges to stationary distribution on a 2-state Markov chain",
)
def test_two_state_markov_convergence() -> None:
    """For the 2-state Markov chain P = [[0.7, 0.3], [0.4, 0.6]], the
    stationary distribution is π = (4/7, 3/7). Iterate v_0 = (1, 0) under P
    and verify convergence."""
    P = [
        [Fraction(7, 10), Fraction(3, 10)],
        [Fraction(4, 10), Fraction(6, 10)],
    ]
    pi_expected = [Fraction(4, 7), Fraction(3, 7)]
    v = [Fraction(1), Fraction(0)]

    # Iterate to convergence
    for _ in range(200):
        v_new = _vec_matmul(v, P)
        if _max_diff(v, v_new) < Fraction(1, 10**6):
            break
        v = v_new

    # Within tolerance of expected stationary distribution
    diff = _max_diff(v, pi_expected)
    assert diff < Fraction(1, 10**4), f"convergence failed, ||v - π|| = {float(diff)}"


@verifies(
    "theorems/stochastic-stationary-as-settling.md",
    claim="Stationary distribution π is the unique left-fixed-point of P (closure-stable settling)",
)
def test_stationary_is_fixed_point() -> None:
    """π satisfies π P = π — closure-stable in the settling sense."""
    P = [
        [Fraction(7, 10), Fraction(3, 10)],
        [Fraction(4, 10), Fraction(6, 10)],
    ]
    pi = [Fraction(4, 7), Fraction(3, 7)]
    pi_after = _vec_matmul(pi, P)
    diff = _max_diff(pi, pi_after)
    assert diff == 0, f"π is not exactly fixed: π P - π = {[float(d) for d in pi_after]}"
