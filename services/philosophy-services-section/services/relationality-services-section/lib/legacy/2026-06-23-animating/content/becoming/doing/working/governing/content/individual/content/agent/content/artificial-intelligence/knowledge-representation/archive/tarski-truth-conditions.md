---
type: theorem
class: classical
status: established
depends-on:
  - ../morphisms/entailment.md
see-also: []
references:
  - references/brachman-levesque-kr2004.md
---

# Tarski truth conditions

## Statement

Alfred Tarski (1933) gave a *compositional* semantics
for formal languages: the truth of a complex formula
in a model is determined by the truth of its parts,
recursively. This compositional structure is the
foundation of modern model-theoretic semantics for
all formal logics including DLs.

## The compositional clauses

For first-order logic over an interpretation $I$ with
domain $D$:

- $I \models P(t_1, \ldots, t_n)$ iff $(I(t_1),
  \ldots, I(t_n)) \in I(P)$.
- $I \models \neg \phi$ iff $I \not\models \phi$.
- $I \models \phi \land \psi$ iff $I \models \phi$
  and $I \models \psi$.
- $I \models \phi \lor \psi$ iff $I \models \phi$
  or $I \models \psi$.
- $I \models \forall x.\phi$ iff for all $d \in D$,
  $I[x \mapsto d] \models \phi$.
- $I \models \exists x.\phi$ iff for some $d \in D$,
  $I[x \mapsto d] \models \phi$.

Compositional structure: truth of complex formulas
defined in terms of truth of parts.

## Why it matters

Before Tarski, semantics was informal. Tarski
provided:

- **A precise notion of truth in a model.**
- **Compositional structure.** Truth of complex
  expressions reduces to truth of parts.
- **Formal foundation for entailment.** $K \models
  \phi$ iff $\phi$ is true in every model of $K$.
- **Bridge to model theory.** Model-theoretic
  semantics for logics builds on this.

This is the *standard* semantics for all KR
formalisms with formal semantics.

## Application to DLs

DL semantics is direct application:

- Domain $D$ of individuals.
- Each class $C$ interpreted as $C^I \subseteq D$.
- Each role $r$ interpreted as $r^I \subseteq D
  \times D$.
- Compositional clauses for class expressions:
  - $(C \sqcap D)^I = C^I \cap D^I$.
  - $(C \sqcup D)^I = C^I \cup D^I$.
  - $(\neg C)^I = D \setminus C^I$.
  - $(\exists r.C)^I = \{x \mid \exists y. (x, y) \in
    r^I \land y \in C^I\}$.
  - etc.

OWL semantics is precisely Tarski-style.

## What it doesn't do

Tarski semantics is *deflationary* about truth:

- Doesn't explain *why* sentences are true.
- Doesn't address pragmatics, intent, context.
- Doesn't capture default reasoning, vagueness, or
  probability natively.
- Doesn't address learning or update.

These require additional machinery: probability
theory, possible-worlds semantics, dynamic logic, etc.

## Implications for KR

- **Open-world default.** Tarski semantics naturally
  yields OWA: a sentence is false iff false in
  every model.
- **Entailment is necessary truth.** $K \models
  \phi$ means: $\phi$ true in every model of $K$.
- **Model existence.** A KB is consistent iff has at
  least one model.
- **Compositionality enables algorithms.** Tableaux
  and other reasoning algorithms exploit
  compositional structure.

## Limits

- **Standard logic only.** Non-standard semantics
  (paraconsistent, fuzzy, probabilistic) extend or
  modify.
- **Idealization.** Real natural-language meaning
  doesn't fit cleanly.
- **Two-valued.** Standard Tarski is bivalent;
  many-valued and probabilistic logics generalize.

## Status

Foundational result. Standard semantics for formal
languages and KR formalisms. Underlies all model-
theoretic reasoning in KR.
