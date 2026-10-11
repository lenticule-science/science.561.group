"""Event-log replay — fixture is byte-identical across replays.

We construct a 50-event log programmatically and assert:

1. Hash chain holds (genesis prev = 64×0, each event.prev = previous.id).
2. Replaying byte-by-byte yields the same canonical JSON we wrote.
3. ``EventLog.verify()`` passes after process-restart simulation.
"""

from __future__ import annotations

import json
from pathlib import Path

from substrate.canonicalization import canonical, cid
from storage.event_log import EVENT_LOG_FILENAME, EventLog, GENESIS_PREV


NODE = "test-node.local"


def _build_50_event_log(root: Path) -> list[dict]:
    log = EventLog(root)
    log.initialize(node_id=NODE, wall_clock_ns=1_700_000_000_000_000_000)
    events = list(log.iter_events())
    for i in range(1, 50):
        log.append(
            kind="respond",
            body={
                "target": f"entity-{i:03d}",
                "sender": "system",
                "predicate": "p/positive",
                "value": "True",
                "i": i,
            },
            node_id=NODE,
            wall_clock_ns=1_700_000_000_000_000_000 + i,
        )
    return list(log.iter_events())


def test_hash_chain_holds_after_50_events(tmp_path):
    events = _build_50_event_log(tmp_path)
    assert len(events) == 50
    assert events[0]["prev"] == GENESIS_PREV
    assert events[0]["ord"] == 0
    for prev, cur in zip(events, events[1:]):
        assert cur["prev"] == prev["id"]
        assert cur["ord"] == prev["ord"] + 1
        rebuilt = {k: v for k, v in cur.items() if k != "id"}
        assert cid(rebuilt) == cur["id"]


def test_replay_is_byte_identical(tmp_path):
    _build_50_event_log(tmp_path)
    raw = (tmp_path / EVENT_LOG_FILENAME).read_bytes()
    # Re-encode every line through canonical(parse(...)) and assert byte-identity.
    out_lines = []
    for line in raw.splitlines():
        if not line.strip():
            continue
        decoded = json.loads(line.decode("utf-8"))
        out_lines.append(canonical(decoded))
    assert b"\n".join(out_lines) + b"\n" == raw


def test_verify_after_restart(tmp_path):
    _build_50_event_log(tmp_path)
    fresh = EventLog(tmp_path)
    fresh.verify()
    assert fresh.height() == 50


def test_tamper_is_detected(tmp_path):
    _build_50_event_log(tmp_path)
    path = tmp_path / EVENT_LOG_FILENAME
    raw = path.read_bytes().splitlines(keepends=True)
    # Flip a byte in line 25.
    line = raw[25]
    obj = json.loads(line)
    obj["body"]["target"] = "tampered"
    raw[25] = (canonical(obj) + b"\n")
    path.write_bytes(b"".join(raw))
    fresh = EventLog(tmp_path)
    import pytest
    from substrate.error_codes import SubstrateError
    with pytest.raises(SubstrateError):
        fresh.verify()
