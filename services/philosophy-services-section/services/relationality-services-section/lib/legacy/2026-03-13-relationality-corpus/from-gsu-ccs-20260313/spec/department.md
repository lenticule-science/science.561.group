---
name: department

description: "A compartment of work within the repository separated from others by distinct teleology and method; the unit of agential organization."
defines: Department
domain: Repository
codomain: OrganizedWork
---

## What this is

A **department** is a directory that houses a distinct teleology (why the work
exists) and a distinct method (how it is done). Departments are not just
directories — they are separated by what they are *for* and *how they work*.
The four departments of this repository are math/, proof/, spec/, and src/.
The root level is the coordination layer across all four, not a department itself.

Departments are separated by the dependency order:
**math/ → proof/ → spec/ → src/**
Each department's output is the next department's primary input. This is not a
hierarchy of importance — math/ is not more important than proof/. It is a
dependency order: downstream departments cannot do their work correctly without
upstream outputs.

## Context files

Every department MUST maintain six context files read in this order on every
agent entry:

| File | Purpose |
|------|---------|
| `SOUL.md` | Why this department exists; core principles; what must never be compromised |
| `AGENTS.md` | Orientation; scope; file inventory; permissions; entry-point skills |
| `MEMORY.md` | Accumulated cross-session knowledge; patterns; lessons learned |
| `INBOX.md` | Incoming messages from other departments; triaged before planning |
| `PLANS.md` | Active workflows and work queue; only committed items |
| `IDEAS.md` | Raw unplanned material; mined into PLANS each pass |

A department without all six files is not fully constituted. Missing files will
cause context loss across sessions and coordination failures between departments.

## Skills

Every department has a `skills/` subdirectory containing the skills that operate
on that department's content. Every skill MUST have:
- `description` frontmatter — two sentences: what it does to what, when to use it
- `skill-closure-kind` frontmatter — one of: process, procedure, derivation, inquiry

Every department MUST have at minimum one improvement skill that implements the
agent loop (§agent-loop) for that department.

## MUST

- Have a clearly distinct teleology — what the department is for MUST be stated
  in `SOUL.md` and be different from every other department's
- Have a clearly distinct method — what the department does and how MUST be
  stated in `AGENTS.md` and grounded in its skills
- Maintain all six context files — the absence of any one causes drift
- Route cross-department findings via `skills/deposit-message-in-agent-inbox.md` —
  never write to another department's files directly

## CANNOT

- Merge teleology or method with another department — if two directories share
  the same why and same how, they are one department, not two
- Override upstream departments — math/ content is not subject to spec/ revision;
  spec/ content is not subject to src/ convenience; the dependency order runs
  one way only

## Pending

- Formal proof that four departments is the minimum and sufficient number for
  this repository — blocked by: skill-algebra construction (the claim parallels
  the nuclear quartet theorem but the formal proof is not yet written)
