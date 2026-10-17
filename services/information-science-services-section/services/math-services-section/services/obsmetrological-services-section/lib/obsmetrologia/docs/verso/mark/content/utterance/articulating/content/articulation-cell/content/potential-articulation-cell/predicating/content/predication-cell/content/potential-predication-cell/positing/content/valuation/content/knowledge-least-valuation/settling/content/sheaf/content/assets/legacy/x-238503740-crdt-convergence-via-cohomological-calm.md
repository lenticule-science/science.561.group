---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-cohomology-vanishes-above-degree-1, four-regime-dichotomy, settling-associated-sheaf, crdt-convergence, replica-mayer-vietoris, strict-regime-cohomology-vanishing, scott-continuous-regime-cohomology-vanishing]
---

# CRDT convergence via cohomological-CALM in vanishing-$H^1$ regimes

Alternative proof of [CRDT convergence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence.md) for the strict and Scott-continuous regimes via the cohomological-CALM framework, complementing the [Mayer–Vietoris path](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md). Where the MV path proves $\delta^0 = 0$ by directly constructing the section-extension by zero, this path observes $\delta^0 = 0$ as a corollary of $H^1 = 0$ and the standard MV exact sequence — making coordination-freeness *immediate* once the regime's $H^1$-vanishing is established.

## Setup

The corpus's [strict-regime cohomology vanishing](../../settling-cohomology/references/strict-regime-cohomology-vanishing.md) and [Scott-continuous-regime cohomology vanishing](../../settling-cohomology/references/scott-continuous-regime-cohomology-vanishing.md) theorems give:

$$H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U) = 0$$

for any settling $v$ in the strict regime ($\kappa < \omega$) or the Scott-continuous regime ($\kappa = \omega$).

The [Mayer–Vietoris exact sequence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md) for a pairwise-Stone cover $U = U_1 \cup U_2$:

$$0 \to H^0(U) \to H^0(U_1) \oplus H^0(U_2) \to H^0(U_1 \cap U_2) \xrightarrow{\delta^0} H^1(U) \to \cdots$$

## Statement

**Theorem.** *For the settling-associated sheaf $\mathcal{F}_U$ in the strict or Scott-continuous regime, every Mayer–Vietoris connecting homomorphism $\delta^0$ is zero, hence the CRDT convergence holds:*

*every distributed system whose replicas track a knowledge presheaf in these regimes converges without coordination, given closure-merge commutation.*

## Proof

In both the strict and Scott-continuous regimes, $H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U) = 0$.

The MV exact sequence has $H^1(U)$ as the codomain of $\delta^0$. Since this codomain is zero, $\delta^0$ is zero — *by abstract nonsense*, not by explicit construction.

The vanishing of $\delta^0$ is the cohomological encoding of CRDT-style coordination-freeness ([cohomological CALM](../../settling-cohomology/references/cohomological-calm.md), part 2). Equivalently: the MV exact sequence becomes a short exact sequence

$$0 \to H^0(U) \to H^0(U_1) \oplus H^0(U_2) \to H^0(U_1 \cap U_2) \to 0,$$

meaning sections on $U_1 \cap U_2$ extend uniquely (modulo a degree-0 element of the kernel). This is the cohomological encoding of "merge data on the intersection determines glued data on the union" — precisely the CRDT property.

Combining with the standard CRDT result ([CRDT convergence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence.md)) — closure-merge commutation gives finite-step convergence — yields the full CRDT theorem in these regimes. $\square$

## What this gives that the MV-direct path doesn't

The [MV-direct path](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md) constructs $\delta^0 = 0$ explicitly by exhibiting "extension by zero" on the symmetric difference $\Delta^{+,*}_\tau(q) \cap (U_1 \triangle U_2)$. The construction is concrete and works regardless of regime.

This path: $\delta^0 = 0$ follows from vanishing of $H^1$ (abstract), which holds in the strict and Scott-continuous regimes by the cohomology-vanishing theorems.

The two arguments are structurally distinct:

| Path | Style | Scope | Witness |
|---|---|---|---|
| MV-direct | Explicit construction | All four regimes | Section-extension by zero |
| Cohomological-CALM | Abstract vanishing | Strict + Scott-continuous only | $H^1 = 0$ in regime |

The cohomological-CALM path:
- **Is more abstract** — no explicit section-construction needed.
- **Is more limited** — only works in regimes with $H^1 = 0$. For transfinite-bounded and aperiodic regimes, $H^1 \neq 0$, so this path doesn't apply directly.
- **Connects to broader CALM/cohomology framework** — situates CRDT convergence within the cohomological obstruction theory.

For a downstream reader: the MV-direct path is more concrete and more general; this path is more conceptual and connects to the cohomological-CALM framework. Both arrive at the same CRDT convergence conclusion in the strict / Scott-continuous regimes.

## When this path doesn't apply

**Transfinite-bounded and aperiodic regimes.** $H^1 \neq 0$ in these regimes, so the abstract argument $\delta^0 = 0$ via codomain vanishing doesn't go through. CRDT convergence in these regimes — if it holds — needs either:

- The MV-direct path (construction of section extensions, which depends on the structure of the firing pattern).
- A different argument specific to the transfinite regimes' firing structure.

Open question: in the transfinite-bounded regime, does CRDT convergence still hold? The MV-direct argument's "extension by zero" works for the standard NSC-firing pattern, suggesting yes, but the cohomological obstruction is non-trivial. Whether the pre-cohomology obstruction vanishes is a sub-question for [the realizability of cohomology classes question](../questions/realizability-of-cohomology-classes.md).

## Position in the program

Companion proof for the strict and Scott-continuous regimes. With this path:

- **CRDT convergence in the standard regimes** has two independent justifications: MV-direct construction and cohomological-vanishing.
- **The transfinite-bounded and aperiodic regimes** retain only the MV-direct justification, with the cohomological-CALM path explicitly inapplicable.
- **The connection to cohomological obstruction theory** is made explicit: CRDT-style convergence is the cohomological-vanishing condition at degree 0, and this holds automatically when $H^1 = 0$.

Two different proofs of the same result, with distinct regimes of applicability. For maximum rigor in CRDT-using applications, cite both.
