---
name: open
type: concept
status: sketch
---

Interior operator. Dual of [Close](close.md). Contracts a recognition to the greatest [Iterate](iterate.md)-stable element contained *within* it. Deflationary, idempotent, monotone.

## What it is

`Open(a)` is the interior operator on the field of recognition, characterized by:

- **Deflationary**: $\text{Open}(a) \leq a$.
- **Idempotent**: $\text{Open}(\text{Open}(a)) = \text{Open}(a)$.
- **Monotone**: $a \leq b \implies \text{Open}(a) \leq \text{Open}(b)$.

Concretely, Open takes a recognition and refines it inward — withdraws to the greatest element contained in it that is stable under self-application.

Every closed act implies its dual: a tendency inward as well as outward. [Close](close.md) produces identity through limit; Open defines the complementary locus from which recurrence begins anew. Being breathes through this duality — an inhalation (Closure) securing form, and an exhalation (Interior) preserving freedom.

## Relationship to Close

The dual stability conditions:

1. $\text{Open}(a) \leq a$
2. $a \leq \text{Close}(a)$
3. $\text{Close}(\text{Open}(a)) = \text{Close}(a)$
4. $\text{Open}(\text{Close}(a)) = \text{Open}(a)$

In adjoint terms: $O \dashv I \dashv C$ — Open ⊣ inclusion ⊣ Close form an adjoint triple. The inclusion $I$ is the identity mediator stabilizing between Open and Close.
