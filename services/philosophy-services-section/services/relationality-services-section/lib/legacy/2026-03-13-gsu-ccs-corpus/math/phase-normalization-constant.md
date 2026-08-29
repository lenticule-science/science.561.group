---
id: phase-normalization-constant
name: PhaseNormalizationConstant
description: "π appears as the normalization constant of phase-frequency duality on the Invariant Locale."
---

### Conjecture — Phase Normalization Constant {#phase-normalization-constant}

**Statement.** If $\mathsf{Phase}$ (the Invariant Locale, §invariant-locale) carries a Fourier-type transform arising from the spectral decomposition (§spectral-decomposition), then $\pi$ appears as the unavoidable normalization constant of phase-frequency duality. Specifically:
$$
\widehat{f}(\xi) \;=\; \int_{\mathsf{Phase}} f(t)\, e^{-2\pi i \langle \xi, t \rangle}\, d\mu(t)
$$
where $\mu$ is the canonical measure on $\mathsf{Phase}$ induced by the restriction maps, and the factor $2\pi$ (equivalently $\pi$ in the one-sided convention) arises from the duality between phase and frequency in the spectral decomposition.

**Motivation.** The existing spectral language already uses a Kramers–Kronig-style bridge with an explicit $1/\pi$ factor (§relational-kramers-kronig). Making that analogy literal — a Fourier transform on a measure carried by $\mathsf{Phase}$ — gives $\pi$ a structural role: the normalization factor of the Hilbert transform connecting real and imaginary parts of the spectral restriction map.

On this reading, $\pi$ is not the circumference constant — it is the phase constant of the spectral decomposition. It appears because the spectrum of the history site has a natural frequency interpretation, and the duality between the position basis (history $t$) and the frequency basis (spectral mode $\xi$) requires a normalization.

**What a proof requires.**

1. Construction of the Fourier transform on $\mathsf{Phase}$ as a locale. This requires a spectral measure on $\mathsf{Phase}$ from the restriction-map structure.

2. Identification of the factor $\pi$ in the normalization as arising specifically from the half-period structure of the duality, not from a circular geometry.

3. Connection to §relational-kramers-kronig: the two routes (Fourier normalization and Kramers–Kronig causality) should yield the same structural role for $\pi$.

**Depends on:** §invariant-locale, §spectral-decomposition.
