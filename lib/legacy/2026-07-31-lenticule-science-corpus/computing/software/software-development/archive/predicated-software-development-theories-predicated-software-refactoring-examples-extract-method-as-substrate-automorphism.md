---
type: example
class: math-side
status: draft
depends-on: [extract, refactor-as-invisible-automorphism, codebase-cell-system]
---

# Extract method as substrate automorphism

Worked instance: extract a region of $f$ into a new function $g$, classified as a refactoring under a public-API witness language.

## Setup

Codebase $v^{\mathrm{code}}$ with entities:

- A function $f$ in module $m$ with body containing a region $R$ — a sequence of statements with input variables $X$ and output variables $Y$.
- The set of cells $C_R$ encoding $R$ inside $f$.
- A test $t$ comparing $f$'s return value to expected output.

Witness language $W = W^{\mathrm{public-api}}$ tracking: test-passes cells, public-import cells (which downstream packages import which symbols), and the public type signature of $f$. Critically, $W$ does *not* track the *implementation* of $f$ — only its contract.

## The transformation

The extract has three components:

1. **$\pi_\Pi$** — predicate-extension introducing a fresh predicate `is-extracted-from-region` and the function-signature predicate for $g$ (parameters $X$, return $Y$).
2. **Entity introduction** — a fresh entity $g \in E_{\mathrm{code}}$, previously permanently $\bot$ in $v^{\mathrm{code}}$.
3. **Cell-position relabeling** — the cells $C_R$ inside $f$ are relabeled to be cells inside $g$, and a single new cell `references` from $f$ to $g$ at the call site is introduced.

## Classification

The cells touched are:

- The newly-introduced cells encoding $g$ (previously $\bot$) — fresh designations.
- The cells in $C_R$ that move from `body-of-$f$` to `body-of-$g$` — their position changes.
- The cell `references` from $f$ to $g$ — fresh.

None of these are in $W^{\mathrm{public-api}}$, because $W^{\mathrm{public-api}}$ tracks only $f$'s contract, not its implementation. The witness cell $\langle t, \texttt{passes-on}, f\rangle$ remains true: $f$ still produces the same return value (it now does so by calling $g$). The public-import cells are unchanged: $g$ is private (not exported), so no downstream cell references it; $f$'s spelling and signature are unchanged.

By [refactor-as-invisible-automorphism](../theorems/refactor-as-invisible-automorphism.md), the extract is in $N_{W^{\mathrm{public-api}}}(v^{\mathrm{code}})$ and is therefore a refactoring under $W^{\mathrm{public-api}}$.

## Crossing to a richer witness language

Under a witness language $W^{\mathrm{stack-trace}}$ that tracks the function names appearing in stack traces produced by $f$ — relevant when stack traces are part of the project's public observable behavior — the extract *is* visible: a new function name appears in stack traces. Under $W^{\mathrm{stack-trace}}$, the extract is a substantive change.

This is exactly the disciplinary phenomenon that "extract method is safe unless someone is screen-scraping our error messages." The substrate makes the relativity precise: the extract is in $N_{W^{\mathrm{public-api}}}$ and not in $N_{W^{\mathrm{stack-trace}}}$.

## Where used

- [refactor-as-invisible-automorphism](../theorems/refactor-as-invisible-automorphism.md), [extract](../morphisms/extract.md).
