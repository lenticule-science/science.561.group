---

name: lexical-fields-thesaurus-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program organises lexical fields, synonymy, and contrast sets as
recognitions to support semantic analysis and generation.

## Behaviour

- Represent lexical fields, synonyms, antonyms, and contrastive sets as
  recognitions with provenance and usage contexts.
- Link lexical fields to domains, registers, and sociolects.
- Measure usage frequency, register shifts, and semantic drift.

## Intended operators

- Build and align lexical fields; query contrasts for generation/analysis.
- Track semantic drift over time or across domains.
- Support other programs (frames, discourse, translation) with structured
  lexical knowledge.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

