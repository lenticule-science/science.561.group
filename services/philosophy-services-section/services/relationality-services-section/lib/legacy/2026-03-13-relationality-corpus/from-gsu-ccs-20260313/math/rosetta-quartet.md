---

name: rosetta-quartet
description: "The Baez-Stay Rosetta Stone fourfold (computation / logic / topology / physics) is the free-quotient nuclear quartet (§free-quotient-nuclear-quartet) — the four columns are the four phases of the relational universe construction."
---

### Conjecture — Rosetta Quartet {#rosetta-quartet}

**Background.** Baez and Stay's *Physics, Topology, Logic and Computation: A Rosetta
Stone* (2009) exhibits four columns that are the same mathematical content in four
disciplinary registers:

| Physics | Topology | Logic | Computation |
|---------|----------|-------|-------------|
| Hilbert space | Manifold | Proposition | Type |
| Operator | Cobordism | Proof | Program |
| Composition | Gluing | Cut rule | Function composition |
| Tensor product | Disjoint union | Conjunction | Product type |

#### The Conjecture {#rosetta-quartet-conjecture}

**Conjecture:** The Baez-Stay fourfold corresponds to the free-quotient nuclear quartet
(§free-quotient-nuclear-quartet), which organizes the four phases of the relational
universe construction:

| Baez-Stay column | Phase | Free-quotient role |
|-----------------|-------|--------------------|
| Computation (types, programs) | Algebra | Object: the history category and fiber HA data |
| Logic (propositions, proofs) | Language | Quality: FiberNuclearLanguage, the nuclear fiber language |
| Topology (spaces, cobordisms) | Geometry | Relation: the sheaf construction and history site |
| Physics (processes, evolution) | Dynamics | Act: self-generation and $U_G$-closure |

The Baez-Stay insight — that one table encodes four disciplines simultaneously — is,
on this conjecture, the observation that the free-quotient nuclear quartet is
self-disclosing: the same mathematical structure shows itself as computation when
viewed through the algebra phase, as logic through the language phase, as topology
through the geometry phase, and as physical process through the dynamics phase.

The commutativity of the nuclear quartet ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md)) would then correspond to
the coherence of the Rosetta Stone itself: the four columns are not four separate
translations but four facets of one structure.

#### What Would Need To Be Proved {#rosetta-quartet-requirements}

1. **Computation = algebra phase.** Showing that the history category with fiber HA
   data is a model for the computation column requires identifying the monoidal
   structure of the Baez-Stay computation column (symmetric monoidal closed category)
   with the monoidal structure on the algebra phase of $R$. This requires the
   free-sequential-act (§free-sequential-act) monoidal structure to match the
   Baez-Stay tensor product.

2. **Logic = language phase.** The FiberNuclearLanguage language ([fiber-nuclear-language](fiber-nuclear-language.md)) is
   intuitionistic modal logic. The Baez-Stay logic column is ordinary intuitionistic
   propositional logic (proofs as morphisms in a CCC). Verifying the identification
   requires showing that the non-modal fragment of FiberNuclearLanguage corresponds to
   the Baez-Stay logic column at the simply-typed level.

3. **Topology = geometry phase.** The Baez-Stay topology column is manifolds and
   cobordisms (a $(1+1)$-TQFT). The geometry phase of $R$ is sheaves on the history
   site. The identification requires a precise functor from the history site to a
   cobordism category — or, more carefully, a statement that the covering conditions
   of $J$ correspond to the gluing of cobordisms.

4. **Baez-Stay Physics column = dynamics phase.** The identification of physical processes with the
   $U_G$-dynamics is suggestive but needs a precise statement: physical evolution
   should correspond to application of the directed comonad (§directed-comonad) to
   fiber data.

**Status.** Conjecture. Requirements (1)–(4) are all open. Requirements (3) and (4)
are the most speculative.
