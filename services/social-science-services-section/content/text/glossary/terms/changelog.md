---

name: "Changelog"
description: "A ***changelog*** is a chronological record of changes to a project, product, or system. It differs from [release notes](release-notes.md) in scope and audience: release notes announce a specific version to users and emphasize what they need to know or do; a changelog records all notable changes over time, often for a more technical audience that includes both users and contributors."
aliases:
  - "Changelog"
  - "changelog"
  - "change log"
  - "CHANGELOG"
date-created: 2026-03-06
tags: []
---

A ***changelog*** is a chronological record of changes to a project, product, or system. It differs from [release notes](release-notes.md) in scope and audience: release notes announce a specific version to users and emphasize what they need to know or do; a changelog records all notable changes over time, often for a more technical audience that includes both users and contributors.

A changelog entry typically includes:

- **Version number or date** — identifying when the change was made.
- **Category** — what kind of change it was. The most common categories are: *Added* (new features), *Changed* (modifications to existing behavior), *Fixed* (bug corrections), *Removed* (features or capabilities that no longer exist), and *Deprecated* (features that still work but will be removed in a future version).
- **Description** — what changed, stated in terms of what the reader will notice. "Fixed a bug where exported CSVs contained duplicate headers" is useful; "Fixed issue #4231" is not — unless the reader can follow the link.

The changelog's value is predictability. A reader who checks the changelog before upgrading can anticipate what will break, what will improve, and what they need to change. This is why the most important changelog entries are *Changed* (behavior the reader relied on now works differently) and *Removed* (something the reader may depend on is gone). *Added* entries are good news; *Changed* and *Removed* entries are actionable.

The "Keep a Changelog" convention (keepachangelog.com) codifies these practices and is widely adopted in open-source projects. Its core principle is that changelogs are for humans, not machines — a principle that aligns with this vault's approach to [plain language](../../../topics/plain-language/index.md).

---

## Supplementary formulation

```yaml
---
name: "Changelog"
aliases:
  - "Changelog"
  - "changelog"
  - "change log"
  - "CHANGELOG"
date-created: 2026-03-06
tags: []
---
```

A ***changelog*** is a chronological record of changes to a project, product, or system. It differs from [release notes](release-notes.md) in scope and audience: release notes announce a specific version to users and emphasize what they need to know or do; a changelog records all notable changes over time, often for a more technical audience that includes both users and contributors.

A changelog entry typically includes:

- **Version number or date** — identifying when the change was made.
- **Category** — what kind of change it was. The most common categories are: *Added* (new features), *Changed* (modifications to existing behavior), *Fixed* (bug corrections), *Removed* (features or capabilities that no longer exist), and *Deprecated* (features that still work but will be removed in a future version).
- **Description** — what changed, stated in terms of what the reader will notice. "Fixed a bug where exported CSVs contained duplicate headers" is useful; "Fixed issue #4231" is not — unless the reader can follow the link.

The changelog's value is predictability. A reader who checks the changelog before upgrading can anticipate what will break, what will improve, and what they need to change. This is why the most important changelog entries are *Changed* (behavior the reader relied on now works differently) and *Removed* (something the reader may depend on is gone). *Added* entries are good news; *Changed* and *Removed* entries are actionable.

The "Keep a Changelog" convention (keepachangelog.com) codifies these practices and is widely adopted in open-source projects. Its core principle is that changelogs are for humans, not machines — a principle that aligns with this vault's approach to [plain language](../../../topics/plain-language/index.md).

## Related terms

- [release notes](release-notes.md) — announce a specific version; a changelog records all versions
- [specification](specification.md) — defines how a system should behave; a changelog records how it has changed
- [README](readme.md) — often links to the changelog
