"""Substitution primitive: integer-matrix substitution dynamical systems.

A `SubstitutionMatrix` is the matrix of letter-image counts for a substitution
σ : Σ → Σ*. Used by the regime-classifier, Anderson-Putnam cohomology, d-frame
cohomology orbit types, and the benchmark suite.

Pre-defined corpus instances: `FIBONACCI`, `THUE_MORSE`, `PADOVAN`, `TRIBONACCI`,
`TETRANACCI`. These match the benchmark examples and the strong-MLD-orbit
classification.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Hashable, Mapping

import sympy as sp

from ..link import defines
from .bilattice import BilatticeValue, negation_permutation


@defines("objects/step-n-substitution-rule.md")
@dataclass(frozen=True)
class SubstitutionMatrix:
    """Substitution matrix: M[i,j] = count of letter i in σ(letter j)."""

    matrix: sp.Matrix

    def __post_init__(self) -> None:
        if self.matrix.rows != self.matrix.cols:
            raise ValueError(f"substitution matrix must be square, got {self.matrix.shape}")
        for entry in self.matrix:
            if not entry.is_integer or entry < 0:
                raise ValueError(f"substitution matrix must have non-negative integer entries, got {entry}")

    @property
    def n(self) -> int:
        """Alphabet size."""
        return self.matrix.rows

    def determinant(self) -> sp.Expr:
        return self.matrix.det()

    def is_unimodular(self) -> bool:
        return abs(self.determinant()) == 1

    def is_singular(self) -> bool:
        return self.determinant() == 0

    def is_primitive(self, max_power: int = 12) -> tuple[bool, int]:
        """Check whether some power of M has strictly positive entries.

        Returns (is_primitive, witness_power); witness_power is -1 if not
        found within max_power.
        """
        P = self.matrix.copy()
        for k in range(1, max_power + 1):
            if all(P[i, j] > 0 for i in range(self.n) for j in range(self.n)):
                return True, k
            P = P * self.matrix
        return False, -1

    def _eigenvalue_abs_values(self) -> list[float]:
        """Return absolute values of all eigenvalues (with multiplicity), sorted descending.

        Uses numerical evaluation; sufficient for the Pisot / Perron checks the
        corpus actually uses.
        """
        roots = self.matrix.charpoly().all_roots(multiple=True, radicals=False)
        return sorted(
            [abs(complex(ev.evalf())) for ev in roots],
            reverse=True,
        )

    def perron_eigenvalue(self) -> sp.Expr:
        """The Perron-Frobenius eigenvalue (largest real eigenvalue) of M.

        Defined for primitive non-negative matrices; raises if not primitive.
        Returns the symbolic value; numerical via .evalf().
        """
        is_prim, _ = self.is_primitive()
        if not is_prim:
            raise ValueError("Perron-Frobenius eigenvalue requires primitivity")
        roots = self.matrix.charpoly().all_roots(multiple=True, radicals=False)
        # Pick the root with largest absolute value (Perron is dominant for primitive)
        return max(roots, key=lambda ev: abs(complex(ev.evalf())))

    def is_pisot(self) -> bool:
        """Pisot substitution: Perron eigenvalue > 1 and all other eigenvalues
        have absolute value < 1.

        Uses numerical eigenvalue absolute values with a tolerance of 1e-9.
        """
        abs_vals = self._eigenvalue_abs_values()
        if not abs_vals:
            return False
        perron_abs = abs_vals[0]
        if perron_abs <= 1.0 + 1e-9:
            return False
        # All other eigenvalues must have absolute value < 1
        for v in abs_vals[1:]:
            if v >= 1.0 - 1e-9:
                return False
        return True

    def regime(self) -> str:
        """Classify the substitution into one of the four regimes.

        For primitive non-singular substitution matrices on finite alphabets,
        the resulting settling is aperiodic (κ ≥ ω₁) by the corpus's
        Anderson-Putnam construction.

        For non-primitive or singular matrices, the regime depends on more
        detailed analysis (not implemented here).
        """
        if self.is_singular():
            return "singular (degenerate; not in standard four-regime classification)"
        is_prim, _ = self.is_primitive()
        if is_prim:
            return "aperiodic"
        return "non-primitive (further analysis needed)"

    def smith_invariants(self) -> tuple[sp.Expr, ...]:
        """Smith normal form invariants of M^T (the diagonal entries of the
        Smith form of M^T over Z). Used for torsion analysis of H^1.
        """
        from sympy.matrices.normalforms import smith_normal_form
        snf = smith_normal_form(self.matrix.T)
        return tuple(snf[i, i] for i in range(snf.rows))

    def cohomological_rank(self) -> int:
        """Rank of H^1(Ω_σ) for the substitution settling.

        For primitive non-singular substitutions: rank = n (alphabet size)
        — the corpus's step-n cohomological rank theorem.

        For singular matrices: rank requires the Z[1/d]-localization analysis
        and is not handled here directly (raises ValueError).
        """
        if self.is_singular():
            raise ValueError(
                "cohomological rank for singular substitution requires "
                "Z[1/d]-localization analysis (not implemented in this primitive)"
            )
        return self.n

    def is_unimodular_torsion_free(self) -> bool:
        """For unimodular substitutions, H^1 has no torsion (Smith invariants all 1)."""
        if not self.is_unimodular():
            return False
        invariants = self.smith_invariants()
        return all(abs(inv) == 1 for inv in invariants)

    # --- corpus-native operations: per-letter d-frame structure under a bilattice valuation ---
    # These operationalise the per-letter table in Step 4 of each substitution benchmark
    # (`examples/benchmark-N-*.md`) and the substitution-rule self-duality test in Step 6,
    # which together instantiate `theorems/d-frame-cohomology-comparison.md` and the open
    # question in `theorems/step-n-and-bilattice-correspondence.md`.

    def firing_type(self, letter_index: int, valuation: Mapping[int, BilatticeValue]) -> str:
        """Per-letter firing type derived from its bilattice value.

        Per `examples/benchmark-N-*.md` Step 4: a letter valued **t** fires
        truth-only (L_+ rank 1, L_- rank 0); **f** fires falsity-only;
        **top** fires both sides (L_+ = L_- = 1) with non-trivial consistency
        relation; **bot** fires neither.
        """
        v = valuation[letter_index]
        return {
            BilatticeValue.T: "truth-only",
            BilatticeValue.F: "falsity-only",
            BilatticeValue.TOP: "top-firing",
            BilatticeValue.BOT: "bot-firing",
        }[v]

    def firing_counts(self, valuation: Mapping[int, BilatticeValue]) -> dict[str, int]:
        """Counts of each firing type across the alphabet (Step 4 firing-type table)."""
        counts = {"truth-only": 0, "falsity-only": 0, "top-firing": 0, "bot-firing": 0}
        for i in range(self.n):
            counts[self.firing_type(i, valuation)] += 1
        return counts

    def shadow_ranks(self, valuation: Mapping[int, BilatticeValue]) -> tuple[int, int]:
        """Per-letter L_+ / L_- rank totals — the d-frame shadow split.

        From `theorems/d-frame-cohomology-comparison.md`, the shadow functor
        S sends a d-frame to (S_+(L_+), S_-(L_-)). Per-letter:
        L_+ rank = 1 if the bilattice value has a t-component (i.e. is t or top), else 0.
        L_- rank = 1 if the bilattice value has an f-component (i.e. is f or top), else 0.
        Letter valued **bot** contributes 0 to both — the letter has no evidence.
        """
        l_plus = sum(
            1 for i in range(self.n)
            if valuation[i] in (BilatticeValue.T, BilatticeValue.TOP)
        )
        l_minus = sum(
            1 for i in range(self.n)
            if valuation[i] in (BilatticeValue.F, BilatticeValue.TOP)
        )
        return l_plus, l_minus

    def inclusion_exclusion_relation(
        self, valuation: Mapping[int, BilatticeValue]
    ) -> dict[str, int]:
        """Returns the components of the d-frame shadow inclusion-exclusion relation.

        Per Step 4 of the substitution benchmark notes:
        $$|L_+| + |L_-| - |\\top| + |\\bot| = n$$

        - top-firings are double-counted in (L_+, L_-) so subtract once,
        - bot-firings are invisible to both sides so add back once.

        The relation should equal the alphabet size n (the AP-rank when the
        per-firing accounting matches the substitution's H^1 rank). Returned
        as a dict with keys `l_plus, l_minus, n_top, n_bot, n_alphabet`.
        """
        l_plus, l_minus = self.shadow_ranks(valuation)
        counts = self.firing_counts(valuation)
        return {
            "l_plus": l_plus,
            "l_minus": l_minus,
            "n_top": counts["top-firing"],
            "n_bot": counts["bot-firing"],
            "n_alphabet": self.n,
        }

    def is_substitution_rule_self_dual(
        self, valuation: Mapping[int, BilatticeValue]
    ) -> bool:
        """Test whether M commutes with the negation-induced alphabet permutation P.

        This is the Step 6 / Step 8 substitution-rule self-duality test from the
        benchmark notes, and the open structural question in
        `theorems/step-n-and-bilattice-correspondence.md`. Returns True iff
        sigma ∘ ~ = ~ ∘ sigma at the substitution-matrix level under the given
        valuation. Among named step-n substitutions in the corpus, only
        Thue-Morse with valuation {0: f, 1: t} returns True.
        """
        alphabet = list(range(self.n))
        P = negation_permutation(valuation, alphabet)
        return self.matrix * P == P * self.matrix


# Pre-defined corpus instances. These match `tools/anderson-putnam-cohomology/`
# and `tools/regime-classifier/`'s SUBSTITUTIONS dict.
FIBONACCI = SubstitutionMatrix(sp.Matrix([[1, 1], [1, 0]]))
"""Fibonacci substitution: σ(a) = ab, σ(b) = a. Matrix det = -1 (unimodular)."""

THUE_MORSE = SubstitutionMatrix(sp.Matrix([[1, 1], [1, 1]]))
"""Thue-Morse substitution: σ(a) = ab, σ(b) = ba. Matrix det = 0 (singular!)."""

PADOVAN = SubstitutionMatrix(sp.Matrix([[0, 1, 0], [0, 0, 1], [1, 1, 0]]))
"""Padovan substitution. Matrix det = 1 (unimodular)."""

TRIBONACCI = SubstitutionMatrix(sp.Matrix([[1, 1, 0], [1, 0, 1], [1, 0, 0]]))
"""Tribonacci substitution. Unimodular."""

TETRANACCI = SubstitutionMatrix(sp.Matrix([[1, 1, 0, 0], [1, 0, 1, 0], [1, 0, 0, 1], [1, 0, 0, 0]]))
"""Tetranacci substitution. Unimodular."""


# Default d-frame valuations from each benchmark note's Step 1. These are the
# specific labelings (alphabet → BilatticeValue) under which the corpus's
# Step 4 firing-type tables and Step 6 substitution-rule self-duality tests
# are stated. The labelings are *choices* — except for Thue-Morse, where the
# labeling is the unique one making the substitution rule respect bilattice
# negation (per `examples/benchmark-2-thue-morse.md` Step 6 / Step 8).

FIBONACCI_DEFAULT_VALUATION = {0: BilatticeValue.T, 1: BilatticeValue.F}
"""Fibonacci default: a → t, b → f (`examples/benchmark-1-fibonacci.md` Step 1)."""

THUE_MORSE_DEFAULT_VALUATION = {0: BilatticeValue.F, 1: BilatticeValue.T}
"""Thue-Morse default: 0 → f, 1 → t (`examples/benchmark-2-thue-morse.md` Step 1).

This is the unique labeling of {0, 1} → {t, f} under which sigma commutes
with bilattice negation: M·P = P·M where P is the swap permutation."""

PADOVAN_DEFAULT_VALUATION = {0: BilatticeValue.T, 1: BilatticeValue.F, 2: BilatticeValue.TOP}
"""Padovan default: a → t, b → f, c → top (`examples/benchmark-3-padovan.md` Step 1)."""

TRIBONACCI_DEFAULT_VALUATION = {0: BilatticeValue.T, 1: BilatticeValue.F, 2: BilatticeValue.TOP}
"""Tribonacci default: a → t, b → f, c → top (analogue of Padovan; matches benchmark-4 sub-test)."""

TETRANACCI_DEFAULT_VALUATION = {
    0: BilatticeValue.BOT,
    1: BilatticeValue.T,
    2: BilatticeValue.F,
    3: BilatticeValue.TOP,
}
"""Tetranacci default: a → bot, b → t, c → f, d → top
(`examples/benchmark-4-tetranacci.md` Step 1). The unique named substitution
where every bilattice value is represented exactly once — the cardinality
boundary of `theorems/step-n-and-bilattice-correspondence.md`."""
