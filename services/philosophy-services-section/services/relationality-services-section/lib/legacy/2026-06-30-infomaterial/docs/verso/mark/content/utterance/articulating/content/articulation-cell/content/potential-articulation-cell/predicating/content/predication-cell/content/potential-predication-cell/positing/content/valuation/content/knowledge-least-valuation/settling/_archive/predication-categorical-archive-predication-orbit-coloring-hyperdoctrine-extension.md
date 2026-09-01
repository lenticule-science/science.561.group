---
type: theorem
status: sketch
depends-on:
  - predication-hyperdoctrine
  - orbit-coloring-fibration-extension
  - boundary-extended-predicate-category
  - orbit-coloring-generator
  - relaxed-bilattice-homomorphism-classification
  - knowledge-order
  - truth-order
  - bilattice
see-also:
  - orbit-coloring-generator-structural-integration
---

# Orbit-coloring hyperdoctrine extension

The [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) conditions (B1)-(B4) lift from $\mathcal C$ to $\mathcal C^\beta$ for all 18 generators in both order axes. Orbit-coloring reindexings acquire trivial or near-trivial adjoint-quantifier structure on constant-painted orbits and chapter-standard adjoint structure on principal-evaluation orbits. The extension is passive — no new quantifier classes appear, and the two-internal-logics architecture is unchanged.

## Statement

Let $\mathbf L$ be an integral commutative [residuated lattice](../objects/residuated-lattice.md) with $\mathbf L \neq \mathbf 1$, $|E| \geq 3$, and $\mathcal C^\beta$ the [boundary-extended predicate category](../objects/boundary-extended-predicate-category.md). Assume the chapter's [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) is established over $\mathcal C$. Then the [orbit-coloring fibration extension](orbit-coloring-fibration-extension.md) over $\mathcal C^\beta$ also satisfies:

**(B1$^\beta$k) $\le_k$-quantifier adjoints.** For every generator $g$ in $\mathcal C^\beta$ — chapter or orbit-coloring — the reindexing $g^* : A_q \to A_p$ has both a left adjoint $\exists_g^k$ and a right adjoint $\forall_g^k$ in the [knowledge-order](teaching/explanations/knowledge-order.md) enrichment.

**(B1$^\beta$t) $\le_t$-quantifier adjoints.** Dual statement in the [truth-order](teaching/explanations/truth-order.md) enrichment.

**(B2$^\beta$k), (B2$^\beta$t) Frobenius reciprocity.** Both Frobenius identities hold for all 18 generators.

**(B3$^\beta$) Beck-Chevalley coherence.** Holds for every pullback square in $\mathcal C^\beta$ — both pre-existing chapter squares and new squares involving orbit-coloring generators.

**(B4$^\beta$) Comprehension.** The extension functor $\mathrm{Ext}^t : \mathcal C^\beta/p \to A_p$ has a right adjoint, with analogous statement for $\le_k$.

The adjoint structure on orbit-coloring generators decomposes per-orbit: on principal-evaluation orbits the adjoints coincide with the chapter's; on constant-painted orbits the adjoints are constant or characteristic functions of the painting value.

## Proof

The argument proceeds by per-orbit decomposition. Every generator $g^*$ in $\mathcal C^\beta$ has the form

$$g^*(v)(s', o') = \alpha_O(v) \quad \text{for } (s', o') \in O,\ O \in \{\Delta, \Delta^c\}$$

with $\alpha_O \in \{\mathrm{constant\text{-}}\bot,\ \mathrm{constant\text{-}}\top,\ \mathrm{ev}_p\}$ from [relaxed bilattice homomorphism classification](relaxed-bilattice-homomorphism-classification.md). Since fiber operations $\wedge_k, \vee_k, \wedge_t, \vee_t$ are pointwise, every condition reduces orbit-by-orbit.

### (B1) Adjoint existence

The fibers $A_q = (\mathbf L^\bowtie)^{E\times E}$ are complete lattices in both $\le_k$ and $\le_t$ enrichments (pointwise from $\mathbf L^\bowtie$, which is a complete bilattice when $\mathbf L$ is). By the adjoint functor theorem for complete lattices, $g^*$ has a left adjoint iff it preserves all $\le$-meets and a right adjoint iff it preserves all $\le$-joins.

For each per-orbit $\alpha_O$:

- **constant-$\bot$ or constant-$\top$:** Trivially preserves all infs and sups (constant maps preserve every pointwise lattice operation).
- **$\mathrm{ev}_p$ for some fixed $p \in E\times E$:** Projection onto a single cell. Preserves all pointwise infs and sups.

Pointwise composition of orbit-wise infs/sups-preserving maps preserves infs/sups globally. So $g^*$ preserves all infs and sups, hence both adjoints exist. This holds for both $\le_k$ and $\le_t$.

### Adjoint computation by case

Direct computation from $\exists_g(\phi) = \bigwedge\{\alpha : \phi \le g^*(\alpha)\}$ and $\forall_g(\phi) = \bigvee\{\alpha : g^*(\alpha) \le \phi\}$.

**Total constant** (both orbits constant, value $w_0 \in A_p$ a fixed valuation, e.g. $\eta_\top$ has $w_0 = \top_{A_p}$):

- $\exists_g^k(\phi) = \bot_{A_q}$ if $\phi \le_k w_0$, else $\top_{A_q}$.
- $\forall_g^k(\phi) = \top_{A_q}$ if $w_0 \le_k \phi$, else $\bot_{A_q}$.

These are characteristic-of-$w_0$ maps; trivial.

**One constant orbit, one ev orbit** (e.g. $\eta_\top^\Delta \cdot \mathrm{ev}_\mathrm{id}$, painting $\Delta$ with $\top$ and acting as identity on $\Delta^c$):

$g^*(\alpha)(s', o') = \top$ on $\Delta$, $\alpha(s', o')$ on $\Delta^c$.

$\phi \le_k g^*(\alpha)$ iff $\phi|_\Delta \le_k \top$ (automatic) and $\phi|_{\Delta^c} \le_k \alpha|_{\Delta^c}$.

So $\exists_g^k(\phi)$ has the smallest $\le_k$-value satisfying both: $\bot$ on $\Delta$ (no constraint, take $\le_k$-bottom), and $\phi|_{\Delta^c}$ on $\Delta^c$. Symmetrically $\forall_g^k$ on this case yields $\top$ on $\Delta$ and $\phi|_{\Delta^c}$ on $\Delta^c$ (when $\phi|_\Delta = \top$, else $\bot_{A_q}$).

Per-orbit reading: on the constant-$\top$ orbit, the adjoint pair forces the value to $\top$ ($\forall$) or $\bot$ ($\exists$); on the ev orbit, the adjoint pair acts as the chapter's identity-reindexing adjoints.

**Both ev orbits** (chapter classes with full domain): adjoints coincide with the chapter's hyperdoctrine adjoints — no extension needed.

**Symmetric statements for $\le_t$.** The $\le_t$-bottom in $\mathbf L^\bowtie$ is $\mathbf f = \langle 0, 1\rangle$ and $\le_t$-top is $\mathbf t = \langle 1, 0\rangle$. The constant-painting value $\top = \langle 1, 1\rangle$ is *neither* a $\le_t$-bound — it is intermediate. So the $\le_t$ adjoints for constant-$\top$ painting are not characteristic functions of $\top$ in the same form, but are structurally analogous: they collapse to the $\le_t$-bound (constant-$\mathbf f$ for $\exists^t$, constant-$\mathbf t$ for $\forall^t$) when $\phi$ does or does not satisfy the per-orbit $\top$-comparability condition. Same per-orbit decomposition argument; no new computation needed.

### (B2) Frobenius reciprocity

Show $\exists_g^k(g^*(\alpha) \wedge_k \phi) = \alpha \wedge_k \exists_g^k(\phi)$ orbit-by-orbit.

**Constant orbit** (painting value $c \in \{\bot, \top\}$):

LHS at $(s', o') \in O$: $g^*(\alpha)|_O = c$, $c \wedge_k \phi|_O$, then $\exists_g^k$ of this on $O$.

RHS at $(s', o') \in O$: $\alpha|_O \wedge_k \exists_g^k(\phi)|_O$. The $\exists_g^k(\phi)|_O$ is the $\le_k$-bottom $\bot$ when $\phi|_O \le_k c$, else $\top$. So $\alpha|_O \wedge_k \bot = \bot$ or $\alpha|_O \wedge_k \top = \alpha|_O$.

LHS: $\exists_g^k(c \wedge_k \phi)|_O$ — depends on whether $c \wedge_k \phi|_O \le_k c$. Always $c \wedge_k \phi|_O \le_k c$, so LHS $= \bot$.

When $c = \top$: $c \wedge_k \phi = \phi$, and the constraint $\phi \le_k \top$ is automatic, so LHS $= \bot$. RHS: $\alpha \wedge_k \bot = \bot$. Equal. ✓

When $c = \bot$: $c \wedge_k \phi = \bot$, constraint $\bot \le_k \bot$ automatic, LHS $= \bot$. RHS: $\alpha \wedge_k \bot = \bot$. Equal. ✓

**Ev orbit:** $g^*$ acts as identity-pull on this orbit (with possibly nontrivial index permutation), so Frobenius reduces to the chapter's Frobenius identity for that ev-class — established in the chapter.

Composing the per-orbit decompositions: (B2$^\beta$k) holds globally for all 18 generators. Same argument for (B2$^\beta$t).

### (B3) Beck-Chevalley

In $\mathcal C^\beta$, pullback squares fall into three types:

1. **Both legs are chapter generators.** Pullback exists in $\mathcal C$, BC holds by chapter's (B3).

2. **One leg is an orbit-coloring generator.** Say $g : p \to q$ is orbit-coloring with $g^* = \eta_\top^O \cdots$, and we pull back along a chapter morphism $f : r \to q$. The pullback square exists in $\mathcal C^\beta$ with the obvious diagonal: the orbit-coloring construction is determined entirely by the orbit structure of $E\times E$, which is invariant under the chapter's index maps $g \in \{\mathrm{id}, \mathrm{swap}, \mathrm{subj}, \mathrm{obj}\}$ (all $\mathrm{Sym}(E)$-equivariant). So the pullback of $g$ along $f$ is again an orbit-coloring generator with the same orbit structure transformed by $f$.

   BC checks $\exists_{p_A}^k(p_B^* \phi) = f^*(\exists_g^k \phi)$. By per-orbit decomposition, both sides reduce on constant orbits to the constant $\bot$ (since $\exists$ collapses to $\bot$ on constant orbits) and on ev orbits to the chapter's BC identity. Coincides. ✓

3. **Both legs are orbit-coloring generators.** Pullback computed by leftmost-wins composition; both sides of BC reduce to constants on constant orbits and to chapter BC on ev orbits.

So (B3$^\beta$) holds.

### (B4) Comprehension

$\mathrm{Ext}^t : \mathcal C^\beta/p \to A_p,\ (g : q \to p) \mapsto \exists_g^t(\mathbf 1_q^t)$.

For chapter generators $g$: chapter's (B4) gives the right adjoint $\{p : -\}_\mathbf t$.

For orbit-coloring generators $g : q \to p$ with $g^* = (\alpha_\Delta, \alpha_{\Delta^c})$: 

- If $g^*$ is fully constant (both orbits constant): $\exists_g^t(\mathbf 1_q^t)$ is a constant value in $A_p$ ($\le_t$-bound, depending on whether $\mathbf 1_q^t = \mathbf t$ comparable to the constant value $w_0$). Concretely $\exists_g^t(\mathbf t) = \mathbf t_{A_q}$ or $\mathbf f_{A_q}$ depending on $\mathbf t \le_t w_0$ — both yield constant-valuation outputs of $\mathrm{Ext}^t$.

- If $g^*$ is mixed (one orbit constant, one ev): $\exists_g^t(\mathbf t)$ has chapter-standard structure on the ev orbit and constant-bound structure on the constant orbit.

The right adjoint $\{p : -\}_\mathbf t$ extends accordingly: on chapter morphisms, chapter's right adjoint; on orbit-coloring morphisms, sends fiber elements to the unique orbit-coloring morphism that paints the appropriate orbit, lifted via the chapter's adjoint on the ev orbits. The slice $\mathcal C^\beta/p$ is finite (finite generators times finite predicate set), so existence of the right adjoint reduces to finite case-checking, which the orbit-by-orbit decomposition supplies.

(B4$^\beta$) holds. $\square$

## Reading

The hyperdoctrine extension is *passive*. All of (B1)-(B4) lift from $\mathcal C$ to $\mathcal C^\beta$ by a per-orbit decomposition argument. The chapter's two-internal-logics architecture, Beck-Chevalley coherence, and comprehension structure are all preserved.

What the orbit-coloring generators contribute, structurally, is *not* a new quantifier class but a restricted class of *idempotent* fibration morphisms whose adjoint structure is degenerate on the painted orbit. The painted orbit becomes a "saturated" fragment of the fiber where adjoint quantification is trivial; the unpainted orbit retains the chapter's full hyperdoctrinal structure.

Concretely: if a fiber has been orbit-painted with $\top$ on the diagonal, then $\exists^k$ over that orbit is constantly $\bot_{A_q}$ — there is no positive quantification because everything is already saturated. This matches the operational reading of orbit-coloring as "inconsistency injection on this orbit." Quantifying over an inconsistency-saturated subsystem yields trivial information; the math agrees with this intuition.

This confirms the question's expected answer: orbit-coloring reindexings have trivial adjoints, are compatible idempotents under composition, and add no new quantifier types. The hyperdoctrine extension is structurally complete but operationally inert. It does not generate a Lindström-quantifier extension or any other new logical structure. The chapter's existing two-internal-logics framework continues to be the right framework over $\mathcal C^\beta$.

## Position

This resolves [orbit-coloring generator structural integration](questions/orbit-coloring-generator-structural-integration.md) sub-question 2 with the predicted "passive enrichment" outcome. Three sub-questions remain: closure 2-monad triviality on painted orbits, Verdier dual at the boundary, and strong-MLD with orbit-colored firings. The pattern from sub-questions 1 and 2 — bilattice/structural fragment extends cleanly via per-orbit decomposition; degenerate-fragment behavior on constant orbits — is likely to recur.
