---
title: "Frontmatter is structured data"
type: concept
class: commitment
component-of: ../_index.md
depends-on:
  - vault.md
  - files-are-source.md
see-also:
  - plain-text-first.md
description: Every note in a markdown-vault knowledge system has, by convention, a YAML frontmatter block at the top of its file.
---


Every note in a markdown-vault knowledge system has, by convention, a YAML frontmatter block at the top of its file. That block is where structured data lives. Body text is prose; frontmatter is data; the two do not compete for the same role.

## What the commitment says

Anything the vault wants to query, sort, render, validate, or graph over goes in YAML frontmatter — not in prose, not in HTML comments, not in special line prefixes. If a property of the note is operational — `type`, `title`, `depends-on`, `realizes`, `class`, `status` — it earns a frontmatter key.

Conversely, anything that is *only* read by humans in the order it is read — the argument of an essay, the body of a definition, the explanation of why a theorem matters — stays in prose. Don't smuggle structure into prose; don't smuggle exposition into frontmatter.

## What the commitment forbids

- **Querying body text for structural data.** Asking "what does this note depend on?" must be answerable from frontmatter alone. Parsing prose to discover structure is forbidden by this commitment.
- **Frontmatter as essay.** Long human-language strings in frontmatter (multi-paragraph descriptions, narrative explanations) defeat the purpose. If it reads as prose, it belongs in the body.
- **Out-of-band metadata stores.** Sidecar databases, hidden directories, or comment-encoded data violate this commitment because the file no longer contains its own structure.

## What the commitment enables

- **Cheap structural query.** With YAML frontmatter, `find ... | xargs yq ...` answers structural questions over the entire vault in seconds, without parsing markdown.
- **Validation.** A schema can be applied to frontmatter; a schema cannot meaningfully be applied to prose.
- **Tool independence.** Any YAML-aware tool — and many that are not — can read frontmatter. The data is not locked to a particular reader.
