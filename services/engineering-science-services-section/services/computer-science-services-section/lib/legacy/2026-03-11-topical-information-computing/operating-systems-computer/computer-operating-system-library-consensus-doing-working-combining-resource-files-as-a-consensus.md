---
name: combining-resource-files-as-a-consensus
description: Reads all non-withdrawn proposal resource-files for a target and combines them into a consensus file via a bilattice closure rule that joins agreeing proposals and refuses to settle on conflicting ones. Use when proposals have accumulated for a target and consensus is needed before leader approval.
---

## Requirements

- A `target` path to the resource-file the proposals are for (used to derive the proposals directory and to recompute the target hash for drift detection).
- The proposals directory `doing/governing/proposals/<target-id>/` exists and contains at least one `.md` file whose `kind:` is `proposal`.

## Steps

1. Run `node ${CLAUDE_SKILL_DIR}/scripts/combine-resource-files-as-a-consensus.mjs --target <path>`.
2. The script derives `<target-id>` from the target path (path separators → `__`, drop `.md`) and resolves `doing/governing/proposals/<target-id>/`; refuses with `proposals-directory-not-found` if absent (C1).
3. The script reads every `.md` file under the directory, skipping `consensus.md` and `conflict.md` (combiner outputs); parses each as a proposal; skips any whose `kind:` is not `proposal` or whose `status:` is `withdrawn` (C2).
4. The script validates each proposal's `target-hash` against the current hash of the target; records a `proposal-target-drifted` diagnostic and skips that proposal (C4).
5. The script applies the bilattice closure rule (C5):
   - 0 live proposals → refuses with `no-proposals`.
   - 1 live proposal → consensus is that proposal's body.
   - N proposals, all body-byte-identical → consensus is that body; `proposed-by` lists all N.
   - At least two proposals differ → $\top$-state; writes `conflict.md` not `consensus.md`.
6. The script removes any stale `consensus.md` or `conflict.md` from a prior firing whose `proposed-by` differs from the current live set (C9).
7. On consensus: writes `doing/governing/proposals/<target-id>/consensus.md` with `kind: consensus`, `target`, `target-hash`, `proposed-by`, `combined-at`, `status: consensus-pending-approval`; body is the common bytes (C6).
8. On conflict: writes `doing/governing/proposals/<target-id>/conflict.md` with `kind: conflict`, `target`, `target-hash`, `proposals` (array of `{proposer, body-hash}`), `combined-at`, `status: conflict-pending-withdrawal`; body lists each proposer and their body's first-30-line preview (C7).
9. The script appends a witness line to `code/logs/tool-uses/<YYYY-MM-DD>.jsonl` (C10) and emits a one-line JSON result: `{ok, target, outcome: 'consensus'|'conflict'|'no-proposals', proposers, skipped}`.

## Outcomes

- Either `doing/governing/proposals/<target-id>/consensus.md` or `doing/governing/proposals/<target-id>/conflict.md` exists after the call (never both); any stale copy from a prior firing has been removed.
- A witness line is appended.
- On consensus: the leader can next mark the consensus as approved via `marking-a-resource-file-as-approved`.
- On conflict: workers must withdraw one or more conflicting proposals via `marking-a-resource-file-as-withdrawn`; re-firing the combiner after withdrawals may produce consensus.
- On refusal: no consensus or conflict file is written; diagnostic on stderr; exit non-zero.
