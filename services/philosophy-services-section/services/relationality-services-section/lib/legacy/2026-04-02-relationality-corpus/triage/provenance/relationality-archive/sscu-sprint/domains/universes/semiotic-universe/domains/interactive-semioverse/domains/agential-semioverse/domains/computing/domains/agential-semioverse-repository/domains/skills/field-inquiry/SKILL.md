---
name: field-inquiry
description: Field an external inquiry — decompose into question objects, research each with primary sources, synthesize findings, produce an advisory report that addresses the questions
---

Field an inquiry: $ARGUMENTS

## Purpose

This skill handles the full pipeline from receiving a domain-specific
question (often compound, often from a third party) to producing a
research-backed advisory report. It encodes the routine practice of:
someone asks a messy question → agent decomposes, researches, and
synthesizes → questioner gets clear guidance.

Questions are first-class objects in this repository (see
[questions-as-first-class-objects](../../theory/questions-as-first-class-objects.md)).
This skill produces question files, not just chat text. Each
sub-question becomes a `type: question` file; the advisory report
declares which questions it `addresses:`. Question status is updated
as research proceeds.

## Instructions

### 1. Establish the domain frame

Identify the domain of the inquiry (e.g., "food truck regulation in
Michigan", "nonprofit tax compliance in Oregon"). The domain determines:
- What sources are authoritative
- What vocabulary is appropriate
- Which discipline's `questions/` directory will hold the question files

State the domain frame explicitly before proceeding. If the domain is
ambiguous, ask the user.

### 2. Decompose and register questions

Parse the raw question into discrete, atomic sub-questions. A compound
question like "can I do X and do I have to disclose Y" becomes two
separate questions.

#### 2a. Check existing questions

Before creating new question files, search the repository for existing
questions that match:
- Search `content/**/questions/*.md` for overlapping topics
- Check triage for relevant question files
- If an existing question matches a sub-question, reuse it instead of
  creating a duplicate

#### 2b. Create question files

For each sub-question that does not already exist as a question file,
create a `type: question` file in the appropriate discipline's
`questions/` directory.

Filename: kebab-case summary of the question (e.g.,
`vegan-cheese-ingredient-labeling.md`).

Frontmatter:

```yaml
---
title: "Is vegan cheese subject to ingredient labeling requirements?"
introduces: question
date-created: [today]
status: open
tags:
  - FoodRegulation
  - Labeling
description: "Whether vegan cheese must be separately disclosed as an ingredient under Michigan food labeling law."
---
```

Body: restate the question in full with any relevant context, framing,
or scope constraints. Note what kind of answer is needed (legal
requirement, best practice, strategic recommendation, factual
determination) and any assumptions or ambiguities.

#### 2c. Present the decomposition

Present the decomposition to the user before proceeding. Format:

```
## Question decomposition

Domain: [domain frame]

1. [Restated question 1] → [path/to/question-file.md] (new|existing)
   - Answer type: [legal requirement / best practice / ...]
   - Notes: [assumptions, ambiguities]

2. [Restated question 2] → [path/to/question-file.md] (new|existing)
   ...
```

Wait for user confirmation that the decomposition is correct. If they
correct or add questions, update the decomposition and question files.

### 3. Research each sub-question

For each sub-question, use web search to find primary source material.
Primary sources means: statutes, regulations, official guidance
documents, agency publications, case law. Secondary sources (news
articles, blog posts, forum answers) may supplement but should not be
the sole basis for findings.

Research strategy per question:
1. Search for the specific regulatory/legal framework
2. Search for the governing agency's official guidance
3. Search for relevant case law or enforcement actions
4. Note the jurisdiction and date of each source

Use parallel research agents when possible — each sub-question can be
researched independently.

### 4. Synthesize per-question findings

For each sub-question, produce a synthesis:
- What the primary sources say (with citations)
- What the answer is (clear, direct)
- What caveats or conditions apply
- Links to sources

Present each synthesis to the user in chat as a markdown code block.
Format:

````
```markdown
## Q1: [Restated question]
File: [path/to/question-file.md]

**Answer**: [Direct answer in 1-2 sentences]

**Findings**:
- [Finding 1] ([Source title](URL))
- [Finding 2] ([Source title](URL))

**Caveats**:
- [Caveat or condition]

**Sources**:
- [Full citation with URL]
```
````

After presenting each synthesis, update the question file's status:
- `status: partially-addressed` if findings are inconclusive or
  caveated
- `status: resolved` if the question has a clear, well-sourced answer

### 5. Produce the advisory report

After all per-question syntheses are complete, produce a complete
policy advisory report following the `write-advisory-report` skill
conventions. The report should:

- Open with a **lede** — the single most important thing the
  questioner needs to know, stated in plain language
- Include an **executive summary** with clear guidance
- Organize findings by question, not by source
- Provide **actionable recommendations** — what should the questioner
  do?
- Close with a **summary** restating the key guidance
- Cite all sources used

The report's frontmatter MUST include an `addresses:` field listing
the questions it addresses (by title string, matching the question
files):

```yaml
---
title: "Advisory: Food Truck Ingredient Labeling in Michigan"
form: text
addresses:
  - "Is vegan cheese subject to ingredient labeling requirements?"
  - "Must ingredient substitutions be disclosed to limit allergens?"
tags:
  - FoodRegulation
  - PolicyAdvisory
---
```

#### Open questions

If the research surfaces new questions that were not part of the
original inquiry, record them:
- Create `type: question` files with `status: open`
- List them in the report's **Open questions** section
- These become future inquiry starting points

File the report using `write-advisory-report` conventions.

### 6. Present the report

Present the final advisory report to the user in chat. The lede and
summary should be immediately visible (not buried in a code block).

Include a summary of all question objects created or updated:

```
## Question registry

- [path/to/q1.md] — status: resolved
- [path/to/q2.md] — status: partially-addressed
- [path/to/q3.md] — status: open (new, surfaced during research)
```

## Quality standards

- **Lede-first**: The most important guidance goes at the top, not
  after pages of methodology.
- **Plain language in guidance**: Legal citations support the answer;
  they don't replace it. The questioner should understand what to do
  without reading the statutes.
- **Source quality**: Prefer primary sources. Flag when only secondary
  sources were available.
- **Jurisdiction specificity**: Regulatory answers are jurisdiction-
  specific. Always state which jurisdiction's rules apply.
- **Date awareness**: Regulations change. Note the date of each source
  and flag if sources are more than 2 years old.
- **Question hygiene**: Do not create question files for trivial or
  factual sub-questions that are fully resolved inline. Only questions
  that merit tracking as independent objects — essential questions,
  research questions, unresolved problems — get files. See
  [questions-as-first-class-objects](../../theory/questions-as-first-class-objects.md).
- **Disclaimer**: The output is research assistance, not legal advice.
  Include this at the end of the advisory report.

## Example trigger

```
/field-inquiry
Domain: food truck regulation, State of Michigan
Question: "Is it legal to add vegan cheese to a sauce and list it as
an ingredient for upcharging? Do I have to disclose that the cheese
is vegan if I'm trying to limit lactose content?"
```
