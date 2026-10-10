"""Conformance — user provisioning, session lifecycle, runlevels (v0.2 OS)."""

from __future__ import annotations

import json
import time

import pytest

from init_boot.bootstrap_users import ensure_default_captain
from init_boot.runlevels import Runlevel, read_runlevel, transition, write_runlevel
from process.session import (
    close_session,
    fork_session,
    get_session,
    list_sessions,
    open_session,
)
from process.user import authenticate, create_user, get_user, list_users
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.error_codes import (
    PCM_AUTH_FAILED,
    PCM_RUNLEVEL_INVALID,
    PCM_SESSION_CLOSED,
    SubstrateError,
)


@pytest.fixture
def fresh_substrate(tmp_path):
    """A booted-enough substrate: layout + event log initialised."""
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node", wall_clock_ns=time.time_ns())
    return layout, log


# ---------------------------------------------------------------------------
# Users
# ---------------------------------------------------------------------------


def test_create_user_emits_provisioned_cell(fresh_substrate):
    layout, log = fresh_substrate
    user, token = create_user(
        layout=layout, event_log=log, node_id="test-node",
        slug="user:alice", display_name="Alice",
        capabilities=["respond:*"],
    )
    assert user.slug == "user:alice"
    assert user.display_name == "Alice"
    assert len(user.token_hash) == 64  # sha256 hex
    assert token  # plaintext returned exactly once
    # Persisted user record on disk.
    again = get_user(layout, "user:alice")
    assert again.slug == user.slug
    # An event was written for the assertion.
    events = list(log.iter_events())
    assert any(e.get("body", {}).get("target") == "user:alice" for e in events)


def test_create_user_rejects_bad_slug(fresh_substrate):
    layout, log = fresh_substrate
    with pytest.raises(SubstrateError) as exc:
        create_user(
            layout=layout, event_log=log, node_id="test-node",
            slug="alice",  # missing 'user:' prefix
            display_name="Alice",
        )
    assert exc.value.code == PCM_AUTH_FAILED


def test_authenticate_round_trip(fresh_substrate):
    layout, log = fresh_substrate
    _, token = create_user(
        layout=layout, event_log=log, node_id="test-node",
        slug="user:bob", display_name="Bob",
    )
    u = authenticate(layout, token)
    assert u.slug == "user:bob"


def test_authenticate_rejects_bad_token(fresh_substrate):
    layout, log = fresh_substrate
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:c", display_name="C", token="real-token")
    with pytest.raises(SubstrateError) as exc:
        authenticate(layout, "wrong-token")
    assert exc.value.code == PCM_AUTH_FAILED


def test_token_never_persisted_in_plaintext(fresh_substrate):
    layout, log = fresh_substrate
    _, token = create_user(layout=layout, event_log=log, node_id="test-node",
                           slug="user:d", display_name="D", token="my-secret-token")
    # Walk every file under the substrate root; the plaintext token must
    # not appear anywhere.
    found = False
    for f in (layout.root).rglob("*"):
        if not f.is_file():
            continue
        try:
            data = f.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError):
            continue
        if "my-secret-token" in data:
            found = True
            break
    assert not found, "plaintext token leaked to disk"


def test_bootstrap_default_captain_is_idempotent(fresh_substrate, monkeypatch, tmp_path):
    layout, log = fresh_substrate
    # Opt in to file-persistence so we can verify the token landed.
    token_file = tmp_path / "captain-token.txt"
    monkeypatch.setenv("SUBSTRATE_CAPTAIN_TOKEN_FILE", str(token_file))
    slug1, created1 = ensure_default_captain(
        layout=layout, event_log=log, node_id="test-node",
    )
    assert slug1 == "user:captain"
    assert created1 is True
    assert token_file.exists()
    # Second call is a no-op (does not rewrite the token file).
    token_file.unlink()
    slug2, created2 = ensure_default_captain(
        layout=layout, event_log=log, node_id="test-node",
    )
    assert slug2 == "user:captain"
    assert created2 is False
    assert not token_file.exists()
    # Only one captain exists.
    captains = [u for u in list_users(layout) if u.slug == "user:captain"]
    assert len(captains) == 1


def test_bootstrap_default_omits_disk_token_when_env_unset(fresh_substrate, monkeypatch):
    """Without the env var, no plaintext token file is written anywhere."""
    layout, log = fresh_substrate
    monkeypatch.delenv("SUBSTRATE_CAPTAIN_TOKEN_FILE", raising=False)
    ensure_default_captain(layout=layout, event_log=log, node_id="test-node")
    # Walk the substrate root; no file should contain a plaintext token.
    for f in layout.root.rglob("*"):
        if not f.is_file():
            continue
        if f.name == "captain-token.txt":
            pytest.fail(f"plaintext token file persisted: {f}")


# ---------------------------------------------------------------------------
# Sessions
# ---------------------------------------------------------------------------


def test_open_session_writes_record_and_audit(fresh_substrate):
    layout, log = fresh_substrate
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:e", display_name="E")
    sess = open_session(
        layout=layout, event_log=log, node_id="test-node",
        owner="user:e", capabilities=["shell:*"],
    )
    assert sess.slug.startswith("session:")
    assert sess.state == "open"
    assert sess.owner == "user:e"
    again = get_session(layout, sess.slug)
    assert again.slug == sess.slug
    # The opened-cell carries sender=owner.
    events = list(log.iter_events())
    opened_events = [e for e in events
                     if e.get("body", {}).get("target") == sess.slug]
    assert opened_events
    assert opened_events[-1]["body"]["sender"] == "user:e"


def test_close_session_idempotent(fresh_substrate):
    layout, log = fresh_substrate
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:f", display_name="F")
    sess = open_session(layout=layout, event_log=log, node_id="test-node",
                        owner="user:f")
    closed1 = close_session(layout=layout, event_log=log, node_id="test-node",
                            slug=sess.slug)
    assert closed1.state == "closed"
    assert closed1.closed_at_ord is not None
    # Second close is a no-op (returns existing closed session).
    closed2 = close_session(layout=layout, event_log=log, node_id="test-node",
                            slug=sess.slug)
    assert closed2.state == "closed"
    assert closed2.closed_at_ord == closed1.closed_at_ord


def test_fork_session_inherits_owner_and_capabilities(fresh_substrate):
    layout, log = fresh_substrate
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:g", display_name="G")
    parent = open_session(layout=layout, event_log=log, node_id="test-node",
                          owner="user:g", capabilities=["shell:*", "respond:*"])
    child = fork_session(layout=layout, event_log=log, node_id="test-node",
                         parent_slug=parent.slug)
    assert child.owner == "user:g"
    assert child.parent == parent.slug
    assert set(child.capabilities) == {"shell:*", "respond:*"}
    # Child has its own slug.
    assert child.slug != parent.slug


def test_fork_from_closed_session_rejected(fresh_substrate):
    layout, log = fresh_substrate
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:h", display_name="H")
    p = open_session(layout=layout, event_log=log, node_id="test-node",
                     owner="user:h")
    close_session(layout=layout, event_log=log, node_id="test-node", slug=p.slug)
    with pytest.raises(SubstrateError) as exc:
        fork_session(layout=layout, event_log=log, node_id="test-node",
                     parent_slug=p.slug)
    assert exc.value.code == PCM_SESSION_CLOSED


def test_list_sessions_filters_by_owner(fresh_substrate):
    layout, log = fresh_substrate
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:i", display_name="I")
    create_user(layout=layout, event_log=log, node_id="test-node",
                slug="user:j", display_name="J")
    open_session(layout=layout, event_log=log, node_id="test-node", owner="user:i")
    open_session(layout=layout, event_log=log, node_id="test-node", owner="user:i")
    open_session(layout=layout, event_log=log, node_id="test-node", owner="user:j")
    assert len(list_sessions(layout, owner="user:i")) == 2
    assert len(list_sessions(layout, owner="user:j")) == 1
    assert len(list_sessions(layout)) == 3


# ---------------------------------------------------------------------------
# Runlevels
# ---------------------------------------------------------------------------


def test_runlevel_default_when_unwritten(fresh_substrate):
    layout, _ = fresh_substrate
    assert read_runlevel(layout) == Runlevel.STOPPED


def test_runlevel_round_trip(fresh_substrate):
    layout, _ = fresh_substrate
    write_runlevel(layout, Runlevel.SUBSTRATE_ONLY)
    assert read_runlevel(layout) == Runlevel.SUBSTRATE_ONLY
    write_runlevel(layout, Runlevel.FULL)
    assert read_runlevel(layout) == Runlevel.FULL


def test_runlevel_transition_emits_event(fresh_substrate):
    layout, log = fresh_substrate
    prev, new = transition(layout=layout, event_log=log, node_id="test-node",
                           target=Runlevel.FULL)
    assert prev == Runlevel.STOPPED
    assert new == Runlevel.FULL
    # An event records the transition.
    events = list(log.iter_events())
    rl_events = [e for e in events if e.get("kind") == "runlevel-transition"]
    assert rl_events
    assert rl_events[-1]["body"]["level"] == 3


def test_runlevel_parse_accepts_int_str_name():
    assert Runlevel.parse(3) == Runlevel.FULL
    assert Runlevel.parse("3") == Runlevel.FULL
    assert Runlevel.parse("full") == Runlevel.FULL
    assert Runlevel.parse("substrate-only") == Runlevel.SUBSTRATE_ONLY
    with pytest.raises(SubstrateError) as exc:
        Runlevel.parse("nope")
    assert exc.value.code == PCM_RUNLEVEL_INVALID
