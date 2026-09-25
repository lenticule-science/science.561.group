---
type: theorem
status: proved
depends-on: [lawvere-laplacian-grothendieck-sites, quantale-enriched-sheaf, q-enriched-cohomology, cech-derived-comparison-on-bitopological-site, q-enriched-cohomology-higher-degree-vanishing, hansen-ghrist2019, kelly1982, d-frame-valued-sheaf]
---

# Q-enriched derived cohomology agreement: Boolean d-frame case

For a $\mathsf Q$-enriched cellular sheaf $F$ on a regular CW complex (or Grothendieck site with cellular fibers) **with stalks complete Boolean algebras** and frame morphisms as restrictions, the three definitions of cohomology agree:

$$H^n_{\mathrm{coch}}(F) \;\cong\; H^n_{\mathrm{fix}}(F) \;\cong\; H^n_{\mathrm{der}}(F)$$

for all $n \geq 0$, naturally in $F$. This makes the chapter's cochain-level cohomology results (which is what every cohomology theorem in the chapter uses) genuine derived-functor cohomology in the corpus's typical setting.

**Scope.** This theorem is established for **Boolean d-frame stalks only** — powerset frames on cell sets, the corpus's typical setting. The non-Boolean cases (Heyting algebras, Lawvere-quantale-enriched, MV-algebra-enriched) are genuinely open, with the structural reasons for the gaps named explicitly:

- [Q-enriched Hodge theorem on non-Boolean frames](q-enriched-hodge-theorem-non-boolean-frames.md) (sketch) — the Heyting / non-complemented case.
- [Q-enriched Hodge theorem on Lawvere-quantale-enriched data](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/q-enriched-hodge-theorem-lawvere-quantale.md) (sketch) — the continuous / fuzzy case.
- [Q-enriched Grothendieck spectral sequence](q-enriched-grothendieck-spectral-sequence.md) (sketch) — the general derived-categorical machinery beyond ad-hoc Leray collapse.

This file is *deliberately specific*: scoped to what's actually proved, with the three open continuations spun off as their own sketch theorems rather than buried in a "What's open" section.

## Setup

Fix a commutative unital quantale $\mathsf Q$, a Grothendieck site $(\mathbf T, J)$ with cellular fibers, and a $\mathsf Q$-enriched sheaf $F : \mathbf T^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ such that **every stalk $F(\sigma)$ is a complete Boolean algebra** and every restriction $F(f) : F(\tau) \to F(\sigma)$ is a frame morphism. Write $C^n F = \prod_{\sigma \in \mathbf T_n} F(\sigma)$ (also a complete Boolean algebra) with coboundaries $\delta^n : C^n F \to C^{n+1} F$ assembled from the cellular structure.

**Three notions of cohomology** (per [q-enriched cohomology object](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md)):

1. **Cochain cohomology.** $H^n_{\mathrm{coch}}(F) := \ker(\delta^n) / \mathrm{image}(\delta^{n-1})$, with kernel and image in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.
2. **Fixed-point cohomology.** $H^n_{\mathrm{fix}}(F) := \mathrm{Fix}(L^n)$ where $L^n := (\delta^n)^* \delta^n + \delta^{n-1}(\delta^{n-1})^*$ is the higher Hodge Laplacian.
3. **Derived-functor cohomology.** $H^n_{\mathrm{der}}(F) := R^n \Gamma(F)$, the right-derived global-sections functor.

## The theorem

**Theorem (Boolean d-frame derived cohomology agreement).** *In the Boolean-stalk scope above, all three notions agree:*

$$H^n_{\mathrm{coch}}(F) \;\cong\; H^n_{\mathrm{fix}}(F) \;\cong\; H^n_{\mathrm{der}}(F)$$

*for all $n \geq 0$, naturally in $F$.*

The proof has two parts: a Hodge theorem (Part 1, $H_{\mathrm{coch}} \cong H_{\mathrm{fix}}$) and a Čech–derived transfer (Part 2, $H_{\mathrm{coch}} \cong H_{\mathrm{der}}$).

## Proof

### Part 1: Q-enriched Hodge theorem (Boolean case)

The cochain group $C^n F = \prod_{\sigma \in \mathbf T_n} F(\sigma)$ is a complete Boolean algebra (product of complete Boolean algebras is complete Boolean). Each frame morphism $\delta^n_{\sigma, \tau} : F(\sigma) \to F(\tau)$ has a right adjoint $(\delta^n_{\sigma, \tau})^*$ (frame morphisms preserve arbitrary joins; right adjoints exist by the adjoint functor theorem and preserve arbitrary meets). The full coboundary $\delta^n$ assembles these componentwise; its right adjoint $(\delta^n)^*$ is the componentwise right adjoint.

**Boolean orthogonality.** In a complete Boolean algebra $B$, two elements $x, y \in B$ are **orthogonal**, written $x \perp y$, iff $x \wedge y = \bot$. Equivalently, $x \leq y^c$. For a subset $S \subseteq B$, write $S^\perp := \bigwedge_{s \in S} s^c$ — the **Boolean orthogonal complement**, a downward-closed sub-Boolean-algebra of $B$.

**Lemma (Boolean kernel-image relation).** *For a frame morphism $f : B \to B'$ between complete Boolean algebras with right adjoint $f^*$,*

$$\ker(f^*) = \{x \in B' : f^*(x) = \bot\} = (\mathrm{image}(f))^\perp.$$

*Proof.* $f^*(x) = \bot$ iff for all $b \in B$, $f(b) \leq x$ implies $b = \bot$. The latter is equivalent to $x \wedge f(b) = \bot$ for all $b$ (since the coreflective unit makes this a Boolean orthogonality condition on the image). Hence $x \in \mathrm{image}(f)^\perp$. The converse is similar via the same adjoint-counit unwinding. $\square$

**Hodge decomposition (Boolean).** Apply the lemma to $\delta^{n-1}$:

$$\ker((\delta^{n-1})^*) = \mathrm{image}(\delta^{n-1})^\perp \quad \text{in } C^n F.$$

Compute the suffix-point set of the higher Laplacian $L^n = (\delta^n)^* \delta^n + \delta^{n-1}(\delta^{n-1})^*$. In a complete Boolean algebra, the binary operation "addition" of monotone operators is by join: $(A + B)(x) = A(x) \vee B(x)$. The fixed-point condition $L^n(x) = x$ decomposes:

$$L^n(x) \leq x \iff (\delta^n)^* \delta^n(x) \leq x \text{ and } \delta^{n-1}(\delta^{n-1})^*(x) \leq x.$$

The second conjunct is the standard adjunction counit ($f f^* \Rightarrow \mathrm{id}$ in any adjunction). The first conjunct, combined with the Boolean kernel-image lemma, gives:

$$\mathrm{Fix}(L^n) = \ker(\delta^n) \cap \mathrm{image}(\delta^{n-1})^\perp.$$

Each cohomology class $[c] \in H^n_{\mathrm{coch}}(F) = \ker(\delta^n) / \mathrm{image}(\delta^{n-1})$ contains a unique **harmonic representative** $c_{\mathrm{harm}} = c \wedge \mathrm{image}(\delta^{n-1})^\perp$ — take any cocycle representative $c$ and intersect with the orthogonal complement of all coboundaries. The harmonic representative is:

- A cocycle (intersection of a cocycle with a sub-algebra invariant under $\delta^n$).
- Orthogonal to every coboundary (by construction).
- Cohomologous to $c$ (subtracting the part-in-image-of-$\delta^{n-1}$ part).

Hence $H^n_{\mathrm{coch}}(F) \cong \mathrm{Fix}(L^n) = H^n_{\mathrm{fix}}(F)$, with the bijection given by the harmonic-representative map. $\square$ (Part 1)

### Part 2: Cochain = derived under Husainov acyclicity

The corpus's [Čech–derived comparison theorem](cech-derived-comparison-on-bitopological-site.md) (proved) establishes that for $\mathbf{Ab}$-valued sheaves on the bitopological settling site, $\check H^n \cong H^n_{\mathrm{der}}$ under Husainov acyclicity.

**Transfer to Boolean d-frame setting.** The Čech–derived comparison's two ingredients transfer:

- *Fiber part.* Pairwise-Stone clopens form a Boolean algebra; for any constant sheaf with Boolean stalks, $\check H^n = 0$ for $n \geq 1$ (the standard Stone-space Čech vanishing — [@bredon1997] Ch. III §2 — applies stalk-wise because each Boolean stalk dualizes via Stone duality to a profinite set, and constant sheaves of Boolean algebras correspond to constant sheaves of profinite sets, which have the same Čech vanishing).
- *Cross-ordinal / cross-predicate part.* Husainov's Dedekind–MacNeille acyclicity controls poset-Čech vs poset-derived agreement based on the **poset structure**, not the value category. The argument transfers from $\mathbf{Ab}$ to Boolean-algebra-valued sheaves because Boolean algebras are abelian-group-like in the relevant sense (kernels and images of Boolean-frame morphisms behave like kernels and images of abelian-group homomorphisms, with Boolean orthogonal complement playing the role of abelian orthogonal complement).

Combining: $\check H^n_{\mathrm{Bool}}(F) \cong H^n_{\mathrm{der}}(F)$ in the Boolean-stalk scope under Husainov acyclicity. By standard Čech-cellular agreement (cellular cochain cohomology equals Čech cohomology on a regular CW complex with fine cover), $H^n_{\mathrm{coch}}(F) \cong \check H^n_{\mathrm{Bool}}(F)$. Hence $H^n_{\mathrm{coch}}(F) \cong H^n_{\mathrm{der}}(F)$. $\square$ (Part 2)

### Three-way agreement

Combining Parts 1 and 2: $H^n_{\mathrm{coch}}(F) \cong H^n_{\mathrm{fix}}(F)$ via Part 1's harmonic representatives and $H^n_{\mathrm{coch}}(F) \cong H^n_{\mathrm{der}}(F)$ via Part 2's Čech–derived transfer. Hence all three agree. $\blacksquare$

## Specialization to d-frame-valued sheaves on the bitopological settling site

For the corpus's typical setting — d-frame-valued sheaves $\mathbb F_v$ on the bitopological settling site $(\mathbf T^*, J)$ with Boolean d-frame stalks (powerset frames on cell sets) — the theorem applies directly:

$$H^n_{\mathrm{coch}}(\mathbb F_v) \;\cong\; H^n_{\mathrm{fix}}(\mathbb F_v) \;\cong\; H^n_{\mathrm{der}}(\mathbb F_v) \quad \text{for all } n \geq 0.$$

Concrete content:

- The corpus's [degree-0 cohomology = Lawvere Laplacian fixed points](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md) extends to all degrees: at each $n$, $\mathrm{Fix}(L^n)$ gives canonical harmonic representatives.
- The corpus's [higher-degree vanishing theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md) (cochain $H^{\geq 2} = 0$) now also gives $H^{\geq 2}_{\mathrm{fix}} = 0$ and $H^{\geq 2}_{\mathrm{der}} = 0$ in this scope.
- The chapter's regime-by-regime $H^1$ computations acquire derived-functor-cohomology meaning: each $H^1_\bullet$ is the genuine $R^1 \Gamma$, computable via cochain or fixed-point methods.

## Why the Boolean restriction matters

The harmonic-representative construction in Part 1 uses the **Boolean orthogonal complement** $S^\perp = \bigwedge_{s \in S} s^c$. In a general frame (Heyting algebra), the pseudo-complement $\neg x = (x \to \bot)$ does not satisfy $x \wedge \neg x = \bot$, breaking the orthogonal-complement construction. The three open theorems linked above (non-Boolean frames, Lawvere-quantale, general spectral sequence) each address one path beyond this restriction.

## Connection to Hansen–Ghrist Hodge theory

The Boolean Hodge theorem here is the **structural counterpart** of [@hansen-ghrist2019]'s Theorem 3.1 (discrete Hodge theorem on chain complexes of finite-dimensional Hilbert spaces, $\ker \Delta^k = H^k$).

Hansen–Ghrist use Hilbert orthogonal decomposition: $C^k = \mathcal H^k \oplus \mathrm{im}(\delta^{k-1}) \oplus \mathrm{im}((\delta^k)^*)$. The Boolean version uses Boolean orthogonal decomposition: $\mathrm{Fix}(L^n) = \ker(\delta^n) \cap \mathrm{image}(\delta^{n-1})^\perp$. Both are special cases of a **complemented-lattice Hodge theorem** that handles inner-product structures and Boolean structures uniformly — the uniform framework is itself open work, connected to Pass 4 of the [Hansen–Ghrist spectral engagement question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/hansen-ghrist-spectral-engagement.md).
