---
title: Dataview Query Language Program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---


# Dataview-Style Query Language Program

Program idea for a user-facing query language/GUI to define views over
recognitions (table/list/graph), grounded in our topology/traceability.

## Behaviour
- Recognitions:
  - `QueryDefinitionRecognition`: name/params/selection/projection/sort/group/view hints.
  - `QueryResultRecognition`: result snapshot with inputs/params/time.
  - `QueryViewBindingRecognition`: binds a query to a GUI panel or static doc.
- Topology/measurement:
  - predicates over types/tags/relations/measurements/provenance.
  - metrics: query cost, frequency, staleness; suggest caching/indexing.
- Runbooks:
  - `run_register_query`, `run_execute_query`, `run_refresh_bound_views`.
- Cross-domain:
  - dashboards (tasks/health/finance), research/reading, MUD summaries,
    governance/policy audits; integrates with GUI workbench/static docs.

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

