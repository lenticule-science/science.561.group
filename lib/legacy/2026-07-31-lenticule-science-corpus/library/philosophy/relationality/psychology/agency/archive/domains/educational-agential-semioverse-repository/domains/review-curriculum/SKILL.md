---
name: review-curriculum
description: Review a curriculum sequence against pedagogical criteria — dependency structure, scope honesty, lesson quality, and banking model indicators
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
