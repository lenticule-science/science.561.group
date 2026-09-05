"""Runlevels — discrete operational states.

Per ``specs/init-boot/init-runlevels.md`` (v0.2). Levels:

* 0 stopped
* 1 substrate-only (kernel + filesystem; no users, no network)
* 2 multi-user-no-net (users + drivers; no external network)
* 3 full (default operational state)
* 4 draining
* 5 federation-on (3 + federation explicitly enabled)

Boot promotes the substrate from 0 → 1 → 3 (default) over the boot
phase sequence; transitions later are explicit and audited.
"""

from __future__ import annotations

import json
import time
from enum import IntEnum

from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.error_codes import PCM_RUNLEVEL_INVALID, SubstrateError


class Runlevel(IntEnum):
    STOPPED = 0
    SUBSTRATE_ONLY = 1
    MULTI_USER_NO_NET = 2
    FULL = 3
    DRAINING = 4
    FEDERATION_ON = 5

    @classmethod
    def parse(cls, raw: int | str | "Runlevel") -> "Runlevel":
        if isinstance(raw, Runlevel):
            return raw
        if isinstance(raw, int):
            try:
                return cls(raw)
            except ValueError as e:
                raise SubstrateError(PCM_RUNLEVEL_INVALID, str(e)) from e
        if isinstance(raw, str):
            s = raw.strip().lower()
            if s.isdigit():
                return cls.parse(int(s))
            for member in cls:
                if member.name.lower().replace("_", "-") == s:
                    return member
        raise SubstrateError(PCM_RUNLEVEL_INVALID, f"unknown runlevel {raw!r}")


_FILE = "runlevel.json"


def _path(layout: StorageLayout):
    return layout.root / _FILE


def read_runlevel(layout: StorageLayout) -> Runlevel:
    p = _path(layout)
    if not p.exists():
        return Runlevel.STOPPED
    body = json.loads(p.read_text("utf-8"))
    return Runlevel(int(body["level"]))


def write_runlevel(
    layout: StorageLayout,
    level: Runlevel,
    *,
    event_log: EventLog | None = None,
    node_id: str | None = None,
    actor: str = "system",
    previous: Runlevel | None = None,
) -> Runlevel:
    """Persist the new runlevel; if an event log is provided, append a
    ``runlevel-transition`` event so the change is auditable. The event
    body carries actor + previous + new so the audit row is self-contained."""
    p = _path(layout)
    p.write_text(json.dumps({
        "level": int(level),
        "name": level.name.lower().replace("_", "-"),
        "wall_clock_ns": time.time_ns(),
    }))
    if event_log is not None and node_id is not None:
        event_log.append(
            kind="runlevel-transition",
            body={
                "level": int(level),
                "name": level.name,
                "actor": actor,
                "previous": int(previous) if previous is not None else None,
            },
            node_id=node_id,
        )
    return level


def transition(
    *,
    layout: StorageLayout,
    event_log: EventLog,
    node_id: str,
    target: Runlevel | int | str,
    actor: str = "system",
) -> tuple[Runlevel, Runlevel]:
    """Move from the current runlevel to ``target``. Returns ``(prev, new)``."""
    prev = read_runlevel(layout)
    new = Runlevel.parse(target)
    write_runlevel(
        layout, new,
        event_log=event_log, node_id=node_id,
        actor=actor, previous=prev,
    )
    return prev, new
