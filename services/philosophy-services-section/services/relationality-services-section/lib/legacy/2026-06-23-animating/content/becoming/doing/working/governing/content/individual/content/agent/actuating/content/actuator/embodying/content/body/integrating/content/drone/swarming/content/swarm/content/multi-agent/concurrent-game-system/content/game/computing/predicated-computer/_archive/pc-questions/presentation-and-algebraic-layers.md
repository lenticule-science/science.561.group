---
type: question
status: open
explores: [substrate-value-domain, predication-fiber, source-of-truth, predication-substrate]
---

# Should interpretation between presentation and algebraic layers be a substrate-level concern?

Some realizations of the [predication substrate](teaching/explanations/predication-substrate.md) store predications in a form that is *already* an element of the [substrate's value-domain](teaching/explanations/substrate-value-domain.md): an EAVT triple-store with explicit value cells, an in-memory graph with bilattice-valued edges, an Answer-Set-Programming fact base. For these realizations the substrate's stored form *is* its algebraic form; reading a cell returns a value-domain element directly.

Other realizations store predications in a form that requires *translation* before substrate algebra can operate on them: a directory of human-edited markdown files where the YAML frontmatter is a presentation-layer encoding; a wiki where predications are extracted from prose; a code-as-data system where the source's syntax tree is translated to predications by a parser. For these realizations there is a *layer split* between what is stored (presentation-layer content) and what the algebra reads (algebraic-layer content). The translation from presentation to algebra is a deterministic substrate operation governed by some combination of shape predications, vocabulary rules, and parser logic, but the operation does not currently appear in [the morphism corpus](../morphisms/) or in [the concept corpus](teaching/explanations/).

The question is whether the layer split deserves first-class standing — whether the substrate's general theory should name an `interpretation` morphism (or equivalent) and characterize its commitments — or whether it remains a per-realization concern that each example handles independently.

## Concrete cases

- **What does presentation-to-algebra translation guarantee?** The corpus's [source-of-truth](teaching/explanations/source-of-truth.md) discipline says the substrate's stored form is authoritative; if the stored form is presentation rather than algebra, the algebra is *derived* from the presentation. Two questions arise: (a) is the derivation deterministic given the presentation alone, or does it depend on auxiliary substrate content (shapes, vocabulary records, value-domain configuration)? (b) is the derivation idempotent — does interpreting an interpreted form give back the same algebraic form?
- **What governs interpretation rules?** Per [self-representation](teaching/explanations/self-representation.md), the rules that govern interpretation should themselves be substrate entities, just as closure rules are. Are there closure-rule-shaped *interpretation* rules — predication patterns that trigger interpretation actions — or is interpretation a privileged operator outside the closure-rule machinery? A substrate-level answer would clarify whether changing the interpretation rules is editing predications or editing privileged operator code.
- **How does interpretation interact with [validate-against-shape](../morphisms/validate-against-shape.md)?** Validation checks whether a configuration satisfies a shape's required predications. Interpretation produces the configuration that validation reads. The two operators are adjacent; whether they compose, what their composition's signature is, and whether validation can be performed in the presentation layer (before interpretation) are open.
- **What does the inverse direction look like?** Some realizations need to project algebraic content back to presentation — to write a markdown file's frontmatter from a fiber, to render a SQL row from a predication. Is the inverse of interpretation a separate operator, or is it derived from the interpretation rules under round-trip discipline? Substrates that fail round-trip discipline lose [two-store coherence](teaching/explanations/two-store-coherence.md); substrates that achieve it can replicate the cooperating-stores pattern in a presentation/algebra split.

## Relevance

The question is motivated by realizations that commit to human-editable presentation forms — markdown corpora, knowledge graphs maintained as wikis, configuration substrates expressed in YAML or TOML. These realizations share the engineering need to translate presentation to algebra at substrate read time, and would benefit from a substrate-level statement of what the translation operator commits to (determinism, idempotence, witness-emission, governance of rules).

A resolved answer would let particular realizations *cite* the substrate-level morphism rather than re-deriving its commitments locally; it would also surface the discipline that interpretation rules are themselves substrate content (per self-representation), which is a non-trivial commitment that several plausible realizations get wrong.

Open. The question may resolve toward a new morphism (`interpret`) and a new concept (the layer split as a structural commitment); it may resolve toward declaring the layer split realization-specific and not promoting it; or it may decompose into more specific questions about determinism, governance, and round-tripping.
