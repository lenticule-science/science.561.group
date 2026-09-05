---
type: theorem
status: proved
depends-on: [predication-hyperdoctrine, temporal-2-category, beck-chevalley-commutation-on-predication-bilattices, gray-street-fibration-monad, emmenegger-fibration-comonad]
---

# Two-categorical Beck–Chevalley on the temporal 2-category

Let $\mathcal{E}$ be an [predication hyperdoctrine](../objects/predication-hyperdoctrine.md). For every pseudo-pullback square in the [temporal 2-category](../objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}, \lambda)$,

$$\begin{array}{ccc} (\tau_P, P) & \xrightarrow{p_A} & (\tau_A, A) \\ p_B \downarrow & \;\Downarrow \varphi & \downarrow f \\ (\tau_B, B) & \xrightarrow{g} & (\tau_C, C), \end{array}$$

and every $\phi \in \mathcal{E}_{(\tau_B, B)}$, the canonical 2-cell

$$\mathrm{BC}_\varphi \;:\; \exists^{k/t}_{p_A}(p_B^* \phi) \;\Rightarrow\; f^*(\exists^{k/t}_g \phi)$$

is invertible in $\mathcal{E}_{(\tau_A, A)}$, for both adjoint systems $k, t$. Dually for $\forall$.

## Proof

The argument reduces 2-categorical BC to three composed standard results.

**Step 1 — slice-wise pullback computation.** A 1-cell $(\sigma, X) \to (\tau, Y)$ in $\mathbf{T}(\mathcal{C}, \lambda)$ is a $\mathbf{Cat}/\mathcal{C}$-morphism $\mathbb{M}^\beta \mathbb{N}^\alpha X \to Y$ with $\alpha + \beta = \tau - \sigma$. A pseudo-pullback of a cospan in $\mathbf{T}(\mathcal{C}, \lambda)$ is computed by translating all objects to a uniform ordinal $\rho' \geq \max(\sigma, \tau, \rho)$ via $\mathbb{M}^\beta \mathbb{N}^\alpha$-applications, computing the pseudo-pullback in $\mathbf{Cat}/\mathcal{C}$ at level $\rho'$, and translating back via the unit/counit 2-cells of [$\mathbb{M} \dashv \mathbb{N}$](emmenegger-fibration-comonad.md). Each step is canonical up to invertible 2-cell.

**Step 2 — fiber-level BC at the uniform ordinal.** At level $\rho'$, the fibers of $\mathcal{E}$ are $\mathbf{Cat}/\mathcal{C}$-fibrations and the pseudo-pullback reduces to a $\mathcal{C}$-pullback with $\mathbf{Cat}/\mathcal{C}$-fiber structure. Standard fiber-pullback coherence for cloven fibrations ([@jacobs1999] §1.4; [@streicher2018] §4) gives that the fibered pullback agrees with the total-category pullback up to canonical iso. The 1-categorical [Beck–Chevalley commutation on predication bilattices](beck-chevalley-commutation-on-predication-bilattices.md) then applies cellwise on $E \times E$ — the cellwise reduction is forced by the uniform-fiber-algebra structure. The canonical map $\mathrm{BC}^{\rho'}_\varphi$ at level $\rho'$ is therefore an isomorphism, not merely a 2-cell.

**Step 3 — coherence across ordinals.** The translation 2-cells between level $\rho'$ and the original levels come from the (co)lax-idempotent coherence of $\mathbb{M} \dashv \mathbb{N}$. By Kelly–Lack (K2), $\mathbb{M}$-pseudo-algebra structure and $\mathbb{N}$-pseudo-coalgebra structure are unique up to unique invertible 2-cell. The translation 2-cells therefore compose coherently with the BC iso of Step 2 to produce a single invertible 2-cell $\mathrm{BC}_\varphi$ in $\mathbf{T}(\mathcal{C}, \lambda)$.

The dual statement for $\forall$ follows by adjunction. $\square$

## Regime-dependent simplification

- *Strict regime* ($\kappa < \omega$): 2-cells trivialize; $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to $\lambda$ as a 1-category. The theorem reduces to 1-categorical BC.
- *Scott-continuous regime* ($\kappa = \omega$): 2-cells trivialize at the $\omega$-limit; BC holds strictly at $\omega$ and via Steps 1–3 elsewhere.
- *Transfinite-bounded regime* ($\omega < \kappa < \omega_1$): 2-cells non-trivial up to $\kappa$; full machinery applies in the bounded countable range.
- *Aperiodic regime* ($\omega_1 \leq \kappa$): 2-cells non-trivial throughout; full machinery essential. This is where the theorem does work the 1-categorical case cannot: cohomological constructions targeting the [aperiodic regime](teaching/explanations/aperiodic-settling.md) need pullback / pushforward sheaf coherence on the temporal 2-category, and the present BC is the input.
