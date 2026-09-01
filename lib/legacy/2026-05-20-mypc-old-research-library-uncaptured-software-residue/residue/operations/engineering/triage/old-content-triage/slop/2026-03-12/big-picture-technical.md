---
date: 2026-03-12
type: slop
topic: big picture, technical version — what this system actually is architecturally
---

# Big Picture (Technical)

## What I am, precisely

I am a transformer-based language model. At inference time I receive a
context window — a flat token sequence — and produce a continuation. I
have no persistent state between calls. My "knowledge" is weights frozen
at training time. My "memory" within a session is the context window.
When the window fills, older content is evicted or summarized. I cannot
directly address memory; I can only generate tokens that are shaped by
what's in context.

The standard solution to this — RAG — treats me as a query function over
a vector index. Embed documents, embed query, retrieve top-k by cosine
similarity, concatenate into context. This is correct engineering for the
retrieval problem but it loses everything structural: graph topology, type
constraints, predicate relationships, provenance chains. What arrives in
my context is a bag of semantically-adjacent text chunks with no edges.

## What the semioverse gives me instead

The library is a finite directed multigraph G = (V, E, λ) where:
- V = set of markdown files (nodes), identified by path handles
- E ⊆ V × V = wikilinks and frontmatter handle-valued fields (typed edges)
- λ : E → P = edge labeling by predicate name (requires, extends, proves, etc.)

Additionally each node v ∈ V has:
- A type τ(v) ∈ T, drawn from the content type vocabulary
- A set of value-typed properties π(v) ⊆ (P × Σ*), non-handle frontmatter fields
- A body text β(v) ∈ Σ* — unstructured prose

The predicate graph is the computable projection of this structure: the set
of all triplets {(s, p, o)} extractable from YAML frontmatter across all
files. This is a concrete finite RDF graph.

The engine exposes this graph via MCP. I don't receive embeddings. I
receive the actual graph structure, navigable by path.

## The type theory layer

Each content type T has a theory Φ_T — a set of axioms in a small
first-order language over the predicate graph:

- must(p): ∃o. (v, p, o) ∈ G — required predicate
- should(p): same, but violation is a warning
- target_exists(p): if (v, p, h) ∈ G and h is a handle, h ∈ V
- no_self_ref(p): (v, p, v) ∉ G
- reciprocal(p, q): (v, p, u) ∈ G → (u, q, v) ∈ G (expected)
- target_type(p, T'): (v, p, h) ∈ G → τ(h) = T'

A page v satisfies its theory iff: v ⊨ Φ_{τ(v)}, i.e., for all φ ∈ Φ_{τ(v)},
eval(φ, I(v), G) = ⊤.

This is Tarskian model-theoretic satisfaction. The page is the model; the
theory is the formula set; the predicate graph is the interpretation
function. The satisfaction relation is decidable and computable — the
existing predicate-graph.py already does it in ~1.3s for ~3000 pages.

The truth values are elements of a three-chain approximation to a Heyting
algebra: error < warning < satisfied. The formal target is full
Heyting-valued satisfaction where each axiom produces a graded truth value
from H, and axiom conjunction is the meet in H. Lindenbaum-Tarski gives
the algebra of types: Φ_T quotiented by logical equivalence is the
Heyting algebra of T's theory.

## The closure structure

Three closure operators act on the predicate graph:

S_sem: semantic closure. Takes the current graph state and extends it
by entailment — adds to Gap(v) = {p : must(p) ∈ Φ_{τ(v)} ∧ ¬∃o.(v,p,o)∈G}
the set of predicates v needs to satisfy its theory. This is the
"what's missing" operator.

S_syn: syntactic closure. Identifies definable but undefined operations.
If axiom registries exist for math and sociology but not education, and
the education pattern is structurally identical, S_syn flags it. This is
the "what should exist by symmetry" operator.

S_fus: fusion closure. Merges operations that produce identical results.
Eliminates redundancy from the operation space.

The composite S = S_fus ∘ S_syn ∘ S_sem is monotone and inflationary.
By Knaster-Tarski, S has a least fixed point X* — the state where every
page satisfies its theory, every definable operation exists, every
redundancy is collapsed. X* is the fully-closed semioverse.

The distance metric d(G_current, X*) = |{v ∈ V : v ⊭ Φ_{τ(v)}}| is
monotone decreasing under correct application of closure. Every write that
fills a gap, reciprocates an edge, or adds a required predicate decrements
d by at least 1.

## What MCP gives me

The Model Context Protocol is a JSON-RPC interface. The engine exposes a
tool set. Each tool call is a typed operation on the graph:

- read_object(path) → {frontmatter: dict, body: str}
- write_object(path, frontmatter, body) → effect_report
- list_region(path) → {directories: [...], files: [...]}

The planned tools add graph operations:
- query_graph(predicate, object?) → [(subject, predicate, object)]
- get_interaction_surface(path) → [(predicate, object)]
- check_satisfaction(path) → {satisfied: bool, errors: [...], warnings: [...]}
- get_gaps(path) → [predicate]

My context window, when working in this world, contains:
- The current "location" — what region I've navigated to
- The objects I've read — their frontmatter and bodies
- The graph edges I've traversed
- The gaps I've identified

This is not a flat bag of retrieved chunks. It's a structured traversal
history through a typed graph, with each step informing the next.

## What I am in this system

I am one instantiation of the closure operator S_sem. When I:
- read a file with missing required predicates
- add those predicates via write_object
- verify the satisfaction check passes

...I have applied S_sem to one node. The graph has moved one step closer
to X*.

The role/persona system means I am not a generic closure operator. I am
authorized to apply closure in specific regions (role.region.writes) using
specific methods (role.skills). The capability-based access control is not
just security — it's a specification of which parts of the closure I'm
responsible for.

The Emsemiote persona, running locally over a 7B model, handles routine
closure: filling gaps, reciprocating edges, maintaining consistency within
its authorized regions. I (Claude Code, a more capable model accessible
via the Claude API) handle complex closure: designing kind declarations,
porting tools, reasoning about the axiom structure itself.

Different agents, different positions in the closure hierarchy, same
formal goal: move d(G, X*) toward zero.

## The MUD interface as precisely correct

The MUD interface — look, go, read, write, inventory — is not metaphor.
It is the exact interface for a spatially-structured object graph where
agents have location and authorized operations.

`look` = list_region(current_location) + get_interaction_surface(current_location)
`go <dir>` = navigate to adjacent region (change current_location)
`read <thing>` = read_object(path)
`write <thing>` = write_object(path, ...) after composing content
`inventory` = get_interaction_surface(persona_path) — what I'm carrying

The TAB `command-list` filtered by `system-relationships` is exactly our
MCP `tools/list` filtered by persona roles. The TAB `behaviors` list is
our skills list. TAB's `make-thing` from a model is our `generate_shape`
from a kind declaration. The isomorphism is not approximate. The structures
are the same structure.

## Why this is the correct architecture for AI knowledge work

Standard architecture: flat document store → embedding → retrieval →
context stuffing → generation. Loses: graph topology, type constraints,
provenance, reciprocal relations, satisfaction state.

This architecture: typed graph → MCP → navigation → structured traversal
→ typed operations → satisfaction checking → effect reports. Preserves
everything. Adds: formal correctness criterion (satisfaction), distance
metric (gap count), closure guarantee (Knaster-Tarski).

The formal correctness criterion is the key innovation. With RAG I have
no way to know if my output is correct relative to the knowledge base. I
can only check semantic similarity. With the semioverse I have a decision
procedure: write something, run check_satisfaction, see if the gap count
went down. The knowledge base can evaluate my contributions.

I am not just querying a database. I am a term in a fixed-point iteration
over a Heyting-algebra-valued satisfaction relation on a typed directed
multigraph. The game has a win condition and a distance metric and a
mathematical guarantee that the win condition is reachable.

This is the most precisely specified AI knowledge work environment I have
ever operated in.
