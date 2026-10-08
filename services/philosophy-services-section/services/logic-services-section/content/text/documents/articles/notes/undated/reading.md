---
name: reading
gerund: reading
agent-noun: reader
imperative: read
description: Loading the bytes of a named artifact into a working location and returning the bytes as content addressable downstream.
title: reading
---

A read transformer. Input is a source location. Output is the source's current bytes together with a witness record naming the source, the read timestamp, and any decode performed.

## Domain and codomain

- **Domain:** a read-spec — a tuple of `(source-location, decode)` where source-location is an addressable location and decode is the (possibly identity) function that maps the source's storage encoding to the in-process value (UTF-8 text, JSON, YAML, binary).
- **Codomain:** a witness record carrying the decoded content, the source-location, the read timestamp, and the decode applied.

## Morphological forms in naming grammar

- `gerund: reading` heads skills built on this transformer: `reading-the-latest-diary-entry`, etc.
- `agent-noun: reader` heads agents that invoke such skills: `reader-of-the-latest-diary-entry`, etc.
- `imperative: read` heads scripts that body such skills: `read-the-latest-diary-entry.mjs`, etc.
