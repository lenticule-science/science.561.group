---
title: "Skill registry"
description: "How the agential layer queries the skill manifest. Candidate scoring by trigger match, capability fit, supersession recency, and tier admissibility. The agent-facing surface above stdlib's `build-skill-manifest`."
kind: spec
status: normative
version: "0.8"
---


The agential layer queries the skill manifest aggregated by [`stdlib/skill-manifest.md`](../stdlib/skill-manifest.md) §4 to discover, score, and select skills for office work.
This spec is the agent-facing consumption surface: the contract between a session that needs to "do a thing" and the substrate cells that describe which skill can do it.

The substrate-side aggregation lifecycle is normative in `stdlib/skill-manifest.md`.
This spec describes how the agential layer (sessions, dispatch, persona-agents) reads the resulting cells.

Per [decisions/skills-have-manifest-contracts.md](../../decisions/skills-have-manifest-contracts.md).
The captain's source idea is [`skill-manifest-implementation.md`](../../../../engineering/triage/operations/command/ideas/triage/skill-manifest-implementation.md).

## 1. The registry as a fiber projection

The registry is not a separate service — it is the substrate fiber projected at `(skill:*, *, *)`.
The agential layer queries this fiber through the standard `project` / `filter` stdlib verbs ([stdlib/project.md](../stdlib/project.md), [stdlib/filter.md](../stdlib/filter.md)) and through the higher-level `select-skill-for-task` surface defined here.

A registry "lookup" is a normal substrate query; replay reproduces the same lookups byte-identically; federation propagates skill records the same way as any other cell.

## 2. `select-skill-for-task` contract

```
select-skill-for-task(task: TaskCell,
                      session: SessionCell,
                      max-candidates: optional[integer] = 5,
                      include-advisory: optional[boolean] = False) → CandidateList
```

Returns a ranked list of candidate skills.
Each candidate carries:

- `skill-name`: the skill slug.
- `manifest-version`: the SHA-256 pinning the candidate to a specific manifest revision.
- `score`: the composite scoring result (§3).
- `score-breakdown`: per-axis scores so the dispatcher can explain selection.
- `executable`: True if `runtime` is non-null and the adapter is registered; False for advisory skills (only included when `include-advisory: True`).

The candidate list is **deterministic for a given substrate state and session attribution**: same inputs → same ranked list, on replay or on a peer node holding the same substrate cells.
Tie-breaking is lexicographic on `skill-name` to make the determinism honest.

## 3. Candidate scoring

A candidate's score is the sum of four axes, each bounded to `[0, 100]`:

| Axis | What it measures |
|---|---|
| `trigger-match` | How well the task's natural-language description (or its declared intent slugs) matches the skill's `trigger` cells. |
| `capability-fit` | How well the session's authority fiber satisfies the skill's `requires-capabilities` and the skill's `enables-capabilities` are admissible under the session's office. |
| `supersession-recency` | Skills whose `supersedes` chain points at the most recent revision score higher than their predecessors; retired skills score 0. |
| `tier-admissibility` | The skill's runtime tier (per [process/computation-tiers.md](../process/computation-tiers.md)) is admissible under the session's office's `permits-tier` / `denies-tier` cells. Inadmissible candidates score 0 on this axis (and are excluded from the candidate list unless explicitly requested). |

Axis weights are themselves substrate cells under `(boot, skill-registry-axis-weight, <axis>) = <weight>`; the captain can re-tune scoring without code changes.
Defaults:

- `trigger-match`: 40
- `capability-fit`: 30
- `supersession-recency`: 10
- `tier-admissibility`: 20 (binary in default profile; non-zero only when admissible)

The composite score is `sum(axis-score * axis-weight) / 100`.
The result is bounded to `[0, 100]` and is comparable across candidates.

## 4. Capability composition at fire time

When the dispatcher chooses a candidate and invokes it, the substrate composes the candidate's `enables-capabilities` with the session's authority fiber via $\Rightarrow$ per [security/capability-model.md](../security/capability-model.md).
The fired skill's effective authority is `session-authz ⊙ skill-enables-capabilities`, bounded by the session's office.

Skills MAY NOT amplify session authority beyond the office's bounds; the substrate's $\Rightarrow$ algebra enforces this structurally.
A skill declaring an `enables-capabilities` entry the session's office does not hold surfaces the standard substrate-wide `PCA_SCOPE_INSUFFICIENT` at fire time per [security/capability-model.md](../security/capability-model.md) §8 — the same code raised by every other capability-bounded surface (driver invocations, MCP tool calls, inter-session messaging).
Registry queries are read-only and do not check fire-time capability; that is the dispatcher's responsibility.

## 5. Manifest-version pinning

Every candidate carries the `manifest-version` SHA-256 of the manifest at query time.
The dispatcher MAY pin an invocation to a specific manifest version:

```
respond(target=skill:<name>, payload={
  manifest-version: "<sha256>",
  inputs: {...}
}, sender=session:<dispatcher-id>)
```

If the substrate's current `skill:<name>` `manifest-version` differs from the pinned value, the substrate surfaces `PCS_SKILL_MANIFEST_VERSION_MISMATCH`.
The dispatcher chooses how to proceed: re-query the registry, retry against the new version, or surface the mismatch to the operator.

This is what lets the v0.9 continuous-learning pipeline ([milestones/v0.9-continuous-learning.md](../../milestones/v0.9-continuous-learning.md)) replay historical dispatch decisions against the manifest revision they were made under, even after the captain has revised the skill.

## 6. Per-agent scopes (deferred)

The source idea's "Future work" calls for per-agent manifest fragments — e.g., `cassia-lorne` sees a different filtered registry than `office:engineering`.
The mechanism is straightforward (an additional projection-axis on the manifest, gated by the session's `acting-as` per [security/persona-and-personnel.md](../security/persona-and-personnel.md) §4) but ships in a later release, not v0.8.
The current v0.8 surface treats every session's registry view as the global aggregate, capability-bounded at fire time only.

A v0.8-shipped substitute is **office-level filtering**: the registry's `select-skill-for-task` surface accepts an optional `office: office:<slug>` argument that filters candidates to those whose `enables-capabilities` are admissible under that office.
This covers the recurring case (the captain's offices each prefer a curated set) without requiring the per-agent projection-axis machinery.

## 7. Errors

The registry surface reuses the [stdlib/skill-manifest.md](../stdlib/skill-manifest.md) §7 taxonomy.
Specifically:

| Layer | Code | Meaning |
|---|---|---|
| Dispatch | `PCS_SKILL_NOT_FOUND` | The named skill is absent from the aggregate. |
| Dispatch | `PCS_SKILL_RETIRED` | The named skill exists but `retired-at-ord` is non-null. |
| Dispatch | `PCS_SKILL_MANIFEST_VERSION_MISMATCH` | The pinned `manifest-version` does not match the substrate's current cell. |
| Dispatch | `PCS_SKILL_NO_CANDIDATE_ADMISSIBLE` | Every candidate scored 0 on `tier-admissibility` or failed `capability-fit`; no skill can fire. |
| Fire-time | `PCA_SCOPE_INSUFFICIENT` | Standard substrate capability error per [security/capability-model.md](../security/capability-model.md) §8. The chosen candidate fires but the session lacks a `requires-capabilities` entry, or the candidate's `enables-capabilities` would amplify session authority beyond the office's bounds. The registry intentionally does not define a skill-specific fire-time capability code; the substrate-wide code is the single fire-time capability surface, consistent with [drivers/mcp-driver.md](../drivers/mcp-driver.md) §4 and [process/inter-session-messaging.md](../process/inter-session-messaging.md) §9. |

Lint/aggregation-time codes (`PCS_SKILL_MANIFEST_INVALID`, `PCS_SKILL_DUPLICATE_NAME`, `PCS_SKILL_RUNTIME_UNREGISTERED`, `PCS_SKILL_CAPABILITY_UNDECLARED`, `PCS_SKILL_SOURCE_ROOT_MISSING`) are never raised by the registry surface — they fire upstream during `build-skill-manifest` or `lint-skills` per [stdlib/skill-manifest.md](../stdlib/skill-manifest.md) §§4–5.

## 8. Implementation

### Python (v0.8+)

- `select-skill-for-task` as a function in `pc_agential.skill_registry`; backed by standard `project` / `filter` stdlib calls against the §1 fiber.
- Axis-scorers as pure functions per axis; the trigger-match axis uses the office's natural-language matcher (per [agential/_index.md](_index.md) Tier-2 surface) when available, falling back to substring-and-slug match.
- Supersession recency walks the `supersedes` chain; retired skills are filtered out by the standard σ-pass on `retired-at-ord`.

### Rust (v0.8+)

- Same surface as a `SkillRegistry` trait with default backing by the substrate's projection layer.
- Axis-scorers as Rust modules; the runtime registry maps axis-slugs to scorer implementations so the captain can plug in custom axes.

## 9. Conformance

The skill registry passes:

1. **Deterministic ranking.** `select-skill-for-task` against a fixed substrate state and session returns the same ranked candidate list across replays and across Python/Rust runtimes.
2. **Capability composition.** A skill declaring `enables-capabilities` beyond the session's office bounds surfaces the standard substrate-wide `PCA_SCOPE_INSUFFICIENT` at fire time per [security/capability-model.md](../security/capability-model.md) §8; registry-query time returns the candidate without an authority check.
3. **Supersession.** A superseded skill's score on the recency axis is strictly lower than its successor's; retired skills are excluded.
4. **Manifest-version pinning.** Invocation pinned to a stale `manifest-version` surfaces `PCS_SKILL_MANIFEST_VERSION_MISMATCH`; the dispatcher's retry-against-current produces the new version's behaviour.
5. **Tier admissibility.** A skill whose `runtime` is `tier-2-model` is excluded for an office whose `denies-tier: tier-2` cell is asserted; admissibility flips when the cell is retracted.
6. **Office filtering.** `select-skill-for-task(..., office: office:<slug>)` returns a strict subset of the unfiltered candidate list, ranked by the same axes.

## 10. Plan 9 / Unix analogue

| Unix concept | Skill-registry analogue |
|---|---|
| `$PATH` resolution to a binary | `select-skill-for-task` resolves a task to a candidate skill |
| `which` / `command -v` | A `select-skill-for-task` with `max-candidates: 1` |
| `apropos` keyword search | The `trigger-match` axis |
| `update-alternatives` | Supersession-recency scoring |
| `chmod +x` / `setcap` | `requires-capabilities` admissibility check at fire time |
| `nice` / `ionice` priority | Axis-weight tuning via `(boot, skill-registry-axis-weight, *)` cells |
