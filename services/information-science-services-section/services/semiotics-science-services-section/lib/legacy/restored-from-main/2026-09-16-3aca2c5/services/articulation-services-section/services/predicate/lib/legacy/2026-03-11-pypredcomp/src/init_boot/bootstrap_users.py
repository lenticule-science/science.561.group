"""Bootstrap-users — manifest-driven multi-user provisioning at boot.

Per [`specs/init-boot/boot-sequence.md`](../../docs/dev/specs/init-boot/boot-sequence.md) §4.1,
[`specs/init-boot/bootstrap-manifest.md`](../../docs/dev/specs/init-boot/bootstrap-manifest.md)
(canonical schema + hashing recipe), and
[`decisions/identity-is-boundary-projection.md`](../../docs/dev/decisions/identity-is-boundary-projection.md):

A user is a boundary entity that projects four canonical fibers — auth,
authz, attention, history. The bootstrap routine reads a deployment
manifest and provisions each entry across **two surfaces**, exactly
mirroring the ``init_boot.personnel_migration`` pattern that pt-08
established for v0.1 personnel records:

* ``user:<bare>`` — the **manifest / auth-record / file-cache surface**.
  Carries the convenience :class:`process.user.User` record at
  ``$ROOT/users/user_<bare>.json`` (slug, display name, bcrypt token
  digest, capability list) and the audit cell
  ``(user:<bare>, provisioned) = t`` emitted by
  :func:`process.user.create_user`. Manifest entries, ``tokens`` dict
  keys, :class:`BootstrapResult` slug fields, and
  :func:`process.user.authenticate`'s returned ``User.slug`` all live
  on this surface.

* ``boundary:<bare>`` — the **substrate identity surface**. Carries the
  boundary entity's kind cell + four canonical projection cells + role
  + per-capability grants. This is the universe pt-08's
  ``personnel_migration`` migrates v0.1 ``personnel:*`` records into;
  per [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../../docs/dev/decisions/personnel-migration-sequenced-before-bootstrap-users.md)
  the substrate must hold a *single* identity universe at the time
  bootstrap-users runs, so manifest-provisioned users land on the same
  ``boundary:<bare>`` surface as migrated personnel.

Per manifest entry, the routine emits:

1. The auth-record cache + audit cell on the user surface (via
   :func:`process.user.create_user`, which asserts
   ``(user:<bare>, provisioned) = t``).
2. The boundary kind cell ``(boundary:<bare>, kind-user) = t``.
3. One projection cell per canonical fiber:
   ``(boundary:<bare>, projects-<name>-fiber) = t`` for name in
   {auth, authz, attention, history}.
4. The role assignment ``(boundary:<bare>, role-<role>) = t``.
5. Per-capability grants ``(boundary:<bare>, granted:<cap>) = t``.

The deployment's manifest hash is recorded as
``(deployment, bootstrap-user-manifest-hash:<hex>) = t`` so that
re-bootstrap with a different manifest is detectable on subsequent boot.

Re-boot against an existing log:
- If the manifest hash matches the latest recorded hash → no-op.
- If the manifest hash differs → a *changed* event is logged + the new
  hash is recorded. The substrate does NOT modify existing users; user
  lifecycle changes go through ``respond`` per
  [`decisions/single-respond-primitive.md`](../../docs/dev/decisions/single-respond-primitive.md).
  Missing users from the new manifest are provisioned; existing users
  are left untouched.

The encoding flattens the spec's ternary ``(s, p, o) = v`` form into the
substrate's v0.1 unary ``(s, p) = v`` cells by inlining the o-slot into
the predicate string (e.g. ``kind-user`` instead of ``(kind, user)``).
This is a v0.2-pragmatic shim; binary-cell emission per
[`specs/kernel/binary-cell-emission.md`](../../docs/dev/specs/kernel/binary-cell-emission.md)
is its own freeze gate and will eventually carry the proper s≠o form.

Backcompat: :func:`ensure_default_captain` is preserved and now wraps
:func:`ensure_users_from_manifest` with the default single-captain
manifest, plus the existing token-to-disk side-effect.
"""

from __future__ import annotations

import hashlib
import json
import logging
import os
from pathlib import Path
from typing import Any, Literal

from pydantic import BaseModel, ConfigDict, Field, ValidationError, field_validator, model_validator

from process.user import create_user, get_user, list_users
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.canonicalization import canonical
from substrate.error_codes import PCM_PAYLOAD_INVALID, SubstrateError
from substrate.stdlib import assert_cell

log = logging.getLogger("substrate.bootstrap")

_TOKEN_FILE_ENV = "SUBSTRATE_CAPTAIN_TOKEN_FILE"
_MANIFEST_ENV = "SUBSTRATE_BOOTSTRAP_MANIFEST"

# Per spec §4.1 — the four canonical projection fibers per user.
CANONICAL_FIBERS: tuple[str, ...] = ("auth", "authz", "attention", "history")

#: Manifest / auth-record / file-cache surface (``user:<bare>``).
USER_PREFIX = "user:"

#: Substrate identity surface (``boundary:<bare>``) — same universe pt-08's
#: ``personnel_migration`` lands migrated v0.1 personnel records on, per
#: decisions/personnel-migration-sequenced-before-bootstrap-users.md.
BOUNDARY_PREFIX = "boundary:"


def _user_to_boundary(user_slug: str) -> str:
    """Translate a manifest ``user:<bare>`` slug to its ``boundary:<bare>`` form.

    Mirrors the ``personnel:<slug> → boundary:<slug>`` translation
    ``init_boot.personnel_migration`` performs (see its module docstring +
    ``BOUNDARY_PREFIX``) — the two routines must agree on the boundary
    surface so a personnel record migrated by pt-08 and a manifest entry
    processed by pt-08-multi-user land on the *same* ``boundary:<bare>``
    entity.
    """
    if not user_slug.startswith(USER_PREFIX):
        raise ValueError(
            f"bootstrap_users: expected manifest slug with {USER_PREFIX!r} "
            f"prefix, got {user_slug!r}"
        )
    return BOUNDARY_PREFIX + user_slug[len(USER_PREFIX):]

# Role → capability scopes. Conservative defaults; deployments override
# by listing explicit caps on the manifest entry (which we union with
# the role default).
ROLE_CAPABILITIES: dict[str, list[str]] = {
    "admin":    ["respond:*", "shell:*", "runlevel:*", "audit:*", "signal:*"],
    "member":   ["respond:*", "shell:read", "shell:write",
                 "signal:session-scope:set", "signal:session-message:*"],
    "observer": ["shell:read", "audit:read"],
}

Role = Literal["admin", "member", "observer"]


class BootstrapUserEntry(BaseModel):
    """One user in the deployment manifest.

    Per `specs/init-boot/bootstrap-manifest.md` §2.2 the schema is closed:
    unknown keys are rejected, ``slug`` MUST start with ``user:``, ``role``
    MUST be one of admin/member/observer.
    """

    model_config = ConfigDict(extra="forbid")

    slug: str = Field(description="Must start with 'user:'.")
    display_name: str
    role: Role
    capabilities: list[str] = Field(
        default_factory=list,
        description="Extra capabilities unioned with the role default.",
    )

    @field_validator("slug")
    @classmethod
    def _slug_has_user_prefix(cls, v: str) -> str:
        if not v.startswith("user:"):
            raise ValueError(
                f"slug {v!r} must start with 'user:' per "
                "specs/init-boot/bootstrap-manifest.md §2.1"
            )
        if v == "user:":
            raise ValueError("slug 'user:' has empty local part")
        return v


class BootstrapManifest(BaseModel):
    """A deployment's bootstrap-user set.

    Per `specs/init-boot/bootstrap-manifest.md` §2.2: closed schema; user
    slugs MUST be unique within one manifest.
    """

    model_config = ConfigDict(extra="forbid")

    users: list[BootstrapUserEntry]

    @model_validator(mode="after")
    def _slugs_unique(self) -> BootstrapManifest:
        seen: set[str] = set()
        dupes: list[str] = []
        for u in self.users:
            if u.slug in seen:
                dupes.append(u.slug)
            seen.add(u.slug)
        if dupes:
            raise ValueError(
                f"duplicate user slug(s) in manifest: {sorted(set(dupes))} "
                "per specs/init-boot/bootstrap-manifest.md §2.2"
            )
        return self


class BootstrapResult(BaseModel):
    """Summary of a bootstrap-users invocation."""

    model_config = ConfigDict(extra="forbid")

    manifest_hash: str
    prior_manifest_hash: str | None
    manifest_changed: bool
    created_slugs: list[str]
    existing_slugs: list[str]
    tokens: dict[str, str] = Field(
        default_factory=dict,
        description="Plaintext bearer tokens for newly-created users. "
                    "Caller is responsible for delivery; not persisted.",
    )


# ---------------------------------------------------------------------------
# Manifest hashing + discovery
# ---------------------------------------------------------------------------


def canonical_manifest_payload(manifest: BootstrapManifest) -> dict[str, Any]:
    """The canonical-form dict per `specs/init-boot/bootstrap-manifest.md` §3.

    Users sorted lexicographically by slug; capabilities sorted within
    each user; one canonical key set per entry. The dict round-trips
    byte-identically through :func:`substrate.canonicalization.canonical`
    regardless of input ordering.
    """
    return {
        "users": sorted(
            (
                {
                    "slug": u.slug,
                    "display_name": u.display_name,
                    "role": u.role,
                    "capabilities": sorted(u.capabilities),
                }
                for u in manifest.users
            ),
            key=lambda x: x["slug"],
        )
    }


def canonical_manifest_bytes(manifest: BootstrapManifest) -> bytes:
    """Canonical UTF-8 byte form per `specs/init-boot/bootstrap-manifest.md` §3."""
    return canonical(canonical_manifest_payload(manifest))


def manifest_hash(manifest: BootstrapManifest) -> str:
    """Canonical SHA-256 of the manifest.

    Routed through :func:`substrate.canonicalization.canonical` so the
    byte form matches `specs/kernel/canonicalization.md` exactly:
    ``sort_keys`` + minimal separators + ``ensure_ascii=False`` + UTF-8.
    Cross-implementation byte-identity (Python ↔ Rust) follows from
    sharing this single canonicalization primitive.
    """
    return hashlib.sha256(canonical_manifest_bytes(manifest)).hexdigest()


def default_manifest() -> BootstrapManifest:
    """The fallback single-captain manifest used when no env override is set."""
    return BootstrapManifest(
        users=[
            BootstrapUserEntry(
                slug="user:captain",
                display_name="Captain",
                role="admin",
            )
        ]
    )


def load_manifest_from_env() -> BootstrapManifest:
    """Read ``$SUBSTRATE_BOOTSTRAP_MANIFEST`` (a path to a JSON file) or fall back.

    On a file-read or schema-validation failure we surface
    ``PCM_PAYLOAD_INVALID`` rather than silently using the default —
    a misconfigured manifest is a deployment error, not a fallback case.
    """
    path = os.environ.get(_MANIFEST_ENV)
    if not path:
        return default_manifest()
    p = Path(path)
    if not p.exists():
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"bootstrap manifest not found: {path}",
            env=_MANIFEST_ENV,
            path=path,
        )
    try:
        raw = p.read_text(encoding="utf-8")
        data = json.loads(raw)
        return BootstrapManifest.model_validate(data)
    except (OSError, json.JSONDecodeError, ValidationError) as e:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"bootstrap manifest invalid: {e}",
            env=_MANIFEST_ENV,
            path=path,
        ) from e


# ---------------------------------------------------------------------------
# Prior-hash lookup — walks the event log for the latest recorded hash.
# ---------------------------------------------------------------------------


_HASH_PREDICATE_PREFIX = "bootstrap-user-manifest-hash:"
_CHANGED_PREDICATE = "bootstrap-user-manifest-changed"


def _read_prior_manifest_hash(layout: StorageLayout, event_log: EventLog) -> str | None:
    """Find the latest recorded manifest hash on the ``deployment`` entity.

    Strategy: the deployment fiber's ``cells_by_predicate`` carries the
    most recent atom-id per predicate; if any predicate name starts
    with ``bootstrap-user-manifest-hash:``, the suffix is a recorded
    hash. When more than one such predicate exists (re-bootstraps with
    different manifests have happened), we walk the event log to pick
    the predicate whose latest assertion has the highest ordinal — the
    semantic "current" manifest.
    """
    fiber = layout.get_fiber("deployment") or {}
    cbp = fiber.get("cells_by_predicate") or {}
    candidates = [
        p for p in cbp
        if p.startswith(_HASH_PREDICATE_PREFIX)
    ]
    if not candidates:
        return None
    if len(candidates) == 1:
        return candidates[0][len(_HASH_PREDICATE_PREFIX):]
    # Multiple recorded hashes — find the one most recently asserted.
    #
    # The deployment fiber's ``cells_by_predicate`` map is keyed by predicate
    # name and valued by the *atom-id* of the most recent cell carrying that
    # predicate; the event log's ``body.cell_id`` is the *snapshot-id* of the
    # respond event's cell record. Atom-id and snapshot-id are different
    # identifier spaces, so we cannot match them directly. Instead we walk the
    # event log, load each respond's snapshot, and check which of our
    # candidate predicates that snapshot asserted; the predicate with the
    # highest event ord is the semantic "current" manifest.
    target_predicates = set(candidates)
    latest_ord = -1
    latest_hash: str | None = None
    for ev in event_log.iter_events():
        if ev.get("kind") != "respond":
            continue
        body = ev.get("body") or {}
        if body.get("target") != "deployment":
            continue
        cell_id = body.get("cell_id")
        if not isinstance(cell_id, str):
            continue
        try:
            snap = layout.get_record("cells", cell_id)
        except Exception:
            continue
        # Use the per-snapshot ``cells`` atom delta — what THIS respond
        # actually authored — not the top-level ``predicates`` map, which
        # carries the full fiber state at snapshot time and would also
        # contain every prior recorded hash, making "most recent" undefined.
        snap_preds: set[str] = {
            atom["p"] for atom in (snap.get("cells") or [])
            if isinstance(atom.get("p"), str)
        }
        matching = snap_preds & target_predicates
        if not matching:
            continue
        ord_ = int(ev.get("ord", 0))
        if ord_ > latest_ord:
            latest_ord = ord_
            # Each emission asserts exactly one hash predicate — pick it.
            latest_hash = next(iter(matching))[len(_HASH_PREDICATE_PREFIX):]
    return latest_hash


# ---------------------------------------------------------------------------
# Cell emission — per-user fiber projection + capability grants.
# ---------------------------------------------------------------------------


def _resolve_capabilities(entry: BootstrapUserEntry) -> list[str]:
    """Role-default ∪ entry-extra, deterministically sorted."""
    base = ROLE_CAPABILITIES.get(entry.role, [])
    return sorted(set(base) | set(entry.capabilities))


def _current_predicates(layout: StorageLayout, slug: str) -> dict[str, BilatticeValue]:
    """Snapshot of the entity's current predicate values from its fiber cache."""
    fiber = layout.get_fiber(slug) or {}
    return {
        k: BilatticeValue(v) for k, v in (fiber.get("predicates") or {}).items()
    }


def _assert_if_changed(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    cur: dict[str, BilatticeValue],
    s: str,
    p: str,
    v: BilatticeValue,
) -> None:
    """``assert_cell`` only when the predicate isn't already at value ``v``.

    Real determinism + log-growth fix: re-running bootstrap on a populated
    store used to call ``respond`` for every per-user predicate even when the
    target value was already True, growing the event log by ~7 events per
    existing user per re-boot. With this skip the log grows by zero events
    on a clean idempotent re-boot — which is what the §4.1 spec describes
    when it says the routine is a no-op on existing event logs.
    """
    if cur.get(p) == v:
        return
    assert_cell(
        layout=layout, event_log=event_log, node_id=node_id,
        s=s, p=p, v=v, sender="system",
    )
    cur[p] = v


def _emit_user_cells(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    entry: BootstrapUserEntry,
) -> None:
    """Emit the per-user kind / fiber / role / capability cells.

    Idempotent at *both* the substrate level and the event-log level: each
    predicate is asserted only when its current value differs from the target
    value (see :func:`_assert_if_changed`). On a clean re-boot every cell is
    already True → zero events appended.

    All identity cells land on the substrate identity surface
    ``boundary:<bare>`` (see module docstring + :func:`_user_to_boundary`).
    The auth-record file cache + ``provisioned`` audit cell on the
    ``user:<bare>`` surface are emitted separately by
    :func:`process.user.create_user`.
    """
    boundary_slug = _user_to_boundary(entry.slug)
    cur = _current_predicates(layout, boundary_slug)
    _assert_if_changed(
        layout=layout, event_log=event_log, node_id=node_id, cur=cur,
        s=boundary_slug, p="kind-user", v=BilatticeValue.TRUE,
    )
    for fiber in CANONICAL_FIBERS:
        _assert_if_changed(
            layout=layout, event_log=event_log, node_id=node_id, cur=cur,
            s=boundary_slug, p=f"projects-{fiber}-fiber", v=BilatticeValue.TRUE,
        )
    _assert_if_changed(
        layout=layout, event_log=event_log, node_id=node_id, cur=cur,
        s=boundary_slug, p=f"role-{entry.role}", v=BilatticeValue.TRUE,
    )
    for cap in _resolve_capabilities(entry):
        _assert_if_changed(
            layout=layout, event_log=event_log, node_id=node_id, cur=cur,
            s=boundary_slug, p=f"granted:{cap}", v=BilatticeValue.TRUE,
        )


def _emit_manifest_hash(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    h: str,
    changed_from: str | None,
) -> None:
    """Record the current manifest hash; if changed, also log the divergence."""
    if changed_from is not None:
        # Note the change FIRST so an interrupted boot leaves an audit trail.
        assert_cell(
            layout=layout, event_log=event_log, node_id=node_id,
            s="deployment", p=_CHANGED_PREDICATE,
            v=BilatticeValue.TRUE, sender="system",
        )
        log.warning(
            "bootstrap: manifest hash changed (was %s, now %s); "
            "existing users left untouched",
            changed_from, h,
        )
    assert_cell(
        layout=layout, event_log=event_log, node_id=node_id,
        s="deployment", p=f"{_HASH_PREDICATE_PREFIX}{h}",
        v=BilatticeValue.TRUE, sender="system",
    )


# ---------------------------------------------------------------------------
# Primary API.
# ---------------------------------------------------------------------------


def ensure_users_from_manifest(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    manifest: BootstrapManifest,
) -> BootstrapResult:
    """Provision the manifest's users idempotently.

    Existing users are left untouched (lifecycle changes go through
    ``respond``); missing users are provisioned with full fiber
    emission. The manifest hash is recorded; a changed manifest is
    detected and logged.
    """
    h = manifest_hash(manifest)
    prior = _read_prior_manifest_hash(layout, event_log)
    changed = prior is not None and prior != h

    existing = {u.slug for u in list_users(layout)}
    created_slugs: list[str] = []
    tokens: dict[str, str] = {}

    # Provisioning order is deterministic (sorted by slug) so events
    # land in a fixed sequence across implementations.
    for entry in sorted(manifest.users, key=lambda e: e.slug):
        if entry.slug in existing:
            # User already on disk — re-emit cells (idempotent at the
            # closure level) so a partially-provisioned boot heals.
            _emit_user_cells(
                layout=layout, event_log=event_log,
                node_id=node_id, entry=entry,
            )
            continue
        _, token = create_user(
            layout=layout, event_log=event_log, node_id=node_id,
            slug=entry.slug, display_name=entry.display_name,
            capabilities=_resolve_capabilities(entry),
        )
        _emit_user_cells(
            layout=layout, event_log=event_log,
            node_id=node_id, entry=entry,
        )
        created_slugs.append(entry.slug)
        tokens[entry.slug] = token

    # Record the hash exactly once per boot — but only when something
    # has changed, OR no prior hash exists (first boot for this manifest).
    if prior is None or changed:
        _emit_manifest_hash(
            layout=layout, event_log=event_log, node_id=node_id,
            h=h, changed_from=prior if changed else None,
        )

    return BootstrapResult(
        manifest_hash=h,
        prior_manifest_hash=prior,
        manifest_changed=changed,
        created_slugs=created_slugs,
        existing_slugs=sorted(existing),
        tokens=tokens,
    )


# ---------------------------------------------------------------------------
# Backcompat — single-captain default with token-to-disk side-effect.
# ---------------------------------------------------------------------------


def persist_captain_token(token: str) -> None:
    """Side-effect: deliver the captain bearer token out-of-band.

    Writes to ``$SUBSTRATE_CAPTAIN_TOKEN_FILE`` if set (mode 0o600,
    parents created), otherwise logs at WARNING. Empty tokens are a
    no-op so callers can pass ``result.tokens.get("user:captain", "")``
    unconditionally. Per
    ``specs/init-boot/boot-sequence.md`` §4.1 the token is delivered
    once and the substrate retains only its bcrypt digest.
    """
    if not token:
        return
    token_file = os.environ.get(_TOKEN_FILE_ENV)
    if token_file:
        token_path = Path(token_file)
        token_path.parent.mkdir(parents=True, exist_ok=True)
        token_path.write_text(token + "\n", encoding="utf-8")
        try:
            os.chmod(token_path, 0o600)
        except OSError:
            pass
        log.warning(
            "bootstrap: provisioned user:captain; token written to %s "
            "(read once, then delete the file)",
            token_path,
        )
    else:
        log.warning(
            "bootstrap: provisioned user:captain; CAPTAIN-TOKEN=%s "
            "(capture this NOW; set %s to also persist to a file)",
            token, _TOKEN_FILE_ENV,
        )


def ensure_default_captain(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
) -> tuple[str, bool]:
    """Provision ``user:captain`` if no users exist (legacy entry point).

    Preserved for callers that haven't migrated to manifest-driven
    bootstrap. Returns ``(slug, created)``; ``created`` is True only
    when the captain did not already exist. The plaintext token is
    delivered via :func:`persist_captain_token`.

    The boot-phase default path no longer invokes this; it calls
    :func:`ensure_users_from_manifest` directly with
    :func:`default_manifest` and then :func:`persist_captain_token`,
    so telemetry (``created_slugs``, ``manifest_changed``) reflects
    the real first-boot effect.
    """
    if list_users(layout):
        return "user:captain", False

    result = ensure_users_from_manifest(
        layout=layout, event_log=event_log, node_id=node_id,
        manifest=default_manifest(),
    )
    persist_captain_token(result.tokens.get("user:captain", ""))
    return "user:captain", True
