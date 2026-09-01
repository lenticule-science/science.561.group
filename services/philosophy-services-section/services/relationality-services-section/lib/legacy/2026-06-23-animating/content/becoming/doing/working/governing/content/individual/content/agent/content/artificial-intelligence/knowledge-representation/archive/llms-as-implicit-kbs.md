---
type: narrative
status: active
references:
  - ../references/petroni-langmodelskbs2019.md
---

# LLMs as implicit knowledge bases

In 2019, Petroni et al. asked: "Language Models as
Knowledge Bases?" Their finding: pre-trained language
models, queried via cloze prompts, recover substantial
factual knowledge competitive with relation-extraction
baselines. The implicit suggestion: LLMs are, in some
sense, knowledge bases.

The claim has been refined, contested, and partly
absorbed in the years since.

## The original observation

Petroni et al. used the LAMA probe:

- Cloze-style queries: "Dante was born in [MASK]."
- Test whether the model fills with the right answer.
- Compare to dedicated relation-extraction systems.

Result: BERT performed competitively, sometimes
better, than dedicated KB-extraction systems on
cloze-style fact retrieval.

Implication: substantial factual knowledge resides in
the model's parameters.

## What this means

If LLMs encode factual knowledge:

- They can *replace* explicit KBs for some uses.
- Querying is via natural language, not SPARQL.
- Coverage is broad (anything in pre-training).
- No need for explicit graph construction.

Tantalizing. But complicated.

## The complications

### Hallucination

LLMs sometimes confabulate convincing-but-false
"facts":

- Plausible-sounding wrong answers.
- Mixed-up details (right person, wrong year).
- Non-existent entities and events.

Unlike KBs, LLMs lack a "truth check" — outputs are
generated, not retrieved from verified storage.

### Outdatedness

LLM training data has a cutoff. Post-cutoff facts
are unknown:

- Current presidents, prices, events.
- Recent research findings.
- Real-time information.

KBs can be updated continuously; LLMs require
retraining or fine-tuning.

### Lack of provenance

LLM outputs don't come with sources:

- Cannot trace claims to evidence.
- Cannot evaluate source credibility.
- Cannot audit the knowledge.

KBs typically include provenance metadata.

### Inconsistency

LLMs can produce contradictory facts:

- Different prompts yield different answers.
- The "model" doesn't have a consistent fact
  belief.
- Different model versions disagree.

KBs are (in principle) consistent.

### Probing limitations

The LAMA-style probing has critiques:

- Performance highly sensitive to prompt phrasing.
- Test set may overlap with training data.
- Probes may capture surface patterns, not knowledge.

So "knowledge in LLMs" is harder to measure than the
original work suggested.

## What's actually true

A more nuanced summary:

- **LLMs encode substantial knowledge** in
  parameters — far more than was anticipated.
- **This knowledge is unreliable** in ways KBs
  aren't.
- **Querying is natural-language native** — a major
  advantage for human use.
- **Coverage is breadth-favored** over depth or
  precision.
- **For high-stakes use, hybrid with KBs is
  appropriate.**

## The hybrid pattern

The current production pattern: *retrieval-augmented
generation (RAG)*.

- LLM produces text based on query.
- Retrieval system fetches relevant documents from
  a knowledge source.
- LLM is grounded in retrieved documents.
- Output is generated but cite-able.

This combines LLM strengths (natural language,
flexible reasoning) with KB strengths (precise facts,
provenance).

## In contemporary AI

- **RAG.** Standard pattern in production LLM
  applications.
- **KG-augmented LLMs.** Specifically using KGs as
  retrieval sources.
- **Knowledge editing.** Modifying LLM parameters to
  update specific facts (active research).
- **Knowledge probing.** Refined methods for
  measuring what LLMs know.

## The remaining question

Open: *to what extent* does parametric LLM knowledge
constitute a "real" KB?

- Pearl-style skeptics: LLMs lack the explicit
  structure of KBs and only mimic.
- Defenders: LLMs achieve KB-like functionality even
  without explicit structure.
- Empirical position: depends on task, domain,
  evaluation.

Per [are-llms-knowledge-bases](../learning/questions/are-llms-knowledge-bases.md),
this remains genuinely open.

## Lesson

The "LLMs as KBs" observation prompted serious
reconsideration of what KR systems should look like.
The answer emerging:

- Both KBs and LLMs have roles.
- Hybrid is the practical answer.
- The classical KR/ML division is dissolving in
  favor of integrated systems.

The classical KR question — "how is knowledge
encoded?" — now has a different answer than it did
a decade ago.
