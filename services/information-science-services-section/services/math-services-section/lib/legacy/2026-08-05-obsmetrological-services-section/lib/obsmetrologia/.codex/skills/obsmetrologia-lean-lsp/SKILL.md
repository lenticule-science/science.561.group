---
name: obsmetrologia-lean-lsp
description: Use for every Obsmetrologia Lean task: proof edits, diagnostics, declaration lookup, theorem citation checks, Blueprint/Verso Lean alignment, tactic trials, and axiom audits.
---

# Obsmetrologia Lean LSP

This package is a Lean 4 project. Do Lean work through the
`obsmetrologia-lean-lsp` MCP server first, not through shell guessing.

## Project Root

- Package root: `/home/emsenn/info/lib/emsenn/src/lib/obsmetrologia`.
- Source paths passed to LSP tools are package-root-relative, for example
  `Obsmetrologia/Primitive.lean`.
- From this directory, `pnpm run lean:mcp` starts the same server manually.

## Tool Map

Use the LSP for the per-edit loop:

- `lean_diagnostic_messages`: file errors and warnings.
- `lean_term_goal`: proof state or expected type at line/column.
- `lean_multi_attempt`: try tactics without modifying the file.
- `lean_local_search`: verify a declaration exists before using its name.
- `lean_hover_info`: signature and docstring for an identifier.
- `lean_file_outline`: imports and declarations in a file.
- `lean_run_code`: import modules and run `#print axioms <decl>` for axiom
  audits.

Use shell only for package-level procedures: `make doctor`, `make build`,
`make check`, and package audit scripts.

## Workflow

1. Read `AGENTS.md`, then the relevant section of `CLAUDE.md`.
2. Identify the owning corpus/Blueprint/Verso node before changing a proof.
3. Use LSP lookup/outline/hover before citing or editing declarations.
4. After edits, check the touched file with `lean_diagnostic_messages`.
5. Use `lean_run_code` with `#print axioms` before calling a theorem exported
   or Blueprint-green.
6. Run `make check` only when the proof change is integrated enough to need
   the package gate.
