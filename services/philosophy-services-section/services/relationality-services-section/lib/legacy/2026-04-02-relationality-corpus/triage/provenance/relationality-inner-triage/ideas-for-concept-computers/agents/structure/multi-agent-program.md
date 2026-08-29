---

name: multi-agent-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program coordinates multiple agents as recognitions so their roles,
policies, and interactions are explicit.

## Behaviour

- Represent agents, roles, capabilities, policies, and coordination protocols as
  recognitions with provenance.
- Track interactions, commitments, and outcomes between agents.
- Measure performance, reliability, and alignment across teams of agents.

## Intended operators

- Register and provision agents with policies and capabilities.
- Plan and execute coordinated tasks; record traces of interactions.
- Analyse multi-agent behaviour and adjust policies or roles accordingly.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

