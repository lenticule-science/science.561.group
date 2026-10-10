---
name: citation
description: "A pointer in a body of prose to an external work, written `[@citekey]`, that resolves against the file's `references:` frontmatter map."
---

A citation is one body-prose token of the form `[@citekey]` (per [`citations`](../../work/governance/rules/specifications/citations.md) §5.8).
It names a work that the surrounding prose draws on; the citekey is a key in the same file's `references:` frontmatter map, which carries the bibliographic record.

A citation has no standalone existence outside a body — it is a positional reference, not a record.
The substantive bibliographic content lives in `references:`.
The body carries only the citekey.

The `[@citekey]` form is unique.
`[Author YYYY]`, `(Author YYYY)`, and link-wrapped variants are not citations in the polity's sense; they are violations caught by [`linting-a-citation`](../../doing/working/skills/linting-a-citation/SKILL.md).
