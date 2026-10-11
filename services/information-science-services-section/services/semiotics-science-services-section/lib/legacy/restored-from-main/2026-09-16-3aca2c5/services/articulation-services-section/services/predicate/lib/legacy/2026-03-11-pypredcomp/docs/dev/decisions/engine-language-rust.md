---
title: "Engine languages: Python first, then Rust"
description: "The substrate has two canonical implementations: Python first (using PydanticAI, LangGraph, common tooling) for proof-of-software; Rust second for the robust/firm version. Both pass the same conformance vectors."
kind: decision
status: accepted
---


**Decision.** The substrate has **two canonical implementations**:

1. **Python (primary, v0.1 → v0.x).** Built on PydanticAI, LangGraph, FastAPI, pydantic, asyncio, cryptography, and the MCP Python SDK.
  This is the implementation the agent writes first and where v0.1 → ~v0.4-or-v0.5 ship from.
  It demonstrates the substrate works using common tooling in a common language.
2. **Rust (hardened, v0.x → v1.0).** Ports forward from the Python version once the design is proven.
  The existing [`mash-engine`](../../../../../../../../operations/engineering/services/mash/) crate already implements the bilattice algebra and is the starting point for the Rust engine.
  Rust takes over for the robust/firm version: performance, memory discipline, security boundary.

Both implementations:

- Pass the same conformance vectors byte-identically.
- Speak the same wire formats (canonical JSON, JSONL event log, MCP, federation protocol).
- Bind the same network protocols (citing the same RFCs).
- Implement the same OS subsystem specs.

**Why two implementations.**

1. **Language-vs-theory separation.** Two canonical implementations expose where the OS is leaning on language features vs. expressing predicated-computing theory.
  If a feature only works in Python because of duck typing or only works in Rust because of zero-cost abstractions, the design is wrong; the algebra is the same in both.
2. **Faster v0.1.** PydanticAI + LangGraph let us build the substrate kernel, MCP surface, and HTTP server quickly using mature, documented libraries.
  Rust forces us to write more before anything runs.
  Python first means v0.1 ships sooner.
3. **The captain has working Rust code already.** `mash-engine`'s algebra implementation is correct and tested; that becomes the seed for the eventual Rust port, not the bottleneck for v0.1.
4. **Two-implementation discipline catches bugs.** A bug that only reproduces in one language is a hint that the spec or the conformance vectors are incomplete.

**Per-language guidance** lives in [implementation/python.md](../implementation/python.md) and [implementation/rust.md](../implementation/rust.md).

**What this rules out.**

- Mixed-language engine where parts of one substrate instance run in different runtimes.
  (One instance is one language.)
- Skipping Python and going straight to Rust at v0.1.
- Treating Rust as "the real implementation" and Python as "throwaway."
  Both are canonical; both pass the conformance suite; one is forced before the other only by sequencing.
- Embedding a non-Python, non-Rust runtime that owns substrate state at v0.x.

**What this does not constrain.**

- Higher layers MAY use other languages.
  Interfacers (Matrix homeserver, hledger bridge, MQTT, HTTP-API frontends) may be in any language with a clean wire to the engine.
- Closure rules and substrate entities are JSON; they are language-agnostic.
- Tooling (CLI scripts, monograph builders, web frontends) may be written in Python, Node, Rust, Lua, or whatever serves.
- Guile / Scheme is explicitly preserved as an aspirational composition layer: see [deployment-via-guix-preferred-nix-acceptable.md](deployment-via-guix-preferred-nix-acceptable.md).
  The eventual setup may be Guix-with-Nix-inside as the deployment image.

**Note on the Guile aspiration.** The captain's long-term aspiration: "Rust for the engine, Guile for the composition layer, Guix-containing-Nix for the deployment image."
The current Python-then-Rust sequence is correct; adding a Guile layer above is a future direction, not a deviation.

**Note on the file name.** This decision is filed at `engine-language-rust.md` for git-history continuity.
The content has evolved; the filename is preserved.
