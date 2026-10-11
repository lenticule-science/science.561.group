# L-Space runtime-proof repair

Historical draft target (INVALID AS CURRENT OWNER EVIDENCE): `emsenn/bare-cedar-fog`, branch `chatgpt/l-space-runtime-proof-20261004`.

**Current routing status:** owner unresolved. Bare Cedar Fog is snapshot/laptop-local evidence only for this enterprise L-Space package repair. Do not apply or review this patch in BCF unless newer explicit owner evidence establishes a valid laptop-local exception. Preserve this packet as an implementation-ready delta pending exact L-Space/FeltOS source custody.

## Defect

Canonical issue #255 now identifies L-Space as the existing Lenticule Science public projection and requires the current runtime proof to be repaired before publication machinery broadens. The package itself is already a FeltOS companion exported from `src/site.mjs`, but its README and only test still describe/import the deleted standalone VICTOR/static-site-publisher configuration. `package.json` no longer depends on static-site-publisher and exposes only `npm test`.

## Repair

The patch:
- rewrites README/runtime/deployment documentation around `lSpaceApplication()` and the current FeltOS companion;
- removes stale static-site-publisher imports and configuration assertions from `test/site.test.mjs`;
- checks the current Science root/catalog/exclusion contract;
- checks fail-closed provider configuration and authenticated-route policy;
- constructs the current L-Space companion over a tiny in-repository Science fixture without Notebook effects;
- explicitly preserves the distinction `public garden != scientific acceptance != reuse rights`.

It deliberately does **not** create a publication-candidate predicate, alter garden visibility, claim open licensing, or invent a new research-release store.

## Checks

From the L-Space package:
`npm test`

Then include this package suite in the existing host release verification before treating a green FeltOS host as publication receiving evidence.

## Acceptance

1. The package test no longer imports deleted `static-site-publisher` modules/configuration.
2. `lSpaceApplication()` assembles over the bounded fixture.
3. Private/authenticated vault routes remain outside the public-route policy.
4. Existing public-garden semantics are unchanged.
5. README no longer documents retired standalone deployment.
6. No scientific-release candidate is inferred from `visibility: public`.

## Rollback

Revert the docs/test-only delta if current Red Cup application interfaces require a different bounded runtime harness. Do not restore retired static-site-publisher deployment as a compatibility shortcut.