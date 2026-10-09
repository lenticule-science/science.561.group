---
title: Critical Lenses, Affect, and Assemblages
status: someday
keywords:
  - idea
  - critical-theory
  - genre
  - affect
  - assemblage
description: "To translate how people see/feel the world into the relational manifold, we need recognitions that can hold cultural complexity: genre, affect, power, and assemblages of many heterogeneous elements."
---
# Idea: Critical Lenses, Affect, and Assemblages

To translate how people see/feel the world into the relational manifold, we need
recognitions that can hold cultural complexity: genre, affect, power, and
assemblages of many heterogeneous elements.

This note sketches a richer vocabulary.

## 1. Genre & discourse recognitions

- `GenreRecognition`
  - a socially recognizable way of speaking/writing/performing: explainer,
    shitpost, field note, manifesto, diary, sermon, rant, lab report, etc.
  - fields: name, conventions (structure, voice, audience expectations), typical
    domains.
  - topology: relations (e.g., “this text blends diary and field note”).

- `DiscourseMoveRecognition`
  - local moves inside a text/speech: hedging, asserting, confessing,
    inviting, exhorting, joking, speculating.
  - linked to fragments of content (sentences, paragraphs, turns in a dialogue).

Use cases:

- your author-agent newsletters pick a `GenreRecognition` and a mix of
  `DiscourseMoveRecognition` when writing,
- analysis runbooks can detect/annotate genres and moves in incoming content
  (newsfeeds, ActivityPub, MUD logs).

## 2. Affect & stance recognitions

- `AffectStateRecognition`
  - emotional/energetic state associated with:
    - a text, event, recognition cluster, or your own state.
  - fields: labels (calm, anxious, playful, angry, mournful, etc.), intensity,
    valence, bodily sensations (optional).

- `StanceRecognition`
  - orientation toward the subject: reverent, skeptical, ironic, caretaking,
    militant, detached, curious.

Measurement:

- time series of affect states around domains (news, health, MUD),
- association between stances and outcomes (does “snarky” coverage lead to
  action or freeze?).

Agents:

- can be constrained to certain stance/affect ranges,
- can query your current `AffectStateRecognition` to choose how/when to speak.

## 3. Critical lenses and power structures

- `LensRecognition`
  - a critical lens: Marxist, feminist, decolonial, disability, queer,
    ecological, etc.
  - fields: what it tends to foreground (labor, care, extraction, access,
    normativity, colonial history).

- `PowerStructureRecognition`
  - structured description of who benefits, who is harmed, who is invisible in
    a situation:
    - actors, resources, norms, exclusions.

- `LensApplicationRecognition`
  - applying a lens to a cluster of recognitions:
    - what is highlighted, what feels missing, what tensions appear.

Runbooks:

- `analyze_with_lens(domain_slice, lens_id)`,
- `surface_hidden_costs`,
- `map_benefit_harm`.

These can be required steps before agents recommend actions in domains like
finance, governance, ecology, or even MUD design.

## 4. Assemblages as recognitions

Following Deleuze/Guattari-like “assemblage” thinking, we want a way to say:

> “This situation is made of these heterogeneous pieces, held together in this
>  way, doing this kind of work.”

- `AssemblageRecognition`
  - a tightly or loosely coupled configuration of recognitions:
    - elements: a set of recognitions (people, policies, infrastructures,
      stories, symbols, bodies, technologies, etc.),
    - relations: which acts/norms bind them (flows, contracts, habits,
      dependencies),
    - function: what this assemblage *does* (stabilizes X, extracts Y, silences
      Z, enables care of Q).

- `AssemblageElementRoleRecognition`
  - roles elements play inside an assemblage (e.g., “bottleneck”, “glue”,
    “resource”, “boundary object”).

Topology:

- assemblages overlap, nest, and change over time;
- you can trace how a project, a policy, or a MUD region is really an
  assemblage of recognitions from many domains.

Measurement:

- stability, fragility, diffusion of power, potential points of transformation.

## 5. Cultural metrics beyond “engagement”

- `RepresentationRecognition`
  - who/what appears in a slice (axes like gender, race, ability, species,
    region), linked to your own vocabulary, not enforced categories.

- `ImpactRecognition`
  - assessed or experienced impact of some content/decision:
    - stress, hope, confusion, mobilization, resignation.

- `NormShiftRecognition`
  - recognitions that track when patterns suggest norms are changing:
    - e.g., how often certain assumptions show up unquestioned vs challenged.

These recognitions let you measure your media/newsfeeds/projects not just in
clicks, but in terms of who is seen, how people feel, and how norms move.

## 6. Agents that respect these structures

Once these recognitions exist:

- author/analyst agents can:
  - choose genres and stances explicitly,
  - run critical lenses before summarizing,
  - annotate power structures and assemblages in their output.

- monitoring agents can:
  - watch for skew in representation,
  - flag when certain voices or impacts are systematically ignored,
  - suggest runbooks to rebalance (e.g., highlight underrepresented sources,
    slow down overwhelming feeds).

The aim is not to fully encode critical theory, but to give the system enough
structures that it can *notice and respect* the kinds of complexity critical
theory points to, rather than flattening everything into “content” and
“engagement.”
