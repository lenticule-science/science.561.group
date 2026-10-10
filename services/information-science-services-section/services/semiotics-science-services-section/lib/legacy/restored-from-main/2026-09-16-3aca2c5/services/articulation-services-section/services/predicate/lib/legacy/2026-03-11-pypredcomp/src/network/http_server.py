"""FastAPI HTTP server.

Per ``specs/network/http-addressing.md``:

- ``GET /`` — web GUI shell
- ``GET /cell/<id>`` / ``/rule/<id>`` / ``/event/<id>`` — content-addressed reads
- ``GET /fiber/<entity-slug>`` — fiber cache for an entity
- ``GET /alias/<name>`` — alias lookup
- ``POST /respond`` — submit a respond call
- ``POST /events`` — federation event ingest (single-node placeholder)
- ``GET /events`` — stream the event log
- ``GET /health/{live,ready}`` — Replit health probes
- ``GET /metrics`` — Prometheus text exposition (stub)
- ``WS /ws`` — fiber subscription
"""

from __future__ import annotations

import asyncio
import json
from typing import Any

from fastapi import FastAPI, HTTPException, Request, WebSocket, WebSocketDisconnect
from fastapi.responses import HTMLResponse, PlainTextResponse, Response
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel, Field

from init_boot.runlevels import Runlevel, read_runlevel, transition
from process.session import (
    close_session,
    fork_session,
    get_session,
    list_sessions,
    open_session,
    require_open,
)
from process.user import authenticate, list_users
from shell.repl import dispatch as shell_dispatch
from substrate.canonicalization import canonical
from substrate.error_codes import (
    PCM_AUTH_FAILED,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)
from substrate.respond import respond as do_respond
from substrate.runtime import Runtime, RuntimeState
from storage.aliases import AliasStore
from storage.event_log import EventLog


CANONICAL_JSON = "application/json"


def _canonical_response(obj: Any, status_code: int = 200) -> Response:
    return Response(
        content=canonical(obj),
        media_type=CANONICAL_JSON,
        status_code=status_code,
        headers={"X-Substrate-Canonical": "1"},
    )


class RespondRequest(BaseModel):
    target: str
    payload: dict[str, Any]
    fuel: int = Field(default=1024, ge=1, le=1_000_000)
    metadata: dict[str, Any] | None = None
    # Note: ``sender`` is intentionally NOT in the request body — the
    # server derives it from the authenticated bearer token so that
    # attribution cannot be spoofed by the client.


class ShellRequest(BaseModel):
    command: str = Field(min_length=1)
    session: str | None = Field(default=None, description="session:<slug>; created if omitted")


class SessionRequest(BaseModel):
    parent: str | None = None


class RunlevelRequest(BaseModel):
    target: int | str


class ShellRequest(BaseModel):
    command: str = Field(min_length=1)
    session: str | None = Field(default=None, description="session:<slug>; created if omitted")


class SessionRequest(BaseModel):
    parent: str | None = None


class RunlevelRequest(BaseModel):
    target: int | str


def build_app(runtime: Runtime) -> FastAPI:
    app = FastAPI(
        title="pypredcomp v0.2",
        description="561 Group predicated-computing OS kernel",
        version="0.2.0",
        default_response_class=Response,
    )

    # Mount static files for the web GUI
    from pathlib import Path
    static_dir = Path(__file__).parent.parent / "shell" / "static"
    if static_dir.exists():
        app.mount("/static", StaticFiles(directory=str(static_dir)), name="static")

    # ---- helpers --------------------------------------------------------
    def _layout():
        ctx = runtime.boot_context
        if ctx is None:
            raise HTTPException(status_code=503, detail="runtime not initialized")
        return ctx.layout

    def _log() -> EventLog:
        ctx = runtime.boot_context
        if ctx is None:
            raise HTTPException(status_code=503, detail="runtime not initialized")
        return ctx.event_log

    def _aliases() -> AliasStore:
        return AliasStore(runtime.root)

    # ---- web GUI shell --------------------------------------------------
    from shell.web_gui import render_index

    @app.get("/", response_class=HTMLResponse)
    async def index() -> HTMLResponse:
        return HTMLResponse(render_index(runtime))

    # ---- content-addressed reads ---------------------------------------

    @app.get("/cell/{cell_id}")
    async def get_cell(cell_id: str) -> Response:
        layout = _layout()
        try:
            data = layout.get_record_bytes("cells", cell_id)
            return Response(
                content=data,
                media_type=CANONICAL_JSON,
                headers={"Cache-Control": "public, max-age=31536000, immutable"},
            )
        except SubstrateError as e:
            raise HTTPException(status_code=404, detail=e.to_dict())

    @app.get("/rule/{rule_id}")
    async def get_rule(rule_id: str) -> Response:
        layout = _layout()
        try:
            data = layout.get_record_bytes("rules", rule_id)
            return Response(
                content=data,
                media_type=CANONICAL_JSON,
                headers={"Cache-Control": "public, max-age=31536000, immutable"},
            )
        except SubstrateError as e:
            raise HTTPException(status_code=404, detail=e.to_dict())

    @app.get("/event/{event_id}")
    async def get_event(event_id: str) -> Response:
        ev = _log().get_event(event_id)
        if ev is None:
            raise HTTPException(status_code=404, detail={"code": PCS_RECORD_NOT_FOUND})
        return _canonical_response(ev)

    @app.get("/fiber/{entity_slug:path}")
    async def get_fiber(entity_slug: str) -> Response:
        fiber = _layout().get_fiber(entity_slug)
        if fiber is None:
            raise HTTPException(status_code=404, detail={"code": PCS_RECORD_NOT_FOUND})
        return _canonical_response(fiber)

    @app.get("/alias/{name}")
    async def get_alias(name: str) -> Response:
        try:
            target = _aliases().get(name)
            return _canonical_response({"name": name, "target": target})
        except SubstrateError as e:
            raise HTTPException(status_code=404, detail=e.to_dict())

    # ---- respond --------------------------------------------------------

    @app.post("/respond")
    async def respond_endpoint(request: Request, req: RespondRequest) -> Response:
        if runtime.state not in (RuntimeState.READY, RuntimeState.DEGRADED):
            raise HTTPException(status_code=503, detail={"code": "PCH_NOT_READY"})
        # Authenticate FIRST: sender is derived from the bearer token,
        # never trusted from the client. This closes the spoofing path
        # where any caller could write events as an arbitrary principal.
        user = _authn(request)
        try:
            result = do_respond(
                target=req.target,
                payload=req.payload,
                sender=user.slug,
                layout=_layout(),
                event_log=_log(),
                node_id=runtime.node_id,
                active_rule_ids=runtime.active_rule_ids,
                fuel=req.fuel,
                metadata=req.metadata,
            )
            if result.authz_decision is not None and result.authz_decision.get("allowed") is False:
                raise HTTPException(
                    status_code=403,
                    detail={
                        "code": "PCC_AUTHZ_DENIED",
                        "message": "sender's authz restricts this respond to bottom",
                        "details": {
                            "target": req.target,
                            "sender": user.slug,
                            "authz_decision": result.authz_decision,
                            "fiber": result.fiber,
                        },
                    },
                )
            response_obj = {
                "cell_id": result.cell_id,
                "event_id": result.event_id,
                "event_ord": result.event_ord,
                "fiber": result.fiber,
                "repair_log": [r.model_dump() for r in result.repair_log],
                "closure_cycles": result.closure_cycles,
            }
            await runtime.publish_event({
                "kind": "respond",
                "event_id": result.event_id,
                "event_ord": result.event_ord,
                "cell_id": result.cell_id,
                "target": req.target,
            })
            return _canonical_response(response_obj)
        except SubstrateError as e:
            raise HTTPException(status_code=400, detail=e.to_dict())

    # ---- event log streaming -------------------------------------------

    @app.get("/events")
    async def stream_events(after_ord: int = -1, limit: int = 1000) -> Response:
        events = []
        for ev in _log().iter_events():
            if ev.get("ord", -1) > after_ord:
                events.append(ev)
                if len(events) >= limit:
                    break
        return _canonical_response({"events": events, "head_ord": _log().height() - 1})

    @app.post("/events")
    async def ingest_event(event: dict[str, Any]) -> Response:
        """Ingest a fully-formed external event (federation entrypoint).

        The event body must already include ``id``, ``ord``, ``prev``,
        ``kind``, ``node``, and ``body``. The receiver verifies the hash
        chain (``prev == tail_id``, ``ord == height``, recomputed
        ``id`` matches), appends the event, and returns the canonical
        echo. Used by the federation peer protocol; at v0.1 we accept
        these only single-node (no peer auth, since the spec defers the
        peer-protocol to v0.2).
        """
        if runtime.state not in (RuntimeState.READY, RuntimeState.DEGRADED):
            raise HTTPException(status_code=503, detail={"code": "PCH_NOT_READY"})
        try:
            persisted = _log().append_signed(event)
            return _canonical_response(persisted, status_code=201)
        except SubstrateError as e:
            raise HTTPException(status_code=409, detail=e.to_dict())

    # ---- MCP HTTP transport --------------------------------------------

    @app.post("/mcp")
    async def mcp_endpoint(request: Request) -> Response:
        """MCP server over HTTP (JSON-RPC 2.0 envelope).

        Supports ``initialize``, ``tools/list``, and ``tools/call`` per the
        MCP spec — the same dispatcher used by the stdio transport.
        """
        from drivers.mcp_driver import dispatch_jsonrpc
        try:
            body = await request.json()
        except json.JSONDecodeError as e:
            return _canonical_response(
                {"jsonrpc": "2.0", "id": None, "error": {"code": -32700, "message": str(e)}},
                status_code=400,
            )
        if isinstance(body, list):
            results = [dispatch_jsonrpc(runtime, req) for req in body]
            return _canonical_response(results)
        return _canonical_response(dispatch_jsonrpc(runtime, body))

    # ---- federation skeleton -------------------------------------------

    from network.federation import attach_federation
    attach_federation(app, runtime)

    # ---- health / metrics ----------------------------------------------

    @app.get("/health/live")
    async def health_live() -> Response:
        return _canonical_response({"alive": True, "state": runtime.state.value})

    @app.get("/health/ready")
    async def health_ready() -> Response:
        ctx = runtime.boot_context
        st = runtime.state.value
        ok = runtime.state == RuntimeState.READY
        body = {
            "ready": ok,
            "state": st,
            "node_id": runtime.node_id,
            "log_height": ctx.event_log.height() if ctx else 0,
            "self_test": ctx.self_test.to_dict() if ctx and ctx.self_test else None,
            "boot_failed_phase": ctx.failed_phase if ctx else None,
        }
        return Response(
            content=canonical(body),
            media_type=CANONICAL_JSON,
            status_code=200 if ok else 503,
        )

    @app.get("/metrics", response_class=PlainTextResponse)
    async def metrics() -> str:
        ctx = runtime.boot_context
        height = ctx.event_log.height() if ctx else 0
        return (
            "# HELP substrate_event_log_height Number of events in the log\n"
            "# TYPE substrate_event_log_height gauge\n"
            f"substrate_event_log_height {height}\n"
            "# HELP substrate_heartbeat_count Heartbeats since boot\n"
            "# TYPE substrate_heartbeat_count counter\n"
            f"substrate_heartbeat_count {runtime.heartbeat_count}\n"
            "# HELP substrate_runtime_state_ready 1 when runtime is ready\n"
            "# TYPE substrate_runtime_state_ready gauge\n"
            f"substrate_runtime_state_ready {1 if runtime.state == RuntimeState.READY else 0}\n"
            "# HELP substrate_active_rules Active closure rules\n"
            "# TYPE substrate_active_rules gauge\n"
            f"substrate_active_rules {len(runtime.active_rule_ids)}\n"
        )

    @app.get("/node/state")
    async def node_state() -> Response:
        return _canonical_response(runtime.state_summary())

    # ---- shell / sessions / runlevels (v0.2 OS surface) ----------------

    def _bearer_token(request: Request) -> str:
        """Extract the bearer token from the Authorization header."""
        auth = request.headers.get("authorization") or request.headers.get("Authorization")
        if not auth or not auth.lower().startswith("bearer "):
            raise HTTPException(
                status_code=401,
                detail={"code": PCM_AUTH_FAILED, "message": "missing bearer token"},
            )
        return auth[len("Bearer "):].strip()

    def _authn(request: Request):
        token = _bearer_token(request)
        try:
            return authenticate(_layout(), token)
        except SubstrateError as e:
            raise HTTPException(status_code=401, detail=e.to_dict())

    @app.post("/session")
    async def session_open(request: Request, req: SessionRequest | None = None) -> Response:
        if runtime.state not in (RuntimeState.READY, RuntimeState.DEGRADED):
            raise HTTPException(status_code=503, detail={"code": "PCH_NOT_READY"})
        user = _authn(request)
        body = req or SessionRequest()
        try:
            if body.parent:
                # Enforce ownership: only the parent's owner may fork it.
                # Otherwise an authenticated user could fork another user's
                # session and inherit their attribution chain.
                parent = get_session(_layout(), body.parent)
                if parent.owner != user.slug:
                    raise HTTPException(
                        status_code=403,
                        detail={"code": PCM_AUTH_FAILED,
                                "message": "cannot fork a session you do not own"},
                    )
                sess = fork_session(
                    layout=_layout(), event_log=_log(), node_id=runtime.node_id,
                    parent_slug=body.parent,
                )
            else:
                sess = open_session(
                    layout=_layout(), event_log=_log(), node_id=runtime.node_id,
                    owner=user.slug, capabilities=list(user.capabilities),
                )
            return _canonical_response(sess.model_dump(), status_code=201)
        except SubstrateError as e:
            raise HTTPException(status_code=400, detail=e.to_dict())

    @app.delete("/session/{slug}")
    async def session_close(slug: str, request: Request) -> Response:
        user = _authn(request)
        try:
            sess = get_session(_layout(), slug)
        except SubstrateError as e:
            raise HTTPException(status_code=404, detail=e.to_dict())
        if sess.owner != user.slug:
            raise HTTPException(
                status_code=403,
                detail={"code": PCM_AUTH_FAILED, "message": "not session owner"},
            )
        try:
            closed = close_session(
                layout=_layout(), event_log=_log(), node_id=runtime.node_id,
                slug=slug,
            )
            return _canonical_response(closed.model_dump())
        except SubstrateError as e:
            raise HTTPException(status_code=400, detail=e.to_dict())

    @app.get("/sessions")
    async def sessions_list(request: Request, owner: str | None = None) -> Response:
        user = _authn(request)
        # Restrict default scope to caller's own sessions; explicit owner=
        # query is allowed for any user the caller can name.
        target_owner = owner or user.slug
        rows = list_sessions(_layout(), owner=target_owner)
        return _canonical_response({
            "owner": target_owner,
            "sessions": [s.model_dump() for s in rows],
        })

    @app.post("/shell")
    async def shell_exec(request: Request, req: ShellRequest) -> Response:
        if runtime.state not in (RuntimeState.READY, RuntimeState.DEGRADED):
            raise HTTPException(status_code=503, detail={"code": "PCH_NOT_READY"})
        user = _authn(request)
        # Open a fresh session if none provided; reuse if the caller passes one.
        if req.session:
            try:
                sess = require_open(get_session(_layout(), req.session))
            except SubstrateError as e:
                raise HTTPException(status_code=404, detail=e.to_dict())
            if sess.owner != user.slug:
                raise HTTPException(
                    status_code=403,
                    detail={"code": PCM_AUTH_FAILED, "message": "not session owner"},
                )
        else:
            sess = open_session(
                layout=_layout(), event_log=_log(), node_id=runtime.node_id,
                owner=user.slug, capabilities=list(user.capabilities),
            )
        results = shell_dispatch(
            req.command,
            layout=_layout(), event_log=_log(), node_id=runtime.node_id,
            sender=sess.owner,  # attribution: events stamped with the user
            session_slug=sess.slug,  # required by inter-session-messaging verbs
            active_rule_ids=runtime.active_rule_ids,
        )
        await runtime.publish_event({
            "kind": "shell-command",
            "session": sess.slug,
            "owner": sess.owner,
            "command": req.command,
            "ok": all(r.ok for r in results),
        })
        return _canonical_response({
            "session": sess.slug,
            "owner": sess.owner,
            "results": [r.model_dump() for r in results],
        })

    @app.get("/runlevel")
    async def runlevel_get() -> Response:
        rl = read_runlevel(_layout())
        return _canonical_response({
            "level": int(rl),
            "name": rl.name.lower().replace("_", "-"),
        })

    @app.post("/runlevel")
    async def runlevel_set(request: Request, req: RunlevelRequest) -> Response:
        user = _authn(request)
        if "runlevel:*" not in user.capabilities:
            raise HTTPException(
                status_code=403,
                detail={"code": PCM_AUTH_FAILED,
                        "message": f"user {user.slug!r} lacks 'runlevel:*'"},
            )
        try:
            prev, new = transition(
                layout=_layout(), event_log=_log(), node_id=runtime.node_id,
                target=req.target, actor=user.slug,
            )
            return _canonical_response({
                "previous": int(prev),
                "level": int(new),
                "name": new.name.lower().replace("_", "-"),
            })
        except SubstrateError as e:
            raise HTTPException(status_code=400, detail=e.to_dict())

    @app.get("/users")
    async def users_list(request: Request) -> Response:
        _authn(request)
        rows = list_users(_layout())
        return _canonical_response({
            "users": [
                {"slug": u.slug, "display_name": u.display_name,
                 "capabilities": u.capabilities}
                for u in rows
            ],
        })

    # ---- MUD chat + ledger ---------------------------------------------

    from network.mud_ledger import attach_mud_ledger
    attach_mud_ledger(app, runtime)

    # ---- WebSocket ------------------------------------------------------

    from network.websocket import attach_websocket
    attach_websocket(app, runtime)

    return app
