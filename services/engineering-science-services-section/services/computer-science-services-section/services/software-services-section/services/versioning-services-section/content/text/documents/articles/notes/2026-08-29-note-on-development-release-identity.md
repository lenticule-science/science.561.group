---
title: Note on development release identity and promotion
date-created: 2026-08-29
type: note
status: implemented-profile
subject: semantic precedence, immutable development carriers, npm channels, and promotion
sources: https://semver.org/; npm-workspace-publication-service
---

# Development release identity and promotion

Related term: [Semantic version](../../../glossary/terms/semantic-version.md).

The repository previously had two facts that did not compose: dependency law
already admitted exact SemVer prereleases, while release-wave planning could
create only stable patch versions and publishing relied on npm's default tag.
Consequently no prerelease existed in the live package estate, and a future
development publish could have moved `latest` accidentally.

The implemented profile makes four distinctions explicit:

1. SemVer precedence is a scientific relation over declared compatibility
   identities. A prerelease has lower precedence than its stable base.
2. `X.Y.Z-tag.N` is an engineering carrier identity. `.0` is the first
   immutable carrier of a channel and `N` advances rather than overwriting it.
3. An npm dist-tag is a mutable registry pointer, not part of the semantic
   version. `latest` points only to stable carriers; `dev`, `rc`, and other
   channels point only to matching prereleases.
4. Promotion is an operations decision supported by verified carrier evidence.
   It publishes the unoccupied stable base; it is not string replacement and
   does not mutate the prerelease carrier.

Exact internal dependency waves remain intentionally strict. A prerelease
consumer may pin a prerelease provider exactly. A stable consumer cannot,
because doing so would represent an unstable provider as part of a stable
carrier's reproducible contract.

Evidence limit: the implementation enforces identity allocation, dependency
channel separation, and npm tag selection. It does not infer API compatibility
from diffs, authorize a release, or prove that any registry publication has
occurred.
