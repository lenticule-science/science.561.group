# pypred

`pypred` is a small Python library for predication-native computation.

It is not the predication-categories corpus verification harness.
The corpus tools can depend on this package, but this package does not know about markdown notes, theorem passes, frontmatter, or repository-relative paths.

## What is in scope

- four-valued Belnap bilattice operations
- immutable predication cells
- finite predication stores with knowledge-order merge
- finite closure-rule systems
- finite posets, simplicial complexes, frames, d-frames, and sheaves
- substitution-matrix utilities used by the category-theory examples

## Package layout

- `pypred.core`: predication cells, stores, values, and substrate-level merge
- `pypred.category`: finite categorical primitives used by the theory

## Development

```powershell
cd operations/engineering/pypred
python -m pip install -e .
python -m pytest
```
