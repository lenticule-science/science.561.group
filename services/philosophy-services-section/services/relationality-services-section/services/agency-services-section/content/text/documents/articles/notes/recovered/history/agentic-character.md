---
name: character
description: A nuclear endomorphism χ on the Heyting algebra H of an entity's fiber — the agent-side dispositional nucleus, idempotent and monotone and inflationary, whose fixed-point sublattice F_χ is the entity's behavioral space.
specializing: agentic-systems
nucleus-of: entity-fiber
distinct-from:
  - sigma-nucleus
  - delta-nucleus
---

The **agent-side dispositional nucleus**. Formally a nucleus χ on the Heyting algebra H of an entity's fiber, distinct from the institutional saturation nucleus σ and the temporal transfer nucleus Δ (see the σ- / Δ-doing-act split in the [agentive-triad study notes](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/agentive-triad.md)).

A character is what makes "this agent characteristically does X" a stable, idempotent, monotone, inflationary fact about the agent. The fixed-point sublattice $F_\chi = \mathrm{Fix}(\chi) \subseteq H$ is the agent's **behavioral space**: the propositions the character fully endorses. Acting in character means producing elements of $F_\chi$. An action $b$ such that $\chi(b) \neq b$ is acting *out of character* — the character nucleus would have amplified $b$ further toward $F_\chi$.

## Formal definition

A character is a pair $(\chi, F_\chi)$ where:

- $\chi : H \to H$ is a nuclear endomorphism in the relational universe $R = \mathrm{Sh}(T, J)$ — at each history $t$, $\chi_t$ is idempotent ($\chi^2 = \chi$), monotone ($a \leq b \Rightarrow \chi a \leq \chi b$), and inflationary ($a \leq \chi a$).
- $F_\chi = \mathrm{Fix}(\chi)$ is the sub-Heyting-algebra of fixed points.

The four invariants: nucleus condition, distinctness from σ and Δ, non-degeneracy ($F_\chi \neq \emptyset$ and $F_\chi \subsetneq H$), and internal naturality ($\chi$ commutes with sheaf restriction).

## Distinguishing predication-shape

- `is-nucleus-of(character, entity-fiber)` — the bearer of the χ.
- `behavioral-space(character, sublattice)` — the $F_\chi$.
- `commutes-with-sigma(character, bool?)` and `commutes-with-delta(character, bool?)` — open questions about coherence with the institutional nuclei.

## Step-induction role

Closure-rule consultation: when an agent proposes a witness, closure rules consult the agent's character nucleus to determine whether the witness lies in $F_\chi$. If not, the witness is flagged as out-of-character before it lands. This is the cell-graph analog of "the agent isn't acting like themselves." Soul-violation detection at scope level uses the same machinery applied to the scope's fiber.

## Not synonymous with

- **Persona** — persona is the entity bearing the character; character is the algebraic structure. A persona can act out of its character (and the records note this).
- **Soul** (scope-level) — soul is the scope-level analog; character is the entity-level analog. Same shape, different domain.
- **Agent** — agent is the entity bearing identity-key, has-skill, and dispatchability; character is the χ-nucleus an agent carries. An agent that does not bear a character nucleus is dispatchable but has no in-character/out-of-character distinction.

## Provenance

The character formalization predates the predication-categories family. The original definition with proofs of meet-preservation, idempotence, etc. is at `old-archive/triage/engineering-archive/library/triage/from-tech-bucket-2/character.md`. Promoting character fully into the predication-categories family — showing that character-nucleus theorems carry over from the relational-universe formalization to the closure-2-monad / bilattice formalization — is an open theory task.
