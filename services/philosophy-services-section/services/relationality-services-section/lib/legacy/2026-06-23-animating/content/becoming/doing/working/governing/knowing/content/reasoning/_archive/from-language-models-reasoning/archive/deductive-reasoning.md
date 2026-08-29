---
type: concept
class: foundational
status: active
depends-on:
  - reasoning.md
see-also:
  - formal-reasoning.md
  - ../objects/proof.md
references:
  - references/russell-norvig-ai2020.md
---

# Deductive reasoning

**Deductive reasoning** derives conclusions that *must
be true* given the premises — necessary inference.
The classical paradigm of formal logic and the
foundation of mathematical proof.

## The structure

A deductive inference:

- Premises $P_1, \ldots, P_n$.
- Conclusion $C$.
- Such that: in every model where all $P_i$ are
  true, $C$ is also true.

Formally: $\{P_1, \ldots, P_n\} \models C$.

Truth of premises *guarantees* truth of conclusion.

## Examples

Classical:

- All humans are mortal. Socrates is human.
  Therefore Socrates is mortal.
- $A \to B$ and $A$, therefore $B$ (modus ponens).
- $A \lor B$ and $\neg A$, therefore $B$
  (disjunctive syllogism).

Mathematical:

- From axioms of group theory, derive theorems about
  groups.
- From Euclid's axioms, derive geometric theorems.

Each step truth-preserving.

## Soundness and completeness

A deductive system $(\vdash)$ is:

- **Sound** if $\Gamma \vdash \phi$ implies $\Gamma
  \models \phi$ (only entailed things are
  derivable).
- **Complete** if $\Gamma \models \phi$ implies
  $\Gamma \vdash \phi$ (everything entailed is
  derivable).

For first-order logic:

- Standard proof systems are sound and complete
  (Gödel completeness theorem).
- But entailment is undecidable (only
  semi-decidable).

For description logics:

- Sound and complete decision procedures exist for
  decidable fragments.

## Forms of deduction

- **Propositional deduction.** Logic without
  quantifiers.
- **First-order deduction.** With quantifiers.
- **Higher-order deduction.** Quantifying over
  predicates / functions.
- **Modal deduction.** Adding necessity / possibility
  operators.
- **Equational deduction.** Reasoning with
  equations.
- **Type-theoretic.** Reasoning with dependent
  types.

Each has its own proof systems.

## Algorithms

For deductive proof search:

- **Resolution.** Davis-Putnam, DPLL, modern SAT
  solvers.
- **Tableaux.** Tree-based proof search.
- **Sequent calculus.** Gentzen-style.
- **Natural deduction.** Closer to informal
  reasoning.
- **Decision procedures.** For decidable
  fragments.
- **Tactic-based.** Lean, Coq, Isabelle proof
  assistants.

## Deduction in AI

- **Theorem provers.** ACL2, Vampire, E, Z3.
- **Proof assistants.** Lean 4, Coq, Isabelle.
- **DL reasoners.** HermiT, Pellet for OWL.
- **Logic programming.** Prolog and successors.
- **SAT/SMT solvers.** For propositional and
  modulo-theories problems.

Mature technology with diverse applications.

## Strengths and limits

**Strengths:**
- Truth-preservation guaranteed.
- Verifiable.
- Compositional.
- Scales to large proofs (with effort).

**Limits:**
- Premises must be available; doesn't acquire new
  knowledge.
- Combinatorial complexity in proof search.
- Brittle to under-specification.
- Requires formalization, often expensive.

## Deduction and LLMs

Open question: *do LLMs do deductive reasoning?*

- LLMs can produce deductive proofs.
- They sometimes succeed at unfamiliar deductive
  problems.
- They sometimes fail in surprising ways
  (consistency, adversarial perturbations).
- Per [llm-reasoning-debate](teaching/explanations/llm-reasoning-debate.md),
  whether this is "real deduction" is contested.

LLM + formal verifier hybrids (e.g.,
neural-guided proof search in Lean) provide
sound deduction with neural advisors.

## In contemporary AI

- **Theorem proving.** Active research; AI-assisted
  proof.
- **Program verification.** Formal verification of
  software/hardware.
- **DL reasoning.** Production deployment.
- **Constraint solving.** Industrial planning,
  scheduling.

## Status

Mature formalism. Standard substrate for verifiable
inference. Active integration with neural systems.
