"""User — the OS's boundary identity record.

Per ``specs/security/user-as-boundary.md`` (v0.2) and
``decisions/identity-is-boundary-projection.md``: a user is **not** a
row in a users table — it is a *boundary entity* that projects four
canonical fibers onto the substrate's surface (auth, authz, attention,
history). Per [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../../docs/dev/decisions/personnel-migration-sequenced-before-bootstrap-users.md)
the substrate holds a *single* identity universe at the moment
bootstrap-users runs, so the boundary entity for a manifest user with
slug ``user:<bare>`` is ``boundary:<bare>`` — the same surface
:mod:`init_boot.personnel_migration` lands migrated v0.1 personnel
records on. The convenience record persisted by this module
(``User``: slug, display name, token hash, capabilities) is the
auth-fiber **cache** materialised for the bearer-token authentication
path; the four canonical projection cells
(``projects-auth-fiber``, ``projects-authz-fiber``,
``projects-attention-fiber``, ``projects-history-fiber``), the
``kind-user`` cell, the ``role-<role>`` cell, and the per-capability
``granted:<cap>`` cells are emitted on the ``boundary:<bare>`` surface
by :mod:`init_boot.bootstrap_users` per
``specs/init-boot/boot-sequence.md`` §4.1, so every substrate cell
ultimately traces to a boundary the bootstrap routine declared.

Authentication is bearer-token; tokens never leave memory unhashed
once provisioned.

Users are also recorded as substrate cells: :func:`create_user`
asserts ``(user:<bare>, provisioned) = t`` on the user/auth-record
surface (an audit marker that the auth-record cache was created), so
the event log is the source of truth for who exists; the
``$ROOT/users/<safe>.json`` files are convenience caches over the cell
store, like fibers are. Identity authority — role, capability grants,
projection witnesses — lives on ``boundary:<bare>``, NEVER on the
``user:<bare>`` audit surface.

The history-fiber projection — the audit-side companion to authz
(write) and attention (read) — is materialised on demand from the
event log by :mod:`process.history_fiber`, which filters every event
by ``body.sender == user:<slug>``. Per row 12 of
``references/theory-for-developers.md`` the projection is
*recomputable from history, never authoritative against history*; no
cache file is persisted at v0.2a.
"""

from __future__ import annotations

import hashlib
import secrets
from typing import Any

from pydantic import BaseModel, ConfigDict, Field

from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import (
    PCM_AUTH_FAILED,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)
from substrate.stdlib import assert_cell


class User(BaseModel):
    """A boundary identity. ``token_hash`` is SHA-256 of the bearer token."""

    model_config = ConfigDict(extra="forbid")

    slug: str = Field(description="lower-kebab slug; must start with 'user:'")
    display_name: str
    token_hash: str
    capabilities: list[str] = Field(default_factory=list)


def _users_dir(layout: StorageLayout):
    return layout.root / "users"


def _user_path(layout: StorageLayout, slug: str):
    safe = slug.replace(":", "_").replace("/", "_")
    return _users_dir(layout) / f"{safe}.json"


def _hash_token(token: str) -> str:
    return hashlib.sha256(token.encode("utf-8")).hexdigest()


def create_user(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    slug: str,
    display_name: str,
    token: str | None = None,
    capabilities: list[str] | None = None,
) -> tuple[User, str]:
    """Provision a new user. Returns ``(user, plaintext_token)``.

    The plaintext token is returned ONCE; only its hash is persisted.
    """
    if not slug.startswith("user:"):
        raise SubstrateError(
            PCM_AUTH_FAILED,
            f"user slug must begin with 'user:', got {slug!r}",
        )
    if token is None:
        token = secrets.token_urlsafe(32)
    user = User(
        slug=slug,
        display_name=display_name,
        token_hash=_hash_token(token),
        capabilities=list(capabilities or []),
    )
    # Audit trail: every user creation is a substrate event.
    assert_cell(
        layout=layout,
        event_log=event_log,
        node_id=node_id,
        s=slug,
        p="provisioned",
        v=BilatticeValue.TRUE,
        sender="system",
    )
    _users_dir(layout).mkdir(parents=True, exist_ok=True)
    _user_path(layout, slug).write_text(user.model_dump_json())
    return user, token


def get_user(layout: StorageLayout, slug: str) -> User:
    p = _user_path(layout, slug)
    if not p.exists():
        raise SubstrateError(
            PCS_RECORD_NOT_FOUND,
            f"no user {slug!r}",
            slug=slug,
        )
    return User.model_validate_json(p.read_text())


def authenticate(layout: StorageLayout, token: str) -> User:
    """Resolve a bearer token to a user. Raises ``PCM_AUTH_FAILED`` on miss."""
    th = _hash_token(token)
    d = _users_dir(layout)
    if not d.exists():
        raise SubstrateError(PCM_AUTH_FAILED, "no users provisioned")
    for f in sorted(d.iterdir()):
        if f.suffix != ".json":
            continue
        try:
            u = User.model_validate_json(f.read_text())
        except Exception:
            continue
        if u.token_hash == th:
            return u
    raise SubstrateError(PCM_AUTH_FAILED, "invalid token")


def list_users(layout: StorageLayout) -> list[User]:
    d = _users_dir(layout)
    if not d.exists():
        return []
    out: list[User] = []
    for f in sorted(d.iterdir()):
        if f.suffix != ".json":
            continue
        try:
            out.append(User.model_validate_json(f.read_text()))
        except Exception:
            continue
    return out
