"""MCP streaming semantics for query / entity_history + real sync_peer merge."""

from __future__ import annotations

from pathlib import Path

import pytest
from fastapi.testclient import TestClient

from drivers.mcp_driver import STREAMING_TOOLS, build_tool_handlers, dispatch_jsonrpc
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


def _seed_entity(client: TestClient, entity: str, n: int = 3) -> None:
    for i in range(n):
        client.post(
            "/mcp",
            json={
                "jsonrpc": "2.0",
                "id": i + 1,
                "method": "tools/call",
                "params": {
                    "name": "respond",
                    "arguments": {
                        "target": entity,
                        "payload": {f"step-{i}/positive": "True"},
                    },
                },
            },
        )


def test_streaming_tools_set_includes_query_and_history():
    assert STREAMING_TOOLS == {"query", "entity_history"}


def test_query_emits_three_chunks(runtime: Runtime, client: TestClient):
    _seed_entity(client, "stream-test", n=2)
    handlers = build_tool_handlers(runtime)
    chunks = handlers["query"]({"entity": "stream-test"})
    assert isinstance(chunks, list)
    kinds = [c.get("chunk") for c in chunks]
    assert kinds == ["meta", "predicates", "history"]
    assert chunks[0]["history_height"] == 2


def test_query_emits_meta_chunk_for_unknown_entity(runtime: Runtime):
    handlers = build_tool_handlers(runtime)
    chunks = handlers["query"]({"entity": "no-such-entity"})
    assert isinstance(chunks, list) and len(chunks) == 1
    assert chunks[0] == {"chunk": "meta", "entity": "no-such-entity", "exists": False}


def test_entity_history_emits_one_chunk_per_entry(runtime: Runtime, client: TestClient):
    _seed_entity(client, "history-test", n=3)
    handlers = build_tool_handlers(runtime)
    chunks = handlers["entity_history"]({"entity": "history-test"})
    assert chunks[0]["chunk"] == "header"
    assert chunks[0]["count"] == 3
    entry_chunks = [c for c in chunks if c["chunk"] == "entry"]
    assert len(entry_chunks) == 3
    assert [c["index"] for c in entry_chunks] == [0, 1, 2]
    for c in entry_chunks:
        assert "cell_id" in c and "event_id" in c


def test_http_mcp_query_returns_multiple_content_items(client: TestClient):
    _seed_entity(client, "http-stream", n=1)
    resp = client.post(
        "/mcp",
        json={
            "jsonrpc": "2.0", "id": 99, "method": "tools/call",
            "params": {"name": "query", "arguments": {"entity": "http-stream"}},
        },
    )
    assert resp.status_code == 200
    body = resp.json()
    content = body["result"]["content"]
    # query streams 3 chunks → 3 TextContent items
    assert len(content) == 3
    assert all(item["type"] == "text" for item in content)
    structured = body["result"]["structuredContent"]
    assert "chunks" in structured and len(structured["chunks"]) == 3


def test_sync_peer_actually_merges_against_local_fiber(runtime: Runtime, client: TestClient):
    """sync_peer should ⊙-merge into the local fiber, not just echo the input."""
    # Seed the local fiber with one positive predicate.
    client.post(
        "/mcp",
        json={
            "jsonrpc": "2.0", "id": 1, "method": "tools/call",
            "params": {
                "name": "respond",
                "arguments": {"target": "fed-target", "payload": {"a/positive": "True"}},
            },
        },
    )
    # Now sync a peer that asserts the negative side of the same predicate.
    resp = client.post(
        "/mcp",
        json={
            "jsonrpc": "2.0", "id": 2, "method": "tools/call",
            "params": {
                "name": "sync_peer",
                "arguments": {
                    "peer_node_id": "peer-x",
                    "entity": "fed-target",
                    "fiber_predicates": {"a/negative": "True"},
                    "persist": False,
                },
            },
        },
    )
    body = resp.json()
    sc = body["result"]["structuredContent"]
    # Merged predicates must include BOTH the local positive AND the peer negative.
    assert sc["merged_predicates"]["a/positive"] == "True"
    assert sc["merged_predicates"]["a/negative"] == "True"
    assert sc["persisted"] is False


def test_sync_peer_persist_writes_event_and_updates_fiber(runtime: Runtime, client: TestClient):
    client.post(
        "/mcp",
        json={
            "jsonrpc": "2.0", "id": 1, "method": "tools/call",
            "params": {
                "name": "respond",
                "arguments": {"target": "fed-persist", "payload": {"x/positive": "True"}},
            },
        },
    )
    height_before = runtime.boot_context.event_log.height()
    resp = client.post(
        "/mcp",
        json={
            "jsonrpc": "2.0", "id": 2, "method": "tools/call",
            "params": {
                "name": "sync_peer",
                "arguments": {
                    "peer_node_id": "peer-x",
                    "entity": "fed-persist",
                    "fiber_predicates": {"x/negative": "True"},
                    "persist": True,
                },
            },
        },
    )
    sc = resp.json()["result"]["structuredContent"]
    assert sc["persisted"] is True
    assert "event_id" in sc and "cell_id" in sc
    # Event log advanced by exactly one (the federation_merge event).
    assert runtime.boot_context.event_log.height() == height_before + 1
    # Local fiber now carries Both for x.
    fiber = runtime.boot_context.layout.get_fiber("fed-persist")
    assert fiber["predicates"]["x/positive"] == "True"
    assert fiber["predicates"]["x/negative"] == "True"
