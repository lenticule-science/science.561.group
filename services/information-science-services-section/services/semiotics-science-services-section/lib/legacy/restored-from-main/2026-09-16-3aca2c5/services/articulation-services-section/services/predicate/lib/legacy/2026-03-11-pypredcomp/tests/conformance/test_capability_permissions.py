"""Capability permissions — substrate-action gate conformance.

Pins ``specs/filesystem/capability-permissions.md`` §6 (the v0.2a
binary-cell-emission capability vocabulary) and
``specs/security/capability-model.md`` §3 / §8 (the $\\Rightarrow$
gate at every cell-emitting site, raising
:data:`PCA_SCOPE_INSUFFICIENT` on insufficient authority).

Three substrate-action surfaces are gated in v0.2a:

- ``signal:session-scope:set`` — :func:`storage.paths.set_current_scope`
- ``signal:mount:attach``      — :func:`storage.mounts.attach_mount`
- ``signal:mount:detach``      — :func:`storage.mounts.detach_mount`

Plus ``signal:session-message:<msg-type>`` on
:func:`process.session_messaging.send_message`, which already had
denial coverage in ``test_inter_session_messaging.py`` and is exercised
here only through the shared wildcard discipline.
"""

from __future__ import annotations

import time
from pathlib import Path

import pytest

from process.session import open_session
from process.user import create_user
from security.capabilities import grants, has_any_in_namespace
from storage.event_log import EventLog
from storage.mounts import attach_mount, detach_mount
from storage.paths import set_current_scope
from storage.storage_layout import StorageLayout
from substrate.error_codes import PCA_SCOPE_INSUFFICIENT, SubstrateError


def _boot(tmp_path: Path, caps: list[str]):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    event_log = EventLog(tmp_path)
    event_log.initialize(node_id="t", wall_clock_ns=time.time_ns())
    create_user(
        layout=layout, event_log=event_log, node_id="t",
        slug="user:alice", display_name="Alice",
    )
    sess = open_session(
        layout=layout, event_log=event_log, node_id="t",
        owner="user:alice", capabilities=caps,
    )
    return layout, event_log, sess


# --- wildcard discipline (the algebra used at every gate) -----------------


def test_grants_exact_match():
    assert grants(["signal:mount:attach"], "signal:mount:attach")


def test_grants_token_suffix_wildcard_one_level():
    # signal:mount:* covers signal:mount:attach but not signal:foo:bar.
    assert grants(["signal:mount:*"], "signal:mount:attach")
    assert grants(["signal:mount:*"], "signal:mount:detach")
    assert not grants(["signal:mount:*"], "signal:session-scope:set")


def test_grants_super_grant_covers_everything_under_prefix():
    assert grants(["signal:*"], "signal:mount:attach")
    assert grants(["signal:*"], "signal:session-scope:set")
    assert grants(["signal:*"], "signal:session-message:cmd")
    # But signal:* must not cover other surfaces.
    assert not grants(["signal:*"], "shell:read")


def test_grants_wildcard_only_at_trailing_position():
    # An interior * is treated as a literal token, not a glob.
    assert not grants(["signal:*:attach"], "signal:mount:attach")


def test_grants_empty_needed_denies():
    assert not grants(["signal:*"], "")


def test_grants_no_partial_token_match():
    # signal:mount must NOT cover signal:mount-x:attach (full-token only).
    assert not grants(["signal:mount"], "signal:mount-x:attach")
    assert not grants(["signal:mount:*"], "signal:mountains:foo")


# --- set_current_scope gate ----------------------------------------------


def test_set_current_scope_rejected_without_capability(tmp_path):
    layout, event_log, sess = _boot(tmp_path, caps=["shell:*"])
    with pytest.raises(SubstrateError) as ei:
        set_current_scope(
            layout=layout, event_log=event_log, node_id="t",
            session_slug=sess.slug, scope="scope:engineering",
        )
    assert ei.value.code == PCA_SCOPE_INSUFFICIENT
    assert ei.value.details["needed"] == "signal:session-scope:set"
    assert ei.value.details["sender"] == sess.slug
    assert ei.value.details["owner"] == "user:alice"


def test_set_current_scope_admitted_with_exact_capability(tmp_path):
    layout, event_log, sess = _boot(
        tmp_path, caps=["signal:session-scope:set"],
    )
    cell_id = set_current_scope(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, scope="scope:engineering",
    )
    assert cell_id


def test_set_current_scope_admitted_with_super_grant(tmp_path):
    layout, event_log, sess = _boot(tmp_path, caps=["signal:*"])
    cell_id = set_current_scope(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, scope="scope:engineering",
    )
    assert cell_id


# --- mount attach/detach gates -------------------------------------------


def test_attach_mount_rejected_without_capability(tmp_path):
    layout, event_log, sess = _boot(tmp_path, caps=["shell:*"])
    with pytest.raises(SubstrateError) as ei:
        attach_mount(
            layout=layout, event_log=event_log, node_id="t",
            session_slug=sess.slug, slug="m1",
            source_type="peer", source_ref="peer:p.local",
            local_prefix="remote/p",
        )
    assert ei.value.code == PCA_SCOPE_INSUFFICIENT
    assert ei.value.details["needed"] == "signal:mount:attach"


def test_attach_mount_admitted_with_action_wildcard(tmp_path):
    layout, event_log, sess = _boot(tmp_path, caps=["signal:mount:*"])
    mp = attach_mount(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, slug="m1",
        source_type="peer", source_ref="peer:p.local",
        local_prefix="remote/p",
    )
    assert mp.attached


def test_detach_mount_rejected_with_attach_only_capability(tmp_path):
    """Attach-only authority cannot detach: gates are independent."""
    layout, event_log, sess = _boot(
        tmp_path, caps=["signal:mount:attach"],
    )
    attach_mount(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, slug="m1",
        source_type="peer", source_ref="peer:p.local",
        local_prefix="remote/p",
    )
    with pytest.raises(SubstrateError) as ei:
        detach_mount(
            layout=layout, event_log=event_log, node_id="t",
            session_slug=sess.slug, slug="m1",
        )
    assert ei.value.code == PCA_SCOPE_INSUFFICIENT
    assert ei.value.details["needed"] == "signal:mount:detach"


def test_detach_mount_admitted_with_detach_capability(tmp_path):
    layout, event_log, sess = _boot(
        tmp_path,
        caps=["signal:mount:attach", "signal:mount:detach"],
    )
    attach_mount(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, slug="m1",
        source_type="peer", source_ref="peer:p.local",
        local_prefix="remote/p",
    )
    detach_mount(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, slug="m1",
    )


# --- gate-ordering invariant ---------------------------------------------


def test_capability_denial_emits_no_cells(tmp_path):
    """Cap-check fires before ord-stamp: a denied call adds no events."""
    layout, event_log, sess = _boot(tmp_path, caps=["shell:*"])
    height_before = event_log.height()
    with pytest.raises(SubstrateError):
        set_current_scope(
            layout=layout, event_log=event_log, node_id="t",
            session_slug=sess.slug, scope="scope:engineering",
        )
    with pytest.raises(SubstrateError):
        attach_mount(
            layout=layout, event_log=event_log, node_id="t",
            session_slug=sess.slug, slug="m1",
            source_type="peer", source_ref="peer:p.local",
            local_prefix="remote/p",
        )
    assert event_log.height() == height_before


def test_detach_denial_emits_no_cells(tmp_path):
    """Detach gate-order: denied detach must not advance the log."""
    layout, event_log, sess = _boot(
        tmp_path, caps=["signal:mount:attach"],
    )
    attach_mount(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, slug="m1",
        source_type="peer", source_ref="peer:p.local",
        local_prefix="remote/p",
    )
    height_before_detach = event_log.height()
    with pytest.raises(SubstrateError):
        detach_mount(
            layout=layout, event_log=event_log, node_id="t",
            session_slug=sess.slug, slug="m1",
        )
    assert event_log.height() == height_before_detach


# --- §6.6 namespace-participation surface --------------------------------


def test_has_any_in_namespace_specific_cap_qualifies():
    assert has_any_in_namespace(
        ["signal:session-message:query"], "signal:session-message",
    )


def test_has_any_in_namespace_action_wildcard_qualifies():
    assert has_any_in_namespace(
        ["signal:session-message:*"], "signal:session-message",
    )


def test_has_any_in_namespace_super_grant_qualifies():
    # signal:* lies above the namespace and covers it.
    assert has_any_in_namespace(["signal:*"], "signal:session-message")


def test_has_any_in_namespace_unrelated_caps_do_not_qualify():
    assert not has_any_in_namespace(
        ["shell:*", "audit:read"], "signal:session-message",
    )
    # Tokens, not characters: signal:session-message-x:* is a different
    # namespace and must not qualify for signal:session-message.
    assert not has_any_in_namespace(
        ["signal:session-message-x:*"], "signal:session-message",
    )


def test_has_any_in_namespace_empty_namespace_denies():
    assert not has_any_in_namespace(["signal:*"], "")
