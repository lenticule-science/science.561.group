"""Per-theorem Python modules mirroring `theorems/` markdown notes.

Each module corresponds to one `theorems/X.md` note in the corpus and contains
the computational verifications of that theorem's claims (concrete instances,
empirical-verification tables, etc.). Functions are named `test_*` so pytest
discovers them, decorated with `@verifies` / `@example_of` to register the link.
"""
