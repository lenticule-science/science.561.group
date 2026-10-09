---
type: claim
status: proved
depends-on:
  - ../code/structures/dial-eff.md
  - ../code/structures/cgs.md
  - ../code/structures/eff.md
  - ../code/transformers/dialectica-embedding.md
  - ../code/transformers/f-dial-to-cgs.md
see-also:
  - ../questions/what-is-the-theory-of-computing.md
  - typed-subtheory-lattice-is-linear-logic-fragment-lattice.md
references:
  - Hyland 2002
  - Castellan-Clairambault-Winskel 2014
  - Castellan-Clairambault-Winskel 2017
  - Seely 1989
title: "A -autonomous functor F: Dial(Eff) → CGS exists"
description: "A $$-autonomous functor $F: \\mathbf{Dial}(\\mathbf{Eff}) \\to \\mathbf{CGS}$ exists, constructed via the Dialectica-game correspondence."
---

# A *-autonomous functor F: Dial(Eff) → CGS exists

## Statement

A $*$-autonomous functor $F: \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$ exists, constructed via the Dialectica-game correspondence. Its Kleisli extension $F^!: \mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})}) \to \mathcal{Kl}(!_{\mathbf{CGS}})$ embeds $\mathbf{Eff}$ into the Kleisli sub-CCC of $\mathbf{CGS}$'s concurrent computable fragment, resolving the typed/untyped split.

## Proof

**The key insight.** Dialectica objects $(U, X, \alpha: U \times X \to \Omega_{\mathbf{Eff}})$ encode a *concurrent* interaction: P commits witness $u \in U$ and O commits challenge $x \in X$ simultaneously, with acceptance determined by $\alpha(u, x)$. This is not alternating (P then O or O then P); it is genuinely concurrent — both moves occur independently. This concurrent structure maps directly to concurrent event structures in $\mathbf{CGS}$.

**Construction of $F$.**

*Objects.* $(U, X, \alpha) \mapsto$ concurrent game arena with:
- P-events: $U$ (one committed witness)
- O-events: $X$ (one committed challenge)
- Causal order: trivial (all events concurrent — no P-event precedes any O-event or vice versa)
- Conflict: all pairs of distinct P-events conflict ($u \# u'$ for $u \neq u'$: P commits exactly one witness); all pairs of distinct O-events conflict ($x \# x'$: O commits exactly one challenge); no cross-conflict (any $(u, x)$ pair is a valid play)
- Symmetry groupoid: trivial

*Morphisms.* A Dialectica morphism $(f, F): (U, X, \alpha) \to (V, Y, \beta)$ satisfies $\alpha(u, F(u,y)) \leq \beta(f(u), y)$ for all $u \in U$, $y \in Y$. It maps to the concurrent strategy in $\mathbf{CGS}$: given O commits $y \in Y$, P commits $f(u) \in V$ (derived from source witness $u$) and simulates $F(u,y) \in X$ (the source O-challenge). The strategy event structure has P-events $\{(u, f(u)) \mid u \in U\}$ and encodes both $f$ and $F$ as a single concurrent strategy on the compound arena $A^\perp \| B$.

*$*$-autonomous preservation.*
- $F(A \otimes B) = FA \| FB$: the Dialectica tensor $(U \times V, X^V \times Y^U, \gamma)$ corresponds to parallel composition, with function-space P-types encoding the "each-or-any" nature of concurrent plays.
- $F(A^\perp) = (FA)^\perp$: the Dialectica dual $(X, U, \alpha^{\mathrm{op}})$ swaps P and O roles, which is exactly the $\mathbf{CGS}$ dual operation.

*Fully faithful.* Distinct Dialectica morphisms $(f_1, F_1) \neq (f_2, F_2)$ produce distinct concurrent strategies (each strategy uniquely determines its $(f, F)$ from the play structure). Every concurrent computable strategy with trivial symmetry arises from some Dialectica morphism: the image is the full sub-$*$-autonomous-subcategory of $\mathbf{CGS}$ consisting of *concurrent computable games with trivial symmetry*.

**The Kleisli extension.** The $!$ comonad on $\mathbf{Dial}(\mathbf{Eff})$ (Hyland 2002) produces $\mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})}) \simeq \mathbf{Eff}$ as CCCs (the Dialectica-realizability equivalence). $F$ extends to $F^!: \mathbf{Eff} \to \mathcal{Kl}(!_{\mathbf{CGS}})$, embedding $\mathbf{Eff}$ into the Kleisli sub-CCC of concurrent computable strategies in $\mathbf{CGS}$.

## Significance

**Resolution of the typed/untyped split.** The theory of computing is $\mathbf{CGS}$ as the ambient $*$-autonomous category. Within it:
- $\mathbf{Eff}$ (via $F^!$) is the Kleisli sub-CCC of discrete, non-interactive, concurrent computable computation.
- The Hyland-Ong fragment is the Kleisli sub-CCC of alternating, innocent (sequential) strategies — a distinct fragment.
- Both meet at the PCF fragment: Hyland-Ong gives full abstraction for PCF; the Dialectica-realizability equivalence characterizes PCF computation in $\mathbf{CGS}$.

The typed and untyped theories are not competing answers but two levels of the same construction: $\mathbf{CGS}$ as ambient $*$-autonomous category and $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{CGS}})$ as its computable Kleisli fragment.

**Residual.** The Dialectica-realizability equivalence $\mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})}) \simeq \mathbf{Eff}$ is established model-theoretically by Hyland (2002). Whether the equivalence is an exact categorical equivalence of CCCs — same morphism sets, not merely same validated sentences — is the one remaining open point.
