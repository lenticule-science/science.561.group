---
name: library-structural-health
date-created: 2026-04-04
scope: library/theories/
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: library-structural-health
description: Generated 2026-04-04.
---


Generated 2026-04-04. Covers the entire `library/theories/` tree.

## Summary

| Metric | Value |
|--------|-------|
| Top-level domains | 5 (engineering, humanities, science, applied-sciences, technology) |
| Total content files (excl. _index.md) | ~2,808 |
| Total _index.md files | ~200+ |
| Domains missing _index.md | 3 |
| Files violating kebab-case naming | 14 |
| Empty leaf domains (only _index.md) | 12+ |
| Stub domains (0 content files) | 8 |
| Broken cross-reference links (sampled) | ~10-15% of cross-domain links |

## File Distribution by Top-Level Domain

| Domain | Content Files | Share | Notes |
|--------|--------------|-------|-------|
| humanities | ~1,340 | 47.7% | Sociology (690) dominates |
| science | ~862 | 30.7% | Botany (149 terms), math (287) heavy |
| engineering | ~597 | 21.3% | Tech (294), games (150), domesticity (109) |
| applied-sciences | 5 | 0.2% | No _index.md, no subdomains, texts only |
| technology | 4 | 0.1% | No _index.md — appears to be a stray duplicate of engineering/tech/computing/AI |

## Top 10 Domains by File Count

| Domain Path | Files |
|-------------|-------|
| humanities/sociology | 690 |
| humanities/sociology/critical-theory | 321 |
| engineering/tech/computing | 280+ |
| science/math | 287 |
| science/biology | 256 |
| humanities/writing | 217 |
| humanities/business | 181 |
| science/medicine | 164 |
| engineering/games | 150 |
| humanities/sociology/work | 143 |

## Top Cross-Referenced Terms

| Term | Domain | Link Count | Reach (files) |
|------|--------|-----------|---------------|
| sign | semiotics | 157 | 77 files |
| hierarchy | typography | 76 | 54 files |
| semiosis | semiotics | 53 | 22 files |
| harm-reduction | public-health | 18 | 14 files |
| disability-justice | medicine | 16 | 14 files |
| body | typography | 15 | 14 files |
| model-context-protocol | AI/agents | 12 | 11 files |
| cubism | design | 8 | 7 files |
| connotation | semiotics | 7 | 3 files |

## Structural Issues

### CRITICAL: Missing _index.md

These domains have no index file, breaking Hugo rendering and domain discovery:

1. **`library/theories/applied-sciences/`** — top-level domain, 5 texts, no index
2. **`library/theories/applied-sciences/texts/`** — no index for texts collection
3. **`library/theories/technology/`** — stray top-level domain, no index
4. **`library/theories/technology/theories/artificial-intelligence/`** — subdomain, no index

### HIGH: Stray `technology/` Domain

`library/theories/technology/` contains 4 files about AI agents and industrial control. This appears to duplicate `library/theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/`. The content should be reviewed and merged, then `technology/` removed.

### HIGH: Filename Convention Violations (14 files)

Files with spaces in names violate the kebab-case convention:

- `engineering/.../home-gardening/terms/microgreen tray.md`
- `engineering/.../blockchain/domains/Hive/Hive Hashtags.md` (also uppercase)
- `humanities/.../cassia-lorne/domains/hive-posts/Introducing Myself to Hive.md`
- `humanities/.../cassia-lorne/domains/hive-posts/Routine Read, April 1 2025.md` (+ 3 similar)
- `humanities/.../flash-fiction/texts/Whodunit, Quill.md` (+ 2 similar)
- `science/.../species/Echinacia augustifolia.md` (+ 3 similar)

### HIGH: Broken Cross-References

Sampled cross-domain links show ~10-15% breakage. Common patterns:

- **Wrong intermediate directory**: links to `../teaching/explanations/` when files are in `../terms/`
- **Non-existent target files**: references to `real-time-system.md`, `functional-safety.md`, `distributed-system.md`, `digital-twin.md`, `semantic-data-model.md`, `multi-agent-systems.md` — none exist
- **Missing person files**: `charles-sanders-peirce.md` referenced 2+ times, does not exist
- **Incorrect path depth**: several links in `technology/` use wrong `../` nesting

### MEDIUM: Stub Domains (Index Only, No Content)

These domains have an `_index.md` but zero content files:

| Domain | Notes |
|--------|-------|
| humanities/business/american-business-practices | Empty |
| humanities/music/ethnomusicology | Empty |
| humanities/philosophy/african | Empty |
| humanities/philosophy/chinese | Empty |
| humanities/philosophy/indigenous (+ lakota) | Empty |
| humanities/philosophy/islamic | Empty |
| humanities/media/scripts | Empty |
| engineering/games/computer-games | Content is deeper in subdomains |

### MEDIUM: Empty terms/ or texts/ Directories

12 directories contain only `_index.md` with no content files:

- `science/linguistics/languages/english/terms/`
- `science/medicine/herbalism/terms/`
- `science/biology/neuroscience/neuroreflexivity/terms/`
- `science/information/knowledge-systems/knowledge-vault/.../texts/`
- `engineering/tech/computing/AI/agents/model-context-protocol/texts/`
- `engineering/tech/computing/internet/texts/`
- `humanities/philosophy/western/ethics/care-ethics/held/terms/`
- `humanities/philosophy/western/ethics/care-ethics/tronto/terms/`
- `humanities/philosophy/western/ethics/care-ethics/gilligan/terms/`
- `humanities/philosophy/western/ethics/care-ethics/noddings/terms/`
- `humanities/spirituality/texts/`
- `humanities/sociology/critical-theory/marxism/decolonial/texts/`

### LOW: Thin Top-Level Content

`engineering/` itself has only 1 term (`praxis-driven-development.md`) and 2 texts at its root level. Not necessarily a problem — content lives in subdomains — but the top-level terms/ and texts/ feel vestigial.

## Recommendations

### Immediate (structural integrity)

1. **Add `_index.md` to `applied-sciences/` and `applied-sciences/texts/`** — these 5 files are invisible to Hugo
2. **Merge or remove `technology/`** — its 4 files belong in the existing `engineering/tech/computing/AI/agents/` tree
3. **Rename 14 files** to kebab-case (spaces → hyphens, uppercase → lowercase)
4. **Fix broken `../teaching/explanations/` links** — bulk rename to `../terms/` where files exist under that name

### Short-term (content health)

5. **Create missing term files** for referenced-but-undefined concepts: `charles-sanders-peirce`, `real-time-system`, `functional-safety`, `distributed-system`, `digital-twin`, `semantic-data-model`, `multi-agent-systems`
6. **Decide on stub domains** — either populate (african philosophy, chinese philosophy, etc.) or remove the empty scaffolding to reduce noise
7. **Run a full link validator** across all 2,800+ files to quantify total broken links

### Ongoing (maintenance)

8. **Prune empty terms/texts directories** that serve no purpose (especially care-ethics subdomain empties)
9. **Monitor applied-sciences** — if it grows, give it proper subdomain structure; if not, fold content into engineering/tech
10. **Track cross-reference density** as a health metric — the semiotics/sign cluster is the densest hub and a good model for other domains
