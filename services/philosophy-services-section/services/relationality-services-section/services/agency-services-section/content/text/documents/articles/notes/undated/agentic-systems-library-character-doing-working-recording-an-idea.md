---
name: recording-an-idea
description: Records an idea as a dated entry in the appropriate thing's `ideas.md` file. Use when capturing an idea that belongs to a specific subject in the content graph.
title: recording-an-idea
---

## Requirements

- The idea content to record
- The thing the idea belongs to (or enough context to find it with `find-thing`)
- Write access to `content/`

## Steps

1. Identify the thing the idea belongs to; use `find-thing` if needed.
2. Check whether `ideas.md` exists in the thing's directory.
3. If `ideas.md` does not exist, create it with frontmatter: `title: "Ideas — {thing title}"` and `date-created: {today}`.
4. Append the idea as a dated entry with the format: `## {date} — {brief title}` followed by the idea content.
5. Report the path written and what was recorded.

## Outcomes

- The idea is appended to `ideas.md` in the thing's directory as a dated entry.
- If `ideas.md` did not exist, it is created with correct frontmatter before the entry is added.
- The path and entry title are reported.
