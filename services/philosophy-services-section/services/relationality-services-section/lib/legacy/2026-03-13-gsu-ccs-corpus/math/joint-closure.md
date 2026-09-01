---
id: joint-closure
description: "The image of a proposition under the joint projection: the least proposition fixed by both nuclei above M, occupying the doubly quiescent corner of the nuclear quartet termset."
---

### Definition — Joint Closure {#joint-closure}

The **joint closure** of a proposition $M$ is the term $\mathrm{Saturate}(\mathrm{Transfer}(M))$,
whose denotation at history $t$ is $\pi_t(\llbracket M \rrbracket_t)$ — the image of
$\llbracket M \rrbracket_t$ under the joint projection $\pi_t = \sigma_t \circ \Delta_t$.

It is the least element of $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
above $\llbracket M \rrbracket_t$:
$$
\pi_t\bigl(\llbracket M \rrbracket_t\bigr) \;=\; \min\bigl\{\, b \in H_t^* \;\big|\; b \geq \llbracket M \rrbracket_t \,\bigr\}.
$$

#### Two Paths, One Term {#joint-closure-two-paths}

Because the saturation and transfer nuclei commute:
$$
\mathrm{Saturate}(\mathrm{Transfer}(M)) \;=\; \mathrm{Transfer}(\mathrm{Saturate}(M)).
$$
Both composite terms denote the same element $\pi_t(\llbracket M \rrbracket_t)$. In
[FiberNuclearLanguage](fiber-nuclear-language.md), reduction rule R7 orients the canonical
written form to $\mathrm{Saturate}(\mathrm{Transfer}(M))$ — Transfer applied first,
then Saturate — encoding the temporal direction: settle $M$ against what all extensions
share (Transfer), then close against what the accumulated history forces (Saturate).

#### Key Properties {#joint-closure-properties}

- **Above both individual closures**: $\mathrm{Saturate}(M) \leq \mathrm{Saturate}(\mathrm{Transfer}(M))$ and $\mathrm{Transfer}(M) \leq \mathrm{Saturate}(\mathrm{Transfer}(M))$.
- **Fixed under both nuclei**: $\mathrm{Saturate}(\mathrm{Saturate}(\mathrm{Transfer}(M))) = \mathrm{Saturate}(\mathrm{Transfer}(M))$ and $\mathrm{Transfer}(\mathrm{Saturate}(\mathrm{Transfer}(M))) = \mathrm{Saturate}(\mathrm{Transfer}(M))$ — by idempotency and commutativity.
- **Least such**: no element of $H_t^*$ between $\llbracket M \rrbracket_t$ and $\pi_t(\llbracket M \rrbracket_t)$ exists.

#### Role in the Nuclear Quartet Termset {#joint-closure-in-termset}

The joint closure occupies the $A^*$ corner of the
[nuclear quartet termset](nuclear-quartet-termset.md) of $M$ — the doubly quiescent
corner where both nuclei are trivial. It is the endpoint of both paths through the
termset: Saturate-then-Transfer and Transfer-then-Saturate both arrive here.
