"""Verification module for `examples/benchmark-4-tetranacci.md`.

Tetranacci sits at the **cardinality boundary** of the step-n / bilattice
correspondence (`theorems/step-n-and-bilattice-correspondence.md`): n = 4
matches |FOUR|, so the alphabet can be in bijection with the bilattice
carrier under the default valuation {a → bot, b → t, c → f, d → top}.
For n ≥ 5 no bilattice substructure has cardinality n, so this is the
last named substitution where every bilattice value appears exactly once.

Tetranacci is also the first case exhibiting **all four firing types
simultaneously** — Padovan has top but no bot; Fibonacci has neither.
The corresponding inclusion-exclusion is

$$|L_+| + |L_-| - |\\top| + |\\bot| = 2 + 2 - 1 + 1 = 4 = n,$$

with the bot-firing's "+1" compensating for the top-firing's "−1": the
bot-firing is *invisible* to the shadow on both sides, while the top-firing
is *double-counted*, and the two cancel out at the cardinality boundary.
"""

from __future__ import annotations

from ..link import verifies
from ..primitives import (
    TETRANACCI,
    TRIBONACCI,
    TETRANACCI_DEFAULT_VALUATION,
)


# --- corpus-native: cardinality boundary, all four firing types, full inclusion-exclusion ---


@verifies(
    "examples/benchmark-4-tetranacci.md",
    claim=(
        "Step 4 (all four firing types, full inclusion-exclusion): under "
        "default valuation {a → bot, b → t, c → f, d → top}, firing types "
        "{1 truth-only, 1 falsity-only, 1 top-firing, 1 bot-firing} — the "
        "first case with all four. Shadow split (Z^2, Z^2). Inclusion-"
        "exclusion 2 + 2 - 1 + 1 = 4 = n: the bot-firing's +1 (invisible to "
        "shadow) compensates for the top-firing's −1 (double-counted)."
    ),
)
def test_step_4_full_firing_taxonomy_and_inclusion_exclusion() -> None:
    val = TETRANACCI_DEFAULT_VALUATION
    counts = TETRANACCI.firing_counts(val)
    assert counts == {"truth-only": 1, "falsity-only": 1, "top-firing": 1, "bot-firing": 1}

    l_plus, l_minus = TETRANACCI.shadow_ranks(val)
    assert (l_plus, l_minus) == (2, 2)

    ie = TETRANACCI.inclusion_exclusion_relation(val)
    assert ie["l_plus"] + ie["l_minus"] - ie["n_top"] + ie["n_bot"] == ie["n_alphabet"]
    assert ie["n_alphabet"] == 4


@verifies(
    "examples/benchmark-4-tetranacci.md",
    claim=(
        "Step 6 + Step 8 (substitution-rule self-duality fails at the "
        "cardinality boundary): negation permutation fixes a (bot) and "
        "d (top), swaps b ↔ c. M does not commute with this permutation, "
        "confirming that the alphabet-bilattice cardinality match at n = 4 "
        "is not promoted to a structural correspondence — the bilattice-"
        "correspondence theorem's open question is resolved negatively at n = 4."
    ),
)
def test_step_6_no_canonical_correspondence_at_cardinality_boundary() -> None:
    assert not TETRANACCI.is_substitution_rule_self_dual(TETRANACCI_DEFAULT_VALUATION)


# --- classical recovery: framework reproduces AP rank Z^4 (and Z^3 for tribonacci sub-test) ---


@verifies(
    "examples/benchmark-4-tetranacci.md",
    claim=(
        "Steps 2 + 3 (literature recovery): Tetranacci is primitive non-"
        "singular unimodular Pisot (tetranacci constant ≈ 1.9276); step-n "
        "rank theorem gives H^1(Ω_σ) ≅ Z^4 with Smith invariants (1, 1, 1, 1)."
    ),
)
def test_steps_2_and_3_tetranacci_ap_recovery() -> None:
    is_prim, _ = TETRANACCI.is_primitive()
    assert is_prim
    assert not TETRANACCI.is_singular()
    assert TETRANACCI.is_unimodular()
    assert TETRANACCI.is_pisot()
    assert TETRANACCI.cohomological_rank() == 4
    assert TETRANACCI.is_unimodular_torsion_free()


@verifies(
    "examples/benchmark-4-tetranacci.md",
    claim=(
        "Tribonacci sub-test (analogous step-3 case): primitive non-singular "
        "unimodular Pisot, H^1 ≅ Z^3. Treated as analogue, not assigned a "
        "default d-frame valuation in the corpus markdown."
    ),
)
def test_tribonacci_ap_recovery() -> None:
    is_prim, _ = TRIBONACCI.is_primitive()
    assert is_prim
    assert not TRIBONACCI.is_singular()
    assert TRIBONACCI.is_unimodular()
    assert TRIBONACCI.is_pisot()
    assert TRIBONACCI.cohomological_rank() == 3
    assert TRIBONACCI.is_unimodular_torsion_free()
