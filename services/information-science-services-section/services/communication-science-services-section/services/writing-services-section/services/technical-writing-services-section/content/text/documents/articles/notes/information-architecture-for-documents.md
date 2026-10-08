---
title: Information Architecture for Documents
aliases:
- Information Architecture for Documents
- information architecture for documents
date-created: 2026-03-06
description: "How to organize a document so readers can find what they need — using headings, progressive disclosure, and structural conventions that match reader expectations."
tags:
- writing
- technical-writing
requires:
- /writing/disciplines/technical-writing/curricula/audience-and-task-analysis.md
teaches:
- How to structure documents around reader tasks rather than writer knowledge
- How headings, lists, and tables serve as navigation aids
- How progressive disclosure controls cognitive load
- How genre conventions create reader expectations
type: lesson
keywords:
  - writing
  - technical-writing
---

## Assumed audience

- Reading level: comfortable writing documentation; has completed "Audience and Task Analysis."
- Background: understands audience analysis and task analysis.
- Goal: learn to organize documents so readers can find and use the information they need.

## Readers don't read — they scan

Technical documents are not read from beginning to end. Readers scan for the section relevant to their current task, read that section, and leave. [Janice Redish](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/janice-redish.md) argued that web content should be treated as a user interface — readers interact with it the way they interact with software, and the same usability principles apply [@redish2012].

This means the document's structure is at least as important as its prose. A clearly written paragraph buried under a vague heading is a clearly written paragraph nobody finds.

## Headings as navigation

Headings are not decorations. They are the reader's primary navigation system. A reader scanning a document reads headings first and decides whether to read the text beneath them.

Effective headings:
- **Describe content, not category.** "Configuring the database" is more useful than "Configuration." "How to add a new user" is more useful than "User management."
- **Use parallel structure.** If one heading starts with a gerund ("Configuring..."), others at the same level should too. Parallel structure signals that items at the same level are the same kind of thing.
- **Follow a consistent hierarchy.** H2 headings are sections; H3 headings are subsections. Skipping levels (H2 to H4) breaks the document's logical structure and confuses both human readers and screen readers.
- **Make the document scannable.** A reader should be able to read only the headings and understand the document's structure and scope.

## Lists and tables

Lists and tables are not formatting choices — they are structural decisions about how information relates.

**Use a list when** items are parallel — they're the same kind of thing (steps, features, requirements). Numbered lists imply sequence; bulleted lists imply no particular order.

**Use a table when** items have multiple attributes that the reader needs to compare. A table's power is in its columns — each column is a dimension of comparison. If your "table" has only one column of content, it should be a list.

**Don't use a list or table when** the relationship between items is causal, conditional, or argumentative. Prose handles these relationships; lists flatten them.

## Progressive disclosure

[Progressive disclosure](../../../../../../plain-language-services-section/content/text/glossary/terms/progressive-disclosure.md) presents information in layers — the essential first, the detailed second, the edge cases third. It manages [cognitive load](../../../../../../plain-language-services-section/content/text/glossary/terms/cognitive-load.md) by not presenting everything at once.

In document structure, progressive disclosure means:
- **Lead with the goal.** Start each section by telling the reader what it covers and why it matters.
- **Put the common case first.** Document the typical workflow before the exceptions.
- **Nest complexity.** Details, caveats, and edge cases go in subsections, footnotes, or expandable content — not in the main flow.
- **Link to depth.** If a topic has its own page, link to it rather than reproducing it. The reader who needs depth will follow the link; the reader who doesn't will keep moving.

[John Carroll](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/john-carroll.md)'s minimalist documentation research found that readers learn faster from stripped-down materials than from comprehensive manuals [@carroll1990]. The implication is counterintuitive: less documentation, better organized, outperforms more documentation poorly organized.

## Genre as architecture

[Carolyn Miller](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/carolyn-miller.md) defined genres as "typified rhetorical actions" — recurring situations that produce recurring forms [@miller1984]. In technical writing, this means that content types (term definitions, tutorials, reference pages, how-tos) carry structural expectations. A reader who opens a how-to expects numbered steps; a reader who opens a reference page expects a systematic listing of options.

These expectations are architectural. When a document follows its genre's conventions, the reader can navigate it using prior experience with similar documents. When it departs from convention — a how-to organized as an essay, a reference page written as a narrative — the reader loses that navigational advantage.

The content types in this vault are genres in Miller's sense:
- **Term definitions**: opening definition sentence, elaboration paragraphs, related terms.
- **Lessons**: assumed audience, substantive sections building toward understanding, guidance section.
- **Index pages**: brief description, entries list with enough context to orient.

Following these patterns consistently is not rigidity — it's architecture. Each page is easier to write and easier to navigate because it follows a known form.

## Guidance

- After drafting, read only the headings. If they don't tell the document's story on their own, revise them.
- Use the "five-second test": show the document to someone for five seconds. Can they tell you what it's about and where to find the main content? If not, the structure needs work.
- When a section grows beyond a screen of text, consider whether it should be split into subsections or broken into a separate page.
- Before adding a section, ask: does the reader need this to complete their task? If not, move it to an appendix, a linked page, or nowhere.

## Related terms

- [information architecture](../../../glossary/terms/information-architecture.md)
- [progressive disclosure](../../../../../../plain-language-services-section/content/text/glossary/terms/progressive-disclosure.md)
- [cognitive load](../../../../../../plain-language-services-section/content/text/glossary/terms/cognitive-load.md)
- [genre](../../../../../../rhetoric-and-composition-services-section/content/text/glossary/terms/genre.md)
- [minimalism](../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/minimalism.md)
- [document design](../../../../../../plain-language-services-section/content/text/glossary/terms/document-design.md)
