---
title: Audience and Task Analysis
aliases:
- Audience and Task Analysis
- audience and task analysis
date-created: 2026-03-06
description: "How to determine who your reader is, what they need, and how to structure documentation around their tasks rather than your knowledge."
tags:
- writing
- technical-writing
requires: []
teaches:
- "The three approaches to audience analysis: classification, intuition, and feedback"
- How to conduct a task analysis for procedural documentation
- How to write for readers you have never met
- Why writers systematically overestimate reader comprehension
type: lesson
keywords:
  - writing
  - technical-writing
---

## Assumed audience

- Reading level: comfortable writing prose; new to writing documentation for others.
- Background: has written essays or reports but not [procedural documentation](../../../glossary/terms/procedural-documentation.md) or reference material for unfamiliar readers.
- Goal: learn to analyze an audience and organize documentation around the reader's tasks.

## The fundamental problem

Technical writing exists because someone knows something another person needs. The writer's job is to close that gap. The difficulty is that the writer, by definition, stands on the far side of the gap — they already understand the material, and this understanding makes it hard to see what a reader who doesn't understand it actually needs.

[Karen Schriver](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/karen-schriver.md) demonstrated empirically that writers systematically overestimate how well readers understand their text [@schriver1997]. The gap between what the writer thinks they communicated and what the reader actually understood is consistent and large. This is not a failure of effort but a structural feature of expertise: the more you know about a subject, the harder it is to remember what it's like not to know it.

Technical writing's methods exist to counteract this structural disadvantage.

## Three approaches to audience analysis

Schriver identified three approaches to understanding readers [@schriver1997]:

**Classification-based analysis** groups readers by demographics — job role, education level, expertise with the subject. This is the quickest method and the most common. It answers questions like: Is this reader a novice or an expert? Do they have a technical background? What terminology can I assume they know?

Classification is useful but limited. It tells you about the reader's category, not about their experience with your specific document. Two software engineers may have the same job title and different mental models of the system you're documenting.

**Intuition-based analysis** imagines a specific reader and predicts what they'll understand and where they'll struggle. This is what most writers do by default — they picture a reader and write for that person. The problem, as Schriver's research showed, is that writers' intuitions about readers are often wrong. We imagine a reader much like ourselves, which leads us to assume shared knowledge that doesn't exist.

**Feedback-based analysis** tests the document with real readers. [Think-aloud protocols](../../../../../../plain-language-services-section/content/text/glossary/terms/think-aloud-protocol.md) — where a reader verbalizes their thought process while using a document — are the most revealing form. They show not just what the reader didn't understand but how they misunderstood, what they expected, and where the document's structure failed them.

Schriver's research found that feedback-based methods are the only ones that reliably reveal comprehension failures. Classification and intuition can guide a first draft; feedback should inform revision.

## Task analysis

[Task analysis](../../../../../../plain-language-services-section/content/text/glossary/terms/task-analysis.md) breaks a process into the steps a reader needs to follow. It is the foundation of [procedural documentation](../../../glossary/terms/procedural-documentation.md) — instructions, how-tos, tutorials.

The procedure for conducting a task analysis:

1. **Identify the goal.** What should the reader be able to do after following the instructions?
2. **List the steps.** Perform the task yourself (or observe someone performing it) and record every action. Include actions that feel obvious — they may not be obvious to the reader.
3. **Order by dependency.** Steps must be sequenced so that each step is possible given the preceding ones. This ordering follows the task's logic, not the writer's reasoning process.
4. **Identify prerequisites.** What must the reader have (tools, permissions, prior knowledge) before they begin?
5. **Identify decision points.** Where might the reader need to choose between options? What information do they need to make that choice?
6. **Test the sequence.** Have someone unfamiliar with the task follow the steps. Where they hesitate, ask an unexpected question, or fail — those are the steps that need revision.

The most common failure in task analysis is what [Linda Flower](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/linda-flower.md) called [writer-based prose](../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/writer-based-prose.md): organizing the steps around the writer's understanding rather than the reader's needs [@flowerhayes1981]. A writer who understands a system may organize instructions by system component ("First, configure the database; then, configure the server; then, configure the client") when the reader's task cuts across components ("To add a new user, do X in the database, then Y on the server, then Z in the client").

## Writing for unknown readers

Much technical documentation is written for readers the writer will never meet. The [plain language specification](../../../topics/plain-language/index.md) defines a default [audience](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/audience.md) for this vault: an adult reader with general literacy, no specialized background, and a practical reason for reading. When the audience is more specific, an "Assumed audience" section at the top of the document declares it.

The principle behind this practice: make the reader's expected knowledge explicit. If the document assumes the reader knows Python, say so. If it assumes the reader has administrative access, say so. Unstated assumptions are where readers fall through the cracks.

[Janice Redish](../../../../../../../../../../knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/janice-redish.md) argued that the test for technical writing is use, not comprehension: can the reader do what they came to do? [@redish2012]. This standard shifts the writer's focus from "did I explain it correctly?" to "can the reader use it?" — a shift that surfaces different problems and leads to different revisions.

## Guidance

- Before writing, answer three questions: Who is reading this? What are they trying to do? What do they already know? If you can't answer these questions, you're not ready to write.
- Draft based on classification and intuition. Revise based on feedback. Even one test reader reveals problems you didn't anticipate.
- When writing for unknown readers, state your assumptions explicitly in an "Assumed audience" section. This is a courtesy that lets the reader self-select — if the assumptions don't match, they know immediately.
- Watch for the curse of knowledge. If you find yourself writing "simply do X" or "just configure Y," the word *simply* or *just* is a signal that you're skipping steps the reader may need.

## Related terms

- [audience](../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/audience.md)
- [task analysis](../../../../../../plain-language-services-section/content/text/glossary/terms/task-analysis.md)
- [writer-based prose](../../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/writer-based-prose.md)
- [usability testing](../../../../../../plain-language-services-section/content/text/glossary/terms/usability-testing.md)
- [protocol-aided audience analysis](../../../../../../plain-language-services-section/content/text/glossary/terms/protocol-aided-audience-analysis.md)
- [procedural documentation](../../../glossary/terms/procedural-documentation.md)
