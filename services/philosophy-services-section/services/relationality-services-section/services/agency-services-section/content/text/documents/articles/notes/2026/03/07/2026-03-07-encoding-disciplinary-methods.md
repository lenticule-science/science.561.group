---
part-of:
- reports
title: Encoding disciplinary methods for AI agents
date-created: 2026-03-07 00:00:00
tags:
- methodology
- agential-semioverse
- knowledge-organization
references:
  - id: carter2007epistemology
    type: document
    title: "[@carter2007epistemology]"
    author:
      - literal: Carter2007epistemology
  - id: tennis2008epistemology
    type: document
    title: "[@tennis2008epistemology]"
    author:
      - literal: Tennis2008epistemology
description: "Survey of how disciplinary methods can be encoded as machine-readable artifacts, and what this means for the ASR's methods/ directories."
type: text
keywords:
  - methodology
  - agential-semioverse
  - knowledge-organization
cites:
  - "[@carter2007epistemology]"
  - "[@tennis2008epistemology]"
---

When an agent works in a discipline directory, it needs to know not just what to do but how to reason.
The methods of a discipline — what counts as evidence, how claims are validated, what forms of argument are legitimate — are among the biggest shapers of how work proceeds.
This text surveys how methods are represented in knowledge management systems and what the ASR can learn from existing practice.

## The epistemology-methodology-methods-practice hierarchy

Carter and Little (2007) [@carter2007epistemology] establish a layered hierarchy that the knowledge organization literature has broadly adopted:

| Level | Question answered | Example |
|---|---|---|
| **Epistemology** | What counts as knowledge? | Constructivism, positivism, pragmatism |
| **Methodology** | What approach, and why? | Grounded theory, axiomatic proof, ethnography |
| **Methods** | What specific techniques? | Semi-structured interview, induction, tactic proof |
| **Practice** | How is it actually done here? | "We use Lean 4 with Mathlib, constructive only" |

Epistemology constrains methodology, which constrains methods, which are enacted as practice.
Using "methodology" as a synonym for "methods" is imprecise — methodology is the study and justification of methods, not the methods themselves.

Tennis (2008) [@tennis2008epistemology] extends this to knowledge organization specifically, arguing that epistemology is critical to KO because "it reflects our assumptions about language, the primary material of KO systems."

For the ASR, this hierarchy maps to existing structures:

- **Epistemology** → [relationality](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/skill/content/encoding-disciplinary-methods/relationality) and discipline-level philosophical commitments (e.g., [constructive reasoning](constructive reasoning))
- **Methodology** → discipline-level `methods/` directories and domain ASR specs
- **Methods** → specific techniques encoded as skills and curricula
- **Practice** → CLAUDE.md, AGENTS.md, and operational skills

## Existing method ontologies

Several OWL ontologies encode scientific methods as machine-readable artifacts:

**EXPO (Ontology of Scientific Experiments)** — 200+ concepts covering experimental design.
Distinguishes hypothesis-driven (Galilean) from exploratory (Baconian) approaches.
General-purpose but experiment-focused.

**OBI (Ontology for Biomedical Investigations)** — 2,500+ terms covering all investigation phases: planning, execution, reporting.
Part of the OBO Foundry ecosystem.

**P-Plan** — extends W3C PROV-O to represent the *plans* that guided scientific processes.
Plans decompose into Steps with input/output Variables.
Supports sub-plans.
Enables linking workflow templates as Linked Data.

**REPRODUCE-ME** — modular ontology for reproducibility, extending PROV-O and P-Plan.
Eight core components: Data, Agent, Activity, Plan, Step, Setting, Instrument, Material.
Applied to Jupyter notebooks.

**SPAR family** — ontologies for scholarly publishing: FABIO (bibliographic data), CiTO (citation semantics), DoCO (document structure).

None of these taxonomizes research methods *across* disciplines in a single artifact.
A comprehensive method ontology — covering qualitative, quantitative, experimental, ethnographic, formal, and computational methods — does not yet exist.
This is a genuine gap.

## What the ASR should do

The `methods/` directory in the ASR's directory organization spec is already the right structural home.
The research suggests refining how it works:

1. **Methods files should encode the hierarchy.** Each method file should state its epistemological grounding, its methodological tradition, and the specific techniques it involves.
  Frontmatter fields could include `epistemology:`, `methodology:`, and `techniques:`.

2. **Methods are first-class content.** They should be terms or concepts, not just prose descriptions.
  A method is as addressable and linkable as any other concept in the vault.

3. **Methods shape AGENTS.md.** A discipline's AGENTS.md should reference its methods.
  When an agent reads the AGENTS.md for mathematics, it should learn that the epistemology is constructive, the methodology is axiomatic proof, and the specific methods include tactic proofs in Lean and term proofs in Agda.

4. **External grounding is required.** Policy 003 applies: methods should cite the discipline's established methodological literature, not be invented ad hoc.
  When our method diverges from established practice, document why.

5. **The accretion trajectory applies to methods.** Methods should follow the same learn → document → curricula → skills → scripts → formalization path as other knowledge.
  A well-documented method becomes a curriculum, then a skill, then a script that partially automates it.

## Sources

- [EXPO Ontology](https://expo.sourceforge.net/)
- [OBI Homepage](https://obi-ontology.org/)
- [P-Plan Ontology](https://www.opmw.org/model/p-plan/)
- [REPRODUCE-ME](https://github.com/Sheeba-Samuel/REPRODUCE-ME)
- [MIT Press KOS Survey](https://direct.mit.edu/qss/article/doi/10.1162/qss_a_00363/128602/)
- [Tennis 2008: Epistemology in KO](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2879014)
- [Carter & Little 2007: Epistemology, Methodology, Methods](https://journals.sagepub.com/doi/abs/10.1177/1049732307306927)
