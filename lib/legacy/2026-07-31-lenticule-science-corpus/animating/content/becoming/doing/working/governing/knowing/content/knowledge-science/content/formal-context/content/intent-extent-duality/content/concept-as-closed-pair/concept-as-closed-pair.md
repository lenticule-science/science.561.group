---
type: concept
class: structural-anchor
status: stable
depends-on: [formal-context, intent-extent-duality]
see-also: [concept-lattice, basic-theorem-of-fca]
---

# Concept as closed pair

The conceptual move from which the lineage takes its name. A **(formal) concept** of a context $(G, M, I)$ is a pair $(A, B)$ with $A \subseteq G$, $B \subseteq M$, $A' = B$, and $B' = A$ — equivalently, a *closed pair* under the [Galois connection](intent-extent-duality.md) induced by $I$. The set $A$ is the concept's **extent**; the set $B$ is its **intent**.

Wille (1982) proposed this as the formal counterpart of the philosophical *concept*: a concept's intent is the collection of attributes that characterise it; its extent is the collection of objects that fall under it; and the closure conditions $A' = B, B' = A$ enforce the Aristotelian principle that intent and extent determine each other (extension and comprehension are reciprocally constrained).

## Why "closed pair" rather than "any pair"

A pair $(A, B)$ with $A \subseteq G, B \subseteq M$ is a candidate concept; it is a *concept* only when both closure conditions hold. The closure conditions exclude two failure modes:

- **Under-specified intent.** $(A, B)$ with $B \subsetneq A'$ — the intent omits attributes shared by all objects in $A$. The concept is "really" $(A, A')$; $B$ is an incomplete description.
- **Under-specified extent.** $(A, B)$ with $A \subsetneq B'$ — the extent omits objects sharing all attributes in $B$. The concept is "really" $(B', B)$; $A$ is an incomplete enumeration.

Closing under the Galois connection picks the unique maximal-extent / maximal-intent representative of each "really there" concept. The basic theorem of FCA then establishes that these representatives form a complete lattice under extent inclusion (see [basic-theorem-of-fca](../theorems/basic-theorem-of-fca.md)).

## Concept hierarchy

Concepts of $(G, M, I)$ are ordered by **extent inclusion**: $(A_1, B_1) \le (A_2, B_2) \iff A_1 \subseteq A_2$, equivalently $\iff B_2 \subseteq B_1$. The smaller concept is the *sub-concept*; the larger is the *super-concept*. The intent shrinks as the extent grows — the standard Aristotelian inverse relation between intension and extension.

## Three points to keep separate

Three notions are sometimes conflated and the FCA lineage keeps them separate:

- The *philosophical* concept (e.g., "mammal" as a category in zoology) — a content-bearing notion of a knowledge community.
- The *formal* concept of a particular context (e.g., the closed pair $(\{\text{lion}\}, \{\text{has-fur}, \text{lives-on-land}\})$ in a small zoological context) — a mathematical object derived from the context.
- The *concept lattice* of a context (e.g., the hierarchy of all formal concepts of the zoological context) — the structural invariant the lineage extracts.

Wille's claim is that the formal concepts of a well-chosen context approximate the philosophical concepts of the community whose attribute vocabulary supplied $M$. The approximation is not exact; it is a working hypothesis that the FCA lineage operationalises, refines, and tests against domain after domain.
