---
title: Build Wiring Plan
id: build-wiring-plan
role: operator
status: plan
inputs:
- id: connection-graph
  alias: graph
outputs:
- id: wiring-plan
  alias: plan
- id: failure-carrier
  alias: failure
transformation:
- let
  - ports
    - call
      - extract-graph-ports
      - graph
  - edges
    - call
      - extract-graph-edges
      - graph
  - well_typed_ports
    - call
      - are-graph-ports-well-typed
      - ports
  - well_typed_edges
    - call
      - are-graph-edges-well-typed
      - edges
      - ports
  - acyclic
    - call
      - is-graph-acyclic
      - edges
  - plan
    - if
      - - call
        - is-true
        - well_typed_ports
      - - if
        - - call
          - is-true
          - well_typed_edges
        - - if
          - - call
            - is-true
            - acyclic
          - - return
            - struct
              - wiring-plan
              - - ports
                - ports
              - - edges
                - edges
              - - entry
                - call
                  - get-graph-entry-steps
                  - graph
              - - exit
                - call
                  - get-graph-exit-steps
                  - graph
          - - return
            - call
              - failure
              - acyclic
        - - return
          - call
            - failure
            - well_typed_edges
      - - return
        - call
          - failure
          - well_typed_ports
  - return
    - plan
proof_refs:
- connection-graph
- wiring-plan
- failure-carrier
- extract-graph-ports
- extract-graph-edges
- are-graph-ports-well-typed
- are-graph-edges-well-typed
- is-graph-acyclic
- get-graph-entry-steps
- get-graph-exit-steps
- is-true
description: Assembles a Wiring Plan from a Connection Graph by extracting ports/edges, checking typing, and ensuring acyclicity.
---


Assembles a [Wiring Plan](./wiring-plan.md) from a
[Connection Graph](./connection-graph.md) by extracting ports/edges,
checking typing, and ensuring acyclicity. Returns either the constructed plan
or a [Failure Carrier](./failure-carrier.md) explaining why wiring
failed.

## Proof
- Uses: port and edge extraction plus typing and cycle predicates to validate
  the graph.
- Shows that: only well-typed, acyclic graphs yield wiring plans; otherwise a
  failure is produced.

## Earlier material

Assembles a [Wiring Plan](wiring-plan.md) from a
[Connection Graph](connection-graph.md) by extracting ports/edges,
checking typing, and ensuring acyclicity. Returns either the constructed plan
or a [Failure Carrier](failure-carrier.md) explaining why wiring
failed.
