---
id: specification-for-relational-markdown
title: "Specification for Relational Markdown"
status: draft
document_type: note
stratum: 1
topics: []
keywords: []
---
**Version:** 0.1 (Draft)
**Status:** Working Specification
**Maintainer:** emsenn
**Scope:** Defines syntax, semantics, and processing model for Relational Markdown (RMD).

---

## 1. Introduction

Relational Markdown (RMD) is an extension of Pandoc Markdown that allows authors to express **relations**, **entities**, and **scoped ontologies** directly within plain-text documents. It is designed to remain compatible with normal Markdown rendering while adding a semantic layer that can be exported to RDF-style graph formats (JSON-LD, Turtle, DOT, or CSV).

This document defines the **lexical syntax**, **semantic model**, and **processing behavior** of RMD. It also explains how standard Markdown constructs — such as lists, headers, and code blocks — integrate smoothly with relational syntax.

---

## 2. Lexical Syntax

### 2.1 Token Structure

All relational constructs begin with one or more hash (`#`) symbols:

| Type                | Syntax                      | Description                               |
| ------------------- | --------------------------- | ----------------------------------------- |
| Cell Reference      | `#Word`                     | Reference to an existing cell.            |
| Cell Definition     | `##Word`                    | Define or declare a new cell.             |
| Morphism Reference  | `#Word{arg=value,...}`      | Reference to a morphism with arguments.   |
| Morphism Definition | `##Word{arg=value,...}`     | Define or declare a morphism.             |
| Scope Open          | `#open-Word{arg=value,...}` | Begin a new relational scope.             |
| Scope Close         | `#close-Word`               | End the most recent scope with that head. |

Tokens can appear **inline** or **block-level**. The parser treats both contexts identically.

### 2.2 Argument Lists

Arguments use the standard `{key=value,...}` syntax and may include quoted strings or positional arguments.

Example:

```markdown
#relate{src=A,dst=B}
#annotate{label="Important relation", weight=3}
```

Resulting parsed structure:

```json
{"src":"A", "dst":"B"}
{"label":"Important relation", "weight":"3"}
```

### 2.3 Escaping

* Double-hash (`##`) takes precedence over single-hash (`#`).
* A literal hash can be written as `\\#` to escape it.
* Tokens are case-sensitive and may include alphanumerics, hyphens, and underscores.

### 2.4 Integration with Markdown

Relational Markdown does not override or break standard Markdown elements:

* **Headings**, **lists**, **blockquotes**, and **inline formatting** remain unchanged.
* **Code blocks** and **fenced code sections** (triple backticks) remain intact. Their contents are ignored by the relationing parser unless explicitly wrapped in a relational scope (see Section 3.4).

Example:

````markdown
```python
print("hello world")
````

````

---

## 3. Semantic Model

### 3.1 RelCells (Entities)
A **RelCell** represents an entity, node, or concept in the relational graph. It is introduced by `##Word` and may later be referenced by `#Word`.

```json
{
  "@id": "Thing",
  "@type": "RelCell",
  "@source": "<file or scope>",
  "@timestamp": "<ISO8601 time>"
}
````

### 3.2 Morphisms (Relations)

A **Morphism** represents a relation between one or more cells. It has a *head* (name) and a set of arguments, typically including `src` and `dst`.

```markdown
##relate{src=Being,dst=Coherence}
```

```json
{
  "@id": "relate_7a1d",
  "@type": "Morphism",
  "head": "relate",
  "src": "Being",
  "dst": "Coherence",
  "declared_via": "##"
}
```

### 3.3 Scopes (Contexts)

A **Scope** groups related cells and morphisms together. It is created with `#open-Head{...}` and closed with `#close-Head`.

```markdown
#open-Theorem{title="Pythagoras"}
##relate{src=A,dst=B}
#close-Theorem
```

Each scope is represented as:

```json
{
  "@id": "<scope hash>",
  "@type": "Scope",
  "head": "Theorem",
  "args": {"title": "Pythagoras"}
}
```

#### 3.3.1 Inheritance

Arguments declared at a higher scope are inherited by child scopes unless explicitly overridden.

#### 3.3.2 Promotion

Scopes can be *promoted* to the global graph during export (merged mode). When promoted, contextual tags like `@scope` and `@contextual` are removed, and the origin scope ID is stored as `@promoted_from`.

### 3.4 Code Blocks and Tangling

RMD supports both plain code blocks and relationally aware code blocks.

#### 3.4.1 Plain Code Blocks

Plain code blocks follow Markdown’s standard syntax and are ignored by the relational parser:

````markdown
```python
print("hello world")
```
````

These blocks are treated as literal text. No `#` or `##` tokens are parsed within them.

#### 3.4.2 Relational Code Scopes

A code block may be wrapped in `#open-code` / `#close-code` to associate metadata or export (tangle) it.

````markdown
#open-code{tangle="./examples/hello.py",lang="python"}
```python
print("hello world")
```
#close-code
````

This produces a **CodeBlockScope** object:

```json
{
  "@id": "code_4a12b",
  "@type": "CodeBlockScope",
  "lang": "python",
  "tangle": "./examples/hello.py",
  "content": "print(\"hello world\")"
}
```

If `tangle` is present, the processor may write the inner content to a file during export.

---

## 4. Cross-Scope Relations

Cross-scope morphisms express links between entities in different scopes:

```markdown
##relate{src=ScopeA:Being, dst=ScopeB:Knowing}
```

These are tagged `@cross_scope:true` and validated by policy:

```yaml
cross_scope: allow | warn | deny
```

---

## 5. Validation Model

| Phase     | Purpose                          | Example Errors                  |
| --------- | -------------------------------- | ------------------------------- |
| Structure | Checks syntax and argument arity | Missing `src` or `dst`          |
| Corpus    | Verifies registry consistency    | Reference to unknown cell       |
| Context   | Ensures valid scoping            | Orphaned morphism outside scope |

### 5.1 Registry

```yaml
kind:
  relate: morphism
arity:
  relate:
    - [src, dst]
    - [src1, src2, dst]
```

### 5.2 Linting

```yaml
lint:
  novel_refs: warn
  novel_morphs: error
  missing_arity: warn
```

### 5.3 Reports

```json
{
  "warnings": ["Unknown cell reference: Spirit"],
  "errors": [],
  "summary": {"warnings": 1, "errors": 0, "status": "warn"}
}
```

---

## 6. Export Model

```yaml
emit: jsonld|ttl|dot|csv
emit_mode: contextual|merged|flattened
emit_scopes: true|false
emit_scopes_dir: out/scopes
```

| Mode       | Description         |
| ---------- | ------------------- |
| contextual | Preserve scopes     |
| merged     | Promote scopes      |
| flattened  | Collapse all scopes |

### Example TTL Output

```turtle
:Thing a :RelCell .
:relate_9ab a :Morphism ; :src :A ; :dst :B .
:ScopeA :crossScopeLink :ScopeB .
```

---

## 7. Processor Behavior

1. Parse Markdown via Pandoc AST.
2. Identify relational tokens (`#`, `##`, `#open`, `#close`).
3. Build the RelGraph.
4. Validate (structure, corpus, context).
5. Emit graph (JSON-LD, TTL, DOT, CSV).
6. Write lint reports or scope exports.

Exit codes:

* `lint_mode: soft` → always exit 0.
* `lint_mode: strict` → exit 1 on any error.

---

## 8. Extensibility

Planned extensions:

* SPARQL/SHACL validation.
* Type polymorphism.
* Named relational macros.
* Pandoc writer for `relationing-json`.

---

## 9. Compatibility

RMD is fully backward-compatible with Markdown. In plain renderers, relational syntax appears as literal text.

---

## 10. License

MIT License © 2025 emsenn