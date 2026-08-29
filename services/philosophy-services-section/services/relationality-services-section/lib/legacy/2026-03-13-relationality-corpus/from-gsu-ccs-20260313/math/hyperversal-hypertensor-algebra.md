---

name: hyperversal-hypertensor-algebra
description: "the Heyting algebra Hyp^H(d) of all hyperversal hypertensors, with pointwise operations and Z^d-translation action making it a Z^d-equivariant Heyting algebra."
defines: HyperversalHypertensorAlgebra
---

### Definition — Hyperversal Hypertensor Algebra {#hyperversal-hypertensor-algebra}

The set of all hyperversal hypertensors of rank $d$ admits a pointwise algebraic
structure inherited from $\mathcal{H}$.

#### Definition — Hyperversal Hypertensor Algebra {#def-hyperversal-hypertensor-algebra}

Fix rank $d \geq 1$. The **hyperversal hypertensor algebra** is
$$
\mathrm{Hyp}^\mathcal{H}(d)
\;:=\;
\bigl\{\,\mathcal{T} : \mathbb{Z}^d \to \mathcal{H}
\;\big|\;
\mathcal{T} \text{ is flow-covariant and nucleus-stable}\,\bigr\},
$$
equipped with the pointwise Heyting operations inherited from $\mathcal{H}$:
$$
(\mathcal{T}_1 \wedge \mathcal{T}_2)(v) \;:=\; \mathcal{T}_1(v) \wedge \mathcal{T}_2(v),
\qquad
(\mathcal{T}_1 \Rightarrow \mathcal{T}_2)(v) \;:=\; \mathcal{T}_1(v) \Rightarrow \mathcal{T}_2(v),
$$
and analogously for joins. The constants are the **constant hypertensors**
$\top(v) = \top_\mathcal{H}$ and $\bot(v) = \bot_\mathcal{H}$ for all $v$.

#### The $\mathbb{Z}^d$-Equivariant Structure {#hypertensor-algebra-equivariance}

The **translation action** of $\mathbb{Z}^d$ on $\mathrm{Hyp}^\mathcal{H}(d)$ is
$$
(\tau_w \mathcal{T})(v) \;:=\; \mathcal{T}(v + w), \qquad w \in \mathbb{Z}^d.
$$
Each $\tau_w$ is a Heyting algebra automorphism of $\mathrm{Hyp}^\mathcal{H}(d)$.
The flow-covariance condition on $\mathcal{T}$ says that the actions of $\tau_{e_i}$
and the directed comonad $U_G^\mathcal{H}$ are compatible: translating in the $i$-th
direction is nucleus-equivalent to applying one step of the universe closure.

This makes $\mathrm{Hyp}^\mathcal{H}(d)$ an **equivariant Heyting algebra** in the
topos $\mathbf{Set}^{\mathbb{Z}^d}$ of $\mathbb{Z}^d$-sets: an internal Heyting algebra
object on which the group $\mathbb{Z}^d$ acts by Heyting automorphisms.

#### Collapse to Boolean {#hypertensor-algebra-boolean}

If modal collapse holds (§modal-collapse), $\mathcal{H}$ is Boolean: every element satisfies
excluded middle. The pointwise operations then make $\mathrm{Hyp}^\mathcal{H}(d)$ a
**Boolean algebra** — the nucleus-stability condition is trivially satisfied for every map
$\mathbb{Z}^d \to \mathcal{H}$, so
$$
\mathrm{Hyp}^\mathcal{H}(d) \;\cong\; \mathcal{H}^{\mathbb{Z}^d}
$$
as Boolean algebras, restricted to the flow-covariant sections. The flow-covariance condition
is the only non-trivial constraint that remains in the collapsed setting.

#### Relation to the Orbit Structure {#hypertensor-algebra-orbit}

The quasicrystalline hypertensor $Q^\mathcal{H}$ (§hyperversal-quasicrystal-hypertensor) generates a
$\mathbb{Z}^d$-orbit $\{\tau_w Q^\mathcal{H} : w \in \mathbb{Z}^d\} \subseteq \mathrm{Hyp}^\mathcal{H}(d)$.
By unique ergodicity (§hyperversal-quasicrystal-conjecture), this orbit is dense in the
orbit closure $\Omega(Q^\mathcal{H})$ (§hyperversal-quasicrystal-hull). The algebra
$\mathrm{Hyp}^\mathcal{H}(d)$ is the ambient Heyting algebra in which the hull lives.

**Status.** The equivariant Heyting algebra structure is immediate from the definitions.
The precise relationship between the flow-covariance condition and the $U_G^\mathcal{H}$-action
depends on the ground-level status items of §quasicrystal-hypertensor and the hyperversal
extension §hyperversal-quasicrystal-hypertensor.
