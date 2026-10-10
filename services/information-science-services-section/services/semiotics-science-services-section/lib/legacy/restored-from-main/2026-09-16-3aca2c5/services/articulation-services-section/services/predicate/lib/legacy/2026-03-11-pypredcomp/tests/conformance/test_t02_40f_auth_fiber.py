"""Conformance — auth-fiber projection fixture (`t02-40f`).

Pairs with [`task:t02-40`](../../docs/dev/tasks/engineering/t02-40-v0.2a-kernel-frozen.md)
per [decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

The auth fiber is the projection that answers *who is this sender*. Per
[specs/security/user-as-boundary.md](../../docs/dev/specs/security/user-as-boundary.md)
§2.1, it indexes the boundary's recognised credentials. The v0.2 minimum
shape is a bearer-token-hash projection materialised on the convenience
``User`` record by :mod:`process.user`; the canonical *projection cell*
``(user:<slug>, projects-auth-fiber) = TRUE`` is emitted onto the
boundary entity's fiber by :func:`init_boot.bootstrap_users` per
[boot-sequence.md §4.1](../../docs/dev/specs/init-boot/boot-sequence.md).

The four legs map directly onto t02-40's load-bearing acceptance items:

* **Auth-projection cell**
  (``test_bootstrapped_user_carries_auth_projection_cell``) — pins the
  ``projects-auth-fiber`` cell on every bootstrapped user's boundary
  entity per [decisions/identity-is-boundary-projection.md](../../docs/dev/decisions/identity-is-boundary-projection.md).
  This is the projection-of-the-four claim isolated to the auth slice.

* **Successful sender resolution**
  (``test_bearer_token_resolves_to_provisioned_user``) — pins the
  bearer-token round-trip: the plaintext token returned by
  :func:`init_boot.bootstrap_users.ensure_users_from_manifest` resolves
  via :func:`process.user.authenticate` to the same provisioned
  ``user:<slug>``, and the token's SHA-256 hash matches the User
  record's ``token_hash``.

* **Failed sender resolution surfaces PCM_AUTH_FAILED**
  (``test_unknown_bearer_token_raises_pcm_auth_failed``) — pins the
  failure path: an unrecognised token raises
  :data:`substrate.error_codes.PCM_AUTH_FAILED` and writes nothing to
  the event log. This is the gate-ordering invariant for the auth
  surface — failed authentication must NOT advance state.

* **Byte-identical replay**
  (``test_auth_fiber_emission_replays_byte_identical``) — two fresh
  substrates running the same bootstrap manifest produce
  byte-identical event logs, including the auth-projection cell. Same
  determinism pinning as the umbrella ``t02-34f``.
"""

from __future__ import annotations

import hashlib
from pathlib import Path

from init_boot.bootstrap_users import (
    BootstrapManifest,
    BootstrapUserEntry,
    ensure_users_from_manifest,
)
from process import session as session_mod
from process.user import authenticate, get_user
from storage.event_log import EVENT_LOG_FILENAME, EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCM_AUTH_FAILED, SubstrateError


_NODE_ID = "test-node"
_ADMIN_SLUG = "user:captain"
_MEMBER_SLUG = "user:alice"
_OBSERVER_SLUG = "user:bob"


# ---------------------------------------------------------------------------
# Deterministic session-slug source — same shape as t02-30f
# ---------------------------------------------------------------------------


class _DeterministicSecrets:
    def __init__(self) -> None:
        self._n = 0

    def token_hex(self, n: int) -> str:
        self._n += 1
        return f"{self._n:016x}"

    def token_urlsafe(self, nbytes: int) -> str:
        self._n += 1
        return f"det-token-{self._n:016x}"


# ---------------------------------------------------------------------------
# Fixture builders
# ---------------------------------------------------------------------------


def _three_role_manifest() -> BootstrapManifest:
    """One user per role — exercises the auth projection across all roles.

    The auth fiber is role-orthogonal (every boundary projects it),
    so pinning all three roles in one manifest is the minimum that
    proves the projection is not accidentally role-gated.
    """
    return BootstrapManifest(users=[
        BootstrapUserEntry(slug=_ADMIN_SLUG,    display_name="Captain", role="admin"),
        BootstrapUserEntry(slug=_MEMBER_SLUG,   display_name="Alice",   role="member"),
        BootstrapUserEntry(slug=_OBSERVER_SLUG, display_name="Bob",     role="observer"),
    ])


def _provision(root: Path) -> tuple[StorageLayout, EventLog, dict[str, str]]:
    """Open layout + log + provision the manifest. Returns plaintext tokens."""
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id=_NODE_ID)
    result = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id=_NODE_ID,
        manifest=_three_role_manifest(),
    )
    return layout, log, result.tokens


# ---------------------------------------------------------------------------
# Leg 1 — auth-projection cell on every bootstrapped user
# ---------------------------------------------------------------------------


def test_bootstrapped_user_carries_auth_projection_cell(tmp_path):
    """Every bootstrapped user's boundary fiber carries ``projects-auth-fiber``.

    Pins identity-is-boundary-projection.md and boot-sequence.md §4.1
    for the auth slice: the bootstrap routine emits the canonical
    ``projects-auth-fiber`` cell for every user, regardless of role.
    A regression that dropped the auth projection (or made it
    role-gated) would be the single named hypothesis on test.
    """
    layout, _log, _tokens = _provision(tmp_path)

    # Identity cells (kind-user / projects-*-fiber / role-* / granted:*)
    # land on the boundary surface — see init_boot.bootstrap_users module
    # docstring + decisions/personnel-migration-sequenced-before-bootstrap-users.md.
    for slug in (_ADMIN_SLUG, _MEMBER_SLUG, _OBSERVER_SLUG):
        boundary_slug = "boundary:" + slug.split(":", 1)[1]
        fiber = layout.get_fiber(boundary_slug) or {}
        predicates = fiber.get("predicates", {})
        assert predicates.get("projects-auth-fiber") == BilatticeValue.TRUE.value, (
            f"missing projects-auth-fiber cell on {boundary_slug}; "
            f"have: {sorted(predicates)}"
        )


# ---------------------------------------------------------------------------
# Leg 2 — successful sender resolution
# ---------------------------------------------------------------------------


def test_bearer_token_resolves_to_provisioned_user(tmp_path):
    """The plaintext bearer token round-trips through ``authenticate``.

    Pins the v0.2 auth-fiber path per
    [specs/security/user-as-boundary.md](../../docs/dev/specs/security/user-as-boundary.md)
    §2.1: the bearer token returned at provision time resolves back to
    the same ``user:<slug>`` via :func:`process.user.authenticate`,
    and its SHA-256 hash matches the persisted User record's
    ``token_hash``. This is the *who is this sender* claim of the
    auth fiber in load-bearing form.
    """
    layout, _log, tokens = _provision(tmp_path)

    # Every provisioned user got a plaintext token.
    assert set(tokens) == {_ADMIN_SLUG, _MEMBER_SLUG, _OBSERVER_SLUG}

    for slug, token in tokens.items():
        resolved = authenticate(layout, token)
        assert resolved.slug == slug, (
            f"token for {slug!r} authenticated as {resolved.slug!r}"
        )
        # Belt-and-braces: the persisted token_hash matches the
        # SHA-256 of the plaintext we were handed at provision time.
        # We compute the hash *here* with stdlib rather than calling
        # process.user._hash_token so the assertion is independent of
        # the implementation it verifies (per t02-40f code review).
        persisted = get_user(layout, slug)
        expected_hash = hashlib.sha256(token.encode("utf-8")).hexdigest()
        assert persisted.token_hash == expected_hash, (
            f"persisted token_hash for {slug} differs from sha256 of "
            f"the provisioning-time plaintext token"
        )


# ---------------------------------------------------------------------------
# Leg 3 — failed sender resolution: PCM_AUTH_FAILED, no state advance
# ---------------------------------------------------------------------------


def test_unknown_bearer_token_raises_pcm_auth_failed(tmp_path):
    """An unrecognised token raises ``PCM_AUTH_FAILED`` with no event emitted.

    The gate-ordering invariant for the auth surface: failed
    authentication MUST raise :data:`PCM_AUTH_FAILED` from
    :func:`process.user.authenticate` and MUST NOT advance the event
    log. An implementation that emitted a denied-attempt event on
    auth failure would pass a code-only check but fail this leg —
    same ratifying-fixture failure mode as t02-30f leg 4.
    """
    layout, log, _tokens = _provision(tmp_path)
    height_before = log.height()

    denied: SubstrateError | None = None
    try:
        authenticate(layout, "this-token-was-never-provisioned")
    except SubstrateError as e:
        denied = e

    assert denied is not None, (
        "authenticate() unexpectedly succeeded for an unknown token"
    )
    assert denied.code == PCM_AUTH_FAILED, (
        f"unknown-token denial code was {denied.code!r}, "
        f"expected PCM_AUTH_FAILED"
    )

    # Load-bearing: the failed authentication advanced the event log
    # by exactly zero events.
    assert log.height() == height_before, (
        f"failed authenticate() advanced the event log "
        f"({height_before} -> {log.height()})"
    )


# ---------------------------------------------------------------------------
# Leg 4 — byte-identical replay of the bootstrap → auth-fiber emission
# ---------------------------------------------------------------------------


def test_auth_fiber_emission_replays_byte_identical(tmp_path, monkeypatch):
    """Two fresh substrates produce byte-identical event logs after bootstrap.

    The bootstrap routine's auth-fiber emission must be deterministic —
    a determinism bug here would re-surface as a divergence in
    fiber_reconcile per recipe 6 of implementation/workflows.md. The
    only non-determinism source on the bootstrap path is the bearer
    token generated by :mod:`process.user.create_user` via the
    ``secrets`` module; we monkeypatch that source on both runs to a
    deterministic counter so the emitted ``provisioned`` cells (and
    thus the persisted token_hash echoed on the User record) match.

    Note: ``process.user`` imports ``secrets`` directly, so we
    monkeypatch the symbol on that module rather than on
    ``process.session`` (the t02-30f target) — a deterministic-token
    source is the right knob for the bootstrap path.
    """
    from process import user as user_mod

    root_a = tmp_path / "run-a"
    root_b = tmp_path / "run-b"

    monkeypatch.setattr(user_mod, "secrets", _DeterministicSecrets())
    layout_a, log_a, _ta = _provision(root_a)

    monkeypatch.setattr(user_mod, "secrets", _DeterministicSecrets())
    layout_b, log_b, _tb = _provision(root_b)

    bytes_a = (root_a / EVENT_LOG_FILENAME).read_bytes()
    bytes_b = (root_b / EVENT_LOG_FILENAME).read_bytes()
    assert bytes_a == bytes_b, (
        f"event-log divergence at byte "
        f"{next((i for i, (x, y) in enumerate(zip(bytes_a, bytes_b)) if x != y), min(len(bytes_a), len(bytes_b)))}; "
        f"len(a)={len(bytes_a)} len(b)={len(bytes_b)}"
    )

    # Sanity: the logs grew (the bootstrap actually emitted events).
    assert log_a.height() > 5
    assert log_a.height() == log_b.height()
