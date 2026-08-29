---
title: "Flatfile"
description: "A flatfile storage system keeps all data as plain, human-readable files on disk — no binary formats, no running database process required to read them."
defines: Flatfile
related: FlatfileAgentialResourceSystem
date-modified: 2026-03-19
---

## What this is

A **flatfile** system stores data as plain, human-readable files — text, markdown, YAML, CSV, or similar.
No binary encoding.
No running database process required to read or write data.
Any tool that can open a file can read the data.

Data MUST be readable without a running server or database process.
Files MUST be human-readable in a text editor.
The file system is the storage layer — no separate data store.
A flatfile system MAY use YAML, TOML, or similar structured formats within files, and MAY use a read cache or index for query performance, provided the files remain the source of truth.

## Open questions
