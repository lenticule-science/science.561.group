"""MCP driver — exposes the v0.1 tool catalog using the official `mcp` SDK.

The 15-tool catalog per ``specs/drivers/mcp-driver.md``::

    respond, query, get_cell, get_rule, get_fiber, entity_history,
    add_rule, retire_rule, set_alias, remove_alias, witness, evidence,
    node_state, peers, sync_peer

Two transports are supported:

* **stdio** (default, for editor integrations): ``substrate-mcp`` boots
  the runtime and serves the MCP server on stdin/stdout.
* **HTTP** (for browser / curl / federated callers): the FastAPI app
  exposes ``POST /mcp`` with a JSON-RPC 2.0 envelope (per
  ``specs/drivers/mcp-driver.md``). It accepts ``initialize``,
  ``tools/list``, and ``tools/call`` methods and maps tool exceptions
  to JSON-RPC error objects.

Tool implementations live in :func:`build_tool_handlers` and are
deliberately reusable from a test harness without any MCP framing.
"""

from __future__ import annotations

import asyncio
import json
import logging
import os
import sys
import traceback
from typing import Any, Awaitable, Callable

log = logging.getLogger("substrate.mcp")

# JSON-RPC 2.0 error codes (per spec).
JSONRPC_PARSE_ERROR = -32700
JSONRPC_INVALID_REQUEST = -32600
JSONRPC_METHOD_NOT_FOUND = -32601
JSONRPC_INVALID_PARAMS = -32602
JSONRPC_INTERNAL_ERROR = -32603
# Substrate-specific (from PCC/PCM/PCS namespaces, mapped into the
# JSON-RPC server-defined range -32099..-32000).
SUBSTRATE_TOOL_ERROR = -32001
SUBSTRATE_VALIDATION_ERROR = -32002
SUBSTRATE_NOT_READY = -32003


# Tools that may emit multiple content chunks per MCP call. The dispatcher
# wraps each chunk as its own MCP TextContent so callers can stream them.
STREAMING_TOOLS: set[str] = {"query", "entity_history"}


def build_tool_handlers(runtime) -> dict[str, Callable[[dict[str, Any]], Any]]:
    """Pure dictionary mapping tool-name → callable. Reusable for testing.

    Handlers may return either a single dict (one chunk) or a list of
    dicts (multi-chunk streaming response). The MCP dispatcher and the
    in-process test harness both honor that convention.
    """
    from substrate.respond import (
        respond as do_respond,
        SYSTEM_ALIASES_TARGET,
        SYSTEM_EVIDENCE_TARGET,
        SYSTEM_RULES_TARGET,
    )
    from storage.event_log import EventLog
    from storage.storage_layout import StorageLayout
    from substrate.canonicalization import canonical, parse_canonical
    from network.federation import merge_peer_fiber

    def _layout() -> StorageLayout:
        return runtime.boot_context.layout

    def _log() -> EventLog:
        return runtime.boot_context.event_log

    def _respond(*, target: str, payload: dict[str, Any], sender: str,
                 directive: dict[str, Any] | None = None,
                 metadata: dict[str, Any] | None = None,
                 fuel: int = 1024):
        """Single funnel: every state-changing tool reduces to respond."""
        return do_respond(
            target=target,
            payload=payload,
            sender=sender,
            layout=_layout(),
            event_log=_log(),
            node_id=runtime.node_id,
            active_rule_ids=runtime.active_rule_ids,
            fuel=fuel,
            metadata=metadata,
            directive=directive,
        )

    def _raise_if_denied(result, *, target: str, sender: str) -> None:
        from substrate.error_codes import PCC_AUTHZ_DENIED, SubstrateError
        if result.authz_decision is not None and result.authz_decision.get("allowed") is False:
            raise SubstrateError(
                PCC_AUTHZ_DENIED,
                "sender's authz restricts this respond to bottom",
                target=target,
                sender=sender,
                authz_decision=result.authz_decision,
                fiber=result.fiber,
            )

    def respond_tool(args: dict[str, Any]) -> dict[str, Any]:
        sender = args.get("sender", "system")
        result = _respond(
            target=args["target"],
            payload=args["payload"],
            sender=sender,
            metadata=args.get("metadata"),
            fuel=int(args.get("fuel", 1024)),
        )
        _raise_if_denied(result, target=args["target"], sender=sender)
        return {
            "cell_id": result.cell_id,
            "event_id": result.event_id,
            "event_ord": result.event_ord,
            "fiber": result.fiber,
            "repair_log": [r.model_dump() for r in result.repair_log],
            "closure_cycles": result.closure_cycles,
        }

    def query_tool(args: dict[str, Any]) -> list[dict[str, Any]]:
        """Stream the fiber as multiple chunks: meta, predicates, history.

        Each chunk is a self-contained JSON object so a streaming caller
        can render incrementally without buffering the whole fiber.
        """
        slug = args["entity"]
        fiber = _layout().get_fiber(slug)
        if fiber is None:
            return [{"chunk": "meta", "entity": slug, "exists": False}]
        history = fiber.get("history") or []
        return [
            {
                "chunk": "meta",
                "entity": slug,
                "exists": True,
                "latest_cell_id": fiber.get("latest_cell_id"),
                "history_height": len(history),
            },
            {
                "chunk": "predicates",
                "entity": slug,
                "predicates": fiber.get("predicates") or {},
            },
            {
                "chunk": "history",
                "entity": slug,
                "history": history,
            },
        ]

    def get_cell_tool(args: dict[str, Any]) -> dict[str, Any]:
        return _layout().get_record("cells", args["cell_id"])

    def get_rule_tool(args: dict[str, Any]) -> dict[str, Any]:
        return _layout().get_record("rules", args["rule_id"])

    def get_fiber_tool(args: dict[str, Any]) -> dict[str, Any]:
        return _layout().get_fiber(args["entity"]) or {"entity": args["entity"], "predicates": {}}

    def entity_history_tool(args: dict[str, Any]) -> list[dict[str, Any]]:
        """Stream entity history one entry per chunk (newest last)."""
        slug = args["entity"]
        fiber = _layout().get_fiber(slug) or {}
        history = fiber.get("history", [])
        if not history:
            return [{"chunk": "empty", "entity": slug, "count": 0}]
        chunks: list[dict[str, Any]] = [
            {"chunk": "header", "entity": slug, "count": len(history)}
        ]
        for i, entry in enumerate(history):
            chunks.append({"chunk": "entry", "index": i, "entity": slug, **entry})
        return chunks

    def add_rule_tool(args: dict[str, Any]) -> dict[str, Any]:
        # Routes through respond → directive: storage + active-id mutation
        # happen inside respond's Phase 5, after the audit event is on disk.
        result = _respond(
            target=SYSTEM_RULES_TARGET,
            payload={"rules/added": "True"},
            sender="mcp-driver",
            directive={"kind": "add_rule", "rule": args["rule"]},
        )
        _raise_if_denied(result, target=SYSTEM_RULES_TARGET, sender="mcp-driver")
        dr = result.directive_result or {}
        return {
            "rule_id": dr.get("rule_id"),
            "name": dr.get("name"),
            "cell_id": result.cell_id,
            "event_id": result.event_id,
        }

    def retire_rule_tool(args: dict[str, Any]) -> dict[str, Any]:
        result = _respond(
            target=SYSTEM_RULES_TARGET,
            payload={"rules/retired": "True"},
            sender="mcp-driver",
            directive={"kind": "retire_rule", "rule_id": args["rule_id"]},
        )
        _raise_if_denied(result, target=SYSTEM_RULES_TARGET, sender="mcp-driver")
        dr = result.directive_result or {}
        return {
            "rule_id": dr.get("rule_id"),
            "retired": dr.get("retired", True),
            "cell_id": result.cell_id,
            "event_id": result.event_id,
        }

    def set_alias_tool(args: dict[str, Any]) -> dict[str, Any]:
        result = _respond(
            target=SYSTEM_ALIASES_TARGET,
            payload={"aliases/set": "True"},
            sender="mcp-driver",
            directive={"kind": "set_alias", "name": args["name"], "target": args["target"]},
        )
        _raise_if_denied(result, target=SYSTEM_ALIASES_TARGET, sender="mcp-driver")
        dr = result.directive_result or {}
        return {
            "name": dr.get("name"),
            "target": dr.get("target"),
            "cell_id": result.cell_id,
            "event_id": result.event_id,
        }

    def remove_alias_tool(args: dict[str, Any]) -> dict[str, Any]:
        result = _respond(
            target=SYSTEM_ALIASES_TARGET,
            payload={"aliases/removed": "True"},
            sender="mcp-driver",
            directive={"kind": "remove_alias", "name": args["name"]},
        )
        _raise_if_denied(result, target=SYSTEM_ALIASES_TARGET, sender="mcp-driver")
        dr = result.directive_result or {}
        return {
            "name": dr.get("name"),
            "removed": dr.get("removed", True),
            "cell_id": result.cell_id,
            "event_id": result.event_id,
        }

    def witness_tool(args: dict[str, Any]) -> dict[str, Any]:
        return respond_tool({**args, "sender": args.get("witness", "witness-driver")})

    def evidence_tool(args: dict[str, Any]) -> dict[str, Any]:
        body = args.get("evidence", args)
        result = _respond(
            target=SYSTEM_EVIDENCE_TARGET,
            payload={"evidence/recorded": "True"},
            sender="mcp-driver",
            directive={"kind": "evidence", "body": body},
        )
        _raise_if_denied(result, target=SYSTEM_EVIDENCE_TARGET, sender="mcp-driver")
        dr = result.directive_result or {}
        return {
            "exec_id": dr.get("exec_id"),
            "path": dr.get("path"),
            "cell_id": result.cell_id,
            "event_id": result.event_id,
        }

    def node_state_tool(_args: dict[str, Any]) -> dict[str, Any]:
        return runtime.state_summary()

    def peers_tool(_args: dict[str, Any]) -> dict[str, Any]:
        return {"peers": []}

    def sync_peer_tool(args: dict[str, Any]) -> dict[str, Any]:
        """Real federation merge: ⊙-join peer fiber with local, optional persist."""
        return merge_peer_fiber(
            layout=_layout(),
            event_log=_log(),
            peer_node_id=args.get("peer_node_id", "unknown"),
            entity=args["entity"],
            fiber_predicates=args.get("fiber_predicates", {}),
            persist=bool(args.get("persist", False)),
            node_id=runtime.node_id,
        )

    return {
        "respond": respond_tool,
        "query": query_tool,
        "get_cell": get_cell_tool,
        "get_rule": get_rule_tool,
        "get_fiber": get_fiber_tool,
        "entity_history": entity_history_tool,
        "add_rule": add_rule_tool,
        "retire_rule": retire_rule_tool,
        "set_alias": set_alias_tool,
        "remove_alias": remove_alias_tool,
        "witness": witness_tool,
        "evidence": evidence_tool,
        "node_state": node_state_tool,
        "peers": peers_tool,
        "sync_peer": sync_peer_tool,
    }


# ---------------------------------------------------------------------------
# Tool catalog — JSON Schema input definitions
# ---------------------------------------------------------------------------


TOOL_SCHEMAS: dict[str, dict[str, Any]] = {
    "respond": {
        "description": "Submit a respond call (the substrate's only write primitive).",
        "input_schema": {
            "type": "object",
            "required": ["target", "payload"],
            "properties": {
                "target": {"type": "string"},
                "payload": {"type": "object"},
                "sender": {"type": "string", "default": "system"},
                "fuel": {"type": "integer", "default": 1024, "minimum": 1},
                "metadata": {"type": "object"},
            },
        },
    },
    "query": {
        "description": "Query the fiber (current witness map) for an entity.",
        "input_schema": {"type": "object", "required": ["entity"], "properties": {"entity": {"type": "string"}}},
    },
    "get_cell": {
        "description": "Fetch a cell record by content-id.",
        "input_schema": {"type": "object", "required": ["cell_id"], "properties": {"cell_id": {"type": "string"}}},
    },
    "get_rule": {
        "description": "Fetch a closure-rule record by content-id.",
        "input_schema": {"type": "object", "required": ["rule_id"], "properties": {"rule_id": {"type": "string"}}},
    },
    "get_fiber": {
        "description": "Fetch the fiber cache for an entity.",
        "input_schema": {"type": "object", "required": ["entity"], "properties": {"entity": {"type": "string"}}},
    },
    "entity_history": {
        "description": "Return the (event_id, cell_id) trail for an entity.",
        "input_schema": {"type": "object", "required": ["entity"], "properties": {"entity": {"type": "string"}}},
    },
    "add_rule": {
        "description": "Register a new closure rule.",
        "input_schema": {"type": "object", "required": ["rule"], "properties": {"rule": {"type": "object"}}},
    },
    "retire_rule": {
        "description": "Retire a closure rule by id.",
        "input_schema": {"type": "object", "required": ["rule_id"], "properties": {"rule_id": {"type": "string"}}},
    },
    "set_alias": {
        "description": "Set a human-readable alias to a cell or entity.",
        "input_schema": {
            "type": "object",
            "required": ["name", "target"],
            "properties": {"name": {"type": "string"}, "target": {"type": "string"}},
        },
    },
    "remove_alias": {
        "description": "Remove an alias.",
        "input_schema": {"type": "object", "required": ["name"], "properties": {"name": {"type": "string"}}},
    },
    "witness": {
        "description": "Driver-attested respond. Same shape as respond + a witness id.",
        "input_schema": {
            "type": "object",
            "required": ["target", "payload"],
            "properties": {
                "target": {"type": "string"},
                "payload": {"type": "object"},
                "witness": {"type": "string"},
            },
        },
    },
    "evidence": {
        "description": "Persist an evidence document; returns its content-id.",
        "input_schema": {"type": "object", "required": ["evidence"], "properties": {"evidence": {"type": "object"}}},
    },
    "node_state": {"description": "Return the runtime state summary.", "input_schema": {"type": "object"}},
    "peers": {"description": "List federation peers (empty at v0.1).", "input_schema": {"type": "object"}},
    "sync_peer": {
        "description": "⊙-merge a peer's fiber predicates with the local fiber for an entity.",
        "input_schema": {
            "type": "object",
            "required": ["peer_node_id", "entity", "fiber_predicates"],
            "properties": {
                "peer_node_id": {"type": "string"},
                "entity": {"type": "string"},
                "fiber_predicates": {"type": "object"},
                "persist": {"type": "boolean", "default": False},
            },
        },
    },
}


# ---------------------------------------------------------------------------
# JSON-RPC 2.0 dispatcher (shared between stdio + HTTP transports)
# ---------------------------------------------------------------------------


def _format_error(code: int, message: str, data: Any = None) -> dict[str, Any]:
    err: dict[str, Any] = {"code": code, "message": message}
    if data is not None:
        err["data"] = data
    return err


def _result_envelope(rid: Any, result: Any) -> dict[str, Any]:
    return {"jsonrpc": "2.0", "id": rid, "result": result}


def _error_envelope(rid: Any, code: int, message: str, data: Any = None) -> dict[str, Any]:
    return {"jsonrpc": "2.0", "id": rid, "error": _format_error(code, message, data)}


def dispatch_jsonrpc(runtime, request: dict[str, Any]) -> dict[str, Any]:
    """Handle one JSON-RPC 2.0 request; return the response envelope.

    Supported methods:

    * ``initialize`` → server info + capabilities
    * ``tools/list`` → tool catalog with input schemas
    * ``tools/call`` → ``{"name": <tool>, "arguments": {...}}``
    """
    from substrate.error_codes import SubstrateError

    rid = request.get("id")
    if request.get("jsonrpc") != "2.0":
        return _error_envelope(rid, JSONRPC_INVALID_REQUEST, "jsonrpc must be '2.0'")
    method = request.get("method")
    params = request.get("params") or {}

    if method == "initialize":
        return _result_envelope(rid, {
            "protocolVersion": "2024-11-05",
            "serverInfo": {"name": "substrate-mcp", "version": "0.1.0"},
            "capabilities": {"tools": {"listChanged": False}},
        })

    if method == "tools/list":
        tools = []
        for name, spec in TOOL_SCHEMAS.items():
            tools.append({
                "name": name,
                "description": spec["description"],
                "inputSchema": spec["input_schema"],
            })
        return _result_envelope(rid, {"tools": tools})

    if method == "tools/call":
        handlers = build_tool_handlers(runtime)
        tool_name = params.get("name")
        args = params.get("arguments") or {}
        if tool_name not in handlers:
            return _error_envelope(
                rid, JSONRPC_METHOD_NOT_FOUND, f"unknown tool {tool_name!r}"
            )
        try:
            result = handlers[tool_name](args)
        except SubstrateError as e:
            return _error_envelope(
                rid,
                SUBSTRATE_VALIDATION_ERROR,
                e.message or e.code,
                {"substrate_code": e.code, "details": e.details},
            )
        except (KeyError, TypeError, ValueError) as e:
            return _error_envelope(
                rid, JSONRPC_INVALID_PARAMS, f"{type(e).__name__}: {e}"
            )
        except Exception as e:
            log.exception("tool %s raised", tool_name)
            return _error_envelope(
                rid, SUBSTRATE_TOOL_ERROR, f"{type(e).__name__}: {e}",
                {"trace": traceback.format_exc().splitlines()[-3:]},
            )
        # MCP wraps tool results as content arrays. Streaming tools emit
        # one TextContent item per chunk (multi-element list); single-shot
        # tools emit exactly one item. Either way the canonical JSON text
        # is byte-identical to the structured value.
        from substrate.canonicalization import canonical_str
        if isinstance(result, list) and tool_name in STREAMING_TOOLS:
            content = [
                {"type": "text", "text": canonical_str(chunk)} for chunk in result
            ]
            structured: Any = {"chunks": result}
        else:
            content = [{"type": "text", "text": canonical_str(result)}]
            structured = result
        return _result_envelope(rid, {
            "content": content,
            "structuredContent": structured,
            "isError": False,
        })

    return _error_envelope(rid, JSONRPC_METHOD_NOT_FOUND, f"unknown method {method!r}")


# ---------------------------------------------------------------------------
# stdio transport — uses the official `mcp` SDK Server when available
# ---------------------------------------------------------------------------


async def _serve_stdio_via_mcp_sdk(runtime) -> None:
    """Real MCP stdio server using the `mcp` Python SDK."""
    from mcp.server import Server, NotificationOptions
    from mcp.server.models import InitializationOptions
    from mcp.server.stdio import stdio_server
    import mcp.types as types

    handlers = build_tool_handlers(runtime)
    server: Server = Server("substrate-mcp")

    @server.list_tools()
    async def _list_tools() -> list[types.Tool]:
        out: list[types.Tool] = []
        for name, spec in TOOL_SCHEMAS.items():
            out.append(types.Tool(
                name=name,
                description=spec["description"],
                inputSchema=spec["input_schema"],
            ))
        return out

    @server.call_tool()
    async def _call_tool(name: str, arguments: dict[str, Any]) -> list[types.TextContent]:
        from substrate.canonicalization import canonical_str
        from substrate.error_codes import SubstrateError
        try:
            result = handlers[name](arguments)
        except SubstrateError as e:
            payload = {"error": {"code": e.code, "message": e.message, "details": e.details}}
            return [types.TextContent(type="text", text=canonical_str(payload))]
        # Streaming tools may return a list — one TextContent per chunk.
        if isinstance(result, list) and name in STREAMING_TOOLS:
            return [
                types.TextContent(type="text", text=canonical_str(chunk))
                for chunk in result
            ]
        return [types.TextContent(type="text", text=canonical_str(result))]

    async with stdio_server() as (read_stream, write_stream):
        await server.run(
            read_stream,
            write_stream,
            InitializationOptions(
                server_name="substrate-mcp",
                server_version="0.1.0",
                capabilities=server.get_capabilities(
                    notification_options=NotificationOptions(),
                    experimental_capabilities={},
                ),
            ),
        )


def main() -> int:
    """Boot the runtime and serve MCP over stdio (using the real SDK)."""
    from substrate.runtime import _build_runtime_from_env

    logging.basicConfig(
        level=os.environ.get("SUBSTRATE_LOG_LEVEL", "INFO"),
        format="%(asctime)s %(name)s [%(levelname)s] %(message)s",
        stream=sys.stderr,
    )
    runtime = _build_runtime_from_env()
    runtime.boot()
    try:
        asyncio.run(_serve_stdio_via_mcp_sdk(runtime))
    except KeyboardInterrupt:
        return 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
