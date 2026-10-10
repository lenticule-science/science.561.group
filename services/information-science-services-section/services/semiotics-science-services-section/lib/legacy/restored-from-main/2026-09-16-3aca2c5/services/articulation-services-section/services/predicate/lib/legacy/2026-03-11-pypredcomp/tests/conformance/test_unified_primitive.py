"""Unified-primitive contract: every state-changing tool reduces to ``respond``.

Verifies that ``add_rule``, ``retire_rule``, ``set_alias``, ``remove_alias``,
and ``evidence`` all funnel through ``respond()`` (so the only kernel event
kind is ``respond``) and that the directive is recorded on the resulting cell.
"""

from __future__ import annotations

from pathlib import Path

import pytest

from drivers.mcp_driver import build_tool_handlers
from substrate.runtime import Runtime


@pytest.fixture
def runtime(tmp_path: Path) -> Runtime:
    rt = Runtime(root=tmp_path / "root", node_id="t", host="127.0.0.1", port=0)
    rt.boot()
    return rt


def _read_log_kinds(runtime: Runtime) -> list[str]:
    out: list[str] = []
    log_path = runtime.boot_context.event_log.path
    for line in log_path.read_text("utf-8").splitlines():
        if not line.strip():
            continue
        import json
        out.append(json.loads(line)["kind"])
    return out


def test_add_rule_produces_respond_event_with_directive_metadata(runtime: Runtime):
    h = build_tool_handlers(runtime)
    kinds_before = set(_read_log_kinds(runtime))
    out = h["add_rule"]({
        "rule": {"name": "u-test", "premise": {"p/positive": "True"},
                 "conclusion": {"p/settled": "True"}},
    })
    assert out["rule_id"]
    assert out["cell_id"]
    new_kinds = _read_log_kinds(runtime)
    # Only ``respond`` events get appended — never ``add_rule``.
    assert "add_rule" not in new_kinds
    assert new_kinds.count("respond") >= 1
    # The cell's metadata records the directive (audit trail leads side-effect).
    cell = runtime.boot_context.layout.get_record("cells", out["cell_id"])
    assert cell["metadata"]["directive"]["kind"] == "add_rule"
    # The rule was actually persisted + activated.
    assert out["rule_id"] in runtime.active_rule_ids


def test_set_and_remove_alias_route_through_respond(runtime: Runtime):
    h = build_tool_handlers(runtime)
    out = h["set_alias"]({"name": "demo-alias", "target": "cell:abc"})
    assert out["name"] == "demo-alias"
    assert out["cell_id"]
    cell = runtime.boot_context.layout.get_record("cells", out["cell_id"])
    assert cell["metadata"]["directive"]["kind"] == "set_alias"
    # Side-effect actually applied.
    from storage.aliases import AliasStore
    assert AliasStore(runtime.root).get("demo-alias") == "cell:abc"

    out2 = h["remove_alias"]({"name": "demo-alias"})
    assert out2["removed"] is True
    cell2 = runtime.boot_context.layout.get_record("cells", out2["cell_id"])
    assert cell2["metadata"]["directive"]["kind"] == "remove_alias"

    # Only ``respond`` events on the log — no ``set_alias`` / ``remove_alias``.
    kinds = _read_log_kinds(runtime)
    assert "set_alias" not in kinds and "remove_alias" not in kinds


def test_retire_rule_routes_through_respond(runtime: Runtime):
    h = build_tool_handlers(runtime)
    add = h["add_rule"]({
        "rule": {"name": "r", "premise": {"trigger": "True"}, "conclusion": {"x/positive": "True"}},
    })
    rid = add["rule_id"]
    out = h["retire_rule"]({"rule_id": rid})
    assert out["retired"] is True
    cell = runtime.boot_context.layout.get_record("cells", out["cell_id"])
    assert cell["metadata"]["directive"]["kind"] == "retire_rule"
    assert rid not in runtime.active_rule_ids
    kinds = _read_log_kinds(runtime)
    assert "retire_rule" not in kinds


def test_evidence_routes_through_respond_and_writes_evidence_file(runtime: Runtime):
    h = build_tool_handlers(runtime)
    out = h["evidence"]({"evidence": {"kind": "test", "data": [1, 2, 3]}})
    assert out["exec_id"]
    cell = runtime.boot_context.layout.get_record("cells", out["cell_id"])
    assert cell["metadata"]["directive"]["kind"] == "evidence"
    # Evidence file actually exists at the expected path.
    ev_path = runtime.boot_context.layout.evidence_path(out["exec_id"])
    assert ev_path.exists()
    kinds = _read_log_kinds(runtime)
    assert "evidence" not in kinds


def test_no_module_globals_in_closure_engine():
    """Closure engine must not stash a mutable singleton graph at module level."""
    import substrate.closure_engine as ce
    assert not hasattr(ce, "_COMPILED_GRAPH"), "closure_engine has a module-global cache"
    assert not hasattr(ce, "_compiled_graph"), "closure_engine exposes a global graph getter"
