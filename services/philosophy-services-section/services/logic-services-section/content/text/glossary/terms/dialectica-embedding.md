---
type: transformer
status: active
source: Eff
target: Dial(Eff)
depends-on:
  - ../structures/eff.md
  - ../structures/dial-eff.md
see-also:
  - f-dial-to-cgs.md
  - ../prose/learning/claims/f-dial-eff-to-cgs-exists.md
  - ../prose/learning/claims/typed-subtheory-lattice-is-linear-logic-fragment-lattice.md
references:
  - Hyland 2002
  - Seely 1989
  - Girard 1987
name: Dialectica embedding
description: The Dialectica embedding is the full and faithful functor
---

# Dialectica embedding

The **Dialectica embedding** is the full and faithful functor

$$\iota: \mathbf{Eff} \;\hookrightarrow\; \mathbf{Dial}(\mathbf{Eff})$$

defined by the diagonal $A \mapsto (1, 1, A)$: send each $\mathbf{Eff}$-object $A$ to the Dialectica object with trivial witness and challenge types ($U = X = 1$, the terminal object) and acceptance relation $= A$.

## The Girard decomposition

The embedding is the computational realization of Girard's decomposition $A \Rightarrow B = {!}A \multimap B$ (Girard 1987; Seely 1989). More precisely: for any $*$-autonomous category $(\mathcal{L}, \multimap, !)$ with a comonad $!$ modeling the "of course" modality, the Kleisli category $\mathcal{Kl}(!)$ is Cartesian closed, and the CCC embeds into $\mathcal{L}$ via the diagonal $A \mapsto (!A, A, \mathrm{eval})$. The Dialectica embedding is an instance of this: $\mathbf{Eff}$ is the Cartesian closed category, $\mathbf{Dial}(\mathbf{Eff})$ is the ambient $*$-autonomous category, and $!$ is the comonad on $\mathbf{Dial}(\mathbf{Eff})$ that makes the Kleisli category $\mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})}) \simeq \mathbf{Eff}$.

## The Dialectica-realizability equivalence

The functor $\iota$ makes $\mathbf{Eff}$ equivalent to the Kleisli sub-CCC:

$$\mathbf{Eff} \;\simeq\; \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$$

as CCCs (Hyland 2002). Both are models of $\mathrm{HA}_\omega$ (computable arithmetic of higher types); the equivalence is established model-theoretically. Whether it is an exact categorical equivalence (same morphism sets) is the one residual open point in the resolution of the typed/untyped split.

## What the embedding means computationally

The embedding $\mathbf{Eff} \hookrightarrow \mathbf{Dial}(\mathbf{Eff})$ says: every computable function (morphism in $\mathbf{Eff}$) has a Dialectica interpretation as a pair $(f, F)$ where $f$ provides the witness and $F$ constructs the source-level challenge from the target-level challenge. The pair encodes the function and its "reverse" (the challenge-response structure), which is the Dialectica game reading.

The $!$ comonad on $\mathbf{Dial}(\mathbf{Eff})$ adds repeatability: a $!$-modified Dialectica object allows P to commit a strategy $f: X^* \to U$ (a computable function responding to any finite sequence of challenges with a witness), rather than committing a single witness once. The Kleisli morphisms of $!$ are the "repeated game" strategies — precisely the computable higher-type functionals.

## Composition with F

The Dialectica embedding $\iota$ composes with the $*$-autonomous functor $F: \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$ to give:

$$F \circ \iota: \mathbf{Eff} \to \mathbf{CGS}$$

This maps each $\mathbf{Eff}$-object to the trivially-symmetric concurrent game arena $(1, 1, A)$. The Kleisli extension $F^!$ extends this to $F^!: \mathbf{Eff} \to \mathcal{Kl}(!_{\mathbf{CGS}})$, the full embedding into the Kleisli sub-CCC of concurrent computable strategies in $\mathbf{CGS}$.
