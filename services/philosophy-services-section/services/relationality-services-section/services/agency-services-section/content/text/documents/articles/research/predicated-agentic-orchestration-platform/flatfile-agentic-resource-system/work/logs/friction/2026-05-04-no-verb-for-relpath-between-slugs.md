---
name: 2026-05-04-no-verb-for-relpath-between-slugs
description: No verb to compute the relative path between two slugs
type: friction-log
class: substrate-navigation
date: 2026-05-04
status: open
see-also: [2026-05-04-substrate-records-by-hand]
title: 2026-05-04-no-verb-for-relpath-between-slugs
date-created: 2026-05-04
---

# No verb to compute the relative path between two slugs

Linking from `swarm.md` to `swarm-coordinated-system` (sister theory under `artificial-intelligence/`) required a relative path — `../../../../../../artificial-intelligence/theories/swarm-intelligence/concepts/swarm-coordinated-system.md` — to be hand-counted.
I got the count wrong twice (8 instead of 6) before backing off to look at an existing cross-theory link (AOP `agent.md` to `agentic-system`, 4 `../`s) and reasoning about depth from there.

Tried: counting directory components on paper; reading the existing convention; eventually computing the common ancestor between source-slug and target-slug and counting hops up and down.

Had to: do path arithmetic manually.
The information needed was fully derivable from substrate state — both source and target are slugs the corpus already indexes — but no verb exposed the derivation.

Violates: the substrate's commitment that derivable information should be derived by the substrate, not reconstructed by the agent.
The agent ended up running a small algorithm in its head that fars's slug index already has the data for.

Gap: a verb like `fars relpath <from-slug> <to-slug>` that emits the correct relative path.
Or — better — a `fars cite <slug>` (when run with the current file's path as context) that emits a ready-to-paste markdown link.
Or — better still — a templating affordance that lets the agent write `[swarm-coordinated-system]` with no path at all and have a substrate operator resolve the path during render.

The third reading is closest to the substrate's [boundary-as-fiber](../../../../scope/boundary-as-fiber/boundary-as-fiber.md) discipline — the *path* is a transport-level artifact; the *slug* is the substrate-level reference.
Markdown's slug-by-path convention is a host-level constraint the substrate should be insulating its agents from.
