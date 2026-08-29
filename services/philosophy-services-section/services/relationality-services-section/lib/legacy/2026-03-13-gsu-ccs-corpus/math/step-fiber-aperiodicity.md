---
id: step-fiber-aperiodicity
name: StepFiberAperiodicity
description: "Theorem (gap identified): fiber algebras are non-isomorphic along any G_s orbit — distinct histories produced by repeated step-application carry non-isomorphic nuclear Heyting algebras."
---

### Theorem — Step-Fiber Aperiodicity {#step-fiber-aperiodicity}

For any step $s \in \Sigma$, history $t \in T$, and $n > 0$, the fiber algebras
$H_t$ and $H_{s^n \star t}$ are non-isomorphic as objects of $\mathbf{HA_{nucl}}$:
there is no isomorphism of nuclear Heyting algebras $(H_t, \sigma_t, \Delta_t)
\cong (H_{s^n \star t}, \sigma_{s^n \star t}, \Delta_{s^n \star t})$.

#### What Is Established {#step-fiber-aperiodicity-proved}

**The histories are distinct.** By §history-orbit-aperiodicity, the orbit
$t, s \star t, s^2 \star t, \ldots$ consists of pairwise distinct objects of $T$,
each of strictly greater depth. This part requires no appeal to fiber algebras or
modal structure.

**A symmetry argument is not available.** One might attempt to apply the Axiom of
History Separation (§history-separation) to rule out a fiber isomorphism. History
Separation states that no nontrivial *automorphism* of $T$ is invisible to $H^*$.
But the left-shift $\varphi_s : t \mapsto s \star t$ is not an automorphism — it is
an injective endomorphism that strictly increases depth and is not surjective (no
history beginning with a different step is in its image). History Separation is
therefore silent on whether $H_t \cong H_{s^n \star t}$.

#### The Gap {#step-fiber-aperiodicity-gap}

Closing the argument requires the following, which is not yet established:

> **Object-faithfulness of $H$.** If $t \neq t'$ in $T$, then $H_t \not\cong H_{t'}$
> in $\mathbf{HA_{nucl}}$.

This is the *strong* form of History Separation: not merely that no automorphism is
invisible, but that the functor $H$ is faithful on objects (distinct histories are
sent to non-isomorphic fiber algebras). The informal description of the axiom — "distinct
histories have genuinely distinct modal characters" — asserts this strong form. The
formal statement as automorphism-reflection is weaker.

Two routes exist for closing the gap:

1. **Strengthen the axiom.** Restate History Separation to include object-faithfulness
   of $H$ as an explicit condition, motivated by the claim that every step introduces
   genuinely new modal content that no isomorphism can absorb.

2. **Derive it from depth-complexity growth.** Show that $\dim H_{s \star t} >
   \dim H_t$ as Heyting algebras (or equivalently, that applying a step strictly
   increases the complexity of the fiber algebra). The nuclear Fibonacci recurrence
   (§nuclear-fibonacci-recurrence) establishes strict growth at the tower level; a
   within-$R$ analogue would supply this route.

**Status.** The T-level claim (distinct histories) is proved. The fiber-level claim
(non-isomorphic algebras) has the gap above. The theorem is stated in full as the
target; the gap is the open condition.
