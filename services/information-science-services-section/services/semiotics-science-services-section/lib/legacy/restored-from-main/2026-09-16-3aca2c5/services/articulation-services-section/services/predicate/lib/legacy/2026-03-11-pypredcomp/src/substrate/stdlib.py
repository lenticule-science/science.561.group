"""Stdlib — coreutils-equivalent verbs over the substrate.

Verbs implemented:

* ``project``     — pattern-match cells (``ls`` / ``grep``).
* ``filter_``     — refine a cell list by value constraint (``grep``).
* ``fold``        — aggregate a cell list (``wc`` / ``uniq -c`` / ``sort``).
* ``materialize`` — dump canonical bytes of a cell / entity / fiber (``cat``).
* ``hash_``       — SHA-256 of canonical bytes (``sha256sum``).
* ``assert_cell`` — affirm a (s,p,o,v) predication (``echo > file``).
* ``retract_cell``— deny a (s,p,o) predication (``rm``).
* ``settle``      — drive respond to fixed point on a target (``make``).
* ``witness``     — walk the derivation chain of a cell-id (``git log``).
* ``audit``       — verify event-chain and witness-chain integrity
  (``git fsck`` / ``tripwire``). See ``specs/stdlib/audit.md``.
* ``fork``        — clone a session inheriting parent's owner +
  capabilities (``fork(2)``). See ``specs/stdlib/fork.md``.

Not yet implemented (tracked as v0.2 follow-up; requires async
subscription substrate touching closure-engine + runtime):

* ``await``       — wait on a fiber update (``wait`` / ``select``).
  See ``specs/stdlib/await.md``.

Read-side verbs (``project``, ``filter_``, ``fold``, ``materialize``, ``hash_``,
``witness``, ``audit``) walk on-disk content under ``$ROOT/cells/``,
``$ROOT/fibers/``, and ``$ROOT/events.jsonl``; write-side verbs
(``assert_cell``, ``retract_cell``, ``settle``, ``fork``) are thin wrappers
over :func:`substrate.respond.respond` (directly, or transitively via
:mod:`process.session`).
"""

from __future__ import annotations

import fnmatch
import json
from pathlib import Path
from typing import Any, Iterable

from pydantic import BaseModel

from storage.cell import Cell
from storage.cell_record import FiberSnapshot
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import (
    BilatticeValue,
    knowledge_leq,
    truth_leq,
)
from substrate.canonicalization import canonical, cid_bytes
from substrate.error_codes import (
    PCC_HASH_MISMATCH,
    PCM_PAYLOAD_INVALID,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)
from substrate.respond import RespondResult, respond


# ---------------------------------------------------------------------------
# Pattern matching
# ---------------------------------------------------------------------------


class CellPattern(BaseModel):
    """Partial cell pattern. Each of s/p/o/v may be:

    * ``None`` or ``"*"``   — wildcard (any value).
    * A literal slug/string — exact match.
    * A glob (``"task:*"``) — fnmatch-style.
    * A bind variable (``"$x"``) — wildcard, captured into bindings.
    """

    s: str | None = None
    p: str | None = None
    o: str | None = None
    v: str | None = None


def _matches_pos(pattern: str | None, value: str) -> bool:
    if pattern is None or pattern == "*":
        return True
    if pattern.startswith("$"):
        return True
    if "*" in pattern or "?" in pattern or "[" in pattern:
        return fnmatch.fnmatchcase(value, pattern)
    return pattern == value


def _walk_snapshot_files(layout: StorageLayout) -> Iterable[Path]:
    cells_dir = layout.root / "cells"
    if not cells_dir.exists():
        return
    for shard in sorted(cells_dir.iterdir()):
        if not shard.is_dir():
            continue
        for path in sorted(shard.iterdir()):
            if path.suffix == ".json":
                yield path


def _load_atoms_for_entity(layout: StorageLayout, entity: str) -> list[Cell]:
    """Load all known cell atoms about ``entity`` from snapshot records.

    The on-disk source of truth is ``$ROOT/cells/<pp>/<id>.json``: each
    file is a :class:`FiberSnapshot` whose ``cells: [...]`` carries the
    atoms emitted in that respond round. We collect every atom whose
    snapshot is for ``entity``, deduplicating by atom id.
    """
    seen: dict[str, Cell] = {}
    for path in _walk_snapshot_files(layout):
        try:
            body = json.loads(path.read_bytes().decode("utf-8"))
        except (OSError, json.JSONDecodeError):
            continue
        if body.get("entity") != entity:
            continue
        for atom_body in body.get("cells", []):
            try:
                atom = Cell(**atom_body)
            except Exception:
                continue
            if atom.id and atom.id not in seen:
                seen[atom.id] = atom
    return list(seen.values())


def _load_all_atoms(layout: StorageLayout) -> list[Cell]:
    seen: dict[str, Cell] = {}
    for path in _walk_snapshot_files(layout):
        try:
            body = json.loads(path.read_bytes().decode("utf-8"))
        except (OSError, json.JSONDecodeError):
            continue
        for atom_body in body.get("cells", []):
            try:
                atom = Cell(**atom_body)
            except Exception:
                continue
            if atom.id and atom.id not in seen:
                seen[atom.id] = atom
    return list(seen.values())


def _resolve_scope(layout: StorageLayout, scope: str | None) -> list[Cell]:
    """Return the candidate atom set bounded by ``scope``.

    * ``None`` / ``"current"`` / ``"all"``  — every atom on disk.
    * ``"entity:<slug>"``                    — atoms for one entity only.
    """
    if scope in (None, "current", "all"):
        return _load_all_atoms(layout)
    if scope.startswith("entity:"):
        return _load_atoms_for_entity(layout, scope[len("entity:"):])
    raise SubstrateError(PCM_PAYLOAD_INVALID, f"unsupported scope {scope!r}")


def project(
    layout: StorageLayout,
    pattern: CellPattern | dict[str, str | None] | None = None,
    *,
    scope: str | None = None,
) -> list[Cell]:
    """Return all cell atoms matching ``pattern`` within ``scope``.

    Iteration order is lexicographic on cell id (deterministic).
    """
    pat = pattern if isinstance(pattern, CellPattern) else CellPattern(**(pattern or {}))
    cells = _resolve_scope(layout, scope)
    matches: list[Cell] = []
    for atom in cells:
        if not _matches_pos(pat.s, atom.s):
            continue
        if not _matches_pos(pat.p, atom.p):
            continue
        if not _matches_pos(pat.o, atom.o):
            continue
        if not _matches_pos(pat.v, atom.v.value):
            continue
        matches.append(atom)
    matches.sort(key=lambda c: c.id or "")
    return matches


# ---------------------------------------------------------------------------
# filter — refine by value constraint
# ---------------------------------------------------------------------------


def _parse_constraint(constraint: str) -> tuple[str, str]:
    """Split a constraint string into ``(op, operand)``.

    Operators: ``=`` ``==`` ``!=`` ``<=t`` ``>=t`` ``<=k`` ``>=k``;
    bareword ``"is-stale"`` is its own form.
    """
    s = constraint.strip()
    for op in ("<=t", ">=t", "<=k", ">=k", "!=", "==", "="):
        if s.startswith(op):
            return op, s[len(op):].strip()
    if s == "is-stale":
        return "is-stale", ""
    return "==", s


def filter_(cells: list[Cell], by: str) -> list[Cell]:
    """Refine a cell list by a value constraint string."""
    op, operand = _parse_constraint(by)
    if op == "is-stale":
        return [c for c in cells if c.p == "stale-since-ord"]
    if op in ("==", "="):
        return [c for c in cells if c.v.value == operand]
    if op == "!=":
        return [c for c in cells if c.v.value != operand]
    target = BilatticeValue(operand)
    if op == "<=t":
        return [c for c in cells if truth_leq(c.v, target)]
    if op == ">=t":
        return [c for c in cells if truth_leq(target, c.v)]
    if op == "<=k":
        return [c for c in cells if knowledge_leq(c.v, target)]
    if op == ">=k":
        return [c for c in cells if knowledge_leq(target, c.v)]
    raise SubstrateError(PCM_PAYLOAD_INVALID, f"unknown filter op {op!r}")


# ---------------------------------------------------------------------------
# fold — aggregate
# ---------------------------------------------------------------------------


class FoldResult(BaseModel):
    """One row of a fold output. ``key`` is None for scalar folds."""

    op: str
    key: str | None = None
    value: Any


def _numeric(o: str) -> float | None:
    try:
        return float(o)
    except ValueError:
        return None


def fold(
    cells: list[Cell],
    op: str,
    *,
    by: str | None = None,
) -> list[FoldResult]:
    """Aggregate ``cells`` under ``op``. ``by`` selects a key field.

    Ops: ``count``, ``sum``, ``min``, ``max``, ``avg``, ``distinct``,
    ``sort``, ``group-by``.
    """
    if op == "count":
        return [FoldResult(op="count", value=len(cells))]
    if op == "sort":
        ordered = sorted(cells, key=lambda c: (c.s, c.p, c.o, c.id or ""))
        return [FoldResult(op="sort", value=[c.id for c in ordered])]
    if op == "distinct":
        field = by or "o"
        seen: list[str] = []
        for c in cells:
            val = getattr(c, field, None)
            if isinstance(val, BilatticeValue):
                val = val.value
            if val is not None and val not in seen:
                seen.append(val)
        seen.sort()
        return [FoldResult(op="distinct", key=field, value=seen)]
    if op == "group-by":
        field = by or "p"
        groups: dict[str, int] = {}
        for c in cells:
            val = getattr(c, field, None)
            if isinstance(val, BilatticeValue):
                val = val.value
            if val is None:
                continue
            groups[val] = groups.get(val, 0) + 1
        return [
            FoldResult(op="group-by", key=k, value=groups[k])
            for k in sorted(groups)
        ]
    if op in ("sum", "min", "max", "avg"):
        nums = [_numeric(c.o) for c in cells]
        nums = [n for n in nums if n is not None]
        if not nums:
            return [FoldResult(op=op, value=None)]
        if op == "sum":
            value: Any = sum(nums)
        elif op == "min":
            value = min(nums)
        elif op == "max":
            value = max(nums)
        else:
            value = sum(nums) / len(nums)
        return [FoldResult(op=op, value=value)]
    raise SubstrateError(PCM_PAYLOAD_INVALID, f"unknown fold op {op!r}")


# ---------------------------------------------------------------------------
# materialize — dump canonical bytes
# ---------------------------------------------------------------------------


def materialize(
    layout: StorageLayout,
    target: str,
    *,
    format: str = "json",
) -> bytes:
    """Force the canonical-byte representation of ``target``.

    ``target`` forms:

    * ``cell:<id>``       — read snapshot record from disk.
    * ``entity:<slug>``   — emit the entity's fiber.json.
    * ``fiber:<slug>``    — alias for ``entity:<slug>``.
    * ``<id>`` (64-hex)   — bare snapshot id.
    * ``<slug>``          — fall back to entity slug.
    """
    if format != "json":
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"format {format!r} not yet implemented (json only)",
        )

    if target.startswith("cell:"):
        cid_str = target[len("cell:"):]
        return layout.get_record_bytes("cells", cid_str)
    if target.startswith("entity:"):
        return _materialize_entity(layout, target[len("entity:"):])
    if target.startswith("fiber:"):
        return _materialize_entity(layout, target[len("fiber:"):])
    if len(target) == 64 and all(c in "0123456789abcdef" for c in target):
        return layout.get_record_bytes("cells", target)
    return _materialize_entity(layout, target)


def _materialize_entity(layout: StorageLayout, entity: str) -> bytes:
    fiber = layout.get_fiber(entity)
    if fiber is None:
        raise SubstrateError(
            PCS_RECORD_NOT_FOUND,
            f"no fiber for entity {entity!r}",
            entity=entity,
        )
    return canonical(fiber)


# ---------------------------------------------------------------------------
# hash — SHA-256 of canonical bytes
# ---------------------------------------------------------------------------


def hash_(target: str | bytes, *, layout: StorageLayout | None = None) -> str:
    """Return the 64-char hex SHA-256 of ``target``'s canonical bytes.

    * ``bytes``                  — hash directly.
    * ``"cell:<id>"`` / 64-hex   — read from disk; verifies on-disk id.
    * ``"entity:<slug>"``        — hash the canonical fiber bytes.
    """
    if isinstance(target, (bytes, bytearray)):
        return cid_bytes(bytes(target))
    if layout is None:
        # No disk; treat as raw string bytes.
        return cid_bytes(target.encode("utf-8"))
    if target.startswith("cell:"):
        return _hash_cell(layout, target[len("cell:"):])
    if target.startswith("entity:"):
        return cid_bytes(_materialize_entity(layout, target[len("entity:"):]))
    if len(target) == 64 and all(c in "0123456789abcdef" for c in target):
        return _hash_cell(layout, target)
    return cid_bytes(target.encode("utf-8"))


def _hash_cell(layout: StorageLayout, expected_id: str) -> str:
    """Recompute a cell record's id from its canonical body-without-id.

    Raises ``PCC_HASH_MISMATCH`` when the recomputed hash does not match
    the requested id — that's the on-disk integrity signal per
    ``stdlib/hash.md`` §4.1.
    """
    body = layout.get_record("cells", expected_id)
    body_no_id = {k: v for k, v in body.items() if k != "id"}
    actual = cid_bytes(canonical(body_no_id))
    if actual != expected_id:
        raise SubstrateError(
            PCC_HASH_MISMATCH,
            f"on-disk cell {expected_id!r} hashes to {actual!r}",
            expected=expected_id,
            actual=actual,
        )
    return actual


# ---------------------------------------------------------------------------
# assert / retract — write-side wrappers over respond
# ---------------------------------------------------------------------------


def assert_cell(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    s: str,
    p: str,
    v: BilatticeValue | str = BilatticeValue.TRUE,
    sender: str = "system",
    active_rule_ids: list[str] | None = None,
    fuel: int = 1024,
) -> RespondResult:
    """Affirm ``(s, p, s, v)`` via :func:`respond`.

    Predicates are unary in v0.1, so the object slot reuses ``s`` per
    cell-record §0; callers write three positionals and a value.
    """
    val = v.value if isinstance(v, BilatticeValue) else BilatticeValue(v).value
    return respond(
        target=s,
        payload={p: val},
        sender=sender,
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        active_rule_ids=list(active_rule_ids or []),
        fuel=fuel,
    )


def retract_cell(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    s: str,
    p: str,
    sender: str = "system",
    active_rule_ids: list[str] | None = None,
    fuel: int = 1024,
) -> RespondResult:
    """Deny ``(s, p, s)``: equivalent to ``assert_cell(..., v=FALSE)``.

    Per the cell-record monotonicity rule, retracting a cell whose
    current value is True yields Both (paraconsistent retention) — the
    monotonicity check inside respond enforces this.
    """
    return assert_cell(
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        s=s,
        p=p,
        v=BilatticeValue.FALSE,
        sender=sender,
        active_rule_ids=active_rule_ids,
        fuel=fuel,
    )


# ---------------------------------------------------------------------------
# settle — drive respond to fixed point
# ---------------------------------------------------------------------------


def settle(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    target: str,
    sender: str = "system",
    active_rule_ids: list[str] | None = None,
    fuel: int = 1024,
) -> RespondResult:
    """Run ``respond`` on ``target`` with an empty payload.

    With no new asserted predicates the σ/Δ engine still iterates the
    closure to fixed point against the current fiber, producing a fresh
    snapshot whose ``repair_log`` records any rule firings that fire on
    the existing state.
    """
    return respond(
        target=target,
        payload={},
        sender=sender,
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        active_rule_ids=list(active_rule_ids or []),
        fuel=fuel,
    )


# ---------------------------------------------------------------------------
# witness — walk the derivation chain
# ---------------------------------------------------------------------------


class WitnessEntry(BaseModel):
    """One link in a derivation chain."""

    cell_id: str
    s: str
    p: str
    o: str
    v: str
    ord: int
    stratum: str
    derived_from: list[str] = []
    derived_via: str | None = None
    sender: str | None = None


def _index_atoms(layout: StorageLayout) -> dict[str, Cell]:
    return {c.id: c for c in _load_all_atoms(layout) if c.id}


def witness(
    layout: StorageLayout,
    cell_id: str,
    *,
    depth: int | None = None,
) -> list[WitnessEntry]:
    """Return the derivation chain that produced ``cell_id``.

    Walks ``derived_from`` recursively, breadth-first, deduplicating
    visited atoms. Result is in chronological order (lowest ``ord``
    first). ``depth`` bounds the walk; ``None`` is unbounded.
    """
    atoms = _index_atoms(layout)
    if cell_id not in atoms:
        raise SubstrateError(
            PCS_RECORD_NOT_FOUND,
            f"no atom on disk with id {cell_id!r}",
            cell_id=cell_id,
        )

    visited: dict[str, Cell] = {}
    frontier: list[str] = [cell_id]
    steps = 0
    while frontier:
        if depth is not None and steps >= depth:
            break
        next_frontier: list[str] = []
        for cid_str in frontier:
            if cid_str in visited or cid_str not in atoms:
                continue
            atom = atoms[cid_str]
            visited[cid_str] = atom
            for parent in atom.derived_from or []:
                if parent not in visited:
                    next_frontier.append(parent)
        frontier = next_frontier
        steps += 1

    chain = sorted(visited.values(), key=lambda c: (c.ord, c.id or ""))
    return [
        WitnessEntry(
            cell_id=c.id or "",
            s=c.s,
            p=c.p,
            o=c.o,
            v=c.v.value,
            ord=c.ord,
            stratum=c.stratum,
            derived_from=list(c.derived_from or []),
            derived_via=c.derived_via,
            sender=c.sender,
        )
        for c in chain
    ]


# ---------------------------------------------------------------------------
# audit — verify event-chain and witness-chain integrity
# ---------------------------------------------------------------------------
#
# Per ``specs/stdlib/audit.md`` (v0.2): walk the event log and verify
#
#   1. Each event's ``id`` equals ``sha256(canonical(event without id))``.
#   2. Each event's ``prev`` matches the predecessor's ``id``
#      (hash-chain linkage).
#   3. Each event's ``ord`` equals its line-index (genesis at 0).
#   4. For cell records on disk: each cell-id matches its canonical bytes.
#   5. For derived cells (stratum != "asserted"): every entry in
#      ``derived_from`` resolves to a cell atom that exists on disk.
#
# The verb is read-only: it raises nothing on failures; instead it
# accumulates :class:`AuditFailure` records and reports
# ``verified = (failures == [])``. The substrate's response to
# detected corruption is to RECORD it (audit log) and let the
# operator decide, not to crash mid-walk.
#
# Signature verification (per spec §2 bullet "each signed event's
# signature verifies") is not yet exercised: v0.2 base does not sign
# routine events. When ``append_signed`` is used (federation ingest)
# the signature on the cell record's ``signatures`` field is verified
# at append time; this audit re-verifies the hash discipline only.
# Tracked as a follow-up under federation's witness work.


class AuditFailure(BaseModel):
    """One detected integrity defect.

    The ``kind`` strings are spec-stable; downstream tooling MAY switch
    on them. Current vocabulary:

    * ``"id-mismatch"``       — event's recorded id != recomputed cid.
    * ``"prev-mismatch"``     — event's prev != predecessor's id.
    * ``"ord-skew"``          — event's ord != its line-index.
    * ``"json-parse-error"``  — line did not parse as JSON.
    * ``"cell-id-mismatch"``  — cell file's id != recomputed cid.
    * ``"witness-missing"``   — derived_from entry not present on disk.
    """

    kind: str
    event_id: str | None = None
    cell_id: str | None = None
    ord: int | None = None
    detail: str | None = None


class AuditReport(BaseModel):
    """Result of one ``audit`` invocation.

    Mirrors the JSON shape in ``specs/stdlib/audit.md`` §3 with snake-
    cased field names. Callers that need the spec's hyphenated wire
    form should serialise via :meth:`to_wire`.
    """

    verified: bool
    events_checked: int
    witnesses_checked: int
    failures: list[AuditFailure]

    def to_wire(self) -> dict[str, Any]:
        """Spec §3 hyphenated JSON shape."""
        return {
            "verified": self.verified,
            "events-checked": self.events_checked,
            "witnesses-checked": self.witnesses_checked,
            "failures": [
                {
                    k.replace("_", "-"): v
                    for k, v in f.model_dump(exclude_none=True).items()
                }
                for f in self.failures
            ],
        }


def audit(
    layout: StorageLayout,
    *,
    event_log: EventLog | None = None,
    start_ord: int = 0,
    end_ord: int | None = None,
) -> AuditReport:
    """Verify event-chain and witness-chain integrity over ``$ROOT``.

    Walks ``$ROOT/events.jsonl`` from ``start_ord`` (inclusive) to
    ``end_ord`` (exclusive; ``None`` = end-of-log) and on-disk cell
    records under ``$ROOT/cells/``. Returns an :class:`AuditReport`;
    ``verified`` is ``True`` iff the failures list is empty.

    ``event_log`` is accepted for symmetry with the other write-side
    verbs but is unused — audit reads the log file directly so it can
    report on JSON-parse failures the in-memory iterator would raise.

    Per ``specs/stdlib/audit.md`` §5: same audit run twice on the same
    substrate state produces an identical report (failures are emitted
    in chronological event-order; cell-witness checks are emitted in
    lexicographic cell-id order).
    """
    # Local import: substrate.canonicalization.cid lives one module away
    # but we already import cid_bytes. Use cid through the recompute path.
    from substrate.canonicalization import cid as _cid

    failures: list[AuditFailure] = []
    events_checked = 0
    witnesses_checked = 0

    # ---- Phase 1: event-log integrity ----
    log_path = layout.root / "events.jsonl"
    if log_path.exists():
        prev_id = "0" * 64
        expected_ord = 0
        with log_path.open("r", encoding="utf-8") as fh:
            for line_idx, raw_line in enumerate(fh):
                line = raw_line.rstrip("\n")
                if not line:
                    continue
                try:
                    event = json.loads(line)
                except json.JSONDecodeError as e:
                    failures.append(
                        AuditFailure(
                            kind="json-parse-error",
                            ord=line_idx,
                            detail=f"line {line_idx}: {e}",
                        )
                    )
                    # Cannot verify anything else on this line; skip but
                    # keep advancing expected_ord so subsequent ord-skew
                    # is reported relative to the original sequence.
                    expected_ord += 1
                    continue

                event_id = event.get("id")
                rebuilt = {k: v for k, v in event.items() if k != "id"}
                recomputed = _cid(rebuilt)
                # Bound the per-event work in one pass; collect every
                # detected defect against this event before advancing.
                if event_id != recomputed:
                    failures.append(
                        AuditFailure(
                            kind="id-mismatch",
                            event_id=event_id,
                            ord=event.get("ord"),
                            detail=f"recomputed cid={recomputed}",
                        )
                    )
                if event.get("ord") != expected_ord:
                    failures.append(
                        AuditFailure(
                            kind="ord-skew",
                            event_id=event_id,
                            ord=event.get("ord"),
                            detail=f"expected ord={expected_ord}",
                        )
                    )
                if event.get("prev") != prev_id:
                    failures.append(
                        AuditFailure(
                            kind="prev-mismatch",
                            event_id=event_id,
                            ord=event.get("ord"),
                            detail=f"expected prev={prev_id}",
                        )
                    )
                # Advance the chain even on a defective event so we can
                # surface every downstream defect rather than aborting
                # at the first error.
                prev_id = event_id if event_id is not None else prev_id
                expected_ord += 1
                events_checked += 1

    # Honour the [start_ord, end_ord) window by trimming reports.
    # (Phase 1 walks the whole log so prev/id chain checks remain
    # well-defined; we filter the failure list afterwards.)
    if start_ord != 0 or end_ord is not None:
        lo = start_ord
        hi = end_ord if end_ord is not None else (events_checked + 1)
        failures = [
            f for f in failures
            if f.ord is None or (lo <= f.ord < hi)
        ]

    # ---- Phase 2: per-cell hash + witness chain ----
    # Lexicographic walk for determinism (gate-9 byte-identity).
    cells_dir = layout.root / "cells"
    cell_ids_on_disk: set[str] = set()
    cell_paths: list[Path] = []
    if cells_dir.exists():
        for shard in sorted(cells_dir.iterdir()):
            if not shard.is_dir():
                continue
            for path in sorted(shard.iterdir()):
                if path.suffix == ".json":
                    cell_paths.append(path)
                    cell_ids_on_disk.add(path.stem)

    for path in cell_paths:
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, UnicodeDecodeError) as e:
            failures.append(
                AuditFailure(
                    kind="json-parse-error",
                    cell_id=path.stem,
                    detail=str(e),
                )
            )
            continue
        recorded_id = data.get("id")
        rebuilt = {k: v for k, v in data.items() if k != "id"}
        recomputed = _cid(rebuilt)
        if recorded_id != recomputed:
            failures.append(
                AuditFailure(
                    kind="cell-id-mismatch",
                    cell_id=recorded_id or path.stem,
                    detail=f"recomputed cid={recomputed}",
                )
            )
        # Witness-chain: every derived_from entry must exist on disk.
        derived_from = data.get("derived_from") or []
        if derived_from:
            for parent_id in sorted(derived_from):
                witnesses_checked += 1
                if parent_id not in cell_ids_on_disk:
                    failures.append(
                        AuditFailure(
                            kind="witness-missing",
                            cell_id=recorded_id or path.stem,
                            detail=f"derived_from id {parent_id!r} not on disk",
                        )
                    )

    return AuditReport(
        verified=(failures == []),
        events_checked=events_checked,
        witnesses_checked=witnesses_checked,
        failures=failures,
    )


# ---------------------------------------------------------------------------
# fork — clone a session
# ---------------------------------------------------------------------------
#
# Per ``specs/stdlib/fork.md`` (v0.2): create a child session whose
# ``parent-session`` points at the caller. Capability fiber inherited
# (composition with sender's authority, never amplifying).
#
# This is a thin wrapper over :func:`process.session.fork_session` —
# the session module owns the session entity invariants (slug shape,
# lifecycle, capability inheritance via ⊙ then ⇒). The verb here
# exists so that callers programming against the stdlib namespace
# never need to import ``process.session`` directly, mirroring the
# Unix convention where ``fork(2)`` is in libc, not in a process
# manager. The import is local to break the cycle:
# ``process.session`` already imports :func:`assert_cell` from this
# module, so a top-level import would deadlock package init.


def fork(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    parent_slug: str,
):
    """Clone ``parent_slug`` into a child session.

    The child inherits the parent's owner and capability list (per
    ``specs/stdlib/fork.md`` §2: capability composition is non-
    amplifying — the child cannot acquire a capability the parent
    lacks). The child's ``parent`` field points at ``parent_slug``,
    realising the spec's ``parent-session`` predicate.

    Returns the new :class:`process.session.Session`. Raises
    :class:`SubstrateError` with ``PCM_SESSION_CLOSED`` if the parent
    is not currently open.

    Per the spec's §3 memory-tier rule: substrate cells (consolidatable
    tier) are shared without copy because the substrate is immutable;
    no per-tier cloning happens here.
    """
    # Local import to break stdlib <-> process.session cycle.
    from process.session import fork_session

    return fork_session(
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        parent_slug=parent_slug,
    )


__all__ = [
    "CellPattern",
    "FoldResult",
    "WitnessEntry",
    "AuditFailure",
    "AuditReport",
    "project",
    "filter_",
    "fold",
    "materialize",
    "hash_",
    "assert_cell",
    "retract_cell",
    "settle",
    "witness",
    "audit",
    "fork",
]
