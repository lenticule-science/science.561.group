---
title: "Ludics Triage Sweep 2026-08-18"
date-created: 2026-08-19T00:00:00
keywords:
  - triage
  - ludics
  - housekeeping
description: "Manifest report for the triage-sweep executed against ludics-services-section/content/text/triage: stale-dup removals, relocations, keep-ludics moves, and files left in place."
part-of: game-science/domains/ludics/triage
authors:
  - claude-fable-5
type: specification
---

## Normative scope

This document records the execution of a 141-item triage manifest against `game-science-services-section/services/ludics-services-section/content/text/triage/`. Each manifest verdict (`stale-dup`, `relocate`, `keep-ludics`, `uncertain`) was re-verified against its stated canonical/destination before any file was touched, per the manifest's own re-verification rule for `stale-dup`. No commit was made; the triage directory (and this whole repository tree, as found) is untracked by git, so removals used `rm` and relocations used `mv` rather than their `git` equivalents, per the manifest's untracked-fallback instruction.

## Counts

| Outcome | Count |
|---|---|
| Deleted (`stale-dup`, confirmed) | 61 |
| Moved — `relocate` | 46 |
| Moved — `relocate`, renamed for disambiguation | 2 |
| Moved — `keep-ludics` | 11 |
| Left in place — `uncertain` | 21 |
| Downgraded from `stale-dup` to `uncertain` | 0 |
| **Total manifest items** | **141** |

All 141 manifest entries were accounted for; the file count in the triage directory before the sweep (141) matches the sum of the outcomes above.

## Deleted (stale-dup, re-verified)

Each of the following was diffed against its named canonical file (frontmatter/link-path/format-only differences normalized away) and confirmed to add no unique prose. All were removed with `rm` (untracked):

`aft-passageway.md`, `air-ducts.md`, `airlock.md`, `atari.md`, `babble-20250724222308-0500.md`, `babble-20250915213437-0500.md`, `campaign.md`, `canon-from-library.md`, `canon.md`, `cargo-bay-four.md`, `connection.md`, `consent.md`, `continuity-from-library.md`, `continuity.md`, `describing-a-reproducible-paracosmic-standard.md`, `describing-phineas-and-ferb-as-episodic-jouissance-within-corporate-liberation.md`, `describing-the-zombie.md`, `dice-total.md`, `diegesis-from-library.md`, `diegesis.md`, `emsean-paracosm.md`, `encoding-anna-karenina-as-a-reproducible-paracosm.md`, `engine-room.md`, `eye.md`, `game-master.md`, `gaum.md`, `girard-caillois-substrate-correspondence.md`, `hive_concurrent_idle_game_research_memo.md`, `house-oru.md`, `how-bunny-ears-came-to-cottenboro.md`, `ko.md`, `kolpe-oru.md`, `komi.md`, `ludics-genealogy.md`, `ludics-history.md`, `media.md`, `midsummer.md`, `my-time-at-sandrock.md`, `ncis.md`, `202507120933a1a.md`, `paracosm.md`, `pip.md`, `praxonic-worldbuilding.md`, `relational-worlding.md`, `reproducible-paracosm-specification.md`, `reproducible-paracosm.md`, `roll.md`, `safety-tool.md`, `secondary-world.md`, `setting.md`, `social-contribution-score.md`, `storyworld.md`, `system.md`, `the-walking-dead-as-empircal-ontology-of-unfinished-death.md`, `theorem-of-reproducible-paracosmic-models.md`, `theorem-of-tolstoyan-tragic-necessity.md`, `worldbuilding-1.md`, `worldbuilding-2.md`, `worldbuilding-2026-03-05.md`, `worldbuilding-3.md`, `worldbuilding.md`.

One item required closer scrutiny before confirming: `the-walking-dead-as-empircal-ontology-of-unfinished-death.md`. Its raw byte size (144KB) is more than double the canonical file's (63KB), which on first look suggested unique material. Inspection showed the size gap comes from (a) much deeper/longer relative link paths in the triage copy and (b) the triage copy's own internal corruption — its closing "Conceptual Axis" / "Ontological Element" synthesis tables and surrounding paragraphs are pasted three times in a row near the end of the file, rather than once as in the canonical version. Once that duplication and the link-path noise are discounted, the argument, section structure, and paragraph-level prose match the canonical essay with only wording-level (non-substantive) variation throughout. No new claims, sections, or arguments were found that are absent from the canonical file, so the `stale-dup` verdict was confirmed rather than downgraded.

## Moved — relocate

| File | Destination |
|---|---|
| babble-20160917080000-0500.md | personal-services-section/emsenn-services-section/content/text/logs/personal-logs/log-entries/ |
| babble-20200119090000-0500.md | same |
| babble-20250718104200-0500.md | same |
| babble-20250722111523-0500.md | same |
| babble-20250723164430-0500.md | same |
| babble-20250911085500-0500.md | same |
| babble-20250915110258-0500.md | same |
| babble-20250920114843-0500.md | same |
| baseball-cap-as-crown-and-code.md | media-services-section/content/text/documents/articles/recovered-research/ |
| brave-old-world-podcast.md | role-playing-games-services-section/content/text/glossary/terms/ |
| brave-old-world.md | role-playing-games-services-section/content/text/documents/articles/recovered-research/ |
| disney.md | media-services-section/content/text/glossary/terms/ |
| defacing-recursion.md | media-services-section/content/text/documents/articles/recovered-research/ |
| from-xerox-to-ai-disruption-gatekeeping.md | media-services-section/content/text/documents/articles/recovered-research/ |
| fore-passageway.md | personal-services-section/emsenn-services-section/content/text/glossary/terms/ |
| galley.md | same |
| gnalens.md | same |
| hallways.md | same |
| hevi-mala.md | same |
| hoodies-as-history.md | media-services-section/content/text/documents/articles/recovered-research/ |
| ikmu.md | personal-services-section/emsenn-services-section/content/text/glossary/terms/**okaga-ikmu.md** (renamed — an unrelated `ikmu.org`, about emsenn's real-life cat, already occupies the bare name) |
| immersim.md | personal-services-section/emsenn-services-section/content/text/glossary/terms/ |
| literature-1.md | media-services-section/content/text/glossary/terms/ |
| literature.md | same |
| lore.md | same |
| mash-and-telemetric-affect.md | media-services-section/content/text/documents/articles/recovered-research/ |
| media-1.md | media-services-section/content/text/glossary/terms/ |
| nadim.md | personal-services-section/emsenn-services-section/content/text/glossary/terms/ |
| obrien-and-the-persistence-of-suffering.md | media-services-section/content/text/documents/articles/recovered-research/ |
| okaga-1.md | personal-services-section/emsenn-services-section/content/text/glossary/terms/ |
| okaga-comes-to-ben.md | personal-services-section/emsenn-services-section/content/text/documents/articles/fiction/ |
| okaga-quarters-aft-bulkhead.md | personal-services-section/emsenn-services-section/content/text/glossary/terms/ |
| okaga-quarters-deckhead.md | same |
| okaga-quarters-fore-bulkhead.md | same |
| okaga-quarters-hull.md | same |
| okaga-quarters-port-bulkhead.md | same |
| okaga-quarters-ship.md | same |
| okaga.md | same |
| paracosms.md | personal-services-section/emsenn-services-section/content/text/documents/articles/notes/ |
| prairieland-trial-and-institutional-capture-of-zines.md | media-services-section/content/text/documents/articles/recovered-research/ |
| punk-ash.md | personal-services-section/emsenn-services-section/content/text/documents/articles/notes/ |
| quarters.md | personal-services-section/emsenn-services-section/content/text/documents/articles/fiction/ |
| radio-resistance.md | personal-services-section/emsenn-services-section/content/text/documents/articles/notes/ |
| radio-silence.md | personal-services-section/emsenn-services-section/content/text/documents/articles/fiction/ |
| teleporter-room.md | same fiction dir |
| library.md | personal-services-section/emsenn-services-section/content/text/glossary/terms/**okaga-library.md** (renamed — an unrelated `library.org`, about libraries-as-institutions, already occupies the bare name) |
| zine.md | media-services-section/content/text/glossary/terms/ |
| zinefest.md | same |

## Moved — keep-ludics

All destination directories were restricted to `glossary/terms` or `documents/articles/notes` per the manifest's keep-ludics rule; none of the following are short glossary-term entries, so all landed in `ludics-services-section/content/text/documents/articles/notes/`:

`colossal-cave-adventure.md`, `cyoa.md`, `death-in-play-ludic-economies-of-mortality-in-red-dead-redemption-2-and-grand-theft-auto-v.md`, `fall-idle-game.md`, `hive-as-game.md`, `hivekeeper_hive_as_idle_game_app_concept.md`, `idle-games.md`, `idle_incremental_games_time_attention_research_memo.md`, `sociology.md`, `the-anatomy-of-things.md`, `time-and-attention.md`.

## Left in place — uncertain

No manifest verdict was downgraded to `uncertain`; the following 21 files were already marked `uncertain` in the manifest and were left untouched, matching the count of files remaining in the triage directory after the sweep:

`bridge.md`, `copper-ward.md`, `credits.md`, `durham-2030.md`, `earth.md`, `emsiverse.md`, `engine-development.md`, `exploring-paracosms.md`, `introduction.md`, `phineas-and-ferb.md`, `readme.md`, `suit.md`, `television-1.md`, `television.md`, `terms-1.md`, `terms.md`, `texts-1.md`, `texts.md`, `wager.md`, `zines-1.md`, `zines.md`.

## Downgrades

None. Every `stale-dup` entry re-diffed against its stated canonical (including the one flagged above for closer inspection) confirmed the canonical held all of the triage copy's substantive content, so no verdict was changed.
