---
type: narrative
introduces: [predication-settling]
see-also: [aperiodic-settling, settling-continuity, settling-monotonicity, closure-ordinal, four-regime-dichotomy, strict-regime-cohomology-vanishing]
---

# Settling dynamics

Static valuations on a fixed predicate category give a snapshot of knowledge. The settling is the temporal axis: a transfinite sequence of valuations $(v_\tau)_{\tau < \lambda}$ indexed by an ordinal [settling bound](../../objects/settling-bound.md) $\lambda$, with each step driven by an [increment sequence](../../objects/increment-sequence.md) $U = (u_\tau)$ of external evidence and saturated by a closure operation. The fundamental dynamics: at each successor step, external evidence arrives, the closure fires until the predication state is saturated under inference, and the result is the valuation at the next ordinal.

Two structural commitments shape the dynamics:

- [**Settling monotonicity**](../../teaching/explanations/settling-monotonicity.md). The orbit $(v_\tau)$ is $\leq_k$-monotone — knowledge accumulates and never retracts. Both positive and negative evidence can grow; the only state never reduced is $\top$ (told both, an irreversible record of conflict).

- [**Settling continuity**](../../teaching/explanations/settling-continuity.md). At limit ordinals, the value is the $\leq_k$-supremum of all earlier values: $v_\mu = \bigvee_k\{v_\sigma : \sigma < \mu\}$. This is what makes the orbit a coalgebra rather than a discrete sequence.

Whether the settling *stabilizes* depends on the closure operator's structure. If the closure is finitely generated and the value domain is finite, stabilization occurs at a finite ordinal — the [strict regime](../../theorems/strict-regime-cohomology-vanishing.md). Scott-continuous closures stabilize at $\omega$. Closures that fail Scott-continuity can run through transfinite ordinals; the [aperiodic settling](../../teaching/explanations/aperiodic-settling.md) is the case where no countable ordinal stabilizes the orbit at all.

The [closure ordinal](../../objects/closure-ordinal.md) of a settling — the smallest $\kappa$ at which $v_\kappa$ becomes a fixed point — is predication categories' central invariant of settling behavior. The [four-regime dichotomy](../../theorems/four-regime-dichotomy.md) classifies settlings by the size of this ordinal, and most of the structural results in the cohomological and moduli layers stratify by regime.

The settlings over a fixed base assemble into a category — the [predication settling category](../../objects/predication-settling-category.md) — which is well-behaved as an algebraic object. It has all small limits and colimits computed pointwise ([completeness and cocompleteness](../../theorems/predication-settling-category-completeness.md)), and the constant-$\bot$ and constant-$\top$ presheaves serve as [initial and terminal objects](../../theorems/predication-settling-category-initial-terminal.md). The pointwise $\vee_k$-merge surfaced by the completeness corollary is the algebraic underpinning of the CRDT story in the Study-and-use part.

## Cosettling structure

Beyond the forward dynamics, the **cosettling** $T^{-1}(w)$ — the pre-image of a state $w$ under the closure operator $T$ — captures the lattice of histories that lead to $w$. Two structural facts about cosettling have multiple proofs in the corpus:

- The *iterated cosettling* $T^{*-1}(w)$ has the closed-form $|T^{*-1}(w)| = 2^{|w \setminus \mathrm{seed}|}$ — any subset between seed and target. Established via two independent proofs: a [direct combinatorial argument](../../theorems/iterated-cosettling-counts-derivable-cells.md) and a [Moore-family Galois-connection argument](../../theorems/iterated-cosettling-via-moore-family.md).
- The *single-step cosettling* $T^{-1}(w)$ is structurally more complex; the conjectural framework is the [closure-cover hypergraph](../../theorems/single-step-cosettling-via-closure-cover-hypergraph.md) (sketch).

The forward trajectory inside the cosettling has its own structural characterization: the [forward-trajectory-via-Galois-adjunction theorem](../../theorems/forward-trajectory-via-galois-adjunction.md) gives an explicit Galois adjoint when the closure preserves meets (tree-shaped or Boolean-flavored closures), with [closure-cover hypergraph](../../theorems/forward-trajectory-via-hypergraph-cover.md) handling the general non-meet-preserving case. The [pre-image characterization](../../theorems/backward-closure-recovers-forward-trajectory.md) establishes that the cosettling and forward trajectory are *compatible but not coextensive* in the strict regime — the cosettling has additional content from off-trajectory pre-images.

## Categorical structure on settlings

The settlings category carries a closed symmetric monoidal structure. The [settling tensor product](../../theorems/settling-tensor-product.md) is the first explicit categorical operation beyond morphisms; the [settling internal Hom](../../theorems/settling-internal-hom.md) completes the closed-monoidal structure. Together with the [no-tunneling theorem](../../theorems/cl-inv-locally-constant-on-paths.md) on cohomological tunneling and the [void-cone cohomology](../../theorems/void-cone-cohomology.md) on apex/void duality, the corpus's categorical structure on settlings is fully symmetric: forward/backward dynamics, apex/void cohomology, tensor/Hom monoidal.

## Extensions of the framework

The settling framework extends beyond the discrete bilattice case along multiple axes:

- **Stochastic.** [Stochastic stationary distributions are settlings](../../theorems/stochastic-stationary-as-settling.md): the Perron-Frobenius identification gives the stationary distribution as a settling on $[0, 1]$-valued cells, with mixing time corresponding to the closure-rate invariant.
- **Continuous-state.** The [continuous-state regime classification](../../theorems/continuous-state-regime-classification.md) lifts the regime-classification machinery to Lawvere-quantale-enriched and continuous-time semigroup dynamics, with the four-regime dichotomy surviving the generalization.
- **Higher-arity.** The [n-ary predication](../../objects/n-ary-predication.md) framework extends from binary cells to $n$-tuples, with the [higher-arity cohomological rank theorem](../../theorems/higher-arity-cohomological-rank.md) giving the arity-collapse / arity-amplification dichotomy depending on whether the closure uses genuine $n$-ary joins.

These three extensions together establish the framework's reach beyond its original Boolean / binary / discrete-time setting.
