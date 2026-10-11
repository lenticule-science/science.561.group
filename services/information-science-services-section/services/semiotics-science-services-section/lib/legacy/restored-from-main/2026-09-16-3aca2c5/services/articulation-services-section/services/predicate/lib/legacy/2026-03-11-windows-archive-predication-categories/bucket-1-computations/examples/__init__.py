"""Per-example Python modules mirroring `examples/` markdown notes.

Each module corresponds to one `examples/X.md` note in the corpus and contains
the computational verifications of that example's claims. Functions are
decorated with `link.verifies(...)` to register the link, and named `test_*`
so pytest discovers them.
"""
