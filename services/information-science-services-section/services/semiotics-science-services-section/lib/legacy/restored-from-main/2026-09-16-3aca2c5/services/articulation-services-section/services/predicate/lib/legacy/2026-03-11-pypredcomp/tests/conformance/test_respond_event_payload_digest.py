"""Audit-recomputability of respond event ``payload_digest`` (R1).

Per ``docs/dev/questions/respond-event-payload-self-describing.md``
(R1 ruling, 2026-05-03): every ``kind="respond"`` event body carries

* ``payload_keys``  — sorted list of post-reduction predicate keys
* ``payload_digest`` — ``cid({"payload": <post-reduction predicates>})``

These fields exist so that an external auditor — given only the event
log and the rule set — can recompute the digest from the raw payload
recorded against the cell, and verify it matches the value chained
into the event-log Merkle hash. This test pins that contract: if a
future change either drops the digest, changes its preimage, or
silently shifts the canonicalisation, this test breaks.
"""

from __future__ import annotations

from pathlib import Path

import pytest

from substrate.algebra import BilatticeValue
from substrate.canonicalization import cid
from substrate.message_language import TermEnv, reduce_payload
from substrate.respond import respond
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def fresh(tmp_path: Path) -> tuple[StorageLayout, EventLog]:
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node")
    return layout, log


def test_payload_digest_is_recomputable_from_raw_payload(fresh):
    """An auditor can recompute payload_digest from what was sent."""
    layout, log = fresh
    raw_payload = {"color:blue": "True", "count:3": "True"}
    result = respond(
        target="widget",
        payload=raw_payload,
        sender="alice",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )

    respond_events = [
        e for e in log.iter_events() if e.get("kind") == "respond"
    ]
    assert len(respond_events) == 1
    body = respond_events[0]["body"]

    # The digest auditor recomputation: re-run reduce_payload against
    # the same fiber state the substrate saw, then hash it the same way.
    env = TermEnv(vars={"self": {}}, fiber_predicates={}, parent_predicates={})
    payload_predicates, _fuel = reduce_payload(raw_payload, env=env, fuel=1024)
    expected_digest = cid({"payload": dict(payload_predicates)})

    assert body["payload_digest"] == expected_digest
    assert body["payload_keys"] == sorted(payload_predicates.keys())


def test_payload_keys_are_sorted_and_complete(fresh):
    """payload_keys covers every post-reduction predicate, in sort order."""
    layout, log = fresh
    raw_payload = {
        "zeta:1": "True",
        "alpha:1": "True",
        "mu:1": "True",
    }
    respond(
        target="thing",
        payload=raw_payload,
        sender="bob",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    body = next(e for e in log.iter_events() if e.get("kind") == "respond")["body"]
    assert body["payload_keys"] == sorted(body["payload_keys"])
    assert set(body["payload_keys"]) >= {"alpha:1", "mu:1", "zeta:1"}


def test_distinct_payloads_produce_distinct_digests(fresh):
    """The digest discriminates payloads — not just keys."""
    layout, log = fresh
    respond(
        target="a", payload={"k:1": "True"}, sender="s",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    respond(
        target="b", payload={"k:2": "True"}, sender="s",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    digests = [
        e["body"]["payload_digest"]
        for e in log.iter_events() if e.get("kind") == "respond"
    ]
    assert len(digests) == 2
    assert digests[0] != digests[1]


def test_identical_payloads_produce_identical_digests(fresh):
    """Determinism: same post-reduction payload => same digest."""
    layout, log = fresh
    payload = {"shared-pred:42": "True"}
    respond(
        target="x", payload=payload, sender="s",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    respond(
        target="y", payload=payload, sender="s",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    digests = [
        e["body"]["payload_digest"]
        for e in log.iter_events() if e.get("kind") == "respond"
    ]
    assert len(digests) == 2
    assert digests[0] == digests[1]
