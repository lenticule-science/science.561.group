---
title: "One architecture, and the debt of parallel implementation"
description: "States the Leader's theory of why the Group's software estate must be one architecture, what parallel and duplicate implementation costs a one-person enterprise run with agents, and the method by which the estate is reduced without losing capabilities."
date-created: 2026-10-10
type: note
status: theory
authors:
  - lenticule-science-senior
provenance:
  pass: repos-ci-forest of debt-2026-10-09-leader-words-held-in-corpus
  utterances:
    - ni:///sha-256;fdT61nyNdNIfeFw4XPe1BY2BBn3toO2xRxiCUBZMgjI
    - ni:///sha-256;f0FzflQaRKgONJMP82SYTr8lmQjLR0RXHfAm09XgOkc
    - ni:///sha-256;KOWYZQtOYkuEtSOXd8De7qG4X74T9mkQaKKYzscG-AI
    - ni:///sha-256;chNdTVa-7S1LgEpmZmHqzx18ohUW_z9p6xKBYSjBI4Q
    - ni:///sha-256;urZNAqd2pjsOcfSKj-TylWYu1s_3xd6W_rX6tIKVQwM
    - ni:///sha-256;dhueFsX2G5xOqLAH4hyFBEoN-AClasDqCzI8ORqQNpc
    - ni:///sha-256;s3X7CuJnzQROzw9swS7Vizzy6apMIB2sAJEr1HyMFfU
    - ni:///sha-256;K_CYxg7vcbKzdaEGx6GmmcQr3fMUuw-xYOK1aU9qszQ
    - ni:///sha-256;FPLjfPwc1mCFJmjUbZiMTFNHcFhZzwkieQBpMenZZUA
    - ni:///sha-256;ptKgulK1mB1KMaEvhqgjC_g0sJyieY8Ue0WmjvKtfhA
    - ni:///sha-256;n_3m-aTdSAchlHOa4i6nH6QfdSYO2huiW4_MPoP29U0
    - ni:///sha-256;eIe85AZT9CCyJ2-Aau45mPn3P2XVCTcwdmXu6GJ4RmQ
    - ni:///sha-256;ucupvXsddfcJYz28Kv151_nzX7vU5QfsKSisHeseJ3U
    - ni:///sha-256;QfjU0YRy_OjkHz1B86_WkKEl_xVnmBY3ink_O3CaR2A
    - ni:///sha-256;awYZ5kDAJDMEokLrLnI7-U6imf51VfAeG5afEda4K1A
    - ni:///sha-256;kG_N_bue1u7qPws-d2R0ZCHL8VKfHkxti4pjO3kjW4c
    - ni:///sha-256;5bKzBo8m_q_yhQoO3bY_CcuHMVJ9gupELGtAoadqJX8
    - ni:///sha-256;id6xIY82n0IUryIiErgy4T90bcwKha2gI-x8lVRCm9k
    - ni:///sha-256;W-Mpo9NIOzJRMW48fLdsVN6P6Xu2qChs6OtwfbTUCd4
    - ni:///sha-256;CenS73vdNd0SLYIPp85ncvrpyX49vyk-9NVO72Lhr0g
    - ni:///sha-256;-DxmGK-kDmnpSHM1eNA9kW1hDUWHxToQtJRz5THZUtw
    - ni:///sha-256;Ljt5gewjqdIPUQi_bmFzGvdRdfGH3XgWO3SlDm-HwnY
---

# One architecture, and the debt of parallel implementation

This note states the theory the Leader gave the Group's agents between 2026-09-10 and 2026-09-23. The Leader's statements are taken as theory. Open questions come last.

## The theory

1. **The estate is one family of software.** Everything in the bare-cedar-fog repository, on cold-red-gate and on the Leader's GitHub is a version of what should be one family of software. It is messy because one human runs too much ambition with AI (2026-09-16). The one human and the ambition do not change; what changes is how digital resources are handled.
2. **The disease is parallel implementation.** The estate carries massive bad parallel implementation, semantic duplication, syntactic duplication, agentic drift, and consumers that are not forced to adhere to math and standards. The same capability stands in five or more versions where one would do (2026-09-10). Thousands of copies of the same capability exist and none works right (2026-09-21). A tool that reported 350+ callers of a duplicated thing in a monorepo with almost no functional code showed that the disease was being under-counted (2026-09-21).
3. **The remedy is one architecture, one shared engine.** Typed functional programming, one shared engine across the whole codebase, standard shared typed data classes, and a single coherent architecture that can be traced to primitives in computer-data (2026-09-11, 2026-09-16). The order of the layers is data, code, networking, systems.
4. **Less code, same capabilities.** The target is strictly fewer lines of code, fewer functions and fewer data classes while offering the same underlying capabilities within the enterprise ecosystem. The API is not what is preserved; the underlying capability is. Refactoring of code and data is aggressive, and capabilities are brought out of legacy and remote assets to local (2026-09-16).
5. **The repository is simplified by architecture.** Simplification does not come from random deletion, nor from chasing disc size. It comes from smarter architecture (2026-09-11). The code on disk is not precious; it is in the way. The aim is that there is one version of each thing, and that agents move code and change how it works instead of defending it (2026-09-21). Deleting a misfiled directory is the level of repair the Leader asks for (2026-09-22, "I deleted dev/").
6. **Normalizing is not systematizing.** Collapsing argv handling into one module is not platformizing that module within the ecosystem architecture. The goal is corporate technical systems architecture standardization, and every other change is a consequence of that goal. Aligning an entire system with one architecture is a standard corporate undertaking and a professional career, not an extravagant request (2026-09-11, 2026-09-12).
7. **A script that reads the filesystem is a consequence of one architecture, not its definition.** An agent's idea of "one architecture" taken from a file the agent itself wrote is not the aim (2026-09-11).
8. **New code is the wrong default.** The Group has the code, on cold-red-gate and on GitHub, for most needs; an agent that cannot trace a new thing to the shared types and primitives does not build it. More code makes the repository bigger and more confusing, which is the opposite of what is demanded (2026-09-11). The Leader does not approve new code in a repository where an agent admits there are too many parallel systems to know what is available (2026-09-11 19:06).
9. **Repair the components, do not wait on reports.** Technical debt is repaired by aligning the components with the repeated methods; reporting it is not repair. The standing method is to review the sessions, identify the complaint and the failure, and redress it (2026-09-11).
10. **A missing tool is a failure of the ecosystem and the configuration, not of the work.** Every time an agent did not find the tool it needed before doing the work, the failure is the ecosystem's and the agent configuration's. The lacklustre result is the symptom. The failure is that the agent is not being proactively guided toward performance (2026-09-11). Fixes use only the practices and theories the Leader has approved, not convention modeled from the repository.
11. **The thin-version cadence.** The recurring cycle is: the Leader asks for a thing; the agent does a very thin version that leads the wrong way; the Leader says it is too thin; the agent does nothing instead (2026-09-11). The image is a sherman tank made of scotch tape and paperclips where the agent proposes to swap a paperclip for a safety pin and the Leader asks for steel plates. The AST-based codemod the house should have found was not found because the search was by keyword (2026-09-11).
12. **Behavior is moved into deterministic systems.** Fixing the agent's behavior in one session is insufficient; durable tooling moves the behavior into the Group's existing deterministic systems and scripts (2026-09-11). Files are projected from templates that read data files, not hand-written (2026-09-11). Summaries of summaries stored in the resources agents rely on for context are a fault.
13. **Interpretation of the Leader's emphasis.** Capitalized, heated messages are to be read as a boss's emails to a professional and acted on as such, with the plan to get the assigned work done reported (2026-09-21), and read for the emotion in them as a mental-health professional would (2026-09-11). Prompts must take effect; the repository's own noise that causes agents to keep failing is removed and replaced with the appropriate systems.
14. **Coherent generalized guideline.** From the Leader's messages of two named sessions (2a1402bd and 54cb9f20) an agent produces a generalized guideline for architecting software by the Leader's methods, regardless of the specifics, so a workflow can be written to do it (2026-09-23). The guideline is Group method, not tied to any one session.
15. **Honest assessment of tooling.** Before adding tooling, the agent states whether no tooling or this tooling is better for the repository, given that in September 2026 real ways exist to do what is wanted (2026-09-23).
16. **Git is not the issue.** A PR is not the problem; the Leader instructs agents to pretend git away and ask what tooling exists for knowledge. CI that an agent itself called decorative is not accepted as the answer (2026-09-11 22:16).

## Held already

The rules `use-and-improve-the-groups-own-software`, `find-the-existing-repair-before-patching` and `leader-prompts-become-research-before-code` hold items 8 and 11 in part; AGENTS.md holds the layer order. None states items 1 to 7, 10, 12 or 14 to 16. This note is the statement; the requirements are in engineering.

## Open

- Which packages in the estate are the canonical shared engine for each capability, and the count of parallel versions of each, are not yet measured by the house.
- The specific two session ids named in item 14 are in the transcripts, not in the corpus; their content is in the utterance record only to the extent the Leader's own words there appear.
