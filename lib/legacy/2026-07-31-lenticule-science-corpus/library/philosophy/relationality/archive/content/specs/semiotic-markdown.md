---
title: Semiotic Markdown
id: semiotic-markdown
type: doc
status: draft
keywords:
  - semantics
  - syntax
  - semiotics
  - tooling
  - specification
depends_on:
  - semiotic-publisher
publish_to:
  - emsenn-net
---

# Semiotic Markdown Specification

This specification describes how Markdown files, as ingested by the semiotic publisher [@semiotic-publisher], are interpreted as concepts in the Semiotic Universe [@semiotic-universe] and its Stewardable Semiotic Concept Universe extension [@stewardable-semiotic-concept-universe], and how their structure is mapped into atoms, fragments, and publication views.

Normative statements in this document use "MUST", "SHOULD", and "MAY" in the conventional requirements-language sense.

## 1. File Model

- Throughout this specification, the **loader** denotes the Markdown‑to‑concept stage of the semiotic publisher [@semiotic-publisher].

- A **concept file** is a UTF‑8 `*.md` file under the configured `vault_dir`.
- Each file is parsed as:
  - an optional YAML **frontmatter** block delimited by `---` at the top, and
  - a Markdown **body**.
- The loader treats one file as one concept.

## 2. Identification and Slugs

### 2.1 Concept identifiers

- Frontmatter field `id` (string) MAY be provided.
- If `id` is absent, the concept id is derived from the file path:
  - take the path relative to `vault_dir`,
  - drop the file extension,
  - apply the slugification function (below).

### 2.2 Slugification

The slugification function `slugify` is applied to ids, folder names, link targets, and some metadata values:

- Convert to lowercase and trim surrounding whitespace.
- Replace `/` and `\` with `-`.
- Replace any character not in `[a-z0-9_-]` with `-`.
- Collapse consecutive `-` into a single `-`.
- Trim leading and trailing `-`.
- If the result is empty, use `"item"`.

## 3. YAML Frontmatter Fields

This section describes the frontmatter schema recognized by the loader and how each field contributes to the universe semantics.

### 3.1 Core identity

- `title` (string)
  - Human‑readable title for the concept.
  - If absent, defaults to the file’s stem (basename without extension).
- `id` (string, optional)
  - Explicit concept identifier.
  - If present, is slugified and used as the concept id.

### 3.2 Classification and status

- `type` (string, optional)
  - Concept type (e.g. `"doc"`, `"tag"`, `"status"`).
  - Semantics:
    - Generates an annotation term `HasType(type)`.
    - Interns a `type` atom for this value.
    - May induce tag atoms via `type_tag_rules` in configuration.
- `status` (string, optional)
  - Editorial or publication status (e.g. `"draft"`, `"sketch"`, `"public"`, `"deprecated"`).
  - Semantics:
    - Generates an annotation term `HasStatus(status)`.
    - Interns a `status` atom for this value.
    - May induce tag atoms via `status_tag_rules` in configuration.
    - May be used by publishing and theming (e.g. draft styling, selection filters).
- `tags` (list of strings, optional)
  - Free‑form topical tags.
  - Semantics:
    - For each tag value `t`, generates `HasTag(t)`.
    - Interns a `tag` atom with value `t`.

### 3.3 Names, aliases, and folders

- `aliases` (list of strings, optional)
  - Alternate names for the concept.
  - Semantics:
    - For each alias, generates `AliasFor(alias)`.
    - Interns an `alias` atom.
    - Aliases participate in concept resolution (e.g. citation and link resolving).
- Folders (implicit)
  - The file’s path segments under `vault_dir` are used as folder annotations.
  - All path components except the filename are collected and slugified.
  - Semantics:
    - For each folder segment `f`, generates `InFolder(f)`.
    - Interns a `folder` atom.
    - `folder_tag_rules` in configuration MAY map folders to tags via `j`‑relations.

### 3.4 Temporal metadata

- `created` (string, optional)
  - Creation timestamp or date string (no enforced format).
  - Semantics:
    - Used by the temporal trace operator to create:
      - `created` atom with the full string.
      - `created_year` atom with the first four characters.
- `updated` (string, optional)
  - Last‑update timestamp or date string.
  - Semantics:
    - Used by the temporal trace operator to create:
      - `updated` atom with the full string.
      - `updated_year` atom with the first four characters.

### 3.5 Licensing

- `license` (string, optional)
  - Human‑readable declaration of the license for this concept (e.g. `"CC BY-SA 4.0"`, `"All rights reserved"`, `"CC0"`).
  - Semantics:
    - Stored as `concept.license` and surfaced in rendered HTML metadata.
    - By default, if `license` is absent, the site’s global policy applies (no reuse or derivatives without permission).
    - The license field does not currently generate atoms.

### 3.6 Publication routing

- `publish_to` (string or list of strings, optional)
  - Project selectors indicating which publication projects the concept belongs to (e.g. `"emsenn-net"`, `"math-papers"`).
  - Semantics:
    - Stored verbatim in frontmatter metadata.
    - Used by project selection (`project_universe`) to build sub‑universes specified in configuration (`projects.*.publish_to`).
    - Does not create atoms.

### 3.7 Subjects and facts (relational metadata)

- `subjects` (mapping from string → string, optional)
  - Defines named subject aliases for use in `facts`.
  - Schema:
    ```yaml
    subjects:
      alias1: target-id-1
      alias2: target-id-2
    ```
  - Semantics:
    - Internally, each alias maps to a slugified target id.
    - Subjects themselves do not create atoms; they parameterise facts.

- `facts` (mapping from subject alias → predicate→object(s), optional)
  - Declarative relational metadata.
  - Schema:
    ```yaml
    facts:
      subject-alias-or-id:
        predicate-1: object-or-alias
        predicate-2:
          - object-or-alias-a
          - object-or-alias-b
    ```
  - Semantics:
    - For each triple `(predicate, subject, object)`:
      - Resolve `subject` via `subjects` if present; otherwise slugify the subject key.
      - Resolve `object` via `subjects` if present; otherwise slugify the object value.
      - Append a fact tuple `(predicate, subject_id, object_id)` to the concept.
      - Generate an annotation term:
        - `Fact(predicate, subject_id, object_id)`.
      - Intern a `fact` atom whose value is the string
        `"{predicate}:{subject_id}->{object_id}"`.

### 3.8 Citation metadata for Pandoc (optional)

- `bibliography` (string, optional)
  - Path to a bibliography file (e.g. `content/ref/refs.bib`).
- `csl` (string, optional)
  - Path to a CSL style file for Pandoc.
- Semantics:
  - Currently preserved in metadata for use by Pandoc export and future citation tooling.
  - Does not yet generate atoms directly.

## 4. Body Syntax

### 4.1 General Markdown

- The body is parsed as CommonMark‑style Markdown using `markdown-it`.
- Headings, paragraphs, lists, code blocks, and inline emphasis are rendered as usual; they do not, by themselves, create semantic atoms.

### 4.2 Wikilinks

- Syntax:
  - `[Label](Label)`
  - `[concept-id-or-slug](concept-id-or-slug)`
- Resolution:
  - `Label` is slugified to derive a target id.
  - The HTML renderer rewrites wikilinks into standard Markdown links to `docs/<target-id>.html` (respecting the current base href).
- Semantics:
  - For each wikilink target id `k`, the loader:
    - Generates `LinksTo(k)` as an annotation term.
    - Interns a `link` atom with value `k`.

### 4.3 Markdown links

- Syntax:
  - `[text](relative/path/to/other.md)`
  - `[text](relative/path/to/other)`
- Resolution:
  - Links whose targets start with a URI scheme (`^[a-z]+://`) are treated as external and do not participate in concept resolution.
  - For other targets:
    - The path is normalised relative to the current file, the extension (if any) is removed, and the result is slugified.
    - The slugified value is used as a link target id.
  - HTML rendering uses the original link markup; no additional rewriting is performed beyond standard Markdown rendering.
- Semantics:
  - For each internal target id, generates `LinksTo(target_id)` and a corresponding `link` atom.

### 4.4 Inline citations (Pandoc‑style)

- Recognised citation groups:
  - `[@key]`
  - `[@key; @other]`
  - `[@key, @other]` (commas are also accepted as separators).
- Parsing:
  - A citation group is detected when text matches `[...]` whose contents contain one or more `@key` tokens separated by commas or semicolons.
  - `@key` tokens are extracted; `-@key` (author‑suppressed form) is recognised for parsing but rendered the same at present.
- HTML rendering:
  - Each `key` is resolved using:
    - concept id,
    - slugified concept title,
    - aliases and their slugified forms.
  - If resolution succeeds:
    - The citation is rendered as `<a class="citation" href="...">@key</a>` pointing to the concept page.
  - If resolution fails:
    - The citation is rendered as `<span class="citation">@key</span>` (external or unknown reference).
  - Multiple keys in one group are rendered inside a single bracketed citation, separated by `"; "`.
- Semantics:
  - Inline citations currently affect HTML presentation but do not create atoms or j‑relations.
  - They are intended as a trace/provenance layer that can be lifted into the semiotic universe in future revisions.

## 5. Derived Semantic Structure

### 5.1 Annotations and atoms

Given a loaded concept, the loader constructs a multiset of annotation terms from:

- `tags` → `HasTag(tag)`
- `status` → `HasStatus(status)`
- `type` → `HasType(type)`
- `aliases` → `AliasFor(alias)`
- folders → `InFolder(folder)`
- links (wikilinks and internal Markdown links) → `LinksTo(target_id)`
- `facts` → `Fact(predicate, subject_id, object_id)`

Each annotation interpreter maps its term into a finite feature set:

- `HasTag(t)` → one `tag` atom with value `t`.
- `HasStatus(s)` → one `status` atom with value `s`.
- `HasType(t)` → one `type` atom with value `t`.
- `AliasFor(a)` → one `alias` atom with value `a`.
- `InFolder(f)` → one `folder` atom with value `f`.
- `LinksTo(k)` → one `link` atom with value `k`.
- `Fact(p, s, o)` → one `fact` atom with value `"{p}:{s}->{o}"`.

The union of all such atoms for a concept forms its **base feature set**.

### 5.2 j‑relations and closure

Configuration MAY specify relational closure rules:

- `folder_tag_rules[folder] = tag`
  - Creates a j‑relation from `folder` atom `folder` to `tag` atom `tag`.
- `tag_synonyms[a] = b`
  - Creates symmetric j‑relations between `tag` atoms `a` and `b`.
- `type_tag_rules[type] = tag`
  - Creates a j‑relation from `type` atom `type` to `tag` atom `tag`.
- `status_tag_rules[status] = tag`
  - Creates a j‑relation from `status` atom `status` to `tag` atom `tag`.

The semantic fragment and contribution for each concept are then computed by iterated application of:

- temporal enrichment (trace operator `G`) via `created`/`updated` fields, and
- graph closure (`j`) following the configured j‑relations.

This section is descriptive: implementations MUST preserve extensivity, monotonicity, and idempotence of the combined closure but MAY refine the set of j‑relations in future versions of this specification. The full categorical treatment of fragments, j/G‑closure, and stewardship operators is given in the universe constructions [@semiotic-universe; @stewardable-semiotic-concept-universe].
