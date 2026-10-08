---
name: 2026-05-04-skills-emit-slug-field
description: Skills emit a slug frontmatter field that's now considered wrong convention
type: friction-log
class: convention-drift
date: 2026-05-04
status: open
see-also: [2026-05-04-trusted-agent-authored-substrate]
title: 2026-05-04-skills-emit-slug-field
date-created: 2026-05-04
---

# Skills emit a slug frontmatter field that's now considered wrong convention

While registering Ack and Gnalens, I used `governance/skills/group/register-ship/scripts/register-ship.sh`.
The skill's output included `slug: "ship:ack"` and `slug: "ship:gnalens"` in the generated frontmatter — matching the existing convention all ship records carry.

The captain subsequently corrected the convention: a record's slug **is** its filename; disambiguation, when needed, is by parent-directory segments at the reference site, not by a separate `slug:` frontmatter key.
Captain's words: *"if FARS need that, that's a DUMB way of handling disambiguation and we should do it based on adding on directories the file is in until we disambiguate.
But slug is just... filename."*

Tried: nothing else; the skill's behavior is the skill's behavior.

Had to: continue using the skill (it's the substrate-aware way to register a ship), then propagate the slug noise.
The new ship records carry `slug: "ship:ack"` and `slug: "ship:gnalens"` despite the convention being repudiated.

Violates: the substrate's *agential-self-generation* + *no-redundant-identity* discipline.
A skill that emits frontmatter the convention now disavows is a skill emitting wrong substrate.
The skill is one of many such records; auditing which skills carry similar drift is a cross-cutting question.

Gap: at minimum, `register-ship.sh` should drop the slug-field emission.
More broadly, the substrate needs a way to detect "skill emits frontmatter shapes the convention disavows" — probably an audit-skill that reads each skill's actual output, parses it, and checks against an evolving convention spec.
Today: no such audit exists; conventions drift silently across skills.

Adjacent: existing records that already carry `slug:` frontmatter (the polity, the seven existing harnesses' `_index.md` files, every ship record, many more) are legacy noise per the new convention.
The captain has explicitly said not to mass-clean.
The drift is therefore visible in substrate but stable — until the audit-and-fix path lands, the convention's inconsistency is itself substrate state.
