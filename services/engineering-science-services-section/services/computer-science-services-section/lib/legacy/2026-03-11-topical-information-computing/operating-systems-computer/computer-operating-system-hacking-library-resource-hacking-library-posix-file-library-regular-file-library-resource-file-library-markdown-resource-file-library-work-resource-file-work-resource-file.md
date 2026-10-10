---
name: work-resource-file
description: A markdown-resource-file recording a unit of work — a task, mission, milestone, project, or assignment — with its goal, status, and decomposition.
specializing: markdown-resource-file
realizing: work
references:
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
---

A **work-resource-file** is a markdown-resource-file $F$ whose frontmatter mapping carries the predication cells characteristic of a work item: an identity (`name` or `title`), a description naming the goal, and a lifecycle `status` drawn from the work-form's admissible states (`open`, `in-progress`, `blocked`, `closed`, or equivalent).
The frontmatter may additionally carry a decomposition cell listing sub-work items, an ordering cell listing dependency predecessors, and an owner cell naming the responsible agent.

The joint type is the pullback [@maclane1971, ch. III §3] in the diagram $$\begin{array}{ccc} \mathbf{WorkResourceFile} & \longrightarrow & \mathbf{Work} \\ \downarrow & & \downarrow \\ \mathbf{MarkdownResourceFile} & \xrightarrow{\;\rho\;} & \mathbf{Work} \end{array}$$ where the realizing functor $\rho$ projects the frontmatter cells onto the components of a work item — its identity, its goal, its lifecycle state, its decomposition tree, its ordering relations, and its ownership.

The body is the human-and-agent-readable specification of what the work entails: the context that frames the goal, the criteria by which completion is judged, and the artifacts the work is expected to produce.
