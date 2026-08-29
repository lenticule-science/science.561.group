---
id: parametric-semantics
name: ParametricSemantics
description: "Parametric Semantics — every FiberNuclearLanguage term is parametric (natural in the history); requires proof of the effect-coeffect distribution law from nucleus-reindexing commutativity."
---

### Theorem — Parametric Semantics {#parametric-semantics}

**Setting.** The reindexing functor $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$
(§reindexing) makes every restriction map $\rho_{tt'}: H_{t'} \to H_t$
(for $t \leq t'$) a Heyting algebra homomorphism preserving both nuclei. A term
$\varphi$ in FiberNuclearLanguage ([fiber-nuclear-language](fiber-nuclear-language.md)) is **parametric** if its interpretation
in $H_t$ is natural in $t$: for all $t \leq t'$ and all $a \in H_{t'}$,
$$
\rho_{tt'}\bigl(\llbracket \varphi \rrbracket_{t'}(a)\bigr)
\;=\;
\llbracket \varphi \rrbracket_t\bigl(\rho_{tt'}(a)\bigr).
$$

#### Theorem — Parametric Uniformity {#thm-parametric-uniformity}

Every closed FiberNuclearLanguage term $\varphi$ is parametric: its denotation
commutes with all restriction maps. In other words, the interpretation of
FiberNuclearLanguage is a natural transformation between presheaves on $T$.

#### Theorem — Effect-Coeffect Duality {#thm-effect-coeffect}

The saturation nucleus $\sigma: H \Rightarrow H$ (the **effect** of settling
propositions toward their stable forms) and the directed comonad
$U_G: R \to R$ (the **coeffect** of accumulating relational context) form a
dual pair in the indexed category:

1. **Effect monad.** $(\mathrm{Fix}(\sigma_t), \eta_\sigma, \mu_\sigma)$ is a
   monad on the fiber: the unit $\eta_\sigma: H_t \to \mathrm{Fix}(\sigma_t)$
   embeds raw propositions into their saturation, and the multiplication
   $\mu_\sigma$ witnesses idempotence.

2. **Coeffect comonad.** $(U_G, \varepsilon, \delta)$ is a comonad on $R$:
   the counit $\varepsilon: U_G(R) \to R$ extracts the result of one
   generative closure step, and the comultiplication $\delta: U_G \Rightarrow
   U_G \circ U_G$ witnesses the tower structure.

3. **Duality.** Effects (nucleus actions) distribute over coeffects (comonad
   steps) up to the dynamic residuation: for $x \in H_t$ and a flow-step
   $(-)^+$ advancing the history,
   $$
   \sigma_t(x^+) \;=\; (\sigma_{t+}(x))^+ \quad (\text{up to restriction}).
   $$

#### Theorem — Abstraction {#thm-parametric-abstraction}

If two fiber elements $a, b \in H_t$ are **nucleus-indistinguishable** at $t$
(i.e., $\sigma_t(a) = \sigma_t(b)$ and $\Delta_t(a) = \Delta_t(b)$), then they
are nucleus-indistinguishable at every extension $t' \geq t$: the parametricity
of the nuclei propagates indistinguishability upward along the history preorder.

#### Theorem — Logical Relations {#thm-logical-relations}

The equality induced by parametricity — two terms are **relationally equal** if
they are indistinguishable in all contexts — coincides with the nucleus-mediated
equivalence:
$$
\varphi \sim_R \psi \;\iff\; \sigma_t(\llbracket \varphi \rrbracket_t)
= \sigma_t(\llbracket \psi \rrbracket_t) \text{ for all } t.
$$
In other words, the fiber nuclei are the logical-relations structure of
FiberNuclearLanguage.

**Relation to soundness.** The parametricity theorem (uniformity of
interpretation across fibers) strengthens the soundness theorem (§soundness):
soundness says the denotation is well-defined at each fiber; parametricity says
the family of denotations is coherent across all fibers.

**Status.** Stub. Requires: (a) a precise statement of the naturality condition
in terms of the sheaf structure of $R$, (b) proof of the effect-coeffect
distribution law from the commutativity of the nuclei with restriction
(§reindexing), and (c) comparison with the Reynolds parametricity theorem for
polymorphic types.
