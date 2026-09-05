# Relationality Specification Toolkit

This repository contains the source specification (`on-relationality.md`) for
the Relational Expression Syntax (RES) and a small toolchain for extracting and
evaluating the RES snippets embedded in the prose.

## Files

- `on-relationality.md` – the canonical specification written in Markdown.
- `build_res_tree.py` – scans the spec, extracts RES code blocks, and writes:
  - `relationality.res`: raw RES snippets suitable for feeding into interpreters.
  - `relationality.json`: a JSON AST describing the same snippets.
- `res_parser.py` – tokenizer and parser for RES S-expressions.
- `res_interpreter.py` – simple interpreter that binds the primitive heads
  (`Relationlessness`, `Reflex`) and executes the extracted RES program,
  logging every binding/execution to `res_interpreter.log`.

## Usage

1. Update the spec as needed.
2. Run `python3 build_res_tree.py` to regenerate `relationality.res`/`.json`.
3. Validate or execute the RES program:

   ```bash
   python3 res_interpreter.py --validate relationality.res
   # or
   python3 res_interpreter.py relationality.res
   ```

4. Inspect `res_interpreter.log` for a chronological account of bindings and
   executions.

This toolchain ensures every RES snippet in the spec is syntactically valid,
only references earned symbols, and can be consumed programmatically.
