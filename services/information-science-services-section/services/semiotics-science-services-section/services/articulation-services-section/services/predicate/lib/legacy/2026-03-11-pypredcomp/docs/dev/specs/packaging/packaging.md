---
title: "Packaging"
description: "Package format, Nix flake spec, Guix manifest spec, image build, upgrade flow, dependency resolution."
kind: index
---


How the OS distributes itself and applications.
The captain has chosen Nix or Guix as the reproducible-build substrate; this directory specifies the package format and image-build pipeline.

## Specs (to be written at v0.1 partial; v0.2 full)

- `package-format.md` — package-record substrate cells with name, version, dependencies, manifest, signing.
- `nix-flake-spec.md` — the Nix flake structure for OS images; v0.1 ships this.
- `guix-manifest-spec.md` — Guix manifest equivalent; v0.2 ships this.
- `image-build.md` — package records → Nix derivations or Guix manifests → bootable image; build pipeline.
- `upgrade-flow.md` — drain → replace image → resume; with rollback.
- `dependency-resolution.md` — transitive closure of package-records; semver-equivalent versioning; conflict detection.

## To be written at v0.6 (application development)

- `sdk.md` — the SDK shape; capability-typed entry points; substrate-resident library; binding rules.
- `package-authoring.md` — manifest, signing (Ed25519), distribution; package registries as federated substrate fibers.
- `third-party-workflow.md` — developer onboarding from install-SDK to ship-app.

## Sibling-theory grounding (per [`references/theories.md` §"Sibling computing theories"](../../references/theories.md))

Packaging draws implicitly on the [`software-engineering`](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/software-engineering/) sibling — the meta-theory of how software is built.
The reproducible-build discipline (`nix-flake-spec.md`, `guix-manifest-spec.md`, `image-build.md`) and the package-authoring workflow (`package-authoring.md`, `third-party-workflow.md`) are software-engineering claims at substrate scope.
The "what counts as a real landing" rules in [`pypredcomp/AGENTS.md`](../../../../AGENTS.md) and the workflow recipes in [`implementation/workflows.md`](../../implementation/workflows.md) are the captain-side projection of the same theory.
Future packaging specs cite this sibling explicitly when the discipline is novel relative to a Nix-tradition or Guix-tradition default.

## Theory grounding

Packaging implements:

- `predicated-computing/objects/container-image` — the deployment unit.
- `predicated-computing/objects/deployment-record` — deployment lifecycle.
- `predicated-computing/objects/rule-system-version` — versioned capability sets.
- `predicated-computing/concepts/migrate-rule-system` — upgrade discipline.
- `database-platform/concepts/online-schema-change` — non-disruptive schema migration during upgrade.

The library has container-image and rule-system-version; this directory adds **dependency resolution**, **semver-equivalent versioning**, **rollback discipline**, **package registry**, **third-party authoring** which are not in the library.

## Conformance

Packaging passes:

1. `nix build .#default` on the OS source tree produces a byte-identical image (modulo Nix-pinned reproducibility).
2. The Guix manifest for the same source produces an equivalent image.
3. Upgrade-then-rollback returns the substrate to its pre-upgrade state.
4. Dependency resolution detects conflicts before install; refuses with clear error messages.
5. Package signing/verification round-trips byte-identically.

## Plan 9 / Unix analogue

| Unix concept | Packaging analogue |
|---|---|
| `apt` / `pacman` / `nix-env` | Package commands operating on package records |
| `/var/lib/dpkg` | Package records as substrate cells |
| RPM / DEB | Package format (substrate-native) |
| `apt-get update` | Federation sync on package registry fibers |
| `make install` / `nix-shell` | Image build pipeline |
| `update-grub` | Upgrade flow with rollback |
