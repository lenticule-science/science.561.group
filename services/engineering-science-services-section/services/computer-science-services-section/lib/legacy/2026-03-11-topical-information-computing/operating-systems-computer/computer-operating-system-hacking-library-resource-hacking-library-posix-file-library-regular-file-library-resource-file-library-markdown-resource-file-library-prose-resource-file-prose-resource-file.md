---
name: prose-resource-file
description: A markdown-resource-file under prose/ whose body is human-and-agent-readable exposition — an explanation, tutorial, guide, reference, claim, question, or survey.
specializing: markdown-resource-file
realizing: prose
references:
  procida2017:
    class: online
    authors: ["Procida, Daniele"]
    year: 2017
    title: "Diátaxis: a systematic framework for technical documentation"
    url: "https://diataxis.fr/"
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
---

A **prose-resource-file** is a markdown-resource-file $F$ whose role is the human-and-agent-readable exposition of an idea, a claim, a procedural narration, or a research question.
The frontmatter mapping carries an identity (`name` or `title`), a description, and any typed-signature cells the prose form admits (`status`, `depends-on`, `relates-to`, and similar — each resolving to a transformer record).

The body's permissible shapes are partitioned per the Diátaxis four-mode taxonomy [@procida2017]: *explanation* (theory-oriented, why-something-is), *tutorial* (learning-oriented, lessons-by-doing), *how-to-guide* (task-oriented, step-by-step), *reference* (information-oriented, look-up).
Prose records that pose unresolved decisions (questions) or assert single propositions (claims) extend this taxonomy with two additional shapes natural to research workflow.

The joint type is the pullback [@maclane1971, ch. III §3] in the diagram $$\begin{array}{ccc} \mathbf{ProseResourceFile} & \longrightarrow & \mathbf{Prose} \\ \downarrow & & \downarrow \\ \mathbf{MarkdownResourceFile} & \xrightarrow{\;\rho\;} & \mathbf{Prose} \end{array}$$ where the realizing functor $\rho$ projects the frontmatter onto the prose record's identity and lifecycle, and the body onto the prose's exposition under its shape.
