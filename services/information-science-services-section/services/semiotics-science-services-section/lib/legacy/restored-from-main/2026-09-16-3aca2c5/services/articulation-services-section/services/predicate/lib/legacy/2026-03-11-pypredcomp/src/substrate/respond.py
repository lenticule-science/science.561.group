"""``respond()`` — the substrate's single state-mutating primitive.

Per ``specs/kernel/respond.md`` (the surface contract), the v0.2a kernel
specs ``specs/kernel/sigma-delta-passes.md`` (Phase 3 σ↔Δ alternation)
and ``specs/kernel/fuel-composition.md`` (the five fuel boundaries that
compose under one Lawvere quantale at Phase 4d), and
``specs/kernel/binary-cell-emission.md`` (which records that
``_emit_asserted_cells`` is unary-only by design — binary cells are
authored by sibling primitives such as ``process.session_messaging.send_message``).

The ``sender`` carried by every ``respond`` invocation is the slug of a
boundary entity per ``specs/security/user-as-boundary.md`` §2.1 (the
auth-fiber projection — *who is this sender*); ``validate_slug`` in
Phase 1 enforces the slug shape, and the bearer-token resolution that
*produces* the sender slug at session-open lives in
:func:`process.user.authenticate`, which raises
:data:`substrate.error_codes.PCM_AUTH_FAILED` on token-hash mismatch
without advancing the event log. The Phase-0 Box_R gate then composes
the resolved sender's authz fiber via $\\Rightarrow$ per
``specs/kernel/respond.md`` §2 and
``decisions/authorization-is-modal-restriction.md``.

Phases per call:

0. Authorization gate (Box_R on authentication surface; auto-on when an
   accessibility relation is installed).
1. Validate slugs; reduce payload terms under fuel.
2. Compose: knowledge-join payload with prior fiber; queue compose-time
   contradictions for Phase 4c.
3. Close: σ↔Δ outer-fuel alternation. σ-pass saturates closure rules;
   Δ-pass stabilizes per-cell bilattice values; loop while Δ moved.
4. Persist: write the cell, append the event, update the fiber cache.
4b. Materialize by-stratum projections.
4c. Emit inconsistency witnesses for queued contradictions.
4d. Emit a cost cell sized by σ-cycles consumed.
5. Apply optional ``directive`` side-effect (rule add/retire, alias
   set/remove, evidence write) — strictly after the cell + event commit
   so the audit trail leads the side-effect.

Returns a :class:`RespondResult` carrying cell id, fiber, event,
σ/Δ logs, witness ids, cost cell id, and authz decision (when gated).
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from typing import Any, Protocol

from pydantic import BaseModel

from substrate.algebra import BilatticeValue, knowledge_join, knowledge_leq
from substrate.authorization import (
    authz_check as _authz_check,
    has_accessibility_relation as _has_accessibility,
)
from substrate.canonicalization import canonical, cid
from substrate.closure_engine import RepairEntry, RuleRecord, fire_rules
from substrate.cost import CostCell, DEFAULT_QUANTALE, emit_cost
from substrate.delta_pass import (
    DELTA_FUEL,
    DeltaEmit,
    DeltaNoMovement,
    run_delta_pass,
)
from substrate.error_codes import (
    PCC_MISSING_WITNESS,
    PCC_MONOTONICITY_FAIL,
    PCM_PAYLOAD_INVALID,
    PCM_RESPOND_PHASE,
    PCM_TARGET_INVALID,
    PCR_BILATTICE_DIVERGED,
    PCR_DELTA_NO_MOVEMENT,
    PCR_DELTA_STABILIZED,
    PCR_SIGMA_DELTA_DIVERGED,
    PCR_SIGMA_FUEL_EXCEEDED,
    SubstrateError,
)
from substrate.inconsistency import (
    InconsistencyWitness,
    SourceClassification,
    detect_compose_inconsistency,
    detect_saturated_inconsistency,
    write_witness as _write_inconsistency_witness,
)
from substrate.message_language import TermEnv, reduce_payload
from substrate.projection import (
    _collect_history_cells,
    materialize_by_stratum_projections,
)
from storage.cell import Cell
from storage.cell_record import FiberSnapshot
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout

SLUG_RE = re.compile(r"^[a-z0-9][a-z0-9\-:/]*[a-z0-9]$|^[a-z0-9]$")

# System entity slugs reserved for directive-bearing responds.
SYSTEM_RULES_TARGET = "rsc:system/rules"
SYSTEM_ALIASES_TARGET = "rsc:system/aliases"
SYSTEM_EVIDENCE_TARGET = "rsc:system/evidence"

# σ↔Δ outer round-trip bound. Well-behaved rule sets converge in 1–2;
# the bound exists to cap pathological cases.
SIGMA_DELTA_OUTER_FUEL: int = 8

# σ-pass layer cap (per t02-e2 / specs/kernel/sigma-delta-passes.md §3.σ.4).
# Max closure-rule firings per σ-pass per outer iteration. Exceeding
# this surfaces ``PCR_SIGMA_FUEL_EXCEEDED`` with partial state preserved.
SIGMA_FUEL: int = 16


def validate_slug(slug: str, *, what: str) -> None:
    if not isinstance(slug, str) or not SLUG_RE.match(slug):
        raise SubstrateError(
            PCM_TARGET_INVALID if what == "target" else PCM_PAYLOAD_INVALID,
            f"{what} slug {slug!r} not lower-kebab",
        )


class PhaseMarker(BaseModel):
    """One σ/Δ loop boundary in the audit stream.

    ``variant`` is one of: ``"sigma-start"``, ``"delta-start"``,
    ``"sigma-delta-iter"``, ``"halt-outer-fuel"``, ``"halt-bilattice-diverged"``,
    ``"halt-sigma-fuel-exceeded"``, ``"audit-start"``, ``"audit-end"``.
    ``iteration`` is the 0-based outer-fuel iteration index.
    """

    code: str = PCM_RESPOND_PHASE
    variant: str
    iteration: int


class DeltaLogEntry(BaseModel):
    """One Δ-pass per-cell outcome.

    ``code`` is :data:`PCR_DELTA_STABILIZED` (cell moved; settled atom
    emitted) or :data:`PCR_DELTA_NO_MOVEMENT` (cell at fixed point).
    ``via`` and ``substeps`` are populated only when stabilized.
    """

    code: str
    iteration: int
    predicate: str
    pre_value: str
    post_value: str
    wavefront_ordinal: int
    via: str | None = None
    substeps: int | None = None


class RespondResult(BaseModel):
    # ``cell_id`` / ``cell`` / ``event_id`` / ``event_ord`` are ``None``
    # in exactly one shape: the authz-deny vacuous outcome per
    # ``specs/security/capability-model.md`` and t02-41 — the sender's
    # authz fiber restricted the requested predicate to ⊥, so no cell
    # was emitted, no event advanced, and ``fiber`` echoes the unchanged
    # target fiber. Consumers MUST check ``authz_decision`` before
    # treating ``cell_id`` as guaranteed-non-None.
    cell_id: str | None = None
    cell: FiberSnapshot | None = None
    fiber: dict[str, Any]
    event_id: str | None = None
    event_ord: int | None = None
    repair_log: list[RepairEntry]
    closure_cycles: int
    # Δ-pass per-cell stabilizations and σ/Δ phase markers, chronological.
    delta_log: list[DeltaLogEntry] = []
    phase_log: list[PhaseMarker] = []
    # Unified chronological audit stream. The three typed fields above
    # are stratum-specific projections of this single timeline; HTTP/MCP
    # drivers that only consume one stratum read ``repair_log``.
    audit_log: list[RepairEntry | DeltaLogEntry | PhaseMarker] = []
    # σ↔Δ outer-fuel round-trips consumed (1 = σ alone converged).
    outer_iterations: int = 0
    # Halt cause when σ↔Δ failed to converge: PCR_SIGMA_DELTA_DIVERGED
    # (outer fuel exhausted), PCR_BILATTICE_DIVERGED (per-cell Δ-fuel
    # exhausted), or PCR_SIGMA_FUEL_EXCEEDED (σ-layer cap hit with a
    # rule still firable, per t02-e2). Partial state still commits; the
    # halt is recorded in ``phase_log`` (``"halt-…"`` variant). ``None``
    # on convergence.
    halted_with: str | None = None
    # Populated when invoked with ``directive=...``.
    directive_result: dict[str, Any] | None = None
    # Inconsistency witnesses emitted for ⊤-cells produced this respond.
    inconsistency_witnesses: list[str] = []
    # Cost cell id (None when no work was done).
    cost_cell_id: str | None = None
    # Box_R authz decision (None when the gate was not enforced).
    authz_decision: dict[str, Any] | None = None
    # Audit-log cell id emitted for retractions (non-default at_stratum)
    # per ``specs/security/tool-risk-scoring.md`` §3 + pt-02/t02-126.
    # ``None`` when ``at_stratum`` was ``None`` or ``"asserted"``.
    retraction_audit_log_id: str | None = None


def _load_active_rules(layout: StorageLayout, rule_ids: list[str]) -> list[RuleRecord]:
    rules: list[RuleRecord] = []
    for rid in rule_ids:
        if not layout.has_record("rules", rid):
            continue
        body = layout.get_record("rules", rid)
        rules.append(RuleRecord(**body))
    return rules


def _read_fiber(layout: StorageLayout, entity_slug: str) -> dict[str, Any]:
    fiber = layout.get_fiber(entity_slug)
    if fiber is None:
        return {
            "entity": entity_slug,
            "latest_cell_id": None,
            "predicates": {},
            "cells_by_predicate": {},
            "history": [],
        }
    return fiber


def _write_fiber(
    layout: StorageLayout,
    *,
    entity_slug: str,
    cell: FiberSnapshot,
    history_event_id: str,
    history_event_ord: int,
    cells_by_predicate: dict[str, str],
) -> dict[str, Any]:
    fiber = _read_fiber(layout, entity_slug)
    fiber["entity"] = entity_slug
    fiber["latest_cell_id"] = cell.id
    fiber["predicates"] = {k: v.value if isinstance(v, BilatticeValue) else v for k, v in cell.predicates.items()}
    # Persist the predicate→latest-cell-id map so subsequent respond
    # invocations can build witness chains for saturated firings whose
    # premises were established in earlier respond rounds.
    fiber["cells_by_predicate"] = dict(cells_by_predicate)
    history = fiber.get("history", [])
    history.append({"event_id": history_event_id, "event_ord": history_event_ord, "cell_id": cell.id})
    fiber["history"] = history
    layout.put_fiber(entity_slug, fiber)
    return fiber


# ---------------------------------------------------------------------------
# Directive side-effects
# ---------------------------------------------------------------------------


def _apply_directive(
    directive: dict[str, Any],
    *,
    layout: StorageLayout,
    active_rule_ids: list[str],
) -> dict[str, Any]:
    """Perform a system side-effect described by a directive.

    Called by :func:`respond` *after* the cell + event are committed, so
    the audit trail (the event the caller's ``respond`` produced) always
    precedes the side-effect on disk.
    """
    if not isinstance(directive, dict) or "kind" not in directive:
        raise SubstrateError(PCM_PAYLOAD_INVALID, "directive must be an object with 'kind'")
    kind = directive["kind"]

    if kind == "add_rule":
        rule_body = directive.get("rule")
        if not isinstance(rule_body, dict):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "add_rule directive needs 'rule' object")
        rule = RuleRecord(**rule_body).with_id()
        rid, _ = layout.put_record("rules", rule.canonical_body())
        if rid not in active_rule_ids:
            active_rule_ids.append(rid)
        return {"kind": "add_rule", "rule_id": rid, "name": rule.name}

    if kind == "retire_rule":
        rid = directive.get("rule_id")
        if not isinstance(rid, str):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "retire_rule directive needs 'rule_id' string")
        if rid in active_rule_ids:
            active_rule_ids.remove(rid)
        return {"kind": "retire_rule", "rule_id": rid, "retired": True}

    if kind == "set_alias":
        # Imported lazily to avoid a circular import.
        from storage.aliases import AliasStore
        name = directive.get("name")
        target = directive.get("target")
        if not isinstance(name, str) or not isinstance(target, str):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "set_alias directive needs 'name' and 'target' strings")
        AliasStore(layout.root).set(name, target)
        return {"kind": "set_alias", "name": name, "target": target}

    if kind == "remove_alias":
        from storage.aliases import AliasStore
        name = directive.get("name")
        if not isinstance(name, str):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "remove_alias directive needs 'name' string")
        AliasStore(layout.root).remove(name)
        return {"kind": "remove_alias", "name": name, "removed": True}

    if kind == "evidence":
        body = directive.get("body")
        if not isinstance(body, dict):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "evidence directive needs 'body' object")
        exec_id = cid(body)
        path = layout.evidence_path(exec_id)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(canonical({"id": exec_id, **body}))
        return {"kind": "evidence", "exec_id": exec_id, "path": str(path)}

    raise SubstrateError(PCM_PAYLOAD_INVALID, f"unknown directive kind {kind!r}")


def _emit_asserted_cells(
    *,
    target: str,
    sender: str,
    payload_predicates: dict[str, BilatticeValue],
    merged_predicates: dict[str, BilatticeValue],
    next_ord: int,
    cells_by_predicate: dict[str, str],
) -> list[Cell]:
    """Build asserted Cell atoms for predicates asserted IN THIS respond.

    One atom per predicate in ``payload_predicates`` (the post-reduction
    payload), valued at the post-merge ``merged_predicates`` value (the
    settling-monotonic join with the prior fiber). Predicates are
    unary in v0.1, so the atom's object slot reuses the subject
    (``o = s = target``); see specs/filesystem/cell-record.md §0 for
    the representation. Updates ``cells_by_predicate`` in place.
    """
    asserted_cells: list[Cell] = []
    for p in sorted(payload_predicates):
        atom = Cell(
            s=target,
            p=p,
            o=target,  # unary predicate; specs/filesystem/cell-record.md §0
            v=merged_predicates[p],
            ord=next_ord,
            stratum="asserted",
            sender=None if sender == "system" else sender,
        ).with_id()
        asserted_cells.append(atom)
        if atom.id is not None:
            cells_by_predicate[p] = atom.id
    return asserted_cells


def _emit_settled_cells(
    *,
    target: str,
    emissions: list[DeltaEmit],
    cells_by_predicate: dict[str, str],
    next_ord: int,
) -> list[Cell]:
    """Build settled Cell atoms for Δ-pass stabilizations.

    Per ``stratified-facts.md`` §4: a settled atom's ``derived_from``
    points to the cell whose value fed the stabilization (the asserted
    or saturated atom currently in ``cells_by_predicate`` for that
    predicate). ``derived_via`` is the bilattice operator tag from the
    Δ-pass (``"⊙-stabilize"`` or ``"⇒-stabilize"``).

    Updates ``cells_by_predicate`` in place: the settled cell becomes
    the new highest-stratum witness for its predicate, so subsequent
    σ-iterations within this respond (and downstream rounds) chain
    against the settled atom.
    """
    settled_cells: list[Cell] = []
    for emit in emissions:
        witness_id = cells_by_predicate.get(emit.predicate)
        if not witness_id:
            raise SubstrateError(
                PCC_MISSING_WITNESS,
                f"Δ-stabilization of predicate {emit.predicate!r} cannot witness "
                f"its pre-Δ value: no cell id in cells_by_predicate "
                "(invariant: every predicate fed to Δ-pass must have an "
                "asserted/saturated cell-id in cells_by_predicate)",
                predicate=emit.predicate,
                target=target,
            )
        atom = Cell(
            s=target,
            p=emit.predicate,
            o=target,
            v=BilatticeValue(emit.post_value),
            ord=next_ord,
            stratum="settled",
            derived_from=[witness_id],
            derived_via=emit.via,
        ).with_id()
        settled_cells.append(atom)
        if atom.id is not None:
            cells_by_predicate[emit.predicate] = atom.id
    return settled_cells


def _emit_dependent_invalid_saturated_cells(
    *,
    layout: StorageLayout,
    target: str,
    fiber: dict[str, Any],
    payload_predicates: dict[str, BilatticeValue],
    asserted_cells: list[Cell],
    prev_cells_by_predicate: dict[str, str],
    next_ord: int,
    cells_by_predicate: dict[str, str],
) -> list[Cell]:
    """σ-pass dependent-invalidity propagation per ``stratified-facts.md`` §3.

    When a payload asserts ``FALSE`` for a predicate whose prior witness
    cell justified one or more saturated derivations on this entity,
    those derivations become dependently invalid. The σ-pass MUST emit
    a corresponding retraction-cell at stratum ``"saturated"`` for each,
    with ``derived_via = "dependent-invalid"`` and ``derived_from``
    pointing at the retracting asserted cell. Per the spec: "This is
    the load-bearing reason the stratum tag exists: an asserted fact
    and a saturated fact look identical at (s, p, o, v) but respond
    completely differently to upstream change."

    Determinism: walk the entity's full snapshot history (sorted by
    ``(ord, id)``), keep the highest-ordinal saturated atom per
    ``(s, p, o)`` triple, and emit retraction-cells in sorted-triple
    order. ``derived_from`` carries a single retracting cell-id —
    the lex-min asserted cell-id when multiple premises were retracted
    by this respond — for byte-identity across re-emission.

    Returns the emitted retraction-cells (possibly empty); updates
    ``cells_by_predicate`` so subsequent σ/Δ-pass work sees the
    saturated retraction as the latest witness.
    """
    asserted_by_predicate: dict[str, str] = {
        c.p: c.id for c in asserted_cells if c.id is not None
    }
    # prior witness id -> retracting asserted cell id
    retracted_premise_ids: dict[str, str] = {}
    for p, v in payload_predicates.items():
        if v != BilatticeValue.FALSE:
            continue
        prior = prev_cells_by_predicate.get(p)
        new_id = asserted_by_predicate.get(p)
        if prior and new_id:
            retracted_premise_ids[prior] = new_id
    if not retracted_premise_ids:
        return []

    prior_cells = _collect_history_cells(layout=layout, fiber=fiber)
    latest_by_triple: dict[tuple[str, str, str], Cell] = {}
    for c in prior_cells:
        if c.stratum != "saturated":
            continue
        key = (c.s, c.p, c.o)
        cur = latest_by_triple.get(key)
        if cur is None or (c.ord, c.id or "") > (cur.ord, cur.id or ""):
            latest_by_triple[key] = c

    # Worklist fixed-point: each emitted retraction-cell makes the prior
    # saturated atom it supersedes itself a "retracted premise" for any
    # downstream saturated derivation that witnessed it. Iterate until no
    # new retraction is produced. Bounded by len(latest_by_triple).
    worklist: dict[str, str] = dict(retracted_premise_ids)
    emitted: list[Cell] = []
    retracted_triples: set[tuple[str, str, str]] = set()
    while True:
        progressed = False
        for key in sorted(latest_by_triple.keys()):
            if key in retracted_triples:
                continue
            sat = latest_by_triple[key]
            if sat.v == BilatticeValue.FALSE and sat.derived_via == "dependent-invalid":
                continue
            deps = set(sat.derived_from or [])
            hits = deps & worklist.keys()
            if not hits:
                continue
            retracting_id = sorted(worklist[h] for h in hits)[0]
            atom = Cell(
                s=sat.s,
                p=sat.p,
                o=sat.o,
                v=BilatticeValue.FALSE,
                ord=next_ord,
                stratum="saturated",
                derived_from=[retracting_id],
                derived_via="dependent-invalid",
            ).with_id()
            emitted.append(atom)
            retracted_triples.add(key)
            if atom.id is not None:
                cells_by_predicate[sat.p] = atom.id
                # The prior saturated atom's id is now itself retracted —
                # downstream derivations whose ``derived_from`` cites it
                # become dependently invalid in the next worklist round.
                if sat.id is not None:
                    worklist[sat.id] = atom.id
            progressed = True
        if not progressed:
            break
    return emitted


def _emit_saturated_cells(
    *,
    target: str,
    repair_log: list[RepairEntry],
    rules_by_id: dict[str, RuleRecord],
    cells_by_predicate: dict[str, str],
    next_ord: int,
) -> list[Cell]:
    """Build saturated Cell atoms for closure-rule firings.

    For each :class:`RepairEntry` (in cycle order), look up the rule's
    premise predicates, gather their current witness cell ids from
    ``cells_by_predicate``, and emit a saturated Cell for each predicate
    that the rule raised. Updates ``cells_by_predicate`` in place so
    later firings within the same respond can witness against earlier
    saturated atoms.

    Witness coverage MUST be complete: ``derived_from`` is the set of
    cells that justified this firing (cell-record.md §1,
    stratified-facts.md §4). Every predicate in
    ``merged_predicates`` was either asserted in this respond's
    payload (and thus added to ``cells_by_predicate`` by
    :func:`_emit_asserted_cells`) or inherited from a prior respond's
    final fiber (which persisted ``cells_by_predicate`` alongside
    ``predicates`` in :func:`_write_fiber`). So a missing witness
    indicates a corrupt fiber dict or a rule whose premise is satisfied
    by a predicate that was never emitted as a cell — both of which are
    invariant violations and raise ``PCC_MISSING_WITNESS``.
    """
    saturated_cells: list[Cell] = []
    for entry in repair_log:
        rule = rules_by_id.get(entry.rule_id)
        if rule is None:
            continue
        witness_ids: list[str] = []
        for premise_pred in sorted(rule.premise.keys()):
            wid = cells_by_predicate.get(premise_pred)
            if not wid:
                raise SubstrateError(
                    PCC_MISSING_WITNESS,
                    f"saturated firing of rule {entry.rule_id!r} cannot witness "
                    f"premise {premise_pred!r}: no cell id in cells_by_predicate "
                    "(invariant: every predicate in merged_predicates must have "
                    "an emitted cell-id in cells_by_predicate)",
                    rule_id=entry.rule_id,
                    rule_name=entry.rule_name,
                    premise=premise_pred,
                    target=target,
                )
            witness_ids.append(wid)
        for raised_pred, raised_value_str in entry.raised.items():
            atom = Cell(
                s=target,
                p=raised_pred,
                o=target,
                v=BilatticeValue(raised_value_str),
                ord=next_ord,
                stratum="saturated",
                derived_from=witness_ids,
                derived_via=entry.rule_id,
            ).with_id()
            saturated_cells.append(atom)
            if atom.id is not None:
                cells_by_predicate[raised_pred] = atom.id
    return saturated_cells


# ---------------------------------------------------------------------------
# Phase pipeline
# ---------------------------------------------------------------------------
#
# ``respond`` is structured as an ordered list of phase objects sharing
# a typed :class:`RespondContext`. Adding a kernel capability is "author
# a phase class + register it in :data:`DEFAULT_PIPELINE`", not "edit a
# 700-line function mid-loop." Phases are individually unit-testable;
# the pipeline order is data, and at v1.0 will be loaded from substrate
# cells (``(respond, has-phase, <slug>)``) so an in-OS agent can author
# kernel behaviour under the agent-merge-authority discipline (see
# ``docs/dev/questions/v1.0-agent-merge-authority.md`` and the contract
# in ``docs/dev/specs/kernel/respond-pipeline.md``).
#
# Halt semantics:
#
# * A phase MAY set ``ctx.halted_with`` to record a soft halt (σ-fuel
#   exhausted, bilattice diverged, σ↔Δ outer-fuel exhausted). The
#   pipeline continues to subsequent persistence + audit + cost +
#   directive phases so partial state still commits — this matches the
#   pre-pipeline ``respond`` semantics where Phase 4 always persisted
#   the cell + event regardless of σ↔Δ halt.
# * A phase MAY raise :class:`SubstrateError` to abort the pipeline
#   hard before further work runs — e.g. the compose phase raises
#   ``PCC_MONOTONICITY_FAIL`` on a settling violation. The Phase-0
#   authz gate does NOT raise on insufficient authority; per
#   ``decisions/capability-not-acl.md`` and t02-41, restriction is
#   algebraic — the gate sets ``ctx.authz_decision_dict`` with
#   ``allowed=False`` and the pipeline short-circuits the remaining
#   phases via :meth:`PhasePipeline.run`.
#
# Determinism (Gate-9 byte-identity, per
# ``docs/dev/specs/kernel/respond.md`` §3): each phase MUST be a
# deterministic pure function of its input ``ctx``. Non-determinism
# breaks fixture replay and federation reconciliation.


@dataclass
class RespondContext:
    """Mutable state threaded through the respond phase pipeline.

    Inputs are populated by the :func:`respond` facade before the
    pipeline runs. Each phase reads what it needs and writes its
    outputs back onto the same object; the next phase observes them.

    The context replaces the closure-captured locals of the original
    monolithic ``respond`` function. The mapping from old locals to
    fields is intentionally 1:1 to preserve byte-identity of the
    emitted :class:`RespondResult`.
    """

    # --- Inputs ------------------------------------------------------
    target: str
    payload: dict[str, Any]
    sender: str
    layout: StorageLayout
    event_log: EventLog
    node_id: str
    active_rule_ids: list[str]
    fuel: int = 1024
    metadata: dict[str, Any] | None = None
    directive: dict[str, Any] | None = None
    enforce_authz: bool | None = None
    at_stratum: str | None = None

    # --- Phase 0 (authz) outputs -------------------------------------
    gate_stratum: str = "asserted"
    authz_decision_dict: dict[str, Any] | None = None

    # --- Phase 1 (validate + reduce) outputs -------------------------
    fiber: dict[str, Any] = field(default_factory=dict)
    prev_predicates: dict[str, BilatticeValue] = field(default_factory=dict)
    prev_cells_by_predicate: dict[str, str] = field(default_factory=dict)
    payload_predicates: dict[str, BilatticeValue] = field(default_factory=dict)
    fuel_after_payload: int = 0

    # --- Phase 2 (compose) outputs -----------------------------------
    parent_id: str | None = None
    parents: list[str] = field(default_factory=list)
    merged_predicates: dict[str, BilatticeValue] = field(default_factory=dict)
    pending_inconsistencies: list[dict[str, Any]] = field(default_factory=list)
    next_ord: int = 0
    cells_by_predicate: dict[str, str] = field(default_factory=dict)
    asserted_cells: list[Cell] = field(default_factory=list)

    # --- Phase 2.5 (dependent-invalidity) outputs --------------------
    dependent_invalid_cells: list[Cell] = field(default_factory=list)

    # --- Phase 3 (σ↔Δ close) outputs ---------------------------------
    rules_by_id: dict[str, RuleRecord] = field(default_factory=dict)
    iteration_cells: list[Cell] = field(default_factory=list)
    all_repair_log: list[RepairEntry] = field(default_factory=list)
    delta_log: list[DeltaLogEntry] = field(default_factory=list)
    phase_log: list[PhaseMarker] = field(default_factory=list)
    audit_log: list[RepairEntry | DeltaLogEntry | PhaseMarker] = field(
        default_factory=list
    )
    closure_cycles_total: int = 0
    outer_iterations: int = 0
    halted_with: str | None = None
    final_predicates: dict[str, BilatticeValue] = field(default_factory=dict)

    # --- Phase 4 (persist) outputs -----------------------------------
    cell: FiberSnapshot | None = None
    event: dict[str, Any] | None = None
    new_fiber: dict[str, Any] = field(default_factory=dict)

    # --- Phase 4c–e outputs ------------------------------------------
    inconsistency_witness_ids: list[str] = field(default_factory=list)
    cost_cell_id: str | None = None
    retraction_audit_log_id: str | None = None

    # --- Phase 5 (directive) outputs ---------------------------------
    directive_result: dict[str, Any] | None = None

    def mark(self, variant: str, iteration: int) -> None:
        """Append a phase marker to both the typed and unified streams."""
        m = PhaseMarker(variant=variant, iteration=iteration)
        self.phase_log.append(m)
        self.audit_log.append(m)

    def to_result(self) -> RespondResult:
        """Build the public :class:`RespondResult` from final ctx state."""
        cell = self.cell
        event = self.event
        if cell is None or event is None:
            # Authz-deny is the *only* sanctioned vacuous outcome —
            # restriction-to-⊥ per t02-41. The pipeline short-circuited
            # at Phase 0; ``fiber`` echoes the unchanged target so a
            # caller can compare-against and see no advance.
            if (
                self.authz_decision_dict is not None
                and self.authz_decision_dict.get("allowed") is False
            ):
                return RespondResult(
                    cell_id=None,
                    cell=None,
                    fiber=_read_fiber(self.layout, self.target),
                    event_id=None,
                    event_ord=None,
                    repair_log=[],
                    closure_cycles=0,
                    authz_decision=self.authz_decision_dict,
                )
            raise SubstrateError(  # pragma: no cover — pipeline invariant
                PCM_RESPOND_PHASE,
                "respond pipeline finished without emitting cell/event",
            )
        return RespondResult(
            cell_id=cell.id or "",
            cell=cell,
            fiber=self.new_fiber,
            event_id=event["id"],
            event_ord=event["ord"],
            repair_log=self.all_repair_log,
            closure_cycles=self.closure_cycles_total,
            delta_log=self.delta_log,
            phase_log=self.phase_log,
            audit_log=self.audit_log,
            outer_iterations=self.outer_iterations,
            halted_with=self.halted_with,
            directive_result=self.directive_result,
            inconsistency_witnesses=self.inconsistency_witness_ids,
            cost_cell_id=self.cost_cell_id,
            authz_decision=self.authz_decision_dict,
            retraction_audit_log_id=self.retraction_audit_log_id,
        )


class Phase(Protocol):
    """One ordered step in the respond pipeline.

    ``slug`` is the phase's content-addressable identifier — the same
    slug an in-OS agent would author as ``(respond, has-phase, <slug>)``
    at v1.0 to register the phase in a substrate-resident pipeline.

    Phases MUST be deterministic pure functions of their input ``ctx``;
    non-determinism breaks Gate-9 byte-identity (per ``respond.md`` §3).
    """

    slug: str

    def run(self, ctx: RespondContext) -> None: ...


class PhasePipeline:
    """Ordered list of phases iterated for a single respond invocation.

    The pipeline is the load-bearing extensibility surface: a new
    kernel capability is a new :class:`Phase` subclass appended (or
    inserted) here, not an edit to the respond function body.

    Slug uniqueness is enforced at construction so the substrate-cell
    representation (one ``(respond, has-phase, <slug>)`` cell per phase)
    is well-defined.
    """

    def __init__(self, phases: list[Phase]) -> None:
        slugs = [p.slug for p in phases]
        seen: set[str] = set()
        dups: list[str] = []
        for s in slugs:
            if s in seen and s not in dups:
                dups.append(s)
            seen.add(s)
        if dups:
            raise ValueError(f"duplicate phase slugs in pipeline: {dups}")
        self.phases: list[Phase] = list(phases)

    def run(self, ctx: RespondContext) -> None:
        for phase in self.phases:
            phase.run(ctx)
            # Authz-deny short-circuit per ``decisions/capability-not-acl.md``
            # and t02-41: a non-TRUE Box_R restricts the requested predicate
            # to ⊥ algebraically — no event, no fiber advance, no further
            # phases. The Phase-0 ``AuthzGatePhase`` is the only phase that
            # populates ``authz_decision_dict``; checking after every phase
            # is cheap insurance for custom pipelines that insert a phase
            # before authz-gate (the slug-uniqueness invariant prevents two
            # authz gates).
            if (
                ctx.authz_decision_dict is not None
                and ctx.authz_decision_dict.get("allowed") is False
            ):
                return

    def with_phase(self, phase: Phase, *, after: str) -> "PhasePipeline":
        """Return a new pipeline with ``phase`` inserted after ``after``.

        Convenience for tests and out-of-tree extensions; the v1.0
        substrate-resident loader will assemble pipelines from cells
        directly without going through this helper.
        """
        new_phases: list[Phase] = []
        inserted = False
        for p in self.phases:
            new_phases.append(p)
            if p.slug == after:
                new_phases.append(phase)
                inserted = True
        if not inserted:
            raise ValueError(f"no phase with slug {after!r} in pipeline")
        return PhasePipeline(new_phases)


# ---------------------------------------------------------------------------
# Phase implementations
# ---------------------------------------------------------------------------
#
# Each phase lifts a contiguous block from the original ``respond``
# monolith. Behaviour MUST be byte-identical with the pre-pipeline
# implementation; the conformance suite + ``test_respond_pipeline``
# are the proof.


class AuthzGatePhase:
    """Phase 0 — Box_R authz gate on (sender → target) authentication.

    Auto-enables when an authentication accessibility cell is on disk.
    On a non-TRUE box value the gate **restricts**: it records the
    decision on ``ctx.authz_decision_dict`` (with ``allowed=False`` and
    the boxed value as witness) and the pipeline short-circuits the
    remaining phases per :meth:`PhasePipeline.run`. No exception is
    raised; no event, cell, or fiber-advance is produced. Consumers
    inspect ``RespondResult.authz_decision`` to learn the outcome.

    This is the substrate-side invocation of the authz fiber projection
    per ``specs/security/capability-model.md`` (the capability fiber)
    and ``decisions/authorization-is-modal-restriction.md`` (one $\\Box_R$
    primitive at six surfaces; the authentication surface is one).
    The sender's authz fiber, projected from its boundary entity per
    ``decisions/identity-is-boundary-projection.md``, is restricted at
    the (sender → target) edge via :func:`substrate.authorization.authz_check`.
    "Restrict, don't raise" is the v0.2a realisation of the
    no-amplification claim (row 8 / row 2 of
    ``references/theory-for-developers.md``) and the load-bearing
    discipline per ``decisions/capability-not-acl.md``: the algebra
    IS the capability check; an insufficient-authority outcome is a
    $\\bot$-valued contribution from the sender, not an exceptional
    control-flow event.
    """

    slug = "authz-gate"

    def run(self, ctx: RespondContext) -> None:
        ctx.gate_stratum = ctx.at_stratum if ctx.at_stratum is not None else "asserted"
        enforce = ctx.enforce_authz
        if enforce is None:
            enforce = _has_accessibility(ctx.layout, surface="authentication")
        if not enforce:
            return
        decision = _authz_check(
            layout=ctx.layout,
            sender=ctx.sender,
            target=ctx.target,
            stratum=ctx.gate_stratum,
        )
        # Restriction is algebraic. The decision dict carries the box
        # value as the witness of "this sender's authority restricts
        # the requested predicate to ⊥". Pipeline short-circuit lives
        # in ``PhasePipeline.run``; this phase is intentionally
        # raise-free per ``decisions/capability-not-acl.md`` and t02-41.
        ctx.authz_decision_dict = decision.model_dump(mode="json")


class ValidateAndReducePayloadPhase:
    """Phase 1 — slug validation, fiber load + invariant check, payload reduction."""

    slug = "validate-and-reduce-payload"

    def run(self, ctx: RespondContext) -> None:
        validate_slug(ctx.target, what="target")
        validate_slug(ctx.sender, what="sender")
        if not isinstance(ctx.payload, dict):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "payload must be an object")

        ctx.fiber = _read_fiber(ctx.layout, ctx.target)
        ctx.prev_predicates = {
            k: BilatticeValue(v) for k, v in (ctx.fiber.get("predicates") or {}).items()
        }
        ctx.prev_cells_by_predicate = dict(ctx.fiber.get("cells_by_predicate") or {})

        # Preflight invariant: every predicate in the loaded fiber must
        # have an emitted cell-id in cells_by_predicate. See the prose
        # in respond.md §"witness coverage" for the rationale.
        missing_witnesses = sorted(
            set(ctx.prev_predicates) - set(ctx.prev_cells_by_predicate)
        )
        if missing_witnesses:
            raise SubstrateError(
                PCC_MISSING_WITNESS,
                f"fiber for {ctx.target!r} has predicates without witness cell-ids: "
                f"{missing_witnesses} (every fiber writer must emit a cell atom "
                "for every predicate it introduces and persist its id in "
                "cells_by_predicate)",
                target=ctx.target,
                missing=missing_witnesses,
            )

        payload_env = TermEnv(
            vars={"self": dict(ctx.prev_predicates)},
            fiber_predicates=ctx.prev_predicates,
            parent_predicates=ctx.prev_predicates,
        )
        ctx.payload_predicates, ctx.fuel_after_payload = reduce_payload(
            ctx.payload, payload_env, fuel=ctx.fuel
        )


class ComposePhase:
    """Phase 2 — settling-monotonic merge + asserted-cell emission.

    Detects compose-time contradictions (knowledge-join → BOTH from
    two non-BOTH inputs) and queues them for Phase 4c witness
    emission. Pre-allocates the event ord so cell atoms can stamp it
    before the event is appended (the single-writer invariant).
    """

    slug = "compose"

    def run(self, ctx: RespondContext) -> None:
        ctx.parent_id = ctx.fiber.get("latest_cell_id")
        ctx.parents = [ctx.parent_id] if ctx.parent_id else []
        ctx.merged_predicates = dict(ctx.prev_predicates)
        for k, v in ctx.payload_predicates.items():
            cur = ctx.merged_predicates.get(k, BilatticeValue.NONE)
            joined = knowledge_join(cur, v)
            if not knowledge_leq(cur, joined):
                raise SubstrateError(
                    PCC_MONOTONICITY_FAIL, f"predicate {k} would lower"
                )
            ctx.merged_predicates[k] = joined
            if detect_compose_inconsistency(
                predicate=k,
                prev_value=cur,
                new_value=v,
                joined_value=joined,
                prev_witness_id=ctx.prev_cells_by_predicate.get(k),
                new_witness_id="pending-asserted",  # filled in below
            ):
                ctx.pending_inconsistencies.append({
                    "predicate": k,
                    "prev_witness_id": ctx.prev_cells_by_predicate.get(k),
                    "kind": "compose",
                })

        # Pre-allocate the event ord so cell atoms can stamp it before
        # the event is appended (single-writer log; height() is the
        # next ord).
        ctx.next_ord = ctx.event_log.height()

        # Emit asserted Cell atoms for predicates this respond actually
        # asserts.
        ctx.cells_by_predicate = dict(ctx.prev_cells_by_predicate)
        ctx.asserted_cells = _emit_asserted_cells(
            target=ctx.target,
            sender=ctx.sender,
            payload_predicates=ctx.payload_predicates,
            merged_predicates=ctx.merged_predicates,
            next_ord=ctx.next_ord,
            cells_by_predicate=ctx.cells_by_predicate,
        )


class DependentInvalidityPhase:
    """Phase 2.5 — σ-pass dependent-invalidity propagation.

    Per ``stratified-facts.md`` §3: when the payload retracts an
    asserted predicate (asserts FALSE), every prior saturated cell
    whose ``derived_from`` includes the retracted premise becomes
    dependently invalid. Emits retraction-cells at stratum
    ``"saturated"`` BEFORE the σ↔Δ loop so the loop sees the
    up-to-date fiber state.
    """

    slug = "dependent-invalidity"

    def run(self, ctx: RespondContext) -> None:
        ctx.dependent_invalid_cells = _emit_dependent_invalid_saturated_cells(
            layout=ctx.layout,
            target=ctx.target,
            fiber=ctx.fiber,
            payload_predicates=ctx.payload_predicates,
            asserted_cells=ctx.asserted_cells,
            prev_cells_by_predicate=ctx.prev_cells_by_predicate,
            next_ord=ctx.next_ord,
            cells_by_predicate=ctx.cells_by_predicate,
        )
        for c in ctx.dependent_invalid_cells:
            cur = ctx.merged_predicates.get(c.p, BilatticeValue.NONE)
            ctx.merged_predicates[c.p] = knowledge_join(cur, c.v)


class CloseSigmaDeltaPhase:
    """Phase 3 — σ↔Δ outer-fuel alternation.

    Each iteration: σ-pass saturates closure rules, then Δ-pass
    stabilizes per-cell bilattice values. A Δ-stabilization may
    unlock a previously-unmatched premise; if so, loop again. Halt
    on Δ-no-movement (joint fixed point) or fuel exhaustion
    (``PCR_SIGMA_DELTA_DIVERGED`` / ``PCR_BILATTICE_DIVERGED`` /
    ``PCR_SIGMA_FUEL_EXCEEDED``); partial state is preserved in the
    context so subsequent persistence phases still commit.
    """

    slug = "close-sigma-delta"

    def run(self, ctx: RespondContext) -> None:
        rules = _load_active_rules(ctx.layout, ctx.active_rule_ids)
        rules_by_id: dict[str, RuleRecord] = {}
        for r in rules:
            with_id = r.with_id()
            if with_id.id is not None:
                rules_by_id[with_id.id] = with_id
        ctx.rules_by_id = rules_by_id

        current_predicates: dict[str, BilatticeValue] = dict(ctx.merged_predicates)
        fuel_remaining = ctx.fuel_after_payload
        iteration = -1  # so outer_iterations = iteration + 1 is 0 if loop never runs

        # Δ-seed for iter 0: every payload-asserted predicate (the
        # assertion itself counts as movement, even when value == prev),
        # plus any predicate whose value rose via Phase 2's knowledge-join.
        delta_seed: set[str] = set(ctx.payload_predicates.keys())
        delta_seed.update(
            p
            for p, v in current_predicates.items()
            if v != ctx.prev_predicates.get(p, BilatticeValue.NONE)
        )

        converged = False
        for iteration in range(SIGMA_DELTA_OUTER_FUEL):
            # σ-pass — saturate to a closure-rule fixed point.
            ctx.mark("sigma-start", iteration)
            pre_sigma_predicates = dict(current_predicates)
            closure = fire_rules(
                initial_predicates=current_predicates,
                entity_slug=ctx.target,
                rules=rules,
                fuel=fuel_remaining,
                sigma_fuel=SIGMA_FUEL,
            )
            fuel_remaining = closure.fuel_remaining
            current_predicates = dict(closure.final_predicates)
            ctx.closure_cycles_total += closure.cycles
            sigma_moved: set[str] = {
                p
                for p, v in current_predicates.items()
                if v != pre_sigma_predicates.get(p, BilatticeValue.NONE)
            }
            delta_seed |= sigma_moved
            new_saturated = _emit_saturated_cells(
                target=ctx.target,
                repair_log=closure.fired,
                rules_by_id=rules_by_id,
                cells_by_predicate=ctx.cells_by_predicate,
                next_ord=ctx.next_ord,
            )
            ctx.iteration_cells.extend(new_saturated)
            ctx.all_repair_log.extend(closure.fired)
            # Append σ-firings to the unified audit stream in firing order.
            ctx.audit_log.extend(closure.fired)

            # σ-pass layer-budget exhaustion (per t02-e2): partial
            # saturated state preserved; do NOT enter Δ-pass for this
            # iteration; halt outer loop with PCR_SIGMA_FUEL_EXCEEDED.
            if closure.sigma_exhausted:
                ctx.mark("halt-sigma-fuel-exceeded", iteration)
                ctx.halted_with = PCR_SIGMA_FUEL_EXCEEDED
                break

            # Δ-pass — per-cell bilattice stabilization.
            ctx.mark("delta-start", iteration)
            pre_delta_predicates = dict(current_predicates)
            try:
                delta_result = run_delta_pass(
                    predicates=current_predicates,
                    moved_predicates=delta_seed,
                    rules=rules,
                    delta_fuel=DELTA_FUEL,
                )
            except SubstrateError as exc:
                # Per-cell Δ-fuel exhaustion halts with partial state
                # preserved. Record in phase log and exit without
                # raising so the cell + event still commit; readers
                # detect via ``halted_with``.
                if exc.code == PCR_BILATTICE_DIVERGED:
                    ctx.mark("halt-bilattice-diverged", iteration)
                    ctx.halted_with = PCR_BILATTICE_DIVERGED
                    break
                raise
            current_predicates = dict(delta_result.final_predicates)
            new_settled = _emit_settled_cells(
                target=ctx.target,
                emissions=delta_result.emissions,
                cells_by_predicate=ctx.cells_by_predicate,
                next_ord=ctx.next_ord,
            )
            ctx.iteration_cells.extend(new_settled)
            # Append delta-log entries in chronological worklist order.
            for entry in delta_result.entries:
                if isinstance(entry, DeltaEmit):
                    d = DeltaLogEntry(
                        code=PCR_DELTA_STABILIZED,
                        iteration=iteration,
                        predicate=entry.predicate,
                        pre_value=entry.pre_value,
                        post_value=entry.post_value,
                        wavefront_ordinal=entry.wavefront_ordinal,
                        via=entry.via,
                        substeps=entry.substeps,
                    )
                else:  # DeltaNoMovement
                    d = DeltaLogEntry(
                        code=PCR_DELTA_NO_MOVEMENT,
                        iteration=iteration,
                        predicate=entry.predicate,
                        pre_value=entry.value,
                        post_value=entry.value,
                        wavefront_ordinal=entry.wavefront_ordinal,
                    )
                ctx.delta_log.append(d)
                ctx.audit_log.append(d)

            # Outer fixed point: Δ moved nothing this iteration.
            if not delta_result.emissions:
                converged = True
                break

            # Δ-seed for the next outer iteration: only predicates Δ
            # moved this round (σ-pass next iteration may match them
            # against a previously-unmatched premise).
            delta_seed = {
                p
                for p, v in current_predicates.items()
                if v != pre_delta_predicates.get(p, BilatticeValue.NONE)
            }
            # Mark the boundary between iterations only if we'll loop again.
            if iteration + 1 < SIGMA_DELTA_OUTER_FUEL:
                ctx.mark("sigma-delta-iter", iteration + 1)

        if not converged and ctx.halted_with is None:
            # Outer fuel exhausted; preserve partial state and record halt.
            ctx.mark("halt-outer-fuel", iteration)
            ctx.halted_with = PCR_SIGMA_DELTA_DIVERGED

        ctx.final_predicates = current_predicates
        ctx.outer_iterations = iteration + 1


class BuildCellPhase:
    """Phase 3.5 — assemble the FiberSnapshot + queue saturated-stratum top-cells.

    Splits out from PersistPhase so the snapshot construction and the
    inconsistency-detection sweep over saturated cells are testable
    independently of disk I/O.
    """

    slug = "build-cell"

    def run(self, ctx: RespondContext) -> None:
        cell_metadata: dict[str, Any] = {
            **(ctx.metadata or {}),
            "closure_cycles": ctx.closure_cycles_total,
        }
        if ctx.directive is not None:
            cell_metadata["directive"] = ctx.directive

        ctx.cell = FiberSnapshot(
            entity=ctx.target,
            predicates=ctx.final_predicates,
            payload={"sender": ctx.sender, "raw_payload": ctx.payload},
            metadata=cell_metadata,
            parents=ctx.parents,
            cells=[
                *ctx.asserted_cells,
                *ctx.dependent_invalid_cells,
                *ctx.iteration_cells,
            ],
        ).with_id()

        # σ-pass contradictions: saturated cells whose raised value is
        # BOTH over a non-BOTH prior. Classified as local-inference
        # contradictions in the witness emission phase.
        for sat_cell in ctx.iteration_cells:
            prior_v = ctx.prev_predicates.get(sat_cell.p, BilatticeValue.NONE)
            if detect_saturated_inconsistency(
                raised_value=sat_cell.v, prior_value=prior_v,
            ):
                ctx.pending_inconsistencies.append({
                    "predicate": sat_cell.p,
                    "prev_witness_id": ctx.prev_cells_by_predicate.get(sat_cell.p),
                    "saturated_cell_id": sat_cell.id,
                    "saturated_witness_ids": list(sat_cell.derived_from or []),
                    "kind": "saturated",
                })


class PersistPhase:
    """Phase 4 + 4b — write cell record, append event, write fiber, materialize projections.

    R1 (per ``docs/dev/questions/respond-event-payload-self-describing.md``):
    the event body carries the sorted predicate-key list AND a
    canonical-bytes digest of the post-reduction payload, so the event
    log alone can answer "which event asserted which predicate against
    which entity" without joining through the cell store.
    """

    slug = "persist"

    def run(self, ctx: RespondContext) -> None:
        cell = ctx.cell
        if cell is None:  # pragma: no cover — pipeline ordering invariant
            raise SubstrateError(
                PCM_RESPOND_PHASE,
                "persist phase ran before build-cell produced a snapshot",
            )
        ctx.layout.put_record("cells", _cell_body_for_storage(cell))

        payload_keys: list[str] = sorted(ctx.payload_predicates.keys())
        payload_digest: str = cid({"payload": dict(ctx.payload_predicates)})
        event = ctx.event_log.append(
            kind="respond",
            body={
                "target": ctx.target,
                "sender": ctx.sender,
                "cell_id": cell.id,
                "rules_fired": [r.model_dump() for r in ctx.all_repair_log],
                "parent_cell_id": ctx.parent_id,
                "payload_keys": payload_keys,
                "payload_digest": payload_digest,
            },
            node_id=ctx.node_id,
        )
        # Defensive: the pre-allocated ord must equal what the log assigned.
        if event["ord"] != ctx.next_ord:  # pragma: no cover — single-writer invariant
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"event ord {event['ord']} does not match pre-allocated cell ord "
                f"{ctx.next_ord}",
            )
        ctx.event = event

        ctx.new_fiber = _write_fiber(
            ctx.layout,
            entity_slug=ctx.target,
            cell=cell,
            history_event_id=event["id"],
            history_event_ord=event["ord"],
            cells_by_predicate=ctx.cells_by_predicate,
        )

        # Phase 4b — re-materialize the three by-stratum projection
        # files so the on-disk read surface stays byte-identical with
        # a fresh re-projection.
        materialize_by_stratum_projections(
            layout=ctx.layout,
            entity_slug=ctx.target,
            fiber=ctx.new_fiber,
        )


class EmitInconsistencyWitnessesPhase:
    """Phase 4c — H¹ audit pass: one InconsistencyWitness per queued contradiction.

    Bracketed by ``audit-start`` / ``audit-end`` phase markers per
    ``specs/kernel/sigma-delta-passes.md`` §9 so repair-log readers
    can identify the audit sub-phase.
    """

    slug = "emit-inconsistency-witnesses"

    def run(self, ctx: RespondContext) -> None:
        ctx.mark("audit-start", ctx.outer_iterations)
        event = ctx.event
        if event is None:  # pragma: no cover — pipeline invariant
            raise SubstrateError(
                PCM_RESPOND_PHASE,
                "audit phase ran before persist appended the event",
            )
        for pending in ctx.pending_inconsistencies:
            pred = pending["predicate"]
            if pending["kind"] == "compose":
                new_witness_id = ctx.cells_by_predicate.get(pred)
                if not new_witness_id or not pending.get("prev_witness_id"):
                    continue
                sources = [pending["prev_witness_id"], new_witness_id]
            else:  # "saturated"
                sat_id = pending.get("saturated_cell_id")
                premise_ids = pending.get("saturated_witness_ids") or []
                if not sat_id or not premise_ids:
                    continue
                sources = [sat_id, *premise_ids]
            sources = list(dict.fromkeys([s for s in sources if s]))
            if not sources:
                continue
            # Source classification per
            # ``specs/kernel/inconsistency-repair.md`` §1.1 + §1.2 + §2
            # + §6 gate 6: default ``"local-inference"`` for both
            # compose-time and saturation-time emissions; promoted to
            # ``"federation-conflict"`` automatically when ``sender``
            # matches ``peer:*``.
            source_class: SourceClassification = (
                "federation-conflict" if ctx.sender.startswith("peer:")
                else "local-inference"
            )
            witness = InconsistencyWitness(
                s=ctx.target,
                p=pred,
                o=ctx.target,
                v=BilatticeValue.BOTH,
                step_ord=event["ord"],
                source_cells=sources,
                source_classification=source_class,
            ).with_id()
            _write_inconsistency_witness(layout=ctx.layout, witness=witness)
            if witness.id:
                ctx.inconsistency_witness_ids.append(witness.id)
        ctx.mark("audit-end", ctx.outer_iterations)


class EmitCostCellPhase:
    """Phase 4d — emit a settlement cost cell sized by σ-cycles consumed.

    No-op responds (zero cycles, no contradictions) emit nothing.
    """

    slug = "emit-cost-cell"

    def run(self, ctx: RespondContext) -> None:
        cost_value = float(ctx.closure_cycles_total)
        if cost_value <= 0 and not ctx.pending_inconsistencies:
            return
        event = ctx.event
        if event is None:
            # Custom pipelines that omit or reorder ``persist`` would
            # otherwise silently skip cost emission. Hard-fail so the
            # misordering surfaces.
            raise SubstrateError(
                PCM_RESPOND_PHASE,
                "emit-cost-cell phase ran before persist appended the event "
                "(custom pipeline ordering violated: cost emission requires "
                "the event ord)",
            )
        cost_cell = CostCell(
            entity=ctx.target,
            cost_class="settlement",
            value=cost_value,
            quantale=DEFAULT_QUANTALE.name,
            event_ord=event["ord"],
            source_op="respond",
        ).with_id()
        emit_cost(layout=ctx.layout, cell=cost_cell)
        ctx.cost_cell_id = cost_cell.id


class EmitRetractionAuditLogPhase:
    """Phase 4e — retraction audit-log emission for non-default at_stratum.

    Per ``specs/security/tool-risk-scoring.md`` §3 + pt-02/t02-126: when
    the caller acted at a non-default stratum (saturated / settled),
    the substrate MUST emit an audit-log fiber recording the
    retraction's target, the stratum at which authority was exercised,
    and the licensing capability id(s) drawn from the gate's
    ``matched_cells`` projection. Asserted-stratum responds (the legacy
    default) emit no audit-log cell — they're already the auditable
    wire form.
    """

    slug = "emit-retraction-audit-log"

    def run(self, ctx: RespondContext) -> None:
        if ctx.at_stratum is None or ctx.at_stratum == "asserted":
            return
        event = ctx.event
        if event is None:
            # See EmitCostCellPhase: surface custom-pipeline misordering
            # rather than silently skipping the audit-log emission a
            # non-default-stratum respond is REQUIRED to produce per
            # specs/security/tool-risk-scoring.md §3.
            raise SubstrateError(
                PCM_RESPOND_PHASE,
                "emit-retraction-audit-log phase ran before persist appended "
                "the event (custom pipeline ordering violated: audit-log "
                "emission requires the triggering event id + ord)",
            )
        ctx.retraction_audit_log_id = _emit_retraction_audit_log(
            layout=ctx.layout,
            event_log=ctx.event_log,
            node_id=ctx.node_id,
            target=ctx.target,
            sender=ctx.sender,
            at_stratum=ctx.at_stratum,
            triggering_event_id=event["id"],
            triggering_event_ord=event["ord"],
            authz_decision=ctx.authz_decision_dict,
        )


class ApplyDirectivePhase:
    """Phase 5 — apply directive side-effect (only after audit trail commit)."""

    slug = "apply-directive"

    def run(self, ctx: RespondContext) -> None:
        if ctx.directive is None:
            return
        ctx.directive_result = _apply_directive(
            ctx.directive,
            layout=ctx.layout,
            active_rule_ids=ctx.active_rule_ids,
        )


# The default phase pipeline. Kept as module-level data so out-of-tree
# extensions and tests can build derived pipelines via
# ``DEFAULT_PIPELINE.with_phase(...)`` or by passing a custom list to
# ``PhasePipeline(...)``. At v1.0 a substrate-resident loader will
# replace this with a list assembled from on-disk
# ``(respond, has-phase, <slug>)`` cells.
DEFAULT_PIPELINE: PhasePipeline = PhasePipeline([
    AuthzGatePhase(),
    ValidateAndReducePayloadPhase(),
    ComposePhase(),
    DependentInvalidityPhase(),
    CloseSigmaDeltaPhase(),
    BuildCellPhase(),
    PersistPhase(),
    EmitInconsistencyWitnessesPhase(),
    EmitCostCellPhase(),
    EmitRetractionAuditLogPhase(),
    ApplyDirectivePhase(),
])


def respond(
    *,
    target: str,
    payload: dict[str, Any],
    sender: str = "system",
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    active_rule_ids: list[str],
    fuel: int = 1024,
    metadata: dict[str, Any] | None = None,
    directive: dict[str, Any] | None = None,
    enforce_authz: bool | None = None,
    at_stratum: str | None = None,
) -> RespondResult:
    """End-to-end respond. Writes to storage + log.

    ``enforce_authz``: ``None`` auto-enables when an authentication
    accessibility cell is on disk; ``True`` always gates; ``False``
    bypasses the gate.

    ``at_stratum`` (per ``specs/security/capability-model.md``
    §"per-stratum capability fiber" + ``specs/security/user-as-boundary.md``
    §4): the stratum at which the sender is acting. ``None`` (default) is
    treated as ``"asserted"`` for the gate — payload writes always land
    as asserted cells. A non-default value (``"saturated"`` /
    ``"settled"``) signals a retraction request at that stratum; the
    gate is projected onto the matching capability fiber, and a
    post-commit ``audit-log`` cell is emitted recording the licensing
    capability ids and the stratum (per
    ``specs/security/tool-risk-scoring.md`` §3).
    """
    # The function body is a thin facade: build the typed context,
    # run the default phase pipeline, return the assembled result.
    # The phase classes themselves carry the per-phase logic; see the
    # "Phase pipeline" section above and ``specs/kernel/respond-pipeline.md``.
    ctx = RespondContext(
        target=target,
        payload=payload,
        sender=sender,
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        active_rule_ids=active_rule_ids,
        fuel=fuel,
        metadata=metadata,
        directive=directive,
        enforce_authz=enforce_authz,
        at_stratum=at_stratum,
    )
    DEFAULT_PIPELINE.run(ctx)
    return ctx.to_result()


def _emit_retraction_audit_log(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    target: str,
    sender: str,
    at_stratum: str,
    triggering_event_id: str,
    triggering_event_ord: int,
    authz_decision: dict[str, Any] | None,
) -> str:
    """Emit the audit-log fiber for a non-default-stratum respond.

    Per ``specs/security/tool-risk-scoring.md`` §3: the audit-log cell
    encodes (s, p, o, v) records on a synthetic ``audit-log:<id>``
    boundary entity. v0.1 substrate cells are unary, so the spec's
    ``(audit-log:<id>, p, o)`` ternaries are inlined into the predicate
    string per the ``bootstrap-users`` precedent
    (``init_boot/bootstrap_users.py`` §"v0.2-pragmatic shim"); the
    binary-cell-emission spec freeze will rewrite this surface.

    The emission is itself a ``respond`` call with ``enforce_authz=False``
    and ``at_stratum=None`` so it does not recurse. The audit-log slug
    is content-addressed against the triggering event id so two
    retractions of the same target at the same stratum on different
    events produce distinguishable audit records.
    """
    slug = f"audit-log:{triggering_event_id}"
    payload: dict[str, str] = {
        "kind-audit-log": "True",
        f"retraction-of-target:{target}": "True",
        f"at-stratum-{at_stratum}": "True",
        f"fired-at-ord:{triggering_event_ord}": "True",
        f"sender:{sender}": "True",
    }
    matched: list[str] = []
    if authz_decision is not None:
        raw = authz_decision.get("matched_cells") or []
        matched = [c for c in raw if isinstance(c, str)]
    for cap_id in sorted(matched):
        payload[f"licensed-by-capability:{cap_id}"] = "True"
    audit_result = respond(
        target=slug,
        payload=payload,
        sender="system",
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        active_rule_ids=[],
        enforce_authz=False,
        at_stratum=None,
    )
    return audit_result.cell_id


def _cell_body_for_storage(cell: FiberSnapshot) -> dict[str, Any]:
    """Strip ``id`` from the snapshot so storage can re-hash it."""
    body = cell.model_dump(mode="json")
    body.pop("id", None)
    return {k: v for k, v in body.items() if v is not None}
