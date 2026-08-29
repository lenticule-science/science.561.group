---
title: "Theory discipline"
---

# Theory discipline

When is a directory of notes treated as a *theory*?

In this corpus's working sense, a *theory* is a directory committed to a particular subject, structured to develop that subject in the typed-note discipline, and accountable to its own coherence. Many directories in `theories/` are better described as *staging areas* on the way there, or as domain *containers* (an `_index.md` that organizes child theories without itself being one).

This note describes the characterization the curator uses when judging whether a directory is being treated as a theory, the layout typically used once it is, and the criterion under which a sub-directory of a theory has been promoted to its own theory.

## Characterization

The directories currently treated as theories tend to share these features:

1. **Subject.** A particular subject — a recognizable body of work with its own questions, vocabulary, and structural commitments — rather than "a folder of related notes."

2. **Vocabulary.** Concept notes in `concepts/` for the semantic anchors the theory recurs to. A directory whose vocabulary is borrowed wholesale from a parent is more naturally read as a sub-directory of that parent.

3. **Commitments.** Object notes in `objects/` and morphism notes in `morphisms/` for the definitions and operators the directory asserts as its own. A directory without its own objects and morphisms is closer in shape to a survey.

4. **Claims.** Theorem (or conjecture) notes in `theorems/` carrying an explicit `status:`. A directory making no claims has nothing for its theorems sub-directory to hold.

5. **Visible open work.** Either typed notes in `questions/`, or a stated frontier in `_index.md` for early-stage theories.

6. **Front door.** An `_index.md` that names the subject, states the theory's position relative to its parent, and lists the layout. (The predicated-computing subtree uses pre-existing `_index.md` front doors that are load-bearing in the citation graph and are kept as such; newer theories tend to use `_index.md`.)

These features are descriptive, not a checklist. A directory missing one or two is more often a staging area or a container than a defective theory.

## Canonical layout

The directory layout used by theories in this corpus — sub-directories present once they hold content, with each sub-directory's `_index.md` declaring its intent:

```
<theory>/
├── _index.md           # front door — subject, position, layout, status
├── concepts/           # concept notes (semantic anchors)
├── objects/            # object notes (type: definition)
├── morphisms/          # morphism notes
├── theorems/           # theorem notes
├── questions/          # question notes
├── narratives/         # narrative notes
├── examples/           # example notes
├── references/         # reference notes
│   └── sources/        # source PDFs / texts (where permitted)
├── theories/           # child theories (recursive)
├── tools/              # executable artifacts (scripts, validators, computations)
├── lean/               # formal verification (when applicable)
└── research.toml       # toolkit configuration (FARS, build, validators)
```

`lean/`, `research.toml`, and `tools/` only appear when a theory has formal verification or executable artifacts. The other sub-directories tend to be present once they hold content; a sub-directory may also be present as an empty `_index.md` declaring "open work tracked here" before any notes have been authored.

## Sub-directory promoted to child theory

A sub-directory of a theory has typically been promoted to its own child theory (under `theories/`) when its vocabulary, objects, morphisms, and claims have grown enough that they no longer fit cleanly inside the parent's layout, and when the cross-references between sub-directory and parent have settled into a structurally regular shape (the parent's concepts realized at the sub-directory's value-domain; the parent's morphisms instantiated at the sub-directory's substrate).

The worked exemplar is FARS as a child theory of agential-orchestration-platform — see [its README](../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/_index.md) for the explicit account of why it was lifted out and what cross-theory references it commits to.

## Container directories

A *container* directory organizes child theories or sub-disciplines without making structural commitments of its own. Containers in this corpus typically have:

- An `_index.md` naming what they contain.
- Sub-directories that are themselves theories or further containers.
- No `concepts/`, `objects/`, `morphisms/`, `theorems/`, `questions/`, etc. of their own.

`engineering/`, `humanities/`, and `humanities/theories/math/` are containers in this sense. `humanities/theories/math/theories/categories/theories/predication-categories/` is a theory.

## Examples in the corpus

The fully-worked exemplar is [predication-categories](../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md), whose `_index.md` states the discipline this spec generalizes. Within [predicated-computing](../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md), the [agential-orchestration-platform](../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/_index.md) and its child [flatfile-agentic-resource-system](../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/_index.md) carry the layout most fully; the latter's README is also the canonical statement of when a sub-directory has graduated to its own theory.

Many directories under `theories/` carry only a partial layout — concepts but no questions, theorems but no examples, and so on. Whether such a directory should be treated as a theory, a staging area, or a container is a per-directory judgment, not a corpus-wide checklist; the discipline above describes what makes the difference but does not prescribe which way any particular directory ought to move.
