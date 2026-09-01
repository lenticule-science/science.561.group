---
name: combining resource files as a consensus
description: The combining-resource-files-as-a-consensus skill record.
specializing: consensus
closure-position: procedure
operation-kind: mutation
derives-from:
  - ../../../../code/transformers/combining.md
  - ../../../../code/structures/consensus.md
  - ../../../../code/structures/proposal.md
  - ../../../../code/structures/bilattice.md
requires:
  - ../../../../work/governance/rules/specifications/combining-resource-files.md
contains:
  - SKILL.md
  - scripts/combine-resource-files-as-a-consensus.mjs
composes: []
---

The combiner.
The script implements the bilattice closure rule via byte-identity on proposal bodies — agreeing proposals join, conflicting proposals collapse to $\top$ and produce a `conflict.md` instead of a `consensus.md`.
The byte-identity test is strict by design (combining-resource-files.md notes that relaxed agreement is open work); strictness favors safety over yield in the current build.
