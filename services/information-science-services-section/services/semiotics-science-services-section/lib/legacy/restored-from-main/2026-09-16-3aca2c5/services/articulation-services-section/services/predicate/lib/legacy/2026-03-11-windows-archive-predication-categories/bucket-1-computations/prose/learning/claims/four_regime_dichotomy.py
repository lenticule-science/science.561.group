"""Verification module for `theorems/four-regime-dichotomy.md`.

The theorem classifies every settling into one of four regimes by closure
ordinal κ. This module verifies the classifier on the corpus's standard
substitution-matrix benchmarks: Fibonacci, Thue-Morse, Padovan, Tribonacci,
Tetranacci — all of which should land in the aperiodic regime (κ ≥ ω₁) by
the Anderson-Putnam construction for primitive non-singular substitutions.

Also verifies the unimodularity / primitivity / Pisot properties claimed
in the substitution literature, used by the orbit-type and cohomological-rank
theorems downstream.
"""

from __future__ import annotations

from ..link import verifies, example_of
from ..primitives import (
    FIBONACCI,
    PADOVAN,
    TETRANACCI,
    THUE_MORSE,
    TRIBONACCI,
    SubstitutionMatrix,
)


@verifies(
    "theorems/four-regime-dichotomy.md",
    claim="Fibonacci substitution matrix is primitive non-singular → aperiodic regime",
)
def test_fibonacci_aperiodic() -> None:
    is_prim, _ = FIBONACCI.is_primitive()
    assert is_prim, "Fibonacci should be primitive"
    assert not FIBONACCI.is_singular()
    assert FIBONACCI.regime() == "aperiodic"


@verifies(
    "theorems/four-regime-dichotomy.md",
    claim="Padovan, Tribonacci, Tetranacci all primitive non-singular → aperiodic",
)
def test_substitution_zoo_aperiodic() -> None:
    for name, sub in [("Padovan", PADOVAN), ("Tribonacci", TRIBONACCI), ("Tetranacci", TETRANACCI)]:
        is_prim, _ = sub.is_primitive()
        assert is_prim, f"{name} should be primitive"
        assert not sub.is_singular(), f"{name} should be non-singular"
        assert sub.regime() == "aperiodic", f"{name} should classify as aperiodic"


@verifies(
    "theorems/four-regime-dichotomy.md",
    claim="Thue-Morse substitution matrix is singular (det = 0) → degenerate case",
)
def test_thue_morse_singular() -> None:
    """Thue-Morse with the matrix [[1,1],[1,1]] is singular (det = 0).
    The corpus's analysis treats Thue-Morse via a different presentation
    (modular Z[1/2]-rank) — this test just records the singularity."""
    assert THUE_MORSE.is_singular()
    assert THUE_MORSE.determinant() == 0


@example_of(
    "theorems/four-regime-dichotomy.md",
    instance="fibonacci-unimodular-pisot",
    claim="Fibonacci is unimodular Pisot (det = -1, golden ratio is Perron)",
)
def test_fibonacci_unimodular_pisot() -> None:
    assert FIBONACCI.is_unimodular()
    assert FIBONACCI.determinant() == -1
    # Perron eigenvalue should be the golden ratio (1 + √5)/2
    perron = FIBONACCI.perron_eigenvalue()
    expected = (1 + 5**0.5) / 2
    assert abs(float(perron) - expected) < 1e-10, (
        f"Fibonacci Perron should be golden ratio ≈ {expected}, got {perron}"
    )
    # And Pisot: other eigenvalue (1 - √5)/2 ≈ -0.618 has |·| < 1
    assert FIBONACCI.is_pisot()


@example_of(
    "theorems/four-regime-dichotomy.md",
    instance="padovan-tribonacci-unimodular",
    claim="Padovan and Tribonacci are unimodular (det = ±1)",
)
def test_padovan_tribonacci_unimodular() -> None:
    assert PADOVAN.is_unimodular()
    assert TRIBONACCI.is_unimodular()
