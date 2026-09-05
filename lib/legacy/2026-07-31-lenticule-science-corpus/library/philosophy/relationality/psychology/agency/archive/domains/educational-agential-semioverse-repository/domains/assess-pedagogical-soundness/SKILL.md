---
name: assess-pedagogical-soundness
description: Assess any educational content for banking model reproduction, concrete grounding, scope honesty, and pedagogical validity
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
