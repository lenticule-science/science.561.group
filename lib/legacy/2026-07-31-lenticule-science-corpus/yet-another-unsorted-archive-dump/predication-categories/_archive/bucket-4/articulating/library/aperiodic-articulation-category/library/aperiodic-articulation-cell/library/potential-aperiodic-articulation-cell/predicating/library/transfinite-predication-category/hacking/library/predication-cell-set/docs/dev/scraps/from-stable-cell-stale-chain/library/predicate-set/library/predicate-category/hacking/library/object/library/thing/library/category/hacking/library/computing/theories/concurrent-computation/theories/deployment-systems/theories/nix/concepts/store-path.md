---
type: concept
class: identifier
see-also: [derivation, store, flake]
---

# Store path

A *store path* is a path of the form `/nix/store/<hash>-<name>` where `<hash>` is a 32-character base-32 SHA-256 fingerprint and `<name>` is a human-readable label. The path is both an identifier and a filesystem location: the bytes named by the path live at that filesystem path on a host that has them; the same path on another host names the same bytes.

Two structural commitments make the store path more than a filesystem convention:

- **The hash is computed from the inputs that produced the path, not chosen.** For an input-addressed derivation (the default), the hash is computed from the canonical .drv serialization of the recipe — the builder, the args, the env, the input store paths, the system tuple, every input-affecting field. Two recipes that differ in any input-affecting way produce different hashes; two byte-identical recipes produce the same hash. The path's identity is therefore the identity of the recipe that produced it.
- **The path is the unique location at which the bytes may live.** Nix does not allow the same content to be stored at two different paths or different content at the same path. A given hash means a given content. (Under the content-addressed-derivation extension, the hash is computed from the output bytes themselves rather than the recipe; the same identity-equals-content discipline holds, with a different basis.)

The store path is what makes builds reproducible across hosts: building the same derivation on host A and host B produces (assuming hermeticity) the bytes at the same path, and a substituter on host C can host those bytes for both. Distribution is by hash equivalence.

## Variants

- **Input-addressed (default).** Hash from the canonical .drv recipe. The path is fixed *before* the build runs; the build is expected to produce content matching the path.
- **Content-addressed (opt-in).** Hash from the output bytes after the build. The path is fixed *after* the build runs; the same recipe may produce different paths on different hosts if its output bytes differ (which, given hermeticity, should not happen, but the discipline does not assume hermeticity is perfect).
- **Fixed-output.** A special case where the derivation declares the expected output hash. Used for fetching from the network — the derivation declares what it expects to download, and Nix verifies the result matches.

## What the store path is not

The store path is not a filesystem location chosen by a packager and reused across versions. The location is computed from the recipe (or from the output content); a new recipe means a new path. A store path that an operator memorizes today will not be the path for tomorrow's recipe of the "same" software.

The store path is not a name a user is expected to type. The expected user surface is the derivation (referenced through a flake output), and the path is what Nix derives from it. Operators interact with derivations and outputs; only debugging and substitution-protocol work usually engages the path directly.
