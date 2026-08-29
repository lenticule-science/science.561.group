---
type: example
status: documented
instantiates: [predication-substrate, operator, identity-by-relations]
---

# A pure-algebra engine for the substrate's value-domain

A working JavaScript implementation of the substrate's [value-domain algebra](teaching/explanations/predication-substrate.md) is a stateless, dependency-free package that exposes the four-valued bilattice $\{\bot, t, f, \top\}$, the residuated pair $\odot \dashv \Rightarrow$, the five morphism classes (specialization, inversion, composition, fusion, implication) and the constraint detector. The package's public surface is the substrate's algebraic primitives — nothing else. There is no I/O, no state, no event log, no reducer registry; just functions over plain data.

This example traces what a substrate engineer gets at the algebra layer and what they explicitly do *not* get.

## What the algebra package exposes

Four classes of primitive:

- **Value-domain operations.** `fuse(a, b)` for $\odot$ (extending), `restrict(a, b)` for $\Rightarrow$ (restricting), `negate(v)` for the involution that swaps positive and negative evidence, `truthMeet`/`truthJoin` for the truth-order $\leq_t$, `knowledgeMeet`/`knowledgeJoin` for the knowledge-order $\leq_k$. The four values $\{\bot, t, f, \top\}$ are exposed as named constants. `verifyAdjunction()` runs an exhaustive check on all 64 triples $(a, p, q)$ that $a \odot p \leq_t q$ iff $p \leq_t (a \Rightarrow q)$ — verifying [@adjoint-structure-spo-bilattice] Theorem 1 directly in the runtime.

- **Claim encoding.** `encodeClaim({subject, predicate, object})` constructs a canonical claim object with content address. `encodeDerivedClaim(...)` encodes a morphism-derived claim that carries its witness structure as the `object` slot — the witnessing configuration, not a primitive label, per the substrate's [witness](teaching/explanations/witness.md) discipline.

- **Content addressing.** `addressOf(value, kind)` is the deterministic SHA-256 hash of any value through `canonicalize(value)`. The pair implements the substrate's [hash-discipline](teaching/explanations/hash-discipline.md) and [canonical-form](teaching/explanations/canonical-form.md) at the algebra layer.

- **Fibers and morphisms.** `fiber.*` exposes fiber types and operations (`createFiber`, `fiberFuse`, `fiberRestrict`, etc.) that the higher layers use to build the substrate's settlement dispatcher. The five morphism classes (`specialization`, `inversion`, `composition`, `fusion`, `implication`) plus `constraint` each export `{ name, declarations, applyForClaim, sourcePredicates, TRIGGER_PREDICATES, parseDeclaration }`.

## What the algebra package does *not* expose

By design:

- No state. The package is functions over plain data. There is no in-memory geometry, no claim store, no model object that persists between calls.
- No I/O. The package does not read files, does not open sockets, does not maintain caches. It is pure compute over the values it is given.
- No reducer registry. The package's primitives are used by the higher layers (the model, the filesystem-server, the MCP server) but the package itself does not register reducers, replay events, or coordinate dispatch.
- No event log. Events are a higher-layer concern. The algebra is what events' reducers ultimately call into; the algebra does not know events exist.

This separation is the substrate's [driver-substrate-split](teaching/explanations/driver-substrate-split.md) discipline applied to the substrate's own implementation: the algebra is the substrate's "kernel primitives" — fixed, simple, dependency-free, replaceable by any equivalent implementation that respects the same algebraic laws. The substrate's runtime concerns (state, persistence, transport) are layers above.

## The minimum viable inference

A substrate engineer working with the algebra package can verify the substrate's load-bearing algebraic property directly:

```js
import { fuse, restrict, truthLeq, TRUE, FALSE, NONE, BOTH } from "@561-group/predication-algebra";

const values = [NONE, TRUE, FALSE, BOTH];
for (const a of values)
  for (const p of values)
    for (const q of values) {
      const lhs = truthLeq(fuse(a, p), q);
      const rhs = truthLeq(p, restrict(a, q));
      console.assert(lhs === rhs);
    }
```

The assertion fires on all 64 triples without violation — the residuation is the substrate's load-bearing algebraic claim, verifiable in milliseconds at runtime.

A subtle non-Boolean: `fuse(NONE, NONE)` returns `FALSE`. Combining two "no information" values produces "told false" — the bilattice is genuinely four-valued, not Boolean-with-extras. The substrate's value-domain admits compositions whose results are not what a Boolean substrate would predict.

## Position as an example

The pure-algebra engine is the bottom of the substrate's [layering](teaching/explanations/driver-substrate-split.md) stack. It is what every substrate runtime that respects this corpus's commitments must implement, in some host language, to admit the substrate's content. Two implementations of the algebra in two host languages (a JavaScript implementation and a Rust implementation, say) are interchangeable under the substrate's content as long as both honor the same algebraic laws and the same canonical-form discipline. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the substrate's content addressed under canonical-form yields byte-identical hashes regardless of which algebra implementation produced it.

The example demonstrates that the substrate's algebra is small enough to be a stateless library — a stark contrast to Boolean-substrate runtimes whose algebra is implicit in compiler decisions, type system rules, and standard-library implementations spread across thousands of files. The predication substrate's algebra fits in one package.
