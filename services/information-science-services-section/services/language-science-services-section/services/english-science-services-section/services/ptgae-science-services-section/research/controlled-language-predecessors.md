# Controlled-English predecessors and PlainEng research differentiators

**Source review 2026-10-10.** This is a research map of external ideas, not an external standards conformance certificate or a claim of invention priority. Original sources and dates must be cited in any publication. Private PlainEng work remains unlicensed for public release.

## Why comparing predecessors matters

Constraining English for consistency, readability and executable logic has a substantial history. A PlainEng program that merely limits vocabulary or converts controlled sentences into logical forms is **not new**. What might be distinctive must be stated as a falsifiable combination of capabilities and evaluated against credible reference systems.

| Lineage | Mechanism and primary source | Relevant constraint / lesson | What PlainEng must actually test |
| --- | --- | --- | --- |
| **US Federal Plain Language** | [GSA archived plainlanguage.gov sources](https://github.com/GSA/plainlanguage.gov), [Plain Writing Act of 2010](https://www.congress.gov/111/plaws/publ274/PLAW-111publ274.pdf) | Reader tasks, direct language, structure, public-interest transparency; the Act's scope is specific to covered federal communications | Better reader accuracy, findability, attribution and accessibility; keep governmental vs voluntary authority distinct |
| **ISO 24495-1:2023** | [ISO source listing](https://www.iso.org/standard/78907.html) | Plain-language principles; official full edition has separate access/license | Obtain lawful full-clause access before claiming mapped normative conformance |
| **Attempto Controlled English (ACE)** | [ACE Parsing Engine (APE)](https://github.com/Attempto/APE) | Controlled grammar and systematic formal semantic representations; prior art for machine-translatable English | Compare parse coverage, logical scope, counterexample handling and user comprehension; no “first parseable English” claim |
| **Common Logic Controlled English (CLCE)** | [Sowa's Common Logic Controlled English treatment](https://www.jfsowa.com/ikl/SowaST08.pdf) | English-like subset structured for Common Logic, e.g. names/variables instead of risky pronouns | Scope and reference constraints without unnecessary unnatural prose |
| **Grammatical Framework (GF)** | [GF official site](https://www.grammaticalframework.org/), [RGL API](https://www.grammaticalframework.org/lib/doc/synopsis/index.html) | Type-based abstract syntax with human-language concrete linearizations; reuse morphology/grammar library instead of string templates | Compare certified fragment parsing/realization and English representation; language-neutral semantics vs per-language realization |
| **ASD-STE100, Issue 9 (2025-01-15)** | [Official STE Maintenance Group](https://www.asd-ste100.org/), [Issue 9](https://www.asd-ste100.org/assets/files/ASD-STE100_ISSUE9.pdf) | Technical-writing grammar and controlled terms with recognized specialist application | Compare task error reduction, controlled term-sense use, professional review, and restrictions that overfit aviation |
| **PENG ASP** | [PENG ASP paper](https://researchers.mq.edu.au/en/publications/the-pengsupaspsup-system-architecture-language-and-authoring-tool/) | Guided predictive authoring, DRS and executable answer-set programs; interactivity reduces ambiguity before submission | Compare agent/human clarification UX, parsing failure rates, and executable consequences |
| **Universal Dependencies (UD v2)** | [UD source guidelines](https://universaldependencies.org/), [English-GUM treebank](https://github.com/UniversalDependencies/UD_English-GUM) | Rich reusable morphology/syntactic dependencies; annotations are *not* a complete formal semantics | Baseline English parser error coverage by dialect, genre, morphology, role and attachment; distinguish parse trees from meaning |
| **RelConLang + SignCraft** | [SignCraft experimental parser](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/signcraft/src/inference/relconlang.mjs) and [Lenticule lineage note](https://github.com/lenticule-science/linguistics-services-section/blob/main/content/text/documents/articles/notes/2026/10/01/relconlang-signcraft-lineage.md) | An internal constructed language already demonstrates explicit particles, roles, reading profiles and event structure | Determine what can be expressed by *restricting recognizable English* instead of forcing new particle vocabulary |

Sources listed are links to the original project/primary paper when accessible. **License/publishing rule:** a PDF available to download is not necessarily public domain. In particular, preserve ASD and ISO copyright and permission conditions. UD source texts and annotations can have distinct licensing. Reproduce short example quotations only with checked rights and attribution; build original benchmarking examples where practical.

## Scientific comparison matrix

A serious benchmark should compare each system on separately operationalized axes:

1. Natural English coverage, and its declared limits.
2. Controlled grammar: documented productions, accepted/ambiguous/rejected inputs, ambiguity classes.
3. Domain semantics: typed propositions, quantifier/modality/temporal scope, lexical sense.
4. Evidence/provenance and distinction of interpretation from truth.
5. Discourse and pragmatics: speech acts, reference repair, common ground.
6. Contradictory evidence without explosion and without treating competing parses as witnessed conflict.
7. Local/global context compatibility and measured cost of repair.
8. Round-trip reading/realization preservation for the **supported** typed fragment.
9. Accessibility, international English variation, task success and human teaching burden.
10. Runtime reproducibility, dependency/pinning, proof/test receipts, authorization and operational effect boundary.

No system is assumed best a priori. Many provide deep semantic or ergonomic capabilities PlainEng has not implemented; comparisons must record what exists rather than score aspirations as delivered features.

## Candidate distinguishing hypothesis

PlainEng may obtain useful advantages by composing **a real English-language algebra** with (1) typed source-bound propositions, (2) SignCell's for/against evidence, (3) SignChain consequence, (4) SignGraph's predicate fibers and carefully chosen site/restriction/sheaf models, (5) SignCraft repair and settlement, and (6) actual reader/agent evaluation. A combined stack could distinguish *parser uncertainty*, *source disagreement*, *contradictory evidence*, *action authorization* and *readability* more accurately than a one-score editor.

This remains a **hypothesis about a particular implementation**, not a priority claim and not a theorem. It is falsified if controlled grammar coverage is too poor, if typed grounding costs outweigh reader benefit, if ambiguity classes are not reliable, or if existing ACE/GF/STE-derived tools perform the same tasks at lower cost/error.

## First experiment

Choose a 30–60-sentence licensed corpus balanced across clean declarations, attribution, questions, quantifier/negation, tense, word-sense shifts, instructions, conflicting testimony and unresolved pronouns. Compare baseline English analyzer, an established CNL parser where practical, and the PlainEng restricted fragment. Report machine grammar coverage and **correct abstention**, source/meaning preservation and domain-receiver reviews. Follow with independent human-task trials; don't use the generating agent as sole judge.

Research issue: [PlainEng controlled English #61](https://github.com/lenticule-science/science-services-section/issues/61). Human evaluation: [science #56](https://github.com/lenticule-science/science-services-section/issues/56).
