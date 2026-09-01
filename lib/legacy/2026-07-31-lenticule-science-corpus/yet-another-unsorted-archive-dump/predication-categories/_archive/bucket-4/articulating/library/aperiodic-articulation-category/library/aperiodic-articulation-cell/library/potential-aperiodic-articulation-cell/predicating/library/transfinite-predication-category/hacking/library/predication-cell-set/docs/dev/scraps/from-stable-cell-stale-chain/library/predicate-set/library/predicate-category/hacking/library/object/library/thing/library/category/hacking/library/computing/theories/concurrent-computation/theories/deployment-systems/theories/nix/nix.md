---
title: "Nix"
component-of: deployment-systems
---


The deployment-system whose engineering content is: artifacts are *content-addressed derivations* in a purely-functional store, and the specification is a *Nix expression* evaluated lazily to a derivation tree. Originated in [Eelco Dolstra's 2006 thesis "The Purely Functional Software Deployment Model"](https://edolstra.github.io/pubs/phd-thesis.pdf); developed since as the system underlying NixOS, Guix (a sister system that forked the design), and a steadily-growing surface of build, package, configuration, and deployment tooling.

This sub-theory describes Nix *as Nix is* — its language, its store, its evaluator, its builder, its flake fragments, its profile generations, its substituter discipline. The theory is descriptive of the system's structural commitments; the predication-categorical reading of those commitments lives in the [predicated-nix](theories/predicated-nix/_index.md) sub-sub-theory and is deliberately separated.

## Structural commitments Nix makes

Nix can be characterized by what it commits to:

- **Specifications are written in a pure, lazy, total-functional language.** A `.nix` file describes how to compute values; evaluation has no side effects beyond writing derivations to the store. Lazy: only what is reached is evaluated.
- **Built artifacts are content-addressed.** Each store path `/nix/store/<hash>-<name>` carries a hash that is computed from everything that went into producing the path — by default, from the recipe and its input closure (input-addressed); under the content-addressed-derivations extension, from the output bytes themselves.
- **Build is sandboxed and hermetic.** A builder runs in a sandbox that exposes only the declared inputs; outputs land at the predetermined store path; impurities (network, time, randomness, ambient filesystem) are blocked unless explicitly allowed.
- **Modular fragments declare their own boundary.** A *flake* declares its inputs (other flakes, identified by URL + revision) and its outputs (a tree of values: packages, devShells, apps, NixOS modules). The `flake.lock` pins each input to a specific revision so the resolution is reproducible.
- **Profiles record installed-state generations.** A profile is a chain of generations; each generation is a snapshot of "what is installed at this point"; rollback is moving to a prior generation.
- **Distribution is by hash equivalence.** A binary cache (substituter) hosts pre-built outputs indexed by their store-path hash; if the local store needs a path the substituter has, the bytes are fetched rather than re-built.

## Convention

Inherits the [deployment-systems](../../_index.md) convention. One entity per file; YAML frontmatter; lower-kebab-case slugs.

## Layout

- `concepts/` — semantic anchors that recur in describing Nix: derivation, store-path, store, evaluator, builder, flake, flake-lock, profile, generation, substituter, sandbox, …
- `objects/` — definitions of the structures Nix commits to: the .drv record, the store-path identifier, the flake-lock file shape, the profile generation chain.
- `morphisms/` — Nix's operative moves: evaluate, instantiate, build, substitute, garbage-collect, switch-generation, rollback.
- `theorems/` — claims about Nix that follow from its structural commitments (purely-functional evaluation is reproducible; same-recipe → same-output-path; etc.).
- `examples/` — concrete Nix expressions, flakes, NixOS configurations.
- `narratives/` — short documents walking through how Nix works as a coherent whole.
- `questions/` — open engineering questions about Nix specifically.
- `references/` — annotated bibliography (Dolstra's thesis, the Nix manual, the flake RFC, papers on content-addressed derivations).
- `theories/` — sub-theories; currently:

  - [predicated-nix](theories/predicated-nix/_index.md) — Nix read through the predicated-computing apparatus: which substrate commitments Nix realizes, which it does not, and what the gap means structurally.

## Status

Skeleton with seed concepts. The substantive predication-categorical reading has been started in [predicated-nix](theories/predicated-nix/_index.md); the descriptive sub-theory here will accumulate as the predicated-nix work surfaces concepts that need fully-grounded Nix-side definitions.
