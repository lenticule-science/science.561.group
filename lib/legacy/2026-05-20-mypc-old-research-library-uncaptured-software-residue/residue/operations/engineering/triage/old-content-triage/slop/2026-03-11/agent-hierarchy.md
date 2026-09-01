---
date: 2026-03-11
type: slop
topic: agent hierarchy, terminology, access control
---

# Agent Hierarchy and Terminology

Emerged from conversation between emsenn and Claude Code on 2026-03-12 while
building the engine. Captured because we kept tripping over language and needed
to peg the terms down before going further.

---

## The problem we were hitting

We had conflated "MCP tools" with "skill scripts" — treating them as the same
thing when they operate at different levels. This caused confusion in both code
and conversation.

The deeper issue: we weren't thinking of ourselves (emsenn, Claude Code) as
agents *in* the engine, which meant we were designing special cases instead of
a uniform interface.

---

## emsenn's clarification (verbatim)

> Not quite, we should change our language to make sure we aren't stomping on
> the emerging conventions/standards of the field. Because MCP tools aren't
> necessarily related to skills at all - so we can call the things that our
> skills rely on... well, methods is kind of the natural term and *almost* lines
> up in comp-sci meaning as well as work meaning...
>
> Also, I have the concept of "persona agents" which isn't really documented
> well anyplace but like, persona agents are persistent over time, I know
> there's things like `SOUL.md` and `MEMORY.md` emerging as standards but we
> haven't implemented? I consider myself a persona agent.
>
> And I also have the idea of like "roles" which are meant to bundle skills
> together, so that like, I might have the role writer and that gives me the
> skills of a writer.
>
> But anyway, persona defines a whole identity, role defines a bundle of
> skills, a skill provides context for decision-making procedures, and then
> there might be various methods and tools involved with that - and using tools
> might need to trigger the use of skills.
>
> It makes sense then that tools be the "in" to this, with persona/role scoping
> what tools are available in the first place.

---

## The hierarchy (as established)

**Persona** — persistent identity over time. Has a `SOUL.md` (stable character,
values, voice) and `MEMORY.md` (accumulated experience). emsenn is one. Claude
Code is one. A cron job is probably not one.

**Role** — a bundle of skills a persona holds in a context. "Writer" bundles
writing skills. "Researcher" bundles different ones. Authorization is granted
via roles, not directly to personas.

**Skill** — a decision-making procedure. Context and instructions for *how to
approach* a class of tasks. Has a `SKILL.md` manifest with declared inputs,
outputs, region. Lives in the library.

**Method** — a callable procedure that a skill invokes to actually *do*
something. Python function, script, API call. Atomic operations. Called
"methods" to stay clear of MCP's use of the word "tool."

**Tool** (MCP only) — the external entry point. How any agent calls into the
engine. The MCP protocol's word for any callable endpoint. Not the same as
"method."

---

## The execution flow

```
agent calls tool → engine checks persona → looks up roles → finds skill
that handles this → skill executes methods → effect report
```

Persona scopes which roles are available. Roles scope which skills apply.
Skills scope which methods get called. The tool is the door; everything
inside is persona/role-gated.

---

## Access control (emsenn's framing, verbatim)

> I was picturing using some sort of auth system so that agents don't even
> see tools they can't use?

This is capability-based access control: you only see what you can use. An
agent can't probe for tools it's not authorized for because those tools are
simply invisible to it.

`tools/list` is a dynamic response — the server decides what to return based
on who's asking. The engine resolves credentials → persona → roles → skills →
filtered tool list. Tool calls are also checked as defense-in-depth, but in
practice the agent never tries to call what it can't see.

---

## Implications for the engine

The engine is a **persona-aware router**. Every connection has an identity.
The shape of what's available changes based on that identity.

Right now (2026-03-12) emsenn and Claude Code connect anonymously and see
everything. That's acceptable for Phase 0. The persona/role/auth layer is the
next structural thing to build.

`SOUL.md` and `MEMORY.md` are persona-level artifacts — they belong alongside
the persona definition, not inside any skill directory.
