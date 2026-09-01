---
name: PLANS
---

WorkItems for the `spec/` department. Each entry is a [WorkItem](work-item.md).
Read and worked by `spec/skills/improve-specs.md`.

**Current state:** Core specs complete, skill frontmatter complete, context-file Unit types specced. Open: §-reference migration, history spec, entry-point naming decision (blocked on user).

---

## Open

### deleted-specs-audit

**Added:** 2026-03-17
**Status:** open
**Action:** The following spec files were deleted and may have gaps: `build-pipeline.md`, `fml-evaluation-model.md`, `frontmatter-schema.md` (possibly replaced by `frontmatter.md`), `knowledge-graph-schema.md`, `service-api.md`. For each: confirm it was intentionally replaced (and document the replacement) or re-write it.
**Why:** These were substantive specs. Silent deletion leaves the areas they covered unspecified.

---

### runbook-executor-spec

**Added:** 2026-03-16
**Status:** open
**Action:** Write `spec/runbook-executor.md` specifying the engine component that
loads a `Runbook` Unit and executes its steps — step type dispatch, template
evaluation, `llm-call` → PydanticAI, `write` → Unit store, `call` → sub-runbook.
**Why:** The runbook spec defines the format; the executor spec defines what the
engine must implement to run it. Without this, YAML runbooks are cold storage only.
**Precedence:** Do this before implementing the executor in src/.

---

### texture-c4-components

**Added:** 2026-03-16
**Status:** open
**Action:** Run `spec/skills/texture-specs.md` iterating until all four C4 containers
(Frontier, State Store, Normalization Kernel, Observation Layer) have Component-level
detail in relational-machine-c4-diagram.md -- i.e., each container specced into
sub-components with technology labels, Rel() arrows, and must-NOT constraints.
**Why:** src/ cannot implement components it cannot specify. The current C4 diagram is
Container level only. Component-level detail is the spec that drives src/PLANS.md items
normalization-kernel-graph, frontier-fastapi, and observation-layer-api. This is the
leading-edge work -- the diagram is the aspirational spec; texturing it IS the work.
**Precedence:** Do this before any spec work that is lower priority.

---

### link-migration

**Added:** 2026-03-16
**Status:** open
**Action:** Replace every `§anchor-id` reference in all `spec/*.md` and `spec/skills/*.md` files with `[anchor-id](relative/path/to/file.md)`. Math targets use `../math/id.md`; same-directory spec targets use `id.md`. ~80 references across ~20 files.
**Why:** `§id` is non-standard and non-clickable. Convention is now markdown links (root CLAUDE.md, root SOUL.md `links-not-sigils`).

---

### history-spec

**Added:** 2026-03-16
**Status:** open
**Action:** Run `spec/skills/improve-spec.md` with X = `history` to write a spec for the history category ($T$): what an implementation must satisfy to represent histories, the prefix order, and the free monoid structure.
**Why:** `history` is the most-cited unspecced math unit (~129 citations). Next step toward a complete src/ interface specification.

---

### entry-point-naming-exception

**Added:** 2026-03-16
**Status:** open
**Why blocked:** Requires user decision — rename vs. add exception to `spec/name.md`. Surfaced 2026-03-16.
**Action:** Either rename all `improve-*` and `familiarize` skills to output-named equivalents and update all AGENTS.md command references, OR add a formal exception to `spec/name.md` for department entry-point procedures.
**Why:** `spec/name.md` rejects `improve-` prefix. All six `improve-*` skills and `familiarize` violate this. The command convention (`/improve-math`, etc.) is deeply embedded; renaming requires user decision.

---

## Deferred

### skill-object-types-spec

**Added:** 2026-03-16
**Status:** deferred
**Why blocked:** Blocked by skill-algebra construction in math/ (see `spec/skillful-work.md` Pending).
**Action:** Write `spec/skill-object-types.md` defining the typed objects that appear in skill `domain:` and `codomain:` declarations.

---

### skill-morphism-composition-spec

**Added:** 2026-03-16
**Status:** deferred
**Why blocked:** Blocked by `skill-object-types-spec`. Cannot specify composition until types are defined.
**Action:** Write `spec/skill-morphism-composition.md` defining how skills compose via matching codomain/domain.
