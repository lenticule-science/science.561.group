---
description: Mine triage files for ideas relevant to a specific goal or interest — governance, formalization, curriculum design, discipline structure, or any other focus
id: mine-triage
name: mine-triage
version: [0, 2]
type: operational
runtime: inference
triggers:
  - "mine triage"
  - "look at triage"
  - "what's in triage"
  - "survey triage"
  - "search triage for"
follows-policies: [1, 6, 7, 8]
inputs:
  focus: string
outputs:
  findings: string[]
  plans_created: string[]
  report_path: string
region:
  reads: ["content/triage/"]
  writes: ["content/"]
dependencies:
  - write-advisory-report
  - create-plan
  - find-thing
scopes: []
part-of: technology/specifications/agential-semioverse-repository
title: mine-triage
---
Mine triage for: $ARGUMENTS

## Instructions

### 1. Pre-classify with scripts (saves tokens)

Before reading files in full, use the relevance classifier to narrow
the search. This offloads the "is this file relevant?" decision to
ollama, so the inference agent only reads files that score highly.

```bash
# Via MCP tool:
mine_triage_relevance(focus="$ARGUMENTS", directory="subdirectory")

# Or via script directly:
python mine-triage-relevance.py --focus "$ARGUMENTS" --dir "subdirectory"
```

For formal/mathematical content, also use the definition extractor:

```bash
python extract-formal-definitions.py --dir "subdirectory" --relevance-filter "method"
```

### 2. Scope the search

$ARGUMENTS specifies the focus — what you're looking for. Examples:
- "governance" → specs, policies, process improvements
- "formalization" → mathematical structures, proof sketches
- "curriculum" → teaching sequences, learning paths
- "discipline structure" → how disciplines are organized

Read ONLY the files that scored >= 2 from the pre-classification step.

### 3. Read with a lens

For each triage file, ask through the lens of $ARGUMENTS:
- Does this contain ideas applicable to the focus?
- Is this a draft of something that could be promoted?
- Does this contain decisions or constraints emsenn already made?

### 4. Check for existing published versions

Before recommending promotion, use `find-thing` to check whether a
more recent version already exists in the published repo. Triage
may be outdated. The published version is authoritative.

### 5. Produce an advisory report

Use `write-advisory-report` to produce a proper report (policy 006:
research produces texts). File in the appropriate discipline's
`texts/` directory.

### 6. Create or update plans

For each actionable finding, create a plan or update an existing one.

### 7. Do not

- Assume triage specs are ready to promote as-is.
- Just list what's in triage. Extract applicable IDEAS.
- Write slop. If findings are thin, say so.
- Duplicate content that already exists in the published repo.
