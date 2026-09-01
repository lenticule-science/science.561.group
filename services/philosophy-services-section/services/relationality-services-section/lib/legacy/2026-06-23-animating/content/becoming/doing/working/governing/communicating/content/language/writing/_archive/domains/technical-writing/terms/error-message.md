---
name: "Error Message"
aliases:
  - "Error Message"
  - "error message"
  - "error messages"
date-created: 2026-03-06
tags: []
---

An ***error message*** is a piece of writing that tells a user something went wrong and, ideally, what to do about it. Error messages are among the most frequently read and least carefully written texts in software — and among the most consequential, because they appear at the exact moment the user is frustrated and needs help.

A good error message has three components:

1. **What happened** — a clear statement of the problem in language the user understands. "Connection timed out" is better than "Error 504." "Your password must be at least 8 characters" is better than "Invalid input."
2. **Why it happened** — enough context for the user to understand the cause, when the cause isn't obvious. "The file is too large (maximum 10 MB)" tells the user something they can act on.
3. **What to do next** — a specific action the user can take to resolve the problem. "Try again in a few minutes" or "Check your internet connection" or "Contact support at [link]." An error message that identifies the problem but offers no path forward leaves the user stuck.

Common failures:

- **Technical jargon** — error codes, stack traces, or system terminology that means nothing to the user. Internal errors should be logged for developers, not displayed to users.
- **Blaming the user** — "You entered an invalid date" vs. "Please enter a date in MM/DD/YYYY format." The second version helps; the first one scolds.
- **Vagueness** — "Something went wrong" tells the user nothing and offers no help. If you can't be specific about the error, be specific about the next step.
- **Missing errors** — the worst error message is the one that doesn't appear. A system that fails silently leaves the user confused about whether their action worked.

Error messages are a microcosm of technical writing: they must be clear, specific, and useful under the worst possible conditions — when the user is already frustrated and has the least patience for bad writing.

## Related terms

- [audience](../../../terms/audience.md) — error messages are written for users at their least patient
- [readability](../../../terms/readability.md) — clarity matters most when the reader is stressed
- [procedural documentation](./procedural-documentation.md) — an error message's "what to do next" is a micro-procedure
- [cognitive load](../../../terms/cognitive-load.md) — error messages should minimize the effort required to recover
