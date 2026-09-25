---
name: fars-terms-audit
date-created: 2026-04-05
plan: fars-core-extraction
task: fars-core-extraction-audit
scope: operations/engineering/fars/docs/terms/
total-terms: 119
ship-as-is: 11
ship-with-summary: 68
dont-ship: 40
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: fars-terms-audit
description: Audit of the 119 FARS spec terms for user-readability.
---

Audit of the 119 FARS spec terms for user-readability. Each term categorized for shipping to the library as published knowledge.

**Criteria:**
- **ship-as-is**: Clear, well-written, accessible to a reader with no background in the repo's math framework. Leads with plain English. Can go to `library/` now.
- **ship-with-summary**: Good-to-excellent content grounded in real disciplinary theory, but leads with formal mathematical definitions or dense jargon. Needs a 2-4 sentence plain-English summary paragraph at top before the formal definition. The content itself is valuable and publishable.
- **dont-ship**: Too implementation-specific (FARS file conventions), deprecated, or too rough for an outside reader. Stays in `operations/`.

---

## Ship-As-Is (11 terms)

These terms are clean, well-written, and accessible. They define concepts in plain English with examples and contrasts. Ready for the library now.

| Term | Lines | Issues | Recommended Action |
|------|-------|--------|-------------------|
| [derivation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/derivation.md) | 39 | None | Move to library/theories/humanities/theories/sociology/theories/work/terms/ |
| [inquiry](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/inquiry.md) | 46 | None — excellent Dewey/Peirce/Hintikka grounding | Move to library work domain |
| [process](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/process.md) | 39 | None | Move to library work domain |
| [procedure](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) | 40 | None | Move to library work domain |
| [method](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/method.md) | 35 | None | Move to library work domain |
| [practice](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/practice.md) | 37 | None | Move to library work domain |
| [work](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/work.md) | 29 | None — concise and clean | Move to library work domain |
| [task](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/task.md) | 32 | None | Move to library work domain |
| [workflow](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/workflow.md) | 33 | Moderate — mentions Petri nets without intro | Move to library work domain |
| [endeavor](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/endeavor.md) | 75 | None — good etymology, clear distinctions | Move to library work domain |
| [objective](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/objective.md) | 94 | None | Move to library work domain |

---

## Ship-With-Summary (68 terms)

Excellent content — deeply researched, grounded in real legal, philosophical, and organizational theory. But each leads with formal mathematical definitions ($\sigma_t$, $\Delta_t$, Heyting algebras, nuclear quartets) that will lose a general reader. Each needs a 2-4 sentence plain-English summary paragraph inserted before the formal definition.

### Core Governance Terms (27)

| Term | Lines | Issues | Recommended Action |
|------|-------|--------|-------------------|
| [accountability](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/accountability.md) | 145 | Leads with formal triple; great Navy Regulations grounding | Add summary: "Accountability is being answerable for everything that happens in your scope, regardless of who caused it." |
| [amendment](../../../../../../../../../social-science-services-section/content/text/glossary/terms/amendment.md) | 81 | Leads with morphism definition | Add summary about changing governing rules while preserving community identity |
| [breach](../../../../../../../../../social-science-services-section/content/text/glossary/terms/breach.md) | 146 | Very long; shadow class section is deep | Add summary: "A breach is a failure to meet an obligation by its deadline." Trim Hurwitz section for library |
| [charter](../../../../../../../../../social-science-services-section/content/text/glossary/terms/charter.md) | 131 | Very long; partition function section is deep math | Add summary: "A charter constitutes a community and declares its governing policies." Trim thermodynamics |
| [clerk](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/clerk.md) | 111 | Good — etymology section is excellent | Add summary: "A clerk records and authenticates institutional decisions without making them." |
| [company](../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/company.md) | 187 | Extremely long; diagonal witness section very technical | Add summary; consider splitting nuclear derivation to separate text |
| [constitution](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/constitution.md) | 102 | Good Searle grounding | Add summary: "Constitution is the 'X counts as Y in context C' relation." |
| [contract](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/contract.md) | 246 | Extremely long; excellent multi-domain coverage (law, CS, category theory, game theory) | Add summary; possibly split domain instances into separate texts |
| [custody](../../../../../../../../../social-science-services-section/content/text/glossary/terms/custody.md) | 135 | Good bailment coverage; quiescence section is deep | Add summary: "Custody is possession without ownership — holding something with a duty of care." |
| [delegation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/delegation.md) | 132 | Good — clear authority/accountability asymmetry | Add summary: "Authority transfers through delegation; accountability does not." |
| [discharge](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/discharge.md) | 96 | Good — execution/recognition gap is clear | Add summary about performance + recognition = discharge |
| [duty](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/duty.md) | 136 | Good Hohfeldian grounding | Add summary: "A duty is a positional obligation — what you must do because of where you stand." |
| [enrollment](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/enrollment.md) | 100 | Good section reading; somewhat specialized | Add summary about joining a crew for a bounded period |
| [enterprise](../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/enterprise.md) | 201 | Extremely long; excellent Lakatos/MacIntyre/Penrose synthesis | Add summary; consider trimming Day convolution for library |
| [institution](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/institution.md) | 60+ | Dense; good Searle/North/Hodgson coverage | Add summary: "An institution is a system of constitutive rules maintained by collective acceptance." |
| [investiture](../../../../../../../../../social-science-services-section/content/text/glossary/terms/investiture.md) | 60+ | Good — STCW formulation is excellent | Add summary: "Authority transfers only through a formal ceremony, not by proximity or rank." |
| [judgment](../../../../../../../../../social-science-services-section/content/text/glossary/terms/judgment.md) | 182 | Excellent — Aristotle, admin law, Auftragstaktik | Add summary: "Judgment is selecting an action within your authority, guided by purpose and situation." |
| [jurisdiction](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/jurisdiction.md) | 60+ | Good three-type breakdown | Add summary: "Jurisdiction is where and over what an authority's powers apply." |
| [leitourgia](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/leitourgia.md) | 60+ | Very specialized; Athenian liturgy concept | Add summary: "Leitourgia is obligatory public service performed at personal cost." |
| [mandate](../../../../../../../../../social-science-services-section/content/text/glossary/terms/mandate.md) | 60+ | Clean formal definition | Add summary: "A mandate is a required act — no discretion, refusal is violation." |
| [norm](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/norm.md) | 60+ | Good Kelsen structure | Add summary: "A norm prescribes what agents should do; violated norms remain norms." |
| [norm-conflict](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/norm-conflict.md) | 60+ | Good taxonomy (4 types) | Add summary about incompatible obligations |
| [normative-system](../../../../../../../../../social-science-services-section/content/text/glossary/terms/normative-system.md) | 60+ | Good formal tuple | Add summary: "A normative system specifies agent types, roles, scenes, and deontic constraints." |
| [polity](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/polity.md) | 133 | Good | Add summary about bounded normative communities |
| [precedent](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/precedent.md) | 142 | Good | Add summary about past decisions grounding present reasoning |
| [standing](../../../../../../../../../social-science-services-section/content/text/glossary/terms/standing.md) | 108 | Moderate math | Add summary: "Standing is who gets to participate in a normative forum." |
| [status-function-declaration](../../../../../../../../../social-science-services-section/content/text/glossary/terms/status-function-declaration.md) | 134 | Good Searle grounding, low math | Add summary: "The speech act that makes something count as something else." |

### Office and Personnel Terms (12)

| Term | Lines | Issues | Recommended Action |
|------|-------|--------|-------------------|
| [clerk](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/clerk.md) | 111 | (see above) | (see above) |
| [incumbent](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/incumbent.md) | 136 | Excellent Kantorowicz/two-body doctrine | Add summary: "An incumbent is the person currently holding an office." |
| [office](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/office.md) | 209 | Long; excellent content | Add summary: "An office is a position whose norms are determined by the place, not the person." |
| [officium](../../../../../../../../../social-science-services-section/content/text/glossary/terms/officium.md) | 96 | Good | Add summary: "Officium is obligation arising from station rather than universal moral law." |
| [principal](../../../../../../../../../social-science-services-section/content/text/glossary/terms/principal.md) | 4500+ | Extremely long — by far the largest file | Needs aggressive trimming for library; core concept is clear but buried |
| [role](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/role.md) | 182 | Mathematical | Add summary: "A role is a capability signature plus a set of norms." |
| [secretary](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/secretary.md) | 120 | Moderate math | Add summary about the confidential record-keeper |
| [serving](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/serving.md) | 102 | Coalgebra section is deep | Add summary: "Serving is occupying a position and fulfilling its obligations." |
| [staff](../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/staff.md) | 177 | Mathematical | Add summary about ongoing personnel |
| [steward](../../../../../../../../../social-science-services-section/content/text/glossary/terms/steward.md) | 110 | Good | Add summary: "A steward manages another's resources by delegated authority with genuine judgment." |
| [trustee](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/trustee.md) | 116 | Mathematical | Add summary about holding property for beneficiaries |
| [skills](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/skills.md) | 80 | Moderate math | Add summary: "A skill is a named, documented method for one unit of agent judgment." |

### Hohfeldian Position Terms (10)

These form a coherent family. All have "What this is" sections but lead with formal notation.

| Term | Lines | Issues | Recommended Action |
|------|-------|--------|-------------------|
| [hohfeldian-position](../../../../../../../../../social-science-services-section/content/text/glossary/terms/hohfeldian-position.md) | ~150 | Central term; needs to be most accessible | Add summary: "The eight fundamental legal positions that describe all normative relationships." |
| [hohfeldian-appeal](../../../../../../../../../social-science-services-section/content/text/glossary/terms/hohfeldian-appeal.md) | 159 | Mathematical | Add summary about requesting review of a normative position |
| [hohfeldian-assignment](../../../../../../../../../social-science-services-section/content/text/glossary/terms/hohfeldian-assignment.md) | ~112 | Mathematical | Add summary |
| [hohfeldian-estoppel](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-estoppel.md) | ~100 | Mathematical | Add summary |
| [hohfeldian-novation](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-novation.md) | ~100 | Mathematical | Add summary |
| [hohfeldian-ratification](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-ratification.md) | ~100 | Mathematical | Add summary |
| [hohfeldian-relief](../../../../../../../../../social-science-services-section/content/text/glossary/terms/hohfeldian-relief.md) | ~100 | Mathematical | Add summary |
| [hohfeldian-revocation](../../../../../../../../../social-science-services-section/content/text/glossary/terms/hohfeldian-revocation.md) | ~100 | Mathematical | Add summary |
| [hohfeldian-succession](../../../../../../../../../social-science-services-section/content/text/glossary/terms/hohfeldian-succession.md) | ~100 | Mathematical | Add summary |
| [hohfeldian-waiver](../../../../../../../../../social-science-services-section/content/text/glossary/terms/hohfeldian-waiver.md) | 132 | Mathematical | Add summary |

### Jurisdictional Terms (5)

| Term | Lines | Issues | Recommended Action |
|------|-------|--------|-------------------|
| [jurisdictional-declination](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/jurisdictional-declination.md) | ~90 | Mathematical | Add summary |
| [jurisdictional-excess](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/jurisdictional-excess.md) | ~90 | Mathematical | Add summary |
| [jurisdictional-invocation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/jurisdictional-invocation.md) | ~90 | Mathematical | Add summary |
| [jurisdictional-submission](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/jurisdictional-submission.md) | ~90 | Mathematical | Add summary |
| [jurisdictional-vires](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/jurisdictional-vires.md) | 104 | Mathematical | Add summary about scope and limits of delegated authority |

### Structural / System Terms (14)

| Term | Lines | Issues | Recommended Action |
|------|-------|--------|-------------------|
| [accord](../../../../../../../../../social-science-services-section/content/text/glossary/terms/accord.md) | 69 | Very mathematical — sheaf theory | Add summary: "An accord is a coherent arrangement where local observations agree globally." |
| [flatfile-agential-resource-system](../../documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/library/flatfile-agential-resource-system/flatfile-agential-resource-system.md) | 144 | Central term; reasonably accessible already | Add summary: "FARS is the flatfile substrate on which institutions run — markdown, YAML, and git." |
| [focus](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/focus.md) | 196 | Very long; excellent Gurwitsch/James/Husserl grounding | Add summary: "Focus is the designated current working position, with context radiating outward." |
| [gap](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/gap.md) | 232 | Very long and mathematical | Add summary: "A gap measures how far something is from being fully settled." |
| [lawful-claim](../../../../../../../../../social-science-services-section/content/text/glossary/terms/lawful-claim.md) | 128 | Mathematical | Add summary |
| [macrofocus](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/macrofocus.md) | 114 | Low math | Add summary |
| [mesofocus](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/mesofocus.md) | 103 | Low math | Add summary |
| [microfocus](../../../../../../../../../social-science-services-section/content/text/glossary/terms/microfocus.md) | 98 | Low math | Add summary |
| [operation-item](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/operation-item.md) | 88 | Mathematical (initial algebra) | Add summary |
| [plan](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/plan.md) | 156 | Low math | Add summary |
| [project](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/project.md) | 80 | Low math | Add summary |
| [refocusing](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/refocusing.md) | 102 | Mathematical | Add summary |
| [runbook](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/engineering/fars/docs/terms/runbook.md) | 184 | Mathematical (trace monoid, Foata normal form) | Add summary: "A runbook is a declarative workflow triggered by a norm." |
| [work-item](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md) | 75 | Low math | Add summary |
| [work-unit](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-unit.md) | 53 | Moderate math (free algebra) | Add summary |

---

## Don't Ship (40 terms)

Internal FARS implementation details — file conventions, frontmatter field specs, deprecated terms. Stay in `operations/`.

### FARS Implementation Terms (38)

| Term | Lines | Reason |
|------|-------|--------|
| flatfile-agential-resource-system-agent | 89 | FARS-specific agent concept |
| flatfile-agential-resource-system-agent-loop | 126 | Implementation pattern |
| flatfile-agential-resource-system-blueprint | 68 | FARS entity growth stage |
| flatfile-agential-resource-system-charter | 76 | FARS entity growth stage |
| flatfile-agential-resource-system-closure-kind | 58 | YAML frontmatter field spec |
| flatfile-agential-resource-system-context-entry | 73 | Internal data format |
| flatfile-agential-resource-system-date | 46 | Frontmatter convention |
| flatfile-agential-resource-system-defines | 40 | Frontmatter convention |
| flatfile-agential-resource-system-describes | 51 | Frontmatter convention |
| flatfile-agential-resource-system-given | 56 | Frontmatter convention |
| flatfile-agential-resource-system-grounding-claim | 89 | Internal data format |
| flatfile-agential-resource-system-history | 100 | Conjectural git-mapping |
| flatfile-agential-resource-system-idea | 83 | Internal data format |
| flatfile-agential-resource-system-improving | 91 | Internal work pattern |
| flatfile-agential-resource-system-locale | 108 | FARS entity growth stage |
| flatfile-agential-resource-system-math-entity | 114 | Math file convention |
| flatfile-agential-resource-system-math-entity-name | 55 | Naming convention |
| flatfile-agential-resource-system-math-unit | 33 | **Deprecated** — renamed to math-entity |
| flatfile-agential-resource-system-math-unit-name | 30 | **Deprecated** — renamed to math-entity-name |
| flatfile-agential-resource-system-memory-entry | 70 | Internal data format |
| flatfile-agential-resource-system-message | 114 | Internal data format |
| flatfile-agential-resource-system-naming-math-unit | 236 | Naming convention |
| flatfile-agential-resource-system-officer | 66 | FARS-specific officer binding |
| flatfile-agential-resource-system-operation | 52 | Internal encoding spec |
| flatfile-agential-resource-system-outpost | 67 | FARS entity growth stage |
| flatfile-agential-resource-system-params | 101 | Frontmatter convention |
| flatfile-agential-resource-system-prompt-unit | 72 | Internal transient data type |
| flatfile-agential-resource-system-proof-skill-object-types | 138 | Internal skill chain types |
| flatfile-agential-resource-system-related | 96 | Frontmatter convention |
| flatfile-agential-resource-system-relation | 79 | Frontmatter convention |
| flatfile-agential-resource-system-runbook | 211 | FARS-specific runbook encoding |
| flatfile-agential-resource-system-script | 50 | File type convention |
| flatfile-agential-resource-system-settlement-metadata | 87 | Frontmatter convention |
| flatfile-agential-resource-system-shape | 50 | SHACL shape convention |
| flatfile-agential-resource-system-skill-result | 78 | Internal return type |
| flatfile-agential-resource-system-skillful-work | 61 | FARS-specific work pattern |
| flatfile-agential-resource-system-specification | 72 | File type convention |
| flatfile-agential-resource-system-wind-down-workflow | 52 | Session management workflow |
| flatfile-agential-resource-system-working | 57 | Internal work mode |
| flatfile-agential-resource-system-c4-diagram | 224 | Architecture diagram — useful internally but not a term definition |

---

## Summary Statistics

| Category | Count | % |
|----------|-------|---|
| Ship-as-is | 11 | 9% |
| Ship-with-summary | 68 | 57% |
| Don't ship | 40 | 34% |
| **Total** | **119** | **100%** |

## Key Findings

1. **The work-type lattice is ready now.** The four work types (process, procedure, derivation, inquiry) plus work, task, workflow, method, practice, endeavor, and objective are clean, well-written terms that can move to the library immediately. They form a coherent family.

2. **The governance vocabulary is excellent but inaccessible.** Terms like accountability, duty, delegation, charter, institution, and enterprise contain publishable-quality synthesis of real disciplinary theory (Hohfeld, Searle, MacIntyre, Lakatos, Penrose, Aristotle, administrative law, maritime regulations). The content is better than most encyclopedia entries. But each leads with formal mathematical notation that will lose any reader who doesn't already know the repo's framework.

3. **The fix is consistent and mechanical.** Every ship-with-summary term needs the same intervention: a 2-4 sentence plain-English summary before the formal definition. The existing "What this is" sections are often good but appear too late in the file, after dense frontmatter and formal tuples.

4. **Principal is an outlier at 4500+ lines.** It needs structural decomposition, not just a summary paragraph.

5. **The 40 dont-ship terms are genuinely internal.** They specify FARS frontmatter conventions, file naming rules, and internal data formats. None of them define concepts an outside reader would look up.

6. **The Hohfeldian and jurisdictional families should ship as groups.** The 10 Hohfeldian terms and 5 jurisdictional terms are coherent families that should be published together with an overview text introducing the framework.

## Recommended Priority Order

1. Move the 11 ship-as-is work-type terms to library (low effort, immediate value)
2. Add summaries to the 27 core governance terms (high value, moderate effort)
3. Add summaries to the 10 Hohfeldian terms as a batch (coherent family)
4. Add summaries to remaining ship-with-summary terms
5. Decompose principal.md
