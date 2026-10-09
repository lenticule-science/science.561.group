---
title: "How to Detect Contradictions and Gaps in a Knowledge Base"
type: "text"
date-created: 2026-03-31
description: "A how-to guide: using the four epistemic states to find where a collection of assertions contradicts itself or is missing expected information."
---

Abstract

A how-to guide: using the four epistemic states to find where a collection of assertions contradicts itself or is missing expected information.

Table of contents

- [Assign epistemic states](#assign-epistemic-states)

- [Find contradictions: look for ⊤](#find-contradictions-look-for-)

- [Find gaps: look for ⊥ after closure](#find-gaps-look-for--after-closure)

- [Interpret the results](#interpret-the-results)

You have a collection of assertions — a database, a set of files with frontmatter, a knowledge graph. Some assertions may contradict each other. Some information may be missing. Here is how to find both using the four [epistemic states](../../../../../../../../../../../information-science-services-section/content/text/glossary/terms/epistemic-state.md).

## Assign epistemic states

For each entity-attribute pair in your data, assign one of four values:

- **⊥ (unknown)**: the attribute is not mentioned for this entity. No source has said anything.

- **t (affirmed)**: the attribute has a value. At least one source asserts it; no source denies it.

- **f (denied)**: the attribute is explicitly absent or negated. A source says this entity does NOT have this attribute.

- **⊤ (contested)**: different sources disagree. One says the attribute holds; another says it does not.

Most data systems only distinguish ⊥ (missing) and t (present). The four-valued system adds f (explicitly denied) and ⊤ (contradictory). These additional states are where the interesting information lives.

## Find contradictions: look for ⊤

A ⊤-valued entry means two sources disagree about this entity-attribute pair. This is a contradiction — not an error to be suppressed but information about where your knowledge system is under stress.

To find ⊤ systematically: for each attribute, collect all entities where multiple sources provide conflicting values. The entities with ⊤ are your contradiction set.

In a repository of Markdown files: if file A says `extends: lattice` and file B says `contrasts-with: lattice` for the same concept, the attribute &ldquo;relationship to lattice&rdquo; is ⊤ — both extension and opposition are asserted. This may be correct (a concept can both extend and contrast with something) or it may indicate confused terminology.

## Find gaps: look for ⊥ after closure

A ⊥-valued entry means no information is present. Before [closure](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/domains/algebra/terms/closure.md), this is normal — most entity-attribute pairs are simply unmentioned.

After closure — after you have propagated all inferrable information through the system — any remaining ⊥ within scope indicates a **gap**: the system&rsquo;s rules predict this information should exist, but it does not.

To find gaps: define the scope (which entity-attribute pairs SHOULD have values based on the system&rsquo;s structure), run closure (apply inference rules until no new values are produced), and check for ⊥ within scope.

In a repository: if every file with `type: paper` also has `authors` and `status`, but one paper file lacks `status`, the concept lattice shows this as a gap — the file breaks the pattern. It may be a draft that needs a status field, or an exception that is fine as-is. The lattice does not judge; it reports.

## Interpret the results

⊤ entries are not errors. They are places where your system holds multiple perspectives simultaneously. Whether this is a problem depends on what you are doing with the data:

- For a database that needs a single answer: ⊤ is a conflict to resolve.

- For a research repository tracking multiple interpretations: ⊤ is valuable — it records where the disagreement is.

- For an AI agent reading the system: ⊤ is a signal to investigate further, not a signal to crash.

⊥ entries after closure are places where your system is incomplete relative to its own patterns. They are questions the data raises but does not answer. Whether to fill them depends on whether the gap matters for your purpose.

The four-valued system does not tell you what to DO about contradictions and gaps. It tells you WHERE they are. That is its purpose: making the epistemic structure of your data visible so you can decide what to do about it.
