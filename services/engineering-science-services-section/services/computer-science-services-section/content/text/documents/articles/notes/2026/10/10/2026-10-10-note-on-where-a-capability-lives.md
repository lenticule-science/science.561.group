---
title: "Note on where a capability lives"
description: "The theory the Leader stated between 2026-08-26 and 2026-10-08 about where code belongs in the house: capabilities live in services sections, applications such as FeltOS, MetroPlat and MARSH only compose and parameterize them, and an application that carries a capability, a re-export shim, a topology of its own or a duplicate of upstream code is contaminated. Includes the tests the Leader gave for placing a unit of code."
date-created: 2026-10-10
type: note
keywords:
  - capability-placement
  - services-section
  - application
  - feltos
  - metroplat
  - marsh
  - re-export-shim
  - one-codebase
  - parameterization
provenance:
  authors:
    - emsenn
    - claude-sonnet-5-5
  received-under: "Lenticule Science Senior, pass metroplat-feltos-node of debt-2026-10-09-leader-words-held-in-corpus"
  utterances:
    - "ni:///sha-256;mZ5s_A (2026-08-26)  MASH, MetroPlat and the two agent-computer-system sections"
    - "ni:///sha-256;9-RIQI (2026-08-26)  one .npmrc, no localhost registry"
    - "ni:///sha-256;rh9gDw, xHjKda, qzAMu8 (2026-09-10)  FeltOS composes upstream scripts; shims; work far upstream"
    - "ni:///sha-256;VJ4U9M, _KEJ1x, YRj1OZ, uOXFlz, YUMc9l, xi46Am, 1t-IVQ (2026-09-11)  MetroPlat is nothing but a UX for MARSH; no application carries capabilities"
    - "ni:///sha-256;sGRQ2V (2026-09-11)  service section or one function"
    - "ni:///sha-256;sLYhjc (2026-09-12)  Bare Cedar Fog parameterizes upstream only"
    - "ni:///sha-256;SksHlP, cH30Qn (2026-09-21)  one codebase; the Actor section"
    - "ni:///sha-256;7UfotG (2026-09-25)  FeltOS is not specialized to code fabrication"
    - "ni:///sha-256;e9RmFv (2026-09-28)  MetroPlat is a library for FeltOS"
    - "ni:///sha-256;4rOMBb (2026-10-08)  neither is a memory hog"
---

## The statement

1. A **capability** is one atomic action the house can perform. Each capability has exactly one script, and that script lives in a services section of the house's engineering tree. "We should have exactly one script for doing each atomic action" (Leader, 2026-09-11, `YRj1OZ`). The scripts are meant to sit under a services section; the Leader never wanted "one service section with one script" (`YRj1OZ`).
2. An **application** (FeltOS, MetroPlat, MARSH, and every other app) carries no capability of its own. It composes capabilities that services sections provide, and it is parameterized by configuration. "METROPLAT, FELTOS, NONE OF THIS SHOULD CARRY ANY CAPABILITIES ITSELF" (`YRj1OZ`, repeated in `uOXFlz`). The Leader's figure: "Windows 11 does not contain Grand Theft Auto" (`uOXFlz`): a platform hosts what runs on it and does not hold it.
3. Applications are therefore **dissolved into services sections**: a capability found in an application is moved to the services section that owns its domain, and every consumer is cut over to the real parent package. "ACTUALLY cut over consumers to rely on the real parent package" (`_KEJ1x`). "Dissolving applications' capabilities into services section so that applications can share them" (`YRj1OZ`). The answer to "should I fix MetroPlat?" is always "continue dissolving MetroPlat" (`YUMc9l`, `xi46Am`), because the question is invalid as formed once the house's agents, skills and rules are configured to follow its methods.
4. A **re-export shim** is a thin module in an application that re-exports an upstream package's names. It is contamination of the same kind as a duplicate implementation: "re-export shims … that's just another kind of contamination so we want to fix that TOO" (`xHjKda`). "Stop using Metroplat for thin re-export shims" (`_KEJ1x`). Quality is judged by a senior engineer's strictness: "act as a real senior node engineer and be strict with our code" (`xHjKda`).
5. **FeltOS has no topology of its own.** FeltOS "should compose other services sections' scripts and carry literally almost no logic itself" (`qzAMu8`), and "should have NO topology itself AT ALL" (`uOXFlz`). When it needs file capabilities it uses the computer-file engineering section (`rh9gDw`). FeltOS is not specialized to code fabrication (`7UfotG`), so any package that presents it that way misplaces it.
6. **Work is done as far upstream as possible**, so that "entire families of parallel implementation go away and get replaced by using the upstream code" (`qzAMu8`). Migrating leaf functions inside an application that should not carry them is the wrong work.
7. **MetroPlat's role.** On 2026-09-11 the Leader stated that MetroPlat is nothing but a UX for MARSH, that MARSH did not yet exist, that "infograph" is a name he had never heard and that agents had invented as a product (`YRj1OZ`), and that anything not about providing a UX to MARSH belongs in other packages (`VJ4U9M`). On 2026-09-28 he stated that MetroPlat is a library for FeltOS, as the Discworld mudlib is for FluffOS (`e9RmFv`). The two statements are held together as follows: in both, MetroPlat holds no capability of its own and is a layer over a driver or host; the later statement states the layering ([metroplat](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/metroplat.md), [feltos](../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/feltos.md)). "Infograph" has no house definition and is not a MetroPlat product.
8. **Bare Cedar Fog parameterizes upstream only.** The Bare Cedar Fog section holds configuration files, not code: "SHOULD ONLY PARAMETERIZE UPSTREAM … ONLY CONFIG FILES, NOT CODE. THE CODE IS DUPLICATING SHIT THAT SHOULD BE UPSTREAM" (`sLYhjc`). This is the rule science → engineering → operations → (public | 561 Group) stated for one section.
9. **One codebase.** The Leader's aim is one shared Node codebase, "like how Unity is ONE piece of code", not variants, and not scattered Python (`SksHlP`). He had "given up on one coherent shared ecosystem of code" for a moment and then restated it as the floor: "not the worst most crufty shit ever" (`sGRQ2V`).
10. **The placement test.** Whether a unit warrants a services section is decided by asking: is it a whole domain of capabilities, or one transformation or function (`sGRQ2V`)? One transformation is a script in the owning section; a domain with several is a section. Code being a certain way does not make it good placement (`sGRQ2V`).
11. **An engineering section named for a science term realizes that term.** The Leader found an engineering section named "Actor" whose content bore no relation to how Actor is defined in house research (`cH30Qn`). The theory of Actor is held in science (the activitypub and relationality actor terms, and the agential-orchestration actor-model notes such as the 2026-07-26 note on foam as a field of actor models); an engineering section that carries the name is a realization of that theory and states which definition it realizes. At judgement on 2026-10-10 the Actor engineering section named in `cH30Qn` is no longer in the tree.
12. **Hook-only capabilities belong in engineering sections.** A capability that exists only in an agent hook (the Leader's example: filtering on header-comment length in Node files) is moved into the engineering section for that domain, here javascript-engineering (`XUDOjC`). The rule is general: the hook, skill or agent only invokes what an engineering section holds. The Leader also holds that a hook on `node:fs` is "stupid to begin with", because the way to have an agent follow local practice is for engineering within a domain to use that domain's engineering services section, here computer-file engineering (`80-wlA`).
13. **One .npmrc, no localhost registry.** One registry configuration serves the repository; pointing every package at a localhost registry is a cheap workaround copied from a prior session (`9-RIQI`). The house npm registry is `registry.561.group`, a Verdaccio on Cold Red Gate, where "that should be what lets packages get available" (`Z7etat`; guide [house-npm-registry](../../../../../../../../../../../../../561-group-services-section/services/561-group-computer-services-section/services/561-group-computer-code-engineering-services-section/services/561-group-javascript-computer-code-engineering-services-section/content/text/documents/articles/teaching-articles/guides/house-npm-registry.md)). A lockfile pinned to `127.0.0.1` is wrong.
14. **MASH is the Group's hosting service for other systems**, and its behaviour is easily confused with MetroPlat's; two sections with near-identical names (agent-computer-system-engineering and computer-agent-system) are a naming collision where the first is correct, and one application's nine components appeared as services (`mZ5s_A`).
15. **NOG is the species of FROG native to JS Node ecosystems** (`bmQBrT`): the 2026-08-27 note on FROG and FERN holds it (genus FROG, species NOG).

## Why capabilities drift upward

An agent that finds missing capability in an application adds it there, because adding is cheap and the application is where the agent stands. The result is the pattern the Leader named: "you KEEP moving shit between shit that … I don't want" (`YRj1OZ`). The house prevents it by carrying the rule in the agent's configuration, not in the Leader's repetition: "I should never have to repeat myself" (`uOXFlz`).

## What remains open

- Which engineering sections now carry capabilities still held in MetroPlat and FeltOS packages is open; the staged inventory is the work of the requirement [applications-compose-capabilities-and-carry-none](../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/content/requirements/applications-compose-capabilities-and-carry-none.json).
- The house has no definition of "infograph"; whether any use should survive is open.
- Whether the 2026-09-11 statement that MARSH did not exist still holds depends on the state of the MARSH package, which this note does not survey.
