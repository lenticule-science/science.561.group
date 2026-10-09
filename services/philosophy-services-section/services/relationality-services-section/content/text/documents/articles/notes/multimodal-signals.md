---
title: Multimodal Signals (Images, Audio, Video)
status: someday
keywords:
  - idea
  - multimodal
  - signals
description: Represent raw media signals in a way that ties them naturally into the relational graph.
---
# Idea: Multimodal Signals (Images, Audio, Video)

Represent raw media signals in a way that ties them naturally into the
relational graph.

## 1. Core recognitions

- `ImageSignalRecognition`
  - references to image data (path, hash) plus derived features (size, color
    histograms, objects detected).

- `AudioSignalRecognition`
  - references to audio (path, hash) plus features (spectrogram, pitch, tempo,
    timbre).

- `VideoSignalRecognition`
  - references to video plus derived keyframes, motion patterns, audio tracks.

## 2. Links to other recognitions

- All signal recognitions should:
  - link to semantic recognitions (objects, places, people, events),
  - link to embeddings (`EmbeddingVectorRecognition`),
  - participate in semiosis (as signs) and affect (how they feel).

## 3. Runbooks and uses

- `analyze_image(image_signal_id)`,
- `analyze_audio(audio_signal_id)`,
- `extract_multimodal_features(video_signal_id)`.

This lets images/audio/video sit alongside text, math, and other data as
first-class citizens in your universe.
