"""End-to-end respond: writes a cell, appends an event, updates the fiber."""

from __future__ import annotations

from pathlib import Path

import pytest

from substrate.algebra import BilatticeValue as B
from substrate.respond import respond
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def storage(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node")
    return layout, log


def test_respond_writes_cell_event_and_fiber(storage):
    layout, log = storage
    result = respond(
        target="hello-world",
        payload={"greeting/positive": "True"},
        sender="system",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
        fuel=64,
    )
    assert result.cell_id
    assert layout.has_record("cells", result.cell_id)
    assert layout.get_fiber("hello-world")["latest_cell_id"] == result.cell_id
    assert log.height() == 2  # genesis + respond


def test_respond_chain_accumulates_predicates(storage):
    layout, log = storage
    r1 = respond(
        target="entity-a",
        payload={"p1": "True"},
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    r2 = respond(
        target="entity-a",
        payload={"p2": "False"},
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    assert r2.fiber["predicates"] == {"p1": "True", "p2": "False"}
    assert r2.fiber["latest_cell_id"] == r2.cell_id
    assert r2.cell.parents == [r1.cell_id]


def test_respond_disagreement_rises_to_both(storage):
    layout, log = storage
    respond(
        target="dispute",
        payload={"p": "True"},
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    r2 = respond(
        target="dispute",
        payload={"p": "False"},
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    assert r2.fiber["predicates"]["p"] == "Both"


def test_respond_invalid_slug_rejected(storage):
    layout, log = storage
    from substrate.error_codes import SubstrateError
    with pytest.raises(SubstrateError):
        respond(
            target="UpperCase",
            payload={"p": "True"},
            layout=layout,
            event_log=log,
            node_id="test-node",
            active_rule_ids=[],
        )
