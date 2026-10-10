"""Regime declaration record.

A substrate ships in one of four regimes — strict, scott-continuous,
transfinite-bounded, aperiodic — determined by the rule-language
fragment, the finiteness of (L, E, C), and state-space cofinality.
The :class:`RegimeRecord` lives at ``$ROOT/regime/<id>.json`` and is
content-addressed; the runtime reads it once at boot.
"""

from __future__ import annotations

from typing import Any, Literal

from pydantic import BaseModel, ConfigDict, Field, model_validator

from substrate.canonicalization import cid
from substrate.error_codes import PCC_REGIME_MISMATCH, SubstrateError

RegimeName = Literal["strict", "scott-continuous", "transfinite-bounded", "aperiodic"]
RuleLanguageFragment = Literal["quantifier-free", "with-forall-blocks"]
StateSpaceCofinality = Literal["countable", "uncountable"]
ClosureOrdinalBound = int | Literal["omega", "omega+1", "omega*2", "omega^2", "omega_1"]


class BaseFiniteness(BaseModel):
    """Finiteness of the three bases: value-domain L, entity-set E, predicate-category C."""

    model_config = ConfigDict(extra="forbid")

    L_finite: bool = True
    E_finite: bool = True
    C_finite: bool = True

    @property
    def all_finite(self) -> bool:
        return self.L_finite and self.E_finite and self.C_finite


def derive_regime(
    fragment: RuleLanguageFragment,
    base: BaseFiniteness,
    cofinality: StateSpaceCofinality = "countable",
) -> RegimeName:
    """Map (fragment, base, cofinality) to a regime.

    | fragment           | base                | cofinality   | regime              |
    |--------------------|---------------------|--------------|---------------------|
    | quantifier-free    | all finite          | (vacuous)    | strict              |
    | quantifier-free    | at least one inf.   | (vacuous)    | scott-continuous    |
    | with-forall-blocks | at least one inf.   | countable    | transfinite-bounded |
    | with-forall-blocks | at least one inf.   | uncountable  | aperiodic           |

    A ``with-forall-blocks`` fragment over an all-finite base is degenerate
    (the ∀ ranges over a finite set) and is rejected with
    :data:`PCC_REGIME_MISMATCH`.
    """
    if fragment == "quantifier-free":
        return "strict" if base.all_finite else "scott-continuous"
    if base.all_finite:
        raise SubstrateError(
            PCC_REGIME_MISMATCH,
            "rule-language fragment 'with-forall-blocks' over all-finite "
            "base is degenerate (universal quantifier ranges over a finite "
            "set; use 'quantifier-free')",
            fragment=fragment,
            base="all-finite",
        )
    return "transfinite-bounded" if cofinality == "countable" else "aperiodic"


def _ordinal_in_range(bound: ClosureOrdinalBound, regime: RegimeName) -> bool:
    """Whether the closure-ordinal bound is admissible under the regime.

    strict: finite (< ω).  scott-continuous: = ω.
    transfinite-bounded: in (ω, ω₁).  aperiodic: ≥ ω₁.
    """
    if regime == "strict":
        return isinstance(bound, int) and bound > 0
    if regime == "scott-continuous":
        return bound == "omega"
    if regime == "transfinite-bounded":
        return bound in {"omega+1", "omega*2", "omega^2"}
    if regime == "aperiodic":
        return bound == "omega_1"
    return False


class RegimeRecord(BaseModel):
    """The substrate's regime declaration, persisted as content."""

    model_config = ConfigDict(extra="forbid")

    id: str | None = None
    description: str = ""
    regime: RegimeName = "strict"
    rule_language_fragment: RuleLanguageFragment = "quantifier-free"
    base_finiteness: BaseFiniteness = Field(default_factory=BaseFiniteness)
    state_space_cofinality: StateSpaceCofinality = "countable"
    closure_ordinal_bound: ClosureOrdinalBound = 1024
    fuel_policy: str = "finite-per-cascade"
    federation_discipline: str = "endpoint-state"
    snapshot_policy: str = "endpoint-only"
    audit_cohomology_bound: int | None = None

    @model_validator(mode="after")
    def _check_regime_coherent(self) -> "RegimeRecord":
        derived = derive_regime(
            self.rule_language_fragment,
            self.base_finiteness,
            self.state_space_cofinality,
        )
        if derived != self.regime:
            raise SubstrateError(
                PCC_REGIME_MISMATCH,
                f"declared regime {self.regime!r} disagrees with derived "
                f"regime {derived!r} for fragment={self.rule_language_fragment!r}, "
                f"all_finite={self.base_finiteness.all_finite}, "
                f"cofinality={self.state_space_cofinality!r}",
                declared=self.regime,
                derived=derived,
            )
        if not _ordinal_in_range(self.closure_ordinal_bound, self.regime):
            raise SubstrateError(
                PCC_REGIME_MISMATCH,
                f"closure_ordinal_bound {self.closure_ordinal_bound!r} is "
                f"outside the {self.regime!r} regime's admissible range",
                regime=self.regime,
                bound=self.closure_ordinal_bound,
            )
        if self.regime == "aperiodic" and self.fuel_policy == "finite-per-cascade":
            raise SubstrateError(
                PCC_REGIME_MISMATCH,
                "aperiodic regime with 'finite-per-cascade' fuel would abort "
                "at the first non-Scott firing",
            )
        if self.snapshot_policy == "endpoint-only" and self.regime not in {
            "strict",
            "scott-continuous",
        }:
            raise SubstrateError(
                PCC_REGIME_MISMATCH,
                f"snapshot_policy='endpoint-only' is incompatible with "
                f"regime={self.regime!r}; non-Scott regimes need trajectory snapshots",
            )
        return self

    def canonical_body(self) -> dict[str, Any]:
        body = self.model_dump(mode="json")
        body.pop("id", None)
        return body

    def with_id(self) -> "RegimeRecord":
        return self.model_copy(update={"id": cid(self.canonical_body())})


def default_strict_regime() -> RegimeRecord:
    """The shipped default: strict, finite, endpoint-only snapshots."""
    return RegimeRecord(
        description="substrate default — strict regime",
        regime="strict",
        rule_language_fragment="quantifier-free",
        base_finiteness=BaseFiniteness(L_finite=True, E_finite=True, C_finite=True),
        closure_ordinal_bound=1024,
        fuel_policy="finite-per-cascade",
        federation_discipline="endpoint-state",
        snapshot_policy="endpoint-only",
        audit_cohomology_bound=None,
    ).with_id()
