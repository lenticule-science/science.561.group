---
type: question
status: open
see-also:
  - teaching/explanations/retrieval-augmented-generation.md
  - teaching/explanations/semantic-memory.md
  - teaching/explanations/the-rag-revolution.md
references:
  - references/lewis-rag2020.md
---

# Can RAG replace fine-tuning?

## The question

Two ways to add domain knowledge to an LLM agent:

- **Fine-tuning.** Update the model's weights on a domain
  corpus. Knowledge becomes parametric (in weights).
- **RAG.** Index the domain corpus in a vector store; retrieve
  relevant documents at inference. Knowledge stays external.

When does RAG suffice? When is fine-tuning required?

## The case for RAG

- **Updatability.** Add to the index, not retrain. New facts
  available at next query.
- **Provenance.** Retrieved documents are visible; the
  generator can cite them.
- **Cost.** Indexing is much cheaper than fine-tuning. No
  GPU time needed for updates.
- **Localization.** A new domain is a new index, not a new
  model. The base model serves many domains via swap-in
  retrieval.
- **No catastrophic forgetting.** RAG doesn't disturb the
  base model's existing capabilities.

## The case for fine-tuning

- **Procedural skill.** Fine-tuning can teach the model
  *how* to do something (a domain-specific output format,
  a reasoning style, a workflow). RAG cannot — it gives
  the model documents, not skills.
- **Vocabulary.** Fine-tuning can adjust the model's
  vocabulary to a domain (chemical names, legal terminology,
  medical codes) in ways retrieval cannot.
- **Density.** Fine-tuning can compress domain patterns into
  the weights, reducing per-query inference cost compared
  to RAG (which always pays the cost of carrying retrieved
  documents in context).
- **Implicit reasoning.** Fine-tuned knowledge is available
  for implicit reasoning steps without being surfaced as
  retrievable content.

## Where the answer is clear

- **Adding factual knowledge** (current events, product
  specs, customer-specific data): RAG is dominant.
- **Teaching new skills** (output formats, reasoning chains,
  tool-use patterns): fine-tuning is required (or
  prompt-engineering with sufficient examples).
- **Adapting to specialized vocabulary**: fine-tuning is
  more reliable.
- **Enforcing consistent style**: fine-tuning is more
  reliable.
- **Privacy-sensitive workloads** where the data must not
  leave a controlled boundary: RAG with on-prem index
  preferred (fine-tuning requires sending data to training
  infrastructure).

## Where the answer is contested

- **Hybrid approaches.** Fine-tune on procedural patterns +
  RAG for facts. Most production systems do both. The
  question is then *what* to fine-tune on vs *what* to put
  in retrieval.
- **Long-tail facts.** Are very rare facts better held in
  weights (where they may be drowned out) or in retrieval
  (where they may not be retrievable for unanticipated
  queries)?
- **Real-time data.** Is fine-tuning ever fast enough to
  match RAG's update latency? With LoRA or similar fast
  adaptation, the gap narrows.
- **Capability vs knowledge.** Is the line between
  "procedural skill" and "factual knowledge" active? Some
  tasks blur it.

## Why this matters

The answer shapes:

- **Cost structure of LLM-agent operation.** RAG-heavy
  systems pay per retrieval; fine-tune-heavy systems pay
  per training run.
- **Update operations.** RAG-heavy systems update by
  document ingestion; fine-tune-heavy systems update by
  retraining.
- **Vendor relationship.** RAG can be done with API-only
  base models; fine-tuning requires either weight access or
  vendor-supported tuning APIs.
- **Compliance.** RAG with on-prem index keeps data inside
  a boundary; fine-tuning may require sending data to a
  vendor.

## Status

Open. Both approaches are deployed widely; neither dominates
on all workloads. Empirical literature comparing them on
matched tasks is sparse, partly because the comparison
depends on what counts as "matched" — fine-tuning and RAG
have different cost structures and update models that resist
direct comparison.
