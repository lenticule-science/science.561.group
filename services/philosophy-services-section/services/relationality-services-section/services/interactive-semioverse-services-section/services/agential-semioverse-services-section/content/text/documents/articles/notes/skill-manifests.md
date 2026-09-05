---
title: Skill manifests in the agential semioverse
aliases:
  - "Skill manifests in the agential Semioverse"
  - "skill manifests"
date-created: 2026-01-08T00:00:00
date-updated: 2026-03-09T00:00:00
keywords:
  - AgentialSemioverse
---

A skill manifest is a `SKILL.md` file. Claude Code discovers skills by globbing for `SKILL.md` files in `.claude/skills/` and throughout `content/`. When a user prompt matches a skill's `description` or `triggers`, Claude Code reads the SKILL.md body and executes it as instructions. The directory name serves as the skill identifier for direct invocation (`/skill-name`).

This convention — SKILL.md files discovered by filesystem search — is the format the ASR uses because it is natively compatible with Claude Code. The same way markdown is the content format because it works with Obsidian, git, and static site generators, SKILL.md is the skill format because it works with Claude Code's dispatch mechanism without adaptation.

The formal model in this document describes what these SKILL.md files represent mathematically: typed interaction surfaces in the [agential semioverse](../../../../mathematics/objects/universes/agential-semioverse/index.md) with declared inputs, outputs, regions, and dependencies. Not all fields in the formal model are used by Claude Code for dispatch — some exist for validation tooling and static analysis. The distinction between dispatch fields and analysis fields is noted throughout.

## 1. Role in the semioverse

- **Discovery**: Claude Code enumerates available skills by searching for `SKILL.md` files. The registry (Section 8) formalizes this search.
- **Dispatch**: The `description` and `triggers` fields drive prompt-to-skill matching. See [prompt routing](../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/prompt-routing.md).
- **Validation**: Region declarations, typed schemas, and dependency DAGs enable static analysis by validation scripts (Section 11). Claude Code does not enforce these at runtime; they are checked by `validate-manifest.py` and SHACL shapes.
- **Auditability**: Manifest ids make it possible to log and replay skill invocations consistently.
- **Parallelism**: Region declarations allow validation tooling to determine which skills can execute concurrently. Claude Code achieves runtime parallelism through worktree isolation (git-level filesystem copies) rather than region checking.

## 2. Manifest structure

**Definition 2.1 (Manifest).** A manifest is a tuple:

$$M = (\mathrm{id}, \mathrm{name}, \mathrm{version}, \mathrm{kind}, \mathrm{runtime}, T_{\mathrm{in}}, T_{\mathrm{out}}, \mathrm{region}, \mathrm{depends}, \mathrm{scopes})$$

where:

- $\mathrm{id} \in \mathsf{SkillId}$ is a unique, immutable identifier;
- $\mathrm{name}$ is a human-readable label;
- $\mathrm{version} = (\mathrm{major}, \mathrm{minor})$ with $\mathrm{major}, \mathrm{minor} \in \mathbb{N}$ (see Section 7);
- $\mathrm{kind} \in \{\mathsf{operational}, \mathsf{learn}, \mathsf{meta}\}$ classifies the skill;
- $\mathrm{runtime} \in \{\mathsf{manual}, \mathsf{inference}, \mathsf{script}, \mathsf{documentation}\}$ declares the execution mode;
- $T_{\mathrm{in}}$ is the input schema (Section 4);
- $T_{\mathrm{out}}$ is the output schema (Section 4);
- $\mathrm{region}$ is the region declaration (Section 3);
- $\mathrm{depends}$ is the dependency declaration (Section 5);
- $\mathrm{scopes}$ is the set of authorization scopes the skill requires.

**Frontmatter convention.** The formal manifest tuple maps to YAML frontmatter in `SKILL.md` files. The fields divide into two tiers:

**Dispatch fields** — read by Claude Code for skill discovery and execution:

```yaml
---
description: Human-readable label  # what Claude Code matches against prompts
triggers:                          # additional natural language dispatch patterns
  - "trigger phrase one"
  - "trigger phrase two"
---
```

The `description` field is what Claude Code uses for prompt matching. The SKILL.md body text is the instructions Claude Code follows when the skill is invoked. The directory name is the skill id for `/skill-name` dispatch.

**Analysis fields** — used by validation tooling (`validate-manifest.py`, SHACL shapes) for static analysis, not read by Claude Code at dispatch time:

```yaml
---
id: skill-identifier              # SkillId (immutable, must match directory name)
description: Human-readable label
version: [1, 0]                    # (major, minor)
type: operational                  # operational | learn | meta
runtime: inference                 # inference | script | manual | mcp | documentation
triggers:
  - "trigger phrase one"
inputs:                            # T_in (JSON Schema subset)
  param_name: type                 # required parameters
  optional_param: type?            # optional parameters (suffixed with ?)
outputs:                           # T_out (JSON Schema subset)
  result_name: type
region:
  reads: ["content/"]
  writes: ["content/{discipline}/"]
dependencies:                      # depends (list of SkillIds)
  - other-skill-id
scopes: []                         # authorization requirements
---
```

**Invariant 2.2 (Required fields).** A functioning skill needs only `description` (Claude Code requires this for dispatch). A validation-complete manifest adds `id` and `region` (required by `validate-manifest.py`). All other fields default to: `version: [0, 1]`, `kind: operational`, `runtime: inference`, `triggers: []`, `inputs: {}`, `outputs: {}`, `dependencies: []`, `scopes: []`.

**Invariant 2.3 (Triggers requirement for dispatchable skills).** A skill with `runtime: inference` or `runtime: script` should include at least one trigger phrase or a descriptive `description` field. Claude Code matches against both. A skill with no triggers and a generic description can only be invoked by direct naming (`/skill-id`) or as a dependency of another skill.

The runtime field declares the execution mode:

- $\mathsf{inference}$: Claude Code reads the SKILL.md body and executes it as agent instructions within the current session.
- $\mathsf{script}$: Claude Code runs a program in the colocated `scripts/` directory.
- $\mathsf{mcp}$: The skill is backed by an MCP server configured in `.claude/settings.json`. Claude Code invokes the corresponding MCP tool.
- $\mathsf{manual}$: Requires a human to perform the operation. The SKILL.md body describes what the human should do.
- $\mathsf{documentation}$: Reference-only; cannot be invoked. Provides context for other skills.

Claude Code also supports **hooks** — shell commands triggered by lifecycle events (`PreToolUse`, `PostToolUse`, `Stop`). Hooks configured in `.claude/settings.json` can run validation after skill execution, providing a runtime-adjacent enforcement point (e.g., running `validate-manifest.py` after any SKILL.md is written).

---

## 3. Region declarations

A skill manifest MAY declare a region constraint that specifies which directory subtrees the skill reads from and writes to. This connects skill manifests to the region formalism defined in the [multi-agent coordination](./multi-agent-coordination.md) specification (Definition 2.1).

**Definition 3.1 (Region declaration).** A region declaration is a pair:

$$\mathrm{region}(M) = (\mathrm{reads} : \mathcal{P}(\mathsf{DirPath}),\; \mathrm{writes} : \mathcal{P}(\mathsf{DirPath}))$$

where $\mathsf{DirPath}$ is the set of directory paths within the vault.

**Invariant 3.2 (Read-write containment).** The reads set is a subset of the writes set's read closure:

$$\mathrm{reads}(M) \subseteq \mathrm{ancestor\_closure}(\mathrm{writes}(M)) \cup \mathrm{writes}(M)$$

This captures the fact that a skill may read from parent directories to discover context (e.g., reading an `index.md` in an ancestor directory) without requiring write access to those directories. Every directory a skill writes to is also readable by that skill.

**Definition 3.3 (Write region).** The write region of a manifest $M$ is the region in the fragment [lattice](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/lattice.md) generated by the writes set:

$$R_M = \bigcup_{d \in \mathrm{writes}(M)} R_d$$

where $R_d$ is the directory region from Definition 2.2 of the multi-agent coordination specification. This is the region the skill is permitted to modify.

**Definition 3.4 (Read surface).** The read surface of a manifest $M$ is the region in the fragment [lattice](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/lattice.md) generated by the reads set:

$$\mathrm{ReadSurface}_M = \bigcup_{d \in \mathrm{reads}(M)} R_d$$

The read surface determines what fragments the skill may observe. The skill must not modify any fragment in $\mathrm{ReadSurface}_M \setminus R_M$ (the read-only portion of its surface).

**Lemma 3.5 (Region declarations enable static parallelism analysis).** Given two manifests $M_1, M_2$ with $R_{M_1} \cap R_{M_2} = \emptyset$ (disjoint write regions), the skills they describe can execute in parallel without coordination, by the Non-Interference Theorem (Theorem 4.1 of the multi-agent coordination specification).

*Proof.* Skills restricted to disjoint write regions act as the identity on each other's write fragments. Read-only access to shared fragments does not modify [the state](../../../../sociology/terms/the-state.md) in $\mathcal{U}$, so it introduces no conflict (Lemma 7.2 of the multi-agent coordination specification). The commutativity proof from Theorem 4.1 applies.

**Remark 3.6 (Absence of a region declaration).** When a manifest omits the region declaration, the scheduler must treat the skill conservatively: it may read from or write to any directory. Such skills cannot be parallelized with any other skill that declares writes.

---

## 4. Input/output schema

The input and output types of a skill are formalized as schemas that serve as pre- and postconditions on invocation.

**Definition 4.1 (Input schema).** The input schema $T_{\mathrm{in}}$ is a JSON Schema document. A skill may only be invoked with an input value $\mathrm{in}$ that validates against $T_{\mathrm{in}}$:

$$\mathrm{valid}(\mathrm{in}, T_{\mathrm{in}}) = \mathrm{true}$$

The input schema is a precondition: if an agent attempts to invoke a skill with an input that does not validate, the invocation must not proceed. This corresponds to the precondition check in the work-unit lifecycle (Definition 3.2, step 1 of the [work-unit lifecycle](./work-unit-lifecycle.md) specification).

**Definition 4.2 (Output schema).** The output schema $T_{\mathrm{out}}$ is a JSON Schema document that includes, as a required subschema, an $\mathrm{EffectReport}$ field. The skill's output $\mathrm{out}$ must validate against $T_{\mathrm{out}}$:

$$\mathrm{valid}(\mathrm{out}, T_{\mathrm{out}}) = \mathrm{true}$$

The output schema is a postcondition: if the skill produces output that does not validate, the work unit transitions to $\mathsf{failed}$ status with an error envelope whose semantic code is $\mathsf{POSTCONDITION\_VIOLATION}$ (see the [error envelopes](./error-envelopes.md) specification).

**Invariant 4.3 (EffectReport inclusion).** Every output schema $T_{\mathrm{out}}$ must include a field conforming to the EffectReport structure defined in Definition 4.1 of the [work-unit lifecycle](./work-unit-lifecycle.md) specification. This ensures that every completed skill invocation produces an auditable record of what it changed.

**Definition 4.4 (Schema compatibility).** Two schemas are compatible for pipeline composition when the output schema of one skill can serve as input to the next. Formally, schemas $T_{\mathrm{out}}^{(i)}$ and $T_{\mathrm{in}}^{(i+1)}$ are **compatible** if there exists a monotone map $\phi_i$ (a schema projection or transformation) such that:

$$\text{for all } \mathrm{out} \in T_{\mathrm{out}}^{(i)}, \quad \mathrm{valid}(\phi_i(\mathrm{out}), T_{\mathrm{in}}^{(i+1)}) = \mathrm{true}$$

This connects to the pipeline pattern formalized in Definition 9.1 of the multi-agent coordination specification.

**Remark 4.5 (Typed routing).** The scheduler uses input/output schemas for machine routing: given a task that requires a skill with input of type $T$, the scheduler queries the registry (Section 8) for manifests whose $T_{\mathrm{in}}$ is compatible with $T$. Schema compatibility is decidable for JSON Schema (it reduces to subtype checking), so routing is mechanizable.

---

## 5. Dependency declarations

A skill manifest MAY declare dependencies on other skills.

**Definition 5.1 (Dependency set).** The dependency declaration of a manifest $M$ is:

$$\mathrm{depends}(M) = \{s_1, s_2, \ldots, s_k\} \subseteq \mathsf{SkillId}$$

Each $s_i$ is the id of a skill that must be available in the executing agent's skill set before $M$'s skill can be invoked. "Available" means: the skill $s_i$ has a manifest in the registry and the agent's profile includes $s_i$ in its skill set $\mathrm{Skills}_a$.

**Definition 5.2 (Dependency graph).** The dependency relation across all manifests induces a directed graph $G_{\mathrm{dep}} = (\mathsf{SkillId}, E_{\mathrm{dep}})$ where $(s_i, s_j) \in E_{\mathrm{dep}}$ if and only if $s_i \in \mathrm{depends}(M_j)$ (skill $j$ depends on skill $i$).

**Invariant 5.3 (Acyclicity).** The dependency graph $G_{\mathrm{dep}}$ must be a directed acyclic graph (DAG). Cyclic dependencies indicate a specification error and must be resolved before any skill in the cycle can be invoked.

**Remark 5.4 (Relationship to work-unit chains).** The dependency DAG mirrors the structure of work-unit chains (Definition 6.1 of the work-unit lifecycle specification). When a chain invokes skill $s_j$ that depends on $s_i$, the chain must include a work unit for $s_i$ that precedes the work unit for $s_j$, or $s_i$ must have been executed in a prior chain whose effects persist in the current state.

**Remark 5.5 (Dependency vs. coordination dependency).** The dependency declaration ($\mathrm{depends}$) states that a skill requires another skill to be *available*. This is distinct from the coordination dependency defined in Section 6, which states that two skills with overlapping write regions must declare each other in order to execute without conflict. A skill can depend on another (requiring its presence) without having overlapping regions, and two skills can have overlapping regions without one depending on the other's availability.

---

## 6. Conflict detection

Two manifests may conflict if their write regions overlap and neither declares coordination with the other. This section formalizes when manifests are in conflict and when they are safe to execute in parallel.

**Definition 6.1 (Coordination dependency).** A manifest $M_1$ declares a **coordination dependency** on $M_2$ if $\mathrm{id}(M_2) \in \mathrm{depends}(M_1)$ and the dependency is annotated as a coordination constraint (as opposed to an availability requirement). In implementation, the dependency declaration includes a field `coordination: true` for such entries.

**Definition 6.2 (Manifest conflict).** Two manifests $M_1, M_2$ are in **conflict** if:

$$\mathrm{writes}(M_1) \cap \mathrm{writes}(M_2) \neq \emptyset$$

and neither $M_1$ declares a coordination dependency on $M_2$ nor $M_2$ declares a coordination dependency on $M_1$.

In words: two skills whose write regions overlap and that do not acknowledge each other through coordination dependencies are in conflict.

**Theorem 6.3 (Conflict-free manifests guarantee non-interference).** If two manifests $M_1, M_2$ are not in conflict — either because $\mathrm{writes}(M_1) \cap \mathrm{writes}(M_2) = \emptyset$ or because one declares a coordination dependency on the other — then their skill invocations can be composed without violating the Non-Interference Theorem (Theorem 4.1 of the multi-agent coordination specification).

*Proof.* There are two cases:

1. **Disjoint write regions** ($R_{M_1} \cap R_{M_2} = \emptyset$). The skills operate on disjoint regions. By Theorem 4.1 of the multi-agent coordination specification, their interaction operators commute and the composite is admissible. Parallel execution is safe.

2. **Coordination dependency declared.** One manifest declares a coordination dependency on the other, which means the scheduler must sequence them: the depended-upon skill executes first, and the dependent skill executes second. This reduces to the sequential composition with handoff (Definition 6.2 of the multi-agent coordination specification). By Lemma 6.4 of that specification, sequential composition preserves admissibility.

In both cases, the composition of skill invocations is admissible and produces a well-defined result.

**Corollary 6.4 (Static conflict detection).** Conflict between manifests can be detected at registration time by checking whether $\mathrm{writes}(M_1) \cap \mathrm{writes}(M_2) \neq \emptyset$ and whether the coordination dependency relation includes the pair. No runtime state is needed. This makes conflict detection a purely structural [property](../../../../sociology/terms/property.md) of the manifest registry.

---

## 7. Manifest versioning

Manifests evolve as skills are improved (the skill-first principle from the [agent-skill interaction](../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/agent-skill-interaction.md) specification). Version changes must satisfy backward compatibility constraints to preserve the integrity of chains that reference the manifest.

**Definition 7.1 (Version pair).** A manifest version is a pair $(\mathrm{major}, \mathrm{minor})$ with $\mathrm{major}, \mathrm{minor} \in \mathbb{N}$.

**Definition 7.2 (Minor version change).** A version change from $(n, m)$ to $(n, m+1)$ is a **minor change**. Minor changes must satisfy:

1. **Additive fields only.** New fields may be added to $T_{\mathrm{in}}$ and $T_{\mathrm{out}}$, but existing fields retain their types and semantics.
2. **Region narrowing only.** The write region may shrink: $\mathrm{writes}(M_{n,m+1}) \subseteq \mathrm{writes}(M_{n,m})$. A skill may give up write access to a directory but may not claim new write access in a minor version.
3. **Read surface stability.** The read surface may expand: $\mathrm{reads}(M_{n,m}) \subseteq \mathrm{reads}(M_{n,m+1})$. Reading additional directories does not break existing consumers.
4. **Dependency monotonicity.** Dependencies may be added: $\mathrm{depends}(M_{n,m}) \subseteq \mathrm{depends}(M_{n,m+1})$. Removing a dependency is also a minor change (it relaxes a requirement).

**Definition 7.3 (Major version change).** A version change from $(n, m)$ to $(n+1, 0)$ is a **major change**. Major changes allow:

1. **Field type changes.** Existing fields in $T_{\mathrm{in}}$ or $T_{\mathrm{out}}$ may change type, be renamed, or be removed.
2. **Region expansion.** The write region may grow: new directories may appear in $\mathrm{writes}(M_{n+1,0})$.
3. **Schema incompatibility.** The new $T_{\mathrm{in}}$ or $T_{\mathrm{out}}$ need not be compatible with the prior version.

Major version changes break backward compatibility. Chains that reference $(\mathrm{id}, n)$ must be updated to use $(n+1)$ explicitly; the scheduler does not auto-upgrade across major versions.

**Invariant 7.4 (Id immutability).** The $\mathrm{id}$ field of a manifest never changes across versions. The id uniquely identifies the skill across all versions; the version pair disambiguates which specification is current.

---

## 8. Manifest registry

The set of all manifests is organized into a registry that agents query to discover skills.

**Definition 8.1 (Registry).** The manifest registry is a function:

$$\mathrm{Registry} : \mathsf{SkillId} \to \mathsf{Manifest}$$

mapping each skill id to its current manifest. The registry is itself a thing in the semioverse: it has a [handle](../../../../../../../content/text/glossary/terms/handle.md) $\tau_{\mathrm{reg}} \in \mathsf{Handle}$ with a semantic seed $\eta(\tau_{\mathrm{reg}}) \in H$, and its [footprint](../../../../../../../content/text/glossary/terms/footprint.md) $\mathrm{Foot}_X(\tau_{\mathrm{reg}})$ records all queries and updates.

**Definition 8.2 (Registry operations).** The registry supports three operations:

1. **Lookup**: $\mathrm{lookup}(\mathrm{id}) = M$ returns the manifest for skill $\mathrm{id}$, or $\bot$ if no such manifest exists.
2. **Register**: $\mathrm{register}(M)$ adds manifest $M$ to the registry, provided the consistency check (Invariant 8.3) passes.
3. **Query**: $\mathrm{query}(T) = \{M : \mathrm{valid}(T, T_{\mathrm{in}}(M))\}$ returns all manifests whose input schema is compatible with type $T$.

**Invariant 8.3 (Registry consistency).** The registry must satisfy:

1. **Unique ids.** No two manifests share an id: $\mathrm{Registry}$ is injective on $\mathsf{SkillId}$.
2. **Acyclic dependencies.** The dependency graph $G_{\mathrm{dep}}$ induced by all registered manifests is a DAG (Invariant 5.3).
3. **No unresolved conflicts in a single execution context.** For any execution context (a set of skills that may run concurrently), no two manifests in the context are in conflict (Definition 6.2). The registry enforces this at registration time: if registering $M$ would create a conflict with an existing manifest $M'$ in the same execution context, registration fails unless one of them declares a coordination dependency on the other.

**Definition 8.4 (Execution context).** An execution context is a subset of the registry's skill ids that represents the skills available during a particular coordination (e.g., a fan-out or pipeline). The execution context determines which conflict checks apply: two manifests that are never used in the same coordination need not declare coordination dependencies, even if their write regions overlap.

**Remark 8.5 (Claude Code implementation).** Claude Code implements the registry through filesystem discovery. It searches two locations:

1. **`.claude/skills/`** — core agent skills. Each `SKILL.md` file is a manifest entry. The skill's directory name serves as the id.
2. **`content/**/SKILL.md`** — content-embedded skills colocated with the things they operate on.

Claude Code discovers skills by globbing for `SKILL.md` files. The registry operations map to filesystem operations: lookup is path resolution, register is file creation, and query is glob search with prompt-to-description matching. Claude Code does not currently perform schema-based query (Definition 8.2, operation 3) — dispatch uses description/trigger matching rather than input schema compatibility.

The hand-maintained registry at `.claude/skills/registry.md` supplements filesystem discovery by providing a human-readable index with trigger patterns grouped by intent category. This index is read by agents at session start for faster routing.

---

## 9. Relationship to other objects

- Manifest entries are things in the [agential semioverse](../../../../mathematics/objects/universes/agential-semioverse/index.md) with [footprints](../../../../../../../content/text/glossary/terms/footprint.md) in logs and audits. Each manifest has a [handle](../../../../../../../content/text/glossary/terms/handle.md) $\tau_M \in \mathsf{Handle}$ whose fragment $F_{\tau_M, X}$ records the manifest's definition and all invocations against it.
- **MCP servers** configured in `.claude/settings.json` expose tools that Claude Code can invoke. Skills with `runtime: mcp` are backed by MCP tools. The input schema $T_{\mathrm{in}}$ maps to the MCP tool's parameter schema; the output schema $T_{\mathrm{out}}$ maps to the response schema. MCP servers extend the agent's tool set at runtime — the `Tools` component of an agent profile includes both built-in tools and MCP-provided tools.
- Petri-net/Lean models can treat each manifest entry as a transition for reachability/liveness checks. The input schema defines the precondition places; the output schema (including the EffectReport) defines the postcondition places. Chain validation (Theorem 7.2 of the work-unit lifecycle specification) reduces to reachability in the Petri net constructed from manifest entries.
- Work-unit lifecycle: every work unit (Definition 2.1 of the work-unit lifecycle specification) references a manifest by id. The work unit's $\mathrm{input}$ must validate against $T_{\mathrm{in}}$; its effect report must conform to the $\mathrm{EffectReport}$ subschema of $T_{\mathrm{out}}$; its region $R$ must be contained in $R_M$.
- Error envelopes: when a skill invocation fails, the output must still conform to the error envelope contract (the [error envelopes](./error-envelopes.md) specification). The manifest's $T_{\mathrm{out}}$ should include the error envelope as an alternative schema (a union type), so that both success and failure outputs validate.

---

## 10. Practical examples

Three manifests from this vault illustrate the formalism.

### 10.1 cross-link-document

```
id: cross-link-document
name: Cross-link document
version: (1, 0)
type: operational
runtime: inference
region:
  reads: [content/]
  writes: [content/]
depends: {}
```

**Region analysis.** This skill reads the full vault to discover link targets and writes to the full vault to insert links. Its write region $R_M$ covers all of `content/`. Because the write region spans the entire content tree, $R_M$ overlaps with the write region of any other skill that writes to `content/`. No other content-writing skill can execute in parallel with `cross-link-document` unless it declares a coordination dependency.

**Input schema ($T_{\mathrm{in}}$).** A JSON object with a required `target_path` field (the file to cross-link) and optional `link_targets` (an array of paths to consider as link destinations).

**Output schema ($T_{\mathrm{out}}$).** A JSON object with `links_added` (array of source-target pairs), `links_removed` (array of source-target pairs), and an `EffectReport` conforming to Definition 4.1 of the work-unit lifecycle specification.

### 10.2 write-new-note

```
id: write-new-note
name: Write new note
version: (1, 0)
type: operational
runtime: inference
region:
  reads: [content/{target-discipline}/]
  writes: [content/{target-discipline}/]
depends: {}
```

**Region analysis.** The region is parameterized by the target discipline. When invoked for `content/philosophy/`, the write region is $R_{\mathrm{philosophy}}$. When invoked for `content/mathematics/`, the write region is $R_{\mathrm{mathematics}}$. Two invocations targeting different disciplines have disjoint write regions ($R_{\mathrm{philosophy}} \cap R_{\mathrm{mathematics}} = \emptyset$ by Lemma 2.5 of the multi-agent coordination specification), so they can execute in parallel.

**Input schema ($T_{\mathrm{in}}$).** A JSON object with required fields `discipline` (the target discipline directory), `subdirectory` (the content-type subdirectory: terms, concepts, etc.), `title`, and `content_body`.

**Output schema ($T_{\mathrm{out}}$).** A JSON object with `created_path` (the path of the new file) and an `EffectReport`.

### 10.3 audit-vault-references

```
id: audit-vault-references
name: Audit vault references
version: (1, 0)
type: operational
runtime: script
region:
  reads: [content/]
  writes: [slop/]
depends: {}
```

**Region analysis.** This skill reads the entire vault to find broken references but writes only to `slop/` (where it deposits the audit report). Its write region is $R_{\mathrm{slop}}$. Because $R_{\mathrm{slop}}$ is disjoint from $R_d$ for any discipline directory $d$ (by Lemma 2.5 of the multi-agent coordination specification), this skill can execute in parallel with any skill that writes only to discipline directories. It cannot execute in parallel with other skills that write to `slop/`.

**Conflict example.** Suppose `cross-link-document` and `write-new-note` (targeting `content/philosophy/`) are both in a proposed execution context. Their write regions overlap: `content/` contains `content/philosophy/`. They are in conflict (Definition 6.2) because neither declares a coordination dependency on the other. The scheduler must either serialize them or require one to declare a coordination dependency. By contrast, `audit-vault-references` and `write-new-note` (targeting `content/philosophy/`) have disjoint write regions (`slop/` vs `content/philosophy/`) and can execute in parallel.

---

## 11. Validation

Claude Code does not enforce analysis fields (regions, typed schemas, dependencies) at runtime. Validation is performed by separate tooling — this separation is intentional. Claude Code provides execution; validation scripts provide correctness checking. The architecture mirrors how markdown editors do not enforce frontmatter schemas — linters and build tools do.

A `SKILL.md` file can be validated against this specification. The validation checks:

1. Required fields are present (`id`, `description`; `region` for validation-complete manifests).
2. `id` matches the directory name.
3. `dependencies` reference existing skill ids.
4. `region.writes` and `region.reads` reference valid directory paths.
5. `inputs` and `outputs` are well-typed.
6. `triggers` are present for invocable skills.

This validation is encoded as:

- **SHACL shapes**: [`skill-manifests.shapes.ttl`](../../../../../data/ontology/relationality/skill-manifests-shapes.ttl) (colocated with this specification)
- **Python script**: [`validate-manifest.py`](../scripts/validate-manifest.py) (implements all six checks plus DAG acyclicity)

Run the validator from the repository root:

```bash
python content/technology/specifications/agential-semioverse-repository/scripts/validate-manifest.py
```

Validation can be triggered automatically using Claude Code hooks. A `PostToolUse` hook on the `Write` tool can run validation after any SKILL.md file is written, catching violations immediately.

---

## 12. Open questions

1. **Parameterized regions.** The `write-new-note` example uses a parameterized region `content/{target-discipline}/` whose concrete value depends on the input. The current formalism treats the region as a static declaration. Extending the formalism to support input-dependent region resolution would tighten the parallelism analysis (the scheduler could determine disjointness from the input values, not just from the declared write sets). This connects to the open question about dynamic region assignment in Section 12 of the multi-agent coordination specification.

2. **Schema evolution tooling.** The versioning rules (Section 7) are stated as invariants but lack an automated checker. A tool that compares two manifest versions and verifies backward compatibility would enforce these invariants at registration time.

3. **Cross-vault registries.** The current formalism assumes a single vault. If multiple ASR instances share skills (e.g., a shared library of audit skills), the registry must handle cross-vault id namespacing, version synchronization, and region declarations that reference paths in different vaults.
