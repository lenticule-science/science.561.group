"""Belnap 2⊗2 bilattice algebra — Python port of ``mash-engine``.

The wire encoding is the four named strings ``"None" | "True" | "False" |
"Both"`` per ``decisions/witness-pair-encoding-internal.md``. Internally we
carry a ``tuple[bool, bool]`` of ``(positive_evidence, negative_evidence)``::

    None  = (False, False)
    True  = (True,  False)
    False = (False, True)
    Both  = (True,  True)

The two orderings are::

    truth_leq:      a ≤_t b  iff a.pos ≤ b.pos AND b.neg ≤ a.neg
    knowledge_leq:  a ≤_k b  iff a.pos ≤ b.pos AND a.neg ≤ b.neg

``knowledge_join`` is the CRDT merge: positive ∪ positive, negative ∪
negative. Federation merges ride on it (see
``specs/network/federation-protocol.md``).

``fuse``/``restrict`` are the Lambek twist-product residuated pair on 2⊗2
(``a ⊙ p ≤_t q ⇔ p ≤_t (a ⇒ q)``); ``verify_adjunction`` enumerates all 64
triples (conformance vector §1).
"""

from __future__ import annotations

from dataclasses import dataclass
from enum import Enum
from typing import Final


class BilatticeValue(str, Enum):
    """Wire-form Belnap value. ``str`` mixin keeps JSON serialization stable."""

    NONE = "None"
    TRUE = "True"
    FALSE = "False"
    BOTH = "Both"

    @classmethod
    def from_pair(cls, pos: bool, neg: bool) -> "BilatticeValue":
        if pos and neg:
            return cls.BOTH
        if pos:
            return cls.TRUE
        if neg:
            return cls.FALSE
        return cls.NONE

    def pair(self) -> tuple[bool, bool]:
        return _PAIRS[self]


_PAIRS: Final[dict[BilatticeValue, tuple[bool, bool]]] = {
    BilatticeValue.NONE: (False, False),
    BilatticeValue.TRUE: (True, False),
    BilatticeValue.FALSE: (False, True),
    BilatticeValue.BOTH: (True, True),
}

VALUES: Final[tuple[BilatticeValue, ...]] = (
    BilatticeValue.NONE,
    BilatticeValue.TRUE,
    BilatticeValue.FALSE,
    BilatticeValue.BOTH,
)
"""Canonical iteration order for conformance vectors."""

POST_CLOSURE_VALUES: Final[tuple[BilatticeValue, ...]] = (
    BilatticeValue.TRUE,
    BilatticeValue.FALSE,
    BilatticeValue.BOTH,
)


def is_settled(v: BilatticeValue) -> bool:
    """``v`` is settled iff it is not ``None`` (carries some evidence)."""
    return v is not BilatticeValue.NONE


# ---------------------------------------------------------------------------
# Truth ordering ≤_t  (False ≤ None,Both ≤ True; None ‖ Both)
# ---------------------------------------------------------------------------


def truth_leq(a: BilatticeValue, b: BilatticeValue) -> bool:
    ap, an = a.pair()
    bp, bn = b.pair()
    return (ap <= bp) and (bn <= an)


def truth_meet(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    ap, an = a.pair()
    bp, bn = b.pair()
    return BilatticeValue.from_pair(min(ap, bp), max(an, bn))


def truth_join(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    ap, an = a.pair()
    bp, bn = b.pair()
    return BilatticeValue.from_pair(max(ap, bp), min(an, bn))


# ---------------------------------------------------------------------------
# Knowledge ordering ≤_k  (None ≤ True,False ≤ Both; True ‖ False)
# ---------------------------------------------------------------------------


def knowledge_leq(a: BilatticeValue, b: BilatticeValue) -> bool:
    ap, an = a.pair()
    bp, bn = b.pair()
    return (ap <= bp) and (an <= bn)


def knowledge_meet(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    ap, an = a.pair()
    bp, bn = b.pair()
    return BilatticeValue.from_pair(min(ap, bp), min(an, bn))


def knowledge_join(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    """CRDT merge: union both evidence sides. Commutative, associative, idempotent."""
    ap, an = a.pair()
    bp, bn = b.pair()
    return BilatticeValue.from_pair(max(ap, bp), max(an, bn))


# ---------------------------------------------------------------------------
# Negation
# ---------------------------------------------------------------------------


def negate(v: BilatticeValue) -> BilatticeValue:
    p, n = v.pair()
    return BilatticeValue.from_pair(n, p)


# ---------------------------------------------------------------------------
# Lambek twist-product residuated pair (fuse ⊣ restrict on 2⊗2)
# ---------------------------------------------------------------------------


def _b_and(x: bool, y: bool) -> bool:
    return x and y


def _b_impl(x: bool, y: bool) -> bool:
    """Boolean implication ``x → y``."""
    return not (x and not y)


def fuse(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    """Lambek product ⊙ — left adjoint of :func:`restrict`."""
    x, y = a.pair()
    z, v = b.pair()
    return BilatticeValue.from_pair(
        _b_and(x, z),
        _b_and(_b_impl(x, v), _b_impl(z, y)),
    )


def restrict(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    """Lambek implication ⇒ — right adjoint of :func:`fuse`."""
    x, y = a.pair()
    z, v = b.pair()
    return BilatticeValue.from_pair(
        _b_and(_b_impl(x, z), _b_impl(v, y)),
        _b_and(x, v),
    )


# ---------------------------------------------------------------------------
# Post-closure
# ---------------------------------------------------------------------------


def post_close(v: BilatticeValue) -> BilatticeValue:
    """Lift ``None`` to ``Both``; leave settled values alone."""
    if v is BilatticeValue.NONE:
        return BilatticeValue.BOTH
    return v


# ---------------------------------------------------------------------------
# Nelson implication / fuse — coincide with restrict / fuse on 2⊗2
# ---------------------------------------------------------------------------


def nelson_imply(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    return knowledge_meet(restrict(a, b), restrict(negate(b), negate(a)))


def nelson_fuse(a: BilatticeValue, b: BilatticeValue) -> BilatticeValue:
    return negate(nelson_imply(a, negate(b)))


# ---------------------------------------------------------------------------
# Adjunction verification (conformance vector §1)
# ---------------------------------------------------------------------------


@dataclass(frozen=True)
class AdjunctionViolation:
    a: BilatticeValue
    p: BilatticeValue
    q: BilatticeValue
    lhs: bool
    rhs: bool


@dataclass(frozen=True)
class AdjunctionReport:
    checked: int
    violations: tuple[AdjunctionViolation, ...]

    @property
    def ok(self) -> bool:
        return len(self.violations) == 0


def verify_adjunction() -> AdjunctionReport:
    """Verify ``fuse(a, p) ≤_t q  ⇔  p ≤_t restrict(a, q)`` on every triple in 2⊗2³."""
    violations: list[AdjunctionViolation] = []
    checked = 0
    for a in VALUES:
        for p in VALUES:
            for q in VALUES:
                checked += 1
                lhs = truth_leq(fuse(a, p), q)
                rhs = truth_leq(p, restrict(a, q))
                if lhs != rhs:
                    violations.append(AdjunctionViolation(a, p, q, lhs, rhs))
    return AdjunctionReport(checked=checked, violations=tuple(violations))


# ---------------------------------------------------------------------------
# ISA-level helpers (specs/kernel/isa.md)
# ---------------------------------------------------------------------------


def fix_fuse(values: list[BilatticeValue]) -> BilatticeValue:
    """Fold a non-empty list under :func:`knowledge_join` (settling-monotonic)."""
    if not values:
        return BilatticeValue.NONE
    out = values[0]
    for v in values[1:]:
        out = knowledge_join(out, v)
    return out


def fix_restrict(seed: BilatticeValue, restrictors: list[BilatticeValue]) -> BilatticeValue:
    """Iteratively restrict ``seed`` by each value in ``restrictors``."""
    out = seed
    for r in restrictors:
        out = restrict(r, out)
    return out


def fix_fuse_restrict(
    seed: BilatticeValue,
    fusions: list[BilatticeValue],
    restrictors: list[BilatticeValue],
) -> BilatticeValue:
    """Apply ``fuse`` over ``fusions`` then ``restrict`` over ``restrictors``."""
    return fix_restrict(fix_fuse([seed, *fusions]) if fusions else seed, restrictors)
