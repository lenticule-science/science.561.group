---
type: theorem
class: foundational
status: established
depends-on:
  - teaching/explanations/description-logic.md
  - ../objects/owl-axiom.md
see-also: []
references:
  - references/baader-dlhandbook2003.md
---

# OWL decidability

## Statement

**OWL 2 DL is decidable**: there exist algorithms
that, given an OWL 2 DL knowledge base and a
candidate entailment, terminate with a correct
yes/no answer. Specifically, OWL 2 DL is
**N2ExpTime-complete**.

In contrast, **OWL 2 Full is undecidable**.

The contrast illustrates the design tradeoff at the
heart of OWL: decidability vs full RDF
compatibility.

## What it means

For OWL 2 DL:

- Subsumption ($C \sqsubseteq D$) is decidable.
- Consistency is decidable.
- Instance checking is decidable.
- Conjunctive query answering is decidable.

Reasoners are guaranteed to terminate on every input.

For OWL 2 Full:

- Reasoning is *undecidable* in general.
- Reasoners make best-effort attempts; some queries
  may not terminate.
- Most production systems use OWL 2 DL.

## Why decidability matters

For practical use:

- **Predictability.** Reasoners terminate.
- **Tooling.** Standard reasoners exist.
- **Verifiability.** Reasoning can be checked.
- **Integration.** Decidable reasoning composes
  better.

Undecidable formalisms can still be used (as in
theorem provers) but with weaker guarantees.

## Why N2ExpTime

OWL 2 DL is $\mathcal{SROIQ}$, a very expressive DL.
Its expressiveness pushes complexity to N2ExpTime.

Decomposing:

- Each constructor (qualified number restrictions,
  inverse roles, role hierarchies, nominals,
  transitive roles) adds complexity.
- $\mathcal{ALC}$ alone is ExpTime.
- Full $\mathcal{SROIQ}$ adds layers.
- Combined complexity is N2ExpTime-complete.

## Practical efficiency

Despite the worst-case complexity:

- Most real ontologies are tractable.
- Modern reasoners (HermiT, Pellet, Konclude) handle
  ontologies with millions of axioms.
- Profile-restricted reasoning (OWL 2 EL, QL, RL)
  achieves polynomial time for restricted use cases.

The N2ExpTime worst case is rarely realized in
practice.

## Profile complexities

OWL 2 profiles trade expressiveness for tractability:

- **OWL 2 EL.** Subsumption polynomial. Designed for
  large, simple-structured ontologies (biomedical).
- **OWL 2 QL.** Conjunctive query answering
  polynomial. Designed for query-heavy applications.
- **OWL 2 RL.** Polynomial rule-based reasoning
  via rule engines.

Application choice of profile depends on
expressiveness needs.

## Why OWL Full is undecidable

OWL Full allows mixing classes and individuals
(a class can be an instance of another class), full
RDF compatibility, and other features that push the
formalism past decidability.

This mirrors first-order logic's undecidability:
sufficient expressiveness loses decidability.

## Implications

- **Standard reasoning is well-defined.** OWL DL
  reasoners give guaranteed-correct answers.
- **Profile choice matters.** Use the most-
  restrictive profile that suffices.
- **OWL Full is risky.** Use only when full RDF
  compatibility required and decidability not
  essential.

## In contemporary AI

- **Production reasoners** support OWL DL with
  practical efficiency.
- **Biomedical ontologies** mostly use OWL EL.
- **Query-heavy applications** use OWL QL or RL.
- **Research systems** sometimes use OWL Full or
  even more expressive formalisms.

## Status

Foundational result. Standard knowledge in DL/OWL
community. Practical implication: choose the right
profile for your use case.
