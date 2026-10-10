"""REPL — command parser + dispatcher.

Per ``specs/shell/repl.md`` (v0.2): a command is a verb followed by
positional or kw=value args, optionally piped (``|``) into a downstream
verb. Verbs map to :mod:`substrate.stdlib` and the kernel's
:func:`substrate.respond.respond`. Each dispatch is bound to a session
slug and a sender (the session's owner); attribution flows through
``respond`` so the event log records who ran what.

Grammar (informal)::

    command   ::= segment ('|' segment)*
    segment   ::= verb arg*
    arg       ::= token | 'key=value' | quoted-string

Verbs supported in v0.2.0:

* ``assert <s> <p> [<v>]``
* ``retract <s> <p>``
* ``settle <target>``
* ``project [s p o v] | [s=... p=... o=... v=...]``
* ``filter <constraint>`` (pipe-only)
* ``fold <op> [by=<field>]`` (pipe-only)
* ``materialize <target>``
* ``hash <target>``
* ``witness <cell-id>``
* ``audit [start-ord=N] [end-ord=N]``  — verify event/witness chain
* ``fork [parent=<slug>]``  — clone the current (or named) session
* ``users``  — list provisioned users
* ``sessions [owner=<slug>]``  — list sessions
* ``runlevel`` — current runlevel
* ``help``
"""

from __future__ import annotations

import shlex
from typing import Any

from pydantic import BaseModel, ConfigDict, Field

from init_boot.runlevels import read_runlevel
from process.session import list_sessions
from process.session_messaging import (
    list_unread,
    mark_read,
    send_message,
    surface_unread_messages,
)
from process.user import list_users
from storage.cell import Cell
from storage.event_log import EventLog
from storage.paths import (
    get_current_scope,
    resolve as resolve_path,
    set_current_scope,
)
from storage.storage_layout import StorageLayout
from substrate import stdlib
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCM_PAYLOAD_INVALID, SubstrateError


class CommandResult(BaseModel):
    model_config = ConfigDict(extra="forbid")

    verb: str
    args: list[str]
    ok: bool
    output: Any = None
    error: dict[str, Any] | None = None
    cell_ids_carried: int = Field(
        default=0,
        description="Count of cells passed to the next pipe segment.",
    )


def parse(line: str) -> list[tuple[str, list[str]]]:
    """Split ``line`` on ``|``, shlex-split each segment."""
    out: list[tuple[str, list[str]]] = []
    for raw in line.split("|"):
        toks = shlex.split(raw.strip())
        if not toks:
            continue
        out.append((toks[0], toks[1:]))
    return out


def dispatch(
    line: str,
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    sender: str,
    session_slug: str | None = None,
    active_rule_ids: list[str] | None = None,
) -> list[CommandResult]:
    """Parse + run ``line``. Returns one ``CommandResult`` per segment.

    The first ``ok=False`` result short-circuits the pipeline.
    """
    pipeline = parse(line)
    if not pipeline:
        return []
    results: list[CommandResult] = []
    carry: list[Cell] | None = None
    for verb, args in pipeline:
        try:
            output, carry = _run_verb(
                verb,
                args,
                layout=layout,
                event_log=event_log,
                node_id=node_id,
                sender=sender,
                session_slug=session_slug,
                active_rule_ids=list(active_rule_ids or []),
                carry=carry,
            )
        except SubstrateError as e:
            results.append(CommandResult(
                verb=verb, args=args, ok=False,
                error=e.to_dict(),
            ))
            return results
        results.append(CommandResult(
            verb=verb, args=args, ok=True,
            output=output,
            cell_ids_carried=len(carry) if isinstance(carry, list) else 0,
        ))
    return results


def _cell_summary(c: Cell) -> dict[str, Any]:
    return {
        "id": c.id,
        "s": c.s,
        "p": c.p,
        "o": c.o,
        "v": c.v.value if hasattr(c.v, "value") else c.v,
        "stratum": c.stratum,
        "ord": c.ord,
    }


def _parse_pattern(args: list[str]) -> stdlib.CellPattern:
    """Accept ``s p o v`` positionals OR ``s=... p=...`` kw form."""
    if args and all("=" in a for a in args):
        kv: dict[str, str | None] = {}
        for a in args:
            k, _, v = a.partition("=")
            if k not in ("s", "p", "o", "v"):
                raise SubstrateError(
                    PCM_PAYLOAD_INVALID,
                    f"unknown pattern field {k!r}; use s/p/o/v",
                )
            kv[k] = v if v != "" else None
        return stdlib.CellPattern(**kv)
    pat = stdlib.CellPattern()
    for slot, val in zip(("s", "p", "o", "v"), args):
        setattr(pat, slot, val)
    return pat


def _bvalue(raw: str) -> BilatticeValue:
    try:
        return BilatticeValue(raw)
    except ValueError as e:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"value must be one of None/True/False/Both, got {raw!r}",
        ) from e


def _help_text() -> dict[str, list[str]]:
    return {
        "verbs": [
            "assert <s> <p> [<v>]",
            "retract <s> <p>",
            "settle <target>",
            "project [s p o v]  OR  project s=... p=... o=... v=...",
            "filter <constraint>           # pipe-only",
            "fold <op> [by=<field>]        # pipe-only",
            "materialize <target>",
            "hash <target>",
            "witness <cell-id>",
            "audit [start-ord=N] [end-ord=N]",
            "fork [parent=<session-slug>]",
            "users",
            "sessions [owner=<slug>]",
            "runlevel",
            "send-message to=<session> type=<msg-type> <key>=<value>...",
            "inbox [types=<msg-type>,...]",
            "mark-read <session-message:slug>",
            "surface-messages",
            ":pwd",
            ":cd <scope-slug>",
            ":resolve <path>",
            "help",
        ],
        "values": [v.value for v in BilatticeValue],
    }



def _run_verb(
    verb: str,
    args: list[str],
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    sender: str,
    session_slug: str | None,
    active_rule_ids: list[str],
    carry: list[Cell] | None,
) -> tuple[Any, list[Cell] | None]:
    if verb in ("help", ":help", "?"):
        return _help_text(), None

    # Per ``specs/shell/repl.md`` §2 (meta-commands) and the example in
    # ``specs/filesystem/paths-and-resolution.md`` §2: ``:pwd`` reports
    # the session's current-scope, ``:cd <scope>`` binds it.
    if verb == ":pwd":
        if session_slug is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                ":pwd: requires a bound session",
            )
        scope = get_current_scope(layout, session_slug)
        return {"current_scope": scope}, None

    if verb == ":cd":
        if session_slug is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                ":cd: requires a bound session",
            )
        if len(args) != 1:
            raise SubstrateError(PCM_PAYLOAD_INVALID, ":cd: <scope-slug>")
        cell_id = set_current_scope(
            layout=layout, event_log=event_log, node_id=node_id,
            session_slug=session_slug, scope=args[0],
        )
        return {"current_scope": args[0], "cell_id": cell_id}, None

    if verb == ":resolve":
        if len(args) != 1:
            raise SubstrateError(PCM_PAYLOAD_INVALID, ":resolve: <path>")
        r = resolve_path(args[0], layout=layout, session_slug=session_slug)
        return r.model_dump(), None

    if verb == "assert":
        if len(args) not in (2, 3):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "assert: <s> <p> [<v>]")
        s, p = args[0], args[1]
        v = _bvalue(args[2]) if len(args) == 3 else BilatticeValue.TRUE
        r = stdlib.assert_cell(
            layout=layout, event_log=event_log, node_id=node_id,
            s=s, p=p, v=v, sender=sender, active_rule_ids=active_rule_ids,
        )
        return _respond_summary(r), None

    if verb == "retract":
        if len(args) != 2:
            raise SubstrateError(PCM_PAYLOAD_INVALID, "retract: <s> <p>")
        r = stdlib.retract_cell(
            layout=layout, event_log=event_log, node_id=node_id,
            s=args[0], p=args[1], sender=sender,
            active_rule_ids=active_rule_ids,
        )
        return _respond_summary(r), None

    if verb == "settle":
        if len(args) != 1:
            raise SubstrateError(PCM_PAYLOAD_INVALID, "settle: <target>")
        r = stdlib.settle(
            layout=layout, event_log=event_log, node_id=node_id,
            target=args[0], sender=sender,
            active_rule_ids=active_rule_ids,
        )
        return _respond_summary(r), None

    if verb == "project":
        scope: str | None = None
        positional: list[str] = []
        for a in args:
            if a.startswith("scope="):
                scope = a[len("scope="):]
            else:
                positional.append(a)
        pat = _parse_pattern(positional)
        cells = stdlib.project(layout, pat, scope=scope)
        return [_cell_summary(c) for c in cells], cells

    if verb == "filter":
        if not isinstance(carry, list):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "filter requires piped cells from project")
        if len(args) != 1:
            raise SubstrateError(PCM_PAYLOAD_INVALID, "filter: <constraint>")
        out = stdlib.filter_(carry, args[0])
        return [_cell_summary(c) for c in out], out

    if verb == "fold":
        if not isinstance(carry, list):
            raise SubstrateError(PCM_PAYLOAD_INVALID, "fold requires piped cells from project/filter")
        if not args:
            raise SubstrateError(PCM_PAYLOAD_INVALID, "fold: <op> [by=<field>]")
        op = args[0]
        by: str | None = None
        for a in args[1:]:
            if a.startswith("by="):
                by = a[len("by="):]
        rows = stdlib.fold(carry, op, by=by)
        return [r.model_dump() for r in rows], None

    if verb == "materialize":
        if len(args) != 1:
            raise SubstrateError(PCM_PAYLOAD_INVALID, "materialize: <target>")
        return stdlib.materialize(layout, args[0]).decode("utf-8"), None

    if verb == "hash":
        if len(args) != 1:
            raise SubstrateError(PCM_PAYLOAD_INVALID, "hash: <target>")
        return stdlib.hash_(args[0], layout=layout), None

    if verb == "witness":
        if len(args) != 1:
            raise SubstrateError(PCM_PAYLOAD_INVALID, "witness: <cell-id>")
        chain = stdlib.witness(layout, args[0])
        return [w.model_dump() for w in chain], None

    if verb == "audit":
        # Per specs/stdlib/audit.md §1 — accepts an optional ord range.
        # Hyphenated kw form (start-ord/end-ord) mirrors the spec's wire
        # vocabulary; underscored aliases are also accepted to keep
        # tab-completion humane.
        start_ord = 0
        end_ord: int | None = None
        for a in args:
            if "=" not in a:
                raise SubstrateError(
                    PCM_PAYLOAD_INVALID,
                    "audit: positional args not supported; "
                    "use start-ord=N end-ord=N",
                )
            k, _, v = a.partition("=")
            try:
                if k in ("start-ord", "start_ord"):
                    start_ord = int(v)
                elif k in ("end-ord", "end_ord"):
                    end_ord = int(v)
                else:
                    raise SubstrateError(
                        PCM_PAYLOAD_INVALID,
                        f"audit: unknown arg {k!r}; "
                        "use start-ord / end-ord",
                    )
            except ValueError as e:
                raise SubstrateError(
                    PCM_PAYLOAD_INVALID,
                    f"audit: {k!r} must be an integer, got {v!r}",
                ) from e
        report = stdlib.audit(
            layout, start_ord=start_ord, end_ord=end_ord,
        )
        # Surface the spec's hyphenated wire form so REPL output is
        # diffable against the audit.md §3 example.
        return report.to_wire(), None

    if verb == "fork":
        # Per specs/stdlib/fork.md: clones the calling session.
        # Default parent = the bound session_slug; explicit parent=...
        # allows operator scripts to fork a named session.
        parent_slug: str | None = session_slug
        for a in args:
            if a.startswith("parent="):
                parent_slug = a[len("parent="):]
            else:
                raise SubstrateError(
                    PCM_PAYLOAD_INVALID,
                    f"fork: unknown arg {a!r}; use parent=<slug>",
                )
        if not parent_slug:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                "fork: requires a session — bind one to the REPL "
                "or pass parent=<session-slug>",
            )
        child = stdlib.fork(
            layout=layout, event_log=event_log, node_id=node_id,
            parent_slug=parent_slug,
        )
        return {
            "slug": child.slug,
            "owner": child.owner,
            "parent": child.parent,
            "state": child.state,
            "capabilities": list(child.capabilities),
            "opened_at_ord": child.opened_at_ord,
        }, None

    if verb == "users":
        return [
            {"slug": u.slug, "display_name": u.display_name,
             "capabilities": u.capabilities}
            for u in list_users(layout)
        ], None

    if verb == "sessions":
        owner: str | None = None
        for a in args:
            if a.startswith("owner="):
                owner = a[len("owner="):]
        return [
            {"slug": s.slug, "owner": s.owner, "state": s.state,
             "parent": s.parent, "opened_at_ord": s.opened_at_ord}
            for s in list_sessions(layout, owner=owner)
        ], None

    if verb == "runlevel":
        rl = read_runlevel(layout)
        return {"level": int(rl), "name": rl.name.lower().replace("_", "-")}, None

    # ---- inter-session messaging (per specs/process/inter-session-messaging.md)
    if verb in ("send-message", "send_message"):
        if session_slug is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"{verb}: requires an authenticated session "
                "(call /shell with a session bound to your bearer token)",
            )
        kw: dict[str, str] = {}
        positional: list[str] = []
        for a in args:
            if "=" in a:
                k, _, v = a.partition("=")
                kw[k] = v
            else:
                positional.append(a)
        recipient = kw.pop("to", None) or (positional[0] if positional else None)
        msg_type = kw.pop("type", None) or (
            positional[1] if len(positional) >= 2 else None
        )
        if not recipient or not msg_type:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                "send-message: to=<session> type=<msg-type> "
                "<content-key>=<value>...",
            )
        # Allow comma-separated recipient list for broadcast.
        recipients: str | list[str]
        recipients = (
            [r for r in recipient.split(",") if r] if "," in recipient
            else recipient
        )
        msg = send_message(
            layout=layout, event_log=event_log, node_id=node_id,
            from_session=session_slug,
            to_session=recipients,
            msg_type=msg_type,
            content=kw,
        )
        return msg.model_dump(), None

    if verb == "inbox":
        if session_slug is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                "inbox: requires an authenticated session",
            )
        msg_types: list[str] | None = None
        for a in args:
            if a.startswith("types="):
                msg_types = [t for t in a[len("types="):].split(",") if t]
        return list_unread(
            layout, session_slug, msg_types=msg_types,
        ), None

    if verb in ("mark-read", "mark_read"):
        if session_slug is None:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                "mark-read: requires an authenticated session",
            )
        if len(args) != 1:
            raise SubstrateError(
                PCM_PAYLOAD_INVALID, "mark-read: <session-message:slug>",
            )
        return mark_read(
            layout=layout, event_log=event_log, node_id=node_id,
            msg_slug=args[0], reader_session=session_slug,
        ), None

    if verb in ("surface-messages", "surface_messages"):
        return surface_unread_messages(
            layout=layout, event_log=event_log, node_id=node_id,
        ), None

    raise SubstrateError(PCM_PAYLOAD_INVALID, f"unknown verb {verb!r}")


def _respond_summary(r: Any) -> dict[str, Any]:
    return {
        "cell_id": r.cell_id,
        "event_id": r.event_id,
        "event_ord": r.event_ord,
        "fiber": r.fiber,
        "closure_cycles": r.closure_cycles,
        "repair_log_count": len(r.repair_log),
    }
