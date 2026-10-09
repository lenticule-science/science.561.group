---
type: question
status: open
references:
  - references/petroni-langmodelskbs2019.md
title: Are LLMs knowledge bases?
description: Do large language models constitute knowledge bases in any substantive sense, or do they merely produce text that looks like KB content?
---

# Are LLMs knowledge bases?

## The question

Do large language models *constitute* knowledge bases
in any substantive sense, or do they merely *produce
text that looks like* KB content? If they're KBs, of
what kind?

## The original claim

Petroni et al. 2019: LLMs queried via cloze prompts
recover substantial factual knowledge competitive
with dedicated KB systems. Suggestive that LLMs *are*
KBs, just queried differently.

## The case for "yes"

- **Empirical capability.** LLMs answer fact
  questions across vast domains.
- **Scale.** GPT-4-class models encode more facts
  than any explicit KB.
- **Natural-language querying.** Easier than SPARQL.
- **Broad coverage.** Long-tail entities sometimes
  better than KBs.

## The case for "no"

- **Hallucination.** LLMs produce plausible falsehoods
  with confidence — KBs don't.
- **Inconsistency.** Different prompts yield
  contradictory answers — KBs are consistent.
- **No provenance.** Can't trace claims to sources.
- **Outdated.** Training-data cutoff; can't update.
- **No formal semantics.** Can't reason logically over
  the "knowledge."
- **Can't be audited.** Unlike KB triples.

So LLMs lack the standard KB properties.

## A middle view

Perhaps: LLMs are *knowledge-bearing systems* that
*are not* KBs in the classical sense.

- They encode substantial factual content.
- The encoding is unstructured, distributed, and
  inconsistent.
- Querying is natural-language and probabilistic.
- They function like fuzzy, reflexive knowledge
  retrieval — different in kind from KBs.

This view: LLMs are a *new kind* of knowledge
representation, not an instance of KBs.

## What it depends on

The answer depends on what "knowledge base" means:

- **Strict (DL/formal).** No: LLMs lack semantics,
  inference, soundness.
- **Operational.** Partial: LLMs answer fact queries
  but unreliably.
- **Cognitive.** Maybe: human knowledge is also
  unreliable, distributed, inconsistent.

There's no single right answer because there's no
single right definition of "knowledge base."

## Why it matters

Practical implications:

- **Replacement.** Can LLMs replace KB infrastructure
  (Wikidata, Wikipedia)?
- **Hybrid design.** What roles for LLMs vs KBs in
  hybrid systems?
- **Knowledge editing.** How to update LLM-encoded
  knowledge?
- **Trust and audit.** When can we trust LLM-output
  facts?
- **Query interfaces.** Should KB query languages be
  natural-language?

## What might resolve it

- **Better measurements.** Refined probes of what
  LLMs know.
- **Mechanistic understanding.** What's actually
  encoded and how?
- **Hybrid evaluations.** Side-by-side LLM and KB
  for various tasks.
- **Theoretical clarity.** Refined characterization
  of "knowledge representation" that distinguishes
  forms.

## Status

Genuinely open. Active research on probing LLM
knowledge, on knowledge editing, and on hybrid
systems. Answer likely depends on definitions and
use cases.
