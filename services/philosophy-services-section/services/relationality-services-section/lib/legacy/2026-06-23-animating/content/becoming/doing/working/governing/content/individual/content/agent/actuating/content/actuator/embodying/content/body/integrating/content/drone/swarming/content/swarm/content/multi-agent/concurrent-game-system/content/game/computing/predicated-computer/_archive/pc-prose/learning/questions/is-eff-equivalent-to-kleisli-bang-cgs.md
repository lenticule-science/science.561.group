---
name: is Eff equivalent to Kleisli of bang CGS
description: Whether the effective topos Eff is equivalent to the Kleisli sub-CCC Kl(!_CGS) of CGS's concurrent computable fragment, as Cartesian closed categories exactly (not merely model-theoretically). Hyland 2002 establishes the model-theoretic equivalence; exact categorical equivalence is the open question.
status: open
---

# Is $\mathbf{Eff} \simeq \mathcal{Kl}(!_\mathbf{CGS})$ as CCCs exactly?

**Question.** Is the effective topos $\mathbf{Eff} = RT(\mathcal{K}_1)$ equivalent to the Kleisli sub-CCC $\mathcal{Kl}(!_\mathbf{CGS})$ of concurrent games with symmetry, *as Cartesian closed categories exactly*? Hyland 2002 establishes the model-theoretic equivalence via the Dialectica-game correspondence; whether the equivalence is categorical (preserving the CCC structure including all exponentials and finite limits up to coherent natural isomorphism) is the open residual identification flagged in [`typed-subtheory-lattice-is-linear-logic-fragment-lattice`](../../../theories/engineering/theories/tech/theories/computing/prose/learning/claims/typed-subtheory-lattice-is-linear-logic-fragment-lattice.md).

## What is established

- $\mathbf{Eff}$ is the minimum categorical level for the theory of computing (per [`eff-is-minimum-level`](../../../theories/engineering/theories/tech/theories/computing/prose/learning/claims/eff-is-minimum-level.md)).
- $\mathbf{CGS}$ is the theory of computing (per [`theory-of-computing`](../../../theories/engineering/theories/tech/theories/computing/prose/learning/claims/theory-of-computing.md)).
- The $*$-autonomous functor $F : \mathbf{Dial}(\mathbf{Eff}) \to \mathbf{CGS}$ exists (per [`f-dial-eff-to-cgs-exists`](../../../theories/engineering/theories/tech/theories/computing/prose/learning/claims/f-dial-eff-to-cgs-exists.md)).
- Hyland 2002 establishes $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$ — the Dialectica-realizability equivalence at the model-theoretic level.
- The Kleisli extension $F^!$ embeds $\mathbf{Eff}$ into the Kleisli sub-CCC of $\mathbf{CGS}$'s concurrent computable fragment.

## What remains open

Whether the embedding $F^!$ is an *equivalence of CCCs* — i.e., whether all CCC structure (terminal object, products, exponentials, evaluation maps, currying) is preserved up to coherent natural isomorphism, in addition to the model-theoretic content.

The model-theoretic version concerns objects and morphisms preserving truth-valuation; the exact-categorical version concerns the full structural shape of the CCCs including all natural isomorphisms witnessing the universal properties.

## Why this matters downstream

Multiple atoms in the 561 corpus are conditional on this identification holding exactly:

- [`closure-2-monad-is-bang-comonad-shadow`](../claims/closure-2-monad-is-bang-comonad-shadow.md) — the substrate's closure 2-monad lax-idempotence as the $!$-comonad's structural shadow in $\mathcal{Kl}(!)$. If the identification fails, the claim weakens from "structural shadow" to "structural analogy."
- The FAdRS-swarms survey's §6.3 categorical lift (closure 2-monad as `!`-comonad-realization at substrate cells) depends on the exact equivalence to be a structural identification rather than a model-theoretic correspondence.
- [`aperiodic-regime-sector-selective-convergence`](../claims/aperiodic-regime-sector-selective-convergence.md) names the cofree-`!`-coalgebra fixed point in $\mathcal{Kl}(!_\mathbf{CGS})$ as the categorical convergence target; whether this fixed point coincides with an $\mathbf{Eff}$-internal universal object (Kleene's second recursion theorem's fixed point lifted to the categorical level) depends on the identification.

## What an answer would look like

A satisfactory answer would:

- Establish (or refute) that $F^!$ is a full and faithful equivalence of CCCs.
- If equivalence: identify the cofree-$!$-coalgebra in $\mathcal{Kl}(!_\mathbf{CGS})$ with Kleene's second-recursion fixed point internal to $\mathbf{Eff}$, and lift the substrate's closure 2-monad iteration to a recursion-theoretic invariant.
- If not equivalence: characterize the obstruction — what structure is preserved up to natural isomorphism in the embedding but not in the inverse direction, or where the natural isomorphisms fail to be coherent.

## Position

Upstream open question in the theory-of-computing apparatus on which several downstream FAdRS-swarm-theory claims are conditional. The agentic-drone-swarm theory's per-agent settling-as-knowledge claim and its aperiodic-regime convergence target both depend on this identification holding. Recorded here to make the dependency visible in the polity's open frontier.
