---
name: relational-machine

description: >
  Speculative system-level specification for the relational machine: the four-component
  architecture whose mathematical semantics is the fiber Heyting algebra system over
  the history monoid M(Σ, I).
defines: RelationalMachine
---

*Spec-domain object — speculative*

## What it is

The relational machine is a system whose mathematical semantics is determined by:

- A history monoid **M(Σ, I)**: congruence classes of Σ* under the independence
  relation I (symmetric, irreflexive). The prefix order t ≤ t' means t' has more
  history.
- A family of Heyting algebras **H_t** indexed by histories t ∈ M, with restriction
  maps ρ: H_{t'} → H_t for t ≤ t' (contravariant — a presheaf).
- Two commuting nuclei **σ_t** and **Δ_t** on each H_t — each extensive, idempotent,
  meet-preserving — whose composite π_t = σ_t ∘ Δ_t is a retraction onto
  **H\*_t = Fix(σ_t) ∩ Fix(Δ_t)**.
- A global sections functor **Γ**, computing compatible families (s_t) with
  ρ(s_{t'}) = s_t across all t ≤ t'. Output at a step is the new sections in
  Γ(H\*) not present before the step.

The machine is the implementation of this structure. It SHOULD be organized into
four components whose responsibilities correspond exactly to the four mathematical
roles above. See [relational-machine-math-diagram](relational-machine-math-diagram.md)
for the full set-level class diagram and
[relational-machine-c4-diagram](relational-machine-c4-diagram.md)
for the C4 architecture view.

---

## Four-component architecture

### Frontier

**Mathematical role:** M(Σ, I) — the history monoid.

The Frontier is the I/O membrane. It receives steps s ∈ Σ and extends the current
history t to s⋆t. It SHOULD enforce the independence relation I — concurrent
independent steps commute and MUST produce the same history class.

Conjectured interface:
- Input: a step s ∈ Σ
- Effect: current history advances from t to s⋆t
- Output: the new history t' = s⋆t

### State Store

**Mathematical role:** H_t — the fiber Heyting algebra at the current history.

The State Store holds the Heyting algebra at the current history. When the Frontier
advances the history, the State Store loads the fiber at the new history. The settled
sub-algebra H\*_t = Im(π_t) is the portion whose truth value is stable.

Conjectured interface:
- Holds: H_t (full fiber) and H\*_t (settled sub-algebra, derived from H_t by the Kernel)
- Exposes restriction maps ρ: H_{t'} → H_t when queried across histories

### Normalization Kernel

**Mathematical role:** π_t = σ_t ∘ Δ_t — the composite retraction.

The Normalization Kernel applies the composite retraction to H_t, producing H\*_t.
The commutativity σ_t ∘ Δ_t = Δ_t ∘ σ_t guarantees the same fixed point regardless
of pass order — only convergence behavior may differ.

Conjectured interface:
- Input: H_t from the State Store
- Output: H\*_t = Im(π_t) written back to the State Store

Open: whether the Kernel runs one composite pass or iterates each nucleus separately
to fixpoint. Commutativity guarantees the same fixpoint; the convergence rate is
an open question.

### Observation Layer

**Mathematical role:** Γ — the global sections functor.

The Observation Layer computes Γ(H\*) — the set of compatible families of sections
across all histories — and emits the newly settled sections after each step:
Γ(H\*_{t'}) ∖ Γ(H\*_t).

Conjectured interface:
- Input: H\*_t from the State Store
- Output: newly settled sections (the output of the machine at step s)

---

## Correspondence table

| Math object | Component | Role |
|---|---|---|
| M(Σ, I) — history monoid | Frontier | Receives steps, advances history |
| H_t — fiber Heyting algebra | State Store | Holds truth at current history |
| π_t = σ∘Δ — retraction | Normalization Kernel | Settles H_t to H\*_t |
| Γ — global sections | Observation Layer | Emits newly settled compatible families |

---

## Peer connection

Two relational machines MAY be connected by a structure-preserving map between their
fiber systems — conjecturally a geometric morphism. Such a connection would allow
distributed machines to synchronize histories and share settled sections.

This is unformalized: the correct category of morphisms between fiber Heyting algebra
systems over potentially different monoids has not been worked out.

---

## Relationship to the two towers

The relational machine as specified here implements the **depth-filtration tower**:
building R within a fixed history monoid M. It does NOT implement the **hyperverse
tower** (iterating U_H across universes to build H). These are distinct constructions
and MUST NOT be conflated.

---

## Two implementations

The relational machine is implemented as two distinct systems:

**relational-repository** (`src/repo/`) — Markdown + YAML runbooks + Python.
The authoring and workflow layer. Flat files, git-versioned, human-editable.
Runs the MCP server that exposes the repository's content and runbooks to agents.
Stack: Python, FastMCP, SQLite (as a read cache), YAML runbook executor.

**relational-service-system** (`src/service/`) — SQLite + PydanticAI + LangGraph + FastAPI.
The live runtime. Self-contained Docker image. Ingests repository content and
runs the full four-component architecture as a service.
Stack: SQLite (WAL, hot store), PydanticAI (typed LLM output), LangGraph (state machines),
FastMCP + FastAPI (external interface).

The four-component architecture (Frontier, State Store, Normalization Kernel,
Observation Layer) is the specification for the **relational-service-system**.
The relational-repository implements only what is needed to run the MCP server
and execute runbooks.

Additional approved ADRs for the relational-service-system:
- **RDF / Turtle** — Units projected as RDF triples for graph serialization.
- **SHACL** — validates Unit kinds against their specs.
- **SPARQL** — query layer over the Unit graph alongside SQLite.

---

## Open questions

- What is the right category of morphisms between relational machines?
- How does the independence relation I propagate across a peer connection?
- Does the Normalization Kernel run σ then Δ, Δ then σ, or iterate each to fixpoint
  before composing? The fixpoint is the same; convergence properties differ.
- What does an implementation of the hyperverse tower look like as a machine?
