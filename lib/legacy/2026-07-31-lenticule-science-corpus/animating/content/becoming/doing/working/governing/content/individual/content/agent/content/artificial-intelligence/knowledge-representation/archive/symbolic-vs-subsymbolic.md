---
type: narrative
status: active
references:
  - ../references/garcez-neurosymbolic2022.md
  - ../references/brachman-levesque-kr2004.md
---

# Symbolic vs subsymbolic

The history of AI is in part a history of swings
between *symbolic* and *subsymbolic* paradigms.
Knowledge representation is the central battleground:
how should knowledge be encoded?

## The 1950s-1960s: symbolic AI ascendant

Early AI assumed symbolic representation:

- **GPS, Logic Theorist.** Symbolic problem solvers.
- **Symbolic logic.** First-order logic as the
  vehicle for AI knowledge.
- **Expert systems** (1970s). Rule-based, symbolic
  reasoning over hand-encoded knowledge.

The dominant view: intelligence = manipulating
symbols.

Connectionism (early NNs) existed but was dismissed
after Minsky-Papert's *Perceptrons* (1969).

## The 1980s: expert systems peak

Expert systems were the commercial face of symbolic
AI:

- **MYCIN** (medicine), **DENDRAL** (chemistry),
  **R1/XCON** (configuration).
- Heavy investment; widely deployed.
- Knowledge engineering as a profession.

Then they hit limits:

- Knowledge acquisition bottleneck (hand encoding).
- Brittleness outside narrow domains.
- Maintenance costs.
- Failure to handle perception, NLP, common sense.

The "AI winter" of the late 1980s followed.

## The 1980s-1990s: connectionism returns

Backpropagation revival (Rumelhart-Hinton-Williams
1986) brought NNs back:

- Distributed representations.
- Learning from data.
- Robustness to noise.

Tension with symbolic AI: NNs were fundamentally
*subsymbolic* — knowledge in weights, not
explicit symbols.

Some theorists (Smolensky 1988, Fodor-Pylyshyn 1988)
debated whether connectionism could capture
symbolic cognition.

## The 2000s: knowledge graphs and semantic web

Symbolic KR continued:

- **Description logics** matured.
- **OWL** standardized.
- **Linked Open Data** project.
- **Wikipedia + Wikidata** as crowdsourced symbolic
  knowledge.

The semantic web didn't deliver its grand promise but
established KGs as production technology.

## The 2010s: deep learning triumphs

The deep-learning revolution shifted dominance:

- ImageNet 2012, AlphaGo 2016, transformer 2017,
  GPT-3 2020.
- Subsymbolic approaches dominated benchmarks
  across vision, language, games.
- Symbolic AI became "old AI" in popular framing.

The "bitter lesson" (Sutton 2019): historically,
hand-engineered structure loses to scale + learning.

## The 2020s: neurosymbolic synthesis attempts

The current moment:

- LLMs scale enormously but have known limits
  (hallucination, brittle reasoning, lack of
  guarantees).
- Symbolic systems address these but don't scale.
- Tool use, retrieval-augmented generation, and
  verifier-guided generation are *de facto*
  neurosymbolic patterns.
- Research on tighter neurosymbolic integration
  continues.

The synthesis is empirically strongest where the
neural-symbolic interface is *narrow* (tool use,
retrieval, verification) — not where systems try to
do symbolic reasoning *natively* in neural form.

## What's at stake

The debate is partly philosophical:

- **Symbolic camp.** Intelligence requires explicit
  symbol manipulation; cannot emerge from
  statistics.
- **Subsymbolic camp.** Intelligence is statistical
  pattern recognition; symbols are emergent
  shorthand.
- **Pluralist.** Both have roles; right tool for
  right job.

Empirical evidence increasingly supports the
pluralist view.

## What we've learned

- **Symbols are good for verification, audit,
  precise inference.**
- **Neural is good for perception, scale,
  flexibility.**
- **Pure approaches have known limits.**
- **Hybrids work but require care.**
- **Engineering quality matters as much as
  paradigm.**

The dichotomy is often less stark than the
historical debate suggests.

## In current AI

The current pragmatic synthesis:

- **LLMs as the substrate.** Large pre-trained
  models do most heavy lifting.
- **Tools and retrieval as the symbolic interface.**
  Narrow neural-symbolic boundary.
- **Verifier-guided generation** for safety-
  critical.
- **KGs as supplementary.** Structured fact stores
  alongside LLMs.

This is neurosymbolic in practice — even if the
research community sometimes still treats it as
"either/or."

## What's next

Possible futures:

- **Continuing scale.** Neural alone improves;
  hybrids less needed.
- **Hybrid systems mature.** Neurosymbolic becomes
  standard architecture.
- **Mathematical synthesis.** New formalisms
  unifying symbolic and subsymbolic.
- **Domain specialization.** Different paradigms for
  different domains.

The historical pendulum suggests the next swing —
whichever direction — will reveal new limits and
prompt reconciliation.
