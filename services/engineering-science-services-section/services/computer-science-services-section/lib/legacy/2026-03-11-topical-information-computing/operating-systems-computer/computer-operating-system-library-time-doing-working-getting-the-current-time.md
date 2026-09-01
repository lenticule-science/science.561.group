---
name: getting-the-current-time
description: Returns the current ISO 8601 timestamp. Use when a skill needs a timestamp without taking one from the caller.
---

## Requirements

- No arguments are required.
- The host JavaScript runtime has access to `Date`.

## Steps

1. Construct a new JavaScript `Date`.
2. Convert it to an ISO 8601 string with `toISOString()`.
3. Return `{ ts }`.

## Outcomes

- The caller receives `{ ts: "<ISO 8601 string>" }`.
- The skill performs no file or substrate writes.
