---
type: question
class: bridge
status: open
date-created: 2026-05-01
explores: [predication-hyperdoctrine, modal-necessity-operator, modal-possibility-operator, bilattice-accessibility-relation]
---

# Is there a deontic hyperdoctrine over the predication fibration?

The engineering theory's [governance-as-modal-restriction](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md) characterizes governance as modal restriction on the agent's capability fiber, indexed by a [world set](../objects/world-set.md) of governance contexts and equipped with a [bilattice accessibility relation](../objects/bilattice-accessibility-relation.md).
The four Hohfeldian positions (power, duty, privilege, immunity) are different shapes on the accessibility relation.

The math program has [modal-necessity-operator](../morphisms/modal-necessity-operator.md) $\Box_R$ and [modal-possibility-operator](../morphisms/modal-possibility-operator.md) $\Diamond_R$ acting on world-indexed valuations.
These give *alethic* modalities — what *is* necessarily/possibly the case.

The engineering case is *deontic* — what *should* be done, what is permitted, what is obligatory, what is forbidden.
The four Hohfeldian positions map to deontic modalities:

- **Duty** ↔ obligation: $O(\text{action})$ — the agent must perform.
- **Privilege** ↔ permission: $P(\text{action})$ — the agent may perform.
- **Power** ↔ deontic-possibility-of-state-change: $P(\text{outcome})$ via the agent's action.
- **Immunity** ↔ deontic-impossibility-of-other's-state-change: $\neg P(\text{outcome-by-other})$.

**The question:** Does the predication hyperdoctrine extend cleanly to a deontic hyperdoctrine — one whose quantifier adjoints, Frobenius reciprocity, and Beck-Chevalley coherence carry the deontic modalities?
Specifically:

1. **What is the deontic accessibility-relation structure?** The bilattice accessibility relation handles alethic; deontic accessibility needs to encode "ought" relationships between worlds.
  Standard deontic logic (Kanger, Hilpinen) uses a separate "ideal worlds" relation; can the predication hyperdoctrine accommodate this without leaving the bilattice setting?

2. **Are the four Hohfeldian positions structurally complete?** Hohfeld's analysis is widely-used in legal theory; its formal completeness as a deontic structure on the predication hyperdoctrine is open.

3. **Does the deontic extension preserve [closure-2-monad lax-idempotence](../theorems/closure-2-monad-lax-idempotence.md)?** Governance updates change the accessibility relation; if the deontic hyperdoctrine's closure operator changes structurally with $R$-updates, does lax-idempotence still hold?

4. **Cross-substrate deontic coherence.** When two federated substrates have different governance structures (different office graphs, different authority chains), how does the deontic accessibility relation merge?
  Does [federation-convergence](../theorems/crdt-convergence.md) extend?

## Why this matters

Governance is a substantive engineering concern — the platform's [agential-orchestration-platform](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/) currently uses the modal apparatus informally.
A formal deontic hyperdoctrine would give the engineering theorems a clean structural foundation, especially for cross-substrate governance scenarios that currently rely on ad-hoc reasoning.

## Position in the program

Open.
The math program has the alethic modal apparatus; the deontic extension is a potentially-substantial generalization.
