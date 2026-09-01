---

name: saturation-normalizer
description: "σ_t as Semantic Normalizer and Logical Depth"
---

### Theorem — $\sigma_t$ as Semantic Normalizer and Logical Depth {#saturation-normalizer}

#### Motivation {#saturation-normalizer-motivation}

The saturation nucleus $\sigma_t: H_t \to H_t$ (§fiber-doctrine) is defined by:
$$
\sigma_t(a) \;=\; \bigvee\bigl\{b \in H_t \;\big|\; H(f)(b) \leq H(f)(a) \;\text{ for all } f: t_0 \hookrightarrow t\bigr\}.
$$
This formula says: $\sigma_t(a)$ is the **largest element of $H_t$ that is
observationally indistinguishable from $a$ when viewed from all shorter histories**.

In information-theoretic terms, $\sigma_t(a)$ is the **normal form** of $a$ under the
equivalence "same restriction profile." Two propositions $a, b \in H_t$ satisfy
$\sigma_t(a) = \sigma_t(b)$ if and only if they have identical restrictions to every
ancestor history — they are semantically equivalent from the outside. The nucleus
$\sigma_t$ compresses $a$ to the most general (largest) proposition consistent with all
observed restrictions.

#### σ_t as Semantic Normalizer {#saturation-normalizer-claim}

This observation makes $\sigma_t$ a **semantic normalizer** in the following sense:

- It maps each proposition $a$ to its **canonical representative** in the equivalence
  class $[a]_{\sigma}$ of all propositions with the same external appearance.
- The fixed points $\mathrm{Fix}(\sigma_t)$ are the propositions that already equal
  their own normal form: they carry no "internal redundancy" relative to the external
  view.
- The iteration $a \leq \sigma_t(a)$ (idempotence: $\sigma_t(\sigma_t(a)) = \sigma_t(a)$)
  means normalization is **idempotent**: applying it twice yields nothing new.

Compare to string normalization: $\sigma_t$ is the analogue of reducing a word to its
canonical form under a rewriting system. The "rewriting rules" are the restriction maps,
and the "normal form" is the largest element they allow.

#### Connection to Logical Depth {#saturation-normalizer-depth}

**Conjecture.** The sequence of saturation nuclei $\{\sigma_{t|_n}\}_{n=0}^{\infty}$
along the depth filtration (§depth-filtration) is a **monotone increase in the logical
depth** of the canonical representative in the following sense:

At depth $n$, $\sigma_{t|_n}(a)$ is the normal form of $a$ using only depth-$n$
restriction data. As $n$ increases, more restriction maps become available, potentially
refining the equivalence classes. The sequence $\sigma_{t|_0}(a) \geq \sigma_{t|_1}(a)
\geq \cdots$ is non-increasing (the more external data available, the more the
canonical form can be refined downward toward $a$).

The **logical depth** of a proposition $a$ is the smallest $n$ at which
$\sigma_{t|_n}(a) = a$: the depth at which $a$ is already its own canonical form.
A proposition with small logical depth is "simple" — it agrees with its external
appearance at a shallow level. A proposition with large logical depth requires deep
history to be distinguished from strictly larger propositions.

This gives a natural complexity measure on propositions that is internal to the
fiber algebra structure, requiring no external definition of "complexity."

**Status.** This remark is speculative. The logical-depth claim requires: (a) a
precise definition of the depth-restricted nuclei $\sigma_{t|_n}$; (b) proof that
the sequence is non-increasing; (c) a comparison with Kolmogorov complexity or
Bennett's logical depth for the relevant combinatorial structure. Currently stated
as motivation for future work.
