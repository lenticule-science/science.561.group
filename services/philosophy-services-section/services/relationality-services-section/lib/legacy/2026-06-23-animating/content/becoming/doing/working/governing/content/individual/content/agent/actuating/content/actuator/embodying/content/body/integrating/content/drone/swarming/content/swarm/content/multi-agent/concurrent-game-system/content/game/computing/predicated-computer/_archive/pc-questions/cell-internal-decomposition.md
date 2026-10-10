---
type: question
status: set-aside
explores: [predication-graph-store, scope, snapshot]
---

# What is a substrate cell's internal decomposition?

The older CCE/CDS specs describe a *cell* — a single local universe — as having a specific internal decomposition:

- **Site** — a small category of objects and morphisms equipped with a Grothendieck topology of covering sieves, plus a Heyting table on the lattice of sub-objects.
- **Fibers** — for each site object, a recognition algebra (typically Boolean or Heyting) with associated $\sigma$ and $\Delta$ tables (modal operators). The fibers carry the substrate's value-domain content per object.
- **Fixed layer** — a stabilized sub-region of the fibers, encoded analogously, representing content that has reached fixed-point under closure.
- **RTL signature** — the typed term language available within the cell.
- **Structural vocabulary** — the named objects, morphisms, and relations the cell admits.
- **Constructors** — the generative operators that produce cell content.
- **Laws** — the canonicalization, invariants, and repair-log that govern the cell.

This decomposition is the math-program (GFRTU) framing of cell content. The corpus's analog — a unit of substrate content with internal structure — is captured at higher engineering abstraction:

- [Predication-graph store](../objects/predication-graph-store.md) carries predication content (analog of fibers).
- [Scope-record](../objects/scope-record.md) carries vocabulary, closure-rule subset, shape catalog, completion-stage (partial analog of site + structural-vocabulary + constructors).
- [Snapshot](../objects/snapshot.md) carries point-in-time canonical content (partial analog of fixed-layer).
- [Repair-catalog](../objects/repair-catalog.md) carries declared repairs (analog of laws.invariants + laws.repair_log).

What the corpus does *not* directly capture is the cell-as-unit decomposition: a single canonical-form serialization that bundles site, fibers, fixed layer, vocabulary, constructors, and laws into one substrate object. The corpus has these as separate substrate entities; the math-program treats them as one cell.

The question is whether the engineering theory needs a unified cell concept — a single substrate unit that bundles vocabulary, content, and laws — or whether the dispersed approach (separate scope-record, predication-graph store, repair-catalog) is the right engineering decomposition.

Particular candidates:

- **Cell as a subscope's snapshot.** A cell could be the canonical-form-serialized snapshot of one scope at one moment, including the scope's vocabulary, content, and active laws. This is close to what [snapshot](../objects/snapshot.md) records but with the addition of the laws (currently snapshots cite the catalog version but don't bundle it).
- **Cell as the unit of CCE-style closure.** A cell could be the unit on which a single substrate-internal closure operation runs — a region whose content, vocabulary, and laws are all in scope for the closure step. Distinct from a scope (which may host many such cells across its lifetime).
- **Cell as a category-theoretic object.** Per the math-program framing, a cell is a topos-style local universe with site, fibers, fixed layer. The engineering content of this — the cell as a typed bundle — may or may not need to surface in the engineering theory.

The set-aside framing: the cell-as-unit framing is math-program structure (specifically GFRTU's "single local universe in a Generative Fibered Relational Trace Universe"); spatiotemporal-knowledge has not yet articulated what cell-level decomposition the engineering corpus needs. The corpus's separated approach (scope-record + predication-graph + snapshot + repair-catalog) is operationally equivalent at the moment, but the unified-cell framing may resurface as the math program's bilattice-on-bitopological-site formalism advances.

Source: `cellular-data-serialization.md`, `cellular-closure-engine.md`.
