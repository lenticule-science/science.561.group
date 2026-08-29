---
type: reference
authors: [Street, Ross]
year: 1972
name: street-1972
venue: "Journal of Pure and Applied Algebra 2(2), 149–168"
---

## Full citation

R. Street. *The formal theory of monads.* Journal of Pure and Applied Algebra 2(2), 1972, 149–168.

## Status

Pending direct access. Cited via the framework's borrowed structure.

## Annotation

Street's *Formal Theory of Monads* is the source of the *Kock–Zöberlein (KZ) lax-idempotent monad* axiomatization that the relational calculus' [Flow](../teaching/explanations/flow.md) (Movement III) instantiates. The KZ axioms specify that the monad multiplication $\mu$ has a left adjoint to its unit $\eta$:

$$\mu \dashv \eta_T \quad \text{(K1)}.$$

Lax-idempotence has the structural consequence that being a $T$-algebra is a *property* (not additional data) — there is at most one algebra structure per object up to unique isomorphism (K2).

The framework cites Street 1972 for:

- The KZ-laxity of Flow (Movement III, $F(F(a)) \leq F(a)$).
- The lax monoidal preservation law $F(a \otimes b) \leq F(a) \otimes F(b)$ on residuated structures (Street §3 Cor.) — which the framework calls *Dynamic Residuation*. See [`questions/dynamic-residuation-axiom-or-consequence.md`](../questions/dynamic-residuation-axiom-or-consequence.md) for whether Dynamic Residuation is a corollary or an axiom.
- The interpretability of cohesive geometric operators as KZ doctrines (Street §7).
- The Kelly–Lack lax-idempotence of the closure operator $\Box$ (Movement II), via Street's general theory of doctrines.

Street's machinery is the *external* description of the lax-idempotence the framework derives *internally* from Movement II's closure structure. Together with Riehl–Verity's 2018 elaboration in *Elements of 2-Category Theory*, this is the categorical infrastructure on which Movements II–IV are built.
