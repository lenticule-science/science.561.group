# TODO

## Spec

- Specify “vault” explicitly (beyond the current collection model), including how a vault is discovered and indexed.
- Add normative conformance vectors and fixture formats.

## Reference implementation (Python)

- Expand extraction to cover more CommonMark edge cases without mis-recognizing constructs inside code spans/blocks.
- Add deterministic resolution and error reporting per spec section 12/14.

## Tooling

- Add a small `smd` subcommand set (validate, extract, resolve) once the core data model stabilizes.
