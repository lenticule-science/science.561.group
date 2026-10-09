---
name: "Directive"
description: "A Directive is one dated, located, verbatim illocutionary act by an authority-bearing agent, attempting to get an addressee to do or stop doing something. It is evidence an authority was exercised at a moment — the raw material a Policy's authority source can derive from — not itself a standing normative commitment."
extends: [Norm]
requires: [Authority]
enables: [Policy]
contrasts-with: [Policy, Custom, Guideline, Recommendation]
references:
  austin1962:
    authors: ["J. L. Austin"]
    title: "How to Do Things with Words"
    publication: "Oxford University Press"
    year: 1962
  searle1969:
    authors: ["John R. Searle"]
    title: "Speech Acts: An Essay in the Philosophy of Language"
    publication: "Cambridge University Press"
    year: 1969
  searle1976:
    authors: ["John R. Searle"]
    title: "A Taxonomy of Illocutionary Acts"
    publication: "Language in Society, 5(1)"
    year: 1976
date-created: 2026-09-11
---

## What This Is

A **Directive**, in Searle's taxonomy of illocutionary acts (1976), is an utterance whose illocutionary point is to get the hearer to do something: a command, request, order, or instruction. It is one of five basic illocutionary points (alongside assertives, commissives, expressives, and declarations), distinguished by its word-to-world direction of fit — the directive succeeds when the world comes to match the utterance, not the reverse.

In this governance vocabulary, a Directive is the raw speech act: one authority-bearing agent, at one moment, saying one thing, captured with its exact words and its locator (who said it, where, when). It is not yet a [Policy](./policy.md). [Policy](./policy.md) names "organizational directive" as one legitimate source of the authority ($\beta$) that grounds a policy's binding force — but a directive supplying that $\beta$ is necessary, not sufficient. A Policy additionally requires a defined agent set ($A$), a defined scope ($S$), a persistence condition ($\tau$), and — critically — an explicit repeal condition ($r$); "without $r$, the policy is permanent and indefeasible" (Policy, Formal Definition). A Directive, being a single dated utterance about a single situation, carries none of these by default.

## Directive vs. Policy

**A Directive is an event; a Policy is a standing frame.** A directive is witnessed once, at a locator, in exact words. A policy is the durable, scoped, defeasible commitment that a directive (among other authority sources — statute, charter) may ground once properly enacted with its own agent set, scope, persistence, and repeal condition.

**Treating a Directive as if it were already a Policy is a category error with a concrete failure mode**: a single verbatim utterance, quoted and dated, gets recorded as settled, universal, indefeasible law — with no defined scope (who and what it binds), no defined persistence, and critically no repeal condition — even though Policy's own admission criteria (Formal Definition, invariant 5, "Explicit repeal") require exactly that before a normative commitment is entitled to stand as binding past its originating moment. A directive recorded this way accumulates the appearance of law without ever meeting law's admission conditions, and — having no defined repeal condition — has no lawful mechanism by which it can be corrected; each session either treats it as immovable or invents its own justification for setting it aside, rather than applying an explicit, defined repeal.

**The corrective structure this implies**: capture the Directive faithfully (exact quote, locator, decider, date) as evidence, independent of whether it is later read as having grounded a Policy. Do not synthesize a Policy from it silently. When a Policy is actually enacted from one or more Directives, state its agent set, scope, persistence condition, and repeal condition explicitly, per Policy's own five invariants — a "policy" missing any of these is not yet a policy. A later Directive from the same or a superior authority is how a Policy's repeal condition is ordinarily satisfied; record that later directive with the same fidelity, and let it discharge the earlier policy's $r$ rather than silently overwriting or deleting the record of what was believed before.

## See Also

- [Policy](./policy.md) — the standing, scoped, defeasible commitment a directive may help ground
- [Norm](./norm.md) — the propositional structure a directive asserts should hold
- [Authority](./authority.md) — the capacity a directive exercises when uttered by an agent who holds it
- [Duty](./duty.md) — what a properly-enacted policy, not a bare directive, generates for agents in its scope
