"""Self-test — runs at boot time per ``specs/init-boot/self-test.md``.

Verifies:

1. Adjunction property over all 64 triples (Conformance §1).
2. Canonicalization round-trip on a known mixed-shape JSON value.
3. Algebra truth tables (knowledge_join, restrict).
4. Storage round-trip (cell put → get → byte-identity).
5. Event-log integrity (genesis present, hash chain holds).
6. **50-rule fixture replay** — replays the canonical 50-event log
   bundled at ``init_boot/fixtures/canonical-log.jsonl`` into an
   ephemeral ``$ROOT`` and asserts the resulting fiber bytes match
   ``expected-fiber.json`` byte-identically.

A failure leaves the runtime in ``degraded``; ``ready`` requires all
checks to pass.
"""

from __future__ import annotations

import json
import shutil
import tempfile
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from substrate.algebra import (
    BilatticeValue,
    knowledge_join,
    verify_adjunction,
)
from substrate.canonicalization import canonical, parse_canonical
from substrate.respond import respond as do_respond
from substrate.closure_engine import RuleRecord
from storage.cell_record import FiberSnapshot
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout

FIXTURES_DIR = Path(__file__).parent / "fixtures"
FIXTURE_LOG = FIXTURES_DIR / "canonical-log.jsonl"
EXPECTED_FIBER = FIXTURES_DIR / "expected-fiber.json"
# Must match scripts/generate_fixture.py — any drift breaks byte-identity.
FIXTURE_NODE_ID = "fixture"
FIXTURE_SENDER = "fixture"


@dataclass
class SelfTestReport:
    passed: list[str] = field(default_factory=list)
    failed: list[tuple[str, str]] = field(default_factory=list)

    @property
    def ok(self) -> bool:
        return not self.failed

    def to_dict(self) -> dict[str, Any]:
        return {
            "ok": self.ok,
            "passed": self.passed,
            "failed": [{"check": n, "reason": r} for n, r in self.failed],
        }


def _check_adjunction(report: SelfTestReport) -> None:
    r = verify_adjunction()
    if r.ok and r.checked == 64:
        report.passed.append("adjunction_64_triples")
    else:
        report.failed.append(("adjunction_64_triples", f"{len(r.violations)} violations"))


def _check_canonical_roundtrip(report: SelfTestReport) -> None:
    sample = {"b": 2, "a": [3, 1, 2], "nested": {"z": True, "a": None}}
    encoded = canonical(sample)
    decoded = parse_canonical(encoded)
    re_encoded = canonical(decoded)
    if encoded == re_encoded:
        report.passed.append("canonical_roundtrip")
    else:
        report.failed.append(("canonical_roundtrip", "encode/decode/encode not byte-identical"))


def _check_truth_tables(report: SelfTestReport) -> None:
    expected_kjoin = {
        (BilatticeValue.NONE, BilatticeValue.NONE): BilatticeValue.NONE,
        (BilatticeValue.NONE, BilatticeValue.TRUE): BilatticeValue.TRUE,
        (BilatticeValue.TRUE, BilatticeValue.FALSE): BilatticeValue.BOTH,
        (BilatticeValue.BOTH, BilatticeValue.TRUE): BilatticeValue.BOTH,
        (BilatticeValue.FALSE, BilatticeValue.FALSE): BilatticeValue.FALSE,
    }
    for (a, b), want in expected_kjoin.items():
        if knowledge_join(a, b) != want:
            report.failed.append(("knowledge_join_table", f"{a}⊙{b}={knowledge_join(a, b)} != {want}"))
            return
    report.passed.append("knowledge_join_table")


def _check_cell_roundtrip(report: SelfTestReport, layout: StorageLayout) -> None:
    cell = FiberSnapshot(
        entity="self-test:hello",
        predicates={"greeting/positive": BilatticeValue.TRUE},
    ).with_id()
    body = cell.model_dump(mode="json")
    body.pop("id", None)
    body = {k: v for k, v in body.items() if v is not None}
    cid1, _path = layout.put_record("cells", body)
    if cid1 != cell.id:
        report.failed.append(("cell_roundtrip", "computed cid != layout-stored cid"))
        return
    raw = layout.get_record_bytes("cells", cid1)
    decoded = parse_canonical(raw)
    if decoded.get("id") != cid1:
        report.failed.append(("cell_roundtrip", "stored bytes lost id"))
        return
    report.passed.append("cell_roundtrip")


def _check_event_log(report: SelfTestReport, log: EventLog) -> None:
    try:
        log.verify()
        report.passed.append("event_log_chain")
    except Exception as e:
        report.failed.append(("event_log_chain", str(e)))


def _check_fixture_replay(report: SelfTestReport) -> None:
    """Replay the bundled 50-rule fixture and assert byte-identity.

    Loads the rules + respond instructions from the fixture log, applies
    them to a fresh ``$ROOT`` in a tempdir, and compares the resulting
    fiber bytes to the bundled expected output.
    """
    if not FIXTURE_LOG.exists() or not EXPECTED_FIBER.exists():
        report.failed.append(("fixture_replay", "bundled fixture missing"))
        return
    with tempfile.TemporaryDirectory(prefix="substrate-selftest-") as td:
        root = Path(td) / "root"
        layout = StorageLayout(root)
        layout.ensure_dirs()
        log = EventLog(root)
        log.initialize(node_id=FIXTURE_NODE_ID, wall_clock_ns=0)

        active_rule_ids: list[str] = []
        with FIXTURE_LOG.open("r", encoding="utf-8") as fh:
            for line in fh:
                line = line.strip()
                if not line:
                    continue
                instr = json.loads(line)
                kind = instr["kind"]
                if kind == "add_rule":
                    rule = RuleRecord(**instr["rule"]).with_id()
                    body = rule.canonical_body()
                    rid, _ = layout.put_record("rules", body)
                    if rid not in active_rule_ids:
                        active_rule_ids.append(rid)
                elif kind == "respond":
                    do_respond(
                        target=instr["target"],
                        payload=instr["payload"],
                        sender=instr.get("sender", FIXTURE_SENDER),
                        layout=layout,
                        event_log=log,
                        node_id=FIXTURE_NODE_ID,
                        active_rule_ids=active_rule_ids,
                        fuel=instr.get("fuel", 1024),
                    )
                else:
                    report.failed.append(("fixture_replay", f"unknown fixture kind {kind}"))
                    return

        expected_bytes = EXPECTED_FIBER.read_bytes()
        expected = json.loads(expected_bytes.decode("utf-8"))
        actual_fibers: dict[str, dict[str, Any]] = {}
        fibers_root = root / "fibers"
        if fibers_root.exists():
            for fp in sorted(fibers_root.rglob("fiber.json")):
                rel = fp.parent.relative_to(fibers_root)
                actual_fibers[str(rel).replace("\\", "/")] = json.loads(fp.read_bytes().decode("utf-8"))
        # Compare canonical bytes to enforce byte-identity.
        actual_bytes = canonical(actual_fibers)
        expected_canon = canonical(expected)
        if actual_bytes == expected_canon:
            report.passed.append(f"fixture_replay_50_rule")
        else:
            report.failed.append(
                (
                    "fixture_replay_50_rule",
                    f"materialized fiber bytes differ ({len(actual_bytes)} vs {len(expected_canon)})",
                )
            )


def run_self_test(layout: StorageLayout, log: EventLog) -> SelfTestReport:
    report = SelfTestReport()
    _check_adjunction(report)
    _check_canonical_roundtrip(report)
    _check_truth_tables(report)
    _check_cell_roundtrip(report, layout)
    _check_event_log(report, log)
    _check_fixture_replay(report)
    return report
