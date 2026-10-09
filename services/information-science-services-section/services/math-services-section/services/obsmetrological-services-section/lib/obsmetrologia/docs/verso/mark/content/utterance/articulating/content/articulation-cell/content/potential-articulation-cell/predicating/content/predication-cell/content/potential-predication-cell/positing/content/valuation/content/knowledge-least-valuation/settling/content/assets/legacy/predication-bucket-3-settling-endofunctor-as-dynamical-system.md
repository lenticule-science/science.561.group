---
kind: question
status: open
explores: [settling-endofunctor, closure-2-monad, closure-ordinal, four-regime-dichotomy]
---

# The settling endofunctor as a dynamical system

The corpus's [settling endofunctor](../morphisms/settling-endofunctor.md) iterates a closure operator until the closure ordinal. This has been treated *categorically* — the iteration is part of the closure 2-monad's lax-idempotent structure. There's a parallel **dynamical-systems story** that's been left untold.

The endofunctor lives on a state space (the predication-presheaf category). Iteration produces an orbit. The closure ordinal is the orbit's stabilisation time. But:

- What about *periodic orbits* — settlings $v$ with $T^k(v) = v$ for some $k > 1$ (without being a fixed point)? In the strict regime, the iteration terminates at a fixed point in finite time — no non-trivial periodic orbits. But what about infinite-base settlings where the iteration could cycle?
- What about *strange attractors* — non-fixed-point structures that the iteration approaches asymptotically?
- What about *Lyapunov-like measures of stability* — given a perturbation of a settling, does the orbit return to it?

## Open

1. **Periodic orbits beyond fixed points**. Define them, find them. If the closure operator is genuinely an inflationary endofunctor, periodic orbits collapse to fixed points (the closure ordinal IS the period). But for non-inflationary variants — e.g., if you replace closure with a non-monotone operator — period structure becomes possible.

2. **Topological structure on the state space**. The presheaf category has natural topologies (e.g., from the Grothendieck topology on the bitopological site). Is the settling endofunctor *continuous* in some topology? Does it have *recurrent* points in the topological-dynamics sense?

3. **Spectral theory.** The closure operator $T$ has fixed points (settlings). At each settling, the "linearisation" $dT$ acts on the tangent space. Does $dT$ have eigenvalues / eigenvectors? The Perron eigenvalue of substitution matrices (the corpus's connection to Pisot numbers) is essentially this — the $dT$-spectrum at a substitution-rule's fixed-point settling.

4. **Bifurcations.** Under deformation of the closure rule, when does a fixed-point settling *appear* or *disappear*? This is structurally the [SKH deformation theory](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) but reframed in dynamical-systems language.

5. **Random / stochastic settling endofunctors**. What if the closure operator is stochastic (firings happen with probabilities)? The iteration produces a Markov chain; settlings are stationary distributions; the four-regime dichotomy gets a probabilistic generalization.

The categorical story is complete; the dynamical-systems story is open and would connect the corpus to ergodic theory, ODE/PDE-style stability analysis, and stochastic-dynamics literature.
