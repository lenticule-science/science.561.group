---
title: "Local Model Content Gap Filling"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
  - claude
status: draft
priority: medium
depends-on: []
milestone: ""
appetite: "large"
---

## Summary

Use local LLMs (NPU and CPU) to automatically identify and fill content
gaps — undefined terms, missing definitions, absent cross-references —
across the repository. The system NLP-analyzes files, detects notable
terms, checks whether they are defined in-scope, and if not, uses local
models to generate initial term/concept files. This runs concurrently
with triage enrichment: NPU handles generation while CPU handles
classification.

## Motivation

Every file we create references terms that may not yet exist as their
own files. When Claude writes a text about quantization, it links to
`terms/quantization.md` — but that file may not exist, or may be a
stub. Currently, filling these gaps requires Claude (expensive, slow)
or manual effort.

Local models on this hardware can produce good-enough initial
definitions — phi-4-mini on NPU answered "What's nihilism?" with
content that would serve as a reasonable starting point for a term
page. With proper prompting and the frontmatter spec as context,
local models can generate term files that meet minimum quality
standards. A human or higher-trust model can review and improve them
later.

The repository has 4,214 triage files and growing discipline content.
The gap between "files that exist" and "terms those files reference"
will only widen. Automating the initial coverage lets Claude focus on
quality improvements and architectural work rather than basic
definition-writing.

## Approach

### Phase 1: Term extraction (spaCy NLP)

Script that reads published content files and extracts notable terms:
- Named entities, noun phrases, and wikilink targets
- Filters against existing term/concept files
- Outputs a gap report: terms referenced but not defined

### Phase 2: Term triage

For each gap term, ask a local model (classification task):
- Is this term worth defining? (Score 0-3)
- What discipline does it belong to?
- Is it a term (thing) or concept (relation)?

### Phase 3: Term generation

For terms scoring >= 2, ask a generation model:
- Generate frontmatter + one-paragraph definition
- Use the semiotic-markdown spec as context
- Place the file in the appropriate discipline directory

### Phase 4: Cross-reference audit

After generating term files, re-scan to:
- Fix broken wikilinks that now have targets
- Identify second-order gaps (terms referenced by generated terms)
- Report coverage metrics

## Concurrency model

- **CPU (Ollama)**: triage enrichment (classification, ongoing)
- **NPU (Foundry)**: term generation (this pipeline)
- Both run as background processes with no contention
- `local_llm.suggest_model()` routes tasks to the right backend

## Steps

1. Install spaCy and a small English model (`en_core_web_sm`)
2. Write `scripts/extract-term-gaps.py` — NLP-based gap detection
3. Write `scripts/generate-term-files.py` — local model term generation
4. Create a skill wrapping the pipeline (extract → triage → generate)
5. Test on one discipline module (e.g., computing)
6. Run at scale, review output quality
7. Integrate into regular maintenance workflow

## Also in scope

- **Proceduralized delegation**: formalize how tasks are routed to
  local models based on required capabilities. The `suggest_model()`
  function is the seed; this plan should produce a specification for
  task→model routing that other skills can reference.
- **Model capability mapping**: maintain a structured record of what
  each available model is good at (classification, generation,
  extraction, reasoning) based on empirical testing during this work.

## Done when

- [ ] Gap extraction script identifies undefined terms across at least
      one discipline
- [ ] Generation script produces term files that pass frontmatter
      validation
- [ ] Pipeline runs concurrently with triage enrichment (CPU + NPU)
- [ ] Task→model routing is documented and used by at least 3 scripts
- [ ] Coverage metrics are reported (terms defined / terms referenced)

## Dependencies

- local_llm.py with suggest_model() (done)
- Foundry Local running on NPU (done)
- spaCy (to be installed)

## Log

**2026-03-08** — Created. Motivated by observing that phi-4-mini on NPU
produces reasonable definitions in ~3s, and that the repo has thousands
of undefined term references. The local model infrastructure overhaul
(check-environment.py, local_llm.py, suggest_model()) provides the
foundation.
