"""HTTP server smoke test using FastAPI's TestClient (httpx-backed)."""

from __future__ import annotations

from pathlib import Path

import pytest
from fastapi.testclient import TestClient

from network.http_server import build_app
from process.user import create_user
from substrate.runtime import Runtime


@pytest.fixture
def authed(tmp_path: Path):
    rt = Runtime(root=tmp_path, node_id="t", host="0.0.0.0", port=5000)
    rt.boot()
    # Provision a known token directly so we don't have to scrape boot
    # logs in the unit test; the captain user is already provisioned by
    # the bootstrap_users phase, but with an unknown token.
    _, token = create_user(
        layout=rt.boot_context.layout,
        event_log=rt.boot_context.event_log,
        node_id=rt.node_id,
        slug="user:tester",
        display_name="Tester",
        token="unit-test-token",
        capabilities=["respond:*", "shell:*"],
    )
    client = TestClient(build_app(rt))
    return client, {"Authorization": f"Bearer {token}"}


def test_health_ready_200(authed):
    client, _ = authed
    r = client.get("/health/ready")
    assert r.status_code == 200
    body = r.json()
    assert body["ready"] is True
    assert body["state"] == "ready"


def test_index_html_renders(authed):
    client, _ = authed
    r = client.get("/")
    assert r.status_code == 200
    assert "pypredcomp v0.2" in r.text


def test_metrics_exposes_height_and_state(authed):
    client, _ = authed
    r = client.get("/metrics")
    assert r.status_code == 200
    assert "substrate_event_log_height" in r.text
    assert "substrate_runtime_state_ready 1" in r.text


def test_respond_round_trip(authed):
    client, hdrs = authed
    r = client.post(
        "/respond",
        headers=hdrs,
        json={"target": "demo", "payload": {"p": "True"}},
    )
    assert r.status_code == 200, r.text
    body = r.json()
    cell_id = body["cell_id"]
    # cell is fetchable
    cell = client.get(f"/cell/{cell_id}")
    assert cell.status_code == 200
    # fiber is fetchable
    fiber = client.get("/fiber/demo")
    assert fiber.status_code == 200
    assert fiber.json()["latest_cell_id"] == cell_id
    # event is fetchable
    event = client.get(f"/event/{body['event_id']}")
    assert event.status_code == 200


def test_respond_without_auth_rejected(authed):
    client, _ = authed
    r = client.post("/respond", json={"target": "x", "payload": {"p": "True"}})
    assert r.status_code == 401


def test_respond_sender_is_server_derived_not_client(authed):
    """Even if the client sends a 'sender' field, the server ignores it
    and stamps the event with the authenticated user's slug."""
    client, hdrs = authed
    r = client.post(
        "/respond",
        headers=hdrs,
        # Try to spoof: claim to be the captain even though we are tester.
        json={"target": "spoof-test", "payload": {"p": "True"},
              "sender": "user:captain"},
    )
    assert r.status_code == 200
    event_id = r.json()["event_id"]
    e = client.get(f"/event/{event_id}").json()
    assert e["body"]["sender"] == "user:tester"


def test_node_state(authed):
    client, _ = authed
    r = client.get("/node/state")
    assert r.status_code == 200
    body = r.json()
    assert body["state"] == "ready"
    assert "boot_phases" in body


def test_events_listing(authed):
    client, hdrs = authed
    client.post("/respond", headers=hdrs,
                json={"target": "x", "payload": {"p": "True"}})
    r = client.get("/events?after_ord=-1")
    assert r.status_code == 200
    body = r.json()
    assert body["head_ord"] >= 1
    assert len(body["events"]) >= 2
