---

name: modal-logic
description: "Modal Logic of the Fiber Nuclei"
---

### Theorem — Modal Logic of the Fiber Nuclei {#modal-logic}

**Setting.** Each fiber Heyting algebra $(H_t, \sigma_t, \Delta_t)$ carries two
nucleus operators. There are two dual conventions for naming modal operators, and
they must not be conflated:

- **Topos-theoretic / KZ-monad convention** (used here): the nucleus $\sigma_t$
  is the **box** $\square$ (it is inflationary: $a \leq \square a$). The interior
  $i_{\sigma_t}(a) = \neg_t \sigma_t(\neg_t a)$ is the **diamond** $\lozenge$
  (it is deflationary: $\lozenge a \leq a$). This matches Lawvere-Tierney
  topologies on toposes, where the closure operator is the modality.

- **Classical Kripke S4 convention** (not used here): the box $\square$ is
  deflationary ($\square a \leq a$, "if necessarily $a$ then $a$") and corresponds
  to the interior, not the closure. Under this convention our $\sigma_t$ would be
  the diamond.

We follow the topos-theoretic convention throughout. The physical interpretation:
$\square_t(a) = \sigma_t(a)$ means "the saturation of $a$" — the weakest statement
that is at least as settled as $a$. The axiom $a \leq \square a$ reads: "every
proposition entails its saturated form."

#### Theorem — KZ Modalities {#thm-kz-modal}

The box modality $\square_t := \sigma_t$ on $H_t$ is a
**Kock–Zöberlein (KZ) lax-idempotent** modality:

1. **Monotone.** $a \leq b \Rightarrow \square_t(a) \leq \square_t(b)$.

2. **Inflationary.** $a \leq \square_t(a)$ (the unit of the nucleus).

3. **Lax idempotent.** $\square_t(\square_t(a)) = \square_t(a)$ (idempotence of
   $\sigma_t$); in the KZ sense, the comparison $\square \leq \square\square$
   is witnessed by inflationarity, and the collapse $\square\square \leq \square$
   is witnessed by idempotence.

4. **Distributes over meets.** $\square_t(a \wedge b) = \square_t(a) \wedge \square_t(b)$
   (since nuclei preserve meets).

The diamond modality $\lozenge_t := i_{\sigma_t}$ satisfies the dual laws:
$\lozenge_t(a \vee b) = \lozenge_t(a) \vee \lozenge_t(b)$ and
$\lozenge_t(\lozenge_t(a)) = \lozenge_t(a)$, with $\lozenge_t(a) \leq a$.

#### Theorem — Dynamic Residuation as Modal Implication {#thm-modal-implication}

The dynamic residuation $\sigma\!\supset\!(a, b)$ (§dynamic-residuation) is
the **modal implication** in the KZ modal logic: it is the right adjoint of
$a \mapsto \square_t(a \wedge \_)$ in the Heyting algebra $H_t$.
In the KZ convention, $\sigma_t$ validates the following modal axioms:
- **T** (reflexivity): $a \leq \square a$ — the nucleus unit.
- **4** (transitivity): $\square\square a = \square a$ — nucleus idempotence, so
  $\square a \leq \square\square a$ (and equality, stronger than S4's $\leq$).
These are the axioms of the modal logic $\mathbf{S4}$ (in the Lawvere-Tierney
formulation). The underlying "Kripke frames" are the fiber inclusions: one history
is accessible from another if it is an extension ($t \leq t'$ in $T$).

#### Theorem — Temporal Tower {#thm-temporal-modal}

Stacking the modal operators along the depth-filtration tower
$R_0 \hookrightarrow R_1 \hookrightarrow \cdots$ yields a **temporal modal logic**:

- $\square^{(n)}$ = the box modality at depth $n$ = "necessarily at depth $n$";
- $\lozenge^{(n)}$ = the diamond modality at depth $n$ = "possibly at depth $n$";
- The tower limit gives $\square^{(\infty)}$, the modality corresponding to the
  invariant locale $\mathsf{Phase}$ (§invariant-locale): $\square^{(\infty)}(a) =
  \pi_t(a) = \sigma_t(\Delta_t(a))$ (§joint-projection), the joint projection to $H^*$. This
  limit modality is conjectured to validate $\mathbf{S5}$ (equivalence-relation
  frames), since $H^*$ identifies orbit-equivalent fiber elements; but the axiom-5
  condition ($a \leq \square\lozenge a$) requires that every proposition is below
  the saturation of its interior, which is not immediate and needs proof.

**Relation to four-adjoints.** The KZ pair $(\square, \lozenge)$ is the
1-categorical shadow of the four-adjoint chain
$\Pi_\to \dashv \square \dashv \lozenge \dashv \nabla_\leftarrow$
(§modal-adjoint-chain) — the inner two functors of the cohesive structure. The outer
pair ($\Pi_\to$, $\nabla_\leftarrow$) measure the "extent" and "spread" of the
modal frames.

**Status.** Stub. Requires: (a) proof that $\sigma_t$ defines a KZ modality
(inflationarity is the nucleus unit; idempotence is by definition); (b) a precise
identification of the temporal-tower logic as S4 at finite depth and S5 at the
limit; (c) connection between $\lozenge$ and the stable-envelope operator
$\mathrm{Env}_t$ (§stable-envelope).
