"""Verification module for `examples/benchmark-3-padovan.md`.

Padovan is the corpus's first **mixed-orbit** case: under default valuation
{a → t, b → f, c → top}, it has both asymmetric (truth-only, falsity-only)
firings AND a top-firing on letter c — the first concrete case where the
shadow inclusion-exclusion has a non-trivial top-term:

$$|L_+| + |L_-| - |\\top| + |\\bot| = 2 + 2 - 1 + 0 = 3 = n.$$

The top-firing on c is **double-counted** in the shadow (appears on both
sides) but counted once in the AP total — visible inclusion-exclusion. This
is genuine d-frame content beyond the AP shadow.

Substitution-rule self-duality fails (only Thue-Morse satisfies it among
named step-n cases).
"""

from __future__ import annotations

from ..link import verifies
from ..primitives import PADOVAN, PADOVAN_DEFAULT_VALUATION


# --- corpus-native: first mixed-orbit case with top-firing in inclusion-exclusion ---


@verifies(
    "examples/benchmark-3-padovan.md",
    claim=(
        "Step 4 (first non-trivial top-firing in inclusion-exclusion): under "
        "default valuation {a → t, b → f, c → top}, firing types "
        "{1 truth-only, 1 falsity-only, 1 top-firing, 0 bot-firing}. "
        "Shadow split (Z^2, Z^2). Inclusion-exclusion 2 + 2 - 1 + 0 = 3 = n; "
        "the top-firing on c is double-counted in the shadow, accounting for "
        "the gap between |S(H^1_dFrm)| sum and the AP rank."
    ),
)
def test_step_4_inclusion_exclusion_with_top_firing() -> None:
    val = PADOVAN_DEFAULT_VALUATION
    counts = PADOVAN.firing_counts(val)
    assert counts == {"truth-only": 1, "falsity-only": 1, "top-firing": 1, "bot-firing": 0}

    l_plus, l_minus = PADOVAN.shadow_ranks(val)
    assert (l_plus, l_minus) == (2, 2)

    ie = PADOVAN.inclusion_exclusion_relation(val)
    assert ie["l_plus"] + ie["l_minus"] - ie["n_top"] + ie["n_bot"] == ie["n_alphabet"]
    assert ie["n_alphabet"] == 3


@verifies(
    "examples/benchmark-3-padovan.md",
    claim=(
        "Step 6 (substitution-rule self-duality fails): negation permutation "
        "swaps a ↔ b and fixes c (the top-valued letter). M does not commute "
        "with this permutation — distinguishing Padovan from Thue-Morse."
    ),
)
def test_step_6_substitution_rule_not_self_dual() -> None:
    assert not PADOVAN.is_substitution_rule_self_dual(PADOVAN_DEFAULT_VALUATION)


# --- classical recovery: framework reproduces AP rank Z^3 for plastic-number Pisot ---


@verifies(
    "examples/benchmark-3-padovan.md",
    claim=(
        "Steps 2 + 3 (literature recovery): primitive non-singular unimodular "
        "Pisot (Perron = plastic number); step-n rank theorem applies, "
        "H^1(Ω_σ) ≅ Z^3 with Smith invariants (1, 1, 1)."
    ),
)
def test_steps_2_and_3_ap_recovery() -> None:
    is_prim, _ = PADOVAN.is_primitive()
    assert is_prim
    assert PADOVAN.is_unimodular()
    assert PADOVAN.determinant() == 1
    assert PADOVAN.is_pisot()
    assert PADOVAN.cohomological_rank() == 3
    assert PADOVAN.is_unimodular_torsion_free()
