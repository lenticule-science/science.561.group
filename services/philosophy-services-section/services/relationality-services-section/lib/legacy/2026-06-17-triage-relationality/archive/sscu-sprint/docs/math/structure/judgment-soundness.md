---
title: Judgment Calculus Soundness
role: structure
derived_from:
- acts/sound-syntax
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Metatheory of the internal judgment calculus: preservation and progress earned
by `SoundSyntax`, `PreserveTyping`, and `ProgressTyping`.

## Components

- Preservation: if `Γ ⊢ t : A` and `t → t'` (relational evaluation), then
  `Γ ⊢ t' : A`.
- Progress: every well-typed closed term is either a value or can take a
  relational evaluation step.

## Proof

Sketch: `SoundSyntax` sets admissible derivations; `PreserveTyping` and
`ProgressTyping` acts witness preservation and progress for the earned
evaluation relation and typing judgments. Combine to obtain soundness for the
judgment calculus.
