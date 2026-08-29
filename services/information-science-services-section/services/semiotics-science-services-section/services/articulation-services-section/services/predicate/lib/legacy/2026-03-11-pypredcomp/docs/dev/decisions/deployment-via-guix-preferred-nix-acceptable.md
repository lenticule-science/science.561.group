---
title: "Deployment via Guix preferred, Nix acceptable"
description: "Guix is the captain's deployment aspiration. Nix is the practical fallback. NixOS rejected."
kind: decision
status: accepted
---

# Deployment via Guix preferred, Nix acceptable

**Decision.** The substrate is deployed via a reproducible image built from a declarative manifest.
Guix is preferred (Lisp-all-the-way-down composition aspiration).
Nix is the practical fallback.
NixOS as a top-level OS is rejected; a Guix system image is the long-term goal.

**Why.** From [guix-guile-composition-layer](../../../../../../../../operations/engineering/triage/operations/command/ideas/triage/guix-guile-composition-layer.md):

> on like, erlang or nixos, this actually segues well into something I've said to someone I talk to about this stuff, which is my aspiration is a Guix/Guile... image or whatever.
> I *love* lisp and I know we want to do rust for like, security and good reasons, love using rust, i think maybe guix as composer is an idea to consider carefully.

The captain's reasoning:

- **Lisp all the way down.** Guix uses Guile Scheme for everything: package definitions, system configurations, even system-level scripts.
  The S-expression layer is uniform.
- **Live eval.** Hot-swap meaning eval-ing new expressions into the running system; this matches the substrate's "every operative element is a substrate entity" commitment at the OS layer.
- **The image concept.** Guix system images are reproducible, atomic, rollback-capable.
  The 561 group's computer should be deployable as one such image.
- **Guile FFI to Rust.** The Rust engine integrates via C FFI; Guile speaks C FFI.
  Composition is feasible.

Why not NixOS: Nix's expression language is *not* a Lisp; it's a custom functional DSL.
The captain values Lisp specifically for the relational-expression-syntax aspiration.
NixOS as a top-level OS would lock in non-Lisp semantics for system configuration.

Why Nix is the fallback: tooling, package count, and developer ergonomics around Nix are much more mature than Guix today.
For initial deployment (especially in shared CI environments, on Replit, or for people without prior Guix exposure), a Nix flake gets the slice running.
The conversion from Nix to Guix is mostly mechanical for the substrate's needs.

**What this rules out.**

- `pip install` or `npm install` outside a pinned environment.
- Docker-only deployment without a corresponding Nix or Guix manifest.
  (Docker images MAY be built *from* Nix/Guix.)
- System-level configuration in YAML or TOML at the top of the image.
  The image's substrate is Guix manifest (or Nix flake fallback).

**What this does not constrain.**

- Build tools the agent uses *inside* the image: cargo, npm, etc. are fine, as long as the image rebuilds them deterministically.
- The Replit Agent's working environment may use whatever Replit provides; the *output* artifact (a deployable image) must be Nix-or-Guix-built.
- Existing Hugo / Jekyll / website-generation pipelines are fine as derived steps off the substrate.

**Migration path.**

1. Start with a Nix flake; ship the slice.
2. Once the substrate is exercised, port the flake to Guix manifests.
3. Eventually, the Guix system image is the canonical deliverable; Nix flake is documented as legacy.

This sequencing lets the agent ship sooner without losing the long-term direction.
