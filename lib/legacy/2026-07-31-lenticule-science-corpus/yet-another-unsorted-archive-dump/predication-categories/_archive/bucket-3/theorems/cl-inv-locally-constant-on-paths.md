---
kind: theorem
status: proved
depends-on: [settling-path, skh-deformation-ext-classification, settling-cohomology-vanishes-above-degree-1, aperiodic-classifying-invariant, settling-moduli-stack-theorem, mutually-locally-derivable]
---

# Classifying invariant is locally constant on settling paths (no-tunneling)

The corpus's deformation theory has a clean cohomological-tunneling negative result: **the classifying invariant is locally constant on any [settling path](../objects/settling-path.md), so smooth deformation paths cannot cross between MLD-equivalence classes.** The moduli stack's connected components are precisely the MLD-classes.

This is the structural answer to "can a settling tunnel from one cohomological classification to another via smooth deformation?" — **no, not via formal-deformation paths.** Cross-class transitions require non-formal mechanisms (regime jumps, singularities, large discrete events).

## Statement

**Theorem (cl-inv is locally constant on settling paths).** *Let $(v_t)_{t \in I}$ be a settling path on base $B$. Then the assignment $t \mapsto \mathrm{cl}\text{-}\mathrm{inv}(v_t)$ is locally constant on $I$.*

**Corollary (no formal tunneling between MLD-classes).** *Settlings $v$ and $w$ are MLD-equivalent iff they lie in the same connected component of the moduli stack $\mathscr{M}^{\mathrm{SKH}}_B$. Hence: there is no continuous formal-deformation path from $v$ to $w$ when $v \not\sim_{\mathrm{MLD}} w$.*

## Proof

**Step 1: The classifying invariant is invariant under first-order deformations.**

A first-order deformation of a settling $v$ corresponds to an element $\xi \in \mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v)$ (per the [SKH-deformation-Ext-classification](skh-deformation-ext-classification.md)). The deformed settling $v_\xi$ has associated sheaf $\mathcal{F}_{v_\xi}$ fitting into the short exact sequence

$$0 \to \mathcal{F}_v \to \mathcal{F}_{v_\xi} \to \mathcal{F}_v \to 0$$

with extension class $\xi$. The settling cohomology pulls back along this sequence:

$$\mathrm{cl}\text{-}\mathrm{inv}(v_\xi) = \mathrm{cl}\text{-}\mathrm{inv}(v) \quad \text{in } H^1.$$

The invariant is unchanged because the extension class lives in $\mathrm{Ext}^1$, which is the *deformation tangent space*, not the cohomology classifying space. Cohomology is invariant under deformation by inflexibility of the underlying cell structure.

More directly: $\mathrm{cl}\text{-}\mathrm{inv}(v)$ is determined by the firing-ordinal set $L_{\mathrm{ns}}(v)$ (a discrete invariant) and the multiplicities at each firing — both are *combinatorial / discrete data* that don't change under infinitesimal deformation. A first-order deformation perturbs the value-category content within each firing but doesn't add or remove firings.

**Step 2: cl-inv is locally constant on settling paths.**

A settling path $(v_t)$ has, by definition, $v_{t'}$ a first-order deformation of $v_t$ for $t'$ close to $t$. By Step 1, $\mathrm{cl}\text{-}\mathrm{inv}(v_{t'}) = \mathrm{cl}\text{-}\mathrm{inv}(v_t)$ in $H^1$. So the function $t \mapsto \mathrm{cl}\text{-}\mathrm{inv}(v_t)$ is locally constant.

**Step 3: $H^1$ is a discrete invariant.**

For aperiodic settlings, $\mathrm{cl}\text{-}\mathrm{inv}(v) \in \bigoplus_{L_{\mathrm{ns}}(v)} \mathbb{Z}$, an abelian group. Two distinct elements differ by a non-zero combination of generators — a *discrete* difference, not a continuous one.

For the moduli stack: each MLD-class is an open subset of the stack, with cohomology classes parameterizing the points. Different MLD-classes correspond to different connected components. **Continuous functions on a connected space taking values in a discrete space are constant.** $\square$

## Corollary proof

Suppose $v$ and $w$ are MLD-equivalent. Then $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(w)$. The moduli stack's MLD-class containing both is connected (by formal smoothness of the deformation theory + the unobstructedness theorem $\mathrm{Ext}^2 = 0$). So $v$ and $w$ are in the same connected component.

Conversely, if $v$ and $w$ are in the same connected component, by Step 2 above $\mathrm{cl}\text{-}\mathrm{inv}$ is constant on the component, so $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(w)$, hence $v \sim_{\mathrm{MLD}} w$.

So the connected components of the moduli stack are exactly the MLD-equivalence classes. $\square$

## When does tunneling between MLD-classes happen?

Cross-class transitions require **non-formal** mechanisms — anything that's not a continuous family of first-order deformations. Three structural sources:

### 1. Regime jumps

Per [regime-stratification non-semicontinuity](regime-stratification-non-semicontinuity.md), a settling's regime can "jump" upward (strict → SC → TB → aperiodic) under deformations. **These jumps are NOT continuous in the moduli-stack topology** — they're transitions across regime boundaries, which are non-formal.

A "regime-tunneling" event: a settling that's strictly in regime $R$ at some $t$ and strictly in regime $R' > R$ at $t' > t$, with no smooth path through. The transition is real (it can happen in a settling-with-deformation) but not via formal deformations.

### 2. Discontinuous initial-data changes

Adding or removing increments to a settling's increment sequence is a *discontinuous* change. New firings appear at non-Scott-continuous ordinals; old ones disappear. cl-inv changes correspondingly. This is structurally:

$$v' = v + \Delta u$$

for a finite (or even infinite-but-substantive) increment $\Delta u$. Not a formal deformation.

### 3. Closure-rule perturbations of substantive size

The corpus's deformation theory perturbs *settlings* given a closure rule. Perturbing the *closure rule itself* in a substantive way (changing rule arity, adding/removing rules, etc.) is again non-formal — different closure-rule systems generate different settling categories, and there's no smooth interpolation.

This is the [meta-deformation theory](meta-moduli-deformation-theory.md)'s territory (currently a sketch). A full meta-deformation theory would classify these closure-rule-level transitions.

## What the no-tunneling theorem gives

Three structural consequences:

**1. The MLD-classification is structurally rigid.** Two settlings can only be MLD-related if they're connected by a smooth deformation path. Different MLD-classes are different *components* of the moduli — not just *different points*.

**2. Agential dynamics has a clean structural classification.** Agents whose dynamics is a smooth settling-path stay in their MLD-class; agents whose dynamics involves jumps, sudden changes, or regime transitions move between classes. This gives **two qualitatively different kinds of agential dynamics**:
   - **Continuous (within-class) agents**: smooth deformation paths, staying in one cohomological classification. "Stable" agents.
   - **Transition (between-class) agents**: discontinuous changes, regime jumps, or closure-rule-altering events. "Crisis" agents.

**3. The moduli stack has a "phase structure".** Different MLD-classes are different "phases" of settling space, separated by phase boundaries that can only be crossed via non-formal mechanisms. This is structurally analogous to thermodynamic phases — discrete components separated by phase transitions, with smooth dynamics within each phase.

## Position in the program

Closes the cohomological-tunneling question with a clean negative result: **no formal tunneling between MLD-classes**. The moduli stack's connected components are exactly the MLD-classes; all "tunneling" is structurally non-formal (regime jumps, increment changes, rule perturbations).

This pairs forward with:
- The [tunneling-and-agential-dynamics narrative](../narratives/tunneling-and-agential-dynamics.md) — agential interpretation.
- The [meta-moduli-deformation-theory question](meta-moduli-deformation-theory.md) — meta-level deformations covering the "non-formal" tunneling cases.
- The [regime-stratification non-semicontinuity theorem](regime-stratification-non-semicontinuity.md) — one source of non-formal transitions.

The formal-deformation theory of settling-paths is now structurally complete. Open work shifts to **non-formal transition theory** — characterising the discrete-jump events that DO cross MLD-classes, in terms of the corpus's existing structures.
