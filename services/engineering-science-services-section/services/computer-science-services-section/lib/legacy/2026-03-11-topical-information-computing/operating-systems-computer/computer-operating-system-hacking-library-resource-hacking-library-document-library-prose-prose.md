---
name: prose
description: The body of a markdown record viewed as a sequenced multi-cell positing in a predication fiber algebra. Each sentence posits values at one or more cells, raising the running valuation via the knowledge-order join; the prose is in normal form when every positing lies within the modal interval the prior sentences leave at the addressed cell.
derives-from:
  - file.md
  - predication-cell.md
  - bilattice.md
---

Prose is the body of a markdown record, treated as an ordered sequence of sentences $S_1, S_2, \ldots, S_n$.
Each sentence is a multi-cell positing: it asserts values $v$ at one or more cells $(s, p, o)$ in the running predication fiber algebra $A_p$.
The running valuation $u$ accumulates by knowledge-order join: after sentence $i$, the running valuation is $u_i = u_{i-1} \vee_k v_i$.

The structure has three observation features.

**Addressing surface.** The set of cells $(s, p, o)$ the prose touches across its sentences.
The file's name, parent directory, and frontmatter typically pin one or more coordinates: a file at `code/structures/<term>.md` addresses cells whose subject is `<term>`; a file with frontmatter `derives-from: [foo.md, bar.md]` posits cells on the `derives-from` predicate with `foo` and `bar` as objects.

**Sentence sequence.** An ordered list of cell positings.
Order is load-bearing: sentence $i+1$ is evaluated against $u_i$, which differs from $u_{i-1}$ by exactly the positings of $S_i$.

**Modal interval per cell.** At each addressed cell, the running valuation $u_{i-1}$ together with the prevailing accessibility relation $R$ determines the modal pair $(\Box_R u_{i-1}, \Diamond_R u_{i-1})$ per [modal-necessity-operator](../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/transformers/modal-necessity-operator.md) and [modal-possibility-operator](../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/transformers/modal-possibility-operator.md).
Admissible positings $v_i$ lie within this interval.

## Conformance

Prose is *in normal form* against the running valuation $u$ when every sentence's cell positing satisfies

$$(\Box_R u_{i-1})_{w_0}(s, o) \leq_t v_i(s, p, o) \leq_t (\Diamond_R u_{i-1})_{w_0}(s, o)$$

at every cell the sentence addresses, at the writer's working scope $w_0$.
Normal-form prose is the structural reading of *prose-as-statements* from [`finest-possible-truth`](../../prose/rough/finest-possible-truth.md): each sentence asserts within the productive interval the prior sentences leave open.

Three failure modes correspond to the interval's three regions:

- Below $\Box_R u_{i-1}$: the sentence contradicts what every accessible continuation already commits to.
  The positing is inadmissible against established context.
- Above $\Diamond_R u_{i-1}$: the sentence asserts more than any accessible continuation can witness.
  The positing has no support.
- Within the interval but distant from $\Diamond_R u_{i-1}$: the sentence is admissible but coarse — it leaves information the running context licensed unused.
  This is gesture-text per [`writing-for-ai-agents`](../../prose/rough/writing-for-ai-agents.md), recognizable as failure to push the assertion to the upper bound.

## Diátaxis refinements

Four mode-specific refinements of prose, each derives from this structure and adds mode-specific constraints on admissible positings:

- [`explanation`](explanation.md) — why-mode.
  Posits on conceptual and causal cells; rejects procedural imperatives.
- [`tutorial`](tutorial.md) — first-encounter mode.
  Posits on pedagogical-sequence cells; requires signposting.
- [`guide`](guide.md) — task mode.
  Posits on procedural cells; admits second-person imperatives.
- [`reference`](reference.md) — lookup mode.
  Posits on lookup-stable cells; rejects exploratory speculation.

Mixing positings from two modes in one prose body is a structural defect: the modal interval for one mode's cell is incompatible with the other's at that cell, and the resulting valuation is forced to $\top$ (contradicted).

## Specification

The prose structure has a specification at [`work/governance/rules/specifications/prose/`](../../work/governance/rules/specifications/prose/), carrying:

- `schema.json` — the observation surface for a candidate prose body (sentences, addressing surface, frontmatter cells, mode).
- `checks.json` — the check manifest.
  Includes surface checks (forbidden prestige tokens, sentence-length, etc.) and modal checks (`body-cell-in-modal-interval`, `body-cell-near-possibility-bound`, `derivation-chain-present`, `mode-coherence`, `modal-interval-non-empty`).

The check manifest is the closure-rule-system specialized to prose.
Evaluating the manifest against a candidate body is the lint-and-proof operation: a clean evaluation witnesses the body's normal-form conformance against the running valuation.

## Position

Prose is the structure under which every long-form record in this repository sits.
The character surface files (SOUL, identity, MEMORY, HEARTBEAT, DREAMS, TOOLS, USER, AGENTS), the office records, the surveys, claims, questions, explanations, tutorials, guides, references — all are prose, in the sense this structure defines.
The modal interval discipline applies uniformly across all of them, with the specific modal pair determined by the running valuation each file is read against.
