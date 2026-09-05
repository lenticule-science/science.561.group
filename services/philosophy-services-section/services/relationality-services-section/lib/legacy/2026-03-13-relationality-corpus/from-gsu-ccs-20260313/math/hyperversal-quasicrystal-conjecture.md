---

name: hyperversal-quasicrystal-conjecture
description: "the support pattern of the hyperversal hypertensor Q^H is quasicrystalline — aperiodic, relatively dense, and uniquely ergodic."
---

### Conjecture — Hyperversal Quasicrystallinity {#hyperversal-quasicrystal-conjecture}

**Conjecture.** The support pattern $\mathrm{pat}_{Q^\mathcal{H}}(v) = [Q^\mathcal{H}(v)]_\sim$
of the hyperversal hypertensor is quasicrystalline: aperiodic, relatively dense, and uniquely
ergodic.

**The argument from the tower.** At each finite level $n$, the pattern $\mathrm{pat}_{Q^{(n)}}$
is quasicrystalline — aperiodic by the Perron–Frobenius eigenvalue $\phi$ and uniquely ergodic
by the primitivity of $\Sigma^{(n)}$. The colimit $Q^\mathcal{H}$ inherits the support pattern
as a filtered limit of quasicrystalline patterns. Since aperiodicity is witnessed by the
substitution matrix eigenvalue $\phi$ — which is independent of the level $n$ — the
aperiodicity persists to the colimit. Unique ergodicity persists for the same reason: the
primitivity of $\Sigma^{(n)}$ is a combinatorial property of the substitution rule that does
not change across levels.

**Relation to emergent commutativity.** The quasicrystalline structure of $\mathsf{Phase}_\mathcal{H}$
(§emergent-commutativity) is the propositional manifestation of $Q^\mathcal{H}$: the support
pattern of $Q^\mathcal{H}$ indexes the aperiodic accumulation of commuting history pairs in the
colimit. Emergent commutativity is the statement that this quasicrystalline pattern exhausts
the non-commuting pairs at the hyperverse level.

**Relation to modal collapse.** At each finite level, the quasicrystalline pattern lives in
the stable layer $(H^{(n)})^*$. Modal collapse says that at $\mathcal{H}$ the stable layer is
all of $\mathcal{H}$. The quasicrystalline pattern therefore lives in the entirety of
$\mathcal{H}$, not in a proper sublayer — it is the full structure of the hyperverse, not an
embedded fragment.

**Status.** Stub. Requires: (a) a precise definition of the tower inclusions
$\iota_n$ as morphisms of relational universes and verification that they are compatible with
the directed comonad (§hyperverse-tower, §universe-morphism); (b) a proof that the colimit of
quasicrystalline maps $\mathbb{Z}^d \to R^{(n)}$ is quasicrystalline as a map into the
colimit; (c) verification that the filtered colimit of the substitution fixed points is again
a fixed point of the limiting substitution. All three depend on the ground-level status items
of §quasicrystal-hypertensor.
