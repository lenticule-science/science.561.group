"""MCP driver — JSON-RPC 2.0 envelope conformance + HTTP transport."""

from __future__ import annotations

import json
from pathlib import Path

import pytest
from fastapi.testclient import TestClient

from drivers.mcp_driver import (
    JSONRPC_INVALID_REQUEST,
    JSONRPC_METHOD_NOT_FOUND,
    SUBSTRATE_VALIDATION_ERROR,
    TOOL_SCHEMAS,
    dispatch_jsonrpc,
)
from network.http_server import build_app
from substrate.runtime import Runtime


@pytest.fixture
def runtime(tmp_path: Path) -> Runtime:
    rt = Runtime(root=tmp_path / "root", node_id="test", host="127.0.0.1", port=0)
    rt.boot()
    return rt


@pytest.fixture
def client(runtime: Runtime) -> TestClient:
    return TestClient(build_app(runtime))


def test_initialize_returns_server_info(runtime):
    resp = dispatch_jsonrpc(runtime, {"jsonrpc": "2.0", "id": 1, "method": "initialize"})
    assert resp["id"] == 1
    assert resp["result"]["serverInfo"]["name"] == "substrate-mcp"
    assert "protocolVersion" in resp["result"]


def test_tools_list_returns_15_tools(runtime):
    resp = dispatch_jsonrpc(runtime, {"jsonrpc": "2.0", "id": 2, "method": "tools/list"})
    tools = resp["result"]["tools"]
    assert len(tools) == 15
    names = {t["name"] for t in tools}
    assert names == set(TOOL_SCHEMAS.keys())
    for t in tools:
        assert "inputSchema" in t and "description" in t


def test_tools_call_respond_round_trip(runtime):
    resp = dispatch_jsonrpc(runtime, {
        "jsonrpc": "2.0", "id": 3, "method": "tools/call",
        "params": {
            "name": "respond",
            "arguments": {
                "target": "mcp-test",
                "payload": {"a/positive": "True"},
                "sender": "mcp-test",
            },
        },
    })
    assert "error" not in resp, resp
    sc = resp["result"]["structuredContent"]
    assert sc["cell_id"]
    assert sc["fiber"]["predicates"]["a/positive"] == "True"


def test_invalid_jsonrpc_version_rejected(runtime):
    resp = dispatch_jsonrpc(runtime, {"jsonrpc": "1.0", "id": 9, "method": "initialize"})
    assert resp["error"]["code"] == JSONRPC_INVALID_REQUEST


def test_unknown_method_rejected(runtime):
    resp = dispatch_jsonrpc(runtime, {"jsonrpc": "2.0", "id": 9, "method": "no/such"})
    assert resp["error"]["code"] == JSONRPC_METHOD_NOT_FOUND


def test_unknown_tool_rejected(runtime):
    resp = dispatch_jsonrpc(runtime, {
        "jsonrpc": "2.0", "id": 9, "method": "tools/call",
        "params": {"name": "nope", "arguments": {}},
    })
    assert resp["error"]["code"] == JSONRPC_METHOD_NOT_FOUND


def test_substrate_validation_error_mapped(runtime):
    resp = dispatch_jsonrpc(runtime, {
        "jsonrpc": "2.0", "id": 9, "method": "tools/call",
        "params": {
            "name": "respond",
            "arguments": {"target": "BAD SLUG!", "payload": {"a": "True"}},
        },
    })
    assert resp["error"]["code"] == SUBSTRATE_VALIDATION_ERROR
    assert resp["error"]["data"]["substrate_code"].startswith("PCM_")


def test_http_mcp_endpoint_responds(client: TestClient):
    resp = client.post("/mcp", json={"jsonrpc": "2.0", "id": 11, "method": "tools/list"})
    assert resp.status_code == 200
    body = resp.json()
    assert body["id"] == 11
    assert len(body["result"]["tools"]) == 15


def test_http_mcp_endpoint_batch(client: TestClient):
    batch = [
        {"jsonrpc": "2.0", "id": 1, "method": "initialize"},
        {"jsonrpc": "2.0", "id": 2, "method": "tools/list"},
    ]
    resp = client.post("/mcp", json=batch)
    assert resp.status_code == 200
    body = resp.json()
    assert isinstance(body, list) and len(body) == 2
    assert body[0]["result"]["serverInfo"]["name"] == "substrate-mcp"
    assert len(body[1]["result"]["tools"]) == 15


def test_http_event_ingest_accepts_chained_event(client: TestClient, runtime: Runtime):
    """POST /events accepts a properly hash-chained event."""
    from storage.event_log import make_event
    log = runtime.boot_context.event_log
    forged = make_event(
        ord_=log.height(),
        prev=log.tail_id,
        kind="federation_test",
        body={"from": "peer-x", "n": 1},
        node_id="peer-x",
        wall_clock_ns=0,
    )
    resp = client.post("/events", json=forged)
    assert resp.status_code == 201, resp.text
    persisted = resp.json()
    assert persisted["id"] == forged["id"]
    assert log.height() == forged["ord"] + 1


def test_http_event_ingest_rejects_bad_prev(client: TestClient, runtime: Runtime):
    log = runtime.boot_context.event_log
    bad = {
        "ord": log.height(),
        "prev": "ff" * 32,  # wrong
        "kind": "federation_test",
        "node": "peer-x",
        "body": {"x": 1},
    }
    from substrate.canonicalization import cid
    bad["id"] = cid(bad)
    resp = client.post("/events", json=bad)
    assert resp.status_code == 409
