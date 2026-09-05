---
type: question
status: open
explores:
  - teaching/explanations/scott-continuous-closure-rule-system.md
  - ../../../../../../predicated-computing/concepts/wavefront.md
---

# Closure-2-monad and Nix

The substrate's wavefront discipline (per [wavefront](../../../../../../predicated-computing/concepts/wavefront.md)) is grounded in two structural theorems: closure-2-monad-lax-idempotence (the closure 2-monad $\mathrm{Cl}$ is lax-idempotent) and closure-driven-settling-monotonicity (the iteration is $\leq_k$-monotone). The wavefront's locality property is grounded further in `crdt-convergence-via-mayer-vietoris` and `wavefront-locality-via-cohomology-vanishing` — Mayer-Vietoris vanishing of the substrate's settling-associated sheaf at wavefront cover boundaries, giving $\delta^0 = 0$.

The opening mapping pass observed that Nix's `nix build` is wavefront-shaped: lazy, dependency-ordered, parallelism-bounded, and incrementally-rebuilds-only-the-affected. The observation is grounded structurally — Nix builds only what is reached and only what is not already in the store — but the *theorems* the substrate's wavefront depends on (closure-2-monad lax-idempotence, Mayer-Vietoris vanishing) have not been read.

The question is whether Nix's `nix build` realizes the substrate's wavefront in the specific sense the closure-2-monad theorems require, or whether the structural similarity is shallower — Nix happens to be incremental for engineering reasons not for substrate-theoretic ones.

## What seems to match

- **Lax-idempotence of nix build.** Running `nix build` twice on the same flake at the same revision produces the same result (idempotent). Running it on a flake that is a sub-derivation of a larger flake is "absorbed" by the larger flake's build (the lax direction). This has the shape of lax-idempotence.
- **Order-independence (confluence).** Per [scott-continuous-closure-rule-system](teaching/explanations/scott-continuous-closure-rule-system.md), Nix's closure operator is well-defined: building inputs in any topologically-valid order produces the same outputs. This is the substrate's confluence property, structurally grounded in the closure-2-monad's lax-idempotence per the substrate's framing.
- **Locality.** Nix's wavefront width = parallelism factor. Building `foo` does not re-evaluate the entire flake; only the closure of `foo`'s inputs is touched. Per [wavefront](../../../../../../predicated-computing/concepts/wavefront.md), this is structural to the closure operator's monotonicity and the bilattice $\vee_k$-join.

## What is unverified

- **Whether the closure-2-monad applies in the absence of $\mathcal{C}$.** The substrate's $\mathrm{Cl}$ is a 2-monad on the predication fiber functor's codomain category, indexed by the predicate category $\mathcal{C}$. Nix has no $\mathcal{C}$ (per [derivation-as-cell-shape](teaching/explanations/derivation-as-cell-shape.md)). Does the closure-2-monad have a degenerate form when $\mathcal{C}$ is trivial / discrete / a label set? If so, what is preserved and what is lost?
- **Whether Mayer-Vietoris vanishing holds for Nix.** Per [wavefront](../../../../../../predicated-computing/concepts/wavefront.md) (line 22), the vanishing of the Mayer-Vietoris connecting homomorphism $\delta^0$ is what makes the wavefront structurally local — *"the wavefront's effects don't propagate as cohomology classes through the substrate."* For Nix's settling-associated sheaf (if such a sheaf even makes sense given the thin value-domain), does $\delta^0 = 0$? Without the vanishing, Nix's locality is engineering-incidental (Nix's daemon happens to track changes carefully) rather than structural.
- **What "the substrate is structurally local in $H^1$" means for Nix.** Per [wavefront](../../../../../../predicated-computing/concepts/wavefront.md) (line 22), this is the engineering surface of $\delta^0 = 0$ on the settling-associated sheaf. For Nix, with no bilattice value-domain and no $\mathcal{C}$, what is $H^1$ of the (analogous) sheaf? Is it trivial because $L_{\mathrm{ns}} = \emptyset$ (Scott-continuous regime)? Trivial for a different reason? Not even well-defined?

## What would resolve the question

Read predicated-computing's wavefront-locality-via-cohomology-vanishing theorem and the closure-2-monad theorems in predication-categories. Determine whether the theorems require the bilattice value-domain or the predicate category $\mathcal{C}$, and whether Nix admits any of the structure they need. If the theorems do not apply to Nix's setup, surface the wavefront-correspondence as engineering-incidental rather than structural; if they apply in degenerate form, record what the degeneration looks like and what it does and does not preserve.

The resolution would also clarify whether Nix's incremental rebuild is *the substrate's wavefront in trivial-bilattice form* (a strong claim) or *similar-shaped engineering arrived at independently* (a weaker claim). The opening mapping pass conflated these; this question separates them.
