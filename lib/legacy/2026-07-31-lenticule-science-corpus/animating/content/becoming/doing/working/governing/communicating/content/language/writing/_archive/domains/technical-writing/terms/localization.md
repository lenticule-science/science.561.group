---
title: "Localization"
aliases:
  - "Localization"
  - "localization"
  - "l10n"
  - "internationalization"
  - "i18n"
date-created: 2026-03-06
type: term
tags: []
defines:
  - "Localization"
---

***Localization*** is the process of adapting documentation for a specific language, culture, and region — not just translating words but adjusting examples, conventions, units of measurement, date formats, cultural references, and assumptions for the target audience. Its companion process, *internationalization*, is the design of content so that it can be localized without structural changes.

Localization matters for technical writers because documentation increasingly serves global audiences. A [user guide](./user-guide.md) written for American readers may use imperial measurements, American date formats (MM/DD/YYYY), and culturally specific examples that confuse readers elsewhere. Localization-aware writing anticipates these problems at the source.

Principles for writing that localizes well:

- **Use simple, consistent sentence structure.** Complex sentences with multiple clauses are harder to translate accurately. The [plain language](../../../topics/plain-language/index.md) principles in this vault — short sentences, active voice, one idea per sentence — also produce content that translates cleanly.
- **Avoid idioms and culturally specific references.** "Hit the ground running," "out of left field," and "ballpark figure" are opaque in translation. Use literal language.
- **Use consistent terminology.** If the same feature is called "dashboard" in one place and "control panel" in another, translators must guess whether these are the same thing. A [style guide](./style-guide.md) with a term list prevents this.
- **Leave room for text expansion.** Translated text is often 20–30% longer than English. Interface text, button labels, and column headers must accommodate this expansion.
- **Separate content from presentation.** When content is embedded in code or tightly coupled to layout, localization requires engineering work alongside translation. [Topic-based authoring](./topic-based-authoring.md) helps by keeping content modular.

The broader principle is that writing for a global audience is not a constraint but a discipline — it produces clearer, more precise writing for all readers, including English speakers.

## Related terms

- [style guide](./style-guide.md) — consistent terminology supports localization
- [plain language](../../../topics/plain-language/index.md) — clear writing translates better
- [audience analysis](./audience-analysis.md) — localization is audience analysis applied across languages
- [topic-based authoring](./topic-based-authoring.md) — modular content localizes more efficiently
