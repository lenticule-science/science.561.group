---
name: build-toy-trace-universe
id: build-toy-trace-universe
description: Construct a trace site and recognition fibers for a target domain. Use
  when you need to formalize locality and recognition structure.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-26
tags: []
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/generative-fibered-recognition-trace-universe
region:
  reads: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
  writes: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
title: build-toy-trace-universe
---
- Define the trace site $T$: objects as traces, [morphisms](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) as refinements.
- Choose a Grothendieck topology that marks which refinements cover each trace.
- For each trace, define a finite [Heyting algebra](../../../../../../../../../../concepts/heyting-algebra/index.md) $H_t$.
- Define stabilizer $\sigma_t$ and drift $\Delta_t$ for each fiber.
- Define reindexing maps along trace [morphisms](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md).
- Record the constructed data in an example file or working notes.


---

<!-- source: archive/domains/universes/generative-fibered-recognition-trace-universe/domains/learn-about-gfrtu/SKILL.md -->

## Imported source: archive/domains/universes/generative-fibered-recognition-trace-universe/domains/learn-about-gfrtu/SKILL.md

---
name: learn-about-gfrtu
id: learn-about-gfrtu
description: Learn the GFRTU object through its short explainers and identify which
  processes apply to a task. Use when you need to apply GFRTU concepts without reading
  the full paper.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-26
tags: []
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/generative-fibered-recognition-trace-universe
region:
  reads: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
  writes: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
---
- Read `curricula/overview.md` to identify GFRTU entry conditions and misuse warnings.
- Read `curricula/trace-site.md` and `curricula/stabilization-drift.md` to understand the required primitives.
- Read `curricula/closure-ug.md` for the minimality requirement.
- Read `curricula/processes.md` for the whole-object workflow.
- State whether the task satisfies the entry conditions. If not, stop and recommend a different object.
- If it does, state the required primitives, the [closure operator](../../../../../../../../../../concepts/closure-operator/index.md), and the expected [fixed point](../../../../../../../../../../concepts/fixed-point/index.md) you will use.


---

<!-- source: archive/domains/universes/generative-fibered-recognition-trace-universe/domains/validate-trace-universe-axioms/SKILL.md -->

## Imported source: archive/domains/universes/generative-fibered-recognition-trace-universe/domains/validate-trace-universe-axioms/SKILL.md

---
name: validate-trace-universe-axioms
id: validate-trace-universe-axioms
description: Validate the toy GFRTU against its axioms and fixed fibers. Use when
  checking consistency of a trace universe model.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-26
tags: []
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/generative-fibered-recognition-trace-universe
region:
  reads: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
  writes: ["content/mathematics/objects/universes/generative-fibered-recognition-trace-universe/"]
---
- Confirm the trace category is small and finite.
- Confirm each fiber is a [Heyting algebra](../../../../../../../../../../concepts/heyting-algebra/index.md).
- Confirm stabilizer and drift are monotone and commute.
- Confirm fixed fibers match the toy model.
- Confirm the closure sequence matches the golden output.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/close-semioverse-gap/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/close-semioverse-gap/SKILL.md

---
name: close-semioverse-gap
id: close-semioverse-gap
description: Identify a documentation or skill gap using interactive semioverse concepts
  and close it with targeted artifacts. Use when bridging missing links in the library.
type: operational
authors:
- gpt-5.2-codex
- claude-opus-4-6
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - survey-markdown-vault
  - map-markdown-vault-to-handles
tags:
  - Semiotics
  - InteractiveSemioverse
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Close Semioverse Gap

A gap in the semioverse is a reference that does not resolve -- a [handle](../../../../../../../terms/handle.md) that
points to nothing, a link to a page that does not exist, a skill dependency that
cannot be satisfied. Gaps are visible as broken [interaction surfaces](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md).

## Identifying gaps

1. Run `/audit-vault-references` to find broken wikilinks and markdown links.
2. Run `/audit-content-folders` to find directories missing `index.md`.
3. Check skill dependencies: read SKILL.md files and verify their `dependencies:`
   paths exist.

## Closing a gap

For each gap, determine the minimal artifact needed to resolve it:

- **Missing page referenced by wikilink**: create the page with `/write-new-note`
  or `/make-content-folder` (if it is a directory).
- **Missing term or concept**: create a stub in the appropriate `terms/` or
  `concepts/` directory with at minimum a title, date-created, and one-sentence
  definition.
- **Missing person page**: create in `encyclopedia/people/` with full name as title.
- **Missing skill dependency**: either create the missing skill or update the
  dependency to point to the correct existing skill.
- **Broken relative path**: fix the link target rather than creating a new page.

The principle is minimality: create the smallest artifact that resolves the gap.
Do not generate large speculative documents to fill gaps — a stub with correct
frontmatter and one sentence is better than a long page of uncertain content.

## Recording the closure

After closing gaps, the audit script should show fewer broken references. Run
it again to verify. If the gap was in a skill's dependency list, verify the
skill can now be invoked without errors.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/derive-interaction-terms-from-markdown/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/derive-interaction-terms-from-markdown/SKILL.md

---
name: derive-interaction-terms-from-markdown
id: derive-interaction-terms-from-markdown
description: Derive interaction terms from markdown structure and links. Use when
  building interaction surfaces for markdown-based handles.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: []
dependencies:
  - interpret-markdown-as-handles
tags:
  - Semiotics
  - InteractiveSemioverse
  - Markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Derive Interaction Terms From Markdown

- Treat headings as [interaction term](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-term.md) constructors with their subsection content.
- Convert links into terms that reference other [handles](../../../../../../../terms/handle.md) by target path.
- Map inline math and definitions into semantic generator terms.
- Keep the [interaction surface](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md) finite by selecting the most salient terms.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/interpret-markdown-as-handles/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/interpret-markdown-as-handles/SKILL.md

---
name: interpret-markdown-as-handles
id: interpret-markdown-as-handles
description: Map a markdown document into handles and semantic seeds. Use
  when treating a markdown file as a source of interactive semioverse data.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: []
dependencies:
  - map-markdown-vault-to-handles
tags:
  - Semiotics
  - InteractiveSemioverse
  - Markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Interpret Markdown as Handles

- Choose the markdown unit to treat as a [handle](../../../../../../../terms/handle.md) (document, section, or heading).
- Assign each handle a stable identifier and a seed element in the semantic domain.
- Record how frontmatter fields map into semantic seeds (title, tags, dependencies).
- Note which fields are treated as [interaction surfaces](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md) versus static metadata.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/learn-about-interactive-semioverse/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/learn-about-interactive-semioverse/SKILL.md

---
name: learn-about-interactive-semioverse
id: learn-about-interactive-semioverse
description: Learn the components of the interactive semioverse and how it extends
  the semiotic universe. Use when you need a structured summary of the object.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/mathematics/objects/universes/interactive-semioverse/"]
  writes: []
dependencies: []
tags:
  - Semiotics
  - MathematicalUniverse
  - InteractiveSemioverse
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Learn About the Interactive Semioverse

- Read the [Interactive semioverse curriculum](/mathematics/objects/universes/interactive-semioverse/curricula/index.md).
- Use the [Interactive semioverse glossary](/mathematics/objects/universes/interactive-semioverse/terms/index.md) for term definitions.
- Refer to the [Interactive semioverse document](../../../../../../../interactive-semioverse.md) for formal statements.
- Summarize how handles, [interaction terms](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-term.md), and [footprints](../../../../../../../terms/footprint.md) extend the core [semiotic](../../../../../../../../../../../linguistics/topics/semiotics/index.md) universe.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/map-markdown-vault-to-handles/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/map-markdown-vault-to-handles/SKILL.md

---
name: map-markdown-vault-to-handles
id: map-markdown-vault-to-handles
description: Map a markdown vault into handles, interaction surfaces, and
  footprints. Use when building an interactive semioverse representation of a vault.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: []
dependencies:
  - survey-markdown-vault
  - learn-about-interactive-semioverse
tags:
  - Semiotics
  - InteractiveSemioverse
  - Markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Map a Markdown Vault to Handles

- Assign stable [handles](../../../../../../../terms/handle.md) to each chosen unit (file, section, or heading).
- Build [interaction surfaces](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md) for each handle from headings, links, and definitions.
- Generate handle fragments and compute [footprints](../../../../../../../terms/footprint.md) for each handle.
- Store the mapping and [footprint](../../../../../../../terms/footprint.md) summaries in a vault index document.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/outline-interactive-semioverse-data/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/outline-interactive-semioverse-data/SKILL.md

---
name: outline-interactive-semioverse-data
id: outline-interactive-semioverse-data
description: Outline the data of an interactive semioverse, including handles and
  interaction surfaces. Use when modeling a candidate interactive semioverse.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/mathematics/objects/universes/interactive-semioverse/"]
  writes: []
dependencies:
  - learn-about-interactive-semioverse
tags:
  - Semiotics
  - MathematicalUniverse
  - InteractiveSemioverse
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Outline Interactive Semioverse Data

- Specify the semantic domain `H` and its operators `j` and `G`.
- List the definable operators and interpretation constraints.
- Define the set of [handles](../../../../../../../terms/handle.md) and their semantic seeds.
- Describe [interaction terms](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-term.md) and [interaction surfaces](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md).
- Show how handle fragments and [footprints](../../../../../../../terms/footprint.md) are generated.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/record-markdown-handle-footprint/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/record-markdown-handle-footprint/SKILL.md

---
name: record-markdown-handle-footprint
id: record-markdown-handle-footprint
description: Record the fragment and footprint for a markdown handle. Use when
  capturing the semantic impact of a markdown file in the interactive semioverse.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - derive-interaction-terms-from-markdown
tags:
  - Semiotics
  - InteractiveSemioverse
  - Markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Record Markdown Handle Footprint

- Build the [interaction surface](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md) for the markdown handle.
- Generate the handle fragment as the least fragment containing those terms.
- Apply the [closure operator](../../../../../../../../../../concepts/closure-operator/index.md) to compute the [footprint](../../../../../../../terms/footprint.md).
- Record the [footprint](../../../../../../../terms/footprint.md) summary and any delta against prior versions.


---

<!-- source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/survey-markdown-vault/SKILL.md -->

## Imported source: archive/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/survey-markdown-vault/SKILL.md

---
name: survey-markdown-vault
id: survey-markdown-vault
description: Survey a markdown vault to identify handles, interaction surfaces,
  and link structure. Use when preparing a vault for interactive semioverse modeling.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
region:
  reads: ["content/"]
  writes: []
dependencies: []
tags:
  - Semiotics
  - InteractiveSemioverse
  - Markdown
runtime:
  invocation: inference
  tool: llm
part-of: mathematics/objects/universes/interactive-semioverse
---

# Survey a Markdown Vault

- List all markdown files and decide the granularity of [handles](../../../../../../../terms/handle.md).
- Record the frontmatter fields that will seed [handles](../../../../../../../terms/handle.md).
- Identify link density and repeated terms for candidate [interaction surfaces](../../../../../../../../services/interactive-semioverse-services-section/content/text/glossary/terms/interaction-surface.md).
- Note any missing frontmatter or inconsistent ids for follow-up.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/assess-pedagogical-soundness/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/assess-pedagogical-soundness/SKILL.md

---
description: Assess any educational content for banking model reproduction, concrete grounding, scope honesty, and pedagogical validity
id: assess-pedagogical-soundness
name: assess-pedagogical-soundness
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "assess pedagogical soundness"
  - "check for banking model"
  - "pedagogical review"
inputs:
  path: string
  recursive: boolean?
outputs:
  report: object
  banking_model_indicators: number
  soundness_score: string
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Assess pedagogical soundness of: $ARGUMENTS

## What this does

Evaluates educational content against the educational ASR's validity principle: pedagogical soundness. Content is valid when it teaches rather than deposits. This skill operationalizes that principle into checkable criteria.

If `recursive` is true (or the path is a directory), assess all `.md` files under the path and produce a summary report.

## Banking model indicators

Check for each of these structural indicators. Each present indicator is a warning; three or more together constitute a Fail.

1. **Definitions without preceding examples**: The content introduces formal definitions, classifications, or abstract concepts before grounding them in concrete experience. Check whether each major concept is preceded by an example, scenario, or intuitive explanation.

2. **No worked examples**: The content presents information but never walks through applying it to a specific case. A page that explains what something IS without showing what it looks like in practice is a reference document depositing information.

3. **No exercises or engagement points**: The reader is expected to receive without doing. No self-check questions, no prompts to apply concepts, no opportunities for the learner to construct understanding.

4. **Vague prerequisites**: Prerequisites stated as "familiarity with X" or "background in Y" rather than specific, testable capabilities ("the definition of X and the ability to do Y").

5. **No scope statement**: The content presents itself as complete, universal, and neutral — no acknowledgment of what it excludes, whose knowledge it centers, or what tradition it comes from.

6. **No source attribution**: Ideas appear without intellectual lineage. No `[@citekey]` references, no named thinkers, no tradition identified. Knowledge presented as authorless is knowledge whose politics are hidden.

7. **Passive voice dominance**: The content consistently uses passive constructions that obscure agency — "it is understood that" rather than "Freire argues that." Passive voice in educational content often indicates the banking model's assumption that knowledge exists independently of knowers.

## Pedagogical soundness criteria

Beyond the banking model check, assess:

- **Medium awareness**: Does the content acknowledge what it cannot transmit? Educational content about embodied practices, oral traditions, or relational knowledge should name the gap between description and practice.
- **Tradition naming**: Does the content identify its intellectual tradition? Content from critical pedagogy should say so; content drawing on Indigenous thought should name the specific nation or thinker.
- **Relational honesty**: Does the content acknowledge the relationship between writer and reader? Or does it adopt a view from nowhere?

## Output format

```
## Banking Model Assessment

| Indicator | Status | Evidence |
|---|---|---|
| Definitions before examples | Pass/Fail | [specific evidence] |
| No worked examples | Pass/Fail | [specific evidence] |
| ... | ... | ... |

Banking model indicators present: X/7

## Pedagogical Soundness

| Criterion | Status | Evidence |
|---|---|---|
| Medium awareness | Pass/Partial/Fail | [specific evidence] |
| ... | ... | ... |

## Overall Assessment

[Soundness rating: Sound / Partially Sound / Unsound]
[Summary of what the content does well and what needs work]
[Specific recommendations, ordered by priority]
```


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/audit-educational-links/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/audit-educational-links/SKILL.md

---
description: Audit cross-references between education content and other domains, identifying missing bidirectional links
id: audit-educational-links
name: audit-educational-links
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "audit educational links"
  - "check cross-references"
  - "audit education cross-links"
inputs:
  scope: string?
outputs:
  missing_links: number
  recommendations: object
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Audit educational cross-references: $ARGUMENTS

## What this does

Checks that cross-references between education content and other domains (sociology, philosophy, linguistics, mathematics, general) are bidirectional and complete. The vault's design philosophy treats emergent connections between domains as primary — but connections that exist in only one direction are invisible from the other side.

## Instructions

1. Determine scope. If a specific path is given, audit that subtree. Otherwise, audit all of `content/education/`.

2. For each `.md` file in scope, extract all links to files outside `content/education/`:

```bash
grep -roh '$$.*$$(.*\.md)' content/education/ | grep -v 'content/education/' | sort -u
```

3. For each outbound link, check whether the target file links back to the source (or to any file in `content/education/`).

4. For each file in scope, check whether files in other domains link TO it:

```bash
grep -rl 'education/' content/sociology/ content/philosophy/ content/linguistics/ content/mathematics/ content/general/ 2>/dev/null
```

5. Classify each finding:

### Link categories

- **Bidirectional**: A links to B and B links to A (or to A's parent/sibling). Good.
- **Outbound only**: Education references another domain but that domain does not reference education back. The connection is invisible from the other side.
- **Inbound only**: Another domain references education but education does not reference it back. Education content misses a relevant connection.
- **Missing**: A conceptual relationship exists (same person, same concept, same tradition referenced in both domains) but no explicit link connects them.

### Priority assessment

For each missing or one-directional link, assess priority:

- **High**: The connection is central to understanding both pages (e.g., a pedagogy school page that discusses a sociological concept without linking to the sociology term page).
- **Medium**: The connection would be useful but is not essential (e.g., a general person page that could link to the education context where they appear).
- **Low**: The connection exists conceptually but a link would add clutter without clarity.

## Output format

```
## Cross-Reference Audit: [scope]

### Summary
- Files scanned: X
- Outbound links checked: X
- Bidirectional: X
- Outbound only: X
- Inbound only: X

### Missing or one-directional links (High priority)

| Source | Target | Direction | Recommendation |
|---|---|---|---|
| [source path] | [target path] | outbound only | Add link from target to source |

### Missing or one-directional links (Medium priority)
[same format]

### Missing or one-directional links (Low priority)
[same format]
```

Do not make edits. Report only. The vault owner decides which links to add.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/design-learning-path/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/design-learning-path/SKILL.md

---
description: Design a multi-skill learning path through the vault for a specific learning goal
id: design-learning-path
name: design-learning-path
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "design a learning path"
  - "create a learning path"
  - "plan a course of study"
inputs:
  goal: string
  starting_level: string?
outputs:
  path_document: string
  skills_required: number
  gaps_identified: number
region:
  reads: ["content/"]
  writes: ["content/education/"]
dependencies:
  - find-thing
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Design a learning path for: $ARGUMENTS

## Instructions

1. Clarify the learning goal. What should the learner be able to DO after completing the path? Not "understand X" but "given Y, do Z." If the goal is vague, propose a specific, testable formulation and confirm with emsenn.

2. Identify existing learn skills relevant to the goal:

```bash
find content -path "*/skills/learn-*/SKILL.md" -type f | sort
```

3. Read each relevant skill's SKILL.md to understand:
   - What it teaches (completion criteria)
   - What it requires (prerequisite skills)
   - What lessons it points to
   - What it explicitly excludes

4. Map the dependency graph. Starting from the target skill(s), trace backward through prerequisites to find the full set of skills needed. Identify:
   - **Required skills**: must be completed to reach the goal
   - **Optional skills**: deepen understanding but are not strictly required
   - **Missing skills**: needed but do not exist yet (gaps)

5. For each missing skill, note:
   - What it would teach
   - What lessons would need to be written
   - Where it would live in the vault structure

6. Determine the learner's starting level. If `starting_level` is specified, identify which skills the learner already has. Otherwise, assume no prior skills.

7. Produce the learning path document:

### Learning path structure

```markdown
# Learning Path: [Goal]

## Goal
[Testable statement of what the learner can do after completing this path]

## Starting assumptions
[What the learner is assumed to already know/be able to do]

## Path

### Phase 1: [Foundation]
- **learn-X** — [what this provides toward the goal]
  - Lessons: [list]
  - Estimated scope: [brief]

### Phase 2: [Building]
- **learn-Y** (requires: learn-X) — [what this provides]
  - Lessons: [list]

[Continue phases as needed]

## Independent skills
[Skills that can be completed in any order, not dependent on each other]

## Gaps
[Skills or lessons that need to be created for this path to be complete]
- **learn-Z** (does not exist) — would teach [what], needed because [why]

## Scope
[What this learning path covers and what it does not]
[Whose knowledge it centers and what traditions it draws from]
```

### Rules

- Do not force linear order on independent skills. If skills A and B have no dependency, say they can be done in either order.
- Identify gaps explicitly. A learning path that pretends all its pieces exist when some do not is dishonest.
- State scope. Every learning path centers some knowledge and excludes other knowledge. Name what.
- The path is a dependency graph, not a numbered list. Present it as such.
- Each skill in the path should contribute something specific toward the goal. If a skill is included "for background" without a clear connection, justify its inclusion or remove it.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/evaluate-scope-honesty/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/evaluate-scope-honesty/SKILL.md

---
description: Evaluate whether educational content honestly states what it covers, excludes, and whose knowledge it centers
id: evaluate-scope-honesty
name: evaluate-scope-honesty
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "evaluate scope honesty"
  - "check scope"
  - "whose knowledge"
inputs:
  path: string
outputs:
  report: object
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Evaluate scope honesty of: $ARGUMENTS

## What this does

Checks whether educational content honestly declares its scope — what it covers, what it excludes, whose knowledge it centers, and what traditions it draws from. Scope honesty is a constitutive requirement of the educational ASR: content that presents itself as universal and complete when it is partial and situated is pedagogically unsound.

This skill applies the "whose knowledge?" question from decolonial pedagogy to the structural level of content design.

## Criteria

### 1. Explicit scope statement

- Does the content have a scope section or equivalent?
- Does it state what it covers?
- Does it state what it excludes?
- For exclusions: does it explain WHY (not just "out of scope" but a reason)?

**Pass**: scope stated with both inclusions and exclusions, with reasons.
**Partial**: scope stated but exclusions are vague or unexplained.
**Fail**: no scope statement, or scope presents content as complete.

### 2. Tradition identification

- Does the content name its intellectual tradition?
- If drawing on multiple traditions, are they named?
- If the content is grounded in a Western tradition, does it say so (rather than presenting Western knowledge as universal)?

**Pass**: tradition(s) named explicitly.
**Partial**: some traditions named but the dominant framework is unmarked.
**Fail**: no tradition identified; content presents its perspective as THE perspective.

### 3. Centering acknowledgment

- Whose knowledge does this content center? (Whose thinkers, whose texts, whose questions?)
- Is this centering acknowledged?
- Are alternatives or absences noted?

**Pass**: centering acknowledged; absences noted with reasons.
**Partial**: some acknowledgment but gaps not addressed.
**Fail**: no acknowledgment; content assumes its centering is natural.

### 4. Medium limitations

- Does the content acknowledge what it cannot transmit through its medium (text, in this vault)?
- For content about embodied, oral, relational, or ceremonial knowledge: does it name the gap between description and practice?

**Pass**: medium limitations acknowledged where relevant.
**Partial**: some acknowledgment but incomplete.
**Fail**: content about inherently non-textual knowledge with no medium acknowledgment.
**N/A**: content is about textual/propositional knowledge where medium limitations are minimal.

### 5. Gap honesty

- Does the content identify what is missing from its own treatment?
- Are there known gaps (missing lessons, unrepresented traditions, unwritten term pages) that are named?

**Pass**: gaps identified explicitly.
**Partial**: some gaps noted but significant omissions unacknowledged.
**Fail**: content presents itself as complete when it is not.

## Output format

```
## Scope Honesty Assessment: [path]

| Criterion | Status | Evidence |
|---|---|---|
| Explicit scope statement | Pass/Partial/Fail | [evidence] |
| Tradition identification | Pass/Partial/Fail | [evidence] |
| Centering acknowledgment | Pass/Partial/Fail | [evidence] |
| Medium limitations | Pass/Partial/Fail/N/A | [evidence] |
| Gap honesty | Pass/Partial/Fail | [evidence] |

## Summary
[What the content does well and what needs work]

## Recommendations
[Specific, actionable improvements ordered by priority]
```


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/review-curriculum/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/review-curriculum/SKILL.md

---
description: Review a curriculum sequence against pedagogical criteria — dependency structure, scope honesty, lesson quality, and banking model indicators
id: review-curriculum
name: review-curriculum
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "review curriculum"
  - "check curriculum"
  - "audit curriculum"
inputs:
  path: string
outputs:
  report: object
region:
  reads: ["content/"]
  writes: []
dependencies:
  - review-lesson
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Review the curriculum at: $ARGUMENTS

## Instructions

1. Read the curriculum index page at the specified path.
2. Read every lesson linked from the curriculum.
3. Read the prerequisite chain: for each lesson, read its prerequisites recursively until you reach lessons with no prerequisites.
4. Read the style guide at `content/writing/texts/style-guide.md`.

## Curriculum-level criteria

### Dependency structure

- **Explicit prerequisites**: Does each lesson state its prerequisites? Are the prerequisites specific about what is needed?
- **Valid ordering**: Can the lessons be completed in the stated order? Are there hidden dependencies (lesson B uses a concept only introduced in lesson C, but B comes before C)?
- **No false linearity**: Are independent lessons forced into a sequence? If lessons A and B have no dependency between them, does the curriculum present them as if B requires A?
- **Shared dependencies**: Are shared prerequisites identified? If lessons B and C both require lesson A, is this visible in the structure?
- **Completeness**: Does the dependency graph have gaps — concepts used in later lessons that are never introduced?

### Scope

- **Stated explicitly**: Does the curriculum say what it covers and what it excludes?
- **Honest about exclusions**: Does it explain WHY things are excluded (not just "this is out of scope" but whose knowledge is centered and whose is not)?
- **No false universality**: Does the curriculum present its perspective as THE perspective, or does it name its tradition?

### Individual lesson quality

For each lesson, apply the `/review-lesson` criteria. Summarize findings per lesson rather than repeating the full review.

### Banking model indicators

Check the curriculum as a whole for these structural patterns:
- All information flows teacher → student with no exercises, worked examples, or opportunities for the learner to construct understanding
- Prerequisites are vague ("familiarity with X") rather than specific and testable
- No scope statement — the curriculum presents itself as complete and neutral
- No sources cited — ideas appear to come from nowhere
- No acknowledgment of whose knowledge is centered

### Coherence

- **Consistent voice**: Do the lessons use a consistent register and address the learner consistently?
- **Progressive complexity**: Does the curriculum build — each lesson adding capability that earlier lessons did not provide?
- **Cross-references**: Do later lessons reference earlier ones? Do earlier lessons point forward?

## Output format

For each criterion category, report:
- **Pass** / **Partial** / **Fail**
- Specific evidence (file paths, line numbers, quoted text)
- Suggestions for improvement (if Partial or Fail)

Summary section: what the curriculum does well and what needs the most work.

Do not rewrite the curriculum. Report only.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/review-skill/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/review-skill/SKILL.md

---
description: Review a learn-* skill against structural criteria — completion criteria, prerequisites, scope, and pedagogical soundness
id: review-skill
name: review-skill
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "review skill"
  - "check skill page"
  - "audit learn skill"
inputs:
  path: string
outputs:
  report: object
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Review the skill at: $ARGUMENTS

## Instructions

1. Read the skill file at the specified path.
2. Read all lessons and prerequisite skills it references.
3. Check against each criterion below.

## Structural criteria

### Completion criteria

- **Present**: Does the skill have a "What you will be able to do" section (or equivalent)?
- **Testable**: Are the criteria stated as concrete actions ("given Y, do Z") rather than vague understanding ("understand X", "be familiar with Y")?
- **Aligned with lessons**: Do the lessons actually teach what the completion criteria claim? Read the lessons and check.
- **Appropriately scoped**: Are the criteria achievable from the listed lessons, or do they require knowledge not covered?

### Prerequisites

- **Stated**: Does the skill list prerequisites (or explicitly say "none")?
- **Specific**: For each prerequisite, does it state what specifically is needed from it?
- **Exist**: Do the referenced prerequisite skills actually exist in the vault?
- **Sufficient**: Do the prerequisites provide everything the skill's lessons assume?

### Lessons

- **Linked**: Does the skill link to actual lesson pages that exist?
- **Complete**: Do the listed lessons cover the completion criteria? Are there gaps?
- **Ordered correctly**: If lessons are presented in sequence, does the dependency structure support that order?
- **Independence noted**: If lessons are independent of each other, does the skill say so?

### Scope

- **Present**: Does the skill have a scope section?
- **Honest**: Does it state what the skill does NOT cover?
- **Reasoned**: Does it explain why exclusions are excluded (not just "out of scope")?

### Verification

- **Present**: Does the skill include a verification section?
- **Concrete**: Is the verification task specific enough that a learner can actually do it?
- **Aligned**: Does the verification test the completion criteria?

## Dependency graph check

Trace the skill's place in the broader dependency graph:

```bash
grep -rl "learn-$(basename $(dirname $PATH))" content/ | grep SKILL.md
```

- What skills depend on this one?
- Is this skill a dead end (nothing depends on it) or a hub (many things depend on it)?
- If it is a dead end, is that intentional or a gap?

## Output format

For each criterion, report:
- **Pass** / **Partial** / **Fail**
- Specific evidence
- Suggestions for improvement

Summary: what the skill does well and what needs the most work.

Do not rewrite the skill. Report only.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/validate-educational-content/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/validate-educational-content/SKILL.md

---
id: validate-educational-content
description: Validate educational content frontmatter against educational ASR rules
name: validate-educational-content
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "validate educational content"
  - "check educational frontmatter"
inputs:
  path: string?
  type: string?
  errors-only: boolean?
outputs:
  passed: boolean
  total_scanned: number
  errors: number
  warnings: number
region:
  reads: ["content/education/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Validate educational content: $ARGUMENTS

## What this does

Checks educational content files against the rules defined in the [Educational ASR specification](../../../../../../../index.md). This is the educational domain's equivalent of the general `/validate-content` skill, specialized for education's content types and relations.

## Validation rules by type

### lesson

| Rule | Severity | Check |
|---|---|---|
| `teaches:` present | Warning | Frontmatter field exists with ≥1 entry |
| `requires:` present or "none" stated | Warning | Frontmatter field exists OR body contains explicit "no prerequisites" statement |
| Worked example section | Error | Body contains a heading matching "worked example" or "walkthrough" (case-insensitive) |
| Exercises section | Error | Body contains a heading matching "check your understanding", "exercises", or "self-check" |
| Motivation before definition | Warning | First major concept is preceded by a "why it matters" or motivation section |
| Sources cited | Warning | At least one `[@citekey]` reference in body |

### curriculum

| Rule | Severity | Check |
|---|---|---|
| Links to existing lessons | Error | All lesson links resolve to files that exist |
| Scope statement | Warning | Body contains a heading or section addressing scope |
| `teaches:` present | Warning | Frontmatter field exists |

### skill (kind: learn)

| Rule | Severity | Check |
|---|---|---|
| Completion criteria section | Error | Body contains "what you will be able to do" or equivalent |
| Criteria are testable | Warning | Criteria use action verbs ("given X, do Y") not understanding verbs ("understand", "be familiar with") |
| Prerequisites section | Error | Body contains prerequisites section |
| Prerequisite skills exist | Error | All referenced skill paths resolve |
| Scope section | Warning | Body contains scope section |
| Verification section | Warning | Body contains verification section |
| Lessons linked | Error | At least one lesson linked |
| Lessons exist | Error | All lesson links resolve |

### term

| Rule | Severity | Check |
|---|---|---|
| `defines:` present | Error | Frontmatter field exists with ≥1 entry |
| Related terms section | Warning | Body contains "related terms" heading |
| `cites:` present | Warning | Frontmatter field exists or `[@citekey]` in body |

### school

| Rule | Severity | Check |
|---|---|---|
| Core claims section | Error | Body contains claims, commitments, or "common threads" section |
| Key texts/thinkers | Warning | Body names at least one person with a work title |
| Relationship to other traditions | Warning | Section present with links to other school pages |
| Critiques and limitations | Error | Section present |

### transmission-mode

| Rule | Severity | Check |
|---|---|---|
| `defines:` present | Error | Frontmatter field exists |
| Preserves/transforms described | Warning | Body addresses what the mode preserves and what it changes |
| Politics addressed | Warning | Body addresses whose knowledge the mode serves |

## How to run

Scan a specific path or all educational content:

```
# All education content
/validate-educational-content content/education/

# Specific discipline
/validate-educational-content content/education/disciplines/pedagogy/

# Specific type only
/validate-educational-content content/education/ --type lesson

# Errors only
/validate-educational-content content/education/ --errors-only
```

## Interpreting results

- **ERROR**: A MUST rule is violated. The content is ill-formed per the educational ASR. Fix before proceeding.
- **WARN**: A SHOULD rule is not met. The content is valid but could be improved.
- **INFO**: Informational finding (e.g., a skill with no dependents).

## How it differs from assess-pedagogical-soundness

`/validate-educational-content` checks structural rules (does the frontmatter have the right fields? do links resolve? are required sections present?). `/assess-pedagogical-soundness` checks pedagogical quality (does the content actually teach? does it reproduce the banking model?). They are complementary:
- Use `/validate-educational-content` for fast structural checks across many files.
- Use `/assess-pedagogical-soundness` for deep qualitative review of individual pages.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/write-school-page/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/write-school-page/SKILL.md

---
description: Create a pedagogical school or tradition page with core claims, methods, key texts, critiques, and cross-tradition links
id: write-school-page
name: write-school-page
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "write a school page"
  - "create a school page"
  - "document a pedagogical tradition"
inputs:
  school: string
  discipline: string?
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/education/"]
dependencies:
  - make-content-folder
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Write a school page for: $ARGUMENTS

## Instructions

1. Read the style guide at `content/writing/texts/style-guide.md`.

2. Read at least two existing school pages to understand the established pattern:
   - `content/education/disciplines/pedagogy/schools/critical-pedagogy/index.md`
   - `content/education/disciplines/pedagogy/schools/indigenous-pedagogies/index.md`

3. Identify the school's intellectual context. Check what already exists:

```bash
find content/education/disciplines/pedagogy/schools -name "index.md" | sort
```

4. Read relevant term pages, people pages, and cross-domain references (sociology, philosophy) that connect to this school.

5. Propose the school page to emsenn before writing. The proposal should include:
   - School name and where it fits among existing schools
   - 2-3 core claims the tradition makes
   - Key thinkers (with dates and affiliations where relevant)
   - How it relates to existing school pages
   - What the critiques section will cover

6. After confirmation, write the school page following this structure:

### Required school page structure

**Location:** `content/education/disciplines/pedagogy/schools/{school-slug}/index.md`

**Frontmatter:**
```yaml
---
title: "School Name"
aliases:
  - "School Name"
  - "school name"
date-created: [current ISO 8601]
type: school
tags:
  - [relevant tags]
---
```

**Body sections, in order:**

- **Opening paragraph**: 3-5 sentences. What this tradition IS, where it comes from, what it asserts about education. No hedging — state the core position clearly.

- **Core claims or common threads**: What the tradition argues. Use bold labels for each claim. These are the tradition's assertions about education — not neutral descriptions but committed positions.

- **Key thinkers and texts**: Named individuals with their works, dates, and brief descriptions of contributions. Use full names on first mention with `[wikilinks](../../../../../../triage/wikilinks)` to people pages. Include nationality, tribal affiliation, or institutional context where relevant.

- **Relationship to other traditions**: How this school connects to, differs from, or conflicts with other pedagogical traditions represented in the vault. Use `[wikilinks](../../../../../../triage/wikilinks)` to other school pages. Be specific about points of convergence and divergence — not "X is related to Y" but "X shares Y's commitment to Z but differs on W."

- **Critiques and limitations**: Honest assessment of the tradition's blind spots, tensions, and boundaries. Every school page MUST have this section. Include:
  - Internal tensions within the tradition
  - Critiques from other traditions
  - What the tradition cannot address or does poorly
  - Medium limitations (what cannot be transmitted through text)

### Rules

- Every school page MUST have a Critiques and limitations section. A tradition presented without critique is propaganda, not scholarship.
- Name the people. Intellectual traditions are made by specific people in specific contexts. Do not present ideas as free-floating.
- Cross-link to other domains. Pedagogical traditions connect to sociology (social reproduction, decolonization), philosophy (epistemology, ethics), and other education disciplines (learning theory, knowledge transmission). Make these connections explicit.
- Do not flatten diversity. If a school encompasses multiple distinct traditions (as Indigenous pedagogies encompasses hundreds of nations), say so explicitly.
- Cite sources with `[@citekey]`. Check `bibliography.bib` for existing entries.

7. After writing, check for term pages that should link to this school and update them.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/write-term-page/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/write-term-page/SKILL.md

---
description: Create an educational term definition page with proper structure, citations, and cross-references
id: write-term-page
name: write-term-page
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "write a term page"
  - "create a term page"
  - "define a term"
inputs:
  term: string
  discipline: string?
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/education/"]
dependencies:
  - make-content-folder
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Write a term page for: $ARGUMENTS

## Instructions

1. Read the style guide at `content/writing/texts/style-guide.md`.

2. Identify which education discipline the term belongs to:
   - **pedagogy** — terms about teaching practice and theory
   - **learning** — terms about how understanding develops
   - **knowledge-transmission** — terms about how knowledge moves between people and communities

3. Read the discipline's existing `terms/index.md` to see what terms exist and what format they follow.

4. Check whether the term already exists:

```bash
find content/education -name "*.md" | xargs grep -li "$TERM" 2>/dev/null
```

5. Read any related term pages to understand the local context and linking conventions.

6. Write the term page following this structure:

### Required term page structure

**Location:** `content/education/disciplines/{discipline}/terms/{term-slug}.md`

**Frontmatter:**
```yaml
---
title: "term name"
aliases:
  - "term name"
  - "alternate name" # if applicable
date-created: [current ISO 8601]
type: term
tags:
  - [relevant tags, CamelCase]
defines:
  - "term name"
cites:
  - "Source Work Title"
---
```

**Body:**

- **Opening sentence**: State what the term IS in one clear sentence. Link the term to itself: `[Term](../../../undated/term.md)`.
- **Definition** (1-3 paragraphs): Define the concept. Ground it in the intellectual tradition it comes from. Use `[@citekey]` for scholarly sources.
- **Concrete illustration**: At least one concrete example or scenario showing the concept in action. This is not optional — a term page without grounding in concrete experience reproduces the banking model.
- **Related terms** section: Bulleted list of related terms with one-line descriptions of the relationship. Use relative links.

### Rules

- One concept per page. If two concepts are genuinely inseparable, define both; otherwise split.
- Cite the intellectual source. Every educational term comes from somewhere — name the thinker, the text, the tradition.
- Link to the school or tradition where the term originates (if a school page exists).
- Do not define the term instrumentally ("this matters because the vault needs it"). Define it as genuine knowledge.
- Follow PTGAE: no vague adverbs, active voice, no telling the reader how to feel.
- First mention of a person uses their full name with a `[wikilink](../../../../../../triage/wikilink)`.

7. After writing, update the discipline's `terms/index.md` to include the new term alphabetically.

8. Check for pages in other domains that should link to this term (e.g., sociology terms that reference the same concept). Report any recommended cross-links.


---

<!-- source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/write-transmission-mode-page/SKILL.md -->

## Imported source: psychology/agency/archive/domains/educational-agential-semioverse-repository/domains/write-transmission-mode-page/SKILL.md

---
description: Create a knowledge transmission mode page describing how knowledge moves, what it preserves, and whose interests it serves
id: write-transmission-mode-page
name: write-transmission-mode-page
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "write a transmission mode page"
  - "create a transmission mode"
  - "document a knowledge transmission mode"
inputs:
  mode: string
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/education/disciplines/knowledge-transmission/"]
dependencies:
  - make-content-folder
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Write a transmission mode page for: $ARGUMENTS

## Instructions

1. Read the style guide at `content/writing/texts/style-guide.md`.

2. Read existing transmission mode pages to understand the pattern:

```bash
find content/education/disciplines/knowledge-transmission/terms -name "*.md" | sort
```

3. Read at least two existing pages in that directory, plus the discipline index at `content/education/disciplines/knowledge-transmission/index.md`.

4. Write the transmission mode page following this structure:

### Required structure

**Location:** `content/education/disciplines/knowledge-transmission/terms/{mode-slug}.md`

**Frontmatter:**
```yaml
---
title: "mode name"
aliases:
  - "mode name"
date-created: [current ISO 8601]
type: transmission-mode
tags:
  - KnowledgeTransmission
  - [additional relevant tags]
defines:
  - "mode name"
---
```

**Body sections:**

- **Opening definition** (1-2 sentences): What this mode IS — how knowledge moves through it.

- **What it preserves**: What kinds of knowledge travel well through this mode. Be specific: not "information" but "procedural knowledge embedded in muscle memory" or "narrative structure that encodes relational obligations."

- **What it transforms or loses**: What changes when knowledge passes through this mode. Every transmission mode is also a transformation — name what is gained and lost. This is the medium-awareness that the vault's design philosophy requires.

- **Politics of the mode**: Whose knowledge does this mode serve? Who controls it? How does it relate to power? A mode is never neutral — oral transmission serves communities that maintain it; textual transmission serves those with literacy and archives; institutional transmission serves those who control institutions.

- **Relationship to other modes**: How this mode interacts with, complements, or conflicts with other transmission modes. What happens when knowledge moves between modes (e.g., oral → textual, embodied → institutional).

- **Related terms**: Bulleted list linking to related concepts.

### Rules

- Every mode page MUST address what the mode loses or transforms. A mode described only by what it carries is incomplete.
- Every mode page MUST address the politics of the mode. Transmission is never neutral.
- Connect to specific traditions. Do not describe modes abstractly — name the communities and practices that use them.
- Respect knowledge sovereignty. Some transmission modes (ceremonial, restricted oral) involve knowledge that is intentionally bounded. Describe the mode without extracting the content it carries.
- Link to pedagogy and learning terms where the mode intersects with teaching practice.

5. After writing, update `content/education/disciplines/knowledge-transmission/terms/index.md` and `content/education/disciplines/knowledge-transmission/index.md` if needed.


---

<!-- source: psychology/agency/archive/triage/philosophy-agential-semioverse-repository/domains/enrich-philosophical-content/SKILL.md -->

## Imported source: psychology/agency/archive/triage/philosophy-agential-semioverse-repository/domains/enrich-philosophical-content/SKILL.md

---
id: enrich-philosophical-content
description: "Enrich a philosophical page's frontmatter with domain-specific typed relations"
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "enrich philosophy"
  - "enrich philosophical content"
  - "add philosophy relations"
inputs:
  page_path: string
outputs:
  modified_path: string
  relations_added: string[]
region:
  reads: ["content/philosophy/"]
  writes: ["content/philosophy/"]
dependencies:
  - fix-frontmatter
---

# Enrich Philosophical Content

Add domain-specific typed relations to a philosophical page's frontmatter based on the [Philosophical ASR specification](../../../../../../../index.md).

## Procedure

1. **Read the target page.** Note its current `type:`, `defines:`, `tags:`, and any existing relations.

2. **Determine the philosophical content type.** Based on the page body:
   - Does it advance a proposition as true, inviting evaluation? → `claim`
   - Does it present premises and a conclusion supporting a claim? → `argument`
   - Does it challenge a specific claim or argument? → `objection`
   - Does it reply to an objection? → `response`
   - If none of these apply, keep the general ASR type (`term`, `concept`, `text`).

3. **Identify required relations.** Consult the [content types specification](../../../../../../../index.md) for MUST and SHOULD requirements:

   | Type | MUST have | SHOULD have |
   |------|-----------|-------------|
   | `claim` | — | `argued-by:` |
   | `argument` | `supports:` | `argument-form:`, `requires:` |
   | `objection` | `targets:` | `addressed-by:`, `proposes:` |
   | `response` | `addresses:` | `revises:`, `concedes:` |

4. **Read the page body for implicit relations.** Look for:
   - References to what tradition the content belongs to → `tradition:`
   - Phrases like "argues that," "supports the claim" → `supports:`
   - Phrases like "objects to," "challenges" → `targets:`
   - References to prerequisite concepts → `requires:`

5. **Add relations to frontmatter.** Only add relations that are accurate based on the page content. Do not invent relations the content does not support.

6. **Update `type:` if appropriate.** Most philosophical pages in this vault are currently typed `term` or `concept`. If the content is actually making a claim, presenting an argument, or raising an objection, the type should reflect that.

7. **Add `tradition:` where applicable.** If the page operates within a specific philosophical tradition (e.g., intuitionistic, classical, pragmatist), note it.

8. **Verify.** Re-read the page to confirm the frontmatter is consistent with the body.

## Constraints

- Do not modify body content. This skill only touches frontmatter.
- Do not add relations to pages you have not read.
- Prefer existing page paths for relation targets. If a target page does not exist, use a descriptive string value instead of a broken path.
- Philosophical types have fewer MUST requirements than mathematical types. A claim without arguments is an assertion — weaker, but not ill-formed. Do not force relations that the content does not support.


---

<!-- source: psychology/agency/archive/triage/sociology-agential-semioverse-repository/domains/enrich-sociological-content/SKILL.md -->

## Imported source: psychology/agency/archive/triage/sociology-agential-semioverse-repository/domains/enrich-sociological-content/SKILL.md

---
id: enrich-sociological-content
description: "Enrich a sociological page's frontmatter with domain-specific typed relations"
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "enrich sociology"
  - "enrich sociological content"
  - "add sociology relations"
inputs:
  page_path: string
outputs:
  modified_path: string
  relations_added: string[]
region:
  reads: ["content/sociology/"]
  writes: ["content/sociology/"]
dependencies:
  - fix-frontmatter
---

# Enrich Sociological Content

Add domain-specific typed relations to a sociological page's frontmatter based on the [Sociological ASR specification](../../../../../../../index.md).

## Procedure

1. **Read the target page.** Note its current `type:`, `defines:`, `tags:`, and any existing relations.

2. **Determine the sociological content type.** Based on the page body and directory location:
   - Does it define a single term or name a phenomenon? → `term`
   - Does it explain how multiple terms relate as a mechanism? → `concept`
   - Does it present a theoretical tradition with commitments and methods? → `school`
   - Does it teach through structured sequence with prerequisites? → `lesson`
   - Does it advance an argument or present a case study? → `text`
   - If none of these apply, keep the general ASR type.

3. **Identify required relations.** Consult the [content types specification](../../../../../../../index.md) for MUST and SHOULD requirements:

   | Type | MUST have | SHOULD have |
   |------|-----------|-------------|
   | `term` | `defines:` | `cites:`, `school:` |
   | `concept` | `defines:` | `integrates:`, `cites:`, `produces:`, `sustains:` |
   | `school` | — | `cites:`, `extends:`, `contests:` |
   | `lesson` | `requires:`, `teaches:` | `uses-concepts:` |
   | `text` | — | `cites:`, `authors:`, `supports:`, `contests:` |

4. **Read the page body for implicit relations.** Look for:
   - References to thinkers or texts → `cites:`
   - Discussion of what conditions produce a phenomenon → `emerges-under:`
   - Discussion of what a mechanism generates → `produces:`
   - Discussion of what a mechanism maintains → `sustains:`
   - Assembly of multiple named terms into a framework → `integrates:`
   - Named theoretical traditions → `school:`
   - Critique of other positions → `contests:`

5. **Add relations to frontmatter.** Only add relations that are accurate based on the page content. Do not invent relations the content does not support.

6. **Update `type:` if appropriate.** Many sociology pages in this vault are currently typed `term` when they function as `concept` pages (explaining mechanisms rather than defining vocabulary). If the content primarily shows how things work together rather than defining a single thing, the type should be `concept`.

7. **Populate `cites:` from body references.** If the body references specific thinkers (linked to `general/people/` pages) or specific works, add them to `cites:`. This is the most commonly missing relation in existing sociology content.

8. **Verify.** Re-read the page to confirm the frontmatter is consistent with the body.

## Constraints

- Do not modify body content. This skill only touches frontmatter.
- Do not add relations to pages you have not read.
- Prefer existing page paths for relation targets. If a target page does not exist, use a descriptive string value instead of a broken path.
- Sociological types have moderate MUST requirements. A term without `defines:` is ill-formed, but a term without `cites:` is merely incomplete. Do not force relations that the content does not support.
- The `school:` relation is for explicit tradition affiliation. Do not assign school affiliation based on directory location alone — a term in `sociology/terms/` may be used by multiple schools.
