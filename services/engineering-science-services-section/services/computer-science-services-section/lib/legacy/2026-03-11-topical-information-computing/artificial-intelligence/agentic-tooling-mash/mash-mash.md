---
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

# MASH — Modeled Agential Semiotic Hub

A predication substrate over the Belnap 2⊗2 bilattice.
One process, one Unix-domain socket, one append-only store of subject-predicate-object claims closed under five morphisms and behaving as a CRDT under concurrent writers.

The name is load-bearing:

- **M**odeled — *logical inference modeling* under predication logic.
- **A**gential — *agential virtual reality*; agents are the only way anything happens.
- **S**emiotic — *semiotic settlement operations*; the cascade settles signs among possible meanings.
- **H**ub — the process that owns the substrate.

The lineage is Norbert Wiener and Karen Barad, not Claude Shannon and Alan Turing.
Computation here is not the transformation of encoded symbols through a function; it is the iterated settlement of evidence through an adjunction of extending and restricting on a four-valued algebra.
The algebra is the Chu multiplicative structure of Jakl's *2⊗2 ≅ Chu(2,0)*; the top-level paper under `library/domains/science/domains/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md` is the formal development.

## Quickstart

```bash
cargo build --workspace
cargo test  --workspace
```

Inspect the current CLI surface:

```bash
cargo run -p mash-library --bin mash -- help
```

The current `mash` binary is an operator probe for an already-running hub: `ping`, `witness`, `watch`, `fiber`, and `dm`.
The old manifest-driven `mash up` path was removed during the crate consolidation and has not been rebuilt yet.

## Reading order

The `docs/` book follows the [Diátaxis] four-quadrant structure; match the section to what you're looking for.

1. **Start here** — `docs/src/introduction.md`. Orients you to the
   vocabulary and gives a concrete reading path into the book.
2. **Tutorial** — `docs/src/tutorial/first-vocabulary.md`. A
   30-minute hands-on build that teaches claims, compositions, the
   cascade, and the testkit through a concrete example.
3. **How-to** — `docs/src/how-to/` (write a vocabulary, a port, a
   scene). Task-oriented recipes.
4. **Explanation** —
   - `docs/src/explanation/lineage/` (Beyond Shannon and Turing,
     Cybernetics, Agential realism) — why MASH is shaped the way
     it is.
   - `docs/src/explanation/concepts/` (values, claims, fibers and
     cascade, morphisms) — the code-level vocabulary.
   - `docs/src/explanation/mathematics/` — the formal foundation
     (finite algebra) and the research frontier (infinite
     coalgebra).
   - `docs/src/explanation/architecture/` (hub, agents and
     sessions, port roles) — how the parts assemble.
5. **Reference** — `docs/src/reference/` (glossary, taxonomy, wire
   protocol, trigger predicates). For lookup.
6. **The paper** — the adjoint-structure-of-predication paper in
   `library/` is the mathematical ground truth. Every phrase in
   these docs that reads like jargon (fiber, adjunction,
   residuation, Chu space) traces to a specific theorem there.

Build the book locally with [mdBook]:

```bash
cargo install mdbook
mdbook serve docs
```

Build the API reference:

```bash
cargo doc --workspace --no-deps --open
```

The workspace currently has two crates:

| Crate | Purpose |
|---|---|
| `mash-engine` | Algebra, inference, proof substrate, hub, SDK, and utilities. |
| `mash-library` | OQRA-structured vocabularies, scenes, projections, storage vocabulary, and operator binaries built on `mash-engine`. |

The old many-crate taxonomy (`mash-vocab-*`, `mash-port-*`, `mash-scene-*`, `mash-sdk-*`, `mash-math-*`) survives only in some historical docs and comments.
New production work should target the current two-crate layout unless a split crate is deliberately reintroduced.

## Current shape

- `mash-engine::algebra` is the Belnap 2⊗2 value algebra.
- `mash-engine::proof` is the `Semiotics` substrate and cascade.
- `mash-engine::hub` is the Unix-socket hub API, but no `mash up` wrapper currently ships.
- `mash-engine::sdk` contains the agent/projection traits and socket client.
- `mash-library` contains the vocabularies, projections, storage model, testkit, and binaries now consolidated from the old crate family.

## License

MIT.
See `LICENSE`.

[mdBook]: https://rust-lang.github.io/mdBook/
[Diátaxis]: https://diataxis.fr/
