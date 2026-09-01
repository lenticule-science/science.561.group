---
type: question
status: open
explores:
  - ../../../../../../predicated-computing/concepts/predication-substrate.md
---

# Binary caches as substrate federation

The substrate has a federation discipline (per `theorems/federation-convergence.md` and the surrounding narratives in predicated-computing — referenced but not read by the author of the opening mapping pass). The discipline is structured around CRDT-shaped merge of bilattice-valued cells across federated peers, with cohomological invariants that the substrate's federation theorem ensures converge.

Nix has binary caches (substituters): hosts that serve pre-built outputs by store-path hash. When a local Nix needs a path it does not have, it queries the configured substituters; if one has the path, the bytes are fetched and admitted to the local store, optionally with a signature check.

The question is whether binary caches realize the substrate's federation discipline — i.e., whether two Nix stores with overlapping content sharing through a substituter are doing what `federation-convergence.md` says federated substrates do.

## What seems to match

- **Federation by hash equivalence.** The substrate commits to federation by content-address; Nix federates by store-path hash, which is content-address for input-addressed and content-addressed derivations.
- **No coordination required.** Two Nix stores sharing through a substituter do not coordinate; they exchange bytes by hash on demand. The substrate's CRDT-shaped federation similarly requires no inter-replica coordination on individual cell merges.
- **Convergence.** Two stores that have fetched the same set of paths from the same substituters have byte-identical content for those paths. This is "strong eventual consistency" at the path level.

## What seems to mismatch

- **No bilattice merge.** The substrate's federation merges bilattice values cellwise via $\vee_k$ (knowledge-join). Nix's "merge" is just *"do you have this hash? if so, fetch the bytes."* There is no value-merge because Nix's value-domain is thin (per [thin-value-domain](teaching/explanations/thin-value-domain.md)).
- **Disagreements are errors, not $\top$-cells.** If two substituters report different bytes for the same input-addressed path, Nix raises a hash-mismatch error. The substrate would raise the cell to $\top$ and queue a repair.
- **No cohomological convergence claim available.** The substrate's federation-convergence theorem (per `predication-substrate.md`'s reference and the structural-lineage narrative's discussion of CRDTs and Mayer-Vietoris vanishing) is grounded in the value-domain being a bilattice with $\vee_k$-join. Nix's value-domain does not give the same theorem; whatever convergence Nix has is at the byte level under hash equivalence, not at the cohomological level the substrate's theorem characterizes.

## What is unverified

- **Whether the substrate's federation theorem has a degenerate case for thin value-domains.** Could the theorem reduce, when the value-domain is $\{0, 1\}$-Boolean (or close to it), to "two stores with the same hash for path $p$ have the same bytes at $p$"? This is what Nix actually has. If the theorem reduces this way, Nix's binary-cache discipline is the trivial-bilattice case of the substrate's federation, not a different discipline.
- **What the federation envelope looks like for Nix.** Per `concepts/federation-envelope.md` (referenced in `bootstrap-content.md`, not read), federated substrates exchange envelope-wrapped messages. Binary cache HTTP responses are not envelopes in this sense; they are HTTP. Does that mismatch matter, or is the envelope discipline just one valid realization that Nix happens not to use?

## What would resolve the question

Read predicated-computing's `theorems/federation-convergence.md` and `objects/federation-bridge.md`, and the structural-lineage narrative's CRDT material. Determine whether the federation theorem's statement requires the value-domain to be a non-trivial bilattice, or whether thin lattices satisfy a degenerate form. If the latter, lift Nix's binary-cache discipline as the trivial-bilattice instance; if the former, record that Nix's binary-cache discipline is *not* substrate-federation in the substrate's specific sense.
