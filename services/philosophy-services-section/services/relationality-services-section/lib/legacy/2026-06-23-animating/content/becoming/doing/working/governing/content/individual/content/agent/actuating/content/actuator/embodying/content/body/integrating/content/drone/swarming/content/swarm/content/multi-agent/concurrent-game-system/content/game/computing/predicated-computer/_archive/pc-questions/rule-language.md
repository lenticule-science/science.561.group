---
type: question
status: resolved
resolved-by: [rule-language-realizability-determines-regime]
explores: [closure-rule, closure-rule-record]
---

# What language do closure-rule premises and conclusions speak?

> **Resolution.** This question is resolved by [rule-language-realizability-determines-regime](../theorems/rule-language-realizability-determines-regime.md). The engineering theory commits not to a particular rule language but to a *fragment classification*: the substrate's [closure-rule system](../objects/closure-rule-system.md) declares its `rule-language-fragment` (`quantifier-free` or `with-forall-blocks`), and the fragment plus the base finiteness determines the substrate's [regime](../theorems/regime-classification-for-substrate.md), which in turn determines the engineering envelope (fuel, federation, snapshot, audit) per the four [regime engineering envelope theorems](teaching/explanations/regime-discipline.md). Particular language *implementations* — RTL, SHACL, Datalog, Prolog, Souffle, Cypher — remain a per-platform engineering choice within their fragment class, with the requirement that the implementation honor the four substrate-checkability commitments below (substrate-checkability, determinism, decidability, vocabulary completeness). The rule-language question is therefore answered at the level of *fragment classes* (which fragment determines which regime) rather than at the level of *specific syntactic systems*.



The corpus's [closure-rule-record](../objects/closure-rule-record.md) declares that a rule has a `premise` (a predicate pattern) and a `conclusion` (a predication or predication-pattern). The structural fields are specified — premise as a shape entity, conclusion as a predication target — but the *language* in which premises and conclusions are written is not specified by the engineering theory.

The older specs cite a specific candidate: **RTL — the Recognition Term Language** — a typed term language for expressing recognitions and judgments. RTL has:

- A finite catalogue of base types and constructors.
- Variance annotations on constructor arities (`+`, `-`).
- Admissibility flags per constructor.
- Canonical normalization strategy (call-by-value, left-to-right).
- Type-checking and judgment-form rules.

In the older spec, RTL is the language for closure-rule premises (the patterns CCE matches against) and for closure-rule conclusions (the judgments CCE produces).

The corpus does not commit to RTL. The closure-rule-record's `premise` and `conclusion` fields are described as references to substrate entities (typically shape entities), but the *content* of those entities is left implicit. Particular platform realizations may use:

- RTL or a similar typed term language.
- SHACL constraint shapes plus value-domain expressions.
- A logic-programming language (Prolog, Datalog, Souffle).
- A general-purpose programming language with substrate-binding restrictions.
- A graph-pattern language (Cypher, GraphQL, SPARQL).

The question is whether the engineering theory should commit to a particular rule language — or to a particular *class* of admissible rule languages — or whether the choice is a per-platform engineering decision.

Particular candidates for engineering content:

- **Substrate-checkability.** Rule languages must be substrate-checkable: the substrate's operators evaluate the rule's premise against substrate state and produce the rule's conclusion. Languages that require external runtime support (an embedded interpreter, a compiled binary, a remote service) are admissible only if the support is itself substrate content.
- **Determinism.** Rule languages must produce deterministic outputs (per [determinism](teaching/explanations/determinism.md)). Non-deterministic languages or evaluation strategies are inadmissible.
- **Decidability.** Rule premises must be decidable: given substrate state, the substrate operator must terminate with a yes/no match-result in finite time. Per the substrate's [locality](wavefront.md) discipline, the radius is bounded; per [fuel-bound](teaching/explanations/fuel-bound.md), the iteration is bounded.
- **Vocabulary completeness.** Per [vocabulary-completeness](teaching/explanations/vocabulary-completeness.md), every predicate the rule's premise or conclusion uses must itself be a substrate entity.

The set-aside framing: spatiotemporal-knowledge has not yet articulated whether RTL or some equivalent typed term language is the canonical rule language. Until the math program's framework is firmer, the corpus carries the structural commitments without committing to a specific rule language.

Source: `cellular-data-serialization.md`, `cellular-closure-engine.md`.
