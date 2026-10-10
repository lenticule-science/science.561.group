"""Federation HTTP surface (per ``decisions/federation-by-construction.md``).

v0.1 is single-node — there is no peer-to-peer protocol — but the
endpoints exist and use the federation event format from day one. The
``/federation/sync`` endpoint accepts a peer's per-predicate witness map
and returns the ``knowledge_join`` (⊙) merge with the local fiber. By
default this is a *preview* (``persist=false``); pass ``persist=true``
to actually append a synthesized "federation_merge" event and update the
local fiber.
"""

from __future__ import annotations

from typing import Any

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field

from substrate.algebra import BilatticeValue, knowledge_join, knowledge_leq
from substrate.error_codes import (
    PCC_MONOTONICITY_FAIL,
    PCM_PAYLOAD_INVALID,
    SubstrateError,
)
from storage.cell import Cell
from storage.cell_record import FiberSnapshot
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


class PeerEntry(BaseModel):
    node_id: str
    url: str
    last_seen_ns: int | None = None


class SyncRequest(BaseModel):
    peer_node_id: str
    entity: str = Field(description="lower-kebab entity slug to merge into")
    fiber_predicates: dict[str, str]
    persist: bool = False


def merge_peer_fiber(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    peer_node_id: str,
    entity: str,
    fiber_predicates: dict[str, str],
    persist: bool,
    node_id: str,
) -> dict[str, Any]:
    """Merge ``fiber_predicates`` into the local fiber for ``entity`` under ⊙.

    Returns a dict describing the merge, including (when ``persist=True``)
    the synthesized cell-id and event-id. Raises :class:`SubstrateError`
    on monotonicity violations or invalid bilattice values, so callers
    on either the HTTP or the MCP path get the same error vocabulary.
    """
    incoming: dict[str, BilatticeValue] = {}
    for k, v_str in fiber_predicates.items():
        try:
            incoming[k] = BilatticeValue(v_str)
        except ValueError as e:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"bad bilattice value {v_str!r} for predicate {k!r}",
            ) from e

    fiber = layout.get_fiber(entity) or {
        "entity": entity,
        "latest_cell_id": None,
        "predicates": {},
        "cells_by_predicate": {},
        "history": [],
    }
    local: dict[str, BilatticeValue] = {
        k: BilatticeValue(v) for k, v in (fiber.get("predicates") or {}).items()
    }
    cells_by_predicate: dict[str, str] = dict(fiber.get("cells_by_predicate") or {})

    merged: dict[str, BilatticeValue] = dict(local)
    raised: dict[str, BilatticeValue] = {}
    for k, v in incoming.items():
        cur = merged.get(k, BilatticeValue.NONE)
        joined = knowledge_join(cur, v)
        if not knowledge_leq(cur, joined):
            raise SubstrateError(
                PCC_MONOTONICITY_FAIL,
                f"federation merge would lower predicate {k!r}",
                predicate=k,
            )
        # Don't materialize a NONE-valued key that the local fiber
        # didn't already carry: NONE is the bilattice bottom (no
        # information), so writing it as a fresh predicate would
        # introduce a key without a corresponding witness cell (the
        # raised-only emission path below skips it). Skipping the
        # write keeps the witness-map invariant intact and avoids
        # gratuitous predicate-map noise.
        if joined == BilatticeValue.NONE and k not in local:
            continue
        if joined != cur:
            raised[k] = joined
        merged[k] = joined

    summary: dict[str, Any] = {
        "peer_node_id": peer_node_id,
        "entity": entity,
        "merged_predicates": {k: v.value for k, v in merged.items()},
        "merge_op": "knowledge_join",
        "persisted": False,
    }
    if not persist:
        return summary

    # Pre-allocate the event ord so federation-emitted cells stamp it
    # before the event is appended (single-writer log).
    next_ord = event_log.height()

    # Emit an asserted Cell atom for every predicate this merge raised
    # (knowledge_join changed the value), so the snapshot's cells:[]
    # array carries witnesses for every fiber-state delta and the
    # fiber's cells_by_predicate map stays complete (the invariant
    # respond.py's preflight check enforces). Predicates whose value
    # was unchanged keep their existing witness id from the fiber.
    federation_cells: list[Cell] = []
    for p in sorted(raised):
        atom = Cell(
            s=entity,
            p=p,
            o=entity,  # unary predicate; specs/filesystem/cell-record.md §0
            v=merged[p],
            ord=next_ord,
            stratum="asserted",
            sender=peer_node_id,
        ).with_id()
        federation_cells.append(atom)
        if atom.id is not None:
            cells_by_predicate[p] = atom.id

    new_cell = FiberSnapshot(
        entity=entity,
        predicates=merged,
        payload={"sender": "federation", "peer_node_id": peer_node_id},
        metadata={"merge_op": "knowledge_join"},
        parents=[fiber["latest_cell_id"]] if fiber.get("latest_cell_id") else [],
        cells=federation_cells,
    ).with_id()
    body = new_cell.model_dump(mode="json")
    body.pop("id", None)
    body = {k: v for k, v in body.items() if v is not None}
    layout.put_record("cells", body)
    event = event_log.append(
        kind="federation_merge",
        body={
            "peer_node_id": peer_node_id,
            "entity": entity,
            "cell_id": new_cell.id,
            "merged_predicate_count": len(merged),
        },
        node_id=node_id,
    )
    if event["ord"] != next_ord:  # pragma: no cover — single-writer invariant
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"federation event ord {event['ord']} does not match pre-allocated ord {next_ord}",
        )

    fiber["latest_cell_id"] = new_cell.id
    fiber["predicates"] = {k: v.value for k, v in merged.items()}
    fiber["cells_by_predicate"] = cells_by_predicate
    history = fiber.get("history", [])
    history.append(
        {"event_id": event["id"], "event_ord": event["ord"], "cell_id": new_cell.id}
    )
    fiber["history"] = history
    layout.put_fiber(entity, fiber)

    summary.update({
        "persisted": True,
        "cell_id": new_cell.id,
        "event_id": event["id"],
        "event_ord": event["ord"],
    })
    return summary


def attach_federation(app: FastAPI, runtime) -> None:
    @app.get("/federation/peers")
    async def peers() -> list[dict[str, Any]]:
        # v0.1: no peers configured.
        return []

    @app.post("/federation/sync")
    async def sync_peer(req: SyncRequest) -> dict[str, Any]:
        ctx = runtime.boot_context
        if ctx is None:
            raise HTTPException(status_code=503, detail="runtime not initialized")
        try:
            return merge_peer_fiber(
                layout=ctx.layout,
                event_log=ctx.event_log,
                peer_node_id=req.peer_node_id,
                entity=req.entity,
                fiber_predicates=req.fiber_predicates,
                persist=req.persist,
                node_id=runtime.node_id,
            )
        except SubstrateError as e:
            status = 409 if e.code == PCC_MONOTONICITY_FAIL else 400
            raise HTTPException(status_code=status, detail=e.to_dict())
