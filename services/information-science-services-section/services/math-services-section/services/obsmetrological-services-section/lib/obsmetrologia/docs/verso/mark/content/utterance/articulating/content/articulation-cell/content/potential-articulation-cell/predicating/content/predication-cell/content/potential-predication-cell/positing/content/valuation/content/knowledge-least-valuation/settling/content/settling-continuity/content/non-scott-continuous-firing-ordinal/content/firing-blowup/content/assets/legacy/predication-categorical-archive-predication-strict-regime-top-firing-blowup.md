---
type: example
status: worked
depends-on: [firing-blowup, blowup-classification, strict-regime-top-firing-verdier-self-dual, four-bilattice, d-frame-verdier-composition]
see-also: [firing-blowup, blowup-classification, closure-flow-curvature-regime-correspondence, non-scott-continuous-firing-ordinal]
---

# Blowup of the strict-regime ⊤-firing

This worked example computes the [firing blowup](teaching/explanations/firing-blowup.md) explicitly for the canonical strict-regime $\top$-firing example already in the corpus, identifying its local triple and atomic type per the [blowup classification theorem](../theorems/blowup-classification.md). The example illustrates the **successor-ordinal** case of the blowup machinery — the firing here is non-trivial but is *not* a [non-Scott-continuous firing](teaching/explanations/non-scott-continuous-firing-ordinal.md) (NSC firings are limit-ordinal phenomena; this example is in the strict regime where all firings are at successor ordinals).

## Setup

Take the simplest 2-stage settling exhibiting a single non-trivial $\top$-firing (per the [strict-regime ⊤-firing Verdier-self-dual example](strict-regime-top-firing-verdier-self-dual.md)):

- **Underlying category:** $\mathcal{C}$ with a single predicate $P$ and a single subject-object pair $(s, o)$, giving one cell $c_0 := (P, s, o)$.
- **Closure operator:** $C$ with two generating closure rules — one truth-introduction rule $R_\mathrm{T}$ and one falsity-introduction rule $R_\mathrm{F}$, both firing on $c_0$ at consecutive successor ordinals.
- **Settling trajectory:** 
  - $v_0(c_0) = \bot$ (initial undefined).
  - $v_1(c_0) = \mathbf{t}$ (after $R_\mathrm{T}$ fires at stage 1).
  - $v_2(c_0) = \top$ (after $R_\mathrm{F}$ fires at stage 2 — consistency failure).
  - Settling closes at $\kappa = 2$.

The non-trivial firings are at $\mu = 1$ (truth-side firing) and $\mu = 2$ (consistency-failure firing). Both are **successor** ordinals; neither is NSC. We compute the blowup of $\mu = 2$, the consistency-failure firing.

## Computing the blowup at μ = 2

### Step 1: firing predecessor

$\mu = 2$ is a successor ordinal ($\mu = 1 + 1$), so per the [firing-blowup](teaching/explanations/firing-blowup.md) definition, the firing predecessor is the immediate predecessor:
$$v^{\to 2}(c_0) \;=\; v_1(c_0) \;=\; \mathbf{t}.$$

(No directed-colimit machinery needed — for successor ordinals, the predecessor is simply $v_{\mu-1}$.)

### Step 2: actual value at $\mu$

$$v_2(c_0) \;=\; \top.$$

### Step 3: firing morphism

$$\iota_2(c_0) \;:\; \mathbf{t} \;\xrightarrow{\;\leq_k\;}\; \top.$$

The firing morphism on $c_0$ is the bilattice knowledge-order increment $\mathbf{t} \leq_k \top$. This is *not* the identity, so $\mu = 2$ is a non-trivial firing (consistency failure adds falsity-side content to a previously-true state).

For all other cells $c \neq c_0$ (none, in this single-cell example): $\iota_2(c)$ is the identity.

### Step 4: blowup datum

$$\mathrm{Bl}_2(v) \;=\; \bigl(\mathbf{t} \xrightarrow{\leq_k} \top\bigr) \;\in\; \mathrm{Arr}(\mathbf{FOUR}).$$

(Since the underlying category has a single cell, the blowup is naturally an arrow in $\mathbf{FOUR}$ rather than in $\mathrm{Val}(\mathcal{C})$ proper. For multi-cell examples, the blowup is an arrow in $\mathrm{Val}(\mathcal{C})$, with cell-wise restriction giving arrows in $\mathbf{FOUR}$.)

## Reading the local triple

### Incidence pattern

$$\pi_2 \;=\; \{c_0\}.$$

Single-cell firing — the simplest case.

### Cell-wise firing type

$$\tau_2(c_0) \;=\; \top.$$

The cell becomes $\top$, so the cell-wise firing type is $\top$.

### Consistency-failure pattern

$$\gamma_2 \;=\; \{(c_0, \mathbf{t})\}.$$

The source state at $c_0$ is $\mathbf{t}$ (it was previously true, then acquired falsity-side content via $R_\mathrm{F}$, producing $\top$). This records the source as $\mathbf{t}$.

### Atomic type identification

Per the [blowup classification theorem](../theorems/blowup-classification.md) Part 5, single-cell non-trivial firings have one of 5 atomic types. Reading off our triple:

- Source state: $\mathbf{t}$.
- Target state: $\top$.

This matches **atomic type $\top_\mathbf{t}$**: a $\top$-firing arising from consistency failure on the truth-side.

## What this confirms

**Blowup machinery applies to successor firings.** Even though this firing is not NSC (NSC requires limit ordinals), the blowup machinery still classifies it cleanly. The atomic type $\top_\mathbf{t}$ is well-defined regardless of whether the firing is at a limit or successor ordinal.

**Verdier-self-dual structure aligns with the blowup type.** The $\top_\mathbf{t}$ atomic type is in the equivariant cohomology gauge sector $\chi_{\sim \circ -}$ (per the table in the classification theorem) when the firing is NSC. For this successor-ordinal example, the strong-MLD/gauge-sector interpretation is degenerate — the firing is in the strict regime, where the equivariant cohomology decomposition is trivial — but the *blowup type itself* ($\top_\mathbf{t}$) is the same. The Verdier-self-dual character of the example is a property of the *settling*, not of the blowup classification per se; the blowup just records the local atomic structure.

**Curvature-event interpretation (where applicable).** Per the [curvature-regime correspondence](../theorems/closure-flow-curvature-regime-correspondence.md), NSC firings contribute to $H^1$ of the settling-associated sheaf. In the strict regime, $H^1 = 0$ (no curvature in the cohomological sense) — but the local blowup data still records the local non-triviality of the firing. So this example illustrates that the blowup classification is *strictly finer* than the cohomological/curvature classification: it sees structure that the cohomology averages out.

## Generalization

Any strict-regime settling with a single non-trivial $\top$-firing arising from a truth-then-falsity sequence has a blowup of atomic type $\top_\mathbf{t}$, with the same local triple structure (modulo relabeling the cell). The blowup is fully determined by:
- The cell where the firing occurs.
- The order of the rules (truth-then-falsity gives $\top_\mathbf{t}$; falsity-then-truth gives $\top_\mathbf{f}$).

For $\top_\bot$ (firing from $\bot$ to $\top$ in one step), the example would need a closure rule that simultaneously introduces both truth-side and falsity-side content — possible in d-frame settings with explicit $\top$-introduction rules, less natural in pure truth/falsity-only rule systems.

For multi-cell strict-regime examples, the blowup decomposes as a product of the cell-wise atoms — each cell in the incidence pattern contributes one of the 5 atomic types independently, modulo bilattice-axiom and closure-rule constraints on which combinations are realizable.

For genuine NSC firings (limit ordinals), the same atomic-type machinery applies with the additional cohomological/gauge-sector interpretation active — see the [closure-flow-curvature-regime correspondence](../theorems/closure-flow-curvature-regime-correspondence.md) for the relationship.
