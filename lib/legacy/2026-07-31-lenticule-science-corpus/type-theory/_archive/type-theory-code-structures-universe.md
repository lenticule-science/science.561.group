---
type: definition
class: type-former
status: current
depends-on: [universe-level]
symbol: \mathrm{Type}_i
---

# Universe

A **universe** $\mathrm{Type}_i$ is a type whose inhabitants are themselves types. A universe is needed in [dependent-type-theory](dependent-type-theory.md) so that the type formers — [pi-type](pi-type.md), [sigma-type](sigma-type.md), [identity-type](identity-type.md) — can quantify over types as data.

## Structure

A countable cumulative hierarchy:

$$
\mathrm{Type}_0 : \mathrm{Type}_1, \quad \mathrm{Type}_1 : \mathrm{Type}_2, \quad \ldots
$$

with cumulativity: every $A : \mathrm{Type}_i$ is also $A : \mathrm{Type}_{i+1}$. The strict inequality is what avoids Russell-style paradoxes (Girard's paradox would derive the [empty-type](empty-type.md) from $\mathrm{Type} : \mathrm{Type}$).

In modern proof assistants the level $i$ is usually inferred (*universe polymorphism*) and shown only when ambiguous.

## What this is not

A universe is *not* the type of all types — that would be paradoxical. A universe is *not* a set in the set-theoretic sense — its inhabitants come with their full type-theoretic structure, not just a carrier set.

## Position

The [universe-level](teaching/explanations/universe-level.md) discipline is what stratifies the theory into a paradox-free hierarchy. The [universe-lifting](../morphisms/universe-lifting.md) operation embeds $\mathrm{Type}_i$ into $\mathrm{Type}_{i+1}$. Trade-offs around impredicativity (allowing certain restricted quantifications over a universe to stay at the same level — Coq's `Prop`, the Calculus of Constructions) live at [questions/impredicativity](questions/impredicativity.md). Reference: [Martin-Löf 1984](references/martin-lof1984.md), [Univalent Foundations Program 2013](references/univalent-foundations2013.md) §A.2.
