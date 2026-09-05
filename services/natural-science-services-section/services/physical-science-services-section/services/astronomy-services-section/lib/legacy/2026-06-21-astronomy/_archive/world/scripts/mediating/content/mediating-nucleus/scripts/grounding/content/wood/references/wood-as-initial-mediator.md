---
type: theorem
class: universal-property
status: sketch
depends-on: [wood-between-worlds, mediating-nucleus]
---

# Wood as initial mediator

**Statement.** Fix a family of [worlds](../objects/world-as-nucleus.md) $\{W_i\}$ in the ambient relational category $\mathsf{R}$. Let $\mathbf{Med}_{\{W_i\}}$ denote the category of [mediating nuclei](../teaching/explanations/mediating-nucleus.md) for $\{W_i\}$ (objects: triples $(M, \{Q_i\}, \{\psi_i\})$; morphisms: structure-preserving maps $u : M \to M'$ with portal-respecting factorizations $u_i : Q_i \to Q'_i$ such that $\psi'_i \circ u_i = \psi_i$).

The Wood $(\mathrm{Wd}, \{P_i\}, \{\phi_i\})$ is **initial** in $\mathbf{Med}_{\{W_i\}}$: for every other mediator $(M, \{Q_i\}, \{\psi_i\})$, there exists a unique-up-to-isotropy morphism

$$u : M \to \mathrm{Wd}$$

with factorizations $u_i : Q_i \to P_i$ satisfying $\phi_i \circ u_i = \psi_i$.

(Note the direction: in the source draft (§3.7) the universal arrow runs $u : M \to \mathrm{Wd}$, making the Wood the *terminal* object in the source's wording. We follow the source. Whether the categorical convention is "initial" or "terminal" depends on how one orients $\mathbf{Med}$; the structural content is invariant.)

## Argument (sketch)

The Wood satisfies axiom (W-Univ) by construction; (W-Univ) is exactly the universal arrow condition for $\mathrm{Wd}$ to be initial (terminal, in the source's orientation) in $\mathbf{Med}_{\{W_i\}}$. The universal-property statement is therefore tautological *given the axioms*; the substantive content of the theorem is the *existence* claim — that an object satisfying all four axioms exists at all — which the source postulates rather than constructs (§3.2 of the source). ∎

## What this theorem is and is not

- **It is** the source's universal-property characterization of the Wood, restated in the standard categorical vocabulary.
- **It is not** a constructive existence theorem: the Wood's existence is postulated, not built from the ambient category. Establishing constructive existence in a specific ambient $\mathsf{R}$ is open.
- **It is not** a uniqueness theorem on its own — uniqueness up to isotropy is a separate result, [wood-uniqueness-up-to-isotropy](wood-uniqueness-up-to-isotropy.md), that follows from this together with the standard initial-object argument.

## Status

Sketch. Same caveats as [wood-uniqueness-up-to-isotropy](wood-uniqueness-up-to-isotropy.md) — the categorical structure of $\mathbf{Med}_{\{W_i\}}$ as a 2-category needs to be made fully explicit before the "unique up to isotropy" clause is rigorous.

## Provenance

§3.7 ("Axiom (Universal Mediating Property)") of [`wood-between-worlds.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md).
