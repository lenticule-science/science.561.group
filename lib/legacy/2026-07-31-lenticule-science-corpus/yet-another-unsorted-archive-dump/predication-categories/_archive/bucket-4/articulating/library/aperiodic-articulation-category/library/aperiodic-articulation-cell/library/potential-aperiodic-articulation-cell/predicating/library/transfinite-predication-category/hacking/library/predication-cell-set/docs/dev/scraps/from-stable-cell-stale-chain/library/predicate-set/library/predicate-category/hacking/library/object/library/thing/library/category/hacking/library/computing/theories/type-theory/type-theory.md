---
name: type-theory
description: The Kleisli sub-CCC of Eff corresponding to strongly normalizing typed lambda calculi — the fragment of computable mathematics where every program terminates and typechecking is decidable. Objects are types; morphisms are closed terms in normal form. Embeds into Eff via the realizability interpretation of typed terms; sits at the ILL Kleisli level of CGS.
component-of: computing
---

# Type Theory

The typed fragment of the theory of computing. A typed calculus with a strong normalization theorem has decidable typechecking and decidable evaluation; its predicates are $\Delta^0_1$, placing it inside the classical (decidable) subtopos of $\mathbf{Eff}$. The Curry-Howard-Lambek correspondence identifies each such calculus with a sub-CCC of the classical subtopos: STLC (Tait 1967), System F (Girard 1972), and Martin-Löf type theory without universes each determine a sub-CCC by this criterion.

Session types (Caires-Pfenning 2010) correspond to the CLL fragment of CGS via the propositions-as-sessions interpretation: session-typed π-calculus processes embed into the interactive-computation theory rather than purely into the type-theory theory, but the typed discipline is the same.
