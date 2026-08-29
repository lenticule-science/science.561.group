---
type: reference
class: contemporary
authors: [Fabio Petroni, Tim Rocktäschel, Patrick Lewis, Anton Bakhtin, Yuxiang Wu, Alexander H. Miller, Sebastian Riedel]
year: 2019
venue: EMNLP
status: established
---

# Petroni et al., "Language Models as Knowledge Bases?" (2019)

Empirical study of factual knowledge in pre-trained
language models.

## What it argues

- Pre-trained LMs (BERT and successors) encode
  substantial factual knowledge.
- Cloze-style probing (LAMA probe) can extract this
  knowledge.
- Performance on fact retrieval competitive with
  dedicated relation-extraction systems.
- Suggests LMs as a kind of knowledge base.

## Why it matters

Foundational paper for the "LLMs as KBs" question.
Started the research line on probing what LLMs know.
Influential despite later complications and
critiques.

## Caveats (now widely recognized)

- Probing is prompt-sensitive.
- Test sets may overlap training.
- Hallucination concerns.
- LMs are not KBs in the classical sense.

These don't undermine the core observation that LMs
encode substantial knowledge.

## How to read

Short, accessible. Read alongside follow-up work
critiquing and refining the methodology.

## Related works

- Many follow-ups on knowledge probing.
- Knowledge editing papers.
- Hallucination-detection literature.
