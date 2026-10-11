"""End-to-end conformance — the OS as the user uses it.

Boots a runtime in a tmp root, drives it via the FastAPI surface using
:class:`fastapi.testclient.TestClient`, and exercises the full v0.2 OS
loop: provision captain, authenticate, open a session, run a shell
command, see results, transition runlevel, deny on bad token.
"""

from __future__ import annotations

import json

import pytest
from fastapi.testclient import TestClient

from network.http_server import build_app
from substrate.runtime import Runtime, RuntimeState


@pytest.fixture
def os_running(tmp_path, monkeypatch):
    # Opt the bootstrap into the file-handoff mode so the test can read
    # the captain token deterministically (env-var path; same one
    # operators use for local dev).
    token_file = tmp_path / "captain-token.txt"
    monkeypatch.setenv("SUBSTRATE_CAPTAIN_TOKEN_FILE", str(token_file))
    runtime = Runtime(root=tmp_path, node_id="test-node", host="127.0.0.1", port=0)
    runtime.boot()
    assert runtime.state == RuntimeState.READY, (
        f"boot did not reach ready: {runtime.boot_context.failed_phase}, "
        f"phases={runtime.boot_context.phase_log}"
    )
    app = build_app(runtime)
    client = TestClient(app)
    token = token_file.read_text().strip()
    return runtime, client, token


def _bearer(token: str) -> dict[str, str]:
    return {"Authorization": f"Bearer {token}"}


# ---------------------------------------------------------------------------
# Bootstrap + identity
# ---------------------------------------------------------------------------


def test_boot_reaches_runlevel_full(os_running):
    runtime, client, _ = os_running
    r = client.get("/runlevel")
    assert r.status_code == 200
    body = r.json()
    assert body["level"] == 3
    assert body["name"] == "full"


def test_health_ready_after_boot(os_running):
    _, client, _ = os_running
    r = client.get("/health/ready")
    assert r.status_code == 200
    assert r.json()["ready"] is True


def test_users_lists_captain(os_running):
    _, client, token = os_running
    r = client.get("/users", headers=_bearer(token))
    assert r.status_code == 200
    body = r.json()
    captains = [u for u in body["users"] if u["slug"] == "user:captain"]
    assert len(captains) == 1
    assert "shell:*" in captains[0]["capabilities"]


def test_unauthenticated_request_rejected(os_running):
    _, client, _ = os_running
    r = client.get("/users")
    assert r.status_code == 401


def test_bad_token_rejected(os_running):
    _, client, _ = os_running
    r = client.get("/users", headers=_bearer("not-a-real-token"))
    assert r.status_code == 401


# ---------------------------------------------------------------------------
# Sessions
# ---------------------------------------------------------------------------


def test_open_session_returns_record(os_running):
    _, client, token = os_running
    r = client.post("/session", headers=_bearer(token), json={})
    assert r.status_code == 201
    body = r.json()
    assert body["slug"].startswith("session:")
    assert body["owner"] == "user:captain"
    assert body["state"] == "open"


def test_open_session_then_list_then_close(os_running):
    _, client, token = os_running
    r1 = client.post("/session", headers=_bearer(token), json={})
    slug = r1.json()["slug"]

    r2 = client.get("/sessions", headers=_bearer(token))
    assert r2.status_code == 200
    sessions = r2.json()["sessions"]
    assert any(s["slug"] == slug for s in sessions)

    r3 = client.delete(f"/session/{slug}", headers=_bearer(token))
    assert r3.status_code == 200
    assert r3.json()["state"] == "closed"


def test_fork_session(os_running):
    _, client, token = os_running
    parent = client.post("/session", headers=_bearer(token), json={}).json()
    child = client.post("/session", headers=_bearer(token),
                        json={"parent": parent["slug"]}).json()
    assert child["parent"] == parent["slug"]
    assert child["owner"] == parent["owner"]
    assert child["slug"] != parent["slug"]


def test_fork_session_other_owner_denied(os_running):
    """User B cannot fork user A's session and inherit A's attribution."""
    runtime, client, token = os_running
    from process.user import create_user
    _, alice_token = create_user(
        layout=runtime.boot_context.layout,
        event_log=runtime.boot_context.event_log,
        node_id=runtime.node_id,
        slug="user:alice", display_name="Alice",
        capabilities=["shell:*"],
    )
    parent_slug = client.post(
        "/session", headers=_bearer(token), json={},
    ).json()["slug"]
    r = client.post(
        "/session",
        headers=_bearer(alice_token),
        json={"parent": parent_slug},
    )
    assert r.status_code == 403
# ---------------------------------------------------------------------------
# Shell — the headline experience
# ---------------------------------------------------------------------------


def test_shell_assert_then_project_round_trip(os_running):
    _, client, token = os_running
    r = client.post("/shell", headers=_bearer(token),
                    json={"command": "assert task:write-blogpost status True"})
    assert r.status_code == 200, r.text
    body = r.json()
    assert body["owner"] == "user:captain"
    assert all(seg["ok"] for seg in body["results"])

    p = client.post("/shell", headers=_bearer(token),
                    json={"command": "project s=task:write-blogpost p=status"})
    assert p.status_code == 200
    cells = p.json()["results"][0]["output"]
    assert cells
    assert all(c["s"] == "task:write-blogpost" and c["v"] == "True" for c in cells)


def test_shell_pipeline(os_running):
    _, client, token = os_running
    for s in ("a", "b", "c"):
        client.post("/shell", headers=_bearer(token),
                    json={"command": f"assert task:{s} status True"})
    r = client.post("/shell", headers=_bearer(token),
                    json={"command": "project p=status | filter ==True | fold count"})
    assert r.status_code == 200
    last = r.json()["results"][-1]
    assert last["ok"]
    assert last["output"][0]["value"] >= 3


def test_shell_unknown_verb_returns_structured_error(os_running):
    _, client, token = os_running
    r = client.post("/shell", headers=_bearer(token),
                    json={"command": "frobnicate widget"})
    assert r.status_code == 200  # the call succeeded; the verb did not
    seg = r.json()["results"][0]
    assert seg["ok"] is False
    assert seg["error"]["code"] == "PCM_PAYLOAD_INVALID"


def test_shell_session_reuse(os_running):
    _, client, token = os_running
    sess_slug = client.post("/session", headers=_bearer(token), json={}).json()["slug"]
    r = client.post("/shell", headers=_bearer(token),
                    json={"command": "assert task:reuse status True", "session": sess_slug})
    assert r.json()["session"] == sess_slug


def test_shell_session_owner_mismatch_denied(os_running):
    """A session opened by user A cannot be driven by user B."""
    runtime, client, token = os_running
    # Provision a second user against the SAME running runtime.
    from process.user import create_user
    _, alice_token = create_user(
        layout=runtime.boot_context.layout,
        event_log=runtime.boot_context.event_log,
        node_id=runtime.node_id,
        slug="user:alice", display_name="Alice", capabilities=["shell:*"],
    )
    sess_slug = client.post("/session", headers=_bearer(token), json={}).json()["slug"]
    r = client.post("/shell", headers=_bearer(alice_token),
                    json={"command": "project task:*", "session": sess_slug})
    assert r.status_code == 403


# ---------------------------------------------------------------------------
# Runlevel transitions
# ---------------------------------------------------------------------------


def test_runlevel_transition_requires_capability(os_running):
    runtime, client, _token = os_running
    # Provision a non-captain user without runlevel:* capability against
    # the SAME running runtime so it can authenticate.
    from process.user import create_user
    _, bob_token = create_user(
        layout=runtime.boot_context.layout,
        event_log=runtime.boot_context.event_log,
        node_id=runtime.node_id,
        slug="user:bob", display_name="Bob", capabilities=["shell:*"],
    )
    r = client.post("/runlevel", headers=_bearer(bob_token), json={"target": 2})
    assert r.status_code == 403


def test_runlevel_transition_works_for_captain(os_running):
    _, client, token = os_running
    r = client.post("/runlevel", headers=_bearer(token), json={"target": "federation-on"})
    assert r.status_code == 200
    body = r.json()
    assert body["level"] == 5
    assert body["name"] == "federation-on"
    # Confirm via GET.
    g = client.get("/runlevel")
    assert g.json()["level"] == 5
