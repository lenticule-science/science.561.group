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
title: evaluate-scope-honesty
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
