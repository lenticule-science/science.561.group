---
title: Contacts & CRM Program
id: contacts-crm-program
role: structure
status: someday
proof_refs: []
derives-from:
  - computer/type/documentation-interpreter
description: Program idea to treat contacts and simple CRM as recognitions in the relational graph.
aliases:
  - contacts-crm-program
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Program idea to treat contacts and simple CRM as recognitions in the relational
graph.

## Behaviour
- Recognitions:
  - `PersonRecognition`: name/handles/contact info/roles.
  - `OrganizationRecognition`: groups/companies/collectives.
  - `InteractionRecognition`: meetings/messages/collaborations.
  - `RelationshipRecognition`: ongoing ties (friend/collaborator/client).
- Topology/measurement:
  - social/affiliation/project graphs.
  - measurements: frequency/recency of contact, responsiveness, open threads.
- Runbooks:
  - `log_interaction`, `plan_checkins`, `review_relationships`.

## Proof
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
