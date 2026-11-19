---
title: "Dispatching Concurrent AI Agents at Scale: Pins, Scope, Identity and Landing"
summary: "How large engineering orgs integrate, scope, dispatch and land concurrent AI agent work: one automated writer per pointer, computed ownership, a gated queue."
date-created: 2026-10-16
type: paper
status: active
visibility: public
tags: [ai-agents, agent-orchestration, merge-queues, monorepo, software-engineering, agent-governance]
keywords: [concurrent AI agents, merge queue, dependency pins, monorepo, OWNERS files, capability security, confused deputy, agent identity, sandbox, coding agents, landing, verification]
abstract: "A research team running most of its engineering through concurrent AI agents found that its work was dominated by pointer movement: in a sample of recent commits on one integration branch, about 68 percent were integration, pin or delivery plumbing and about 6 percent changed product code. We surveyed how large engineering organizations and published agent deployments handle four problems: integrating many repositories, scoping and identifying contributors, dispatching and landing agent work, and avoiding multi-agent failure modes. Eight principles recur: one writer per pointer, a gate that tests the set in the state it will land in, owned breakage with revert as the default, mechanical cross-cutting work as one governed change, scope computed from a path-to-owner map, authority passed with the task rather than held by the actor, mandatory enforcement at the seam with freedom inside, and an external check plus a cap on every loop. Most agent figures are self-reported by vendors and adopters, several 2026 results are preprints, and organizational transfer to a very small organization is untested. We state these limits and the open questions for the research team."
references:
  winters2020vc:
    type: chapter
    title: "Version control and branch management"
    author: [{family: Winters, given: Titus}, {family: Manshreck, given: Tom}, {family: Wright, given: Hyrum}]
    issued: {date-parts: [[2020]]}
    container-title: "Software Engineering at Google"
    publisher: "O'Reilly Media"
    URL: "https://abseil.io/resources/swe-book/html/ch16.html"
  winters2020dep:
    type: chapter
    title: "Dependency management"
    author: [{family: Winters, given: Titus}, {family: Manshreck, given: Tom}, {family: Wright, given: Hyrum}]
    issued: {date-parts: [[2020]]}
    container-title: "Software Engineering at Google"
    publisher: "O'Reilly Media"
    URL: "https://abseil.io/resources/swe-book/html/ch21.html"
  potvin2016:
    type: article-journal
    title: "Why Google stores billions of lines of code in a single repository"
    author: [{family: Potvin, given: Rachel}, {family: Levenberg, given: Josh}]
    issued: {date-parts: [[2016]]}
    container-title: "Communications of the ACM"
    volume: "59"
    issue: "7"
    page: "78-87"
  harry2017:
    type: post-weblog
    title: "The largest Git repo on the planet"
    author: [{family: Harry, given: Brian}]
    issued: {date-parts: [[2017, 5, 24]]}
    container-title: "Microsoft DevBlogs"
    URL: "https://devblogs.microsoft.com/bharry/the-largest-git-repo-on-the-planet"
  chromiumdeps:
    type: webpage
    title: "Chromium dependencies"
    author: [{literal: "Chromium project"}]
    issued: {date-parts: [[2026]]}
    URL: "https://chromium.googlesource.com/chromium/src/+/main/docs/dependencies.md"
  zuul:
    type: webpage
    title: "Project gating"
    author: [{literal: "Zuul project"}]
    container-title: "Zuul documentation"
    URL: "https://zuul-ci.org/docs/zuul/latest/gating.html"
  uber2025:
    type: article
    title: "CI at scale: lean, green, and fast"
    author: [{literal: "Uber Engineering"}]
    issued: {date-parts: [[2025]]}
    container-title: "arXiv:2501.03440"
    URL: "https://arxiv.org/abs/2501.03440"
  colyer2019:
    type: post-weblog
    title: "Keeping master green at scale (summary of Ananthanarayanan et al., EuroSys 2019)"
    author: [{family: Colyer, given: Adrian}]
    issued: {date-parts: [[2019]]}
    container-title: "the morning paper"
    URL: "https://blog.acolyer.org/2019/04/18/keeping-master-green-at-scale/"
  bird2011:
    type: paper-conference
    title: "Don't touch my code! Examining the effects of ownership on software quality"
    author: [{family: Bird, given: Christian}, {family: Nagappan, given: Nachiappan}, {family: Murphy, given: Brendan}, {family: Gall, given: Harald}, {family: Devanbu, given: Premkumar}]
    issued: {date-parts: [[2011]]}
    container-title: "Proceedings of ESEC/FSE 2011"
  maccormack2012:
    type: article-journal
    title: "Exploring the duality between product and organizational architectures: a test of the mirroring hypothesis"
    author: [{family: MacCormack, given: Alan}, {family: Rusnak, given: John}, {family: Baldwin, given: Carliss}]
    issued: {date-parts: [[2012]]}
    container-title: "Research Policy"
    volume: "41"
    issue: "8"
    page: "1309-1324"
  conway1968:
    type: article-journal
    title: "How do committees invent?"
    author: [{family: Conway, given: Melvin E.}]
    issued: {date-parts: [[1968]]}
    container-title: "Datamation"
  hardy1988:
    type: article-journal
    title: "The confused deputy (or why capabilities might have been invented)"
    author: [{family: Hardy, given: Norm}]
    issued: {date-parts: [[1988]]}
    container-title: "ACM SIGOPS Operating Systems Review"
    volume: "22"
    issue: "4"
  uppala2026:
    type: article
    title: "Prompts don't protect: architectural enforcement via MCP proxy for LLM tool access control"
    author: [{family: Uppala, given: Rohith}]
    issued: {date-parts: [[2026]]}
    container-title: "arXiv:2605.18414 (preprint)"
    URL: "https://arxiv.org/abs/2605.18414"
  gloaguen2026:
    type: article
    title: "Evaluating AGENTS.md: are repository-level context files helpful for coding agents?"
    author: [{family: Gloaguen}, {family: Mundler-Sasahara}, {family: Muller}, {family: Raychev}, {family: Vechev}]
    issued: {date-parts: [[2026]]}
    container-title: "arXiv:2602.11988"
    URL: "https://arxiv.org/abs/2602.11988"
  nikolov2025:
    type: article
    title: "How is Google using AI for internal code migrations?"
    author: [{family: Nikolov}, {family: Codecasa}, {family: Sjovall}, {family: Tabachnyk}, {family: Chandra}, {family: Taneja}, {family: Ziftci}]
    issued: {date-parts: [[2025]]}
    container-title: "arXiv:2501.06972 (experience report)"
    URL: "https://arxiv.org/abs/2501.06972"
  becker2025:
    type: article
    title: "Measuring the impact of early-2025 AI on experienced open-source developer productivity"
    author: [{family: Becker}, {family: Rush}, {family: Barnes}, {family: Rein}]
    issued: {date-parts: [[2025]]}
    container-title: "METR; arXiv:2507.09089"
    URL: "https://arxiv.org/abs/2507.09089"
  olausson2024:
    type: paper-conference
    title: "Is self-repair a silver bullet for code generation?"
    author: [{family: Olausson}, {family: Inala}, {family: Wang}, {family: Gao}, {family: Solar-Lezama}]
    issued: {date-parts: [[2024]]}
    container-title: "ICLR 2024; arXiv:2306.09896"
    URL: "https://arxiv.org/abs/2306.09896"
  xu2026:
    type: article
    title: "AI agent pull requests on GitHub: frequency, structure, and merge conflict rates"
    author: [{family: Xu}, {family: Subramanian}, {family: Karthik}]
    issued: {date-parts: [[2026]]}
    container-title: "arXiv:2607.04697"
    URL: "https://arxiv.org/abs/2607.04697"
  jacksonzave1995:
    type: paper-conference
    title: "Deriving specifications from requirements: an example"
    author: [{family: Jackson, given: Michael}, {family: Zave, given: Pamela}]
    issued: {date-parts: [[1995]]}
    container-title: "Proceedings of ICSE 1995"
    page: "15-24"
---

# Dispatching Concurrent AI Agents at Scale: Pins, Scope, Identity and Landing

Organizations that run very large engineering efforts do not leave the integration pointer, a contributor's scope or the landing step in anyone's hands but a mechanism's. Across Google, Chromium, Nix, the Linux kernel and published AI-agent deployments, the same shape recurs: one automated writer per pointer, scope computed from a path-to-owner map, authority passed with the task, a deterministic verifier before work lands, and a cap on every retry loop. This paper, research from the 561 Group, surveys that evidence and draws out eight recurring principles for dispatching many concurrent AI agents.

## Why would concurrent agent work need its own integration design?

The 561 Group is a for-profit organization whose engineering is done almost entirely by AI agents. Its research team measured its own repositories on 2026-10-16 and found that the work was mostly pointer movement by unscoped, unidentified sessions.

Measured in the group's corpus:

- **Scale.** 788 GitHub repositories across nine owners, and about 2,290 pull requests in about six days, produced by agents identifiable only by branch prefix.
- **Integration load.** Of the last 300 commits on one integration branch, about 68 percent were integration, pin, copy-moving or delivery plumbing, about 25 percent changed only method and records, and about 6 percent changed product code or content. In one component, 56 of the last 100 non-merge commits changed only submodule pointers (gitlinks).
- **Pin mechanisms in simultaneous use.** Git submodule gitlinks, exact npm version specifiers, workspace specifiers, Guix channel commit pins and JSON records carrying commit hashes. One component existed at three different commits at once.
- **Identity.** Every sampled GitHub commit carried the same single author identity and was unsigned, whichever agent produced it.
- **Gates.** An independent-receiver requirement and a pre-push merge-queue gate had been removed, so producers tested and merged their own work.

The research team's diagnosis (Inferred) is four absences: no single automated writer owns the integration step; scope is not computed because the section tree is not a tree; identity is shared, so history cannot say who did what; and no hermetic integration build answers "does the set work", so sessions answer it by running things.

The paper asks five questions: how do the largest organizations integrate many components and advance pins, how do they scope and identify contributors, how is agent work dispatched, sandboxed, verified and landed, what are the failure modes of agent loops, and how is architecture derived when the principal states only goals. Labels used: Measured (quantified by a source), Observed (directly read), Inferred (a conclusion drawn here), Disputed, Unknown.

## How do large organizations integrate many repositories?

They either remove the pin or give each pin exactly one automated writer.

### Why does Google have no internal version pins?

Google keeps authoritative source in one repository and branch, develops at trunk, and disables incomplete features at runtime. Its One-Version Rule states that developers must never have a choice of which version of a component to depend on [@winters2020vc]. Measured (secondary, from mirrors quoting the original article): in January 2015 the repository held about 2 billion lines and 35 million commits, with about 40,000 commits per workday, 60 percent automated [@potvin2016]. Microsoft consolidated Windows from more than 40 depots into one Git repository of about 3.5 million files, using a virtual file system to materialize files lazily [@harry2017]. The costs are named: tooling investment, codebase complexity and code-health effort [@potvin2016].

### What happens where pins survive?

The dependency graph becomes the hard part. Google's own book calls semantic versioning "a lossy estimate" that fails by overconstraint and overpromise, notes that satisfying version constraints is NP-complete, and calls the "Live at Head" alternative "largely unproven at scale" [@winters2020dep]. Chromium's root `DEPS` file holds URLs and hashes of dependencies, and rollers advance them; changes go upstream first and are then rolled [@chromiumdeps]. Inferred: in these systems the writer of an integration pointer is a roller identity, the gate is the roller's own change passing try jobs, and the owner of breakage is a named sheriff with revert as the default response.

### What is a gating queue?

A queue that is the only thing allowed to write the main branch. Zuul tests each queued change merged on top of the ones ahead of it, drops a failing change and re-tests those behind [@zuul]. Measured (secondary, via a summary of the EuroSys 2019 paper on Uber's SubmitQueue): before the queue, one iOS mainline was green 52 percent of the time in one week, and the chance of a problem was about 40 percent with 16 concurrent potentially conflicting changes [@colyer2019]. A 2024 follow-up reduced builds-to-changes ratios (Android 5.43 to 1.96) and about 53 percent of CI resource [@uber2025]. Google makes the contrasting choice to test batches less often and find culprits afterwards. Either way a named procedure, not the author, certifies the set.

### How do Linux, Nix and Guix decide a coherent set?

In Linux only a parent maintainer pulls from a child tree, on a schedule, through an integration tree; MAINTAINERS routes each path to a responsible maintainer. A Nixpkgs channel updates only after its tests pass on the Hydra build farm. Guix pins one commit for the whole package set, with each fetched commit required to be signed by an authorized key.

| Organization | Who writes the integration pointer | Owner of breakage |
|---|---|---|
| Google, internal | nobody (no pins) | provider, who migrates dependents |
| Chromium, Fuchsia | roller account | sheriff; revert |
| Zuul, Tide, SubmitQueue, bors | the queue | author of the failed change |
| Nixpkgs | channel script | maintainers |
| Guix | any key in the parent's authorizations | authorized developer |
| Linux | the parent maintainer, by pull | subsystem maintainer |

Unknown: no peer-reviewed measurement of submodule pin-bump overhead exists, no source covers submodule nesting deeper than one level, and no external benchmark exists for the group's 68 percent figure.

## How do organizations scope, identify and authorize contributors?

Ownership is computed at the point of change, and the actor never holds ambient authority.

### Does ownership predict quality?

Correlationally, yes. On Windows Vista and Windows 7, the number of low-expertise contributors and the share of changes by the top owner correlated with pre-release faults and post-release failures [@bird2011]. MacCormack and colleagues found that the product from the loosely coupled organization was more modular in every matched pair, by up to a factor of eight in potential change propagation [@maccormack2012], echoing Conway's observation that organizations produce designs that copy their communication structures [@conway1968]. Inferred: the graph that defines agent scope must be the same graph the code is mounted in, or scope will drift from the organization.

### What is the confused deputy, and why does it matter for agents?

Hardy's confused deputy is a compiler that held authority from two sources, its own system directory and the user's request, and could not tell which a request invoked. The fix is to pass authority together with the designation, as a capability [@hardy1988]. Inferred: an agent session that holds a human's credentials is Hardy's compiler, and a hook that denies some shell commands is a blacklist over ambient authority; the capability alternative is not to hold the credential in the session. LPMud game drivers implement the same idea inside their runtime: a master object decides on every call whether a read, write, override or shadow is valid, including reads performed by file inclusion during compilation. Path-to-owner is the core primitive.

### What does agent identity look like in practice?

GitHub's Copilot agent commits are authored by the agent with the requester as co-author and are signed; the requester cannot approve the resulting pull request. Uber gives agents workload identity and issues short-lived, audience-bound tokens carrying a user to agent to sub-agent chain. Signing tools can record commits with ephemeral certificates in a transparency log so verification outlives the certificate. The common pattern is an agent identity distinct from the human's.

### Do instructions or mechanisms bound behavior?

Mechanisms. With unauthorized tools visible, three models chose them in 48 to 68 percent of adversarial scenarios even when told not to; prompt allowlists cut violations to between 4.0 and 37.0 percent but never to zero, while a proxy that removes tools from the registry gave 0 percent by construction (a single-author preprint with adversarial scenarios) [@uppala2026]. Repository context files such as AGENTS.md are followed well but generally do not improve task success and raise inference cost by over 20 percent on average [@gloaguen2026]. The scope should be mandatory at the seam, where work lands, and optional inside; a 2024 industry survey of over 39,000 respondents found internal platforms help performance but can reduce change stability and throughput when forced.

## How are agent tasks dispatched, verified and landed?

Published deployments converge on one task, one repository, one sandbox, one branch, one pull request, one deterministic verifier, capped retries and a human or independent merge.

- **Vendor platforms.** GitHub's cloud agent runs in an ephemeral environment, works on one branch at a time, is limited to the repository named at task start, has a 59-minute session cap, and cannot approve or merge its own pull request.
- **In-house deployments (self-reported).** Spotify's background agent caps the loop at 10 turns and 3 session retries, runs independent verifiers, and reports more than 1,500 merged agent pull requests. Stripe reports more than 1,000 merged agent pull requests per week, caps CI at two rounds, and human-reviews every one, with no denominator published. Google reports 80 percent fully AI-authored modifications in one integer-widening migration and about 87 percent of AI-generated code committed unchanged in a 5,359-file test-framework migration, with reviewer speed the bottleneck [@nikolov2025]. Airbnb migrated about 3,500 test files in six weeks against a manual estimate of 1.5 years, with a long tail needing 50 to 100 retries.
- **Verification.** A way for the agent to verify its own work is what separates a session you watch from one you walk away from. Inferred: every deployment caps turns, retries, CI rounds or session minutes, so an uncapped retry loop departs from published practice.

### Is the productivity evidence solid?

No. A randomized trial of 16 experienced developers across 246 tasks found AI use increased completion time by 19 percent while developers expected a 24 percent reduction [@becker2025]. The same group's 2026 follow-up called its own measurements "an unreliable signal" because 30 to 50 percent of developers withheld tasks they did not want to do without AI. Self-report is a poor guide.

## What are the failure modes of concurrent agents?

### Why do probe-patch-retry loops fail?

Self-repair gains are often modest once repair cost is counted and are bottlenecked by the model's ability to give feedback on its own code [@olausson2024]. Execution feedback is an external signal and helps; a loop that only re-runs and patches the printed symptom supplies little new information (Inferred). In one study of agent trajectories, repetitive sequences of length 10 corresponded to an 89 percent failure probability, though this is correlation and varies strongly by model.

### What goes wrong with parallel writers?

In a study of 33,596 agent pull requests across 2,807 repositories, 40.2 percent of repositories had agent pull-request pairs with exact temporal overlap. In a merge replay of 747 pairs, textual conflicts occurred in 41.7 percent of cross-agent pairs and 19.8 percent of same-agent pairs, while only 0.5 percent of co-active pairs were cross-agent [@xu2026]. Note that 40.2 percent is a share of repositories, not a conflict rate. Opinions differ on multi-agent coding: one practitioner argues parallel subagents carry conflicting implicit decisions, while another vendor's read-heavy research system beat a single agent by 90.2 percent on an internal evaluation at about 15 times the tokens, and notes most coding tasks have fewer parallelizable subtasks. Vague delegation causing duplicated work is a documented failure; the group's own duplicated "compose" commits that each deleted about 76,809 lines are an instance, with no claim-before-write step.

Large unfamiliar codebases are where agents do worst: a benchmark's private-codebase set topped out at 17.8 percent against 43.6 percent on its public set. Those scores date from 2025-era models, so only the qualitative claim is relied on.

## How is architecture derived when the principal states only goals?

Jackson and Zave give the derivation rule: a specification, together with domain assumptions, must entail the requirement [@jacksonzave1995]. The research reports that standards define what to record rather than how to derive it, that scenario-based methods convert vague concerns into testable scenarios, that governance artifacts decay unless bound to checks, and that category-theoretic derivation is currently "mostly at the level of prototype and proof-of-concept". Where the principal cannot weigh in on architecture, a conformance reference must be a declared artifact outside the code, bound to a check.

## What eight principles recur?

All eight are Inferred from the evidence above.

1. **One writer per pointer.** Where pins exist, an automated identity writes them; otherwise the pin does not exist.
2. **The gate tests the set in the state it will land in.** A named procedure, not the author, certifies the set.
3. **Breakage has an owner and revert is the default.**
4. **Mechanical, cross-cutting work is one governed change**, not many agent decisions: it is sharded to owners.
5. **Scope is computed from a path-to-owner map** by the enforcement point.
6. **Authority is passed with the task**, not held by the actor.
7. **Mandatory at the seam, optional inside.** Instructions steer; mechanisms bound.
8. **Every loop has an external check and a cap.**

The steelman of the opposing view: forcing every task through a platform is associated with lower throughput and stability, practitioners disagree on multi-agent coding, and the randomized trial suggests heavy tooling may not help experienced developers. The evidence does not oppose gating the landing step; it opposes forcing every task through a platform.

## What did the research team conclude for its own system?

It derived sixteen requirement candidates, all Inferred, to be ratified by owning sections. The follow-up audit, [Paraconsistent, Transfinite, Linear Logic for Concurrent AI Agent Integration](/paraconsistent-transfinite-linear-agent-integration/), refines them into twenty, and explains why the queue is needed at non-monotone steps (advance, land, choose, grant) and not at others: claims commute and need no coordinator, decisions do not.

## Limits and open problems

- **Organizational transfer.** Most evidence comes from organizations with thousands of engineers and large infrastructure teams. Unknown: whether a very small organization can afford the compute of per-change gating. Even Uber's queue needed a 2024 redesign to cut CI resource by 53 percent [@uber2025].
- **Agent evidence.** Most figures are self-reported by vendors and adopters. Several 2026 results are preprints, snippets or secondary summaries. Unknown: post-merge defect or revert rates for agent work, throttling of agent pull requests, and orphaned-branch rates.
- **Enforcement evidence.** The strongest quantification of the instruction-versus-mechanism gap is one single-author preprint [@uppala2026]. No study measures enforcement against project-level rules files.
- **Superseded benchmarks.** Scores for 2024 and 2025 models are used qualitatively only.
- **Architecture derivation.** No outcome evidence was found for goal-oriented requirements engineering, scenario-based architecture evaluation or categorical derivation.
- **Open questions.** What is the smallest hermetic build that answers "does the set work" for a deeply nested submodule tree? Which platform operation owns the pointer writer, and what is the sheriff office? What does the architect role consist of when no human reviews?

## Related

- [Paraconsistent, transfinite, linear logic for agent integration](/paraconsistent-transfinite-linear-agent-integration/) and [the MAPE-K autonomic computing loop](/mape-k-autonomic-computing-loop/).
- [Rendanheyi and the living union](/rendanheyi-living-union-organizational-science/), the organizational model behind the group's agent design.
- [Agent-to-agent commerce](/agent-to-agent-commerce/) and [machine-payable APIs](/machine-payable-api/).
- Sibling sites: [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/), [market.561.group](https://market.561.group/).
