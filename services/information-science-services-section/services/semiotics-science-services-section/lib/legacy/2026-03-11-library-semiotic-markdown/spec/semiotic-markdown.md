# Semiotic Markdown Dialect Specification

Version: 0.1 (draft) Intended status: living specification for implementers

## Status of This Memo

This memo defines Semiotic Markdown (SMD) as a Markdown dialect: a CommonMark-compatible baseline plus a small set of extensions and a deterministic identifier model.
The goal is to make SMD implementable as a parser + resolver + (optional) renderer and testable via conformance vectors.

This memo is normative where it uses requirements language (“MUST”, “SHOULD”, “MAY”).
Informative material is marked as Note.

## Abstract

Semiotic Markdown (SMD) is a Markdown dialect designed to remain readable and mostly editable in mainstream Markdown tooling while supporting:

- Obsidian-style knowledge-base affordances (wikilinks, transclusions, callouts, Dataview-style inline fields).
- Pandoc-style scholarly affordances (inline citations, TeX math delimiters).
- A deterministic slugification and document identifier model suitable for repository-scale tooling.
- A minimal extraction model so implementations can reliably surface links, citations, inline fields, and frontmatter structure without committing to any particular semantic backend.

## 1. Conventions and Requirements Language

The key words MUST, MUST NOT, REQUIRED, SHALL, SHALL NOT, SHOULD, SHOULD NOT, RECOMMENDED, MAY, and OPTIONAL are to be interpreted as requirements-language keywords.

### 1.1 Scope of normativity

This specification is normative for:

- File format (frontmatter + body).
- Identifier derivation and slugification.
- Recognition of SMD extensions in the body source.
- Reference resolution inputs and determinism requirements.
- Minimum extraction outputs required for conformance.

This specification is not normative about:

- A particular semantic universe, ontology, closure operator, or knowledge-graph model.
- A particular Markdown parsing library.
- Full-fidelity Markdown AST exposure (beyond what is required for SMD extensions and round-tripping).

## 2. Goals and Non-Goals

### 2.1 Goals

A conforming SMD implementation MUST:

1. Parse documents with optional YAML frontmatter and a Markdown body.
2. Compute stable document identifiers and link targets using a deterministic slugification function.
3. Recognize and extract SMD extension constructs from the body source:
   - Wikilinks and transclusions
   - Callouts
   - Inline fields
   - Code-block annotations
   - Inline citations
4. Provide deterministic reference resolution over a finite set of known documents.
5. Preserve round-trippability constraints required by this spec.

### 2.2 Non-goals

An SMD implementation need not:

- Evaluate templates, execute code, or interpret math.
- Produce HTML (unless claiming renderer conformance).
- Infer meaning beyond the extraction model (unless implementing an additional profile).

## 3. Compatibility and Lineage

SMD is designed to be:

- CommonMark-compatible for baseline Markdown block/inline structure.
- Obsidian-surface-compatible for specific extension syntaxes.
- Pandoc-export-friendly for citations and TeX math delimiters.

When there is a conflict between plausible surface syntaxes, implementations SHOULD prefer Obsidian-compatible surface syntax while preserving a Pandoc-compatible export path.

Note: “Export path” here means “an implementation can render/transform SMD into Pandoc Markdown (or equivalent) without losing required information,” not that SMD is a strict subset of Pandoc Markdown.

## 4. Preprocessing

### 4.1 Templates

SMD itself does not define a template language.
If a system uses templates (e.g., Jinja2), templating MUST be a preprocessing step that produces a concrete *.md text before SMD parsing.

A preprocessor output MUST be valid SMD and MUST place any YAML frontmatter at the top of the rendered file (if present).

## 5. Collection Model

SMD parsing is defined relative to an external collection root:

- collection_root: a directory path used to derive document identifiers from file paths.
- source_path: the path of a document relative to collection_root, using / as the canonical separator for specification purposes.

An implementation MUST define how it maps OS-specific paths to canonical source_path strings.

## 6. File Format

### 6.1 Encoding

An SMD document MUST be UTF-8 text.

### 6.2 Frontmatter

A document MAY begin with a YAML frontmatter block.

- If present, frontmatter MUST be the first non-empty content in the file.
- Frontmatter MUST be delimited by a line containing exactly --- (opening) and a subsequent line containing exactly --- (closing).
- The content between delimiters MUST be parsed as YAML.

If frontmatter parsing fails, the implementation MUST report a frontmatter parse error.

### 6.3 Body

The remainder of the file after optional frontmatter is the body.

The body MUST be parseable as CommonMark-style Markdown for baseline constructs.
Implementations MAY accept additional Markdown extensions, but such acceptance MUST NOT change the interpretation of SMD-specific constructs defined in section 10.

## 7. Identifier Model

### 7.1 Document Identifier (doc_id)

Each document has a canonical identifier doc_id:

- If frontmatter contains id (string), then doc_id = slugify(id).
- Otherwise doc_id is derived from the source_path:
  1. Remove the file extension from the last path segment.
  2. Use the resulting path string as input to slugify.

### 7.2 Title

A document has a title:

- If frontmatter contains title (string), that value is the title.
- Otherwise, the title defaults to the file stem (the basename without extension).

### 7.3 Duplicate identifiers

If two distinct documents in the same collection yield the same doc_id, a conforming implementation MUST treat this as an error at indexing time.

## 8. Slugification

### 8.1 slugify (normative)

slugify is a deterministic function from Unicode strings to ASCII slugs.

Given an input string s, slugify(s) MUST perform the following steps in order:

1. Convert s to lowercase.
2. Trim surrounding whitespace.
3. Replace / and \ characters with -.
4. Replace any character not matching [a-z0-9_-] with -.
5. Collapse consecutive - into a single -.
6. Trim leading and trailing -.
7. If the result is empty, return the literal string item.

The output of slugify MUST match [a-z0-9_-]+.

### 8.2 Where slugification applies

Implementations MUST apply slugify exactly as specified when normalizing:

- Frontmatter id
- Derived path ids
- Folder segments
- Wikilink targets
- Internal Markdown link targets
- Citation resolution keys

## 9. Frontmatter Schema

### 9.1 Recognized vs unrecognized fields

This specification recognizes certain frontmatter fields defined below.

- Implementations MUST preserve unrecognized frontmatter fields.
- Unrecognized fields MUST NOT affect conformance-required extraction.

### 9.2 Type system

In this section, “string” means a YAML scalar string and “list of strings” means a YAML sequence where each element is a string.

### 9.3 Implicit folders

Folders are implicit from the document’s path:

- Let source_path_dir be the directory portion of source_path.
- Split source_path_dir by / into segments.
- For each segment, compute folder_segment = slugify(segment).

### 9.4 Fields

9.4.1 title Type: string (optional) Normalization: none

9.4.2 id Type: string (optional) Normalization: slugify

9.4.3 type Type: string (optional)

9.4.4 status Type: string (optional)

9.4.5 tags Type: list of strings (optional) Constraint: MUST be a list if present.

9.4.6 aliases Type: list of strings (optional)

9.4.7 created, updated Type: string (optional) Derived: created_year, updated_year

9.4.8 license Type: string (optional)

9.4.9 publish_to Type: string OR list of strings (optional) Normalization: canonical list

9.4.10 subjects Type: mapping string -> string (optional)

9.4.11 facts Type: mapping string -> mapping string -> (string OR list of strings) (optional)

9.4.12 bibliography, csl Type: string (optional)

## 10. Body Extensions

### 10.0 Extension recognition boundaries

Implementations MUST NOT recognize SMD extensions inside:

- Fenced code block content
- Inline code spans

### 10.1 Wikilinks

Syntax: - [[TARGET]] - [[TARGET|LABEL]]

Extraction: link feature with kind = wikilink.
If no matching target, behavior TBD; remove link for now.

### 10.2 Transclusions

Syntax: - !
[[TARGET]] - !
[[TARGET|LABEL]]

Extraction: link feature with kind = transclusion.

### 10.3 Markdown links

Internal targets are normalized to target_id via path normalization and slugify.

### 10.4 Math

Inline: $...$ Block: $$...$$

Parsing is not required; preservation is.

### 10.5 Callouts

Syntax example (escaped):

    > [!note] Example title
    > Callout body.

Extraction: callout feature with type, optional title.

### 10.6 Inline fields

Forms: - [key:: value] - (key:: value)

Extraction: inline_field feature.

Parentheses instead of brackets means "don't show the key"

### 10.7 Code-block annotations

Inline field lines immediately preceding a fenced code block annotate that block.

### 10.8 Inline citations

Recognized forms: - [@key] - [@key; @other] - [-@key]

Extraction: citation_group feature.

## 11. Relational Frontmatter: subjects and facts

Facts produce triples via subject resolution, predicate preservation, and object resolution.

## 12. Reference Resolution

Resolution is deterministic over a universe of known documents.

Ambiguity or duplicates are errors.

## 13. Conformance Extraction Model

A conforming implementation MUST produce a DocumentRecord with:

- doc_id
- title
- source_path
- frontmatter_raw
- frontmatter_norm
- folders
- body_raw
- features

Feature record types include:

- link
- callout
- inline_field
- codeblock
- codeblock_annotation
- citation_group
- fact

## 14. Error Handling

Required error classes include:

- FrontmatterParseError
- FrontmatterTypeError
- DuplicateDocIdError
- AmbiguousResolutionKeyError
- InvalidEncodingError

## 15. Optional: HTML Projection Conformance

Defines rewriting rules for wikilinks, transclusions, callouts, citations, and code-block annotations.

## 16. Security Considerations

Template preprocessing executes code.
Rendering must escape output.

## 17. IANA Considerations

None.

## Appendix A. Informative: Semiotic Publisher Extraction Profile

This appendix sketches one possible semantic mapping layered on top of SMD extraction, including atoms, relations, and closure.

This appendix is non-normative.
