---
title: "The directory tree carries meaning"
type: concept
class: commitment
component-of: ../_index.md
depends-on:
  - vault.md
  - filenames-are-stable-identifiers.md
see-also:
  - files-are-source.md
---

# The directory tree carries meaning

Where a file lives in the vault is part of what the file says. The directory tree is a knowledge-organization scheme, not a filing convenience. Moving a file to a new directory changes what it claims about itself; placing a new file in a directory commits it to that directory's frame.

## What the commitment says

The path from the vault root to a note is a structured statement. Each segment of the path is a classifier the note has accepted: a discipline, a sub-discipline, a theory, a kind of note (concept, object, theorem). A note placed under `humanities/theories/sociology/theories/critical-theory/theories/feminism/concepts/intersectionality.md` is making the statement *I am a concept of feminism, a sub-theory of critical theory, a sub-theory of sociology, a sub-theory of the humanities.* That statement is load-bearing; it is what tells the rest of the vault where to look for me.

## What the commitment forbids

- **Flat layouts as a default.** A vault that throws all notes into one directory and relies on tags or links to organize them violates this commitment. Tags can supplement the tree; they cannot replace it.
- **Directory as filing convenience.** Reorganizing a directory because "it's getting too big" — without an editorial reason — is a violation. The tree changes when the conceptual layout changes.
- **Conflict between path and frontmatter.** If a note's path says it is a sociology concept and its frontmatter says it is a math theorem, the vault is in conflict. The vault must resolve the conflict; it must not silently tolerate it.

## What the commitment enables

- **Navigation by `ls` and `find`.** A reader who knows the topic can predict the path; a reader who finds the path can predict the topic.
- **Locality of edits.** Work on a theory tends to touch files in that theory's subtree, which makes diffs reviewable and merges tractable.
- **Compositional reasoning about scope.** A claim made in a child directory inherits the frame of every ancestor directory. A note doesn't have to repeat what its location already says.

## Layout consequences

This commitment is what makes the standard `_index.md / concepts/ / objects/ / morphisms/ / theorems/ / questions/ / narratives/ / examples/ / references/` layout meaningful: the layout is not bureaucracy but a fixed vocabulary the parent commitment makes useful. Adopting that layout in a sub-theory is a way of saying *I am the kind of thing for which this layout is appropriate.*
