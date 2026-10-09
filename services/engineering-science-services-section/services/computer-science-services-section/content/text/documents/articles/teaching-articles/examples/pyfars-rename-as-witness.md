---
type: example
class: code-side
status: draft
depends-on: [rename, refactor-as-invisible-automorphism, codebase-cell-system]
title: pyfars rename as witness
description: Worked code-side instance — the second of Stage 5's two layers of examples.
---

# pyfars rename as witness

Worked code-side instance — the second of [Stage 5's two layers of examples](../../../../prose/orientations/_index.md). The math-side counterpart is [private-rename-as-cosmetic](private-rename-as-cosmetic.md); this is the same transformation, run on the actual [pyfars](https://github.com/emsenn/pyfars) codebase that realizes the substrate.

## Concrete transformation

In the pyfars codebase, suppose we rename a local variable in a parser function:

```python
def parse_cell(text: str) -> Cell:
    parts = text.split("|")     # rename `parts` to `tokens`
    subject = parts[0].strip()
    predicate = parts[1].strip()
    object_ = parts[2].strip()
    return Cell(subject, predicate, object_)
```

After:

```python
def parse_cell(text: str) -> Cell:
    tokens = text.split("|")
    subject = tokens[0].strip()
    predicate = tokens[1].strip()
    object_ = tokens[2].strip()
    return Cell(subject, predicate, object_)
```

## Classification

Witness language: the pyfars test suite (`pytest`), its mypy type-check pass, and its export surface (`__all__` declarations).

The transformation touches:

- The local variable binding inside `parse_cell` — entity `parts@parse_cell` becomes entity `tokens@parse_cell`.
- Three `references` cells inside `parse_cell`'s body.

None of these are designated cells under the witness language: pytest never sees `parts`; mypy's check passes regardless of the variable's spelling; `__all__` doesn't list local variables. The witness cell $\langle \texttt{test\_parse\_cell}, \texttt{passes-on}, \texttt{parse\_cell}\rangle$ is unchanged.

The transformation is in $N_W(v^{\mathrm{pyfars}})$ — a refactoring under the project's witness language — by [refactor-as-invisible-automorphism](../../../../glossary/concepts/refactor-as-invisible-automorphism.md).

## Why two layers

The math-side example proves the *substrate-algebraic* fact: the cell-permutation lies in the invisible subgroup. The code-side example confirms the substrate-algebraic fact is *implementable*: the actual transformation in the actual codebase produces the cell-permutation the math describes, the actual test runner does not detect it, the actual mypy pass does not detect it. Both layers are needed for the theory to be load-bearing — math without code is decorative; code without math is unprincipled. Together they form the Stage 5 (ME) discipline.

## Where used

- [refactor-as-invisible-automorphism](../../../../glossary/concepts/refactor-as-invisible-automorphism.md) — code-side confirmation of the central theorem.
- [private-rename-as-cosmetic](private-rename-as-cosmetic.md) — math-side counterpart.
