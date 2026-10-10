"""Capability-fiber gate for v0.2a session-issued substrate actions.

Per ``specs/security/capability-model.md`` §3 (the capability check
via $\\Rightarrow$) and ``specs/filesystem/capability-permissions.md``
§6 (the v0.2a action-capability vocabulary). Every binary-cell-emission
site that authors substrate state on behalf of a session passes the
sender's open ``Session`` and the *needed* capability slug through
:func:`require_capability` before the cell is stamped with an event-
ordinal.

The v0.2a slice is deliberately narrow: capabilities are stored as
plain slugs on :class:`process.session.Session` and matched by an
fnmatch-style suffix-wildcard discipline (an exact slug, a tail
``*`` extending the matched prefix by any number of ``:``-separated
tokens, or the substrate super-grant ``signal:*``). The full
$\\Rightarrow$ algebra against per-cell capability fibers is the
v0.4 federation slice's job; until then, this module is the single
authoritative place that gates substrate-side action authority.

Failure mode: ``PCA_SCOPE_INSUFFICIENT`` per
``specs/security/capability-model.md`` §8, with ``sender`` and
``needed`` fields on the :class:`SubstrateError` for the partial
repair log.
"""

from __future__ import annotations

from process.session import Session
from substrate.error_codes import PCA_SCOPE_INSUFFICIENT, SubstrateError


def grants(holder_caps: list[str] | set[str], needed: str) -> bool:
    """Return ``True`` iff any cap in ``holder_caps`` covers ``needed``.

    Wildcard rules (token-suffix wildcard on ``:``):

    - An exact match (``signal:mount:attach`` covers itself) wins.
    - A trailing ``*`` token covers every suffix at that position
      (``signal:mount:*`` covers ``signal:mount:attach`` and
      ``signal:mount:detach``; ``signal:*`` covers every signal).
    - Wildcards anywhere except the trailing position are not
      recognised — operators write the explicit suffix.

    The ``signal:*`` super-grant is therefore the special case of the
    general rule, not a hardcoded short-circuit.
    """
    if not needed:
        return False
    needed_tokens = needed.split(":")
    for cap in holder_caps:
        if cap == needed:
            return True
        cap_tokens = cap.split(":")
        if not cap_tokens or cap_tokens[-1] != "*":
            continue
        prefix = cap_tokens[:-1]
        if len(prefix) > len(needed_tokens):
            continue
        if needed_tokens[: len(prefix)] == prefix:
            return True
    return False


def has_any_in_namespace(
    holder_caps: list[str] | set[str], namespace: str,
) -> bool:
    """Return ``True`` iff the holder carries any grant in ``namespace``.

    The membership-in-namespace check is the dual question to
    :func:`grants`: ``grants`` asks "do you hold authority for THIS
    needed slug?", while ``has_any_in_namespace`` asks "do you
    participate in this surface AT ALL?". Both share the same
    token-aligned wildcard discipline.

    The participation surface gates inbox-read and mark-read in
    ``process/session_messaging.py`` per
    ``capability-permissions.md`` §6.6: those operations don't carry
    a per-call msg-type, so they admit any session that holds at
    least one ``signal:session-message:<...>`` grant (specific,
    action-wildcard, or super-grant).

    A held cap qualifies iff:

    - it equals ``namespace`` exactly;
    - it starts with ``namespace + ':'`` (any specific or wildcard
      grant beneath the namespace);
    - it is a trailing-``*`` wildcard whose preceding tokens are a
      prefix of ``namespace``'s tokens (a higher wildcard that
      covers everything in the namespace).
    """
    if not namespace:
        return False
    ns_tokens = namespace.split(":")
    suffix = namespace + ":"
    for cap in holder_caps:
        if cap == namespace or cap.startswith(suffix):
            return True
        cap_tokens = cap.split(":")
        if not cap_tokens or cap_tokens[-1] != "*":
            continue
        prefix = cap_tokens[:-1]
        if len(prefix) <= len(ns_tokens) and ns_tokens[: len(prefix)] == prefix:
            return True
    return False


def require_capability(sess: Session, needed: str) -> None:
    """Raise ``PCA_SCOPE_INSUFFICIENT`` when ``sess`` lacks ``needed``.

    The check is a pure function over the session's frozen capability
    list — capability-fiber re-derivation on add/revoke
    (``capability-model.md`` §2) is the v0.4 surface. For v0.2a the
    open-time list is the authoritative gate.
    """
    if grants(sess.capabilities, needed):
        return
    raise SubstrateError(
        PCA_SCOPE_INSUFFICIENT,
        f"sender session {sess.slug!r} lacks {needed!r}",
        sender=sess.slug,
        owner=sess.owner,
        needed=needed,
    )


# v0.2a substrate-action capability vocabulary. Per
# ``specs/filesystem/capability-permissions.md`` §6 these are the
# capabilities that gate session-issued binary-cell emission. They
# follow the ``signal:<surface>:<action>`` shape (matching
# ``signal:session-message:<msg-type>`` in
# ``process/session_messaging.py``).
SIGNAL_SESSION_SCOPE_SET = "signal:session-scope:set"
SIGNAL_MOUNT_ATTACH = "signal:mount:attach"
SIGNAL_MOUNT_DETACH = "signal:mount:detach"
SIGNAL_SNAPSHOT_RECORD = "signal:snapshot:record"


__all__ = [
    "grants",
    "has_any_in_namespace",
    "require_capability",
    "SIGNAL_SESSION_SCOPE_SET",
    "SIGNAL_MOUNT_ATTACH",
    "SIGNAL_MOUNT_DETACH",
    "SIGNAL_SNAPSHOT_RECORD",
]
