---
name: character
description: A nuclear endomorphism χ on the Heyting algebra H of an entity's fiber — the agent-side dispositional nucleus, idempotent and monotone and inflationary, whose fixed-point sublattice F_χ is the entity's behavioral space.
---

The **agent-side dispositional nucleus**.
Formally: a nucleus χ on the Heyting algebra H of the entity's fiber, distinct from the institutional saturation nucleus σ and the temporal transfer nucleus Δ.

A character is what makes "this agent characteristically does X" a stable, idempotent, monotone, inflationary fact about the agent.
The fixed-point sublattice F_χ = Fix(χ) ⊆ H is the agent's **behavioral space**: the propositions the character fully endorses.
Acting in character means producing elements of F_χ.
An action b such that χ(b) ≠ b is acting *out of character* — the character nucleus would have amplified b further toward F_χ.

This is the formal kernel of "the soul."
When [governing-soul](#) is read as a nucleus on a *scope's* fiber, character is the entity-level analog.

## Formal definition

A character is a pair (χ, F_χ) where:

- χ : H → H is a nuclear endomorphism in the relational universe R = Sh(T, J) — at each history t, χ_t is idempotent (χ²=χ), monotone (a≤b ⇒ χa≤χb), inflationary (a ≤ χa).
- F_χ = Fix(χ) is the sub-Heyting-algebra of fixed points.

The four invariants for a nucleus to be a character: nucleus condition, distinctness from σ and Δ, non-degeneracy (F_χ ≠ ∅ and F_χ ⊊ H), internal naturality (χ commutes with sheaf restriction).

## Distinguishing predication-shape

- `is-nucleus-of(character, entity-fiber)` — the bearer of the χ.
- `behavioral-space(character, sublattice)` — the F_χ.
- `commutes-with-σ(character, bool?)
  ` and `commutes-with-Δ(character, bool?)
  ` — open questions about coherence with the institutional nuclei.

## Step-induction role

Closure-rule consultation: when an agent proposes a witness, closure rules consult the agent's character nucleus to determine whether the witness lies in F_χ.
If not, the witness is flagged as out-of-character before it lands.
This is the cell-graph analog of "the agent isn't acting like themselves."

Soul-violation detection at scope-level (governing-soul) uses the same machinery, applied to the scope's fiber.

## Not synonymous with

- **Persona** — persona is the entity bearing the character; character is the algebraic structure.
  A persona can act out of its character (and the records note this).
- **Soul** (scope-level) — soul is the scope-level analog; character is the entity-level analog.
  Same shape, different domain.

## Provenance

This formalization predates the predication-categories family but the definition carries through.
The original definition is captured in pre-predication triage:

- `old-archive/triage/engineering-archive/library/triage/from-tech-bucket-2/character.md` — full formal definition with proofs of meet-preservation, idempotence, etc. Cross-references σ and Δ from the same triage bucket.

Promoting character into the predication-categories family is a follow-up theory task; it requires showing that character-nucleus theorems carry over from the relational-universe formalization to the closure-2-monad / bilattice formalization.
