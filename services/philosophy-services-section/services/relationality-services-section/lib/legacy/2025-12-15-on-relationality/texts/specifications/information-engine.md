---
title: Relational Information Engine
tags:
  - specification
  - information
  - hypertensor
  - measurement
depends_on:
  - measurement-stack
  - profile-flow
  - tower-interaction
  - sheaf-semantics
  - universal-state-hypertensor
  - universal-dynamics-sheaf
---
# Specification (Relational Information Engine)

This specification treats the relational computer as an **information engine**:
its job is to turn raw payloads into structured information living in the
quasicrystalline hypertensor sheaf, and to provide domain-specific views of
that information.

## 1. Canonical pipeline

The engine is organised as a canonical pipeline:

1. **Intake / coding.**  
   External payloads (HTTP, MCP, files, etc.) are encoded as recognitions via
   intake runbooks and `seed-*` acts.  The result is a TracePoint with acts,
   trace IDs, and minimal structured content.

2. **Measurement & normalization.**  
   Measurement-stack acts (`measure`, entropy acts, profile measurement, etc.)
   turn recognitions into observables, distributions, and entropy values, and
   enforce renewal/baseline laws.  Normalization/reducibility acts turn raw
   syntax/observations into canonical forms.

3. **Towers and flow.**  
   Tower-interaction acts (`build-profile-tower`, nested/composite towers)
   assemble observable profiles into towers over fibres.  Flow/nucleus acts
   (`fix-flow-nucleus`, `commute-flow-and-nucleus`, etc.) evolve these towers
   and their geometry according to the flow–nucleus compatibility theorems.

4. **Sheaf / hypertensor state.**  
   Sheaf and hypertensor acts realise finite sections of the global state
   as carriers of the form `(window, towers)`:
   - `window` is a lattice window object (indices, metadata),
   - `towers` is a finite family of profile towers attached to fibres over the
     window.
   Acts from the dynamics stack (observation kernels, profile-kernel chains,
   fixed chains, Markov dynamics) act locally on these sections.

5. **Domain views.**  
   Domain stacks (physics, knowledge, policy, text, finance, etc.) are
   specified as **views** of the hypertensor sheaf: each is a way to read/write
   sections or towers, together with invariants (e.g. physical soundness, RDF
   consistency, policy constraints).

## 2. Implementation requirements

The runtime must provide:

- **Canonical runbooks** implementing each stage of the pipeline:
  - intake/validation runbooks (observation intake, traceability),
  - measurement/tower runbooks (profile measurement, tower construction),
  - sheaf-section runbooks (build and persist `(window, towers)` sections),
  - sheaf-dynamics runbooks (apply Markov/measurement dynamics to sections),
  - flow/nucleus runbooks (directed space, flow nucleus, commutation).

- **Stable carriers**:
  - TracePoint/recognition schemas for persisted observations/judgements,
  - tower carriers (`ProfileTower`, profile levels),
  - hypertensor/sheaf carriers (`LatticeWindow`, `LatticeSite`,
    `SheafSection`),
  - domain-specific carriers where required by domain specs.

- **Invariants as tests**:
  - Intake/measurement: schema validity, normalization, policy checks.
  - Towers: consistency of height/levels and attachment to fibres.
  - Sheaf sections: window sites must refer to actual tower recognitions, as
    in the sheaf-sections theorem.
  - Dynamics: Markov kernels must be row-stochastic; fixed chains must agree
    with underlying kernel chains; flow/nucleus acts must witness the
    commutation properties stated in the flow–nucleus compatibility theorem.

## 3. Domain slices

Domain specifications (physics, knowledge graph, ActivityPub, MUDs, finance,
ecology, etc.) are expressed as **slices of the information engine**:

- each domain defines how to encode its raw payloads into recognitions and
  observables,
- identifies the towers/sections that carry its state, and
- declares additional invariants to be enforced by runbooks.

No domain introduces a separate notion of "data vs knowledge"; all stateful
effects and interpretations arise from applying earned acts to the shared
hypertensor information manifold.
