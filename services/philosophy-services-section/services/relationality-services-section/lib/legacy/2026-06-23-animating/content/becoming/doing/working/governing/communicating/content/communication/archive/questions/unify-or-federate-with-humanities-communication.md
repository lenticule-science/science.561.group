---
type: question
class: structural
status: open
explores:
  - ../_index.md
  - ../../../humanities/theories/communication/_index.md
see-also:
  - ../../../humanities/theories/communication/_index.md
  - ../../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/audits/curation-conformance-audit.md
---

# Should science/communication and humanities/communication be unified, federated, or held parallel?

The corpus carries two `communication/` theories with different axes:

- [`science/theories/communication/`](../_index.md) — source-channel-receiver / linguistic-pragmatic / rhetorical-tradition: the home for [audience](teaching/explanations/audience.md), [channel](teaching/explanations/channel.md), [register](teaching/explanations/register.md), [genre](teaching/explanations/genre.md), [pragmatics](teaching/explanations/pragmatics.md), and [shannon-channel](../objects/shannon-channel.md). Its references are Shannon-Weaver 1949, Grice 1975, Halliday 1985.
- [`humanities/theories/communication/`](../../../humanities/theories/communication/_index.md) — McCloud / Andersen / Hamami & Morris / Avigad / Macbeth closure-discipline framework: [accountable-closure](../../../humanities/theories/communication/concepts/accountable-closure.md), [frame-discipline](../../../humanities/theories/communication/concepts/frame-discipline.md), [medium-specific-rigor](../../../humanities/theories/communication/concepts/medium-specific-rigor.md), [transport](../../../humanities/theories/communication/concepts/transport.md). Explicitly distinguishes itself from Shannon (see [communication-is-not-shannon](../../../humanities/theories/communication/texts/communication-is-not-shannon.md)).

The two theories cite each other as `see-also:`. They cover *different questions*, not the same question from different angles.

## Why this matters

The [predicated-markdown-vault-knowledge-system](../../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/) curation theory loads on *both* communication theories from different concepts. Its [audience](../../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/concepts/audience.md) and [channel](../../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/concepts/channel.md) anchors bind primarily to the science-side; its [pragmatic-register](../../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/concepts/pragmatic-register.md) anchor binds to both. Downstream readers must currently traverse both theories to understand what each anchor commits to.

Three structural options:

1. **Unify** into one `communication/` theory under (e.g.) `humanities/` or under a new `theories/communication/` parent, with the closure-discipline framework and the source-channel-receiver framework as two registers within it. Cleanest reader experience, costliest move.
2. **Federate** under a shared `communication/` parent that both `science/communication/` and `humanities/communication/` `component-of:`. Preserves the axis split, adds a single front door.
3. **Parallel** — keep as is, with explicit cross-citation. Lowest cost, highest reader friction.

## What counts as an acceptable answer

A captain-level decision (C-1 in the [audit](../../information/theories/knowledge-systems/theories/markdown-vault-knowledge-system/theories/predicated-markdown-vault-knowledge-system/audits/curation-conformance-audit.md)) selecting one of the three options *and* committing to the migration work the choice implies. The decision should be recorded as a captain-decision under `governance/decisions/` (out of scope for this `library/`-side question file) and the resulting structural change carried out by a subsequent task.

## Bounds

This question is not about whether to *abolish* either tradition. Both Shannon-Weaver and McCloud/Andersen are load-bearing for downstream theories that already cite them. The question is purely about the *organisation* of the two — whether the corpus carries one home, two federated homes, or two parallel homes.

## What this question is not

This is not the question "what is communication?" — neither theory tries to settle that. Both theories take the position that communication is a *family* of phenomena that admits multiple complementary formalisations; the question is only about how the corpus *organises* its commitments to those formalisations.
