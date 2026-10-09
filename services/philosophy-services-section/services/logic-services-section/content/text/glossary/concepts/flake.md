---
type: concept
class: module
see-also: [derivation, store, store-path]
title: Flake
description: "A flake is a Nix expression with a declared boundary: a flake.nix file that exposes two top-level attribute sets — inputs (what other flakes this flake federates with, identified by URL plus optional revision pin) and outputs (a function…"
---

# Flake

A *flake* is a Nix expression with a declared boundary: a `flake.nix` file that exposes two top-level attribute sets — `inputs` (what other flakes this flake federates with, identified by URL plus optional revision pin) and `outputs` (a function from the resolved inputs to a tree of values: packages, devShells, apps, NixOS modules, checks, …).

The flake is Nix's modular fragment. Two structural commitments distinguish it from a plain `.nix` file:

- **Inputs are pinned to specific revisions.** Each input URL is resolved (at `nix flake update` time) to a specific commit / tarball / store path, and the resolution is recorded in `flake.lock`. Subsequent evaluations re-fetch the input by its pinned revision; the flake's evaluation is therefore reproducible across hosts and across time.
- **Outputs follow a declared schema.** The output attrset is structured by names Nix understands: `packages.<system>.<name>`, `devShells.<system>.<name>`, `apps.<system>.<name>`, `nixosConfigurations.<host>`, `checks.<system>.<name>`, etc. Tooling can introspect a flake without evaluating it deeply — `nix flake show` enumerates the output schema.

A flake is therefore a self-contained, reproducibly-resolved, schema-conformant Nix module. It is the unit at which Nix expressions are *shared*, the unit at which CI consumes them, and the unit at which a deployment is identified ("deploy this flake's `nixosConfigurations.host`").

## flake.lock

The lock file is a JSON record of input resolution. Each input has an entry with: the input's source URL, the resolved revision (Git commit, tarball hash, etc.), the resolved tree's narHash, and the input's own input edges (so the lock graph is closed under transitive dependencies; `flake.lock` lists *every* flake reachable through the input graph).

`nix flake update` re-resolves inputs to their latest versions and rewrites `flake.lock`. `nix flake update <input-name>` re-resolves only that input. `nix flake lock` ensures the lock is complete and consistent. Until any of these is run, the lock is the recorded resolution and the flake's evaluation will use it; the flake therefore evaluates to the same result whether run today or a year from now, regardless of upstream changes — provided the pinned revisions are still fetchable.

## What the flake gives that a plain .nix file does not

- **Reproducible input resolution.** A plain `.nix` file may import other expressions by string (a Git URL, a tarball URL, a path); those imports re-evaluate to whatever the source is *now*. A flake's imports are pinned.
- **Hermetic evaluation.** Flake evaluation is restricted to the flake's source tree and its resolved inputs; reads outside this set are blocked. A plain `.nix` file evaluation can read arbitrary filesystem paths and the surrounding NIX_PATH.
- **Output schema.** A plain `.nix` file's output is whatever the file's expression evaluates to; a flake's outputs follow a declared, tool-introspectable shape.
- **An identity.** A flake reference (`github:owner/repo`, `path:./local`, `git+ssh://…`) plus the resolved revision uniquely identifies the flake's evaluation. The identity is the flake-side analog of [store-path](store-path.md) at the source / specification level.
