---
type: concept
class: artifact-recipe
see-also: [store-path, store, flake]
---

# Derivation

A *derivation*, in Nix, is the recipe for a single build step: an attribute-set with a fixed shape that names which builder to run, with which arguments, in which environment, against which input dependencies, on which platform, and where to place the resulting outputs. After evaluation, a derivation is materialized as a `.drv` file in the store — a serialized, content-addressed record of the recipe.

A derivation, concretely, has the following structural slots:

- `name` — a human-readable label.
- `system` — the platform tuple the build targets (e.g. `x86_64-linux`).
- `builder` — the executable that runs the build (a path into the store, typically a shell or compiler).
- `args` — the arguments passed to the builder.
- `env` — environment variables exposed to the builder.
- `inputDrvs` — the set of other derivations that must be realized before this one builds.
- `inputSrcs` — the set of source paths the build reads.
- `outputs` — the set of outputs the build produces (typically `out`, sometimes also `dev`, `bin`, `lib`, `man`, etc.). Each output has a predetermined store path.

Two structural commitments distinguish a Nix derivation from "a build script":

- **The recipe is content-addressed.** Two derivations whose recipes are byte-identical (modulo the canonical .drv serialization) get the same store path. Two whose recipes differ — in any input-affecting way — get different store paths. This is what makes builds reproducible and what makes binary caches possible.
- **The build is hermetic.** A builder runs in a sandbox that exposes only the declared `inputDrvs` and `inputSrcs`; the network is off (unless the derivation is fixed-output and declares its result hash); the filesystem outside the sandbox is hidden; ambient state cannot leak in. The output bytes are a function of the recipe.

A derivation is the unit at which Nix reasons about *what to build*; a [store path](store-path.md) is the unit at which Nix reasons about *what has been built*; a [flake](flake.md) is the unit at which Nix reasons about *modular collections of derivations and their boundaries*.

## How a derivation is produced

Derivations are not authored directly. A user authors a Nix expression (a `.nix` file); the [evaluator](../_index.md) reduces the expression to values; when a value is a function call to `derivation { … }` (or to a higher-level helper like `mkDerivation` or `writeShellApplication` that wraps it), the evaluator emits a `.drv` file. The .drv file is the canonical serialization of the derivation; from it, the output store path is computed deterministically as a hash of the recipe.

The two-step structure — *evaluate to derivation*, *build the derivation* — is structural: evaluation is pure and lazy; building is the impure, sandboxed step where bytes are produced.
