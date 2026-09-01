---

name: history-separation
description: "History Separation — H is automorphism-reflecting on the fixed layer: no non-trivial permutation of histories is invisible to H*, which rules out constant-fiber universes and is the basis for aperiodicity."

---

### Axiom — History Separation {#history-separation}

The functor $H$ records the relational history of each history faithfully: distinct histories
have genuinely distinct modal characters.

Formally, $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is **automorphism-reflecting on
the fixed layer**: for any automorphism $\alpha : T \xrightarrow{\;\sim\;} T$ of the
history category that preserves the commutation topology $J$, if the pullback sheaf
$\alpha^\ast H^\ast$ is naturally isomorphic to $H^\ast$ as a sheaf of Heyting algebras
on $T$, then $\alpha = \mathrm{id}_T$.

In other words: no nontrivial permutation of histories is invisible to the invariant layer
$H^\ast$. The only self-symmetry of $T$ that can look like a symmetry of the fixed
modal data is the identity.

#### Why the Fixed Layer, Not the Full Fiber {#history-separation-fixed-layer}

A natural first attempt at a separation axiom would be the sheaf-separation condition:
if $a, b \in H_t$ restrict identically to all pieces of every commutation cover, then
$a = b$. This fails in general, and the failure is structural, not accidental.

The saturation nucleus $\sigma_t$ is defined as the largest element of $H_t$ with a
given restriction profile to all proper sub-histories (§saturation-nucleus). Consequently, whenever
$a < \sigma_t(a)$, the elements $a$ and $\sigma_t(a)$ are distinct yet have identical
restrictions to every $t_0 < t$:
$$
\rho_{t_0}(\sigma_t(a)) \;=\; \rho_{t_0}(a) \quad \text{for all } t_0 < t.
$$
So naive sheaf-separation over all sub-history restrictions is violated by the very
construction of $\sigma_t$. This is not a defect — it is the reason $H_t$ can carry
strictly more information than its sub-history restrictions alone encode. The saturation
gap $a < \sigma_t(a)$ is the space of propositions that agree locally but differ
globally.

On the fixed layer $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$,
both nuclei are the identity. The saturation gap closes ($\sigma_t(a) = a$ for all
$a \in H_t^*$), so the obstruction disappears. The restriction maps on $H_t^*$ are
jointly injective with respect to commutation covers: the doubly stable elements are
precisely those for which local data (restrictions to independent components) determine
the element globally. This is why the axiom is stated for $H^*$, not $H$.

#### The Commutation Cover, Not All Sub-histories {#history-separation-covers}

Commutation covers partition the step set of $t$ into mutually independent groups
$t = t^{(1)} \star \cdots \star t^{(n)}$ (§commutation-topology). Restrictions to these
parallel components are jointly injective on $H_t^*$ because the Day convolution
structure (§history-convolution) decomposes the fiber:
$$
H_t^* \;\cong\; H_{t^{(1)}}^* \otimes \cdots \otimes H_{t^{(n)}}^*
\quad \text{(in the appropriate internal sense).}
$$
Two doubly stable propositions agreeing on all independent components are equal because
they name the same point in this decomposition. Sequential sub-histories (e.g., a single
prefix $t_0 < t$) do not decompose $H_t^*$ in this way — they carry only partial
information.

#### Proof Route via the Syntactic Model {#history-separation-proof}

In the abstract axiomatic setting, History Separation is an axiom. It cannot be derived
from the other axioms alone. The canonical witness is the **syntactic relational
universe** (§syntactic-relational-universe): the canonical model built from FiberNuclearLanguage
normal forms.

In the syntactic model, $H_t$ is the set of canonical FiberNuclearLanguage normal forms at $t$.
Every FiberNuclearLanguage term has a unique normal form: strong normalization is machine-checked in
`NormalizationStrong.lean` as `FML.strongNormalization` (sorry-free), proved by
double induction on the lexicographic measure $(\mathsf{fmlW}(M), \mathsf{ent}(M))$
([nuclear-reduction-measure](nuclear-reduction-measure.md), §strong-normalization). The key sub-result `FML.entanglement_R7` —
that R7 strictly decreases $\mathsf{ent}$ by exactly $1$ — is also machine-checked.
These proofs are entirely internal to the term structure; they use no semantic
properties and in particular do not depend on History Separation.

Given unique normal forms, History Separation in the syntactic model follows by
structural induction on normal form shape. The reduction rules R3 and R4 distribute
$\mathsf{Saturate}$ and $\mathsf{Transfer}$ through $\wedge$, so every normal form at
$t = t^{(1)} \star \cdots \star t^{(n)}$ (commutation partition) decomposes into
its restrictions to each independent component $t^{(i)}$. Two distinct normal
forms must differ on at least one component — otherwise the reduction system
would identify them, contradicting uniqueness of normal forms. This gives History
Separation in the syntactic model without circularity: SN is the foundation,
and SN is proved by term-structure induction alone.

The abstract axiom is then justified by initiality (§initiality): the syntactic
relational universe is initial among all relational universes satisfying the axioms,
and the initiality morphism transfers History Separation from the syntactic model to
every model in the class.

#### What History Separation Rules Out {#history-separation-rules-out}

Without History Separation, a relational universe could have constant fibers
$(H_t, \sigma_t, \Delta_t) = (H_0, \sigma_0, \Delta_0)$ for all $t$ — a maximally
symmetric, periodic structure satisfying all other axioms but encoding no relational
distinction between histories. The Axiom of History Separation rules this out: the nuclear
pair $(\sigma_t, \Delta_t)$, varying across fibers, is the internal witness that each
history has a distinct relational standing in the universe.

This is why aperiodicity is a theorem (§aperiodicity), not an axiom: once the
nuclei vary genuinely across fibers (as History Separation requires), the orbit
structure of the comonadic dynamics $G_s$ on $R$ cannot be periodic.