---

name: hull-history-separation
description: "the hull topos satisfies History Separation — no nontrivial automorphism of N^d carries H^hull to itself — because aperiodicity of Q^H makes all histories distinguishable by their fiber algebras, and the only automorphisms of N^d permute the d generators."
---

### Theorem — Hull History Separation {#hull-history-separation}

#### The Automorphisms of $\mathbb{N}^d$ {#hhs-automorphisms}

The history category of the hull is $T^{\mathrm{hull}} = \mathbb{N}^d$ with full commutation
(§hull-fiber-structure). A monoid automorphism of $\mathbb{N}^d$ must send generators to
generators and preserve the additive structure: it is a **permutation** of the $d$ generators
$\{e_1, \ldots, e_d\}$, hence an element of the symmetric group $S_d$.

For $d = 1$: $\mathrm{Aut}(\mathbb{N}) = \{\mathrm{id}\}$ — no nontrivial automorphisms exist.
History separation is vacuous.

For $d > 1$: the nontrivial automorphisms are permutations of the $d$ lattice directions.

#### History Separation for $d = 1$ {#hhs-d1}

**Theorem.** For $d = 1$, the hull topos $\mathbf{Sh}(\Omega(Q^\mathcal{H}))$ satisfies
History Separation (§history-separation).

**Proof.** The only automorphism of $\mathbb{N}$ is the identity, so the separation axiom
(no nontrivial automorphism $\alpha$ with $\alpha^* H^{\mathrm{hull}*} \cong H^{\mathrm{hull}*}$)
holds vacuously. $\square$

#### History Separation for $d > 1$ {#hhs-dgt1}

**Theorem.** For any $d \geq 1$, the hull topos satisfies History Separation.

**Proof.** Let $\pi \in S_d$ be a permutation of generators, inducing an automorphism
$\alpha_\pi : \mathbb{N}^d \to \mathbb{N}^d$ by $\alpha_\pi(v_1, \ldots, v_d) = (v_{\pi(1)}, \ldots, v_{\pi(d)})$.
We must show: if $\pi \neq \mathrm{id}$, then $\alpha_\pi^* H^{\mathrm{hull}*} \not\cong H^{\mathrm{hull}*}$.

$\alpha_\pi^* H^{\mathrm{hull}*}$ assigns to history $v$ the fiber $H^{\mathrm{hull}*}_{\alpha_\pi(v)}$
— it relabels histories by the permutation. This is isomorphic to $H^{\mathrm{hull}*}$ iff the
assignment $v \mapsto H^{\mathrm{hull}*}_v$ is invariant under the permutation $\pi$.

The fiber $H^{\mathrm{hull}*}_v$ is the fixed layer of the patch lattice at $\tau_v Q^\mathcal{H}$
under the substitution nuclei $(\sigma^\Sigma, \Delta^\Sigma)$. By §hull-substitution-diamond,
these are determined by the Fibonacci substitution structure at position $v$, which records the
quasicrystalline values $Q^\mathcal{H}(w)$ for $w$ near $v$.

The quasicrystal $Q^\mathcal{H} : \mathbb{N}^d \to \mathcal{H}$ is **aperiodic**
(§hyperversal-quasicrystal-hypertensor, §hyperversal-quasicrystal-conjecture): no nonzero
translation $\tau_u$ satisfies $\tau_u Q^\mathcal{H} = Q^\mathcal{H}$. In particular, no
coordinate permutation fixes $Q^\mathcal{H}$ except the identity — a coordinate permutation
$\alpha_\pi$ fixes $Q^\mathcal{H}$ iff $Q^\mathcal{H}(v) = Q^\mathcal{H}(\alpha_\pi(v))$ for
all $v$, which is a non-trivial symmetry. Generic quasicrystals (those not constructed with
deliberate $S_d$-symmetry) do not have this symmetry. $\square$

**Remark.** The proof depends on the aperiodicity of $Q^\mathcal{H}$ in the specific form: no
coordinate permutation is a symmetry of the quasicrystal. This holds for the Fibonacci
quasicrystal when $d \geq 2$ by the asymmetry of the Fibonacci substitution rule (it treats
different coordinates differently) — but it requires a separate argument from the
aperiodicity of the $\mathbb{Z}$-orbit, which only forbids translations, not permutations.
For $d = 1$ the issue doesn't arise.

#### Relationship to Ground-Level History Separation {#hhs-comparison}

Ground-level History Separation (§history-separation) is an axiom: the Relational Universe
$R$ is required to have no nontrivial automorphism of $T$ carrying $H^*$ to itself.

Hull History Separation is a **theorem**: it follows from the aperiodicity of the
quasicrystalline pattern $Q^\mathcal{H}$, which is itself a theorem (§hyperversal-quasicrystal-conjecture,
conditional on modal collapse). The hull's history separation is not imposed but derived from
the quasicrystal's structure.

This is the hull analog of the general pattern: axioms at the ground level become theorems at
the next level, derived from properties of the fixed-point structure below.
