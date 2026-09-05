---
description: An independently purchasable, atomic capability whose manifest is a mathematical object — a hash-fixed CellId over SKU, capability law, and sovereign controller, with per-face identity binding — never a script with a schema attached or a bundle of capabilities absorbed into a parent.
identity: capability-cell
name: Capability Cell
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/content/text/documents/articles/notes/2026/07/25/2026-07-25-capcell-the-ap-evm-standard-for-agentic-orchestration.md
---
A Capability Cell is not a script with a schema attached, a package with aspirations, or a bundle of unrelated capabilities: it realizes exactly one independently purchasable capability. Its manifest is a mathematical object rather than free-form metadata: a cell's identity, CellId(s, ℓ, κ), is an injective-in-practice hash of its SKU identity, its capability-law identity, and its sovereign controller, so two cells share an identity only if they share all three coordinates exactly, and a cell does not reincarnate merely because its address changes — manifest revision is a section over CellId, not a coordinate of it. Per-face identity binding requires that every face a caller depends on (a web endpoint, an A2A card, a registered chain identity) be independently verified to bind to that one manifest identity, not merely link to it.

This distinguishes a Capability Cell from an ordinary package or microservice: an ordinary package can be renamed, forked, or re-hosted without changing what depends on it structurally, while a cell's identity is fixed by law and controller and is indifferent to hostname, and a manifest revision or offer update is admissible by construction while patching the executable underneath is not admissible at all — it has no type in the cell's exposed binding-site set to land in.

The consequence for orchestration: a cell that needs another capability (A2A, ActivityPub, git hosting, witnessing) binds an independently advertised provider from the same market rather than importing that provider's implementation into its own process, because absorbing a capability into a parent removes the atomicity that let it be hired, mounted, or released on its own.
