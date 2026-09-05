---
id: quartet-stratification-soundness
name: QuartetStratificationSoundness
description: "FiberNuclearLanguage Quartet Stratification"
---

### Corollary — FiberNuclearLanguage Quartet Stratification {#quartet-stratification-soundness}

The denotation map $\llbracket - \rrbracket_t$ respects the sub-algebra structure
of the fiber nuclear quartet (§fiber-nuclear-quartet):

| Term form | Denotation lands in |
|-----------|---------------------|
| $M$ (no nuclear operators at top) | $H_t$ (free carrier) |
| $\mathsf{Saturate}(M)$ | $\mathrm{Fix}(\sigma_t)$ (saturation-stable fiber) |
| $\mathsf{Transfer}(M)$ | $\mathrm{Fix}(\Delta_t)$ (transfer-stable fiber) |
| $\mathsf{Transfer}(\mathsf{Saturate}(M))$ | $H_t^*$ (fixed fiber) |

*Proof.* Immediate from the soundness interpretation (§soundness):
$\llbracket \mathsf{Saturate}(M) \rrbracket_t = \sigma_t(\llbracket M \rrbracket_t)
\in \mathrm{Fix}(\sigma_t)$ since $\sigma_t$ is a nucleus with
$\mathrm{Fix}(\sigma_t)$ as its fixed-point set; symmetrically for $\mathsf{Transfer}$.
For the doubly-applied form:
$$
\llbracket \mathsf{Transfer}(\mathsf{Saturate}(M)) \rrbracket_t
\;=\; \Delta_t\bigl(\sigma_t(\llbracket M \rrbracket_t)\bigr)
\;=\; \pi_t(\llbracket M \rrbracket_t)
\;\in\; H_t^*
$$
since $\mathrm{Fix}(\pi_t) = H_t^*$ ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md#nuclear-quartet-subalgebra-projection)). $\square$

#### The Canonical Normal Form {#quartet-stratification-soundness-nf}

The canonical normal form $\mathsf{Transfer}(\mathsf{Saturate}(M))$ — reached from
$\mathsf{Saturate}(\mathsf{Transfer}(M))$ by rule R7 of the reduction system
(§strong-normalization) — is the syntactic counterpart of the joint projection
$\pi_t = \Delta_t \circ \sigma_t : H_t \to H_t^*$.

Every FiberNuclearLanguage term $M$ in which both nuclear operators appear therefore has a
canonical fully-applied form whose denotation is in $H_t^*$: the reduction
system drives every mixed-operator term toward the fixed fiber.
