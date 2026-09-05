---
id: canonical-retraction
name: CanonicalRetraction
description: "σ_t ∘ Δ_t is a nucleus on H_t with fixed-point set H_t* — proved without the commutativity axiom, using only the fiber doctrine's requirement that restriction maps commute with nuclei."
---

### Theorem — Canonical Retraction {#canonical-retraction}

**Theorem.** Without assuming the commutativity axiom $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$,
the composite $\pi_t := \sigma_t \circ \Delta_t$ is a nucleus on $H_t$ with
$$
\mathrm{Fix}(\pi_t) \;=\; \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t) \;=\; H_t^*.
$$
Moreover, $\pi_t(a)$ is the minimum element of $H_t^*$ above $a$: it is the canonical
reflection of $H_t$ onto $H_t^*$.

**What this uses.** The proof uses only:

1. The definitions of $\sigma_t$ (§saturation-nucleus) and $\Delta_t$ (§transfer-nucleus)
   as nuclei on $H_t$.
2. The fiber doctrine (§fiber-doctrine): for every morphism $f : t \to t'$ in $T$, the
   restriction map $H(f) : H_{t'} \to H_t$ is a morphism in $\mathbf{HA_{nucl}}$ —
   it commutes with both nuclei.

It does **not** use the commutativity axiom. The commutativity axiom ($\Delta_t \circ \sigma_t = \sigma_t \circ \Delta_t$) is the additional condition asserting that $\Delta_t \circ \sigma_t$ gives the **same** retraction; the present theorem handles $\sigma_t \circ \Delta_t$ alone.

#### Proof {#canonical-retraction-proof}

**Extensivity.** $\pi_t(a) = \sigma_t(\Delta_t(a)) \geq \Delta_t(a) \geq a$, since $\sigma_t$
and $\Delta_t$ are each extensive. ✓

**Meet-preservation.** $\Delta_t$ is meet-preserving and $\sigma_t$ is meet-preserving;
their composite is:
$$
\pi_t(a \wedge b) = \sigma_t(\Delta_t(a \wedge b)) = \sigma_t(\Delta_t(a) \wedge \Delta_t(b))
= \sigma_t(\Delta_t(a)) \wedge \sigma_t(\Delta_t(b)) = \pi_t(a) \wedge \pi_t(b).
\checkmark
$$

**$\pi_t(a) \in \mathrm{Fix}(\sigma_t)$.** Since $\pi_t(a) = \sigma_t(\Delta_t(a))$ is a
value of $\sigma_t$ and $\sigma_t$ is idempotent:
$$
\sigma_t(\pi_t(a)) = \sigma_t(\sigma_t(\Delta_t(a))) = \sigma_t(\Delta_t(a)) = \pi_t(a). \checkmark
$$

**$\pi_t(a) \in \mathrm{Fix}(\Delta_t)$.** This is the central step. Set $b := \Delta_t(a)$;
we must show $\sigma_t(b) \in \mathrm{Fix}(\Delta_t)$.

Recall (§transfer-nucleus):
$$
\mathrm{Fix}(\Delta_t) \;=\; \bigcap_{\substack{s \in \Sigma \\ s \perp t}}
\mathrm{image}\!\bigl(H(i_{s,t}) : H_{s \star t} \to H_t\bigr),
$$
where $i_{s,t} : t \to s \star t$ is the one-step extension morphism. An element
$c \in H_t$ lies in $\mathrm{Fix}(\Delta_t)$ iff for every $s \perp t$ there exists a
**witness** $\hat{c} \in H_{s\star t}$ with $H(i_{s,t})(\hat{c}) = c$.

Since $b = \Delta_t(a) \in \mathrm{Fix}(\Delta_t)$, for each $s \perp t$ there exists
$\hat{b} \in H_{s\star t}$ with $H(i_{s,t})(\hat{b}) = b$.

Define $\hat{c} := \sigma_{s\star t}(\hat{b}) \in H_{s\star t}$.

By the fiber doctrine, $H(i_{s,t})$ is a morphism in $\mathbf{HA_{nucl}}$: it commutes
with $\sigma$. Therefore:
$$
H(i_{s,t})(\hat{c}) \;=\; H(i_{s,t})(\sigma_{s\star t}(\hat{b}))
\;=\; \sigma_t(H(i_{s,t})(\hat{b})) \;=\; \sigma_t(b).
$$

So $\hat{c}$ is a witness for $\sigma_t(b)$ at $s$. Since $s \perp t$ was arbitrary,
$\sigma_t(b) \in \bigcap_{s \perp t} \mathrm{image}(H(i_{s,t})) = \mathrm{Fix}(\Delta_t)$.

Therefore $\Delta_t(\pi_t(a)) = \Delta_t(\sigma_t(b)) = \sigma_t(b) = \pi_t(a)$. ✓

**Idempotence.** From the two preceding steps, $\pi_t(a) \in \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t) = H_t^*$.
In particular $\Delta_t(\pi_t(a)) = \pi_t(a)$ and $\sigma_t(\pi_t(a)) = \pi_t(a)$, so:
$$
\pi_t(\pi_t(a)) \;=\; \sigma_t(\Delta_t(\pi_t(a))) \;=\; \sigma_t(\pi_t(a)) \;=\; \pi_t(a). \checkmark
$$

**Fixed-point set.** ($\supseteq$) If $a \in H_t^*$ then $\Delta_t(a) = a$ and $\sigma_t(a) = a$,
so $\pi_t(a) = a$. ($\subseteq$) If $\pi_t(a) = a$, then from the central step,
$a = \pi_t(a) \in \mathrm{Fix}(\Delta_t)$ and from idempotence $a \in \mathrm{Fix}(\sigma_t)$;
more directly: $a = \sigma_t(\Delta_t(a)) \in \mathrm{Fix}(\sigma_t)$ (it is a value of
$\sigma_t$), and from the central step $\sigma_t(\Delta_t(a)) \in \mathrm{Fix}(\Delta_t)$,
so $a \in \mathrm{Fix}(\Delta_t)$. Hence $a \in H_t^*$. ✓

**Minimality.** Suppose $c \in H_t^*$ with $c \geq a$. Since $c \in \mathrm{Fix}(\Delta_t)$
and $\Delta_t(a)$ is the minimum of $\mathrm{Fix}(\Delta_t)$ above $a$: $\Delta_t(a) \leq c$.
Since $\sigma_t$ is monotone and $c \in \mathrm{Fix}(\sigma_t)$:
$\pi_t(a) = \sigma_t(\Delta_t(a)) \leq \sigma_t(c) = c$.
So $\pi_t(a)$ is the minimum element of $H_t^*$ above $a$. $\square$

#### What the Commutativity Axiom Adds {#canonical-retraction-commutativity}

The theorem establishes that $\pi_t = \sigma_t \circ \Delta_t$ is the canonical reflection
of $H_t$ onto $H_t^*$. The commutativity axiom (§nucleus-commutation) asserts:
$$
\sigma_t \circ \Delta_t \;=\; \Delta_t \circ \sigma_t.
$$
This says the reverse composite $\Delta_t \circ \sigma_t$ gives the **same** canonical
retraction. Without it, $\Delta_t \circ \sigma_t$ is extensive and meet-preserving (by
the same arguments as steps 1–2 above), but there is no guarantee that $\Delta_t \circ
\sigma_t$ is idempotent or that its fixed-point set is $H_t^*$: the analog of the central
step (showing $\Delta_t(\sigma_t(a)) \in \mathrm{Fix}(\sigma_t)$) would require that
$\Delta_t$ sends $\mathrm{Fix}(\sigma_t)$ into itself, which requires additional structure
not present in the general fiber doctrine.

The commutativity axiom is correctly an axiom (§nucleus-commutation): it is a
coherence condition on the pair $(\sigma_t, \Delta_t)$, not derivable from the individual
nucleus axioms or the fiber doctrine alone. What is derivable — and is proved here — is
that $\sigma_t \circ \Delta_t$ is always the canonical retraction, so the definition
$\pi_t := \sigma_t \circ \Delta_t$ is well-posed and structure-preserving regardless of
whether the axiom holds.

#### Relation to the Nuclear Quartet Theorem {#canonical-retraction-vs-nqt}

The Nuclear Quartet Theorem (§nuclear-quartet-theorem) proves that *if* $\sigma_t \circ
\Delta_t = \Delta_t \circ \sigma_t$, then $\pi_t$ is a nucleus with $\mathrm{Fix}(\pi_t) =
H_t^*$. Its idempotence step uses commutativity explicitly: $\pi(\pi(a)) = j_1(j_2(j_1(j_2(a)))) =
j_1(j_1(j_2(j_2(a))))$ by swapping $j_2 j_1$ to $j_1 j_2$.

The present theorem replaces that swap with a direct geometric argument using the fiber
doctrine structure. The two proofs establish the same conclusion by different routes;
the present proof is the stronger result.

The canonical retraction $\pi_t$ is the joint projection (§joint-projection). It appears
under three context-specific aliases: semantic normalizer $\mathsf{NF}_t$ (§universe-normalization),
stabilization map (§invariant-locale, §stabilization). The present theorem is the foundational
justification that all contexts share: $\pi_t = \sigma_t \circ \Delta_t$ is a nucleus with
fixed-point set $H_t^*$, proved without the commutativity axiom.
