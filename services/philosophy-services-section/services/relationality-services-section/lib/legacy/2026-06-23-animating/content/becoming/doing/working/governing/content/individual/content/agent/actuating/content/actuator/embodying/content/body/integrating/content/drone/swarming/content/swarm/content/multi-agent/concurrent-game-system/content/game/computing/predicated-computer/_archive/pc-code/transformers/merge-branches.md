---
type: morphism
class: composed-operator
realizes: [branched-substrate-state]
depends-on: [merge, coherence-glue]
see-also: [fork-branch, sync]
---

# Merge branches

The operator that combines two branches' divergent content into a third (or back into one of the originals), resolving conflicting predications per the substrate's [coherence-glue](coherence-glue.md) discipline. Merge-branches is the substrate's "bring parallel perspectives back together" primitive.

## Signature

`merge-branches(target-branch, source-branch, agent, scope) → (merged-commit, witness) | (conflict-rejection, witness)`

Inputs:

- **`target-branch`** — reference to the branch that receives the merge. The target's content is updated; its history records the merge.
- **`source-branch`** — reference to the branch whose content is being merged into the target.
- **`agent`** — reference to the agent performing the merge. Must be authorized to merge within the scope.
- **`scope`** — the scope the merge operates within.

Outputs:

- **`merged-commit`** — the new commit on the target branch combining both branches' content. Predications: `merges(target, source)`, the target's new head pointer, the merge's authoring agent.
- **`conflict-rejection`** — merge cannot proceed without governance decision: irreducible conflicts on predications that the substrate's repair recipes cannot resolve, signature failures, authorization revocation.
- **`witness`** — records the merge: source and target branches, the substrate state before, the conflict resolution applied, the substrate state after.

## Operational semantics

Merge-branches proceeds in seven steps:

1. *Validate inputs.* Check that both branches exist and are not retired, the agent is authorized, the scope admits the merge.
2. *Compute branch divergence.* Find the most-recent common ancestor of the two branches in the branches' history graph. The divergence is the set of predications added or retracted on each side since the common ancestor.
3. *Identify conflicts.* For each predication-coordinate (subject, predicate, object) where both branches have asserted different values since the common ancestor, the predication is in conflict. Predications where only one branch has changed since the common ancestor are non-conflicting and merge by simple precedence.
4. *Apply value-domain join.* For each predication-coordinate (conflicting or otherwise), apply the substrate's [merge](merge.md) operator. Per [substrate-value-domain](teaching/explanations/substrate-value-domain.md), the join is commutative-associative-idempotent; non-conflicting changes merge cleanly. Conflicting changes produce contested predications ($\top$ values) that require coherence-glue.
5. *Apply coherence-glue.* For each $\top$-valued predication, invoke [coherence-glue](coherence-glue.md) per the substrate's repair recipe. The recipe may produce a single resolved value (the conflict is resolved), parallel-edges-until-resolved (both values admitted with their provenance, awaiting later resolution), or escalate to governance (the conflict is irreducible by the catalog's recipes). Irreducible conflicts produce a conflict-rejection.
6. *Insert merge commit.* Insert (per [insertion](insertion.md)) predications recording the merge: `merges(merged-commit, target-branch, source-branch)`, the resolved values from step 5, the new head pointer for the target.
7. *Witness emit.* Per the substrate's witness discipline, the merge is recorded with the resolution decisions auditable.

## Engineering invariants

- **Common-ancestor-based.** The merge operates over the divergence since the common ancestor, not the entire content of both branches. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the common ancestor is identified by content-hash equality on the substrate's commit history.
- **Resolution is auditable.** Every conflicting predication's resolution is in the witness chain: which values were in conflict, which recipe was applied, what the resolved value was. The substrate's audit can replay any past merge.
- **Replay-deterministic.** Per [settlement-determinism](../theorems/settlement-determinism.md), replaying the merge on the same input branches with the same operator specifications produces the byte-identical resolved state. Two substrates that merge the same branches reach the same merged content.
- **Idempotent.** Merging a branch into itself, or merging an already-merged branch, produces no new content. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the substrate's content-hash deduplication catches this.

## Failure modes

- **Irreducible conflicts.** The substrate's repair catalog has no admissible recipe for some conflicting predication. Per [coherence-glue](coherence-glue.md), the conflict is rejected with the rejection citing the unresolvable predications. Governance intervention is required.
- **Authorization revoked.** Per ordinary admission discipline, an agent whose authorization was revoked between merge request and merge admission cannot complete the merge.
- **Branch retired between request and merge.** The source or target branch's `retired` predication was inserted during the merge operation. Reject per substrate policy.
- **Schema mismatch.** Per [schema-evolution](teaching/explanations/schema-evolution.md), the source and target branches may have evolved their schemas independently. If the merge cannot be admitted under either branch's current schema, the merge is rejected and a bridge is required.

## Position in the substrate

Merge-branches is the substrate's *reconciliation primitive*. Combined with [fork-branch](fork-branch.md) (the operator that creates parallel branches), it is what makes the substrate's [branched-substrate-state](teaching/explanations/branched-substrate-state.md) discipline operational.

The morphism composes with [merge](merge.md) (the substrate-level primitive for value-domain joins), with [coherence-glue](coherence-glue.md) (the conflict-resolution primitive for predications $\top$-valued after merge), with [insertion](insertion.md) (the underlying primitive for the merge-commit predications), with [retraction](retraction.md) (when the substrate's repair recipe retracts a conflicting value), and with [sync](sync.md) (a federation sync between substrates is structurally a merge-branches operation across substrate boundaries).
