"""Crash recovery for the event log — partial-write truncation."""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from substrate.error_codes import PCS_LOG_TAMPER, SubstrateError
from storage.event_log import EventLog, recover_partial_writes


def _bootstrap_log(tmp_path: Path) -> EventLog:
    log = EventLog(tmp_path)
    log.initialize(node_id="test", wall_clock_ns=0)
    log.append(kind="probe", body={"i": 1}, node_id="test", wall_clock_ns=1)
    log.append(kind="probe", body={"i": 2}, node_id="test", wall_clock_ns=2)
    return log


def test_recover_truncates_partial_trailing_line(tmp_path: Path):
    log = _bootstrap_log(tmp_path)
    path = log.path
    original = path.read_bytes()
    # Append a half-written line (no newline, broken JSON).
    with path.open("ab") as fh:
        fh.write(b'{"kind":"respond","ord":3,"prev":"de')

    dropped = recover_partial_writes(path)
    assert dropped > 0, "expected truncation of partial line"
    assert path.read_bytes() == original

    # A fresh log can still attach and continue appending cleanly.
    log2 = EventLog(tmp_path)
    log2.initialize(node_id="test", wall_clock_ns=0)
    assert log2.height() == 3
    new_event = log2.append(kind="probe", body={"i": 3}, node_id="test", wall_clock_ns=3)
    assert new_event["ord"] == 3


def test_recover_truncates_complete_line_without_newline(tmp_path: Path):
    """A fully-formed JSON object missing its terminating newline is also a partial write."""
    log = _bootstrap_log(tmp_path)
    path = log.path
    original = path.read_bytes()
    with path.open("ab") as fh:
        fh.write(b'{"kind":"would-be-event"}')  # parses, but no trailing \n

    dropped = recover_partial_writes(path)
    assert dropped > 0
    assert path.read_bytes() == original


def test_mid_file_corruption_is_fatal(tmp_path: Path):
    log = _bootstrap_log(tmp_path)
    path = log.path
    raw = path.read_bytes()
    # Corrupt the FIRST line (keep its newline so it's not a "trailing partial").
    nl1 = raw.find(b"\n")
    nl2 = raw.find(b"\n", nl1 + 1)
    assert nl1 > 0 and nl2 > 0
    bad = raw[: nl1 - 5] + b"X" * 5 + raw[nl1:]
    path.write_bytes(bad)

    with pytest.raises(SubstrateError) as exc:
        recover_partial_writes(path)
    assert exc.value.code == PCS_LOG_TAMPER


def test_recovery_is_idempotent_on_clean_file(tmp_path: Path):
    log = _bootstrap_log(tmp_path)
    assert recover_partial_writes(log.path) == 0
    assert recover_partial_writes(log.path) == 0
