---
title: "Plain text first"
type: concept
class: commitment
component-of: ../_index.md
depends-on:
  - vault.md
  - files-are-source.md
see-also:
  - frontmatter-is-structured-data.md
---

# Plain text first

A markdown-vault knowledge system must be useful with no tooling beyond a text editor and `grep`. Tooling adds *power* — graph views, automated dependency walks, validation, rendering. Tooling does not add *access*. A reader who has only `cat` and `less` must still be able to read, navigate, and contribute.

## What the commitment says

For every operation a vault wants to support — reading a note, finding notes that mention a slug, listing every note of a given type, following a dependency chain by hand — there must be a path that uses only standard text-processing tools. The tooling-rich path may be faster, more ergonomic, more correct on edge cases. But the bare path must exist and must work.

## What the commitment forbids

- **Required custom binaries.** A vault that cannot be read without installing a particular CLI fails this commitment. Custom CLIs are welcome; *required* custom CLIs are not.
- **Markdown extensions that make plain-text rendering nonsense.** A shortcode or transclude syntax that produces gibberish when read literally is a violation. Whatever syntax the vault uses must degrade legibly.
- **Binary embeddings as primary content.** Images and diagrams can be referenced; they cannot be the only locus of a note's meaning. The note must say what it says in text.

## What the commitment enables

- **Survival of tool churn.** Renderers, indexers, graph databases come and go. The text remains.
- **Low-barrier contribution.** A new contributor with only a text editor can add a note. This matters when the vault is shared across teams with different preferred environments.
- **Auditability.** Anyone with `cat` and patience can audit the vault. There is no opaque layer that requires special access to inspect.

## How this interacts with frontmatter

Frontmatter is structured data, but it is structured *plain-text* data. YAML was chosen — over JSON, TOML, or sexprs — partly because it reads cleanly when no parser is present. A reader scanning a file with `less` should see the frontmatter as legible key-value pairs, not as escape-heavy noise.
