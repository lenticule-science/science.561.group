---
title: Phonology & Prosody
status: someday
keywords:
  - idea
  - linguistics
  - phonology
  - prosody
---
# Idea: Phonology & Prosody

Represent sounds and supra-segmental patterns so the system can reason about how
you (and others) *sound*, not just what you write.

## 1. Core recognitions

- `PhonemeRecognition`
  - abstract sound units for a language.
  - fields: IPA symbol, features (voicing, place, manner), examples.

- `AllophoneRecognition`
  - context-specific realizations of phonemes.
  - linked to `PhonemeRecognition` and environments.

- `ProsodyPatternRecognition`
  - patterns of intonation, stress, rhythm over an utterance.
  - fields: contour type (rising, falling, level), phrasing, prominence.

- `SpokenUtteranceRecognition`
  - audio-linked utterance:
    - waveform/feature refs, transcription(s), timing.

## 2. Measurement and topology

- Measurement:
  - speaking rate, pause distribution, pitch range, variability,
  - prosodic alignment with affect states (calm, anxious, excited).

- Topology:
  - maps from phonological space to sociolects/registers,
  - links between prosodic patterns and discourse moves (questions, emphasis).

## 3. Runbooks and uses

- `analyze_prosody(spoken_utterance_id)`,
- `summarize_speech_patterns(subject_slice)`,
- `align_agent_voice_to_prosody(style_profile)`.

This links audio, affect, style, and interpersonal communication.

