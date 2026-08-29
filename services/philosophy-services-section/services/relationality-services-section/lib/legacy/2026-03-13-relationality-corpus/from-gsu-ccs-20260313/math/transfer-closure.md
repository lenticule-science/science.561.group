---
name: transfer-closure

description: "The image of a proposition under the transfer nucleus: the least transfer-fixed proposition above M, occupying the Transfer corner of the nuclear quartet termset."
defines: TransferClosure
---

### Definition — Transfer Closure {#transfer-closure}

The **transfer closure** of a proposition $M$ is the term $\mathrm{Transfer}(M)$,
whose denotation at history $t$ is $\Delta_t(\llbracket M \rrbracket_t)$ — the image of
$\llbracket M \rrbracket_t$ under the transfer nucleus $\Delta_t$.

It is the least element of $\mathrm{Fix}(\Delta_t)$ above $\llbracket M \rrbracket_t$:
$$
\Delta_t\bigl(\llbracket M \rrbracket_t\bigr) \;=\; \min\bigl\{\, b \in \mathrm{Fix}(\Delta_t) \;\big|\; b \geq \llbracket M \rrbracket_t \,\bigr\}.
$$

#### Key Properties {#transfer-closure-properties}

- **Above $M$**: $M \leq \mathrm{Transfer}(M)$ — extensivity of $\Delta_t$.
- **Idempotent**: $\mathrm{Transfer}(\mathrm{Transfer}(M)) = \mathrm{Transfer}(M)$ — the closure is already transfer-fixed (reduction rule R2).
- **Meet-distributing**: $\mathrm{Transfer}(M \wedge N) = \mathrm{Transfer}(M) \wedge \mathrm{Transfer}(N)$ (reduction rule R4).

#### Role in the Nuclear Quartet Termset {#transfer-closure-in-termset}

The transfer closure occupies the $\mathrm{Fix}(j_2)$ corner of the
[nuclear quartet termset](nuclear-quartet-termset.md) of $M$. It is quiescent under
Transfer but not necessarily under Saturate. Applying Saturate to it yields the
[joint closure](joint-closure.md): $\mathrm{Saturate}(\mathrm{Transfer}(M))$, which
is the canonical written form by reduction rule R7.
