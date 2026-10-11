"""50-rule fixture replay — the bundled canonical log materializes byte-identically."""

from __future__ import annotations

import json
from pathlib import Path

from init_boot.self_test import (
    EXPECTED_FIBER,
    FIXTURE_LOG,
    FIXTURE_NODE_ID,
    FIXTURE_SENDER,
    SelfTestReport,
    _check_fixture_replay,
)


def test_fixture_files_are_committed_and_nonempty():
    assert FIXTURE_LOG.exists(), "canonical-log.jsonl missing — run scripts/generate_fixture.py"
    assert EXPECTED_FIBER.exists(), "expected-fiber.json missing — run scripts/generate_fixture.py"
    assert FIXTURE_LOG.stat().st_size > 0
    assert EXPECTED_FIBER.stat().st_size > 0


def test_fixture_log_has_50_instructions():
    lines = [
        line for line in FIXTURE_LOG.read_text("utf-8").splitlines() if line.strip()
    ]
    assert len(lines) == 50
    kinds = [json.loads(l)["kind"] for l in lines]
    assert kinds.count("add_rule") == 5
    assert kinds.count("respond") == 45


def test_self_test_replay_check_passes():
    report = SelfTestReport()
    _check_fixture_replay(report)
    assert not report.failed, f"replay failures: {report.failed}"
    assert any(c.startswith("fixture_replay") for c in report.passed)


def test_replay_byte_identical_to_expected():
    """Replay independently and compare canonical bytes to the bundled expected."""
    import tempfile

    from substrate.canonicalization import canonical
    from substrate.respond import respond as do_respond
    from substrate.closure_engine import RuleRecord
    from storage.event_log import EventLog
    from storage.storage_layout import StorageLayout

    with tempfile.TemporaryDirectory(prefix="substrate-replay-") as td:
        root = Path(td) / "root"
        layout = StorageLayout(root)
        layout.ensure_dirs()
        log = EventLog(root)
        log.initialize(node_id=FIXTURE_NODE_ID, wall_clock_ns=0)
        active: list[str] = []
        with FIXTURE_LOG.open("r", encoding="utf-8") as fh:
            for line in fh:
                line = line.strip()
                if not line:
                    continue
                instr = json.loads(line)
                if instr["kind"] == "add_rule":
                    rule = RuleRecord(**instr["rule"]).with_id()
                    rid, _ = layout.put_record("rules", rule.canonical_body())
                    if rid not in active:
                        active.append(rid)
                else:
                    do_respond(
                        target=instr["target"],
                        payload=instr["payload"],
                        sender=instr.get("sender", FIXTURE_SENDER),
                        layout=layout,
                        event_log=log,
                        node_id=FIXTURE_NODE_ID,
                        active_rule_ids=active,
                        fuel=instr.get("fuel", 1024),
                    )
        fibers: dict[str, dict] = {}
        for fp in sorted((root / "fibers").rglob("fiber.json")):
            rel = fp.parent.relative_to(root / "fibers")
            fibers[str(rel).replace("\\", "/")] = json.loads(fp.read_bytes().decode("utf-8"))

    expected = json.loads(EXPECTED_FIBER.read_bytes().decode("utf-8"))
    assert canonical(fibers) == canonical(expected)
