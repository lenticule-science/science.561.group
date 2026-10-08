---
name: 2026-05-04-register-ship-missing-deployment-fields
description: register-ship skill doesn't accept deployment fields the nix-flake harness needs
type: friction-log
class: skill-coverage
date: 2026-05-04
status: open
see-also: [2026-05-04-substrate-records-by-hand]
title: 2026-05-04-register-ship-missing-deployment-fields
date-created: 2026-05-04
---

# register-ship skill doesn't accept deployment fields the nix-flake harness needs

Registering Ack and Gnalens as ships used the existing skill `governance/skills/group/register-ship/scripts/register-ship.sh` — exactly the right move (substrate-aware, harnessed).
The skill accepts `slug`, `title`, `designation`, `captain`, `status`, `voyage`, `home-office` and emits a conformant ship record.

The new nix-flake harness needs `nix-system` and `role` on each ship's frontmatter to derive per-ship flake outputs.
Neither field is in the skill's input set.

Tried: nothing else; the skill simply doesn't accept those flags.

Had to: run register-ship to scaffold the records, then `Edit` the resulting frontmatter to insert the two extra fields.

Violates: the substrate's *agential-self-generation* commitment that an operative element should be created via a substrate-aware operator producing the right shape end-to-end.
Two fields' absence from the skill forced a return to host-level Edit.

Gap: register-ship should accept arbitrary additional frontmatter fields (perhaps via a generic `--extra-field key=value` flag), or — better — the ship-record schema should declare deployment-relevant fields as first-class so any harness that consumes them can find them on every ship.
The latter is cleaner: it makes the substrate's ship-record discipline aware of the deployment surface, which is the same direction the FARS *Harness surfaces & interfacers* spec section is going.

Cousin friction: the existing ship-record body skeleton (the `## Voyage` / `## Crewed by` headings register-ship emits) doesn't have a `## Deployment` or `## Host` section that would be the natural body home for nix-system, role, and forthcoming fields.
Currently those live only in frontmatter, which is fine for harnesses but invisible in rendered ship pages.
Worth thinking about as the deployment-field set grows.
