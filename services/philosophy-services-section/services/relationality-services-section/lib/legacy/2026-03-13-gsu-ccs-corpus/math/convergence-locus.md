---
id: convergence-locus
name: ConvergenceLocus
description: "a convergence locus is a pair of opposite-oriented poles on an ordered structure with a joint fixed-point locus where both poles act trivially — the abstract pattern underlying all dualities in R."
defines: ConvergenceLocus
---

### Definition — Duality {#convergence-locus}

A **duality** in $R$ is a pair of mathematical structures oriented
in opposite directions relative to some ordering, together with a
**convergence point** — a locus where the two orientations agree. The
convergence is not a compromise between the poles; it is the unique locus
where both poles are simultaneously trivial. Everything outside the convergence
is in tension.

The precise definition has three components:

---

#### The General Pattern {#duality-pattern}

Let $P$ be an ordered structure (a frame, a poset, a sheaf category). A
**duality on $P$** consists of:

1. **Two poles** $\alpha$ and $\beta$ — maps (operators, functors, or natural
   transformations) on $P$ that are oriented in opposite directions. One is
   *inflationary* ($a \leq \alpha(a)$) and the other *deflationary*
   ($\beta(a) \leq a$), or one is a left adjoint where the other is right, or
   one builds while the other observes.

2. **A convergence** $P^* \hookrightarrow P$ — the joint fixed-point locus
   $\{a \in P : \alpha(a) = a \text{ and } \beta(a) = a\}$, or equivalently
   the intersection of the fixed-point sets of the two poles.

3. **A separating pairing** — an operation that witnesses that $P^*$ is large
   enough to distinguish everything: knowing how an element interacts with
   the convergence suffices to identify it. (Concretely: two elements of one
   pole's fixed set are equal iff they agree on all elements of the other
   pole's fixed set.)

A duality is **tight** when the convergence locus $P^*$ recovers $P$ entirely
— when every element of $P$ is determined by its projection into $P^*$.

---

#### What Makes It a Duality, Not Just a Pair {#duality-not-a-pair}

Not every pair of operators is a duality. A duality requires:

- **Opposite orientations.** Each pole approaches $P$ from a different
  direction. The nucleus dyad $(\sigma, \Delta)$ illustrates this: $\sigma$
  settles what the *past* forces; $\Delta$ settles what the *future* demands.
  They orient in opposite temporal directions.

- **A shared fixed-point locus.** The convergence must be definable from
  either pole. $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
  is simultaneously the locus where saturation acts trivially and where
  transfer acts trivially. The convergence belongs to both.

- **Non-triviality.** A duality with $P^* = P$ is not a duality — it is just
  an identity. A duality must have elements that are *not yet* at the
  convergence, creating the tension that the duality names.

---

#### The Role of Duality in the Construction {#duality-role}

Every major construction of $R$ is driven by a duality:

- The **nucleus duality** ($\sigma$, $\Delta$) generates the fixed fiber
  $H_t^*$, the stable layer of each fiber Heyting algebra
  (§saturation-transfer-dyad).

- The **stabilization–envelope duality** (stabilization, stable-envelope) bounds the
  instability of any proposition from above and below simultaneously
  (§stabilization-envelope-dyad).

- The **construction-observation duality** ($H$, $H^\vee$) identifies
  what is constructible with what is observable at the stable level
  (§observation-duality).

- The **limit-colimit duality** (assembly from below, determination from
  above) converges in ambidexterity (§ambidexterity).

- The **bulk-boundary duality** ($R$, $\mathsf{Phase}$) converges in the
  holographic isomorphism at the self-generation fixed point (§relational-holograph).

- The **restriction–carrier duality** (restriction, process carrier) converges
  in the counit identity of directed comonads (§restriction-carrier-dyad).

Each duality has its own mechanism — a specific mathematical reason why
these two poles converge to this particular locus. The mechanism files
(planned: `duality-by-nucleus-axioms.md`, `duality-by-sheaf-adjunction.md`,
etc.) will document each mechanism separately.

---

#### The Catalog {#duality-catalog}

For the annotated list of all known dualities of $R$, see
§dyad (the dyad catalog), §triad-catalog (the triad catalog), and §tetrad
(the tetrad catalog).
