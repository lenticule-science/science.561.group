---
id: internal-nucleus-definability
name: InternalNucleusDefinability
description: "both nuclei σ_t and Δ_t, and their joint fixed point H_t^*, are definable in the Mitchell–Bénabou internal language of R = Sh(T,J) — σ via the internal prefix order, Δ via the internal commutation relation."
---

### Theorem — Internal Definability of Both Nuclei {#internal-nucleus-definability}

Both nuclei $\sigma_t$ and $\Delta_t$, and their joint fixed point $H_t^*$, are definable
in the Mitchell–Bénabou internal language of $R = \mathbf{Sh}(T, J)$. They are defined
by two structurally different internal quantifiers on the internal history object $\mathbf{T}$.

#### The Two Internal Quantifiers {#ind-two-quantifiers}

By §history-object-constant, the internal history object $\mathbf{T}$ is the constant
sheaf: $\mathbf{T}(u) = T$ at every stage $u$, and both the internal prefix order
$\leq_{\mathrm{int}}$ and the internal commutation relation $\perp_{\mathrm{int}}$ are
constant sheaves equal to the external relations. The Mitchell–Bénabou language of $R$
can therefore form the following two well-typed predicates on $\mathbf{T}$:

| Relation | Internal meaning | External meaning |
|---|---|---|
| $\mathbf{s} \leq_{\mathrm{int}} \mathbf{t}$ | $\mathbf{s}$ is a sub-history of $\mathbf{t}$ | prefix order $s \leq t$ |
| $\mathbf{s} \perp_{\mathrm{int}} \mathbf{t}$ | $\mathbf{s}$ commutes with $\mathbf{t}$ | disjoint step-sets |

These are genuinely different predicates. The first ranges over the PAST of $t$; the
second ranges over the CONCURRENT extensions of $t$.

#### Internal Definition of the Saturation Nucleus {#ind-sigma}

$$
\mathbf{\sigma}^{\mathrm{int}}_t(a)
\;:=\;
\bigvee \Bigl\{\, b \in \mathbf{H}_t \;:\;
\forall\, \mathbf{s} \in \mathbf{T},\;
\mathbf{s} \leq_{\mathrm{int}} t
\;\Rightarrow\;
\rho_{\mathbf{s}, t}(b) = \rho_{\mathbf{s}, t}(a) \Bigr\}.
$$

This is the saturation condition: $b$ and $a$ have identical restriction profiles to all
sub-histories. By §history-object-constant, $\mathbf{\sigma}^{\mathrm{int}}_t = \sigma_t$
— the internal and external saturation nuclei coincide.

#### Internal Definition of the Transfer Nucleus {#ind-delta}

$$
\mathbf{\Delta}^{\mathrm{int}}_t(a)
\;:=\;
\bigwedge \Bigl\{\, b \in \mathbf{H}_t \;:\;
\forall\, \mathbf{s} \in \mathbf{T},\;
\mathbf{s} \perp_{\mathrm{int}} t
\;\Rightarrow\;
\exists\, \hat{b} \in \mathbf{H}_{s \star t},\;
H(i_{s,t})(\hat{b}) = b
\;\text{ and }\; b \geq a \Bigr\}.
$$

This is the transfer condition: $b$ is witnessed by one-step extensions in every
commuting direction. This internal formula is well-formed because $s \star t$ and the
extension morphism $i_{s,t}: t \to s \star t$ are expressible using $\mathbf{T}$ and the
monoidal structure of $T$. The result is $\mathbf{\Delta}^{\mathrm{int}}_t = \Delta_t$.

#### Internal Definition of the Fixed Fiber {#ind-fixed-fiber}

$$
\mathbf{H}_t^*
\;:=\;
\mathrm{Fix}(\mathbf{\sigma}^{\mathrm{int}}_t)
\;\cap\;
\mathrm{Fix}(\mathbf{\Delta}^{\mathrm{int}}_t)
\;=\;
\mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)
\;=\; H_t^*.
$$

The fixed fiber is the intersection of the two internally-defined fixed-point conditions.
It is internally definable, and coincides with the external fixed fiber.

#### The Internal Language Distinguishes the Two Nuclei {#ind-distinction}

The two nuclei are NOT internally indistinguishable: they use different relations on
$\mathbf{T}$. The saturation nucleus uses $\leq_{\mathrm{int}}$ (past quantification);
the transfer nucleus uses $\perp_{\mathrm{int}}$ (extension quantification). These are
different subobjects of $\mathbf{T} \times \mathbf{T}$ in $\mathbf{Sh}(T, J)$.

The intermediate layer $\mathrm{Fix}(\sigma_t) \setminus H_t^*$ — propositions that are
backward-stable but not forward-stable — is visible in the internal language: it consists
of elements satisfying the $\leq_{\mathrm{int}}$ condition but not the $\perp_{\mathrm{int}}$
condition.

#### Corollary — $H_t^*$ Is a Heyting Subalgebra Internally {#ind-heyting}

For $a, b \in H_t^*$:
$$
a \Rightarrow_{H_t^*} b \;=\; a \Rightarrow_{H_t} b.
$$
Both nuclei fix elements of $H_t^*$ and commute with implication. Therefore $H_t^*
\hookrightarrow H_t$ is a Heyting subalgebra embedding — not merely a lattice embedding.
The internal language computes implications in $H_t^*$ the same way it computes
implications in $H_t$: the nuclei select which propositions are doubly-quiescent, but
do not alter the logical relations among them.
