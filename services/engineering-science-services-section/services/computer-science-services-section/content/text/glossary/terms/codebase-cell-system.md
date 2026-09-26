---
type: object
class: substrate
status: draft
depends-on: [predication-cell-set, predication-settling, witness-as-increment]
realizes: [codebase-as-substrate-content]
title: Codebase cell-system
description: The codebase of a software project, presented as a predication-cell-set over an entity set $E{\mathrm{code}}$ and a predicate alphabet $\Pi{\mathrm{code}}$.
---

# Codebase cell-system

The codebase of a software project, presented as a [predication-cell-set](../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-cell-set.md) over an entity set $E_{\mathrm{code}}$ and a predicate alphabet $\Pi_{\mathrm{code}}$.

## Entity set

$E_{\mathrm{code}}$ contains: source files, definitions (functions, classes, types, modules), identifiers (each occurrence as a distinct entity, or class of occurrences as one entity, depending on the witness language — see [witness-language-relativity](../../documents/articles/research/2026/07/31/lenticule-import/computing/software/software-development/archive/teaching/explanations/witness-language-relativity.md)), tests, build artifacts, deployments, contributors. Both human and machine-generated entities live in the same set; the substrate does not stratify them at this level.

## Predicate alphabet

$\Pi_{\mathrm{code}}$ contains predicates like:

- `defined-in` — a definition is in a file
- `references` — a definition uses another (function call, type usage, import)
- `is-test-for` — a test exercises a definition
- `passes-on` — a test's verdict on a build artifact
- `was-deployed-as` — a build artifact's release identity
- `contributed-by` — an increment's authorship
- `committed-as` — an increment's commit identity

The alphabet is not closed; the project's tooling discipline can extend it (e.g., `documents`, `benchmarks-against`, `is-mocked-by`).

## Settling

The [predication settling](../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) on this cell-system, denoted $v^{\mathrm{code}}$, is the trajectory of cell-value assignments produced by the project's history of increments — every commit, test run, deployment, review-vote, contributing event. At any stage $\tau$, $v^{\mathrm{code}}_\tau(p)(s, o) \in \mathbf{FOUR}$ records what is known about whether $s$ stands in predicate $p$ to $o$: $\bot$ (no record), $\mathbf{t}$ (witness affirms), $\mathbf{f}$ (witness denies), $\top$ (contradicting witnesses).

## Newly-designated cells

The cells that have ever been moved off $\bot$ during the settling are the **newly-designated cells** — the codebase's recorded content. Their values at the current stage constitute the [settling-associated sheaf](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) $\mathcal{F}^{\mathrm{code}}_U$.

The set of newly-designated cells is the substrate-algebraic content of "what the codebase is doing." Two codebase settlings with the same $\mathcal{F}^{\mathrm{code}}_U$ are observationally indistinguishable; the action of an automorphism of $v^{\mathrm{code}}$ on $\mathcal{F}^{\mathrm{code}}_U$ is what makes the automorphism *visible* or *invisible*.

## Witness-language parameterization

The above describes a *fully expanded* cell-system in which every imaginable predicate is in $\Pi_{\mathrm{code}}$ and every entity in $E_{\mathrm{code}}$. In practice, a project's tooling makes choices: it tracks `references` but not `documents`; it identifies definitions modulo formatting but not modulo whitespace; it observes test-pass but not test-runtime. These choices select a *witness sub-language* $W \subseteq \Pi_{\mathrm{code}} \times E_{\mathrm{code}} \times E_{\mathrm{code}}$, a sub-set of cell positions deemed witness-bearing.

The classification of automorphisms as visible/invisible is *relative to* $W$: an automorphism is invisible-under-$W$ iff it fixes every cell in $W$ that has been newly designated. Different choices of $W$ yield different invisible subgroups. This is the substrate-algebraic encoding of the disciplinary fact that "what counts as a refactoring depends on what we're testing." See [witness-language-relativity](../../documents/articles/research/2026/07/31/lenticule-import/computing/software/software-development/archive/teaching/explanations/witness-language-relativity.md).

## Where used

- [refactor-as-invisible-automorphism](../concepts/refactor-as-invisible-automorphism.md) — refactorings are the elements of $N(v^{\mathrm{code}})$ under the project's witness language.
- [rename](rename.md), [extract](extract.md), [inline](inline.md), [move](move.md) — each defined as a particular automorphism of the codebase cell-system.
