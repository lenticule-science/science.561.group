---
title: Composable Writing Skills Pattern
description: Replace monolithic writing skills with a script that assembles writing guidance from library content and config fragments.
date-created: 2026-03-31
type: note
name: composable-writing-guide
keywords:
  - writing-composability
  - skill-files
  - writing-guidance
  - trigger-patterns
  - architecture
specialization: plan
application: publishing
date-completed: 2026-04-04
completion-note: Solved differently than planned. The per-domain writing skill pattern (writing-terms, writing-texts, writing-surveys, etc.) achieves the composability goal through separate skill files rather than a Python assembler script.
project: generative-harness
depends-on: [composable-writing-guide-context]
---

Writing guidance originally lived in four monolithic skill files plus `content-conventions.md` — duplicative voice rules, static-by-type, and disconnected from 260+ writing-domain library terms. The original plan proposed a Python assembler (`produce-writing-guide.py --type term --domain math`) that composed base + type + domain fragments plus library pulls into one guide per request. As of 2026-04-04 this is **completed differently**: the per-domain writing skill pattern (writing-terms, writing-texts, writing-surveys, writing-botanical-terms, writing-philosophy-surveys, writing-operations-surveys, writing-gardening-texts, writing-frontmatter, writing-markdown) achieves the composability goal through separate skill files that auto-compose via triggers, without a runtime assembler or fragment config tree. The original architecture, session-by-session steps, open decisions, and success criteria are preserved in [`2026-03-31-note-on-composable-writing-guide-context.md`](2026-03-31-note-on-composable-writing-guide-context.md). No open questions — this plan is closed.
