---
type: theorem
status: sketch
depends-on:
  - bilattice-homomorphism
  - bilattice-homomorphism-naturality
  - predication-fiber-algebra
  - predicate-generator-exhaustiveness
  - twist-product
  - entity-set
  - knowledge-order
see-also:
  - orbit-coloring-generator
  - boundary-extended-predicate-category
  - sym-e-no-invariant-non-principal-ultrafilter
---

# Relaxed bilattice homomorphism classification

Drops the bottom-preservation hypothesis from [predicate-generator exhaustiveness](../../predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md). The classification picks up exactly eight new generator classes — none of them ultrafilter-quantifiers; all of them finite orbit-colorings.

## Statement

Let $|E| \geq 3$ and $\mathbf L = \mathbf 2$. Every natural — i.e. $\mathrm{Sym}(E)$-equivariant — [bilattice homomorphism](../morphisms/bilattice-homomorphism.md) $\phi : A_q \to A_p$ between [predication fiber algebras](../objects/predication-fiber-algebra.md) is determined by a pair

$$(\alpha_\Delta,\, \alpha_{\Delta^c})$$

of choices, one per $\mathrm{Sym}(E)$-orbit of $E\times E$. Per orbit:

- $\alpha_\Delta \in \{\,\mathrm{constant\text{-}}\bot,\ \mathrm{constant\text{-}}\top,\ \mathrm{ev}_\mathrm{diag}\,\}$ — three choices
- $\alpha_{\Delta^c} \in \{\,\mathrm{constant\text{-}}\bot,\ \mathrm{constant\text{-}}\top,\ \mathrm{ev}_\mathrm{id},\ \mathrm{ev}_\mathrm{swap},\ \mathrm{ev}_\mathrm{subj},\ \mathrm{ev}_\mathrm{obj}\,\}$ — six choices

giving $3 \times 6 = 18$ natural bilattice homomorphisms in total, of which the chapter's bottom-preserving classification captures the principal-evaluation-only sub-product (the 9 combinations $\{\mathrm{ev}_\mathrm{diag}, \mathrm{constant\text{-}}\bot\} \times \{\text{four chapter }g\text{'s}, \mathrm{constant\text{-}}\bot\}$).

The 9 not in the chapter are the new generator classes: 8 distinct **orbit-coloring generators** (one orbit set to $\mathrm{constant\text{-}}\top$, the other taking one of the chapter's choices or constant-$\bot$) plus the global-collapse generator (both orbits constant-$\top$). They are catalogued as [orbit-coloring generator](../../klein-four-symmetry/content/orbit-coloring-generator/orbit-coloring-generator.md).

For general $\mathbf L$, the same per-orbit decomposition holds; each $\alpha$ is replaced by a $\mathrm{Stab}$-invariant lattice homomorphism $\mathbf L^{E\times E} \to \mathbf L$, and the inventory size depends on $\mathbf L$.

## Proof

**Step 1 — Per-coordinate factoring without bottom-preservation.** Fix $(s', o') \in E\times E$ and consider $h := \mathrm{ev}_{(s', o')} \circ \phi : A_q \to \mathbf L^\bowtie$, a bilattice homomorphism. Write $h(P, N) = (h_+(P, N), h_-(P, N)) \in \mathbf L \times \mathbf L$, with $A_q = \mathbf L^{\bowtie\, E\times E}$ identified as $\{(P, N) : P, N \in \mathbf L^{E\times E}\}$.

The bilattice operations on $A_q$ act pointwise as $(P_1, N_1) \wedge_t (P_2, N_2) = (P_1 \wedge P_2, N_1 \vee N_2)$ and $\wedge_k$ componentwise. Setting $P_1 = P_2 = P$:

- $\wedge_t$ on the $h_+$ component: $h_+(P, N_1 \vee N_2) = h_+(P, N_1) \wedge h_+(P, N_2)$.
- $\wedge_k$ on the $h_+$ component: $h_+(P, N_1 \wedge N_2) = h_+(P, N_1) \wedge h_+(P, N_2)$.

Setting $N_1 = \top_{\mathbf L^{E\times E}}$, $N_2 = N$ in the first equation: $h_+(P, \top) = h_+(P, N) \wedge h_+(P, \top)$, so $h_+(P, \top) \le h_+(P, N)$. In the second: $h_+(P, N) = h_+(P, \top) \wedge h_+(P, N)$, so $h_+(P, N) \le h_+(P, \top)$. Combined: $h_+(P, N) = h_+(P, \top)$ for every $N$. So **$h_+(P, N)$ is independent of $N$**; write $\alpha(P) := h_+(P, \top)$.

Symmetrically, $h_-(P, N)$ is independent of $P$. The $\sim$-preservation condition $h(\sim(P, N)) = \sim h(P, N)$ — i.e. $h(N, P) = (h_-(P, N), h_+(P, N))$ — yields $h_+(N, P) = h_-(P, N)$, so $h_-(P, N) = \alpha(N)$. The unified shape

$$h(P, N) = (\alpha(P),\, \alpha(N))$$

holds, with $\alpha : \mathbf L^{E\times E} \to \mathbf L$ a lattice homomorphism preserving componentwise $\wedge$ and $\vee$ (verified by plugging into $\wedge_t, \vee_t, \wedge_k, \vee_k$ on $A_q$). $\alpha$ is **not** required to preserve $\bot$ or $\top$.

**Step 2 — Classification of $\alpha$ for $\mathbf L = \mathbf 2$.** A lattice hom $\alpha : \mathbf 2^{E\times E} \to \mathbf 2$ preserving $\wedge, \vee$ (no bound preservation) is monotone: if $S \subseteq T$ then $\alpha(S) = \alpha(S \wedge T) = \alpha(S) \wedge \alpha(T) \le \alpha(T)$. Set $a := \alpha(\emptyset)$, $b := \alpha(E\times E)$. By monotonicity $a \le b$. Three cases:

- $(a, b) = (0, 0)$: $\alpha$ is constant 0.
- $(a, b) = (1, 1)$: $\alpha$ is constant 1.
- $(a, b) = (0, 1)$: $\alpha$ is a Boolean homomorphism, hence corresponds to an ultrafilter on $E\times E$.
- $(a, b) = (1, 0)$: forbidden by monotonicity.

**Step 3 — Per-orbit $\mathrm{Stab}$-invariance forces $\alpha_{(s', o')}$ to be principal-or-constant.** For each output cell $(s', o')$, $\alpha_{(s', o')}$ is the per-coordinate $\alpha$ from Step 1. Naturality of $\phi$ — $\sigma^* \circ \phi = \phi \circ \sigma^*$ for every $\sigma \in \mathrm{Sym}(E)$ — translates to $\alpha_{\sigma^{-1}(s', o')}(v) = \alpha_{(s', o')}(\sigma^* v)$. Setting $\sigma \in \mathrm{Stab}(s', o')$: $\alpha_{(s', o')}(v) = \alpha_{(s', o')}(\sigma^* v)$ for every $v$ — i.e. $\alpha_{(s', o')}$ is $\mathrm{Stab}(s', o')$-invariant.

If $\alpha_{(s', o')}$ is the constant-0 or constant-1 case from Step 2, $\mathrm{Stab}$-invariance is automatic.

If $\alpha_{(s', o')}$ corresponds to an ultrafilter $\mathcal U$ on $E\times E$, $\mathrm{Stab}(s', o')$-invariance forces $\mathcal U$ to be a $\mathrm{Stab}(s', o')$-invariant ultrafilter. By [no $\mathrm{Sym}(E)$-equivariant non-principal ultrafilter](sym-e-no-invariant-non-principal-ultrafilter.md), no such non-principal ultrafilter exists on any non-singleton orbit of $\mathrm{Stab}(s', o')$ for infinite $E$, and trivially none on finite cases. So $\mathcal U$ is principal at a $\mathrm{Stab}(s', o')$-fixed point of $E\times E$.

The $\mathrm{Stab}(s', o')$-fixed points of $E\times E$ are:
- For $(s', o') = (s, s)$ on the diagonal, $\mathrm{Stab} = \mathrm{Sym}(E\setminus\{s\})$, fixed points $\{(s, s)\}$ — one option.
- For $(s', o') = (s, o)$ off-diagonal ($s \neq o$), $\mathrm{Stab} = \mathrm{Sym}(E\setminus\{s, o\})$, fixed points $\{s, o\}\times\{s, o\}$ — four options corresponding to identity, swap, subject-collapse, object-collapse.

So per-coordinate, $\alpha_{(s', o')} \in \{\mathrm{constant\text{-}}\bot, \mathrm{constant\text{-}}\top\} \cup \{\mathrm{ev}_p : p \text{ Stab-fixed}\}$.

**Step 4 — $\mathrm{Sym}(E)$-equivariance reduces per-coord choice to per-orbit choice.** The propagation $\alpha_{\sigma^{-1}(s', o')}(v) = \alpha_{(s', o')}(\sigma^* v)$ across $\sigma \in \mathrm{Sym}(E)$ determines $\alpha$ on the rest of an orbit from its value on a representative. So the data is two choices (one per orbit), giving the inventory above. $\square$

## Corollary — recovery of the chapter

The chapter's [predicate-generator exhaustiveness](../../predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), restricted to bottom-preserving $\phi$, picks out exactly the slice with both $\alpha_\Delta \neq \mathrm{constant\text{-}}\top$ and $\alpha_{\Delta^c} \neq \mathrm{constant\text{-}}\top$ — i.e. the principal-evaluation-or-constant-$\bot$ sub-inventory of size $2 \times 5 = 10$, with the chapter's "sub-support $D$" parameter encoding the $\mathrm{constant\text{-}}\bot$ vs. $\mathrm{ev}$ choice on each orbit and the chapter's $g$ encoding the off-diagonal $\mathrm{ev}$ choice.

The $\psi : \mathbf L^\bowtie \to \mathbf L^\bowtie$ factor in the chapter's statement is forced to be the identity for $\mathbf L = \mathbf 2$ (the only bound-preserving bilattice endomorphism of FOUR preserving $\wedge_t$, $\vee_t$, $\wedge_k$, $\vee_k$, and $\sim$ is the identity), so it adds no degrees of freedom over the 10 already counted.

The 8 generators not in the chapter — those with at least one orbit set to $\mathrm{constant\text{-}}\top$ — are the [orbit-coloring generators](../../klein-four-symmetry/content/orbit-coloring-generator/orbit-coloring-generator.md). They are the structural content of dropping bottom-preservation.

## What this kills

A larger conjectural cascade — equivariant non-principal ultrafilters on $E\times E$ as new generators, Lindström-style generalized-quantifier internal logics, fifth regime in the closure 2-monad classification, six-functor extension of Verdier duality via a Stone-Čech boundary, ultrafilter-stratified strong-MLD continuum — collapses entirely. The obstruction is at Step 3: $\mathrm{Sym}(E)$-equivariance is incompatible with non-principal ultrafilters, captured tightly by [no $\mathrm{Sym}(E)$-equivariant non-principal ultrafilter](sym-e-no-invariant-non-principal-ultrafilter.md). The "boundary at infinity" is empty.

The actual new structure is finite, finite-dimensional in any reasonable sense, and its consequences for the fibration / hyperdoctrine / closure-2-monad layer are open structural questions about a concrete short list of new morphisms, not about a continuum of ultrafilter-quantifiers.

## Position

This theorem is the corrected resolution of the program-shaping question that previously lived under the working title "bottom-preservation as principal-ultrafilter restriction." The principal-ultrafilter framing was *almost* right — bottom-preservation does coincide with the principal $\alpha$ versus constant $\alpha$ split — but the conjectured non-principal extension does not survive the equivariance obstruction. The remaining open structural questions about how the orbit-coloring generators interact with the rest of the chapter are collected in [orbit-coloring generator structural integration](questions/orbit-coloring-generator-structural-integration.md).
