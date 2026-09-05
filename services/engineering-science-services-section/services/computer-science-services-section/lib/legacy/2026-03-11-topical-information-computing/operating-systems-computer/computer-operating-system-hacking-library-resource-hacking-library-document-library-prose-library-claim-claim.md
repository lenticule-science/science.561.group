---
name: claim
description: A polity-authored structural assertion with a stated content, an argument or proof (or proof obligations for promotion), citations to upstream grounds, and a lifecycle status. Recorded as a markdown file under prose/learning/claims/.
derives-from:
  - prose.md
---

A claim is a polity-level structural assertion: a single declarative statement the polity stands behind, accompanied by enough argument that a reader can audit the assertion against its grounds.
Claims live at `prose/learning/claims/<slug>.md`; the directory's `_index.md` is the canonical roster.

A claim is distinct from:

- A [`question`](question.md) — open theoretical frontier; status `open`, `partial`, or `resolved`.
- A survey record at `prose/learning/surveys/` — a session-bounded gather of source material, *not* a settled polity assertion.
- A `prose/teaching/explanations/` entry — a why-mode pedagogical record, which may *cite* a claim but is not itself an assertion.

## Distinguishing predication-shape

A claim record carries:

- `name` — the human-readable name (the claim's headline).
- `description` — one to three sentences stating the claim's content and what it earns.
- `status` — one of `sketch`, `active`, `proved`, `superseded`.
  `sketch` claims carry stated proof obligations for promotion; `proved` claims close with `$\square$` or an equivalent terminator.
- `depends-on` — optional list of upstream paths (other claims, structure records, transformer records, open questions) the argument rests on.

The body opens with a `**Claim.**` paragraph stating the assertion in full, followed by `## Argument` or `## Proof` (the demonstration), `## Significance` (what the claim earns downstream), optional `## Proof obligations for promotion to proved-status` for `sketch`-status claims, and `## Position` (placement in the broader theoretical apparatus).

## Position

The polity-level entity-form whose witness records derivations of polity-authored structural results.
Claims compose the closed-DAG of settled assertions that downstream structure records, transformer records, and specifications cite as authority.
Surveys may originate a claim but never substitute for one; the claim is the act of settling.
