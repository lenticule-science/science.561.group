"""Conformance tests for the substrate's regime declaration.

Per ``library/.../predicated-computing/objects/regime-record.md`` and
the load-bearing theorem
``rule-language-realizability-determines-regime``: the (rule-language
fragment, base-finiteness) pair *determines* the regime; declaring a
regime that disagrees is malformed.

Per ``strict-regime-engineering-envelope``: substrate v0.2 ships the
strict regime by default; closure ordinal < ω; $H^1 = 0$;
endpoint-state federation; endpoint-only snapshots.
"""

from __future__ import annotations

import pytest

from substrate.error_codes import PCC_REGIME_MISMATCH, SubstrateError
from substrate.regime import (
    BaseFiniteness,
    RegimeRecord,
    default_strict_regime,
    derive_regime,
)


def test_default_regime_is_strict_with_finite_bases():
    r = default_strict_regime()
    assert r.regime == "strict"
    assert r.rule_language_fragment == "quantifier-free"
    assert r.base_finiteness.all_finite
    assert isinstance(r.closure_ordinal_bound, int)
    assert r.id is not None  # content-addressed


def test_derive_regime_from_fragment_base_and_cofinality():
    """Per rule-language-realizability-determines-regime: the triple
    (fragment, base-finiteness, state-space-cofinality) determines the
    regime via the four-row classification table."""
    qf = "quantifier-free"
    fb = "with-forall-blocks"
    fin = BaseFiniteness(L_finite=True, E_finite=True, C_finite=True)
    inf = BaseFiniteness(L_finite=True, E_finite=False, C_finite=True)

    # Quantifier-free rows — cofinality is vacuous.
    assert derive_regime(qf, fin) == "strict"
    assert derive_regime(qf, inf) == "scott-continuous"
    # With-∀-blocks rows — cofinality discriminates.
    assert derive_regime(fb, inf, "countable") == "transfinite-bounded"
    assert derive_regime(fb, inf, "uncountable") == "aperiodic"


def test_with_forall_blocks_over_finite_base_is_degenerate():
    """Per rule-language-realizability-determines-regime: ∀-blocks
    over an all-finite base is not a row of the classification table
    (the ∀ degenerates to quantifier-free)."""
    fb = "with-forall-blocks"
    fin = BaseFiniteness(L_finite=True, E_finite=True, C_finite=True)
    with pytest.raises(SubstrateError) as exc_info:
        derive_regime(fb, fin)
    assert exc_info.value.code == PCC_REGIME_MISMATCH


def test_regime_mismatch_raises():
    """Declaring 'strict' with ∀-quantification must fail per
    rule-language-realizability-determines-regime."""
    with pytest.raises(SubstrateError) as exc_info:
        RegimeRecord(
            regime="strict",
            rule_language_fragment="with-forall-blocks",
            base_finiteness=BaseFiniteness(),
            closure_ordinal_bound=1024,
        )
    assert exc_info.value.code == PCC_REGIME_MISMATCH


def test_closure_ordinal_bound_must_match_regime():
    """Per regime-record.md invariant: bound < ω for strict, = ω for
    Scott-continuous."""
    with pytest.raises(SubstrateError) as exc_info:
        RegimeRecord(
            regime="strict",
            rule_language_fragment="quantifier-free",
            base_finiteness=BaseFiniteness(),
            closure_ordinal_bound="omega",
        )
    assert exc_info.value.code == PCC_REGIME_MISMATCH


def test_aperiodic_with_finite_fuel_is_malformed():
    """Per regime-record.md: aperiodic + finite-per-cascade fuel would
    abort at first non-Scott firing — malformed."""
    with pytest.raises(SubstrateError) as exc_info:
        RegimeRecord(
            regime="aperiodic",
            rule_language_fragment="with-forall-blocks",
            base_finiteness=BaseFiniteness(L_finite=False),
            state_space_cofinality="uncountable",
            closure_ordinal_bound="omega_1",
            fuel_policy="finite-per-cascade",
        )
    assert exc_info.value.code == PCC_REGIME_MISMATCH


def test_endpoint_only_snapshots_only_for_stabilizing_regimes():
    """Per snapshot-replay-fidelity: non-Scott-continuous regimes
    require trajectory snapshots."""
    with pytest.raises(SubstrateError) as exc_info:
        RegimeRecord(
            regime="transfinite-bounded",
            rule_language_fragment="with-forall-blocks",
            base_finiteness=BaseFiniteness(L_finite=False),
            state_space_cofinality="countable",
            closure_ordinal_bound="omega+1",
            fuel_policy="transfinite-aware",
            snapshot_policy="endpoint-only",
        )
    assert exc_info.value.code == PCC_REGIME_MISMATCH


def test_regime_record_is_content_addressed_stable():
    """Two records with identical content produce identical ids
    (canonical-form invariance)."""
    r1 = default_strict_regime()
    r2 = default_strict_regime()
    assert r1.id == r2.id
    # Edit any field → different id
    r3 = RegimeRecord(
        description=r1.description + " edited",
        regime=r1.regime,
        rule_language_fragment=r1.rule_language_fragment,
        base_finiteness=r1.base_finiteness,
        closure_ordinal_bound=r1.closure_ordinal_bound,
        fuel_policy=r1.fuel_policy,
        federation_discipline=r1.federation_discipline,
        snapshot_policy=r1.snapshot_policy,
    ).with_id()
    assert r3.id != r1.id


def test_rule_carries_language_fragment_field():
    """Per rule-language-realizability-determines-regime: each rule
    declares its language fragment so the substrate can verify
    regime-coherence."""
    from substrate.closure_engine import RuleRecord
    from substrate.algebra import BilatticeValue

    rule = RuleRecord(
        name="test-rule",
        premise={"p": BilatticeValue.TRUE},
        conclusion={"q": BilatticeValue.TRUE},
    )
    assert rule.rule_language_fragment == "quantifier-free"
