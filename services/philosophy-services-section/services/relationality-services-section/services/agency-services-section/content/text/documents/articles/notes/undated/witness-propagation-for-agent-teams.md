---
title: "Witness Propagation for Agent Teams"
type: "guide"
keywords: ["agent-teams", "context-spacesuits", "descent-cohomology", "witness-propagation"]
status: "draft"
description: Agent teams do not merely share messages.
---

Agent teams do not merely share messages. In this library, a team is modeled as a communication topology whose nodes carry local cell-systems, channels carry restricted cell-types, and witness statements must propagate across that topology without producing unresolved inconsistency.

The shortest practical reading is this: a witness is an increment that enters one local view of an operations settling; propagation is the attempt to transport that increment through the team topology; clean propagation means the transported witness glues into one compatible global pattern; failed propagation leaves a first cohomology obstruction that later adjudication must resolve.

This guide links three source concepts that agents should keep together when working in the research library.

## Context Spacesuit

A [context spacesuit](../2026/04/06/2026-04-06-archive-context-spacesuits-in-agentic-ai.md) is the package of identity, constraints, capabilities, perception, and memory loaded around an agent before it acts. It determines what the agent can see and what actions are available. For research agents, a small precise suit matters because overloading a model with every nearby rule makes work expensive and less inspectable.

## Organization as Network Sheaf

[Organizations as bilattice network sheaves](../../teaching-articles/explanations/organizations-as-bilattice-network-sheaves.md) gives the operational setting. Agents, offices, or teams sit at vertices; channels carry selected cells; consensus is a global section; disagreement is a consistency failure over the cover. This makes organizational state computable from event logs, closure rules, and channel assignments instead of treating agreement as a subjective summary.

## Witness Propagation

[Witness-network propagation as fibration-comonad descent](../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/documents/articles/notes/undated/witness-network-propagation-as-fibration-comonad-descent.md) refines the multi-agent story. Broadcast, gossip, consensus, and eventual consistency are protocol choices about descent data. A protocol is descent-clean when transported witness data satisfies the cocycle condition across overlaps. When the cocycle fails, the failure is not vague noise; it is an inconsistency class that must decay through adjudication or remain as an acknowledged contradiction.

## Why Agents Need This

When an agent adds knowledge to the library, it should ask four questions.

1. What context spacesuit is being assumed for the acting agent?
2. Which local cell-system receives the witness?
3. Which channels should carry the witness to other views?
4. If propagation fails, what adjudication mode is expected to select the representative cell-pattern?

Those questions make the work legible. They distinguish a normal body link from a claimed dependency, a local observation from team consensus, and a draft witness from an adjudicated library concept.

## Library Practice

Write new curriculum pages with ordinary Markdown links to source documents. Use canonical tags for clustering and discovery. Do not encode local graph predicates such as `discusses` in frontmatter. If a relation needs to become durable, explain it in the body and let the normalization tooling move legacy relation values into tags while backlinks are computed from body links.