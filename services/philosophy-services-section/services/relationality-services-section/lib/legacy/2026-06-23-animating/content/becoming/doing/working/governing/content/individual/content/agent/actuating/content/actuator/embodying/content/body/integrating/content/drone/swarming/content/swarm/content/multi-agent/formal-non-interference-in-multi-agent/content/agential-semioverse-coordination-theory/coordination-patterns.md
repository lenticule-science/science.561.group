---
title: "Coordination Patterns for Agent Sessions"
date-created: 2026-03-03T00:00:00
aliases:
  - "Coordination Patterns for Agent Sessions"
  - "coordination patterns"
keywords:
  - AgentialSemioverse
date-updated: 2026-03-09T00:00:00
---

## 1. Introduction

This document catalogs coordination patterns that have emerged from practical agent operation on this vault.
Each pattern is described operationally, then connected to its formal model in the [multi-agent coordination](./multi-agent-coordination.md) and [work-unit lifecycle](./work-unit-lifecycle.md) specifications.
The patterns are not exhaustive; they capture what has been observed and shown to work.

The document serves as a bridge between the formal theory (regions, non-interference, composition theorems) and the concrete scripts, configs, and agent workflows that implement that theory in day-to-day vault maintenance.
Where the formal specifications define what compositions are admissible, this document records which compositions have proven useful and how they relate to one another.

We assume familiarity with the structures defined in the [multi-agent coordination](./multi-agent-coordination.md) specification (regions, region-restricted agents, parallel and sequential composition, fan-out, pipeline, coordination correctness) and the [work-unit lifecycle](./work-unit-lifecycle.md) specification (work units, lifecycle states, effect reports, provenance traces, chains, idempotency).
References to definitions and theorems in those specifications use their original numbering.

---

## 2. Pattern: Config-Driven Batch Operation

**Operational description.** A single configuration artifact (e.g., a JSON file listing search terms and link targets) drives a script that applies the same transformation across many files.
An agent builds or extends the configuration, then executes the script.

**Concrete instance.** The cross-link pipeline.
A `cross-link-config.json` file lists 130+ targets (search terms mapped to wikilinks).
The `cross-link.py` script reads the config, scans all `.md` files, and inserts wikilinks for unlinked mentions.
An agent can extend the config with new targets, re-run the script, and produce hundreds of links in one pass.

**Formal model.**

- The config artifact is a shared configuration $\tau_{\mathrm{config}}$ (Definition 7.1 from the [multi-agent coordination](./multi-agent-coordination.md) specification).
- Each execution is a single work unit $W$ with region $R = R_{\mathrm{content}}$ (the entire `content/` directory).
- The script implements a [closure operator](../../../../mathematics/concepts/closure-operator/index.md): running it twice produces no additional changes (idempotent).
  This connects to the idempotency characterization in Section 9 of the [work-unit lifecycle](./work-unit-lifecycle.md) specification (Lemma 9.2): the skill interpretation computes $\mathcal{S}|_R$, so $[\!
  [s]\!]_a([\!
  [s]\!]_a(X, \mathrm{in})_{\mathcal{U}}, \mathrm{in}) = [\!
  [s]\!]_a(X, \mathrm{in})$.
- The config is the generator; the law is "first unlinked mention of each term gets a wikilink"; the [fixed point](../../../../mathematics/concepts/fixed-point/index.md) is [the state](../../../../sociology/terms/the-state.md) where all configured terms are linked on first mention.

**When to use.** When a transformation is uniform (the same rule applied to many files) and the rule set is parameterizable as data rather than code.

**Constraints.** The config must be consistent (no contradictory rules).
The script must be idempotent.
The region is the entire `content/` directory, so this pattern cannot parallelize with other content-wide operations without declaring coordination dependencies (Definition 6.1 of the [skill manifests](./skill-manifests.md) specification).

---

## 3. Pattern: Directory-Partitioned Fan-Out

**Operational description.** A task is split by directory subtree.
Multiple agents work in parallel, each restricted to a disjoint subtree.
A coordinator dispatches tasks and collects results.

**Concrete instance.** Creating content for different disciplines in parallel.
Three agents work simultaneously: Agent 1 writes `sociology/terms/` entries, Agent 2 writes `philosophy/terms/` entries, Agent 3 writes `mathematics/concepts/` entries.
Each agent's write region is a single discipline directory.
No agent modifies files outside its assigned directory.

**Formal model.**

- This is a fan-out (Definition 8.1 from the [multi-agent coordination](./multi-agent-coordination.md) specification).
- Regions $R_1 = R_{\mathrm{sociology/terms}}$, $R_2 = R_{\mathrm{philosophy/terms}}$, $R_3 = R_{\mathrm{mathematics/concepts}}$ are pairwise disjoint (by Lemma 2.5 of that specification, since the filesystem subtrees do not overlap).
- By the Non-Interference Theorem (Theorem 4.1), execution order is irrelevant: $E_1 \circ E_2 \circ E_3 = E_{\sigma(1)} \circ E_{\sigma(2)} \circ E_{\sigma(3)}$ for any permutation $\sigma$.
- The coordinator (the parent agent session) assigns regions, dispatches sub-agents, and commits results.
  The fan-out composition is $A_c^{\mathrm{init}} ;_{h_{\mathrm{config}}} (A_1|_{R_1} \parallel A_2|_{R_2} \parallel A_3|_{R_3}) ;_{h_{\mathrm{done}}} A_c^{\mathrm{collect}}$.

**When to use.** When the task decomposes naturally along directory boundaries and the write regions do not overlap.

**Constraints.** Agents may read shared content (e.g., style guide, bibliography) but must not write outside their assigned region.
Cross-references between regions (wikilinks from sociology to philosophy) are safe because wikilinks are resolved by Obsidian at read time, not at write time.
Reading shared content does not break non-interference (Lemma 7.2 of the multi-agent coordination specification).

---

## 4. Pattern: Pipeline Composition

**Operational description.** A sequence of operations where each step's output feeds the next step's input.
The pipeline is executed sequentially; parallelism occurs within stages, not across them.

**Concrete instance.** The vault maintenance pipeline:

1. `fix-tags.py` -- normalizes tag values across all files
2. `add-type-tags.py` -- adds `type/` tags based on directory position
3. `cross-link.py` -- inserts wikilinks based on config
4. `find-orphans.py` -- detects pages with zero incoming links
5. `fix-index-links.py` -- makes `index.md` files link to their children
6. Manual agent work -- creates content to resolve remaining orphans

Steps 1--2 are sequential (both modify tags; step 2 depends on step 1's cleanup).
Steps 3--5 are also sequential (step 4 must see step 3's links to report accurate orphan counts; step 5 must see step 4's output to know which indexes need links).
Step 6 follows all automated steps.

**Formal model.**

- Each step is a work unit in a chain (Definition 6.1 from the [work-unit lifecycle](./work-unit-lifecycle.md) specification).
- Handoff predicates $h_i$ check that the prior step completed without errors.
  For example, $h_1$ checks that `fix-tags.py` terminated with exit code 0 and that the resulting tag values pass a consistency check.
- The pipeline is a sequential composition $A_1 ;_{h_1} A_2 ;_{h_2} \cdots ;_{h_5} A_6$ (Definition 6.2 from the [multi-agent coordination](./multi-agent-coordination.md) specification).
- Each step's effect report is composed with the next via the sequential effect composition operator $\oplus$ (Definition 8.2 from the work-unit lifecycle specification).
- The composite provenance trace is the concatenation of individual traces (Theorem 9.4 of the multi-agent coordination specification; Lemma 5.4 of the work-unit lifecycle specification).

**When to use.** When operations have data dependencies (later steps need earlier steps' outputs) or when later steps must see a consistent state produced by earlier steps.

**Constraints.** No parallelism across pipeline stages.
Within a stage, the config-driven batch or fan-out patterns may apply.

---

## 5. Pattern: Stub Detection and Expansion

**Operational description.** An audit skill identifies content gaps (empty stubs, thin entries), categorizes them by type and location, then multiple agents fill them in parallel using the directory-partitioned fan-out pattern.

**Concrete instance.** `find-orphans.py` detects 133 empty stubs.
An agent categorizes them: 83 in `personal/` (skip), 31 in `personal/terms/` (skip), 19 actionable.
Two agents expand stubs in parallel: Agent 1 handles 10 empty stubs, Agent 2 handles 22 thin stubs, with each assigned non-overlapping file sets.

**Formal model.**

- The audit is a read-only work unit.
  Its region covers all of `content/` but its write set is empty: $\mathrm{created}(W_{\mathrm{audit}}) = \mathrm{modified}(W_{\mathrm{audit}}) = \mathrm{deleted}(W_{\mathrm{audit}}) = \emptyset$.
  The output is the orphan report.
- The expansion work units are parallel by the fan-out pattern.
  Each agent writes to a distinct set of files, so the regions are pairwise disjoint.
  By the Non-Interference Theorem (Theorem 4.1), the agents do not interfere with each other.
- The audit followed by expansion is a two-stage pipeline: $W_{\mathrm{audit}} ;_{h_{\mathrm{report}}} (W_{\mathrm{expand,1}} \parallel W_{\mathrm{expand,2}})$, where $h_{\mathrm{report}}$ checks that the orphan report is non-empty.

**When to use.** When the vault has content gaps that can be identified programmatically and filled independently.

---

## 6. Pattern: Incremental Config Expansion

**Operational description.** A config-driven batch operation is run iteratively.
After each pass, the agent inspects the results, identifies additional targets, extends the config, and re-runs.
Each pass adds fewer changes as the config converges toward completeness.

**Concrete instance.** The cross-link config started at 18 targets, expanded to 55, then 88, then 130.
Each expansion was followed by a re-run: 204 links, then 844, then 774, then 537.
The diminishing returns signal convergence toward a [fixed point](../../../../mathematics/concepts/fixed-point/index.md).

**Formal model.**

- Each (extend-config, re-run) pair is a work unit $W_k$.
- The sequence of work units $W_1, W_2, W_3, \ldots$ is a chain converging to a [fixed point](../../../../mathematics/concepts/fixed-point/index.md).
- Convergence is guaranteed by the inflationary [property](../../../../sociology/terms/property.md) of the [closure operator](../../../../mathematics/concepts/closure-operator/index.md): each pass adds links but never removes them.
  The sequence of vault states $X_0 \leq X_1 \leq X_2 \leq \cdots$ is monotone increasing in the [Heyting algebra](../../../../mathematics/concepts/heyting-algebra/index.md) order.
- The config expansion is itself monotone: targets are only added, never removed.
  The config at step $k$ is a subset of the config at step $k+1$.
- Because the vault is finite (finitely many files, finitely many potential link sites), the monotone increasing sequence must stabilize.
  The [fixed point](../../../../mathematics/concepts/fixed-point/index.md) $X^*$ is the least upper bound of the chain.

**When to use.** When the transformation is closure-like and the configuration is incomplete -- the agent discovers new targets by inspecting the results of prior passes.

---

## 7. Pattern: Read-Audit-Fix Cycle

**Operational description.** An audit skill reads the vault state, produces a structured report of issues (broken references, style violations, missing frontmatter), and a fix skill processes the report to resolve issues automatically.
The cycle repeats until the audit report stabilizes.

**Concrete instance.** `audit-vault-references.py` produces a list of broken references.
`fix-refs.py` and `fix-paths.py` process this list to auto-fix path errors and missing aliases.
The cycle is repeated: audit, fix, audit again, fix remaining issues.
Convergence occurs when the audit report produces no new fixable issues.

**Formal model.**

- The audit is a read-only work unit $W_{\mathrm{audit}}$.
- The fix is a write work unit $W_{\mathrm{fix}}$ whose input is the audit report.
- The cycle is a sequential composition with the handoff predicate "audit report is non-empty": $W_{\mathrm{audit}} ;_{h} W_{\mathrm{fix}} ;_{h'} W_{\mathrm{audit}} ;_{h} W_{\mathrm{fix}} ;_{h'} \cdots$.
- Convergence occurs when the audit report stabilizes (no new issues found).
  This is the fixed-point test: if $\mathrm{EffectReport}(W_{\mathrm{fix}})$ has empty created, modified, and deleted sets, the [fixed point](../../../../mathematics/concepts/fixed-point/index.md) has been reached.
- This is a concrete instance of the [closure-operator-as-API-contract](../ideas/closure-operators-as-api-contracts.md) pattern: the law is "all references resolve," the generator is the current vault state, and the [fixed point](../../../../mathematics/concepts/fixed-point/index.md) is a vault with no broken references.

**When to use.** When the vault has structural issues that can be detected programmatically and fixed by rules.

---

## 8. Anti-Patterns

This section documents coordination approaches that have failed in practice and explains why they fail against the formal model.

**Concurrent writers to the same file set.** Two agents modifying the same directory without region partitioning causes merge conflicts and semantic inconsistency.
This violates the precondition of the Non-Interference Theorem (Theorem 4.1 of the multi-agent coordination specification): the theorem requires disjoint regions $R_1 \cap R_2 = \emptyset$.
When regions overlap and no coordination dependency is declared, the result is a manifest conflict (Definition 6.2 of the [skill manifests](./skill-manifests.md) specification).
Always partition by directory or by explicit file assignment before parallelizing.

**Implicit shared state.** Agents that depend on each other's output but do not declare that dependency via a handoff predicate or shared config produce unreliable results.
In the formal model, this corresponds to a chain with missing dependency edges: two work units $W_i, W_j$ where $W_j$ reads $W_i$'s output but $W_i \not\leq_{\mathrm{dep}} W_j$ in the chain's [partial order](../../../../mathematics/objects/posets/terms/partial-order.md) (Definition 6.1 of the work-unit lifecycle specification).
Without the declared dependency, the scheduler may execute $W_j$ before $W_i$, violating $W_j$'s precondition.
Every inter-agent data flow must be explicit.

**Unbounded config expansion.** If the config grows without convergence criteria, the incremental expansion pattern becomes non-terminating.
The formal guarantee of convergence (Section 6 above) depends on the vault being finite and the operator being inflationary.
But if the config expansion itself introduces new content (e.g., creating stub pages that themselves become link targets), the domain grows with each pass, and convergence is not guaranteed.
Always define a convergence metric (e.g., "fewer than $N$ new links added" or "orphan rate below $X\%$") and halt when the metric is satisfied.

---

## 9. Relationship to ASR Theory

Each pattern maps to formal objects in the Agential Semioverse theory:

| Pattern | Formal Model |
|---|---|
| Config-driven batch | Closure operator with configurable generator and fixed law (Lemma 9.2, work-unit lifecycle) |
| Directory-partitioned fan-out | Parallel composition with disjoint regions (Theorem 5.2, multi-agent coordination) |
| Pipeline composition | Sequential composition with typed handoffs (Definition 6.2, multi-agent coordination) |
| Stub detection and expansion | Two-stage pipeline: read-only audit then parallel fan-out |
| Incremental config expansion | Iterating a monotone, inflationary operator to its [fixed point](../../../../mathematics/concepts/fixed-point/index.md) |
| Read-audit-fix cycle | The same, with the audit as the fixed-point test |

The patterns are not independent -- they compose.
A maintenance session combines fan-out within pipeline stages, with config-driven batches as the atomic operations.
For example, the vault maintenance pipeline (Section 4) uses config-driven batch operations at each stage.
The stub detection and expansion pattern (Section 5) nests a fan-out inside a pipeline.
The incremental config expansion pattern (Section 6) iterates a config-driven batch.

These compositions are instances of the coordination grammar from Section 11 of the [multi-agent coordination](./multi-agent-coordination.md) specification:

$$c ::= A|_R \quad|\quad c_1 \parallel c_2 \quad|\quad c_1 ;_h c_2$$

Every observed pattern is a term in this grammar.
The general coordination correctness theorem (Theorem 11.2) guarantees that any well-formed composition of these patterns satisfies safety, liveness, equivalence, and provenance completeness, provided the three conditions hold: disjoint regions at every $\parallel$ node, satisfiable handoff predicates at every $;_h$ node, and admissible operators at every leaf.

---

## 10. Open Directions

Three extensions would strengthen the connection between observed patterns and the formal theory:

1. **Pattern detection.** A tool that reads a session's audit trail (Definition 10.1 of the work-unit lifecycle specification) and identifies which coordination patterns were used.
  This would allow post-hoc validation: did the session satisfy the correctness conditions?
  Were any anti-patterns present?

2. **Pattern templates.** Reusable coordination templates that encode common patterns (e.g., "fan-out over discipline directories with shared config") as parameterized coordination terms.
  An agent could select and instantiate a template rather than composing from scratch.

3. **Convergence metrics.** Formal convergence criteria for the incremental expansion and read-audit-fix patterns.
  The current treatment guarantees convergence by finiteness of the vault, but does not bound the number of iterations.
  A bound would require analyzing the structure of the [closure operator](../../../../mathematics/concepts/closure-operator/index.md) (e.g., the maximum chain length in the [Heyting algebra](../../../../mathematics/concepts/heyting-algebra/index.md) restricted to the config's domain).
