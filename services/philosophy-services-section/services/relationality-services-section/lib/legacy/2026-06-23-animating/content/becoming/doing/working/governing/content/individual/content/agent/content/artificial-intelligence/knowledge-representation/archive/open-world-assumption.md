---
type: theorem
class: foundational
status: established
depends-on:
  - ../morphisms/entailment.md
see-also: []
references:
  - references/brachman-levesque-kr2004.md
---

# Open-world assumption

## Statement

The **open-world assumption (OWA)** is the standard
semantic stance of formal KR systems (DLs, OWL,
first-order logic): *absence of an assertion does
not imply its negation*. If $K$ does not contain
$P(a)$, this does not mean $K \models \neg P(a)$.

In contrast, the **closed-world assumption (CWA)** —
standard for relational databases — treats absence
as negation: not present implies false.

The choice is substantive and shapes inference.

## Formal contrast

For knowledge base $K$ and statement $P(a)$:

- **OWA.** $K \models P(a)$ iff $P(a)$ is true in
  every model of $K$. $K \models \neg P(a)$ iff
  $\neg P(a)$ is true in every model. Otherwise:
  *unknown*.
- **CWA.** $K \models P(a)$ iff $P(a) \in K$.
  Otherwise $K \models \neg P(a)$ (negation as
  failure).

Three-valued under OWA (true, false, unknown);
two-valued under CWA.

## Why OWL chose OWA

The semantic web context made OWA natural:

- **Distributed knowledge.** Different sources;
  none has complete knowledge.
- **Incomplete sources.** No single dataset is
  comprehensive.
- **Composability.** Adding a new source should
  refine, not contradict, existing entailments
  (monotonicity).
- **Logical tradition.** First-order logic has OWA
  semantics.

For an open, distributed knowledge web, OWA is
appropriate.

## When CWA is right

CWA fits better when:

- **Single-authority data.** A relational DB is the
  authoritative source.
- **Complete source.** Designer asserts complete
  knowledge of relevant facts.
- **Operational query.** "Show me all employees"
  expects to see everyone present.

Most database use is CWA; OWA is the exception.

## The mismatch

A common source of confusion:

- Database thinkers expect closed-world.
- OWL and RDF use open-world.
- "Not in the data" means different things in each.

Mismatch causes:

- Surprise at OWL inference results.
- Modeling errors when designers think CWA.
- Difficulty translating between OWL and DBs.

## Mitigations

OWL provides constructs for closed-world-style
reasoning when needed:

- **Number restrictions.** "Person has at most 2
  parents" closes that property.
- **Disjointness axioms.** $C \sqcap D \equiv \bot$
  forces non-overlap.
- **Nominals.** $\{a, b, c\}$ enumerates a class
  exhaustively.
- **Negation in queries.** SPARQL `MINUS`,
  `FILTER NOT EXISTS` allow CWA-style query
  patterns.

These give surgical closed-world treatment within
OWA.

## Implications for AI

- **Schema design.** Designer must consider whether
  complete knowledge is being asserted.
- **Inference results.** Open-world inference may
  not match user expectation.
- **Query semantics.** SPARQL queries operate
  closed-world over the matched data even though the
  underlying semantics is open-world.
- **LLMs and OWA.** LLMs trained on text may have
  CWA-like default behavior; this differs from
  formal OWA.

## Limits

- **Counterintuitive results.** OWA inferences may
  surprise.
- **No negation as failure.** Cannot directly express
  "not asserted means false."
- **Mixed-mode systems** are harder than pure OWA or
  pure CWA.

## Status

Foundational design choice. Standard for OWL/DL.
Standard counterpart (CWA) for databases. Known
source of mismatch and confusion in practice.
