# References

Information-oriented. Dry, precise, lookup-shaped. No teaching, no persuasion — just *what is*.

Planned:

- **the-charge** — exact shape `{ value: [bool, bool], evidence: [list, list] }`, the invariant
  (value may exceed evidence-presence only via a presumption ceiling), and how to read it.
- **the-four-states** — the table: absurd/potential/active/stable, their bits, their position in each
  order, the gauge action on each.
- **morphisms** — one entry per morphism (a named export in `src/`): signature, input/output shape, the property it
  realizes, what it composes from. Grouped by regime (articulate/predicate+cohere/posit+settle/...)
  and by layer (value-ops, cones, structural, monad).
- **the-laws** — the algebraic laws the kernel guarantees (lattice axioms per order, the involutions,
  the σ-conjugation, evidence monotonicity, the cones bracketing) with the test that checks each.
- **the-test-suite** — what `node --test` covers (`charge`, `descent`), how the property
  testing works, and how to add a check.
