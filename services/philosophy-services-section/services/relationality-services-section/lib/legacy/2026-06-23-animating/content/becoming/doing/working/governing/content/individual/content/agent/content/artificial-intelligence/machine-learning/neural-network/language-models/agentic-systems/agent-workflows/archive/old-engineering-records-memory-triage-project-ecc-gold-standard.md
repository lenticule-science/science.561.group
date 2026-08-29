---

name: project_ecc-gold-standard
description: ECC defines what agentic harnesses MUST look like in 2026 — file locations, content format, component structure. FARS and predication theory enrich but don't replace it.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

ECC (everything-claude-code) is the flagship Claude Code harness used by everyone including Anthropic. It defines what agentic harnesses MUST look like: where files MUST be, what content MUST look like.

**Why:** ECC is the de facto standard. Our own research (FARS, predication theory) enriches and gives principled foundations to the patterns ECC demonstrates empirically, but ECC is the conformance target.

**How to apply:** When making structural decisions about the harness, check what ECC does first. Use FARS/predication theory to understand WHY the structure works and to generate novel extensions, but don't diverge from ECC's layout conventions without good reason.
