# PlainEng standards and historical-source map — 2026-10-10

**Status:** A source-verified orientation and proposed crosswalk. **Not a claim of ISO, WCAG, government, or other certification.** A full clause-level normative mapping remains open in [science issue #55](https://github.com/lenticule-science/science-services-section/issues/55).

| Source / edition | Role relative to PlainEng | Evidence and next verification |
| --- | --- | --- |
| [U.S. Plain Writing Act of 2010](https://www.congress.gov/111/plaws/publ274/PLAW-111publ274.pdf) | Historical federal legal framework for agency public communication, not law directly binding all PlainEng adopters. | Preserve statutory scope and original text; track relevant current U.S. government rules separately from internal standards. |
| [GSA / plainlanguage.gov public archive](https://github.com/GSA/plainlanguage.gov) | Primary historic guidelines/site source; source of adapted familiar words, directness, reader-oriented organization, testing. | Repository was archived read-only 2025-12-29. Review explicit public-domain/CC0 statements and revisions before reusing any asset; distinguish third-party embedded material. |
| [ISO 24495-1:2023](https://www.iso.org/standard/78907.html) | International plain-language governing principles and guidance, expressly relevant to technical writing and controlled languages. | ISO overview/abstract verified. Full clauses/edition not audited; **do not infer conformance or reproduce licensed text**. |
| [ISO 24495-2:2025](https://www.iso.org/standard/85774.html) | Additional plain-language guidance focused on legal communication. | Verify full document and scope before clause-level mapping; legal effect requires subject-matter review. |
| [WCAG 2.2, W3C](https://www.w3.org/TR/WCAG22/) | Digital document/web accessibility, not a universal prose style standard. Relevant: language-of-page 3.1.1 (A); language-of-parts 3.1.2 (AA); unusual words 3.1.3, abbreviations 3.1.4 and reading level 3.1.5 (AAA). | Requirements vary by level; WCAG 2.2 conformance evaluates **full pages**, not a paragraph scored by PlainEng. Align prose/link semantics without pretending a linter certifies WCAG. |
| [BCP 14: RFC 2119 + 8174](https://www.rfc-editor.org/info/bcp14/) | Defines requirement-word interpretation in documents explicitly using the BCP 14 convention. | RFC 8174 narrows special normative meaning to uppercase key words. PlainEng conversational lowercase “must” is not automatically an RFC 2119 obligation. Define local normativity and authority distinctly. |
| [BCP 47 / RFC 5646](https://www.rfc-editor.org/info/bcp47/) | Language tag syntax: initially `en-US`; later English variants/localizations may differ. | Validate tag syntax separately from language support and target-audience suitability; no fake locale fallback. |

## How a crosswalk record should work

Every proposed PlainEng conformance rule should have: stable internal ID, rule and version, exact external source/edition and clause when *legally accessible*, normative vs informative status, objective test, negative example, applicability coordinates (audience, genre, language, target risk), reviewer/owner, and open uncertainty.

Separate these questions: “Does a doc follow PTGAE syntax?”, “Does it conform to a fully audited external standard?”, “Is its factual content true?”, and “Can intended readers use it?” One answer never proves the others.

## Engineering examples

- `en-US` is a well-formed BCP 47 tag; **supported** `en-US` is a separate capability.
- Rendering a `lang` attribute contributes to WCAG language requirements; a string detector cannot independently certify full-page WCAG 2.2 AA.
- PTGAE may specify explicit active actors for public instructions, but a scientific quotation or mathematical statement may be clearer in passive voice; exceptions need scoped evidence.
- Terms such as `must` and `may` require preserved deontic force and named authority; an RFC BCP14 parser is not a general English semantics oracle.
- No automatic transformation of text governed by unresolved legal clauses or ISO licensed content.

## Historical continuity

The [older PlainEng/PTGAE style guide](https://github.com/emsenn/content/blob/main/writing/texts/style-guide.md), [older plain-language writing specification](https://github.com/emsenn/content/blob/main/writing/topics/plain-language/index.md), [writing theory](https://github.com/emsenn/561-theory/blob/main/humanities/theories/writing/theories/plain-technical-general-american-english/_index.md), and [current Lenticule PTGAE notes](https://github.com/lenticule-science/science-services-section/blob/main/docs/plain-technical-general-american-english.md) are evidence for continuity, not automatically current normative text. Retain provenance. No public release of the private joint science/engineering project is authorized.
