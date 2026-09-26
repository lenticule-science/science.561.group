---

description: "A reusable body of knowledge that an agent loads on demand to perform a specific kind of work — the unit of learned competence in an agentic system."
aliases: [ skills, Apply 3D Printing Safety Checks, make-specification ]
made-of: [knowledge, procedure, judgment]
distinguished-from: [tool, command, rule, hook]
used-by: agent
component-of: [workflow, endeavor]
instances: [writing-skill, verification-skill, research-skill]
date-created: 2026-04-01
---

A skill is a reusable body of knowledge that an [agent](./agent.md) loads on demand to perform a specific kind of work. A [tool](../../../../humanities/domains/philosophy/terms/tool.md) extends what an agent can do. A skill shapes how the agent does it. A hammer lets you drive nails; knowing carpentry tells you where to put them.

The distinction between tool and skill runs through every domain that studies competence. Aristotle distinguished *technē* (the knowledge of how to produce something) from the instruments used in production. A surgeon's scalpel is a tool; the surgeon's knowledge of anatomy, trained judgment about when to cut, and practiced hand are skills. Gilbert Ryle, in *The Concept of Mind* (1949), formalized this as the difference between "knowing that" (propositional knowledge) and "knowing how" (practical competence). A skill is knowing how — it cannot be fully captured in a set of propositions, though propositions can guide its development.

In agentic systems, a skill is a file that encodes domain-specific knowledge for an agent to use during a particular kind of work. In Claude Code, skills live in `.claude/skills/` and are loaded when their activation conditions match. A skill differs from a [command](command.md) in that a command is a single named operation, while a skill is a body of knowledge that may guide many operations. A skill differs from a [rule](../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/rule.md) in that a rule is always active, while a skill is loaded on demand. A skill differs from a [hook](./hook.md) in that a hook fires automatically on a system event, while a skill is activated by context matching.

A skill has three components. Knowledge: the facts and distinctions the agent needs — what counts as good work in this domain, what the common errors are, what the standards require. Procedure: the sequence of actions that typically produces good results — what to do first, what to check, when to stop. Judgment: the criteria for making decisions the procedure doesn't fully determine — when to deviate from the standard approach, when something is good enough, when to ask for help.

The maturation of a skill follows a progression observed across human expertise research. Stuart Edward Dreyfus and Hubert Lederer Dreyfus described five stages in *Mind Over Machine* (1986): novice (follows rules rigidly), advanced beginner (recognizes situational elements), competent (plans and prioritizes), proficient (sees patterns intuitively), and expert (acts fluidly without deliberation). An agentic skill file encodes competence at one level of this progression — typically the competent or proficient stage, where the knowledge can be articulated as guidelines and criteria rather than rigid rules or inarticulate intuition.

Creates a new specification by:
1. Running the scaffold script to generate the directory and template
2. Guiding the agent through filling each TODO section
3. Validating the spec against the normative scaffold

This skill exists to prevent agents from reading
specification-specification each time they write a specification.
The scaffold script encodes the normative scaffold (A.1-A.10) as a
template; this skill encodes the content-filling process.

From `$ARGUMENTS`, extract:
- **spec-id**: kebab-case identifier (e.g., `semiotic-citation`)
- **category**: `format` or `convention` (default: convention)
- **source material**: paths to triage files or existing docs that
  inform the spec's content

```bash
cd content
python technology/specifications/specification-specification/scripts/scaffold-specification.py \
  SPEC_ID --category CATEGORY
```

This creates `technology/specifications/SPEC_ID/index.md` with all
sections from the specification-specification normative scaffold
(A.1-A.10) pre-filled as TODO markers. Convention specs omit A.2,
A.7, A.9 per specification-specification §0.

If source material paths were provided, read each file. Extract:
- Key concepts and vocabulary
- Existing practices being codified
- Normative constraints already in use
- Terms that need glossary entries

Do NOT copy source material into the spec. The spec defines normative
rules; source material provides context for what those rules should be.

Open the scaffolded `index.md` and replace each TODO section:

**§0 Scope**: What does this spec apply to? Name directories, file
types, practices, or actors. One paragraph.

**§1 What X is**: Define the core concept in 2-4 paragraphs. What is
it? Why does it exist? What problem does it solve?

**§2+ Normative sections**: The main content. Rules for how things
work. Follow these patterns:
- Number every rule
- Use MUST/SHOULD/MAY per RFC 2119
- Prefer tables for structured information
- Prefer lists for sequential procedures
- One concept per section
- Each rule should be independently testable

**Glossary**: Define every term used normatively. Bulleted list.

**Rationale**: Why these rules? What practice does this codify?
Non-normative, concise.

**Relationship to other specs**: What does this spec require, extend,
or relate to?

After filling, check the spec against specification-specification
A.1-A.10:
- [ ] A.1: Frontmatter has spec-id, version, stability
- [ ] A.3: Error semantics defined (classes, schema)
- [ ] A.4: Conformance matrix maps each MUST/SHOULD/MAY to actors
- [ ] A.6: Security considerations addressed (format) or noted
- [ ] A.10: Glossary defines normative terms; rationale exists;
      all examples marked normative or informative
- [ ] Scope section declares format or convention
- [ ] Opening paragraph states what the spec is
- [ ] (Format only) A.2: CANON(x) defined; A.7: determinism stated;
      A.9: formal artifacts provided

If the specification belongs to a larger system that maintains a
registry or dependency map, update those registrations. The specifics
depend on the context in which the specification is being created.

State:
- The spec-id and title
- The file path
- How many normative sections were written
- What source material was used
- What registration was done

- Identify any small parts that fit inside a 31 mm by 57 mm cylinder (choking hazard).
- If a part is a choking hazard, emboss a warning on the part or include the warning in packaging notes.
- Note sharp edges, pinch points, or heat risks if the part will be handled during use.
- Record hazards and mitigations in the project notes before sharing or printing.

Create a specification: $ARGUMENTS
