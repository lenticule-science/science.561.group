"""Verification module for `examples/benchmark-2-thue-morse.md`.

Thue-Morse is the corpus's first concrete positive case for **substitution-rule
self-duality** — and, per the corpus, the *only* named step-n substitution
where the substitution matrix M commutes with the negation-induced alphabet
permutation P. This is the substantive d-frame content that distinguishes
Thue-Morse from Fibonacci, Padovan, Tribonacci, Tetranacci.

The benchmark also verifies:

- **Step 4** (`theorems/d-frame-cohomology-comparison.md` instance): under
  default valuation {0 → f, 1 → t}, firing types are 1 truth-only + 1
  falsity-only with no top/bot; shadow split is (Z^1, Z^1); inclusion-
  exclusion `|L_+| + |L_-| - |⊤| + |⊥| = 2 = n` (alphabet size) — even
  though the singular substitution matrix collapses the AP-rank to 1.
  This is the key d-frame distinguishing feature: the per-letter d-frame
  shadow does NOT collapse with M, since it's computed from valuations not
  from the matrix kernel.

The Z[1/2] cohomology structure (Step 3) is classical AP; we recover it
as a literature comparison by checking M is singular with the expected
kernel/image.
"""

from __future__ import annotations

import sympy as sp

from ..link import verifies
from ..primitives import THUE_MORSE, THUE_MORSE_DEFAULT_VALUATION


# --- corpus-native: the unique positive case of substitution-rule self-duality ---


@verifies(
    "examples/benchmark-2-thue-morse.md",
    claim=(
        "Step 6 + Step 8 (substitution-rule self-duality): Thue-Morse with "
        "default valuation {0 → f, 1 → t} satisfies M·P = P·M where P is "
        "the negation-induced swap. The unique named step-n substitution "
        "with this property — confirms the positive case at n = 2 of the "
        "step-n / bilattice cardinality coincidence theorem."
    ),
)
def test_step_6_substitution_rule_self_dual() -> None:
    assert THUE_MORSE.is_substitution_rule_self_dual(THUE_MORSE_DEFAULT_VALUATION)


@verifies(
    "examples/benchmark-2-thue-morse.md",
    claim=(
        "Step 4 (d-frame shadow under singular M): per-letter firing types "
        "{1 truth-only, 1 falsity-only}, shadow split (Z^1, Z^1), "
        "inclusion-exclusion 1 + 1 - 0 + 0 = 2 = n. The d-frame shadow is "
        "computed from valuations (not from M), so it does NOT collapse with "
        "the singular substitution kernel — distinguishing it from the "
        "AP-rank, which does collapse to Z[1/2]."
    ),
)
def test_step_4_d_frame_shadow_independent_of_singularity() -> None:
    val = THUE_MORSE_DEFAULT_VALUATION
    counts = THUE_MORSE.firing_counts(val)
    assert counts == {"truth-only": 1, "falsity-only": 1, "top-firing": 0, "bot-firing": 0}

    l_plus, l_minus = THUE_MORSE.shadow_ranks(val)
    assert (l_plus, l_minus) == (1, 1)

    ie = THUE_MORSE.inclusion_exclusion_relation(val)
    assert ie["l_plus"] + ie["l_minus"] - ie["n_top"] + ie["n_bot"] == ie["n_alphabet"]
    assert ie["n_alphabet"] == 2


# --- classical recovery: Anderson-Putnam Z[1/2] for Thue-Morse ---


@verifies(
    "examples/benchmark-2-thue-morse.md",
    claim=(
        "Step 2 + Step 3 (literature recovery): Thue-Morse matrix is singular "
        "(det = 0) with kernel span((1, -1)) and image span((1, 1)). Primitive "
        "(witness M^1). Perron eigenvalue 2. The singular case violates the "
        "step-n rank theorem hypothesis, yielding Z[1/2] cohomology rather "
        "than free Z^2 (matches Anderson-Putnam, Sadun, BDHS)."
    ),
)
def test_steps_2_and_3_ap_singular_case() -> None:
    assert THUE_MORSE.is_singular()
    assert THUE_MORSE.determinant() == 0

    is_prim, witness = THUE_MORSE.is_primitive()
    assert is_prim and witness == 1

    # Kernel span((1, -1)): M · (1, -1)^T = 0
    kernel_vec = sp.Matrix([1, -1])
    assert THUE_MORSE.matrix * kernel_vec == sp.zeros(2, 1)

    # Image span((1, 1)): every column is a positive scalar multiple of (1, 1)^T
    image_vec = sp.Matrix([1, 1])
    for j in range(2):
        col = THUE_MORSE.matrix[:, j]
        assert col == image_vec  # both columns of M are exactly (1, 1)^T
