---
kind: question
status: open-with-realization-plan
explores:
  - relconlang
  - generation
  - realization
  - codec
  - round-trip
  - agents
---
# What should a RelConLang realization codec realize?

RelConLang currently has two very different production surfaces.

The language package exposes decoding: text can be articulated, settled, and read through a compiled bundle. The shared communicating code explicitly says genuine structure→surface realization belongs in the concrete language package.

SignCraft has a current `speak()` experiment, but it generates only:

[
subject ga predicate do object.
]

That is useful for saturation experiments. It does not realize most of the grammar that RelConLang can parse.

The next experiment should therefore begin from a language-specific **realization plan**, not from a text template.

The plan needs enough coordinates to choose:

- proposition nucleus and context-resolved participants;
- aspect and embedded clauses;
- stance report/profile;
- dialogue move and interrogative carrier;
- information structure;
- provenance/locus/kind;
- explicit versus omitted role particles;
- register;
- prefield order and punctuation.

Then test:

[
Plan 	o Surface 	o Reader_i 	o ProjectedPlan
]

for both current readers.

The goal is not exact byte round-trip. Surface realization is intentionally lossy. The goal is **declared semantic preservation**: every lost coordinate is known, and no generated form silently claims a semantic distinction the reader cannot recover.

This is still an offline language experiment, not an agent-control channel.
