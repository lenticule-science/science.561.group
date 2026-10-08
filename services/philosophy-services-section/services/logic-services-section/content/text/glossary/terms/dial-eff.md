---
type: structure
status: active
depends-on:
  - eff.md
see-also:
  - cgs.md
  - ../prose/learning/claims/f-dial-eff-to-cgs-exists.md
  - ../code/transformers/dialectica-embedding.md
  - ../code/transformers/f-dial-to-cgs.md
references:
  - Hyland 2002
  - Seely 1989
  - de Paiva 1991
name: Dial(Eff) — the Dialectica category over Eff
description: "The Dialectica category $\\mathbf{Dial}(\\mathbf{Eff})$ (Hyland 2002, building on de Paiva 1991) is the $$-autonomous category with:"
---


The **Dialectica category** $\mathbf{Dial}(\mathbf{Eff})$ (Hyland 2002, building on de Paiva 1991) is the $*$-autonomous category with:

**Objects.** Triples $(U, X, \alpha)$ where:
- $U \in \mathbf{Eff}$ — the *witness type* (Player's move)
- $X \in \mathbf{Eff}$ — the *challenge type* (Opponent's move)
- $\alpha: U \times X \to \Omega_{\mathbf{Eff}}$ — a computable acceptance relation

**Morphisms.** $(f, F): (U, X, \alpha) \to (V, Y, \beta)$ where $f: U \to V$ and $F: U \times Y \to X$ are morphisms in $\mathbf{Eff}$ satisfying the Dialectica condition:

$$\forall u \in U,\, y \in Y.\; \alpha(u,\, F(u,y)) \leq \beta(f(u),\, y)$$

*Read*: given witness $u$ and opponent-challenge $y$ in the target, P maps $u$ to $f(u)$ (source witness) and constructs $F(u,y)$ (source challenge) such that target acceptance $\beta$ is implied by source acceptance $\alpha$.

## Structure

$\mathbf{Dial}(\mathbf{Eff})$ is $*$-autonomous:

- **Tensor**: $(U, X, \alpha) \otimes (V, Y, \beta) = (U \times V,\; X^V \times Y^U,\; \gamma)$ where $\gamma((u,v), (f, g)) = \alpha(u, f(v)) \wedge \beta(v, g(u))$ — the Dialectica "each-or-any" interaction.
- **Dual**: $(U, X, \alpha)^\perp = (X, U, \alpha^{\mathrm{op}})$ where $\alpha^{\mathrm{op}}(x, u) = \alpha(u, x)$ — swap Player and Opponent.
- **Unit**: $(1, 1, \top)$ — trivially accepted.
- **Linear implication**: $A \multimap B = A^\perp \otimes B$ (by $*$-autonomous structure).

## Dialectica as the Kleisli envelope of Eff

The diagonal embedding $A \mapsto (1, 1, A)$ (with $U = 1$, $X = 1$, acceptance = $A$ itself) sends each $\mathbf{Eff}$-object to a Dialectica object. This embedding makes $\mathbf{Eff}$ a full sub-CCC of $\mathbf{Dial}(\mathbf{Eff})$ via the Girard decomposition (Seely 1989): for any $*$-autonomous category with a $!$ comonad, the Kleisli category $\mathcal{Kl}(!)$ is Cartesian closed. Conversely:

$$\mathbf{Eff} \;\simeq\; \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$$

as CCCs (the Dialectica-realizability equivalence, Hyland 2002). Both $\mathbf{Eff}$ and the Kleisli category of $!$ over $\mathbf{Dial}(\mathbf{Eff})$ are models of $\mathrm{HA}_\omega$ (computable arithmetic of higher types).

## The concurrent game reading

The Dialectica interaction is *concurrent, not alternating*: P commits witness $u \in U$ and O commits challenge $x \in X$ simultaneously. This is the key structural fact used in the construction of $F: \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$: Dialectica objects map to concurrent game arenas (not sequential ones), because the interaction structure is already concurrent. See [f-dial-to-cgs](f-dial-to-cgs.md) and [f-dial-eff-to-cgs-exists](../concepts/f-dial-eff-to-cgs-exists.md).
