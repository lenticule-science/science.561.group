"""Conformance — REPL parser + dispatcher (v0.2 shell)."""

from __future__ import annotations

import time

import pytest

from shell.repl import dispatch, parse
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCM_PAYLOAD_INVALID


@pytest.fixture
def booted(tmp_path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node", wall_clock_ns=time.time_ns())
    return layout, log


def _run(line, *, layout, log, sender="user:captain"):
    return dispatch(line, layout=layout, event_log=log, node_id="test-node",
                    sender=sender)


# ---------------------------------------------------------------------------
# Parser
# ---------------------------------------------------------------------------


def test_parse_simple():
    assert parse("project task:* status") == [("project", ["task:*", "status"])]


def test_parse_pipeline():
    segs = parse("project task:* | filter ==True | fold count")
    assert segs == [
        ("project", ["task:*"]),
        ("filter", ["==True"]),
        ("fold", ["count"]),
    ]


def test_parse_quoted_args():
    assert parse('assert task:foo "with spaces" True') == [
        ("assert", ["task:foo", "with spaces", "True"]),
    ]


def test_parse_empty_yields_no_segments():
    assert parse("") == []
    assert parse("   |   ") == []


# ---------------------------------------------------------------------------
# Meta-commands — :pwd, :cd, :resolve
# Wired in repl.py per ``specs/shell/repl.md`` §2 +
# ``specs/filesystem/paths-and-resolution.md`` §2 (`:pwd` example).
# ---------------------------------------------------------------------------


def test_meta_pwd_requires_session(booted):
    layout, log = booted
    r = _run(":pwd", layout=layout, log=log)
    # Sessionless dispatch surfaces the SubstrateError as a non-ok result.
    assert len(r) == 1 and not r[0].ok
    msg = r[0].error if isinstance(r[0].error, str) else r[0].error.get("message", "")
    assert "session" in msg.lower()


def test_meta_cd_then_pwd_round_trip(booted, tmp_path):
    from process.session import open_session
    from process.user import create_user
    layout, log = booted
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:tester", display_name="Tester")
    sess = open_session(layout=layout, event_log=log, node_id="test-node",
                        owner="user:tester", capabilities=["shell:*", "signal:*"])

    from shell.repl import dispatch
    cd = dispatch(":cd scope:engineering", layout=layout, event_log=log,
                  node_id="test-node", sender="user:tester",
                  session_slug=sess.slug)
    assert len(cd) == 1 and cd[0].ok
    assert cd[0].output["current_scope"] == "scope:engineering"
    assert cd[0].output["cell_id"]

    pwd = dispatch(":pwd", layout=layout, event_log=log,
                   node_id="test-node", sender="user:tester",
                   session_slug=sess.slug)
    assert pwd[0].ok
    assert pwd[0].output["current_scope"] == "scope:engineering"

    res = dispatch(":resolve ./tasks/write-spec", layout=layout, event_log=log,
                   node_id="test-node", sender="user:tester",
                   session_slug=sess.slug)
    assert res[0].ok
    assert res[0].output["kind"] == "entity"
    assert res[0].output["target"] == "scope:engineering/tasks/write-spec"
    assert res[0].output["via"] == "relative"


def test_meta_cd_requires_one_arg(booted):
    from process.session import open_session
    from process.user import create_user
    layout, log = booted
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:tester", display_name="Tester")
    sess = open_session(layout=layout, event_log=log, node_id="test-node",
                        owner="user:tester", capabilities=["shell:*", "signal:*"])
    from shell.repl import dispatch
    r = dispatch(":cd", layout=layout, event_log=log, node_id="test-node",
                 sender="user:tester", session_slug=sess.slug)
    assert len(r) == 1 and not r[0].ok


# ---------------------------------------------------------------------------
# Dispatch — single verbs
# ---------------------------------------------------------------------------


def test_assert_then_project_returns_cell(booted):
    layout, log = booted
    # assert is (s, p, [v]); object is unary (= s) per cell-record §0.
    r = _run("assert task:write-spec status True", layout=layout, log=log)
    assert len(r) == 1 and r[0].ok
    assert r[0].output["cell_id"]
    # project finds it.
    p = _run("project s=task:write-spec p=status", layout=layout, log=log)
    assert p[0].ok
    cells = p[0].output
    assert cells
    assert all(c["s"] == "task:write-spec" for c in cells)
    assert all(c["p"] == "status" for c in cells)
    assert all(c["v"] == "True" for c in cells)


def test_assert_default_value_is_true(booted):
    layout, log = booted
    r = _run("assert task:foo opened", layout=layout, log=log)
    assert r[0].ok
    p = _run("project s=task:foo p=opened", layout=layout, log=log)
    assert p[0].output[0]["v"] == "True"


def test_assert_rejects_bad_arity(booted):
    layout, log = booted
    r = _run("assert task:foo", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_assert_rejects_bad_value(booted):
    layout, log = booted
    r = _run("assert task:foo status NotABilatticeValue", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_retract_flips_value_to_false(booted):
    layout, log = booted
    _run("assert task:t1 done True", layout=layout, log=log)
    _run("retract task:t1 done", layout=layout, log=log)
    p = _run("project s=task:t1 p=done", layout=layout, log=log)
    # After retract, monotonic merge of True + False = Both.
    vals = [c["v"] for c in p[0].output]
    assert any(v in ("False", "Both") for v in vals)


def test_settle_runs_without_payload(booted):
    layout, log = booted
    _run("assert task:s done True", layout=layout, log=log)
    r = _run("settle task:s", layout=layout, log=log)
    assert r[0].ok
    assert r[0].output["cell_id"]


def test_witness_chain_for_asserted_cell(booted):
    layout, log = booted
    r = _run("assert task:w opened True", layout=layout, log=log)
    cell_id = r[0].output["cell_id"]
    # cell_id is the snapshot id, not the atom id; look up an atom id from
    # the project results instead.
    p = _run("project s=task:w p=opened", layout=layout, log=log)
    atom_id = p[0].output[0]["id"]
    w = _run(f"witness {atom_id}", layout=layout, log=log)
    assert w[0].ok
    chain = w[0].output
    assert chain
    assert chain[0]["cell_id"] == atom_id


def test_hash_of_known_string(booted):
    layout, log = booted
    r = _run("hash hello", layout=layout, log=log)
    assert r[0].ok
    assert len(r[0].output) == 64


# ---------------------------------------------------------------------------
# Dispatch — pipelines
# ---------------------------------------------------------------------------


def test_pipeline_project_filter_fold(booted):
    layout, log = booted
    _run("assert task:a status True", layout=layout, log=log)
    _run("assert task:b status True", layout=layout, log=log)
    _run("assert task:c status False", layout=layout, log=log)
    r = _run("project p=status | filter ==True | fold count", layout=layout, log=log)
    assert all(seg.ok for seg in r)
    assert r[0].cell_ids_carried == 3
    assert r[1].cell_ids_carried == 2
    assert r[-1].output[0]["value"] == 2


def test_pipeline_project_fold_group_by(booted):
    layout, log = booted
    _run("assert task:a status True", layout=layout, log=log)
    _run("assert task:b status False", layout=layout, log=log)
    _run("assert task:c status True", layout=layout, log=log)
    r = _run("project p=status | fold group-by by=v", layout=layout, log=log)
    assert r[-1].ok
    rows = r[-1].output
    by_key = {row["key"]: row["value"] for row in rows}
    assert by_key.get("True") == 2
    assert by_key.get("False") == 1


def test_filter_without_pipe_rejected(booted):
    layout, log = booted
    r = _run("filter ==True", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_pipeline_short_circuits_on_error(booted):
    layout, log = booted
    # `frobnicate` is unknown; pipeline stops there.
    r = _run("frobnicate foo | project task:*", layout=layout, log=log)
    assert len(r) == 1
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


# ---------------------------------------------------------------------------
# Meta verbs
# ---------------------------------------------------------------------------


def test_help_returns_verb_list(booted):
    layout, log = booted
    r = _run("help", layout=layout, log=log)
    assert r[0].ok
    assert "verbs" in r[0].output
    assert any("assert" in line for line in r[0].output["verbs"])


def test_unknown_verb_rejected(booted):
    layout, log = booted
    r = _run("frobnicate task:foo", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_attribution_carries_sender_through_assert(booted):
    layout, log = booted
    _run("assert task:attrib state True", layout=layout, log=log,
         sender="user:alice")
    events = list(log.iter_events())
    targeting = [e for e in events
                 if e.get("body", {}).get("target") == "task:attrib"]
    assert targeting
    assert targeting[-1]["body"]["sender"] == "user:alice"


# ---------------------------------------------------------------------------
# audit verb
# ---------------------------------------------------------------------------


def test_audit_clean_log_returns_verified(booted):
    layout, log = booted
    _run("assert task:a status True", layout=layout, log=log)
    _run("assert task:b status False", layout=layout, log=log)
    r = _run("audit", layout=layout, log=log)
    assert r[0].ok
    out = r[0].output
    # Spec §3 hyphenated wire keys.
    assert set(out.keys()) == {
        "verified", "events-checked", "witnesses-checked", "failures",
    }
    assert out["verified"] is True
    assert out["failures"] == []
    assert out["events-checked"] >= 2


def test_audit_accepts_ord_window(booted):
    layout, log = booted
    _run("assert task:a status True", layout=layout, log=log)
    r = _run("audit start-ord=0 end-ord=99", layout=layout, log=log)
    assert r[0].ok and r[0].output["verified"] is True


def test_audit_rejects_positional_args(booted):
    layout, log = booted
    r = _run("audit 0 99", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_audit_rejects_unknown_kw(booted):
    layout, log = booted
    r = _run("audit until=10", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_audit_rejects_non_integer_ord(booted):
    layout, log = booted
    r = _run("audit start-ord=foo", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


# ---------------------------------------------------------------------------
# fork verb
# ---------------------------------------------------------------------------


def test_fork_uses_bound_session_when_no_arg(booted):
    layout, log = booted
    from process.session import open_session
    parent = open_session(
        layout=layout, event_log=log, node_id="test-node",
        owner="user:alice", capabilities=["cap:r"],
    )
    r = dispatch(
        "fork", layout=layout, event_log=log, node_id="test-node",
        sender="user:alice", session_slug=parent.slug,
    )
    assert r[0].ok
    out = r[0].output
    assert out["parent"] == parent.slug
    assert out["owner"] == "user:alice"
    assert out["capabilities"] == ["cap:r"]
    assert out["state"] == "open"


def test_fork_with_explicit_parent_kw(booted):
    layout, log = booted
    from process.session import open_session
    parent = open_session(
        layout=layout, event_log=log, node_id="test-node",
        owner="user:bob",
    )
    r = _run(f"fork parent={parent.slug}", layout=layout, log=log)
    assert r[0].ok
    assert r[0].output["parent"] == parent.slug


def test_fork_without_session_or_arg_errors(booted):
    layout, log = booted
    r = _run("fork", layout=layout, log=log)
    # No session bound and no parent= kw; expect a clear PCM error.
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_fork_rejects_unknown_arg(booted):
    layout, log = booted
    r = _run("fork bogus=x", layout=layout, log=log)
    assert not r[0].ok
    assert r[0].error["code"] == PCM_PAYLOAD_INVALID


def test_help_lists_audit_and_fork(booted):
    layout, log = booted
    r = _run("help", layout=layout, log=log)
    verbs = r[0].output["verbs"]
    assert any(v.startswith("audit") for v in verbs)
    assert any(v.startswith("fork") for v in verbs)
