---
name: bilattice
description: "A pre-bilattice equipped with a unary negation ~ that is antitone in the truth order, monotone in the knowledge order, and involutive. The five-operation algebra B = ⟨B, ∧_t, ∨_t, ∧_k, ∨_k, ~⟩. The codomain-carrier structure of every predication-cell — what predicating's evidence-injection function v ↦ v ∨_k δ_{(φ,q)} operates on."
symbol: "B"
realizes: [knowledge-order, truth-order]
depends-on: [pre-bilattice, negation, twist-product]
derives-from: docs/dev/scraps/bilattice.md
---

# Bilattice

A pre-bilattice (the structure twist-product produces) equipped with a unary **negation** `~` satisfying three axioms. The full algebra is

$$\mathbf{B} \;=\; \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k, \sim \rangle.$$

## The negation axioms

- **Antitone in the truth order:** `a ≤_t b ⟹ ~b ≤_t ~a`. Negation reverses the truth-order. Classical logic gets this right: "not p" is false where "p" is true and true where "p" is false.
- **Monotone in the knowledge order:** `a ≤_k b ⟹ ~a ≤_k ~b`. Negation preserves how much evidence is held — if more is known about `a`, more is known about `~a`. This is what classical logic LOSES: classical negation is involutive but the knowledge axis is collapsed, so monotonicity-in-knowledge doesn't even make sense.
- **Involutive:** `~~a = a`. Negating twice returns the original value.

These three axioms together force the negation to be the **diagonal-reflective** operation on the bilattice: it exchanges positive and negative evidence while preserving how-much-evidence and reversing truth-direction.

## On a twist product: coordinate swap

When the bilattice comes from a twist product `L^⋈`, the negation is the **coordinate swap**:

$$\sim\langle a, b\rangle \;=\; \langle b, a\rangle.$$

The first coordinate (positive evidence) and second coordinate (negative evidence) trade places. Avron's representation theorem says every interlaced bounded bilattice is `L^⋈` for some `L`, so this coordinate-swap is the *canonical* form of bilattice negation up to isomorphism.

## Distributivity transfer

When the underlying lattice `L` is distributive, the twist-product `L^⋈` is also distributive, and so the bilattice built on it. Distributivity of `L` transfers to all twelve distributive laws on the bilattice — `x ∘ (y • z) ≈ (x ∘ y) • (x ∘ z)` for distinct `∘, • ∈ {∧_t, ∨_t, ∧_k, ∨_k}`.

So distributivity is **inherited** through the construction `lattice → twist-product → pre-bilattice → bilattice`. The shape of the bilattice is determined by `L`'s shape.

## Optional structure: conflation

A bilattice MAY additionally carry a **conflation** `−`: antitone in `≤_k`, monotone in `≤_t`, involutive. Negation and conflation are **dual operators** — negation swaps the truth-asymmetric values (`t ↔ f` on FOUR) while fixing the truth-neutral ones (`⊥, ⊤`); conflation swaps the knowledge-asymmetric values (`⊥ ↔ ⊤` on FOUR) while fixing the knowledge-asymmetric ones (`t, f`).

When both are present, they are typically required to **commute**: `~ ∘ − = − ∘ ~`. The four operators `{id, ~, −, ~−}` then form a **Klein-four group** acting on the bilattice — the `internal-z2-gauge × internal-z2-gauge` symmetry that the substrate's value algebra carries.

## Avron's representation theorem

**Theorem.** Every **interlaced** bounded bilattice is isomorphic to `L^⋈` for some bounded lattice `L`.

*Interlaced* means: each of the four lattice operations is monotone with respect to BOTH orders. (E.g., `a ≤_t a'` and `b ≤_t b'` imply `a ∧_k b ≤_t a' ∧_k b'` — `∧_k` respects `≤_t`.)

The theorem says the twist-product construction is **universal**: every interlaced bounded bilattice arises this way. So the chain `lattice → twist-product → bilattice` doesn't lose generality among interlaced cases; it produces all of them.

For non-interlaced bilattices the theorem fails — those bilattices need a separate construction. The substrate's bilattices are all interlaced (the four-regime tower presupposes interlacing), so Avron's representation suffices for all substrate work.

## Position in the variety chain

The path is the derivation:

```
variety → lattice → twist-product → pre-bilattice → bilattice → four-bilattice
```

- `variety` — the meta-level (an algebraic variety).
- `lattice` — bounded distributive lattice as carrier.
- `twist-product` — construction `L ⋈ L` producing a pre-bilattice.
- `pre-bilattice` — the structure twist-product produces (no negation yet).
- `bilattice` — this $thing: pre-bilattice + negation. Equipping with negation is the structural step.
- `four-bilattice` — specialization at `L = 2`. The smallest non-trivial bilattice; the canonical FOUR.

Each step adds one layer of structure. By the time the chain reaches `bilattice`, the algebra is the codomain-carrier of every predication-cell value.

## Why bilattices are exactly what predication needs

The CLAUDE.md "Fregean predication forces FOUR" central result derives FOUR (the four-element bilattice) from Frege's two-slot saturation. The derivation shows:

1. Predication has two slots (subject, object).
2. Each slot is binary (saturated or not).
3. The slots are independent.
4. Two independent binary statuses give exactly four joint states.
5. None of the four is redundant.
6. The four carry two independent orders (knowledge and truth).

The conclusion: the codomain-carrier of predicating IS the four-element bilattice FOUR, and (by Avron) generalizes to `L^⋈` for `L ≠ 2` — the larger bilattices that arise when one wants more-than-Boolean truth at each slot.

So bilattices are not "an interesting value algebra one *could* use for predication." They are the **structurally forced** value algebra. The bilattice $thing here implements what the FOUR derivation theoretically guarantees.

## Worked example: FOUR with explicit operations

Take `L = 2 = {0, 1}`. Then `FOUR = 2^⋈` has carrier `{(0,0), (0,1), (1,0), (1,1)}`, conventionally written

$$\bot = (0, 0), \qquad \mathbf{f} = (0, 1), \qquad \mathbf{t} = (1, 0), \qquad \top = (1, 1).$$

Operations (pointwise on coordinates):

**Knowledge meet `∧_k` (both coordinates min):**

|  ∧_k | ⊥ | t | f | ⊤ |
|---|---|---|---|---|
| ⊥ | ⊥ | ⊥ | ⊥ | ⊥ |
| t | ⊥ | t | ⊥ | t |
| f | ⊥ | ⊥ | f | f |
| ⊤ | ⊥ | t | f | ⊤ |

**Knowledge join `∨_k` (both coordinates max):**

|  ∨_k | ⊥ | t | f | ⊤ |
|---|---|---|---|---|
| ⊥ | ⊥ | t | f | ⊤ |
| t | t | t | ⊤ | ⊤ |
| f | f | ⊤ | f | ⊤ |
| ⊤ | ⊤ | ⊤ | ⊤ | ⊤ |

**Truth meet `∧_t` (first min, second max):**

|  ∧_t | ⊥ | t | f | ⊤ |
|---|---|---|---|---|
| ⊥ | ⊥ | ⊥ | f | f |
| t | ⊥ | t | f | ⊤ |
| f | f | f | f | f |
| ⊤ | f | ⊤ | f | ⊤ |

**Truth join `∨_t` (first max, second min):**

|  ∨_t | ⊥ | t | f | ⊤ |
|---|---|---|---|---|
| ⊥ | ⊥ | t | ⊥ | t |
| t | t | t | t | t |
| f | ⊥ | t | f | ⊤ |
| ⊤ | t | t | ⊤ | t |

**Negation `~` (coordinate swap):**

| `a` | `~a` |
|---|---|
| `⊥ = (0,0)` | `(0,0) = ⊥` |
| `t = (1,0)` | `(0,1) = f` |
| `f = (0,1)` | `(1,0) = t` |
| `⊤ = (1,1)` | `(1,1) = ⊤` |

So negation fixes `⊥, ⊤` (truth-neutral) and swaps `t ↔ f` (truth-asymmetric), as expected.

## Position

`twist-product/library/bilattice/`. The bilattice IS the twist-product equipped with negation. The path tells the construction story.

## Derivation source

Adapted from `predication-categories/objects/bilattice.md`, preserved verbatim at `docs/dev/scraps/`. The archive's Lean module reference is `PredicationCategories.Homebrew.Algebra.Bilattice.Bilattice`.
