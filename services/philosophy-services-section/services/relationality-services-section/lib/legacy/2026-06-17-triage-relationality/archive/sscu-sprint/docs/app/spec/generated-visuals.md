---
title: Generated Visuals & Worlds
keywords:
  - idea
  - generated-visuals
  - imagery
part-of: relational-computer
description: "Treats generated images and environments as recognitions so visual worlds sit in the relational lattice."
---
# Idea: Generated Visuals & Worlds

Treat generated images/environments as recognitions so visual worlds sit inside
the same relational lattice.

## 1. Recognitions

- `VisualGeneratorRecognition`
  - algorithm/model for image/world generation (procedural terrain, GANs,
    diffusion models).
- `PromptRecognition`
  - text/parameter prompts, reference images, conditioning signals (e.g.,
    weather data, recognitions from other domains).
- `ImageRecognition` / `SceneRecognition`
  - generated outputs with metadata (resolution, style, content tags).
- `VisualStyleRecognition`
  - clusters of outputs representing a style/family.

## 2. Measurement and topology

- Measurement:
  - complexity, symmetry, color distributions, perceived affect,
  - reaction metrics (which images people linger on, reuse in writing/MUD).
- Topology:
  - style spaces, morph paths between scenes,
  - links to other recognitions (places, dreams, symbols, MUD rooms).

Runbooks: `generate_image`, `generate_scene_for_recognition`, `explore_style`
let you weave visuals into narrative, research, or gameplay.

