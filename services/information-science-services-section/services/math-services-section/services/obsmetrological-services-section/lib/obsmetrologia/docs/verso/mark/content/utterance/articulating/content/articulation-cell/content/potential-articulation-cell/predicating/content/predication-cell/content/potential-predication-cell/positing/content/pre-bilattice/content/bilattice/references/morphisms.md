# Reference: morphisms

Each morphism is a **named export**, grouped into four modules by layer —
[`charge`](../../../src/charge.mjs) (the value-algebra), [`descent`](../../../src/descent.mjs) (the
four-regime pipeline + modal pairs), [`cone`](../../../src/cone.mjs) (the cone duals), and
[`void`](../../../src/void.mjs) (the void reads + monad). All are re-exported from the package root, so
`import { settle } from "@red-cup-engineering/metrologic/bilattice"` reaches any of them; the subpaths
(`@red-cup-engineering/metrologic/bilattice/descent`, etc.) reach one module. Each entry below gives **what it
realizes** (math) and **its shape** (in → out). Charges are [as specified here](the-charge.md).

## The descent — module [`descent`](../../../src/descent.mjs)

| morphism | realizes | in → out |
|---|---|---|
| **`articulate`** | the aperiodic root: witness a thing into a potential cell | `[left,right]` (or a void cone `{apex}`) → `{ potential: [left,right] }`. **Throws** on a missing side. |
| **`predicate`** | transfinite generator: read left=object, right=concept; form the cell-set `Φ = E×Π×E` and a value-free fiber | `{potential}` → `{ "cell-set", fiber }` |
| **`cohere`** | Beck–Chevalley coherence: transitively close the specialization order | post-`predicate` category → `{ saturated, residue }` (residue = the closed fiber) |
| **`posit`** | scott generator: **measure** each cell from its givens → potential; package as a presheaf + trace | post-`predicate` category → `{ presheaf, traces }` |
| **`commutate`** | the scott coherence: split the presheaf (substrate) from the traces (gluing residue) | post-`posit` → `{ saturated, residue }` |
| **`settle`** | the knowledge **LFP** (unit cone): iterate `◇ₖ∘□ₖ` to the least fixed point — the sheaf | post-`posit` → `{ sheaf: { base, section } }` |
| **`compare`** | the truth–knowledge coherence: split a section consistent (`⊥/t/f`) ⊕ paraconsistent (`⊤`) | section → `{ consistent, paraconsistent }` |

### The modal pairs (◇ ⊣ □), also in [`descent`](../../../src/descent.mjs)

| morphism | realizes |
|---|---|
| **`possibilizeKnowledge`** / **`necessitateKnowledge`** | `◇ₖ` (join across the fiber) / `□ₖ` (meet) — append a raised/lowered valuation to `.traces` |
| **`possibilizeTruth`** / **`necessitateTruth`** | `◇_t` / `□_t` — the truth-order modal pair, on the *same* `.traces` carrier |
| **`raiseKnowledge`** / **`lowerKnowledge`** / **`raiseTruth`** / **`lowerTruth`** | the per-valuation steps the four generators append (the fold across one valuation's fiber-algebras) |
| **`lastValuation`** | read the current state of a closure — the last valuation of a category's first trace |

## The cones and the void — modules [`cone`](../../../src/cone.mjs) and [`void`](../../../src/void.mjs)

| morphism | realizes | in → out |
|---|---|---|
| **`brim`** | the knowledge **GFP** (counit): raise the free (un-witnessed) bits, then run `settle`'s closure | post-`posit` → `{ cone: { base, section } }` |
| **`adjudicate`** | the truth **LFP**: iterate `◇_t∘□_t` on the one carrier — the verdict | post-`posit` → `{ verdict: { base, section } }` |
| **`presume`** | the truth **GFP**: raise free bits toward the truth-top (potential), then close | post-`posit` → `{ presumption: { base, section } }` |
| **`gap`** | the slack between two cone-sections: cells where their value disagrees | `{ least, greatest }` (two sections) → `{ apex: [cells], evidence: [{cell, least, greatest}] }` |
| **`vanish`** | the knowledge void cone = `gap(settle, brim)` | post-`posit` category → `{ apex, evidence }` |

## The bilattice value-ops — module [`charge`](../../../src/charge.mjs)

All take `{ left, right }` (two charges) and return a charge; the value moves by the order, the
evidence **accumulates** (lossless — see [the laws](the-laws.md)).

| morphism | value | note |
|---|---|---|
| **`joinKnowledge`** | `[a∨c, b∨d]` | knowledge lub |
| **`meetKnowledge`** | `[a∧c, b∧d]` | knowledge glb — reaches **absurd** from incompatibles |
| **`joinTruth`** | `[a∨c, b∧d]` | truth lub (`= σ∘joinKnowledge∘σ`) |
| **`meetTruth`** | `[a∧c, b∨d]` | truth glb |
| **`aggregate`** | `= joinKnowledge` | the lossless evidence join (a named reading) |

### The Klein gauge (involutions on the value)

| morphism | value | swaps |
|---|---|---|
| **`negate`** | `[b, a]` | potential↔active (truth involution) |
| **`conflate`** | `[¬b, ¬a]` | absurd↔stable (knowledge involution); the one op that may raise value above evidence (a presumption) |

### Primitives

| morphism | returns |
|---|---|
| **`present`** | the value pair (the FOUR place) |
| **`isTop`** | `value[0] && value[1]` — is it **stable**/⊤? |
| **`leqKnowledge`** | is `a ≤ₖ b` on the value? |
| **`compareKnowledge`** | `b` if `a ≤ₖ b`, else throws — the ≤ₖ witness |

## Structural & monad — module [`void`](../../../src/void.mjs)

| morphism | realizes | in → out |
|---|---|---|
| **`estrange`** | the transfinite GFP: the complement of `cohere`'s closure (pairs never related) | post-`predicate` category → `{ apex: [{source,target}] }` |
| **`saturate`** | the path monad μ: compose void edges across a shared object | `{potential: [edges]}` → `{potential: [edges, composites]}` |
| **`transfer`** | the unit η: keep only atomic (uncomposed) edges | `{potential}` → `{potential}` |
| **`twistor`** | the KZ 2-cell: `saturate` then `transfer`; residue = the accumulated concept-sequences | `{potential}` → `{ saturated, reopened, residue }` |
| **`precipitate`** | the aperiodic GFP: one unfold step over a void cone — the residue μ can't saturate | a void cone `{apex}` → `{ saturated, residue }` |

## Plumbing — module [`internal`](../../../src/internal.mjs) (not morphisms, not re-exported)

- **`stringify`** — `JSON.stringify`, for structural equality / map keys.
- **`union`** — lossless accumulation of evidence: concat two witness lists, dedup. The one operation
  the carrier admits; every value-op unions evidence with it.

## See also

- [the charge](the-charge.md) · [the four states](the-four-states.md) · [the laws](the-laws.md)
