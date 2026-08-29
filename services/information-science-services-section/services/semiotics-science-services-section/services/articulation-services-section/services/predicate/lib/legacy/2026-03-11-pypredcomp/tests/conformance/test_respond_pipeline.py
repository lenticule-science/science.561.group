"""Conformance for the respond phase pipeline.

Spec: docs/dev/specs/kernel/respond-pipeline.md.

Three families of conformance:

1. Pipeline-construction invariants (duplicate-slug rejection, slug
   stability, ``with_phase`` insertion semantics).
2. Default-pipeline shape: the v0.2 normative phase list and order
   per the spec §3 table.
3. End-to-end: a derived pipeline with an inserted no-op phase
   produces a byte-identical ``RespondResult`` to the default
   pipeline (Gate-9 byte-identity preservation under extension).

The substrate-wide conformance suite (test_respond_end_to_end,
test_sigma_delta_passes, test_dependent_invalidity, etc.) is the
load-bearing proof that the pipeline implementation preserves
behaviour against the existing fixture corpus; this file isolates
the pipeline contract itself.
"""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.respond import (
    DEFAULT_PIPELINE,
    ApplyDirectivePhase,
    AuthzGatePhase,
    BuildCellPhase,
    CloseSigmaDeltaPhase,
    ComposePhase,
    DependentInvalidityPhase,
    EmitCostCellPhase,
    EmitInconsistencyWitnessesPhase,
    EmitRetractionAuditLogPhase,
    Phase,
    PersistPhase,
    PhasePipeline,
    RespondContext,
    ValidateAndReducePayloadPhase,
    respond,
)


# --- 1. Pipeline-construction invariants -----------------------------------


def test_duplicate_slugs_rejected_at_construction() -> None:
    """The constructor MUST refuse a pipeline with duplicate slugs."""
    with pytest.raises(ValueError, match="duplicate phase slugs"):
        PhasePipeline([AuthzGatePhase(), AuthzGatePhase()])


def test_default_pipeline_v02_shape() -> None:
    """The v0.2 normative phase list, in order (spec §3)."""
    expected = [
        "authz-gate",
        "validate-and-reduce-payload",
        "compose",
        "dependent-invalidity",
        "close-sigma-delta",
        "build-cell",
        "persist",
        "emit-inconsistency-witnesses",
        "emit-cost-cell",
        "emit-retraction-audit-log",
        "apply-directive",
    ]
    assert [p.slug for p in DEFAULT_PIPELINE.phases] == expected


def test_phase_classes_carry_their_declared_slugs() -> None:
    """Slug is the content-address used by the v1.0 substrate-resident
    registry; classes MUST carry the slug as a class-level attribute,
    not derive it at instantiation, so an out-of-tree consumer can
    inspect ``Phase.slug`` without instantiating."""
    pairs = [
        (AuthzGatePhase, "authz-gate"),
        (ValidateAndReducePayloadPhase, "validate-and-reduce-payload"),
        (ComposePhase, "compose"),
        (DependentInvalidityPhase, "dependent-invalidity"),
        (CloseSigmaDeltaPhase, "close-sigma-delta"),
        (BuildCellPhase, "build-cell"),
        (PersistPhase, "persist"),
        (EmitInconsistencyWitnessesPhase, "emit-inconsistency-witnesses"),
        (EmitCostCellPhase, "emit-cost-cell"),
        (EmitRetractionAuditLogPhase, "emit-retraction-audit-log"),
        (ApplyDirectivePhase, "apply-directive"),
    ]
    for cls, slug in pairs:
        assert cls.slug == slug
        assert cls().slug == slug


def test_with_phase_inserts_after_named_predecessor() -> None:
    """``with_phase`` is the v0.2 in-process analogue of the v1.0
    substrate-cell ``before`` ordering edge — out-of-tree extensions
    and tests use it to derive a pipeline without rebuilding from
    scratch."""

    class NoopPhase:
        slug = "noop-after-compose"

        def run(self, ctx: RespondContext) -> None:
            return None

    derived = DEFAULT_PIPELINE.with_phase(NoopPhase(), after="compose")
    slugs = [p.slug for p in derived.phases]
    # Original list unchanged; derived list has the noop right after compose.
    assert [p.slug for p in DEFAULT_PIPELINE.phases].count("noop-after-compose") == 0
    compose_idx = slugs.index("compose")
    assert slugs[compose_idx + 1] == "noop-after-compose"
    assert slugs[compose_idx + 2] == "dependent-invalidity"


def test_with_phase_unknown_predecessor_raises() -> None:
    class NoopPhase:
        slug = "noop"

        def run(self, ctx: RespondContext) -> None:
            return None

    with pytest.raises(ValueError, match="no phase with slug"):
        DEFAULT_PIPELINE.with_phase(NoopPhase(), after="not-a-real-slug")


# --- 2. End-to-end: extension preserves Gate-9 byte-identity ---------------


def _run_respond_with_pipeline(
    tmp_path: Path,
    pipeline: PhasePipeline,
    *,
    target: str = "rsc:test/alpha",
    payload: dict | None = None,
) -> str:
    """Run a single ``respond`` against a fresh layout under ``pipeline``.

    Returns the canonicalised JSON view of the full ``RespondResult`` —
    every typed field including the full audit/delta/repair log entry
    contents, not just lengths. This is the granularity Gate-9
    byte-identity demands.
    """
    tmp_path.mkdir(parents=True, exist_ok=True)
    layout = StorageLayout(tmp_path)
    event_log = EventLog(tmp_path)
    payload = payload if payload is not None else {"is-test": "True"}

    ctx = RespondContext(
        target=target,
        payload=payload,
        sender="system",
        layout=layout,
        event_log=event_log,
        node_id="test-node",
        active_rule_ids=[],
    )
    pipeline.run(ctx)
    result = ctx.to_result()
    # ``model_dump(mode="json")`` round-trips every field, including
    # nested RepairEntry / DeltaLogEntry / PhaseMarker contents inside
    # ``audit_log``. Sort-key serialisation gives a canonical comparable
    # form.
    return json.dumps(result.model_dump(mode="json"), sort_keys=True)


class _NoopPhase:
    """A test-only phase that does nothing — the canary for extension safety."""

    def __init__(self, slug: str) -> None:
        self.slug = slug

    def run(self, ctx: RespondContext) -> None:
        return None


@pytest.mark.parametrize(
    "after_slug",
    [
        "authz-gate",
        "compose",
        "close-sigma-delta",
        "persist",
        "emit-inconsistency-witnesses",
        "apply-directive",
    ],
)
def test_inserted_noop_phase_preserves_respond_result(
    tmp_path: Path, after_slug: str
) -> None:
    """An inserted no-op phase MUST NOT perturb the full RespondResult.

    Spec §6 gate 1: Gate-9 byte-identity preservation under pipeline
    extension. Comparison is over the full canonicalised
    RespondResult — every audit/delta/repair entry, every witness id,
    every phase marker — so a regression at any field surfaces here.
    Parametrised over six insertion positions (one early, one
    pre-loop, one post-loop, one post-persist, one post-audit, one
    tail) so a position-sensitive bug surfaces too.
    """
    base_dir = tmp_path / "base"
    derived_dir = tmp_path / f"derived-{after_slug}"
    base = _run_respond_with_pipeline(base_dir, DEFAULT_PIPELINE)
    derived_pipeline = DEFAULT_PIPELINE.with_phase(
        _NoopPhase(f"noop-after-{after_slug}"), after=after_slug
    )
    derived = _run_respond_with_pipeline(derived_dir, derived_pipeline)
    assert base == derived


def test_facade_respond_uses_default_pipeline(tmp_path: Path) -> None:
    """The public ``respond()`` facade MUST route through DEFAULT_PIPELINE.

    Verified by comparing the facade's output to a direct pipeline
    invocation against an identically-prepared layout.
    """
    facade_dir = tmp_path / "facade"
    direct_dir = tmp_path / "direct"

    facade_dir.mkdir()
    facade_layout = StorageLayout(facade_dir)
    facade_event_log = EventLog(facade_dir)
    facade_result = respond(
        target="rsc:test/beta",
        payload={"is-beta": "True"},
        sender="system",
        layout=facade_layout,
        event_log=facade_event_log,
        node_id="test-node",
        active_rule_ids=[],
    )
    facade_canonical = json.dumps(
        facade_result.model_dump(mode="json"), sort_keys=True
    )
    direct = _run_respond_with_pipeline(
        direct_dir,
        DEFAULT_PIPELINE,
        target="rsc:test/beta",
        payload={"is-beta": "True"},
    )
    assert facade_canonical == direct
