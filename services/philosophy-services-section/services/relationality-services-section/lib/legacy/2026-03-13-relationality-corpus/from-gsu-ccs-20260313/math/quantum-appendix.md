---

name: quantum-appendix
description: "Lesson: Appendix: Quantum Mechanics Correspondence"
defines: QuantumAppendix
---

## Appendix: Quantum Mechanics Correspondence {#quantum-appendix}

This appendix describes the correspondence between the relational universe and
finite-dimensional quantum mechanics. The purpose is not to derive QM from first
principles but to exhibit how the earned mathematical structures of $R$ support a
fragment of the quantum formalism, so that quantum-mechanical intuitions can inform
future development.

### Definition — State–Observable–Evolution–Measurement

In finite-dimensional quantum mechanics over a Hilbert space $\mathcal{H}$:

- **States** are density operators $\rho \in \mathrm{End}(\mathcal{H})$ with
  $\rho \geq 0$ and $\mathrm{Tr}(\rho) = 1$.
- **Observables** are self-adjoint operators $A \in \mathrm{End}(\mathcal{H})$
  with spectral decomposition $A = \sum_\lambda \lambda P_\lambda$.
- **Evolution** is a unitary operator $U_t \in \mathrm{End}(\mathcal{H})$; the
  Schrödinger picture gives $\rho \mapsto U_t \rho U_t^\dagger$.
- **Measurement** gives outcome $\lambda$ with probability $\mathrm{Tr}(\rho P_\lambda)$
  (Born rule) and collapses $\rho \mapsto P_\lambda \rho P_\lambda / \mathrm{Tr}(\rho P_\lambda)$.

### The Relational Correspondence

The relational universe supports a correspondence with each ingredient:

| QM concept | Relational counterpart |
|---|---|
| Density operator $\rho$ | An element of the fixed fiber $H_t^*$ normalized by the fiber entropy $\mathcal{H}_t$ (§entropy) |
| Observable $A$ | A fiber element $a \in H_t^*$ with spectral decomposition $H_t^* = \bigoplus_\lambda E_{t,\lambda}$ (§spectral-decomposition) |
| Unitary evolution $U_t$ | Application of the directed comonad $U_G$ (§directed-comonad); reversible by the detailed balance condition (§detailed-balance) |
| Born rule | The spectral weight $p_{t,\lambda} = \lambda \cdot \dim_K E_{t,\lambda} / M_t(\delta)$ (§entropy) |
| Measurement collapse | The saturation nucleus $\sigma_t$ acting on a fiber element: collapse to the $\sigma_t$-stable part |
| Schrödinger picture | The dynamics on fibers via $U_G$ |
| Heisenberg picture | The dual action on observables via observation duality (§observation-duality) |

### The Schrödinger–Heisenberg Duality

The observation duality of §observation-duality — the exact duality between
construction (dynamics on fibers) and observation (algebra of invariant
observables) — is the relational counterpart of the Schrödinger–Heisenberg
duality. At the relational universe $R = U_G(R)$, this duality is exact: the
Schrödinger and Heisenberg pictures give the same predictions.

### Born Rule from Detailed Balance

The detailed balance condition $\pi \cdot P = \pi$ (§detailed-balance) implies
that the stationary distribution $\pi$ assigns probability $p_{t,\lambda}$ to mode
$E_{t,\lambda}$. In the quantum correspondence, this is the Born rule: the
probability of measuring eigenvalue $\lambda$ is proportional to the weight of
the mode in the spectral decomposition.

**Status.** Stub. The precise conditions under which this correspondence lifts from
a numerical analogy to a mathematical theorem — i.e., when the relational calculus
is a model of QM in a precise sense — remain to be established. Key steps: (a)
define a suitable notion of positivity and normalization for fiber elements that
would make them density-operator analogues; (b) show that the directed comonad
acts unitarily (isometrically in the spectral norm); (c) compare with existing
categorical quantum mechanics frameworks (Abramsky–Coecke dagger categories,
Coecke–Duncan ZX calculus).
