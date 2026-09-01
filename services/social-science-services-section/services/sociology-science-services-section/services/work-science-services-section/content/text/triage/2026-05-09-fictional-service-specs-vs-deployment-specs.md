---
name: 2026-05-09 fictional service specs vs deployment specs
type: friction-report
authored: 2026-05-09
status: open
surface: substrate, deployment
domain: farstone, service-specs, in-fiction-vs-deployable
---

While scaffolding the farstone-as-package work, the file
`tools/platform/pyfars/examples/farstone/work/governance/specifications/services/pyfars-engine-farston.md`
was found to carry `type: service-spec, status: active` — but its
content is **in-fiction worldbuilding**, not a real deployable spec:

- `host: farston-city-hall` — not a real registered computer-system; that hostname only exists in farstone's fiction (the town's city hall).
- `substrate-root: /home/farston/polity` — a fictional filesystem path on a fictional host.
- `authored-by: [aliyah-reyes]` — an in-fiction Farston staffer (the city clerk).

The systemd-user harness reads `work/governance/specifications/services/*.md` looking for `type: service-spec` records with `status: active` or `status: draft`, then writes one `.service` unit per record. Running `pyfars install systemd-user` against farstone would therefore project a `pyfars-engine-farston.service` unit pointing at a path that doesn't exist on the operator's box. The harness has no way to distinguish "in-fiction service-spec the polity narrates as part of its world" from "real service-spec describing how this polity wants to be supervised."

## Canonical direction

The substrate distinguishes the two layers in *some* places (the polity's `work/governance/places/`, `work/governance/persons/` etc. carry in-fiction content; `work/governance/specifications/services/` is documented as deployment-shaped). The friction is that nothing enforces it — both kinds of records have the same `kind:` / `type:` discriminators. Two ways to reify the distinction cleanly:

- **Status-based**: in-fiction records carry `status: fiction` (or `sketch`); the harness only projects `active` / `draft`. Cheapest fix; relies on convention.
- **Path-based**: in-fiction service narratives go under `work/governance/places/<place>/services/` or `work/governance/fictional-services/`; only `work/governance/specifications/services/` is harness-projected. More structural; clearer intent.

The path-based shape is more durable but requires a substrate move and possibly schema work. Status-based is the fast-cut.

## What is being done about it now

As part of the farstone-as-package work, the existing in-fiction `pyfars-engine-farston.md` is being relabeled `status: sketch` so the harness skips it. A separate file `farstone-engine.md` is being authored alongside as the canonical deployable default for someone running farstone standalone. This is the status-based fix, applied minimally to unblock phase 2 without scope-creep into a substrate-wide convention change.

## Cleanup, when someone picks it up

Decide which of the two reifications above is canonical. If status-based: document the convention in `work/governance/specifications/services/_index.md` (both farstone's and pyfars's) so future authors understand `status: fiction` (or whichever value) means "harness, skip me." If path-based: move in-fiction service records under their narrative-home (e.g., `work/governance/places/farston/`) and tighten the harness's walk path or schema check.

## Provenance

Surfaced 2026-05-09 during phase 2 of the farstone-as-package work (captain Morgan + executive officer Claude-Opus-4.7).
