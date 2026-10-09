---
type: theorem
status: sketch
depends-on:
  - closure-2-monad
  - closure-operator
  - orbit-coloring-fibration-extension
  - boundary-extended-predicate-category
  - orbit-coloring-generator
  - relaxed-bilattice-homomorphism-classification
  - knowledge-order
  - four-regime-dichotomy
see-also:
  - orbit-coloring-generator-structural-integration
  - orbit-coloring-hyperdoctrine-extension
---

# Orbit-coloring closure 2-monad extension

The [closure 2-monad](../morphisms/closure-2-monad.md) extends from $\mathcal C$ to $\mathcal C^\beta$ if and only if the underlying closure operator family is *boundary-active and orbit-decomposable*. This is a non-trivial restriction on admissible closures, not a passive enrichment: many of the chapter's natural inferential closures (transitivity, relational-hypothesis modus ponens, axiomatic-insertion closures) fail it. Within the four-regime dichotomy, restricting to admissible closures cuts each regime to a strict sub-class.

## Statement

Let $(\mathbf L, \mathcal C, E)$ be base parameters and $\mathcal C^\beta$ the [boundary-extended predicate category](../objects/boundary-extended-predicate-category.md). Let $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal C^\beta}$ be a [closure operator](../morphisms/closure-operator.md) family on the predication fiber functor extended to $\mathcal C^\beta$.

Then $\mathrm{cl}$ generates a [closure 2-monad](../morphisms/closure-2-monad.md) on $\mathbf{PrFib}(\mathbf L, \mathcal C^\beta, E)$ iff $\mathrm{cl}$ satisfies the chapter's four closure axioms (monotone, inflationary, idempotent, $\mathcal C$-natural) **and** the following two extension conditions:

**(C1) Boundary stability.** For each of the four boundary-paint states $w \in \{w_{\top\top},\ w_{\top\bot},\ w_{\bot\top},\ w_{\bot\bot}\} \subseteq A_p$ — where $w_{c_\Delta\, c_{\Delta^c}}$ denotes the valuation that is constant $c_\Delta$ on $\Delta$ and constant $c_{\Delta^c}$ on $\Delta^c$, with $c_O \in \{\bot, \top\}$ — the closure-fixed-point condition holds:

$$\mathrm{cl}_p(w) = w \quad \text{for all } p \in \mathcal C^\beta.$$

**(C2) Orbit decomposability.** For each $p \in \mathcal C^\beta$, there exist orbit-restricted closure operators $\mathrm{cl}_p^\Delta : (\mathbf L^\bowtie)^\Delta \to (\mathbf L^\bowtie)^\Delta$ and $\mathrm{cl}_p^{\Delta^c} : (\mathbf L^\bowtie)^{\Delta^c} \to (\mathbf L^\bowtie)^{\Delta^c}$ such that

$$\mathrm{cl}_p(v) = (\mathrm{cl}_p^\Delta(v|_\Delta),\ \mathrm{cl}_p^{\Delta^c}(v|_{\Delta^c}))$$

for every $v \in A_p$.

(C1) is implied by (C2) for the boundary states $w_{\top\top}$ and $w_{\bot\bot}$ but not in general for $w_{\top\bot}$ and $w_{\bot\top}$ — boundary stability has to be stated explicitly because an orbit-decomposable closure with non-trivial component closures may still fail to fix the mixed boundary states.

## Proof

### Necessity — orbit-coloring generators force (C1) and (C2)

Let $g : p \to q$ be an orbit-coloring generator in $\mathcal C^\beta$ with $g^* : A_q \to A_p$ a constant function with value $w_0 \in A_p$. The closure-naturality axiom $g^* \circ \mathrm{cl}_q = \mathrm{cl}_p \circ g^*$ at any $v \in A_q$ requires

$$g^*(\mathrm{cl}_q(v)) = \mathrm{cl}_p(g^*(v)).$$

LHS: $g^*$ is constant $w_0$, so LHS $= w_0$.

RHS: $g^*(v) = w_0$, so RHS $= \mathrm{cl}_p(w_0)$.

Hence $w_0 = \mathrm{cl}_p(w_0)$.

The four constant-orbit-coloring generators in $\mathcal C^\beta$ have $w_0$ ranging over $\{w_{\top\top}, w_{\top\bot}, w_{\bot\top}, w_{\bot\bot}\}$. So (C1) is necessary.

For mixed orbit-colorings (one orbit constant, one orbit ev), let $g : p \to q$ have $g^*(v)(s', o') = c$ on orbit $O$ (constant) and $g^*(v)(s', o') = v(\sigma(s', o'))$ on the other orbit $O^c$ (ev for some $\sigma$). The naturality identity at off-orbit cell $(s', o') \in O^c$ reads

$$\mathrm{cl}_q(v)(\sigma(s', o')) = \mathrm{cl}_p(g^*(v))(s', o').$$

The LHS is the closure-on-$A_q$ of $v$, evaluated at $\sigma(s', o')$. The RHS is the closure-on-$A_p$ of "constant $c$ on $O$ paired with $v|_{O^c}$ pulled back via $\sigma$," evaluated at $(s', o') \in O^c$.

For this identity to hold for every $v$ and every choice of orbit-coloring boundary value $c$, the closure-on-$A_p$ must compute the $O^c$-component of its result purely from the $O^c$-component of its input — i.e., there is no information transfer from the $O$-component (which is the painted constant $c$) into the $O^c$-component of the closure. This is the restriction-to-$\Delta^c$ part of (C2).

The symmetric argument, using a generator with the orbits swapped, gives the restriction-to-$\Delta$ part. So (C2) is necessary.

### Sufficiency — (C1) and (C2) close all naturality squares

Given (C1) and (C2), check naturality for each generator class in $\mathcal C^\beta$:

**Chapter generators.** Naturality is the chapter's hypothesis ($\mathrm{cl}$ is $\mathcal C$-natural), unchanged.

**Constant orbit-coloring generators** ($g^* \equiv w_0$ for $w_0 \in \{w_{\top\top}, w_{\top\bot}, w_{\bot\top}, w_{\bot\bot}\}$):

LHS: $g^*(\mathrm{cl}_q(v)) = w_0$.
RHS: $\mathrm{cl}_p(g^*(v)) = \mathrm{cl}_p(w_0) = w_0$ by (C1).

Equal. ✓

**Mixed orbit-coloring generators** ($g^*$ paints $O$ with constant $c$, ev on $O^c$):

LHS at cell $(s', o')$:
- If $(s', o') \in O$: $g^*(\mathrm{cl}_q(v)) = c$.
- If $(s', o') \in O^c$: $g^*(\mathrm{cl}_q(v)) = \mathrm{cl}_q(v)(\sigma(s', o'))$.

RHS at cell $(s', o')$:
- $g^*(v)$ is constant $c$ on $O$ and $v(\sigma(\cdot))$ on $O^c$.
- By (C2), $\mathrm{cl}_p(g^*(v)) = (\mathrm{cl}_p^O(g^*(v)|_O),\ \mathrm{cl}_p^{O^c}(g^*(v)|_{O^c}))$.
- Restricted to $O$: $g^*(v)|_O = $ constant $c$. By boundary stability *for the constant part*, $\mathrm{cl}_p^O(\text{constant } c) = $ constant $c$ (this follows from (C1) applied to the relevant $w_{c\, \cdot}$ or $w_{\cdot\, c}$ projected to the $O$-orbit). So RHS$|_O = c$.
- Restricted to $O^c$: $g^*(v)|_{O^c} = v(\sigma(\cdot))$. So $\mathrm{cl}_p^{O^c}(v(\sigma(\cdot))) = \mathrm{cl}_q^{O^c}(v)(\sigma(\cdot))$ provided the chapter's $\mathcal C$-naturality lifted to the orbit-restricted closure on the $O^c$ component — which follows from (C2) being uniform in $p$ across the chapter's $\mathcal C$-naturality structure.

Equal at both cell types. ✓

So (C1)+(C2)+chapter axioms $\Rightarrow$ closure-naturality wrt all $\mathcal C^\beta$ generators. The closure 2-monad construction then proceeds as in the chapter's [closure 2-monad](../morphisms/closure-2-monad.md). $\square$

## Reading

The closure-2-monad extension is *not* the per-orbit-decomposition free ride that the fibration and hyperdoctrine extensions were. It imposes a real selection condition on closures.

**Boundary stability (C1)** is mild but non-trivial. It excludes closures with axiomatic insertions ($\mathrm{cl}_p(\bot) \neq \bot$ — closures that insert always-true facts) and closures whose rule system fires on the mixed boundary states ($\mathrm{cl}_p(w_{\top\bot}) \neq w_{\top\bot}$ — typical of any rule that interprets diagonal saturation as evidence for off-diagonal consequences, or vice versa).

**Orbit decomposability (C2)** is the strong condition. It excludes:

- **Transitivity-style closures.** A rule like "$v(s, o) \wedge v(o, r) \Rightarrow v(s, r)$" mixes orbits whenever $s, o, r$ are pairwise distinct (off-diagonal antecedents, off-diagonal consequent), but also when $s = r \neq o$ (off-diagonal antecedents, diagonal consequent) and when $o = s$ or $o = r$ (mixed antecedents). The closure derived from transitivity is generically not orbit-decomposable.
- **Relational-hypothesis modus ponens.** Any rule whose antecedent involves both diagonal and off-diagonal cells of the same valuation, with a consequent on the other orbit, fails (C2).
- **Equivalence-relation closures.** Symmetry ($v(s, o) \Rightarrow v(o, s)$) preserves orbit structure (the $\mathrm{Sym}(E)$-orbit containing $(s, o)$ also contains $(o, s)$), so symmetry alone is orbit-decomposable. But adding reflexivity ($v(s, s) = \top$ axiomatically — fails (C1)) or transitivity (fails (C2)) breaks this.

The closures that **do** extend cleanly are largely those whose rules are confined to one orbit at a time:

- **Pointwise saturation.** "$v(s, o) \ge_k \alpha \Rightarrow v(s, o) = \mathrm{cl}_\alpha$" with no inter-cell coupling is trivially orbit-decomposable.
- **Single-orbit closures.** Rules whose antecedents and consequents both live in a single $\mathrm{Sym}(E)$-orbit. These respect orbit structure by construction.
- **Identity closure.** $\mathrm{cl}_p = \mathrm{id}$. Trivially satisfies both (C1) and (C2).

This admissibility restriction has consequences for the [four-regime dichotomy](../../../../../references/four-regime-dichotomy.md):

- **Strict regime.** Most finite-state pointwise closures are admissible. The strict regime is barely affected — the boundary states are just four extra fixed points to verify, and decomposability is automatic for cell-local closures.
- **Scott-continuous regime.** Finitary inferential closures (logic programming, description logics) typically *fail* (C2). The Scott-continuous regime over $\mathcal C^\beta$ is much sparser than over $\mathcal C$ — most natural inference rules are excluded.
- **Transfinite-bounded and aperiodic regimes.** Quantifier-driven closures with infinitary $\forall$-blocks frequently fail both (C1) and (C2). These regimes nearly empty out under the restriction.

**The structural moral:** orbit-coloring generators carry a strong commitment about what closures are admissible — they enforce that the inference structure on $A_p$ respects the $\{\Delta, \Delta^c\}$-orbit partition. This is a substantive constraint, *not* a free extension of the closure-2-monad framework.

## Position vs the question's prediction

The question's prediction said: closure on orbit-colored fibers should factor as "identity on the painted orbit, ordinary closure on the unpainted orbit," and the four-regime dichotomy should restrict cleanly with no fifth regime.

This prediction is **half-right and half-wrong**. The factorization claim is structurally correct *for closures that satisfy (C2)* — they do decompose this way. But the prediction silently assumed that the chapter's closures generally satisfy (C2), and they don't. The four-regime dichotomy doesn't get a fifth regime, but each existing regime gets cut down to its (C1)+(C2)-admissible sub-class, and the cut is severe in the Scott-continuous and transfinite regimes.

In particular, the chapter's strong-MLD framework (sub-question 5) and Verdier-duality framework (sub-question 4) are built on top of specific closure operators that may or may not be admissible over $\mathcal C^\beta$. Whether those frameworks extend depends on whether their underlying closures satisfy (C1)+(C2) — a question that has to be asked of each framework specifically, not assumed away.

## Position

This resolves [orbit-coloring generator structural integration](questions/orbit-coloring-generator-structural-integration.md) sub-question 3 with a partial-yes answer: extension is possible but restrictive. The "no fifth regime" prediction is correct; the "passive enrichment" framing of sub-questions 1-2 does NOT carry over to closure structure.

This finding directly affects sub-questions 4 and 5: their resolution requires checking whether the chapter's specific closures (those generating Verdier-duality and strong-MLD structure) satisfy (C1)+(C2). That check is concrete but non-trivial, and the answer may be negative for some chapter constructions.
