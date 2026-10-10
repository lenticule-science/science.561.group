---
title: "Self-hosting bootstrap — minimal external tools"
description: "v0.2 (now v0.3 per the trusting-trust-bootstrap-path decision) is self-hosting. What's the minimal set of external tools needed for the very-first v0.1 build, and how does the substrate defend the bootstrap against trusting-trust attack?"
kind: question
status: discharged-by-decision
date: "2026-05-02"
discharged-by: "decisions/trusting-trust-bootstrap-path.md"
---

## Discharge note (2026-05-02)

The trusting-trust facet of this question is discharged by [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md), which:

- Retargets self-hosting from v0.2 to v0.3.
- Names the three structural defences (bootstrap reproducibility under Nix/Guix, cross-implementation replay-diversity check, witnessed toolchain).
- Selects **Option B** below (partial self-hosting; closure rules / runbooks / drivers from inside, kernel/algebra changes still require external dev with the diverse-double-compiling discipline).

The minimal-external-tools facet (the original §"What the bootstrap needs" list) remains current — host OS + Nix/Guix + git + `nix build .#default` is unchanged.
The captain's call below is recorded as **B**.

---

# Self-hosting bootstrap

Per [decisions/self-hosting-by-v0.2.md](../decisions/self-hosting-by-v0.2.md), the OS is self-hosting from v0.2.
But v0.1 needs to be built from another OS — the bootstrap.

## What the bootstrap needs

To produce the first v0.1 image:

- A host OS (Linux, macOS, or BSD).
- Nix or Guix installed on the host.
- The OS source tree cloned via git.
- `nix build .#default` to produce the image.

After v0.1 boots, the captain can:

- Continue developing in the host OS for convenience.
- Or transition to substrate-internal development at v0.2 onwards.

## The question

Should we treat the bootstrap as "external dev environment is required for v0.1 only" or "external dev environment is required for v0.1, with a transition path"?

Concretely: for v0.1 → v0.2 self-hosting, do we need the OS to be able to do everything externally available, or is a subset sufficient (e.g., closure-rule editing, but not fundamental kernel changes — those still done externally until v0.3+)?

## Options

- **A.** v0.2 self-hosting is total: every change to the OS source can be made from inside the OS.
  Aggressive.
- **B.** v0.2 self-hosting is partial: closure rules, runbooks, drivers can be edited from inside; kernel/algebra changes still require external dev.
  Realistic.
- **C.** v0.2 self-hosting is a goal but not a gate: ship v0.2 with the substrate-internal path *available*, accept that early use will mostly be external.

## Captain's call

**B** (recorded 2026-05-02 by the trusting-trust-bootstrap-path decision). v0.3 self-hosting is partial: closure rules, runbooks, drivers, and dev-doc edits can be authored inside the substrate; kernel/algebra changes still require external dev with the diverse-double-compiling discipline per [decisions/trusting-trust-bootstrap-path.md](../decisions/trusting-trust-bootstrap-path.md).
