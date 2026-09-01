---
id: relational-state
description: "A RelationalState is the State of a RelationalMachine: the full presheaf H: M^op → HA_nucl of fiber Heyting algebras indexed by the history monoid, with restriction maps between fibers and two commuting nuclei on each fiber."
extends: State
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  history-monoid: relational-history
  fiber-family: relational-universe-morphism
  restriction-maps: relational-universe-morphism
output: relational-universe
ast:
  nuclear-presheaf:
    - history-monoid
    - fiber-family:
        - history-monoid
    - restriction-maps:
        - fiber-family
        - history-monoid
    - commuting-nucleus-pair:
        - fiber-family
---

# Relational State

## What this is

A **RelationalState** is the [State](state.md) type of a [RelationalMachine](relational-machine.md).
It is a presheaf $H: M(\Sigma, I)^{op} \to \mathbf{HA}_\mathrm{nucl}$: a family of fiber Heyting algebras $H_t$ indexed by histories $t \in M(\Sigma, I)$, with restriction maps $\rho: H_{t'} \to H_t$ for $t \leq t'$.

A RelationalState is not a single fiber.
It is the entire indexed family — all fibers simultaneously present, connected by the restriction maps.

## Sections and fibers

A **section** of the RelationalState at history $t$ is $H_t$ — the fiber Heyting algebra at that history.
$H_t$ is what the RelationalMachine holds "in focus" at history $t$ — formally, a [Focus](focus.md) $(H, t)$.

The **settled sub-state** at $t$ is $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ — the image of the composite retraction $\pi_t = \sigma_t \circ \Delta_t$.
$H^*_t$ is the portion of $H_t$ with stable truth values under both nuclei.

## Mathematical grounding

The fiber Heyting algebra structure is established in the math entitys for the relational machine.
The presheaf axioms (identity and composition of restriction maps) are part of the accord condition — [accord](../math/accord.md).
The two commuting nuclei $\sigma_t$ and $\Delta_t$ are established in [nucleus](../math/nucleus.md) and the fiber algebra math entitys.
A RelationalState MUST be a presheaf over $M(\Sigma, I)^{op}$ valued in Heyting algebras with nuclei.
Its restriction maps MUST be Heyting algebra homomorphisms — [accord](../math/accord.md).
Each fiber MUST carry two commuting nuclei $\sigma_t$, $\Delta_t$ — [nucleus](../math/nucleus.md).
$\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ MUST hold — commutativity, proved in the math layer.

## Relation to flat State

A flat [State](state.md) is a set element — structureless.
A RelationalState is algebraically rich: each fiber is a Heyting algebra, the fibers are connected by Heyting algebra homomorphisms (the restriction maps), and each fiber carries two commuting nuclei.
The flat-set projection of a RelationalState is just the carrier set of the current fiber $H_t$ — it loses the algebraic structure, the nuclei, and the restriction maps.

## Open questions

- Whether the RelationalState must be a sheaf (not just a presheaf) — the sheaf condition corresponds to the accord/gluing condition and is what makes global sections well-defined.
  Currently treated as a sheaf; the exact statement is in [accord](../math/accord.md).
