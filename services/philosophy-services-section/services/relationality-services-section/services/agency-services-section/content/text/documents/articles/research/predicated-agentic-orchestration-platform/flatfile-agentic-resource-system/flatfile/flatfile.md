---
name: flatfile
description: "FARS's commitment to what the predication-graph store is, concretely: a directory tree on a filesystem where each .md file is exactly one entity."
type: concept
class: substrate-realization
instantiates: [predication-graph-store]
depends-on: [predication-substrate, source-of-truth]
see-also: [frontmatter-as-presentation]
title: flatfile
---

# Flatfile

FARS's commitment to *what the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) is, concretely*: a directory tree on a filesystem where each `.md` file is exactly one entity.
The file's path is the entity's address (under canonicalization rules); the file's frontmatter is the entity's bundle of predications-in-presentation-form (per [frontmatter-as-presentation](frontmatter-as-presentation/frontmatter-as-presentation.md)); the file's body is the entity's human-readable rendering.

A flatfile substrate has three distinguishing properties relative to alternative substrate realizations (event log, relational store, in-memory graph):

- **The file IS the entity.** There SHALL be no separate ID-to-file mapping, no row-as-entity translation.
  The entity's persistent existence is *the existence of the file*.
  Editing the file is editing the entity; deleting the file retracts the entity; renaming the file changes the entity's address (and any references to that address SHALL be updated through the substrate's [traversal](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) operator, not by string replacement on the file content).
  This realizes [source-of-truth](../../../../teaching/explanations/source-of-truth.md): the filesystem is authoritative; any cache (sqlite index, in-memory graph, content-addressed projection) is reconstructed from it.

- **The substrate is human-editable through ordinary tools.** A flatfile substrate is a corpus a human can read with any text editor and a directory listing; a human edit is a substrate edit.
  This is the engineering content of "agents and humans operate on the same substrate" — the substrate's affordances SHALL NOT be gated through the substrate's operator API.
  A consequence: the substrate's [closure rules](../../../../teaching/explanations/closure-rule.md) SHALL tolerate edits that arrive without going through the substrate's operators, and the [two-store coherence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/two-store-coherence.md) discipline applies in the file-first reading.

- **The substrate is a directory tree, not a flat collection.** The filesystem's directory structure is itself part of the substrate's content: a file's enclosing directory predicates *something* about the file (its kind, its scope, its position in a subdivision).
  A flatfile substrate MAY be a single directory at one level, but in practice the tree carries non-trivial predication.
  A `concepts/widget.md` is at minimum told `kind=concept` by its path; a `scope/library/widget.md` is told `scope=library`.
  The substrate's [identity-by-relations](../../../../teaching/explanations/identity-by-relations.md) discipline subsumes these: path-derived predicates are predicates like any other.

## What flatfile is not

- **Not "a database that uses files."** A database that stores rows as JSON files in a directory has a separate row-to-content translation; the flatfile substrate has none — the file's content *is* the entity's predications in presentation form, with no translation layer between the filesystem and the substrate.

- **Not bound to one filesystem.** A flatfile substrate MAY live on any filesystem-shaped store (POSIX filesystem, an Obsidian vault, a Git working tree, a content-addressed store mounted as files).
  The substrate's semantics survive each as long as the store presents a directory-of-files interface.

- **Not bound to markdown.** Markdown is the body format FARS uses by convention because the bodies are read by humans and by language models; the substrate's content is the frontmatter (in a structured mapping format, language-neutral) plus the body (in any format the realization's interpretation rules know how to read predications from).
  A FARS realization that swaps markdown for `.org`, `.rst`, or plain text is conformant.

## Position

The flatfile concept is FARS's particular answer to *what is the predication-graph store, concretely?* — the question every AgOP realization must answer.
Peer AgOP realizations answer differently: [mash-rust-engine](../../mash-rust-engine/mash-rust-engine.md) answers "an in-memory EAVT graph backed by JSON serialization"; a hypothetical distributed realization might answer "rqlite tables under Raft consensus."
The choice has engineering consequences for the substrate's edit-discipline, its coherence requirements, and its concurrency model.
None of those choices change *what predications are*; they change *how the substrate stores them*.
