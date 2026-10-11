"""Fixtures for the history-fiber projection (paired with task t02-43).

Per [`decisions/fixture-authoring-paired-task.md`](../../../docs/dev/decisions/fixture-authoring-paired-task.md)
this directory holds the deterministic scenario builders the
conformance test [`test_t02_43f_history_fiber_projection.py`](../../conformance/test_t02_43f_history_fiber_projection.py)
replays. The fixture itself is procedural — it boots a fresh substrate,
provisions a manifest, and drives a fixed sequence of ``respond`` calls
against canonical sender-target pairs so the resulting event log is
byte-stable across runs.
"""
