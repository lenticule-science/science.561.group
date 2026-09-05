---
name: saturation-closure

description: "The image of a proposition under the saturation nucleus: the least saturation-fixed proposition above M, occupying the Saturate corner of the nuclear quartet termset."
---

### Definition — Saturation Closure {#saturation-closure}

The **saturation closure** of a proposition $M$ is the term $\mathrm{Saturate}(M)$,
whose denotation at history $t$ is $\sigma_t(\llbracket M \rrbracket_t)$ — the image of
$\llbracket M \rrbracket_t$ under the saturation nucleus $\sigma_t$.

It is the least element of $\mathrm{Fix}(\sigma_t)$ above $\llbracket M \rrbracket_t$:
$$
\sigma_t\bigl(\llbracket M \rrbracket_t\bigr) \;=\; \min\bigl\{\, b \in \mathrm{Fix}(\sigma_t) \;\big|\; b \geq \llbracket M \rrbracket_t \,\bigr\}.
$$

#### Key Properties {#saturation-closure-properties}

- **Above $M$**: $M \leq \mathrm{Saturate}(M)$ — extensivity of $\sigma_t$.
- **Idempotent**: $\mathrm{Saturate}(\mathrm{Saturate}(M)) = \mathrm{Saturate}(M)$ — the closure is already saturation-fixed (reduction rule R1).
- **Meet-distributing**: $\mathrm{Saturate}(M \wedge N) = \mathrm{Saturate}(M) \wedge \mathrm{Saturate}(N)$ (reduction rule R3).

#### Role in the Nuclear Quartet Termset {#saturation-closure-in-termset}

The saturation closure occupies the $\mathrm{Fix}(j_1)$ corner of the
[nuclear quartet termset](nuclear-quartet-termset.md) of $M$. It is quiescent under
Saturate but not necessarily under Transfer. Applying Transfer to it yields the
[joint closure](joint-closure.md): $\mathrm{Transfer}(\mathrm{Saturate}(M)) =
\mathrm{Saturate}(\mathrm{Transfer}(M))$ by commutativity of the nuclei.
