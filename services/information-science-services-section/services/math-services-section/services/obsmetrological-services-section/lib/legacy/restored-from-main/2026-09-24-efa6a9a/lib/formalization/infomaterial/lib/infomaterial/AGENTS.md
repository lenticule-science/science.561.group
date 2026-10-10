# Infomaterial Lean Agent Instructions

This directory is the active Lean 4 project root for Infomaterial.
Read this file before Lean proof work here, then read `CLAUDE.md` for the full mathematical and house-style orientation.

## Tooling Contract

- Prefer the `infomaterial-lean-lsp` MCP server for Lean work.
- Do not use shell builds, `rg`, or full-file reads for things the Lean LSP can answer directly.
- The MCP server is configured in both repo-local Codex config and VS Code MCP config:
  - `/home/emsenn/info/.codex/config.toml`
  - `/home/emsenn/info/.vscode/mcp.json`
- Server command: `uvx lean-lsp-mcp --lean-project-path sites/infomaterial.emsenn.net/Infomaterial`.
- From this package root, `pnpm run lean:mcp` starts the same MCP server.

## Lean Work Loop

- File errors and warnings: use `lean_diagnostic_messages`.
- Proof state at a line/column: use `lean_goal`.
- Try tactics without editing: use `lean_multi_attempt`.
- Declaration signatures/docstrings: use `lean_hover_info`.
- File/module structure: use `lean_file_outline`.
- Local declarations by name: use `lean_local_search`.
- Axiom audit for a declaration: use `lean_verify`.

Use shell commands for whole-project procedures only:

- `make doctor` verifies local Lean tooling.
- `make build` builds the library.
- `make check` builds and runs the local naming gate.
- `pnpm run lean:check:primitive` checks `Infomaterial/Primitive.lean`.

## Proof Discipline

- No new primitives except where already allowed by the full orientation in `CLAUDE.md`.
- Do not weaken a real claim just to get a proof through.
- If a frontier claim cannot be proved yet, state it honestly with an explicit hypothesis or an open proof marker; do not make prose overclaim a trivial Lean statement.
- Exported or blueprint-green results must be `sorry`-free and axiom-clean under `lean_verify`.

## Project Shape

- `Infomaterial.lean` is the root import file and controls dependency order.
- `Infomaterial/*.lean` contains the active modules.
- `docs/blueprint` tracks the formal frontier and proved/open claim graph.
- `_archive/` is reference material only; it is not part of the active build.

