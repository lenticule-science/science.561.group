---
type: morphism
class: composed-operator
realizes: [branched-substrate-state]
depends-on: [insertion, emit-witness, predication-fibration, predication-valuation]
see-also: [merge-branches, multi-observer-system]
---

# Fork branch

The operator that creates a new [branch](teaching/explanations/branched-substrate-state.md) of substrate content, originating from a chosen commit of an existing branch. Structurally, fork-branch creates a parallel sub-fibration of the substrate's [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) sharing content-addressed predications with the source branch up to the fork commit, then diverging into its own [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) trajectory. Two branches sharing a substrate form a [multi-observer system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md) whose discrete observer category has each branch as one observer.

## Signature

`fork-branch(source-branch, source-commit, new-branch-id, agent, scope) → (forked-branch-record, witness) | (rejection, witness)`

Inputs:

- **`source-branch`** — reference to the existing branch to fork from.
- **`source-commit`** — reference to the commit on `source-branch` at which to fork. The fork's initial valuation is the source's valuation at that commit.
- **`new-branch-id`** — the identifier for the new branch.
- **`agent`** — reference to the agent performing the fork.
- **`scope`** — the scope the fork operates within.

Outputs:

- **`forked-branch-record`** — the new branch's substrate-resident record, with predications declaring its identity, its `forked-from` relationship to the source, the source commit at which the fork occurred, and the fork's authoring agent.
- **`rejection`** — fork is not admissible: branch ID conflict, source branch retired, source commit not present in the source branch's history, or agent not authorized.
- **`witness`** — records the fork.

## Operational semantics

Fork-branch proceeds in six steps:

1. *Validate inputs.* Check that the source branch exists and is not retired, the source commit is in the source branch's history, the new branch ID is not already taken, the agent is authorized to fork. Failures produce a rejection.
2. *Create branch entity.* Insert (per [insertion](insertion.md)) predications declaring the new branch's existence: id, type (branch), authoring agent, fork time.
3. *Insert structural relationships.* Insert the predication `forked-from(new-branch, source-branch, source-commit)`. Per [branched-substrate-state](teaching/explanations/branched-substrate-state.md), this is the substrate-level record of the structural relationship between the branches.
4. *Set head pointer.* The new branch's `head` predication is set to a fresh commit pointer that derives from `source-commit` but is now distinct (subsequent commits to the new branch are appended after it).
5. *Inherit predications.* The new branch's content is *not* copied — substrate predications are referenced by content-hash, so the source branch's predications at `source-commit` are simply visible through the new branch's branch-context query. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), this is what makes the discipline efficient.
6. *Witness emit.* Per [emit-witness](emit-witness.md), the fork operation produces a witness that the substrate's audit can reconstruct.

## Engineering invariants

- **Content-sharing.** Fork is a constant-cost operation regardless of the source branch's content size. The new branch shares the source's predications by content-addressing; only divergent edits accumulate fresh content.
- **Branch geometry preserved.** The structural relationship `forked-from(new, source, commit)` is substrate content, queryable by ordinary traversal. The branch graph (which branches forked from which, at which commits) is itself a multi-observer system the substrate can query.
- **No privileged source branch.** After fork, neither branch is "more authoritative" than the other. Both are admissible substrate content in their own right. The branches' divergent valuations are different settlings; per [agent-community-consensus](theories/agential-orchestration-platform/theorems/agent-community-consensus.md), the consensus and disagreement structure of branches-as-observers is computable when needed.
- **Idempotent on identical inputs.** Fork-branch with identical inputs is rejected on the second call (the branch ID is taken).

## Failure modes

- **Branch ID conflict.** The new branch ID is already in use. Reject; surface the conflicting existing branch.
- **Source commit not found.** The cited source commit is not in the source branch's history. Reject; the substrate may suggest the nearest available commit.
- **Source branch retired.** The source branch's predications include a `retired` predication; forking from retired branches requires explicit override per substrate policy.
- **Authorization revoked.** The agent's authorization to fork has been retracted between the agent's request and the fork's admission. Reject per ordinary admission discipline.

## Position in the substrate

Fork-branch is the substrate's *parallel-perspective primitive*. Combined with [merge-branches](merge-branches.md) (the operator that brings divergent branches back together via [federation-convergence](../theorems/federation-convergence.md)'s closure-merge commutation) and the [branched-substrate-state](teaching/explanations/branched-substrate-state.md) discipline, it is what makes the substrate support divergent drafts, experimental modifications, multi-author parallel editing, and projection-based application sublocales.

Two branches forked from a common ancestor that subsequently diverge produce a multi-observer system on the branch graph; per [agent-community-consensus](theories/agential-orchestration-platform/theorems/agent-community-consensus.md), their consensus and disagreement are characterized by the network-sheaf-on-agent-graph machinery applied to the branch graph.

The morphism composes with [insertion](insertion.md), [emit-witness](emit-witness.md), and [coherence-glue](coherence-glue.md) (when forks are subsequently merged, coherence-glue resolves any conflicting predications per the substrate's repair discipline).
