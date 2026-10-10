"""Verification module for `theorems/strong-mld-via-composed-duality.md`.

The theorem classifies aperiodic settlings into composed-duality orbits:
self-dual (all ⊤- or ⊥-firings), exchange-paired (truth-only paired with
falsity-only), or mixed.

The orbit-type classification is the value-category factor of the composed
duality, established structurally by the bilattice negation theorem.

This module verifies the orbit classification on artificial firing-type
sequences corresponding to known cases.

Migrated from `tools/strong-mld-orbits/compute.py` (orbit classifier).
"""

from __future__ import annotations

from ..link import verifies


def _classify_orbit(firing_types: list[str]) -> str:
    """Classify a settling's composed-duality orbit type from its firing types.

    Per the d-frame Verdier composition: ⊤-firings and ⊥-firings are fixed
    by D_val; truth-only and falsity-only firings are exchanged.

    - self-dual: all firings are ⊤ or ⊥
    - exchange-paired: all firings are truth-only OR all are falsity-only
    - mixed: any other combination
    """
    self_fixed = {"⊤-firing", "⊥-firing", "top-firing", "bot-firing"}
    truth_like = {"truth-only"}
    falsity_like = {"falsity-only"}

    has_truth = any(f in truth_like for f in firing_types)
    has_falsity = any(f in falsity_like for f in firing_types)
    has_other = any(f not in (self_fixed | truth_like | falsity_like) for f in firing_types)

    if has_other:
        return "unknown"
    if not has_truth and not has_falsity:
        return "self-dual"
    if has_truth and not has_falsity:
        return "exchange-paired (truth-only)"
    if has_falsity and not has_truth:
        return "exchange-paired (falsity-only)"
    return "mixed"


@verifies(
    "theorems/strong-mld-via-composed-duality.md",
    claim="All-⊤-firing settling classifies as self-dual under composed duality",
)
def test_all_top_firings_self_dual() -> None:
    firings = ["⊤-firing"] * 5
    assert _classify_orbit(firings) == "self-dual"


@verifies(
    "theorems/strong-mld-via-composed-duality.md",
    claim="All-truth-only settling classifies as exchange-paired (paired with all-falsity-only via D_val)",
)
def test_all_truth_only_exchange_paired() -> None:
    firings = ["truth-only"] * 4
    assert _classify_orbit(firings) == "exchange-paired (truth-only)"

    firings_dual = ["falsity-only"] * 4
    assert _classify_orbit(firings_dual) == "exchange-paired (falsity-only)"


@verifies(
    "theorems/strong-mld-via-composed-duality.md",
    claim="Mixed firing types (truth-only + falsity-only) classifies as mixed orbit",
)
def test_mixed_firings_mixed_orbit() -> None:
    firings = ["truth-only", "falsity-only", "⊤-firing"]
    assert _classify_orbit(firings) == "mixed"
