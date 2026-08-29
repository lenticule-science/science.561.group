---
type: concept
class: store
see-also: [store-path, derivation]
---

# Store

The *Nix store* is the directory tree at `/nix/store/` plus the surrounding metadata in `/nix/var/nix/db/` that records what is currently in the store, what depends on what, what is reachable from which roots, and (for some operations) when each path was added or last accessed.

Two structural commitments define the store:

- **Every path in the store is content-addressed.** Per [store-path](store-path.md), each path is `/nix/store/<hash>-<name>` and the hash is determined by the path's content (or recipe). The store has no naming scheme other than this; there is no `/nix/store/foo-latest` symlink, no version-based path layout, no per-package directory hierarchy.
- **The store is append-only at the path granularity.** New paths are added by build (or by substitution from a binary cache); existing paths are never edited. The bytes at `/nix/store/<hash>-<name>` are fixed once the path is written. Removal happens only through garbage collection, which deletes paths no longer reachable from declared roots.

The store is therefore a flat namespace of immutable content-addressed bytes. Reachability — what depends on what, what is rooted by what — is held in the metadata DB, not encoded in the directory layout.

## What the store knows

The store's metadata records, for each store path:

- The set of *references* — other store paths whose content this path's bytes mention. Computed at build time by scanning the output bytes for store-path-shaped strings; this is the dependency graph at the bytes-of-the-output level, not at the recipe level.
- The set of *deriver* derivations — which `.drv` files produced this path.
- The path's signature, if it was substituted from a signed binary cache.

The store does not know what *intent* a path serves (it is not a package manager's "this is GCC version 12.2"); it knows only what bytes are at the path and what other paths the bytes refer to. Intent is supplied by the surrounding flake / profile / operator-facing tooling.

## Store roots

A path remains in the store as long as it is reachable from a *root* — a symlink in `/nix/var/nix/gcroots/` (or the indirect roots that the various Nix tooling place there: profile generations, build result symlinks, currently-running daemons' references, and so on). Garbage collection retracts paths no longer reachable from any root.

Per [store-path](store-path.md)'s identity discipline, removing a path and re-creating it (via build or substitution) yields a path whose content is byte-identical to the removed one. The store's commitment to immutability is therefore *per-path*, not *per-store-history*: a path that is GC'd and rebuilt is the same path with the same content.
