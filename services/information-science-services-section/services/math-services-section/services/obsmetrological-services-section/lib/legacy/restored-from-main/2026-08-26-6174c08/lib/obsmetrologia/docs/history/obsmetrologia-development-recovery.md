# Obsmetrologia development lineage

Reconstructed: 2026-08-05

## Result

Obsmetrologia has one durable branch, `main`, and one connected history rooted
in the earliest complete RelMath snapshot that survived. No tag or auxiliary
branch is required to reach retained source states.

The formal-library lineage is:

`RelMath → Infomaterial → Obsmetrologia`

Infography is an applied-practice package and is not part of this lineage.

## Main-line boundaries

| Reconstructed commit | Original evidence | Meaning |
| --- | --- | --- |
| `6533e70cf7c8` | Archive tree `0d63c3e38e4b` | Reconstructed RelMath root from the preservation archive labeled 2026-06-17. Exact capture time and original Git metadata are unknown. |
| `61c9d3ffd78c` | `9e52bbc5a34c` | First surviving original Git root, “Initialize relational math,” now connected after the earlier snapshot. |
| `b7277f7fefd9` | `607114221554` | RelMath becomes Infomaterial on 2026-06-28. |
| `3945cecb225a` | `419321b29124` | Infomaterial becomes Obsmetrologia on 2026-07-15. |
| `cfe346e2fe80` | `cbb0db08935e` | Reconstructed form of the previous remote head before this ledger update. |

Every rewritten original commit carries an `Original-Commit` trailer. The
working trees and author/committer identities, dates, and subjects were
preserved; hashes necessarily changed because the reconstructed RelMath root
changed their ancestry.

## Pre-root RelMath evidence

Source:

`2026-06-17-archive-emsenn-net/preservation/wsl-home-archive/src/lib/local/relmath-lean`

The root preserves its exact 528-file tree, including 465 Lean files and 97
active `RelMath` modules. Its Lean manifest SHA-256 is
`f3c41835d85226b3941d7404811709edfbe07401e7ecfbf49dd2e92c991890db`.

The June 22 transition changes 95 files and removes 14 paths. Six removed Lean
sources are therefore still recoverable from the root:

- `RelMath/CohomologicalEquivalence.lean`
- `RelMath/InternalReals.lean`
- `RelMath/TransfiniteClosureFlow.lean`
- `RelMath/YonedaArrowsFirst.lean`
- `conformance/ConformanceVectors.lean`
- `tooling/RelMathTooling.lean`

The 57 `.drafts` files added on June 22 are byte-identical duplicates of active
modules, not additional proof versions.

## Concurrent recovered states

Recovered sibling and worktree states retain their real causal relationships as
side parents. No-tree-change merge commits connect them to the first-parent
lineage at the corresponding historical point:

| Recovery merge | Retained content |
| --- | --- |
| `d49ea79abd15` | Three contemporaneous Fock-condensate variants from June 30. |
| `2a4d3d685719` | Carrier-gated settling-sheaf variants, including the unique recovered `NumberTheoryCombinatorics.lean` state. |
| `64959b451b4e` | The unique recovered `Odometer.lean` worktree state. |
| `ee75b15dd869` | The alternate `CoordinationJam.lean` reaction-network state and the different main-line implementation. |
| `b2a2afd4ead1` | The path-fix alternate formerly stored on the union-recovery branch. |

The two index snapshots remain parents of their corresponding recovered
worktree commits. Each reconstructed side commit carries its original hash in
an `Original-Commit` trailer.

## Reconstruction rules

- The archive label supplies ordering for the reconstructed root; its commit
  message explicitly does not claim an original June 17 Git commit.
- Original main-line and recovered trees are copied exactly.
- Concurrent states remain concurrent; they are not cherry-picked into a fake
  sequential development story.
- Recovery merges keep the canonical main-line tree unchanged.
- The post-vendoring subtree reconstruction remains on the same first-parent
  lineage and ends with the exact former vendored Lean tree.

## Verification

The candidate graph was checked before publication:

- 282 commits before this ledger update;
- exactly one root;
- every tree reachable from the old `main`, all eight formerly dangling states,
  the union-recovery state, and the pre-root snapshot also occurs in the new
  `main` ancestry;
- final pre-ledger tree equals the former `main` tree
  `0dae5ff392562ff349142215c93d4826199e58b4`;
- `git fsck --full --no-dangling` exits 0;
- the previously verified Lean source tree completes `lake build` with 363 jobs
  and retains the known `sorry` in
  `Obsmetrologia/Closure/Collatz/SemigroupGap.lean`.

## Other surviving evidence

The June 30 bundle and filesystem backup contain this same connected lineage,
not another project history. The original Git databases for the nine older
`_archive` source collections were not found; their files remain in the RelMath
root tree. The separate Infometrologia repository contains Node/tooling history
and is not part of this Lean lineage.
