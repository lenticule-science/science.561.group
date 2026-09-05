# Knowledge and truth are σ-dual

The two orders aren't two separate developments — they're **one structure seen twice**, swapped by a
single involution σ. This is why the kernel's truth side is a mirror of its knowledge side, and why
the Klein gauge lives where it does.

## The order-swap σ

Define `σ : absurd↔active, potential↔stable` — in bits, `⟨a, b⟩ ↦ ⟨a, ¬b⟩` (flip the negative side
only). σ carries the knowledge order onto the truth order:

```
math:  σ : (FOUR, ≤ₖ) → (FOUR, ≤_t) is an order isomorphism, and σ² = id
code:  sigma(c) = { value: [c.value[0], !c.value[1]], evidence: c.evidence }
```

Because σ swaps the orders, every knowledge-order construction has a truth-order twin obtained by
σ-conjugation. The cleanest instance, which the [law tests](../references/the-laws.md) check on random
charges:

```
math:  joinT = σ ∘ joinK ∘ σ      meetT = σ ∘ meetK ∘ σ
code:  joinT({left,right}) === sigma(joinK({left: sigma(left), right: sigma(right)}))
```

So `join-truth` and `meet-truth` aren't independent definitions — they are the knowledge ops read
through σ. The whole truth side (`adjudicate`, `presume`, the truth modal pair) is the σ-conjugate of
the knowledge side, reading the *same* carrier.

## The gauge acts on the value, not the cones

σ joins two more involutions on the value to form the **Klein-four gauge** and (with σ) the 8-element
`G₈`:

| op | bits | reverses |
|---|---|---|
| `negate` | `[b, a]` | the truth order (potential↔active) |
| `conflate` | `[¬b, ¬a]` | the knowledge order (absurd↔stable) |
| σ | `[a, ¬b]` | swaps the two orders |

These all act on the **value** `⟨a₊, a₋⟩` — the bilattice point. They are *value* symmetries. A
tempting mistake (we made it) is to think a cone's GFP is just the `conflate`-dual of its LFP. It
isn't, because `conflate` *fixes* potential and active (`conflate(potential) = potential`), so a
conflate-dual `brim` collapses to `settle`. The cones need to know which bits are **free** — that's
*evidence* information, invisible to a value involution. So:

> **the Klein gauge is on the value; the cones are on the evidence.** Different axes.

(See [the two cones and the void](the-two-cones-and-the-void.md) for the evidence-driven cones.)

## Where the gauge earns its keep

On the value, the gauge organizes the states (the orbits `{absurd, stable}` and `{potential, active}`)
and — via `conflate` swapping absurd↔stable — bridges the two voids: the under-determined `vanish`
(slack) and the over-determined `compare` paraconsistent locus (⊤ cells). That bridge is where the
truth/knowledge cohomology `F^(k) ≅ F^(t) ⊕ F^(⊤)` attaches — the open thread in `TODO.md`.

## See also

- reference: [the four states](../references/the-four-states.md) (the gauge table) · [the laws](../references/the-laws.md) (the σ-conjugation check)
- explanation: [the two cones and the void](the-two-cones-and-the-void.md) · [one adjunction, three faces](one-adjunction-three-faces.md)
