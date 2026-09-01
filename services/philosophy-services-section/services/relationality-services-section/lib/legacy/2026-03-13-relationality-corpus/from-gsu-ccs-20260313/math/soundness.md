---

name: soundness
description: "Soundness"
---

### Theorem — Soundness {#soundness}

We write $M \equiv N : \mathsf{Prop}$ for the FiberNuclearLanguage propositional-modal
equational theory: the equations for $\wedge, \vee, \Rightarrow_t, \top, \bot$ (Heyting
algebra laws) and the nucleus axioms of $\mathsf{Saturate}, \mathsf{Transfer}$ (extensivity,
idempotency, meet-preservation, commutativity).

**Theorem — Soundness (fiber level).** For every derivable judgment
$x_1 : \mathsf{Prop}, \ldots, x_n : \mathsf{Prop} \vdash M : \mathsf{Prop}$
and every history $t \in \mathrm{Ob}(T)$:

1. The fiber interpretation $\llbracket M \rrbracket_t : H_t^n \to H_t$ exists and
   is independent of the derivation.

2. If $\vdash M \equiv N : \mathsf{Prop}$ is derivable, then
   $\llbracket M \rrbracket_t = \llbracket N \rrbracket_t$ as maps $H_t^n \to H_t$.

*Proof.* The interpretation $\llbracket - \rrbracket_t$ is defined inductively on the
structure of $M$: propositional variables map to projections $H_t^n \to H_t$; the
Heyting connectives map to the HA operations; $\mathsf{Saturate}$ and $\mathsf{Transfer}$ map
to $\sigma_t$ and $\Delta_t$. Equational axioms hold because $H_t$ satisfies the Heyting
algebra laws and the nucleus axioms by the fiber doctrine. $\square$

The FiberNuclearLanguage quartet stratification — that the four nuclear operator patterns correspond
to the four sub-algebras of the fiber nuclear quartet — is stated as a separate
corollary in §quartet-stratification-soundness.

The universe-level lift — that the fiber interpretations $\llbracket - \rrbracket_t$
assemble into natural transformations and morphisms in $R$ — is stated in
§universe-soundness after $R = \mathbf{Sh}(T,J)$ is constructed.
