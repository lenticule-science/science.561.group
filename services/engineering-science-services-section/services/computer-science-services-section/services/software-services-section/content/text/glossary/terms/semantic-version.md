---
title: Semantic version
type: term
status: canonical-local-profile
source: https://semver.org/
---

# Semantic version

A semantic version is a release identity whose ordered components communicate
the compatibility meaning of a change to a declared public API. In SemVer
2.0.0, `MAJOR.MINOR.PATCH` denotes incompatible API change, backward-compatible
functionality, and backward-compatible repair respectively. A hyphen introduces
a prerelease whose precedence is lower than the corresponding stable version.

## 561 Group development profile

The 561 Group narrows SemVer's general prerelease grammar to
`MAJOR.MINOR.PATCH-tag.N` for ordinary development carriers:

- `tag` is one nonnumeric ASCII identifier such as `dev`, `alpha`, `beta`, or
  `rc`;
- `N` is a nonnegative integer beginning at `0` and increasing for each
  immutable carrier in that channel;
- the version core names the intended stable compatibility boundary, so
  `1.4.0-dev.2` precedes and works toward `1.4.0`;
- build metadata is not used to distinguish publishable carriers because
  SemVer excludes it from precedence.

This profile does not infer whether a change is major, minor, or patch. That is
a compatibility claim about the public API and requires accountable review.
The numeric suffix orders development carriers; it does not assert quality,
deployment readiness, or promotion authorization.

## Related implementation

The engineering owner is `npm-workspace-publication-service`, which allocates
unoccupied identities, rewrites exact internal dependencies to a release-wave
fixed point, and enforces the matching npm dist-tag. Operations owns bump
authorization, verification, publication, and retained receipts.
