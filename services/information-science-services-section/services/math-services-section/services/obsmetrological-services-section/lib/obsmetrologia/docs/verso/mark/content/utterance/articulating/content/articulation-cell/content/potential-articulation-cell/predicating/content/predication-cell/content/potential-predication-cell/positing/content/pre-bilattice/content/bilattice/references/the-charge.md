# Reference: the charge

A **charge** is the value a cell carries. It is a plain object:

```js
{ value: [a_pos, a_neg], evidence: [pos_witnesses, neg_witnesses] }
```

- `value` — two booleans: `a_pos` (is the positive side asserted?) and `a_neg` (the negative side).
  This is the bilattice pair `⟨a₊, a₋⟩`; its four settings are the [four states](the-four-states.md).
- `evidence` — two arrays: the witnesses backing each side. A witness is any term (in the tests, a
  random hashed id or a nested `[left, right]`); the kernel never inspects a witness, only its
  presence and identity.

## Math ⟷ software

| math | software |
|---|---|
| `⟨a₊, a₋⟩ ∈ L^⋈` (a point of the twist product) | `charge.value` (the `L = 2` case) |
| the richer degree `a₊ ∈ L` (a *set* of witnesses) | `charge.evidence[0]` |
| "positive evidence is present" | `charge.value[0] === true` |
| the four-valued reading `FOUR` | `value`, via [`present`](morphisms.md) / [`is-top`](morphisms.md) |

The `value` is the thin (presence) reading; the `evidence` is the thick (witnessed) content. The
archive folds both into the single pair `⟨a₊, a₋⟩` by choosing `L` to be a lattice of witness-sets;
the kernel keeps them as two fields so a *presumption* can raise the value without inventing a witness
(see the invariant below).

## The invariant

For a *measured* charge, `value` agrees with evidence-presence: a side's bit is set iff that side has
a witness. Two morphisms deliberately break that, and only these two:

- **`conflate`** (and the cone ceilings `brim`/`presume`) may set a value bit `true` with **empty**
  evidence — a *presumption*, the lattice top reached without a telling. This is how the GFP cones
  raise the free bits, and how `conflate(absurd) = stable` produces ⊤ with no witnesses.
- otherwise every op keeps `value ≤ presence(evidence)`.

## Reading and comparing

- `present(charge)` → the `value` pair (the FOUR place). *(`present.mjs`)*
- `is-top(charge)` → `value[0] && value[1]` — is it **stable** / ⊤? *(`is-top.mjs`)*
- `leq-knowledge(a, b)` → is `a ≤_k b` on the value (each side may gain assertion, never lose it)?
  *(`leq-knowledge.mjs`)*

Equality is structural (`JSON.stringify`), so two charges are the same iff the same value **and** the
same accumulated witnesses — the lossless carrier distinguishes "absurd, told nothing" from "absurd,
two conflicting tellings that cancelled."

## See also

- [the four states](the-four-states.md) · [morphisms](morphisms.md) · [the laws](the-laws.md)
- explanation: [evidence — the carrier](../explanations/evidence-the-carrier.md)
