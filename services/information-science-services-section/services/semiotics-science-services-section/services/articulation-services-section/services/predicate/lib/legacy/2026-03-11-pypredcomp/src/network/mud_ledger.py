"""MUD chat + ledger HTTP surfaces.

Pragmatic shim: posts and transactions are written as event-log entries
with kinds ``mud-post`` and ``ledger-txn``. Both surfaces require an
authenticated bearer token (any user); attribution is taken from the
token, never the request body.

Endpoints
---------
- ``POST /api/mud/post``     -> ``{text, room?}``
- ``GET  /api/mud/feed``     -> ``?after_ord=N&room=lobby&limit=200``
- ``GET  /api/mud/who``      -> recent authors in the last hour
- ``POST /api/ledger/txn``   -> ``{amount_cents, debit, credit, memo, occurred_at?}``
- ``GET  /api/ledger/txns``  -> ``?limit=500``
- ``GET  /api/ledger/balances`` -> account -> net cents
"""

from __future__ import annotations

import time
from typing import Any

from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import Response
from pydantic import BaseModel, Field

from process.user import authenticate
from substrate.canonicalization import canonical
from substrate.error_codes import PCM_AUTH_FAILED, SubstrateError
from substrate.runtime import Runtime, RuntimeState


CANONICAL_JSON = "application/json"
DEFAULT_ROOM = "lobby"


def _canonical_response(obj: Any, status_code: int = 200) -> Response:
    return Response(
        content=canonical(obj),
        media_type=CANONICAL_JSON,
        status_code=status_code,
        headers={"X-Substrate-Canonical": "1"},
    )


class MudPost(BaseModel):
    text: str = Field(min_length=1, max_length=4096)
    room: str = Field(default=DEFAULT_ROOM, min_length=1, max_length=64)


class LedgerTxn(BaseModel):
    amount_cents: int = Field(description="positive integer; signed by debit/credit")
    debit: str = Field(min_length=1, max_length=128, description="account debited")
    credit: str = Field(min_length=1, max_length=128, description="account credited")
    memo: str = Field(default="", max_length=512)
    occurred_at: str | None = Field(default=None, description="ISO-8601; defaults to now")


def attach_mud_ledger(app: FastAPI, runtime: Runtime) -> None:
    def _layout():
        ctx = runtime.boot_context
        if ctx is None:
            raise HTTPException(status_code=503, detail="runtime not initialized")
        return ctx.layout

    def _log():
        ctx = runtime.boot_context
        if ctx is None:
            raise HTTPException(status_code=503, detail="runtime not initialized")
        return ctx.event_log

    def _bearer(request: Request) -> str:
        auth = request.headers.get("authorization") or request.headers.get("Authorization")
        if not auth or not auth.lower().startswith("bearer "):
            raise HTTPException(
                status_code=401,
                detail={"code": PCM_AUTH_FAILED, "message": "missing bearer token"},
            )
        return auth[len("Bearer "):].strip()

    def _user(request: Request):
        try:
            return authenticate(_layout(), _bearer(request))
        except SubstrateError as e:
            raise HTTPException(status_code=401, detail=e.to_dict())

    def _ready_or_503() -> None:
        if runtime.state not in (RuntimeState.READY, RuntimeState.DEGRADED):
            raise HTTPException(status_code=503, detail={"code": "PCH_NOT_READY"})

    # ---- MUD ----------------------------------------------------------

    @app.post("/api/mud/post")
    async def mud_post(request: Request, req: MudPost) -> Response:
        _ready_or_503()
        user = _user(request)
        body = {
            "author": user.slug,
            "display_name": user.display_name,
            "room": req.room,
            "text": req.text,
        }
        event = _log().append(
            kind="mud-post",
            body=body,
            node_id=runtime.node_id,
            wall_clock_ns=time.time_ns(),
        )
        await runtime.publish_event({
            "kind": "mud-post",
            "event_id": event["id"],
            "event_ord": event["ord"],
            "room": req.room,
            "author": user.slug,
            "display_name": user.display_name,
            "text": req.text,
            "wall_clock_ns": event.get("wall_clock_ns"),
        })
        return _canonical_response({
            "ord": event["ord"],
            "id": event["id"],
            "author": user.slug,
            "room": req.room,
            "text": req.text,
            "wall_clock_ns": event.get("wall_clock_ns"),
        }, status_code=201)

    @app.get("/api/mud/feed")
    async def mud_feed(
        request: Request,
        after_ord: int = -1,
        room: str = DEFAULT_ROOM,
        limit: int = 200,
    ) -> Response:
        _user(request)
        limit = max(1, min(limit, 1000))
        posts: list[dict[str, Any]] = []
        for ev in _log().iter_events():
            if ev.get("kind") != "mud-post":
                continue
            if ev.get("ord", -1) <= after_ord:
                continue
            body = ev.get("body") or {}
            if room and body.get("room") != room:
                continue
            posts.append({
                "ord": ev.get("ord"),
                "id": ev.get("id"),
                "wall_clock_ns": ev.get("wall_clock_ns"),
                "author": body.get("author"),
                "display_name": body.get("display_name"),
                "room": body.get("room"),
                "text": body.get("text"),
            })
        if len(posts) > limit:
            posts = posts[-limit:]
        return _canonical_response({
            "room": room,
            "posts": posts,
            "head_ord": _log().height() - 1,
        })

    @app.get("/api/mud/who")
    async def mud_who(request: Request, window_seconds: int = 3600) -> Response:
        _user(request)
        cutoff_ns = time.time_ns() - max(0, window_seconds) * 1_000_000_000
        seen: dict[str, dict[str, Any]] = {}
        for ev in _log().iter_events():
            if ev.get("kind") != "mud-post":
                continue
            if (ev.get("wall_clock_ns") or 0) < cutoff_ns:
                continue
            body = ev.get("body") or {}
            slug = body.get("author")
            if not slug:
                continue
            seen[slug] = {
                "slug": slug,
                "display_name": body.get("display_name") or slug,
                "last_post_ord": ev.get("ord"),
                "last_post_ns": ev.get("wall_clock_ns"),
                "last_room": body.get("room"),
            }
        return _canonical_response({
            "window_seconds": window_seconds,
            "users": sorted(seen.values(), key=lambda u: u.get("last_post_ns") or 0, reverse=True),
        })

    # ---- Ledger -------------------------------------------------------

    @app.post("/api/ledger/txn")
    async def ledger_post(request: Request, req: LedgerTxn) -> Response:
        _ready_or_503()
        user = _user(request)
        if req.amount_cents == 0:
            raise HTTPException(status_code=400, detail={
                "code": "PCV_INVALID",
                "message": "amount_cents must be non-zero",
            })
        if req.debit == req.credit:
            raise HTTPException(status_code=400, detail={
                "code": "PCV_INVALID",
                "message": "debit and credit accounts must differ",
            })
        body = {
            "owner": user.slug,
            "amount_cents": req.amount_cents,
            "debit": req.debit,
            "credit": req.credit,
            "memo": req.memo,
            "occurred_at": req.occurred_at,
        }
        event = _log().append(
            kind="ledger-txn",
            body=body,
            node_id=runtime.node_id,
            wall_clock_ns=time.time_ns(),
        )
        await runtime.publish_event({
            "kind": "ledger-txn",
            "event_id": event["id"],
            "event_ord": event["ord"],
            "owner": user.slug,
            "amount_cents": req.amount_cents,
            "debit": req.debit,
            "credit": req.credit,
        })
        return _canonical_response({
            "ord": event["ord"],
            "id": event["id"],
            **body,
            "wall_clock_ns": event.get("wall_clock_ns"),
        }, status_code=201)

    @app.get("/api/ledger/txns")
    async def ledger_list(request: Request, limit: int = 500) -> Response:
        _user(request)
        limit = max(1, min(limit, 5000))
        rows: list[dict[str, Any]] = []
        for ev in _log().iter_events():
            if ev.get("kind") != "ledger-txn":
                continue
            body = ev.get("body") or {}
            rows.append({
                "ord": ev.get("ord"),
                "id": ev.get("id"),
                "wall_clock_ns": ev.get("wall_clock_ns"),
                **body,
            })
        if len(rows) > limit:
            rows = rows[-limit:]
        return _canonical_response({"txns": rows, "head_ord": _log().height() - 1})

    @app.get("/api/ledger/balances")
    async def ledger_balances(request: Request) -> Response:
        _user(request)
        bal: dict[str, int] = {}
        count = 0
        for ev in _log().iter_events():
            if ev.get("kind") != "ledger-txn":
                continue
            body = ev.get("body") or {}
            amt = int(body.get("amount_cents") or 0)
            debit = body.get("debit")
            credit = body.get("credit")
            if not debit or not credit or amt == 0:
                continue
            bal[debit] = bal.get(debit, 0) + amt
            bal[credit] = bal.get(credit, 0) - amt
            count += 1
        rows = sorted(
            ({"account": k, "balance_cents": v} for k, v in bal.items()),
            key=lambda r: r["account"],
        )
        return _canonical_response({"accounts": rows, "txn_count": count})
