---
name: agent-resource-file
description: A markdown-resource-file that additionally carries the predication cells characteristic of the agent form — identity, capability, governance-regime, and authorization predications that make an entity dispatchable.
specializing: markdown-resource-file
realizing: agent
references:
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
title: agent-resource-file
derives-from: agent
---

An **agent-resource-file** is a markdown-resource-file $F$ whose frontmatter mapping contains the predication cells characteristic of the agent form: an identity key (`name` or equivalent), an agent-kind cell, a governance-regime cell, and a (possibly-empty) list of capability cells naming the skills the agent invokes.

The joint type is the pullback [@maclane1971, ch. III §3] in the diagram $$\begin{array}{ccc} \mathbf{AgentResourceFile} & \longrightarrow & \mathbf{Agent} \\ \downarrow & & \downarrow \\ \mathbf{MarkdownResourceFile} & \xrightarrow{\;\rho\;} & \mathbf{Agent} \end{array}$$ where the realizing functor $\rho$ projects the frontmatter cells onto the components of an agent — its identity, its capability bag, its authorization closure, and its declared governance regime.

A single agent-resource-file typically also instantiates other entity-forms — for example a character-form on the same record — because the agent form is one of several forms an entity bears jointly.
The realizing cell here records the projection to the agent components of the joint instantiation, not a claim that the file realizes only an agent.
