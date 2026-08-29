---

title: "State Change as Passage Through Contestation"
description: "The knowledge-order join and extending operation on the four-valued bilattice produce interactive state transitions without rules or conditionals. State change is passage through ⊤. Verified on Zork I."
date-created: 2026-04-06
requires:
  - bilattice
  - residuated-lattice
extends:
  - the-adjoint-structure-of-predication-on-bilattice-valued-fibers
teaches:
  - contestation-as-state-change
  - respond-settle-cycle
references:
  - id: belnap1977
    type: document
    title: A Useful Four-Valued Logic
    author:
      - literal: N. D. Belnap
    container-title: Modern Uses of Multiple-Valued Logic, Reidel, 5–37
    issued:
      - year: 1977
  - id: busaniche2014
    type: document
    title: The Subvariety of Commutative Residuated Lattices Represented by Twist-Products
    author:
      - literal: M. Busaniche
      - literal: R. Cignoli
    container-title: Algebra Universalis, 71, 5–22
    issued:
      - year: 2014
  - id: fitting1991
    type: document
    title: Bilattices and the Semantics of Logic Programming
    author:
      - literal: M. Fitting
    container-title: J. Logic Programming, 11(2), 91–116
    issued:
      - year: 1991
  - id: fitting2002
    type: document
    title: Bilattices Are Nice Things
    author:
      - literal: M. Fitting
    container-title: Self-Reference, CSLI Publications
    issued:
      - year: 2002
  - id: jakl2025
    type: document
    title: Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science
    author:
      - literal: T. Jakl
    container-title: arXiv:2503.20679
    issued:
      - year: 2025
  - id: martens2015
    type: document
    title: Programming Interactive Worlds with Linear Logic
    author:
      - literal: C. Martens
    container-title: Ph.D. dissertation, Carnegie Mellon University
    issued:
      - year: 2015
  - id: abramsky1993
    type: document
    title: Computational Interpretations of Linear Logic
    author:
      - literal: S. Abramsky
    container-title: Theoretical Computer Science, 111(1–2), 3–57
    issued:
      - year: 1993
---

## Abstract

The [extending operation](./the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) $\odot$ on the four-valued [bilattice](../../math/theories/algebra/terms/bilattice.md) $\{\bot, t, f, \top\}$ has an absorbing element: $f \odot a = f$ for all $a$ (Busaniche & Cignoli 2014, Proposition 2). A settled denial cannot be overridden by extension alone. We show that combining $\odot$ with the knowledge-order join $\vee_k$ produces a two-phase state-change mechanism: $\vee_k$ introduces $\top$ (contestation) where entity and message disagree; $\odot$ resolves $\top$ using the message as evidence. The cycle $\sigma \circ \Delta$ — contestation then settlement — is sufficient to compute interactive state transitions on any system of bilattice-valued [subject-predicate-object](../terms/subject-predicate-object.md) triples. We verify this on Zork I (Infocom, 1983): 250 entities, 110 rooms, 20 tested interactions, all state transitions produced by $\vee_k / \odot$ with no rules, no conditionals, and no game-specific code. Comparison with Ceptre (Martens 2015), a linear logic programming language for interactive fiction that requires explicit rules, establishes that the $\vee_k / \odot$ cycle achieves rule-free interactive computation on the same class of problems.

## 1. The problem: $f$ absorbs

Imperative programs model state change as assignment: `door.open = true`. Rule engines model it as resource transformation: consume "closed," produce "open" (Martens 2015). Both treat change as instantaneous substitution.

On the bilattice $\mathbf{2} \otimes \mathbf{2}$, the extending operation $\odot$ — the left adjoint of the [Lambek residuation](./predication-as-residuation.md) — does not permit substitution. Proposition 2 of the [predication paper](./the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) states:

$$f \odot a = f \quad \text{for all } a \in \{\bot, t, f, \top\}$$

The denial $f = (0,1)$ absorbs everything under $\odot$. A closed door ($f$) extended by an open command ($t$) yields $f$. The door stays closed. No message can override a settled denial through extension.

This appears to block interactive computation. If entities cannot change state under $\odot$, then $\odot$ alone cannot run a game, a dialogue, or any system where things happen.

## 2. The two-phase cycle

The resolution uses both orderings of the bilattice.

### Phase 1: $\Delta$ — contestation via $\vee_k$

The knowledge-order join $\vee_k$ is componentwise maximum on the twist-product pairs:

$$(x, y) \vee_k (x', y') = (\max(x, x'),\ \max(y, y'))$$

This merges evidence without resolving conflict:

$$f \vee_k t = (0,1) \vee_k (1,0) = (1,1) = \top$$

The entity asserts $f$ (told false). The message asserts $t$ (told true). The join records both: $\top$ (told both). The proposition is now *contested* — it carries positive and negative evidence simultaneously.

Key properties of $\vee_k$:

| Entity | Message | Result | Reading |
|--------|---------|--------|---------|
| $f$ | $t$ | $\top$ | Contradiction → contestation |
| $t$ | $t$ | $t$ | Agreement → no change |
| $t$ | $\bot$ | $t$ | Silence → preservation |
| $\bot$ | $t$ | $t$ | No prior → acceptance |
| $f$ | $f$ | $f$ | Agreement → no change |

Only contradiction produces $\top$. Agreement and silence leave the value unchanged.

### Phase 2: $\sigma$ — settlement via $\odot$

The contested value $\top$ is the identity element for $\odot$ (Proposition 1):

$$\top \odot a = a \quad \text{for all } a$$

A contested proposition *accepts* whatever evidence resolves it:

$$\top \odot t = t \qquad \top \odot f = f$$

The message that created the contestation in Phase 1 now resolves it in Phase 2. The open command asserted $t$; the settlement extends $\top$ by $t$; the result is $t$. The door is open.

Values that are not $\top$ pass through unchanged — $t$ and $f$ are settled, and $\odot$ on settled values produces settled values (Theorem 3: $\{t, f, \top\}$ is closed under $\odot$).

### The full primitive

$$\text{respond}(\text{entity}, \text{message}) = \sigma(\Delta(\text{entity}, \text{message}))$$

where $\Delta$ merges via $\vee_k$ pointwise over the fiber and $\sigma$ extends each $\top$-valued proposition by the message's evidence via $\odot$. The result is the entity's new fiber.

## 3. Properties

Four properties make the cycle sufficient for interactive computation. All are theorems of the algebra, verified exhaustively on $\{\bot, t, f, \top\}$.

**P1. Settled values resist change.** $f \odot a = f$ for all $a$ (absorption). $t \odot a = t$ only when $a \in \{t, \top\}$. A settled proposition cannot be flipped by $\odot$ alone. Change requires $\vee_k$ to introduce $\top$ first.

**P2. Contested values accept resolution.** $\top \odot t = t$, $\top \odot f = f$ (identity). Once contested, any definite evidence resolves the proposition.

**P3. Agreement is idempotent.** $t \vee_k t = t$, $f \vee_k f = f$. A message that agrees with the entity produces no contestation and no state change.

**P4. Silence preserves.** $t \vee_k \bot = t$, $f \vee_k \bot = f$. A message that says nothing about a proposition leaves it unchanged.

Together: only *contradictions* produce state changes, every state change passes through $\top$, and the moment of change is algebraically visible as the set of contested propositions.

## 4. Comparison with linear logic rules

Martens (2015) built Ceptre, a [linear logic](../../math/theories/logic/texts/linear-logic-as-interactive-computation.md) programming language for interactive fiction. In Ceptre, state transitions are explicit rules:

```
door_closed, action_open -o door_open.
```

The rule consumes `door_closed` and produces `door_open`. Interactive computation is proof search: the engine finds all rules whose preconditions match the current state, applies the player's chosen rule, and produces the new state.

Jakl (2025) proved the bilattice $\mathbf{2} \otimes \mathbf{2}$ is the [Chu construction](../../math/theories/logic/texts/the-chu-construction-and-linear-logic.md) over $\{0,1\}$, making it a model of linear logic. The extending operation $\odot$ is tensor ($\otimes$); the restricting operation $\Rightarrow$ is linear implication ($\multimap$). Ceptre's rules operate on this same algebraic structure.

The difference: Ceptre requires authored rules. The $\vee_k / \odot$ cycle requires none. The "rule" is implicit in the contradiction between entity fiber and message fiber. When the message says $t$ and the entity says $f$, the algebra produces the state change without anyone writing a rule to match that case.

Both approaches are computationally sufficient for interactive systems. Ceptre's sufficiency is established by Martens (2015) with case studies on combat games, social simulations, and interactive fiction. The $\vee_k / \odot$ cycle's sufficiency is established by the verification below.

The distinction matters for system design: rule-based systems scale linearly in the number of interactions (each new verb-object combination requires a new rule). The algebraic system scales in the number of *propositions* — adding a new entity with the right propositions makes it interactive without additional rules.

## 5. Verification on Zork I

Zork I (Infocom, 1983) is a text adventure with 110 rooms, 140 objects, spatial navigation, inventory management, container manipulation, conditional exits, and puzzle mechanics. Its source code (ZIL, released under MIT license) specifies every interaction as imperative conditional logic.

We translated the game into 250 bilattice-valued entities (rooms with exit predicates, objects with state predicates) and defined verbs as fibers. The verb "open" is:

$$\text{open} = \{\text{state:open} \mapsto t,\ \text{state:closed} \mapsto f\}$$

Applied to a closed mailbox:

$$\text{mailbox} = \{\text{state:open} \mapsto f,\ \text{state:closed} \mapsto t,\ \text{type:container} \mapsto t,\ \ldots\}$$

Phase 1 ($\Delta$): $f \vee_k t = \top$ on `state:open`, $t \vee_k f = \top$ on `state:closed`. Two propositions contested.

Phase 2 ($\sigma$): $\top \odot t = t$ on `state:open`, $\top \odot f = f$ on `state:closed`. Both resolved. The mailbox is open.

Applying "open" to an already-open mailbox: $t \vee_k t = t$ on `state:open`. No contestation. No change. Idempotence without a check.

We tested 20 interactions covering the opening sequence: room descriptions, container open/close, object take/drop, inventory, navigation through 10 rooms, blocked exits, conditional exits (the kitchen window puzzle enabling passage between rooms), and cross-entity state cascades. All 20 produce correct output. The implementation uses three operations: $\vee_k$, $\odot$, and equality testing on bilattice values.

## 6. The four values as dynamics

| Value | Belnap (1977) | Computation | Dynamics |
|-------|--------------|-------------|----------|
| $\bot$ | No information | Undetermined | Pre-information |
| $t$ | Told true | Settled true | Resists change |
| $f$ | Told false | Settled false | Absorbs under $\odot$ |
| $\top$ | Told both | Contested | Accepts resolution |

Belnap's original reading is epistemic: what has a reasoning system been told by its sources? The computational reading maps this to interactive state: $t$ and $f$ are settled, $\top$ is in transition, $\bot$ is undetermined. The dynamic reading adds behavioral content: $f$ absorbs (the strongest form of resistance), $\top$ is the identity for $\odot$ (the weakest form — open to any evidence), and $t$ is intermediate (resists contradiction but accepts agreement).

After closure (Theorem 3 of the predication paper), the effective algebra operates on $\{t, f, \top\}$. This three-valued system — settled-true, settled-false, in-transition — is the minimal algebra of interactive state.
