# AI Science Services Section

AI science is the study of artificial intelligence systems — today, principally large language models — as objects of scientific study:
how they are trained and scaled, what is actually known about their internal mechanisms, how they are aligned and where alignment fails, and how they are evaluated and where evaluation fails.
It seats under `intelligence-science-services-section` because artificial intelligence is one realization of intelligence,
alongside the section's existing cognitive-systems and neuroreflexivity material.

## Seating derivation

This section existed before this README as a bare seat holding agent character definitions under `lib/agency/` and triage
(LLM experiments, collected references) with no canonical content and no README.
The group's entire working practice runs on LLM agents,
and the 2026-08-22 research program depends on them at every gate,
yet the library held almost no explicit, cited AI science — implicit operational knowledge far outran documented knowledge.
The 2026-08-22 study batch corrects this, seating the foundation-model, interpretability-and-alignment, and evaluation literatures here as the section's first canonical content.

## Relations to existing content (not moved)

- The parent's triage memo on the relational dynamics of in-context learning remains where it is; the foundation-model study supplies the citable literature behind that topic.
- `artificial-agent-science-services-section` (agent-science forest) owns agents *as agents* — architectures, tool use, multi-agent coordination; this section owns the underlying models and their measurement.
- The character definitions under `lib/agency/` are operational artifacts, not science; they stay as found.
- `news-media-science-services-section`'s accountable-agentic-newsrooms memo consumes this section's evaluation science for its gate designs.

## Scope

This section owns the literatures for:

- Foundation-model science: architecture, scaling laws, in-context learning, and the emergent-abilities debate, with tiers kept honest between peer-reviewed work and industry-lab preprints.
- Alignment and interpretability: RLHF and its documented failure modes, specification gaming, goal misgeneralization, sycophancy, and mechanistic interpretability's actual state of maturity.
- Evaluation and reliability: benchmark science and contamination, LLM-as-judge and its biases, calibration, red-teaming.

It does not own agent architectures or multi-agent coordination (agent-science forest), NLP applied to claims (news-media engineering), or the group's operational agent configurations.

Founded 2026-08-22 during backup-phase additive study work;
parent-README registration is carried as post-backup debt.
