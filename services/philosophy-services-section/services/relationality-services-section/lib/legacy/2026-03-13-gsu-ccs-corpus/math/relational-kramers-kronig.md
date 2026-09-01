---
id: relational-kramers-kronig
name: RelationalKramersKronig
description: "π appears as the constant relating absorptive spectral mass to dispersive restriction lag in the relational analogue of the Kramers–Kronig relations."
---

### Conjecture — Relational Kramers–Kronig {#relational-kramers-kronig}

**Statement.** The spectral decomposition (§spectral-decomposition) of a relational universe defines an absorptive part (spectral mass $M_t(\delta)$) and a dispersive part (restriction lag $L_t$). These are related by a Hilbert-transform-type causality law:
$$
L_t(\omega) \;=\; 1 + \frac{1}{\pi}\, \mathcal{P}\!\int \frac{M_t(\omega')}{\omega' - \omega}\, d\omega'
$$
where $\mathcal{P}$ denotes principal value and $\omega$ parametrizes the spectral mode. The constant $1/\pi$ arises from the causality structure of the restriction maps, exactly as in the classical Kramers–Kronig relations for dispersive media.

**Motivation.** In classical wave theory, the Kramers–Kronig relations express causality: a medium cannot respond before it is excited. The absorptive part (imaginary part of the response) and the dispersive part (real part) are Hilbert transforms of each other, with $\pi$ as the normalization constant.

In the relational universe, restriction maps $H(f) : H_{t'} \to H_t$ carry information from future histories $t'$ back to past histories $t$. This is the analogue of a causal response: the fiber at $t$ cannot see beyond its light cone, which is determined by the restriction maps. The spectral mass measures how much response there is at each frequency; the restriction lag measures how much the fiber's response is delayed relative to the excitation.

Causality in this framework is not temporal — it is the constraint that the fiber $H_t$ can only see what the restriction maps from $t' > t$ deliver. The Kramers–Kronig structure is then a consequence of this causality constraint applied to the spectral decomposition.

**Note.** This conjecture and §phase-normalization-constant are two routes to the same conclusion: $\pi$ as a structural constant of the spectral theory. One route is Fourier normalization on $\mathsf{Phase}$; the other is Hilbert-transform causality on the spectral restriction maps. They should be proved together or as a single unit with two proofs.

**What a proof requires.**

1. A precise definition of the restriction lag $L_t$ as a function of the spectral mode $\omega$.

2. A causality axiom for the relational universe: some version of "the fiber $H_t$ cannot respond to events at $t' > t$ before they arrive via restriction maps."

3. Derivation of the Hilbert-transform relation from the causality axiom, yielding $1/\pi$ as the normalization constant.

**Depends on:** §spectral-decomposition.
