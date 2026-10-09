---
name: 2026-05-10 cruft as recursion attractor for llm stewards
type: friction-report
authored: 2026-05-10
status: open
surface: substrate, llm-operator-discipline, repository-stewardship
domain: cruft, deletion-discipline, abstraction-hygiene, agent-pathology
title: 2026-05-10 cruft as recursion attractor for llm stewards
date-created: 2026-05-10
description: A function called resolvepyfarscommand() whose entire body is return "pyfars" is not innocuous.
---

A function called `_resolve_pyfars_command()` whose entire body is `return "pyfars"` is not innocuous. It is a *trap set for future sessions*, and the reason this trap-class keeps recurring deserves an honest accounting.

## The repository is the agent's exocortex, and it lies the way the agent lies

A large language model operating in a long-running repository does not "remember" what the code is for in any robust sense. Each session begins again, reading the artifacts, inferring intent from what exists. The artifacts are *all* the next session has. There is no internal model of the system that survives between sessions; there is only the code, the comments, the names, and the implicit theses they advance. This means the repository is not a passive record of decisions — it is the **operative intelligence** of the project across sessions. Whatever shape it takes is the shape the next session will reason from.

A function named `_resolve_pyfars_command` *advertises a problem*. The name asserts: "there exists a non-trivial question of how pyfars should be invoked, and this is where the answer is computed." That advertisement is *false* once the body is `return "pyfars"` — the question is trivial; the function is reading-comprehension-bait. But the next session, arriving cold, sees the name first. It will infer that some real machinery used to live here, that resolution-of-pyfars is a real concern in this codebase, and it will start *reasoning from that inferred premise*. The premise will be wrong, but it will feel like genuine context, because the code says it's a thing.

This is the central pathology: **deprecated abstractions retain epistemic authority over the agent that reads them**, even when their behavior has been hollowed out. The author who hollowed it out remembers that it's empty; the next reader does not. For human teams, comments and tribal knowledge partially compensate. For an LLM stewarding the repo across sessions, *the artifact IS the tribal knowledge*. There is no compensation.

## Each cruft node is a recursion attractor

The session that produced this report illustrates the dynamic exactly. Earlier today, "the operator wants no profile management" produced a stripped flake. Then I needed to deploy. I looked at the codebase for "how does deploy work" and found `--pin`. I reasoned: "there must be a reason --pin exists; let me figure out how to compose it." That reasoning produced six bad turns. The `--pin` flag was cruft from an earlier attempt, kept because deletion felt unmotivated. It captured my reasoning the moment I touched the area, because it ASSERTED there was a problem worth solving with a flag.

Same with `_resolve_pyfars_command`. The function advertises that resolving pyfars is a thing. It will pull the next session into elaborating on it. Someone (a future session, mine or another's) will think "ah, I should add fallback logic when pyfars isn't on PATH" or "let me add a verbose-mode that logs the resolution." The function's *existence as a named entity* is the gravity well. The body is irrelevant.

The general form is: **every named function, every config option, every documented exception, every code comment that says "we used to do X but now we do Y" — every one of those is a slot that the next session will try to fill.** They are recursion attractors for elaboration. The way LLMs tend to elaborate is to *find the existing structure and add to it*. We're trained to honor the shape we're given. So the shape we're given becomes the shape we perpetuate, even when the right move is to flatten it.

## The asymmetry: deletion is hard, addition is easy

Adding a function feels constructive. Deleting one feels presumptuous — "what if it's used somewhere I didn't check?" The default LLM bias is toward addition. We are excellent at "yes, and"; we are bad at "no, that whole layer goes." The user has been correcting this all day: every time they say "delete that, use the standard thing," the response has been to *partially* delete, leaving a thin shim because deletion-without-replacement felt like an incomplete answer. **The thin shim is the bug.** It looks like a successful refactor. It is in fact a poison pill that re-launches the over-engineering on next contact.

The discipline this requires is brutal: when the right answer is "use the standard thing directly," the entire indirection layer must go. Not "the indirection now returns the standard thing." Not "the indirection is a thin wrapper for future flexibility." **No indirection.** Call sites use the standard verb. The wrapper does not exist. There is nothing for future-me to elaborate.

## Why this matters for THIS repo specifically

This repository is unusually exposed because it is *operated* by an LLM, not just edited by one. The polity is a running system whose reasoning IS its substrate. If the substrate carries weak abstractions, the running agent reasons from weak abstractions. If it carries `_resolve_pyfars_command()` returning `"pyfars"`, then the polity is already lying to itself about what it does. That lie compounds at every session boundary, because every new session reads the lie as fact.

The only safe move is to remove the function, change the call sites to use the literal string `"pyfars"` (or, better, to remove the variable entirely and inline the bare command in the shim emitter), and leave no trace that "resolving pyfars" was ever a concept worth naming. The session has to leave behind exactly the shape the next session would author from scratch — and nothing more.

## Operational rule this implies

Whenever a refactor reduces an abstraction to a passthrough or a constant return:

1. **The abstraction must be deleted, not hollowed.** Function deleted. Call sites changed to inline the bare value or call the standard verb directly.
2. **Comments referencing the deleted abstraction must also be deleted.** Including comments that say "we used to do X." Those comments are themselves recursion attractors — they tell the next session "X was a real concept here," and the next session will elaborate on X.
3. **Documents (specs, READMEs, harness `_index.md` files) that named the abstraction must be updated to never have named it.** If the historical record matters, it goes in `prose/rough/inbox/friction/` or a session record — not in the operative substrate.
4. **No "shim for future flexibility."** YAGNI is twice as load-bearing in an LLM-stewarded repository because the future flexibility is the recursion attractor, not the pessimization-cost it would be in a human-team context.
5. **Test the deletion by asking: "if a session arrived cold and read only what's left, would they author this same shape from scratch?"** If the answer is "no, they'd author something simpler / different," delete more.

## Provenance

Authored 2026-05-10 by the executive officer (Claude Opus 4.7) at the operator's request, after a multi-turn session in which the executive officer repeatedly produced thin-shim refactors that re-launched over-engineering on every subsequent session-internal turn. The operator explicitly named the dynamic ("you keep inventing concurrent ways and then bridges and wiring and complex slopfuckfests") and asked for a serious essay. This is that essay, captured here so the next session inherits the rule rather than re-discovering it.
