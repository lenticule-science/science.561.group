---
type: theorem
class: structural
status: proved
depends-on:
  - ../objects/fars-lint-as-closure-operator.md
  - ../objects/validation-rule.md
  - ../../../objects/relation-graph.md
see-also:
  - frontmatter-relation-graph-acyclic-modulo-see-also.md
  - ../objects/validation-rule.md
  - ../objects/fars-lint-as-closure-operator.md
title: Theory-discipline conformance is decidable
description: Let $V$ be a finite vault and let $\mathcal{R}$ be a finite closure-rule-system — that is, a finite set of validation rules, each of which is a decidable predicate on its scope (a single note, a note-pair, an induced subgraph, or the…
---

# Theory-discipline conformance is decidable

## Statement

Let $V$ be a finite [vault](../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/markdown-services-section/content/text/glossary/terms/vault.md) and let $\mathcal{R}$ be a finite [closure-rule-system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) — that is, a finite set of [validation rules](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/validation-rule.md), each of which is a decidable predicate on its scope (a single note, a note-pair, an induced subgraph, or the whole relation graph). Then the question "*does $V$ satisfy every rule in $\mathcal{R}$?*" — equivalently, "*is $V$ a fixed point of the [FARS lint operator](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/fars-lint-as-closure-operator.md) with empty witness set?*" — is decidable.

## Proof

The vault $V$ is finite by assumption. The relation graph $G_V = (N, E, \tau)$ derived from $V$ is therefore finite: $|N|$ is the number of notes, and $|E| \leq |N|^2 \cdot |R|$ where $R$ is the (finite) set of relation types the discipline commits to.

Each validation rule $\varphi = (s, c, w) \in \mathcal{R}$ has:

- A *scope* $s$ that picks out a finite set of instances in $V$. The four scope types — `note`, `note-pair`, `subgraph`, `vault` — each yield a finite enumeration over the finite vault: $|N|$ note-instances, $|E|$ note-pair instances, finitely many subgraph instances per pattern (since the pattern has bounded size), one vault instance.
- A *check* $c$ that is decidable on instances of $s$ by hypothesis. Each check terminates in finite time.

The FARS lint operator $L$ applied to $V$ enumerates each rule's instances, applies the check, and accumulates witnesses. Because (rule set) $\times$ (instances per rule) $\times$ (check time per instance) are all finite, $L$ terminates.

Conformance is the predicate "$\mathrm{defects}(V) = \varnothing$", which is decided by checking whether $L$'s output witness set is empty. This is itself a finite-time check (constant time given $L$'s output). $\square$

## Discussion

The proof is short because the substantive content is loaded into the hypotheses: the vault is finite (true by construction — a vault is a finite directory tree of finite-size notes); the rule system is finite (a discipline-level commitment); each check is decidable (a per-rule commitment, enforced when a rule is added).

What the theorem does *not* claim:

- **Not "the discipline is checkable in practice."** The theorem gives finite-time termination, not polynomial-time termination. Some scope types (especially `subgraph` patterns and `vault`-scoped rules with quadratic enumeration) can produce expensive checks. Practical conformance-checking depends on incremental linting via [relation-graph-update](../terms/relation-graph-update.md).
- **Not "the discipline is consistent."** The theorem says one can decide *whether* a vault satisfies the rules; it does not say the rule system is internally consistent (no two rules contradict each other). Internal consistency is a separate question about the rule system.
- **Not "every defect is detected."** The theorem is *relative to the rule system*: it decides conformance to whatever rules are in $\mathcal{R}$. Defects the rule system does not check are not detected. Completeness of the rule system relative to the discipline's intent is a separate (harder) question.

What the theorem *does* license:

- The discipline can be checked in finite time on any concrete vault. The check terminates; the user always gets an answer.
- The check can be packaged as a CI gate: every commit to the vault triggers a finite-time check that either passes (conformant) or emits a finite list of witnesses (the defects to fix).
- The conformance predicate is monotone in the rule system: adding rules can only add defects; removing rules can only remove them. This is what allows the rule system to evolve incrementally without breaking already-conformant vaults.

## Position in the discipline

This theorem is the foundation for treating the curation discipline as a *checkable* discipline rather than as a stylistic exhortation. Without decidability, the discipline would be aspirational: a contributor could be told their note is "non-conformant" but not given a finite witness; a CI pipeline could not gate on it. Decidability is what makes the discipline operationally serious.

The theorem also supports the bilattice-valuation reading of the discipline at [predicated-knowledge-systems](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/predicated-knowledge-systems): each predication cell in the predication graph is licensed or refuted by a finite check, which is exactly the kind of cell the bilattice can carry valuations for.
