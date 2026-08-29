---
title: Care Networks Program
id: care-networks-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---


# Care Networks Program

Program idea to model and support care networks (people, relationships, needs)
within the relational computer to enable transparent, humane mutual aid.

## Behaviour
- Recognitions:
  - `PersonRecognition`: consent, needs, capacities.
  - `NeedRecognition`: concrete requests (rides, money, listening, research).
  - `OfferRecognition`: what someone can provide.
  - `ExchangeRecognition`: when a need and an offer meet.
- Topology/measurement:
  - networks/affinity groups/households/orgs.
  - measurements: load (giving/receiving), unmet needs, burnout risk.
- Runbooks:
  - `match_needs_offers`, `check_in`, `rebalance_load` to support communities.

## Proof
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
