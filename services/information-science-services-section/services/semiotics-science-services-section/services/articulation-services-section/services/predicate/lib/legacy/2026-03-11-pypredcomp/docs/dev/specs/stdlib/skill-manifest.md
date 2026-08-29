---
title: "Skill manifest"
description: "JSON-Schema-validated manifest contract for skills. Skill-record substrate cells, boot-time aggregation via `build-skill-manifest`, MCP exposure, and `lint-skills` validator. The OS-side foundation for operational skill packs."
kind: spec
status: normative
version: "0.2"
---

# Skill manifest

A **skill** is a named, runnable (or advisory) capability that an agent or office may invoke.
Every skill carries a **manifest** — a JSON-Schema-validated declaration of the skill's id, version, runtime, inputs, outputs, capabilities, and triggers.
The manifest is the wire-format contract between skill authors, the substrate, and the agential layer.

Skills already exist in the captain's harnesses (local agent skills under `.local/skills/SKILL.md`, operational skill packs under `operations/engineering/skills/<slug>/SKILL.md`) but their wire-format and discovery contract were until now implicit.
This spec is that contract.

Per [decisions/skills-have-manifest-contracts.md](../../decisions/skills-have-manifest-contracts.md).
The captain's source idea is [`skill-manifest-implementation.md`](../../../../engineering/triage/operations/command/ideas/triage/skill-manifest-implementation.md).

## 1. Skill manifest JSON Schema

The manifest is the YAML frontmatter of a `SKILL.md` file (or the JSON body of a programmatically-authored skill cell).
The schema is published at `boot/schemas/skill-spec-v1.schema.json`; this section is the normative source.

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "boot/schemas/skill-spec-v1.schema.json",
  "title": "Skill Spec v1",
  "type": "object",
  "required": ["name", "description", "version", "spec-version"],
  "properties": {
    "spec-version": {
      "type": "string",
      "const": "skill-spec-v1",
      "description": "Pins the manifest to this schema. Future schema revisions get distinct const values."
    },
    "name": {
      "type": "string",
      "pattern": "^[a-z0-9][a-z0-9:/-]*[a-z0-9]$",
      "description": "Lower-kebab-case slug per decisions/slug-alphabet-lower-kebab.md. Globally unique within the aggregated manifest."
    },
    "description": {
      "type": "string",
      "minLength": 1,
      "description": "One-line human description. Surfaced in MCP discovery and in the help system."
    },
    "version": {
      "type": "array",
      "items": {"type": "integer", "minimum": 0},
      "minItems": 2,
      "maxItems": 3,
      "description": "Semver-equivalent [major, minor] or [major, minor, patch]."
    },
    "runtime": {
      "type": ["string", "null"],
      "enum": ["inference", "shell", "python", "rust", "closure-rule", "tier-2-model", null],
      "description": "How the skill is invoked. Null indicates an advisory skill (documentation-only; not executable). Only entries with non-null runtime are considered executable per the source idea."
    },
    "triggers": {
      "type": "array",
      "items": {"type": "string"},
      "default": [],
      "description": "Natural-language phrases or slug patterns that should route to this skill. Used by the agential dispatch layer (specs/agential/skill-registry.md) when scoring candidate skills."
    },
    "inputs": {
      "type": "object",
      "description": "Map of input-name to type-tag. Types are JSON-Schema-equivalent strings (`string`, `integer`, `boolean`, `object`, `array`) or substrate cell-type slugs."
    },
    "outputs": {
      "type": "object",
      "description": "Map of output-name to type-tag. Same vocabulary as inputs."
    },
    "enables-capabilities": {
      "type": "array",
      "items": {"type": "string"},
      "default": [],
      "description": "Capability slugs this skill grants the invoking session at fire time. Composed via $\\Rightarrow$ against the session's authority fiber per security/capability-model.md."
    },
    "requires-capabilities": {
      "type": "array",
      "items": {"type": "string"},
      "default": [],
      "description": "Capability slugs the invoking session MUST hold for the skill to fire. Missing capabilities surface PCS_SKILL_CAPABILITY_DENIED."
    },
    "region": {
      "type": "object",
      "properties": {
        "reads": {"type": "array", "items": {"type": "string"}},
        "writes": {"type": "array", "items": {"type": "string"}}
      },
      "description": "Substrate or filesystem regions the skill reads from and writes to. Used by the sandbox-and-fuel discipline (specs/security/sandbox-and-fuel.md) to bound effects."
    },
    "part-of": {
      "type": "string",
      "description": "Optional skill-pack slug this skill belongs to. Pack-level metadata lives at boot/skill-packs/<slug>.json."
    },
    "supersedes": {
      "type": ["string", "null"],
      "default": null,
      "description": "If non-null, the skill-name this version replaces. Supersession chain is replay-discoverable."
    },
    "retired-at-ord": {
      "type": ["integer", "null"],
      "default": null,
      "description": "If non-null, the event-ordinal at which the skill was retracted. Retired skills are not selected by the agential dispatch layer."
    }
  },
  "additionalProperties": true
}
```

`additionalProperties: true` lets per-pack extension fields ride alongside (e.g., a pack-specific `formality-layer-minimum`) without rejecting the manifest at the schema layer.
Pack-level extensions SHOULD be namespaced (`pack:<slug>:<field>`) to avoid collisions with future schema fields.

A manifest that omits `runtime` or sets it to `null` is **advisory**: it documents an idea or a capability shape but is not executable.
Advisory skills MAY be queried and surfaced in the help system but are excluded from the agential dispatch surface.

## 2. Skill-record substrate cell

Every manifest aggregated by `build-skill-manifest` (§4) becomes a `skill-record` substrate entity:

```json
{
  "kind": "skill-record",
  "id": "<sha256>",
  "slug": "skill:<name>",
  "ord": 12345
}
```

The cells produced at aggregation time are the EAVT shape (cf. [process/inter-session-messaging.md](../process/inter-session-messaging.md) §1):

```json
{"s": "skill:<name>", "p": "kind", "o": "skill-record", "v": "True"}
{"s": "skill:<name>", "p": "spec-version", "o": "skill-spec-v1", "v": "True"}
{"s": "skill:<name>", "p": "version", "o": "<major>.<minor>(.<patch>)?", "v": "True"}
{"s": "skill:<name>", "p": "description", "o": "cell:<description-cell-id>", "v": "True"}
{"s": "skill:<name>", "p": "runtime", "o": "<runtime>", "v": "True"}
{"s": "skill:<name>", "p": "executable", "o": "<True|False>", "v": "True"}
{"s": "skill:<name>", "p": "manifest-cell", "o": "cell:<canonical-manifest-bytes-id>", "v": "True"}
{"s": "skill:<name>", "p": "source-path", "o": "<path-to-SKILL.md>", "v": "True"}
{"s": "skill:<name>", "p": "manifest-version", "o": "<sha256-of-canonical-manifest-bytes>", "v": "True"}
{"s": "skill:<name>", "p": "trigger", "o": "<trigger-string>", "v": "True"}
{"s": "skill:<name>", "p": "enables-capability", "o": "<capability-slug>", "v": "True"}
{"s": "skill:<name>", "p": "requires-capability", "o": "<capability-slug>", "v": "True"}
{"s": "skill:<name>", "p": "part-of", "o": "skill-pack:<slug>", "v": "True"}
{"s": "skill:<name>", "p": "supersedes", "o": "skill:<prior-name>", "v": "True"}
{"s": "skill:<name>", "p": "retired-at-ord", "o": "<ord>", "v": "True"}
```

Multi-valued fields (`triggers`, `enables-capabilities`, `requires-capabilities`) emit one cell per entry.
The `manifest-cell` payload is the canonical-bytes serialisation of the manifest object (sorted keys, no whitespace) per [decisions/canonical-json-conventions.md](../../decisions/canonical-json-conventions.md); its SHA-256 is the `manifest-version` and identifies the manifest revision uniquely.

The aggregation event `skill-manifest-built` (§4) is the witness for these cells; the σ-pass treats them as `"asserted"` and the existing closure-rule discipline can promote derived facts (e.g., a closure rule asserting `skill:<name>` `wired-to-office` `office:<slug>` based on `part-of`).

## 3. Source format: SKILL.md

A `SKILL.md` file has YAML frontmatter conforming to §1 followed by a markdown body:

```markdown
---
spec-version: skill-spec-v1
name: orient-to-area
description: Read and understand an area of the vault before working in it
version: [0, 1]
runtime: inference
triggers:
  - "orient to"
  - "explore area"
  - "survey directory"
inputs:
  path: string
outputs:
  report: object
region:
  reads: ["content/"]
  writes: []
part-of: agential-relations-system
---

# orient-to-area

(markdown body — instructions, examples, references)
```

The body is human-facing documentation; the frontmatter is the contract.
Tooling reads the frontmatter; agents reading the skill at fire-time see the full markdown.

The OS scans two source roots by default:

- `.local/skills/<slug>/SKILL.md` — local agent skills.
- `operations/engineering/skills/<slug>/SKILL.md` — operational skill packs.

Additional roots are configurable per [decisions/self-representation-everywhere.md](../../decisions/self-representation-everywhere.md) by appending `(boot, skill-source-root, <path>)` cells.
Roots that do not exist on disk are silently skipped (not an error); a root that exists but contains no manifests emits a warning per `lint-skills` (§5).

## 4. `build-skill-manifest` lifecycle

The aggregated manifest is a single substrate fiber, projected to disk at `boot/skill-manifest.json` for fast cold-boot consumption.
The lifecycle is:

1. **Author edits** a `SKILL.md` under one of the configured source roots.
2. **`build-skill-manifest`** runs (manually or at boot per §4.1):
   1. Discovers every `SKILL.md` under each configured source root.
   2. Validates each manifest against the JSON Schema (§1).
     Validation failures produce `PCS_SKILL_MANIFEST_INVALID` and the offending manifest is excluded from the aggregate.
   3. Computes the canonical bytes and SHA-256 of each valid manifest.
   4. Detects duplicate `name` fields across manifests; duplicates surface `PCS_SKILL_DUPLICATE_NAME` and the lower-precedence source is excluded (precedence: explicit boot-roots > `.local/skills/` > `operations/engineering/skills/` > additional roots in declaration order).
   5. Detects executable manifests (non-null `runtime`) that lack the corresponding runtime adapter; surfaces `PCS_SKILL_RUNTIME_UNREGISTERED`.
   6. Emits one `skill-manifest-built` event whose payload is the list of accepted manifests.
     The event drives σ-pass insertion of the §2 cells.
   7. Writes the canonical aggregate to `boot/skill-manifest.json` (sorted keys, lexicographic name order) so external tooling (and a fresh boot before σ-pass replay completes) can read it without traversing the event log.
3. **Boot publishes** the aggregated manifest to the MCP driver per [drivers/mcp-driver.md](../drivers/mcp-driver.md) §9 so agents can discover skills via standard MCP `tools/list`-equivalent calls.
4. **`lint-skills`** (§5) validates without aggregating; authors run it locally for fast feedback before committing.

### 4.1 Boot-time aggregation

At runlevel 2 (multi-user-no-network) per [init-boot/init-runlevels.md](../init-boot/init-runlevels.md), the OS:

1. Reads `boot/skill-manifest.json` if present.
2. If absent, or if its `manifest-version`s do not match the on-disk manifests' SHA-256s, runs `build-skill-manifest` and rewrites the file.
3. Replays the `skill-manifest-built` event into the substrate; the σ-pass installs the §2 cells.
4. Hands off to runlevel 3; the agential layer's skill-registry ([agential/skill-registry.md](../agential/skill-registry.md)) is now queryable.

This makes boot-time skill discovery deterministic and inexpensive: the cached aggregate amortises across reboots; only authoring changes trigger a rebuild.

### 4.2 Verb signature

```
build-skill-manifest(roots: optional[list[string]] = configured-roots,
                     output: optional[string] = "boot/skill-manifest.json",
                     dry-run: optional[boolean] = False) → BuildResult
```

Returns:

- `accepted`: list of `(name, manifest-version, source-path)` triples.
- `rejected`: list of `(source-path, error-code, details)` triples.
- `output-written`: the path written to (omitted in dry-run mode).
- `event-id`: SHA-256 of the `skill-manifest-built` event (omitted in dry-run mode).

Dry-run produces the same accepted/rejected report without writing the aggregate or appending the event.

## 5. `lint-skills` author tooling

```
lint-skills(roots: optional[list[string]] = configured-roots,
            schema: optional[string] = "boot/schemas/skill-spec-v1.schema.json",
            severity: optional[string] = "error") → LintResult
```

`lint-skills` runs the validation pass of `build-skill-manifest` (§4 step 2) without aggregating or writing.
It returns:

- `passed`: list of `(name, source-path)` for manifests that validate cleanly.
- `failed`: list of `(source-path, error-code, details)` for manifests that fail validation, duplicate detection, or runtime registration.
- `warnings`: list of `(source-path, warning-code, details)` for non-fatal issues (e.g., missing `triggers` on an executable skill, advisory skills declared in an executable-only source root).

Authors invoke `lint-skills` from the shell ([shell/repl.md](../shell/repl.md)) before committing skill edits; the v0.6 SDK ships it as a pre-commit hook (per [milestones/v0.6-application-development.md](../../milestones/v0.6-application-development.md)).

### 5.1 Linter checks

The canonical lints are:

| Code | Severity | Meaning |
|---|---|---|
| `PCS_SKILL_MANIFEST_INVALID` | error | Frontmatter does not conform to §1 schema. |
| `PCS_SKILL_DUPLICATE_NAME` | error | Two manifests claim the same `name`. |
| `PCS_SKILL_RUNTIME_UNREGISTERED` | error | `runtime` is non-null but no runtime adapter is registered for that string. |
| `PCS_SKILL_CAPABILITY_UNDECLARED` | error | `enables-capabilities` or `requires-capabilities` references a capability slug not present in the substrate's capability registry. |
| `PCS_SKILL_TRIGGER_AMBIGUOUS` | warning | Two manifests declare overlapping triggers without distinguishing input shapes. |
| `PCS_SKILL_MISSING_TRIGGERS` | warning | An executable skill ships without triggers; the agential layer cannot route to it via natural-language dispatch. |
| `PCS_SKILL_BODY_EMPTY` | warning | The markdown body is empty; agents reading the skill at fire time get only the manifest. |
| `PCS_SKILL_SOURCE_ROOT_EMPTY` | warning | A configured source root exists on disk but contains no manifests. |

The `severity` flag controls the lint's exit code: `error` returns non-zero on any error-level code; `warning` returns non-zero on any error or warning.
`none` always returns zero (used in CI for advisory mode).

## 6. MCP exposure

The aggregated manifest is exposed through the MCP driver per [drivers/mcp-driver.md](../drivers/mcp-driver.md) §9.
Agents inside the OS enumerate available skills via the `skills/list` tool and inspect a specific skill via `skills/get`; both tools project the §2 substrate cells through the standard MCP envelope.

The agential layer wraps these tools per [agential/skill-registry.md](../agential/skill-registry.md) into a higher-level `select-skill-for-task` surface that scores candidates by trigger match, capability fit, and supersession recency.

## 7. Errors

The skill-manifest error taxonomy splits cleanly along **layer**: schema/lint/aggregation-time codes are `PCS_SKILL_*` and fire/dispatch-time capability codes reuse the substrate-wide `PCA_SCOPE_INSUFFICIENT` from [security/capability-model.md](../security/capability-model.md) §8.
The split keeps capability semantics consistent across every substrate surface (driver invocations, MCP tool calls, federation pushes, skill invocations).

| Layer | Code | Meaning |
|---|---|---|
| Aggregation | `PCS_SKILL_MANIFEST_INVALID` | A manifest fails the §1 schema. |
| Aggregation | `PCS_SKILL_DUPLICATE_NAME` | Two manifests claim the same `name`. |
| Aggregation | `PCS_SKILL_RUNTIME_UNREGISTERED` | A manifest declares a `runtime` for which no adapter is registered. |
| Aggregation | `PCS_SKILL_SOURCE_ROOT_MISSING` | A configured source root cannot be read (permission denied, etc.). Distinct from "root absent on disk", which is silent. |
| Lint | `PCS_SKILL_CAPABILITY_UNDECLARED` | A manifest's `enables-capabilities` or `requires-capabilities` references a capability slug not present in the substrate's capability registry. Lint/aggregation-time only — never raised at fire time. |
| Dispatch | `PCS_SKILL_NOT_FOUND` | Referenced skill `name` is absent from the aggregate. |
| Dispatch | `PCS_SKILL_RETIRED` | Referenced skill is present but `retired-at-ord` is non-null. |
| Dispatch | `PCS_SKILL_MANIFEST_VERSION_MISMATCH` | A pinned `manifest-version` does not match the substrate's current cell. (Defined here; raised by the dispatch surface per [agential/skill-registry.md](../agential/skill-registry.md) §5.) |
| Fire-time | `PCA_SCOPE_INSUFFICIENT` | Standard substrate capability error. The invoking session lacks a `requires-capabilities` entry, or the skill's `enables-capabilities` would amplify session authority beyond the office's bounds. The skill surface does not define a separate fire-time capability code; the substrate-wide code is the single fire-time capability surface. |

## 8. Conformance vectors

The skill-manifest discipline passes the vectors in [conformance-vectors.md](../conformance-vectors.md) §18:

1. **Manifest validation round trip** — a fixture manifest passes the schema; a deliberately broken manifest produces `PCS_SKILL_MANIFEST_INVALID`.
2. **Boot-time aggregation byte-identity** — running `build-skill-manifest` twice from a clean source-tree produces the same `boot/skill-manifest.json` bytes and the same `skill-manifest-built` event SHA-256.
3. **Duplicate-name rejection** — two manifests with the same `name` produce `PCS_SKILL_DUPLICATE_NAME`; the lower-precedence source is excluded; the accepted manifest is still admitted.
4. **Missing-runtime rejection** — a manifest declaring `runtime: tier-2-model` with no adapter registered produces `PCS_SKILL_RUNTIME_UNREGISTERED`; advisory skills (null `runtime`) are still admitted.
5. **MCP enumeration** — after boot, the MCP `tools/list` envelope returns the documented `skills/list`, `skills/get`, and `skills/select-for-task` tools with the documented schemas; `tools/call` against `skills/list` returns the bundled-skill catalog; `tools/call` against `skills/get` for a known skill returns its full manifest.
6. **Lint pass/fail** — `lint-skills` against a clean source tree returns no failures; against a tree containing each canonical error/warning produces the documented codes.
7. **Cross-language equivalence** — Python and Rust implementations of `build-skill-manifest` produce byte-identical aggregates and event SHA-256s for byte-identical source trees.

## 9. Implementation

### Python (v0.2+)

- `build-skill-manifest` and `lint-skills` as CLI entry points exposed via the v0.2 stdlib (per [stdlib/_index.md](_index.md)).
- Schema validation via `jsonschema` against `boot/schemas/skill-spec-v1.schema.json`.
- The aggregator walks configured roots; the runtime registry maps `runtime` strings to adapter modules under `pc_runtime.skill_adapters.<runtime>`.

### Rust (v0.2+)

- Same surface in the Rust runtime; schema validation via `jsonschema` crate.
- The runtime registry is a `HashMap<String, Arc<dyn SkillRuntime>>` populated at boot.

## 10. Out of scope

- Authoring or porting any specific skill manifest — that is the operational skill-pack work (project tasks #6 through #10).
- A web UI for skill browsing — surfaces in v0.7 per [milestones/v0.7-productivity-stack.md](../../milestones/v0.7-productivity-stack.md).
- Skill marketplaces or third-party skill distribution beyond what [packaging/_index.md](../packaging/_index.md) already covers for packages generally.
- Per-agent scoping of the manifest fragment (the source idea's "Future work"); deferred to v0.8 once the skill-registry consumption surface stabilises.

## 11. Plan 9 / Unix analogue

| Unix concept | Skill-manifest analogue |
|---|---|
| `man` page header (NAME / SYNOPSIS / DESCRIPTION) | `name` / `inputs`+`outputs` / `description` frontmatter fields |
| `apropos` / `whatis` index | `boot/skill-manifest.json` aggregate |
| `mandb` / `makewhatis` rebuild | `build-skill-manifest` |
| `lintian` / `rpmlint` for packages | `lint-skills` |
| Shared-library `SONAME` | `name` + `version` pair |
| `ldconfig` runtime registry | The runtime-adapter registry that resolves `runtime` strings to executors |
