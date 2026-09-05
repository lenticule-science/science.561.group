"""Verification module for `examples/benchmark-1-fibonacci.md`.

Fibonacci is the simplest aperiodic case in the corpus's framework. The
predication-categorical content of this benchmark — distinct from the
classical Anderson-Putnam rederivation it also performs — lives in:

- **Step 4** (`theorems/d-frame-cohomology-comparison.md` instance): the
  per-letter d-frame structure {a → t, b → f}, its shadow-split (Z^1, Z^1),
  and the inclusion-exclusion accounting `|L_+| + |L_-| - |⊤| + |⊥| = n`
  with no top- or bot-firings.
- **Step 6** (`theorems/step-n-and-bilattice-correspondence.md` open
  question): substitution-rule self-duality test M·P = P·M under the
  default valuation. Fibonacci fails this test (M does not commute with
  the negation-induced swap), distinguishing it from Thue-Morse.

Steps 2/3/5 (regime, AP cohomology, Verdier dual) are classical
substitution-dynamics facts; we keep them as "framework recovers literature"
checks rather than as the substantive corpus claim of this benchmark.
"""

from __future__ import annotations

from ..link import verifies
from ..primitives import FIBONACCI, FIBONACCI_DEFAULT_VALUATION


# --- corpus-native: d-frame shadow + bilattice correspondence ---


@verifies(
    "examples/benchmark-1-fibonacci.md",
    claim=(
        "Step 4 (d-frame cohomology comparison): under default valuation "
        "{a → t, b → f}, firing types are 1 truth-only + 1 falsity-only with "
        "no top/bot, shadow split is (Z^1, Z^1), and inclusion-exclusion "
        "|L_+| + |L_-| - |⊤| + |⊥| = 1 + 1 - 0 + 0 = 2 = n"
    ),
)
def test_step_4_d_frame_shadow_inclusion_exclusion() -> None:
    val = FIBONACCI_DEFAULT_VALUATION
    counts = FIBONACCI.firing_counts(val)
    assert counts == {"truth-only": 1, "falsity-only": 1, "top-firing": 0, "bot-firing": 0}

    l_plus, l_minus = FIBONACCI.shadow_ranks(val)
    assert (l_plus, l_minus) == (1, 1)

    ie = FIBONACCI.inclusion_exclusion_relation(val)
    assert ie["l_plus"] + ie["l_minus"] - ie["n_top"] + ie["n_bot"] == ie["n_alphabet"]
    assert ie["n_alphabet"] == 2


@verifies(
    "examples/benchmark-1-fibonacci.md",
    claim=(
        "Step 6 (step-n / bilattice correspondence open question): Fibonacci "
        "is NOT substitution-rule self-dual — M does not commute with the "
        "negation-induced swap P. Distinguishes Fibonacci from Thue-Morse."
    ),
)
def test_step_6_substitution_rule_not_self_dual() -> None:
    assert not FIBONACCI.is_substitution_rule_self_dual(FIBONACCI_DEFAULT_VALUATION)


# --- classical recovery: framework reproduces Anderson-Putnam answer ---


@verifies(
    "examples/benchmark-1-fibonacci.md",
    claim=(
        "Step 2 (literature recovery): Fibonacci is primitive (witness M^2), "
        "unimodular (det = -1), Pisot (Perron eigenvalue = golden ratio). "
        "Establishes the hypotheses of the step-n cohomological-rank theorem."
    ),
)
def test_step_2_regime_recovery() -> None:
    is_prim, witness = FIBONACCI.is_primitive()
    assert is_prim and witness <= 2
    assert FIBONACCI.is_unimodular()
    assert FIBONACCI.determinant() == -1
    assert FIBONACCI.is_pisot()
    assert FIBONACCI.regime() == "aperiodic"


@verifies(
    "examples/benchmark-1-fibonacci.md",
    claim=(
        "Steps 3 + 5 (literature recovery): step-n cohomological-rank theorem "
        "and Verdier duality both give H^1(Ω_σ) ≅ H_1 ≅ Z^2 with Smith "
        "invariants (1, 1). Matches Anderson-Putnam."
    ),
)
def test_steps_3_and_5_ap_and_verdier_recovery() -> None:
    assert FIBONACCI.cohomological_rank() == 2
    invariants = FIBONACCI.smith_invariants()
    assert all(abs(inv) == 1 for inv in invariants)
    assert FIBONACCI.is_unimodular_torsion_free()

    from sympy.matrices.normalforms import smith_normal_form
    snf_M = smith_normal_form(FIBONACCI.matrix)
    h1_dual_invariants = tuple(snf_M[i, i] for i in range(snf_M.rows))
    assert sum(1 for inv in h1_dual_invariants if inv != 0) == 2
