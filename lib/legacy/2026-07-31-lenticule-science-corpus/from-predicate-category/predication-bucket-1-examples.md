# examples/

Worked examples and concrete instances. One example per file.

Examples carry weight in predication categories — they are how we check that abstract definitions actually do the work we intended (e.g. the four regimes — strict, Scott-continuous, transfinite-bounded, aperiodic — for settling behavior, the worked predication settlings from the presheaves draft, the Mayer–Vietoris CRDT computation).

## Frontmatter

```yaml
---
type: example
status: draft | sketch | verified
depends-on: [skp, settling, regime-a, ...]    # objects/theorems instantiated
---
```

`verified` means the example has been computed end-to-end and the computation has been checked.

## Body shape

1. **What is being instantiated.** Which object(s) and which theorem(s), if any.
2. **The construction.** Concrete data: the spatial base, the bilattice, the settling, etc.
3. **The computation.** Whatever is being shown — that the closure converges, that the cohomology is non-trivial, that the CRDT merge agrees with the cohomological merge.
4. **What this example illustrates.** One paragraph: what the example is *for*. An example without a clear "this is what it is showing" loses value over time.

## Counterexamples

A counterexample to a claim that is now `refuted` lives here, with a pointer to the (now-refuted) theorem note. Refutations are useful and should not be hidden.
