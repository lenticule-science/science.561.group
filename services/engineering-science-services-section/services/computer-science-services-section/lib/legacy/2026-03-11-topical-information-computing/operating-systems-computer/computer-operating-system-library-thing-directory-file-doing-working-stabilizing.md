---
name: stabilizing
description: Applies the semiotic closure S = S_fus ∘ S_syn ∘ S_sem to a content object until fixed point (no closure produces further change). Use when a page or directory needs to be brought to consistent semantic, syntactic, and fusion-coherent state.
---

## Requirements

- A file or directory path in `content/`
- The `audit-vault-references`, `fix-frontmatter`, `check-note-style`, `cross-link-document`, and `manage-tags` skills available
- Write access to `content/`

## Steps

1. Locate the thing: resolve the path to a file; if a directory, operate on its `index.md`; report and stop if the path does not exist.
2. Apply S_sem (semantic closure): check interpretation closure (every concept referenced exists as a resolvable link), relationship reciprocity (directional relations are reciprocated), self-standing definitions (no definitions depending on inaccessible external documents); use `audit-vault-references` and `cross-link-document`.
3. Apply S_syn (syntactic closure): check frontmatter completeness with `fix-frontmatter`, style compliance with `check-note-style`, correct directory placement, markdown link syntax (no wikilinks), and tags with `manage-tags`.
4. Apply S_fus (fusion closure): check type-content alignment (does the `type:` field match what the content actually is?), tag-content alignment, directory-content alignment, and naming coherence across filename, title, and content.
5. Iterate: if any closure step made changes, re-check all three closures; stop when no closure produces changes.
6. Report: the path, what each closure step found and fixed, whether fixed point was reached, and what remains unstable with explanation.

## Outcomes

- The content object is at fixed point: S_sem, S_syn, and S_fus each produce no changes on the final state.
- A report is produced stating what each closure step found, fixed, and left unresolved.
- If fixed point is not reachable in this session, the remaining instabilities are named.
