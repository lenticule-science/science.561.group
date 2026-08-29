---
name: integrate-cross-domain-concept
description: Integrate a concept from an external domain into the semiotic-endeavor specification, abstracting it from domain-specific framing into endeavor vocabulary
---

Integrate: $ARGUMENTS

## Instructions

### 1. Identify the concept and its source

Determine:
- **What concept**: the specific idea to integrate
- **Source domain**: where it comes from (a discipline, a derivation
  source per decision 0007, a practice tradition)
- **Source material**: existing content about this concept. Search
  `content/` for the concept name, related terms, and the source
  domain.

### 2. Understand the concept in its source context

Read the source material. Identify:
- What the concept means in its original domain
- What vocabulary it uses (domain-specific terms)
- What problem it solves in its original context

Do NOT skip this step. Understanding the source context prevents
shallow integration that loses the concept's substance.

### 3. Abstract to endeavor vocabulary

Rewrite the concept's core contribution using semiotic-endeavor
vocabulary. The question is: **what does this concept tell us about
how endeavors work?**

Mapping strategy:
- Source-specific terms → endeavor equivalents
- Source-specific constraints → endeavor constraints
- Source-specific examples → endeavor examples (or omit if none fit)

The abstraction must preserve the concept's force — what it rules
out, what it requires, what it makes possible. A good integration
adds something the endeavor spec didn't say before.

### 4. Determine where it fits in the spec

Read the semiotic-endeavor index at
`technology/specifications/semiotic-endeavor/index.md`.

Find the section where the concept belongs. Common targets:
- Aspects of method (§4): if the concept describes a method component
- Method evolution (§5): if the concept describes how methods change
- Multi-agent coordination (§6): if the concept describes coordination
- Temporality (§7): if the concept describes process or time structure
- Closure conditions (§8): if the concept describes completion

If no section fits, the concept may need a new section or may belong
as a standalone text rather than a spec addition.

### 5. Write the integration

Add a subsection to the appropriate spec section. Format:

```markdown
### {Concept name}

{2-3 paragraphs integrating the concept at the endeavor level.
First paragraph: what the concept is. Second paragraph: what it
means for endeavors. Third paragraph (optional): what it rules out
or distinguishes.}
```

### 6. Create supporting artifacts

For each new term introduced by the integration:
- Run `/write-term-or-concept` to create a term file at the correct
  layer
- If the term already exists, check whether the integration changes
  its definition

### 7. Update tracking texts

- **Cross-domain derivation text**: add the integration to the
  "What has been integrated" section. If no derivation text exists
  for this source domain, run `/write-derivation-text` first.
- **Gap analysis**: if a gap analysis exists, mark the relevant gap
  as ADDRESSED. Add new gaps revealed by the integration.
- **Spec version**: bump the spec's patch version if the integration
  adds a subsection.

### 8. Report

State:
- What was integrated and from where
- Where it was placed in the spec
- What terms were created
- What gaps were addressed and what new gaps were revealed

## Anti-slop checklist

- The integration uses endeavor vocabulary, not source-domain jargon
- The integration adds something the spec didn't say before (not
  just restating existing content in different words)
- The source domain's specific examples are not presented as
  universal truths
- Terms introduced by the integration have their own term files
- The derivation text and gap analysis are both updated
- The spec version is bumped
