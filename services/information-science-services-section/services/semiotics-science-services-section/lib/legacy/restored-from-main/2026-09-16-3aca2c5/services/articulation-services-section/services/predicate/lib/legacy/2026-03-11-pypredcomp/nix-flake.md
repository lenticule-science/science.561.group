---
kind: tool-flake-contribution
title: "pypredcomp contributions to a parent polity's Nix flake"
description: "What pypredcomp contributes when consumed as a flake input by a parent polity. Schema defined in the polity's `governance/assets/computing/nix-flake.md` (section 13)."

contributes-shell-packages:
  source: "this tool's flake `devShells.${system}.default.nativeBuildInputs`"
  notes: "Auto-merged by the parent harness when a polity task-shell lists `pypredcomp` in `tool-shell-merge`. Provides python313 + fastapi + langgraph + pytest + ruff + the standard pypredcomp runtime stack."

contributes-apps:
  - { slug: substrate,     description: "boot the predicated-computing substrate" }
  - { slug: substrate-mcp, description: "expose the substrate via MCP" }
  notes: "These are exposed in pypredcomp's own flake as `apps.substrate` and `apps.substrate-mcp`. A consuming polity may choose to namespace them (e.g., `pypredcomp-substrate`) when emitting at the parent level."

contributes-extra-inputs: []
contributes-nixos-modules: []

---

# pypredcomp — flake contributions

Contribution declaration for pypredcomp into a parent polity's Nix flake.
Today the parent harness merges pypredcomp's devShell packages automatically; this file is the place to declare any explicit contributions (apps, modules, extra inputs) that go beyond the implicit merge.

See the polity's `governance/assets/computing/nix-flake.md` for the schema and the harness migration status.
