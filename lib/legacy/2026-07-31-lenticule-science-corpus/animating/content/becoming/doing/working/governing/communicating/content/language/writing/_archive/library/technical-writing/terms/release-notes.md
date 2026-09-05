---

name: "Release Notes"
aliases:
  - "Release Notes"
  - "release notes"
  - "changelog"
date-created: 2026-03-06
tags: []
---

***Release notes*** are documentation that describes what changed between one version of a system and the next. They serve readers who already use the system and need to know what's different — new features, fixed bugs, changed behavior, removed capabilities, and required actions.

Release notes sit at the intersection of technical writing and [audience](../../../../business/terms/audience.md) awareness. Their readers are not learning the system for the first time; they have existing mental models and workflows. The release notes must tell these readers what changed, why it changed, and what they need to do about it — without requiring them to relearn the entire system.

Effective release notes follow a predictable structure:

- **Version identifier and date** — which release this describes and when it was published.
- **Summary** — a one-paragraph overview of the most significant changes.
- **Categorized changes** — grouped by type: new features, improvements, bug fixes, breaking changes, deprecations. Breaking changes — anything that requires the reader to modify their existing usage — should be visually prominent.
- **Migration guidance** — for breaking changes, specific instructions for updating. This is [procedural documentation](./procedural-documentation.md) embedded within the release notes.

The most common failure in release notes is writing them for the development team rather than for users. "Refactored the authentication module" describes what the developers did; "Login now supports two-factor authentication" describes what the user gains. The reader's question is always "what does this mean for me?" — not "what did you do?"
