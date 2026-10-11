"""``t02-43f`` — history-fiber projection scenario.

Builds a deterministic three-user substrate and drives a fixed sequence
of ``respond`` calls so a sender's history-fiber projection has a known
shape. Used by [`tests/conformance/test_t02_43f_history_fiber_projection.py`](../../conformance/test_t02_43f_history_fiber_projection.py).

The scenario:

- Bootstrap users: ``user:alice`` (member), ``user:bob`` (member),
  ``user:captain`` (admin).
- ``user:alice`` asserts three cells against entity ``doc:proposal``
  (predicates ``approved``, ``signed``, ``shipped``).
- ``user:bob`` asserts one cell against ``doc:proposal`` (``reviewed``).
- ``user:alice`` asserts one cell against ``doc:errata`` (``noted``).

Expected projection for ``user:alice``:

- 4 sender-authored events (3 against ``doc:proposal``, 1 against
  ``doc:errata``), in ord-ascending order.
- 5 attended events when ``attended_targets={"doc:proposal","doc:errata"}``
  (the 4 alice-authored + bob's 1 review).

The bootstrap ``provisioned`` cells are emitted with ``sender="system"``
so they do NOT appear in alice's sender slice (only in alice's attended
slice if ``user:alice`` is in the attended-targets set — which it is
not here, by convention; users observe documents, not their own
provisioning).
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from init_boot.bootstrap_users import (
    BootstrapManifest,
    BootstrapUserEntry,
    ensure_users_from_manifest,
)
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.stdlib import assert_cell


NODE_ID = "test-node-t02-43f"
# Fixed wall clock so two independent builds produce byte-identical
# event logs (the chain hash includes wall_clock_ns on the genesis,
# and every event's id chains forward via ``prev``).
FIXED_WALL_CLOCK_NS = 1_700_000_000_000_000_000


@dataclass(frozen=True)
class Scenario:
    layout: StorageLayout
    event_log: EventLog
    alice: str = "user:alice"
    bob: str = "user:bob"
    captain: str = "user:captain"
    doc_proposal: str = "doc:proposal"
    doc_errata: str = "doc:errata"


def _manifest() -> BootstrapManifest:
    return BootstrapManifest(
        users=[
            BootstrapUserEntry(
                slug="user:captain", display_name="Captain", role="admin",
            ),
            BootstrapUserEntry(
                slug="user:alice", display_name="Alice", role="member",
            ),
            BootstrapUserEntry(
                slug="user:bob", display_name="Bob", role="member",
            ),
        ]
    )


def build(root: Path) -> Scenario:
    """Provision a fresh substrate and run the fixed respond sequence.

    Wall-clock is pinned to :data:`FIXED_WALL_CLOCK_NS` so two builds
    yield byte-identical ``events.jsonl`` files; the genesis event's
    ``wall_clock_ns`` chains forward through every event id via
    ``prev``, so without pinning the IDs (and therefore the projection
    digest) would diverge across runs even when the event SHAPE is
    identical. Pinning is the fixture-author's contract per
    [`decisions/event-ordinal-is-time.md`](../../../docs/dev/decisions/event-ordinal-is-time.md):
    wall-clock is only ever recorded for forensic context, never relied
    on for ordering, and a fixture that wants reproducible event ids
    SHOULD pin it.
    """
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id=NODE_ID, wall_clock_ns=FIXED_WALL_CLOCK_NS)

    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id=NODE_ID,
        manifest=_manifest(),
    )

    sc = Scenario(layout=layout, event_log=log)

    # Alice authors three cells against doc:proposal.
    for predicate in ("approved", "signed", "shipped"):
        assert_cell(
            layout=layout, event_log=log, node_id=NODE_ID,
            s=sc.doc_proposal, p=predicate,
            v=BilatticeValue.TRUE, sender=sc.alice,
        )

    # Bob reviews doc:proposal.
    assert_cell(
        layout=layout, event_log=log, node_id=NODE_ID,
        s=sc.doc_proposal, p="reviewed",
        v=BilatticeValue.TRUE, sender=sc.bob,
    )

    # Alice notes doc:errata.
    assert_cell(
        layout=layout, event_log=log, node_id=NODE_ID,
        s=sc.doc_errata, p="noted",
        v=BilatticeValue.TRUE, sender=sc.alice,
    )

    return sc
