---
type: reference
class: foundational
status: active
authors: ["Arthur Conmy", "Augustine N. Mavor-Parker", "Aengus Lynch", "Stefan Heimersheim", "Adrià Garriga-Alonso"]
year: 2023
venue: "NeurIPS 2023"
title: "Towards Automated Circuit Discovery for Mechanistic Interpretability"
---

# Conmy et al. 2023 — ACDC

Conmy, A., Mavor-Parker, A. N., Lynch, A., Heimersheim, S., &
Garriga-Alonso, A. (2023). Towards Automated Circuit
Discovery for Mechanistic Interpretability. *Advances in
Neural Information Processing Systems* 36.

ACDC (Automated Circuit DisCovery) automates a key part of
the circuit-tracing methodology established by manual case
studies. Given a behavior and a metric, ACDC iteratively
prunes edges from the computational graph: start with the
full graph; for each edge, test (via patching) whether
removing it damages behavior; remove edges whose removal
doesn't matter; iterate.

The result is a minimal subgraph approximating "the circuit"
for the studied behavior, found in compute time orders of
magnitude less than manual identification. The paper
validates ACDC by recovering known circuits (IOI, induction)
that match published manual identifications.

ACDC has limits:
- The minimal subgraph may include spurious edges.
- It identifies the components but doesn't explain their
  algorithm — manual interpretation of ACDC output is
  still required.
- Compute scales with graph size; full-network ACDC is
  infeasible for frontier models.

It is the dominant *automated* counterpart to manual
circuit-tracing and has become standard infrastructure for
mechanistic interpretability research.

Cited by:
[circuit](teaching/explanations/circuit.md),
[computational-graph](../objects/computational-graph.md),
[activation-patching](../morphisms/activation-patching.md),
[circuit-tracing](../morphisms/circuit-tracing.md).
