"""MCP tool handlers — exercise each of the 15 tools without an MCP transport."""

from __future__ import annotations

from pathlib import Path

import pytest

from drivers.mcp_driver import build_tool_handlers
from substrate.runtime import Runtime


@pytest.fixture
def runtime(tmp_path: Path):
    rt = Runtime(root=tmp_path, node_id="t", host="0.0.0.0", port=5000)
    rt.boot()
    return rt


def test_15_tools_present(runtime):
    handlers = build_tool_handlers(runtime)
    assert set(handlers) == {
        "respond", "query", "get_cell", "get_rule", "get_fiber",
        "entity_history", "add_rule", "retire_rule", "set_alias",
        "remove_alias", "witness", "evidence", "node_state", "peers",
        "sync_peer",
    }


def test_full_lifecycle(runtime):
    h = build_tool_handlers(runtime)
    # add a rule
    rule_resp = h["add_rule"]({
        "rule": {"name": "ack", "premise": {"p": "True"}, "conclusion": {"ack": "True"}},
    })
    rule_id = rule_resp["rule_id"]
    assert rule_id in runtime.active_rule_ids
    # respond
    r = h["respond"]({"target": "rsc:hello", "payload": {"p": "True"}})
    assert "cell_id" in r
    # any rule that fired should appear in the repair log
    assert any(entry["rule_id"] == rule_id for entry in r["repair_log"])
    # get_cell
    cell = h["get_cell"]({"cell_id": r["cell_id"]})
    assert cell["entity"] == "rsc:hello"
    # get_rule
    rule_doc = h["get_rule"]({"rule_id": rule_id})
    assert rule_doc["name"] == "ack"
    # query — streaming: returns [meta, predicates, history] chunks
    chunks = h["query"]({"entity": "rsc:hello"})
    assert isinstance(chunks, list)
    meta = next(c for c in chunks if c["chunk"] == "meta")
    assert meta["latest_cell_id"] == r["cell_id"]
    fiber2 = h["get_fiber"]({"entity": "rsc:hello"})
    assert fiber2["latest_cell_id"] == r["cell_id"]
    # entity_history — streaming: header + one entry per history item
    hist = h["entity_history"]({"entity": "rsc:hello"})
    entries = [c for c in hist if c["chunk"] == "entry"]
    assert len(entries) == 1
    # set_alias / get
    h["set_alias"]({"name": "rsc-hello", "target": r["cell_id"]})
    h["remove_alias"]({"name": "rsc-hello"})
    # retire_rule
    h["retire_rule"]({"rule_id": rule_id})
    assert rule_id not in runtime.active_rule_ids
    # witness
    h["witness"]({"target": "x", "payload": {"q": "Both"}, "witness": "test-driver"})
    # evidence
    ev = h["evidence"]({"evidence": {"kind": "test", "data": [1, 2, 3]}})
    assert "exec_id" in ev
    # node_state
    ns = h["node_state"]({})
    assert ns["state"] in ("ready", "degraded")
    # peers / sync_peer
    assert h["peers"]({}) == {"peers": []}
    sync = h["sync_peer"]({
        "peer_node_id": "peer-1",
        "entity": "rsc:hello",
        "fiber_predicates": {"q/positive": "True"},
    })
    assert sync["merged_predicates"]["q/positive"] == "True"
    # The local positive predicate from `respond` above must survive the merge.
    assert sync["merged_predicates"].get("ack") == "True"
