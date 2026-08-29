---
title: Generated Music & Sonic Spaces
status: someday
keywords:
  - idea
  - generated-music
  - audio
---
# Idea: Generated Music & Sonic Spaces

Represent generative music systems as recognitions so you can explore and relate
sonic structures across domains.

## 1. Recognitions

- `GeneratorRecognition`
  - algorithm or model for music generation (rules, ML model, Markov chain,
    etc.).
  - fields: input features, controllable parameters, training data references.
- `SeedRecognition`
  - seeds/prompts (melodic cells, rhythms, text prompts, environmental data).
- `TrackRecognition`
  - generated outputs (audio, MIDI, symbolic scores) with metadata.
- `SonicSpaceRecognition`
  - collections of tracks/parameters describing a “region” of the generative
    space (e.g., calm ambient, fractal chaos).

## 2. Measurement and topology

- Measurement:
  - tempo, density, dissonance, repetition, perceived mood/energy,
  - listener feedback (likes, “focus-friendly”, “overwhelming”).
- Topology:
  - neighborhoods in parameter space,
  - motifs shared across tracks and domains (e.g., motifs that recur in dreams
    or writing).

Runbooks like `generate_track`, `explore_sonic_space`, `align_music_to_state`
can connect generated music to context (time of day, mood, MUD events, etc.).
