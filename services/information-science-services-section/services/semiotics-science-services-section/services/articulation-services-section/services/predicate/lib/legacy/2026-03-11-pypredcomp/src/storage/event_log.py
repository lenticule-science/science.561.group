"""Append-only JSONL event log with SHA-256 hash chain.

Per ``specs/filesystem/event-log.md``::

    line 0: genesis event { id, ord: 0, prev: 64×"0", kind: "genesis", ... }
    line N: event N with prev = id_{N-1}, ord = N

Each event ``id`` is ``sha256(canonical(event without id))``.

Crash recovery (``recover_partial_writes``) is invoked on
:meth:`EventLog.initialize`. If the *trailing* JSONL line is incomplete
(no terminating ``\\n``) **or** raises ``json.JSONDecodeError``, we
truncate the file at the byte position of that line's start and log a
warning. Any non-trailing parse error is fatal (``PCS_LOG_TAMPER``):
mid-file corruption indicates external tampering, not a partial write.
"""

from __future__ import annotations

import json
import logging
import os
from collections.abc import Iterator
from pathlib import Path
from typing import Any

from substrate.canonicalization import canonical, cid
from substrate.error_codes import (
    PCS_GENESIS_MISSING,
    PCS_HASH_CHAIN_BROKEN,
    PCS_LOG_TAMPER,
    SubstrateError,
)

log = logging.getLogger("substrate.event_log")

GENESIS_PREV = "0" * 64
EVENT_LOG_FILENAME = "events.jsonl"


def make_event(
    *,
    ord_: int,
    prev: str,
    kind: str,
    body: dict[str, Any],
    node_id: str,
    wall_clock_ns: int | None = None,
) -> dict[str, Any]:
    """Construct a fully-formed event dict with computed ``id``."""
    base = {
        "ord": ord_,
        "prev": prev,
        "kind": kind,
        "node": node_id,
        "body": body,
    }
    if wall_clock_ns is not None:
        base["wall_clock_ns"] = wall_clock_ns
    base["id"] = cid(base)
    return base


def make_genesis(node_id: str, wall_clock_ns: int | None = None) -> dict[str, Any]:
    return make_event(
        ord_=0,
        prev=GENESIS_PREV,
        kind="genesis",
        body={"node": node_id, "spec": "substrate-v0.1"},
        node_id=node_id,
        wall_clock_ns=wall_clock_ns,
    )


def recover_partial_writes(path: Path) -> int:
    """Truncate a trailing partial JSONL line if present.

    Returns the number of bytes truncated. Safe to call on a file that is
    already clean (returns 0). Raises :class:`SubstrateError` with
    ``PCS_LOG_TAMPER`` on mid-file corruption.
    """
    if not path.exists() or path.stat().st_size == 0:
        return 0

    # Walk byte-by-byte tracking the start-of-line offset of each
    # successfully parsed line. If a parse error occurs at the last
    # line *and* that line has no terminating newline, truncate.
    truncate_at: int | None = None
    last_line_start = 0
    cur_line_start = 0
    line_count = 0
    raw = path.read_bytes()
    i = 0
    n = len(raw)
    while i < n:
        # Find end of this line.
        j = raw.find(b"\n", i)
        if j == -1:
            # Trailing line with no newline — that's a partial write candidate.
            chunk = raw[i:]
            if not chunk.strip():
                truncate_at = i
            else:
                try:
                    json.loads(chunk.decode("utf-8"))
                    # Parsed but missing newline — also a partial write
                    # by JSONL convention; truncate.
                    truncate_at = i
                except (UnicodeDecodeError, json.JSONDecodeError):
                    truncate_at = i
            break
        # Inclusive-of-newline line.
        chunk = raw[i:j]
        if chunk.strip():
            try:
                json.loads(chunk.decode("utf-8"))
            except (UnicodeDecodeError, json.JSONDecodeError) as e:
                raise SubstrateError(
                    PCS_LOG_TAMPER,
                    f"mid-file JSON parse failure at byte {i}: {e}",
                )
            last_line_start = i
            line_count += 1
        cur_line_start = j + 1
        i = j + 1

    if truncate_at is None:
        return 0

    bytes_dropped = n - truncate_at
    log.warning(
        "event-log: truncating %d trailing bytes (suspected partial write at byte %d)",
        bytes_dropped,
        truncate_at,
    )
    with path.open("rb+") as fh:
        fh.truncate(truncate_at)
        fh.flush()
        os.fsync(fh.fileno())
    return bytes_dropped


class EventLog:
    """Append-only JSONL event log over ``$ROOT/events.jsonl``."""

    def __init__(self, root: str | Path):
        self.root = Path(root)
        self.path = self.root / EVENT_LOG_FILENAME
        self._tail_id: str = GENESIS_PREV
        self._next_ord: int = 0

    # --- lifecycle ---------------------------------------------------------

    def initialize(self, node_id: str, wall_clock_ns: int | None = None) -> dict[str, Any]:
        """Recover-then-attach. Creates the genesis event if the log is new."""
        self.root.mkdir(parents=True, exist_ok=True)
        recover_partial_writes(self.path)
        if self.path.exists() and self.path.stat().st_size > 0:
            self._scan_tail()
            return self.head_event()
        genesis = make_genesis(node_id=node_id, wall_clock_ns=wall_clock_ns)
        self._raw_append(genesis)
        self._tail_id = genesis["id"]
        self._next_ord = 1
        return genesis

    def _scan_tail(self) -> None:
        """Walk the log to recover ``_tail_id`` and ``_next_ord`` after restart.

        Verifies hash-chain prev/id at every line.
        """
        prev = GENESIS_PREV
        ord_ = 0
        with self.path.open("r", encoding="utf-8") as fh:
            for line in fh:
                line = line.rstrip("\n")
                if not line:
                    continue
                event = json.loads(line)
                if event.get("ord") != ord_:
                    raise SubstrateError(
                        PCS_LOG_TAMPER,
                        f"ord skew at line {ord_}: got {event.get('ord')}",
                    )
                if event.get("prev") != prev:
                    raise SubstrateError(
                        PCS_HASH_CHAIN_BROKEN,
                        f"prev mismatch at ord {ord_}",
                    )
                rebuilt = dict(event)
                eid = rebuilt.pop("id", None)
                if cid(rebuilt) != eid:
                    raise SubstrateError(
                        PCS_LOG_TAMPER,
                        f"id mismatch at ord {ord_}",
                    )
                prev = eid
                ord_ += 1
        self._tail_id = prev
        self._next_ord = ord_
        if ord_ == 0:
            raise SubstrateError(PCS_GENESIS_MISSING, "log file present but empty")

    # --- append / read ----------------------------------------------------

    def _raw_append(self, event: dict[str, Any]) -> None:
        line = canonical(event).decode("utf-8") + "\n"
        with self.path.open("ab") as fh:
            fh.write(line.encode("utf-8"))
            fh.flush()
            os.fsync(fh.fileno())

    def append(
        self,
        *,
        kind: str,
        body: dict[str, Any],
        node_id: str,
        wall_clock_ns: int | None = None,
    ) -> dict[str, Any]:
        event = make_event(
            ord_=self._next_ord,
            prev=self._tail_id,
            kind=kind,
            body=body,
            node_id=node_id,
            wall_clock_ns=wall_clock_ns,
        )
        self._raw_append(event)
        self._tail_id = event["id"]
        self._next_ord += 1
        return event

    def append_signed(self, event: dict[str, Any]) -> dict[str, Any]:
        """Ingest a fully-formed external event (federation path).

        The event MUST have ``ord = current_height`` and ``prev = tail_id``,
        and its ``id`` MUST equal ``cid(canonical(event without id))``.
        """
        if event.get("ord") != self._next_ord:
            raise SubstrateError(
                PCS_LOG_TAMPER,
                f"ingest event ord {event.get('ord')} != expected {self._next_ord}",
            )
        if event.get("prev") != self._tail_id:
            raise SubstrateError(
                PCS_HASH_CHAIN_BROKEN,
                f"ingest event prev {event.get('prev')} != tail {self._tail_id}",
            )
        rebuilt = dict(event)
        eid = rebuilt.pop("id", None)
        if cid(rebuilt) != eid:
            raise SubstrateError(PCS_LOG_TAMPER, "ingest event id != recomputed cid")
        self._raw_append(event)
        self._tail_id = eid  # type: ignore[assignment]
        self._next_ord += 1
        return event

    def head_event(self) -> dict[str, Any]:
        last: dict[str, Any] | None = None
        for ev in self.iter_events():
            last = ev
        if last is None:
            raise SubstrateError(PCS_GENESIS_MISSING, "log empty")
        return last

    def iter_events(self) -> Iterator[dict[str, Any]]:
        if not self.path.exists():
            return
        with self.path.open("r", encoding="utf-8") as fh:
            for line in fh:
                line = line.rstrip("\n")
                if not line:
                    continue
                yield json.loads(line)

    def get_event(self, event_id: str) -> dict[str, Any] | None:
        for ev in self.iter_events():
            if ev.get("id") == event_id:
                return ev
        return None

    def height(self) -> int:
        return self._next_ord

    @property
    def tail_id(self) -> str:
        return self._tail_id

    def verify(self) -> None:
        """Re-scan the log and assert hash-chain integrity end-to-end."""
        self._scan_tail()
