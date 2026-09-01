# PyMetroLogic

One Python package for the lab's information-tile mathematics: predication core, predication calculus, and executable shadows of selected Lean RelMath results.
PyMetroLogic is the Python implementation of the Lean `RelMath` library, not a namespace containing a separate `relmath` subpackage.

The core is pure, dependency-free Python realizing:

- `bilattice` - the twist product `L^*` over a bounded De Morgan lattice `L`, with the truth order, the knowledge order, the four lattice operations, negation/conflation, the designated points, and the graded conflict measure.
  Belnap's FOUR is `bilattice(boolean)`.
- `site` - a finite predicate category / cell complex with face relations.
- `fiber` - the predication fiber functor: specialization, converse, and subject/object projection acting on fibers over `E x E`.
- `settling` - the knowledge-order join merge of settlings and a fixed-point `settle` driver for knowledge-monotone operators.
- `calculus` - predication sheaves, global sections, consistency/conflict, and the PySheaf bridge.
- `logarithms`, `metallic`, `salem`, `colouring`, `lightcones`, `dynamics`, `blowup`, `nsc_firing`, `regimes`, `stochastic`, `sofic`, `classification`, `coclassification`, `anderson_putnam`, `inverse_hull`, `moduli`, `substitution`, `synonymy`, and related modules - executable shadows of selected Lean `RelMath` results.
  Each library module should be ledgered in `../../docs/THEORY.md` before it is treated as part of PyMetroLogic proper.

Converted wilderness material stays in `../../notebooks/` until a Lean theorem, definition, frontier lemma, or ledgered corpus result earns it into this package.
