---
type: morphism
class: 2-comonad
symbol: "\\mathrm{Cl}^*"
closes: dual-predication-hyperdoctrine
depends-on: [closure-2-monad, dual-predication-hyperdoctrine, paired-priestley-space, closure-fixed-points-priestley-correspondence, jung-rivieccio-duality]
---

# Dualized closure 2-comonad

Let $\mathbf{PrFib}^*(\mathbf{L}, \mathcal{C}, E)$ denote the 2-category of paired-Priestley opfibrations over $\mathcal{C}^{\mathrm{op}}$ dual to the predication settling-fibration 2-category. The **dualized closure 2-comonad**

$$\mathrm{Cl}^* : \mathbf{PrFib}^* \to \mathbf{PrFib}^*$$

sends a paired-Priestley opfibration $p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}$ to the opfibration whose fiber at each $q$ is the closed subspace $K_q \subseteq X_q = \mathcal{E}^*_q$ selected by the primal [closure operator](closure-operator.md) $\mathrm{cl}_q$ via [closure-fixed-points-Priestley correspondence](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/references/closure-fixed-points-priestley-correspondence.md).

## Structure 2-cells

- **Counit** $\epsilon^* : \mathrm{Cl}^*(\mathcal{E}^*) \hookrightarrow \mathcal{E}^*$ — the inclusion of the closed subspace, dual to the primal inflationarity unit $\eta : 1 \Rightarrow \mathrm{Cl}$ of the [closure 2-monad](closure-2-monad.md).
- **Comultiplication** $\delta^* : \mathrm{Cl}^*(\mathcal{E}^*) \to \mathrm{Cl}^*\mathrm{Cl}^*(\mathcal{E}^*)$ — the canonical invertible 2-cell witnessing the self-inclusion $K_q \hookrightarrow K_q$.

## Generator dualization

Each of the four [predicate](teaching/explanations/predicate.md) generators dualizes to a Priestley-space morphism:

| Primal | Dual |
|---|---|
| [specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) restricts to $\mathrm{dom}(q) \subseteq E \times E$ | restriction to the clopen sub-space corresponding to $\mathrm{dom}(q)$ |
| [converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md) acts by index swap | swap involution on the paired Priestley space |
| [subject-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-subject-projection.md) collapses to $(s, s)$ | factor through the diagonal subspace $X_p^{\mathrm{diag}} \hookrightarrow X_p$ then row-broadcast |
| [object-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md) collapses to $(o, o)$ | dual to subject-projection |

These are precisely the dualizations the [dual predication hyperdoctrine](../../predication-hyperdoctrine/content/dual-predication-hyperdoctrine/dual-predication-hyperdoctrine.md) requires.

## Reading

Where the primal $\mathrm{Cl}$ inflates valuations and adds derivable consequences, $\mathrm{Cl}^*$ deflates and removes non-confirming Priestley points. "Algebra grows; spectrum shrinks" — the standard Stone-dual perspective applied to the closure dynamics.
