---
title: Inventory and Assets Program
id: inventory-assets-program
role: structure
status: plan
fields:
- name: assets
  type: trace
  description: recognitions representing physical/digital assets with ids and attributes.
- name: locations
  type: trace
  description: recognitions for where assets reside.
- name: assignments
  type: trace
  description: relations between assets and people/projects/policies.
- name: maintenance
  type: trace
  description: scheduled/completed maintenance recognitions with provenance.
proof_refs: []
---


# Inventory and Assets Program

This program models physical and digital assets as recognitions to track what
you own, where it is, and how it is used.

## Behaviour

- Represent assets, locations, assignments, and maintenance events as
  recognitions with provenance.
- Map topology: asset↔location, asset↔person, asset↔projects.
- Measure usage frequency, age, condition, and cost-of-ownership.

## Intended operators

- Add and move assets; schedule maintenance; decommission assets.
- Assign assets to people or projects with policy constraints.
- Review asset health and lifecycle using recorded measurements.

## Proof
- Uses: earned carrier/operator stack (recognitions, wiring, persistence) to
  model asset/location/assignment/maintenance recognitions.
- Shows that: this program instantiates the earned kernel to realise the
  described behaviour; no extra semantics beyond earned operators are assumed.
