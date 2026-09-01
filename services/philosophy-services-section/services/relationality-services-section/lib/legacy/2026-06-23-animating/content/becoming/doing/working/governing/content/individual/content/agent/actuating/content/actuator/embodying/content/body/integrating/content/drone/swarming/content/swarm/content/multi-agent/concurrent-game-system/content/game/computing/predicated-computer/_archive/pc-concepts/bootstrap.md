---
type: concept
class: discipline
depends-on: [reification, self-representation]
see-also: [vocabulary-completeness, scope]
---

# Bootstrap

The substrate's discipline that *the substrate starts empty and is brought into operating state by ordinary messages*, not by a privileged constructor. A predicated computer beginning its life carries no predications; its first content arrives as reified messages from an out-of-scope sender — typically the substrate's own host identity. Those first messages assert the substrate's self-identity, its initial vocabulary, its standard operator specifications, and any closure rules the substrate needs to function as a computer rather than as an inert store. Once those messages have been admitted, the substrate is bootstrapped: subsequent messages enter as ordinary content, processed by the same algebra that processed the bootstrap messages.

The discipline is the substrate's answer to the question "how does the substrate begin?" A substrate without bootstrap discipline has a privileged constructor — a runtime call that pre-populates content, hardcodes identity, embeds vocabulary in the runtime — and the constructor's content is unaccountable: the substrate cannot audit its own beginning, because the beginning happened outside the substrate's audit discipline.

## The structural commitment

The substrate has *no special primitive for booting*. The first messages arrive through the same admission path as all subsequent messages — the same [reification](reification.md) discipline, the same admission checks, the same witness emission, the same event-log append. What distinguishes bootstrap messages from later messages is not their admission path but their *sender*: bootstrap messages are projected into the substrate's scope by an out-of-scope sender, where "out of scope" means the sender entity is not yet present in the substrate's content at the moment the message arrives.

The substrate's identity is itself bootstrapped. The first messages assert predications declaring the substrate's identity (its hostname, its content-addressed root identifier, its declared scope vocabulary). After admission, the substrate has a self-identity entity it can refer to in subsequent operations.

## What the bootstrap admits

A bootstrap typically admits four classes of content, each as ordinary messages:

- **Self-identity.** The substrate's own identifier as a substrate entity — the entity that messages emitted by the substrate runtime can cite as their sender.
- **Operator specifications.** The substrate's [closure rules](closure-rule.md), [shapes](theories/agential-orchestration-platform/concepts/shape.md), and [repair-catalog](../objects/repair-catalog.md) entries that govern how subsequent content is processed. Per [self-representation](self-representation.md), these are themselves substrate content; bootstrapping them is asserting predications, not running a configuration loader.
- **Initial vocabulary.** The predicates the substrate's first scope admits. Per [vocabulary-completeness](vocabulary-completeness.md), the vocabulary is what determines what claims are admissible at bootstrap time; further predicates can be added later as ordinary messages.
- **Bridges to external boundaries.** If the substrate is configured to ingest from external sources (filesystem, network, sensor stream), the [interfacer](interfacer.md) entities that govern those boundaries are admitted as bootstrap content.

Once bootstrapped, the substrate can answer any question for which the relevant closure rules have been established. Questions whose answer requires content the bootstrap has not provided literally have no answer — which is the correct behavior. There is no privileged escape hatch for "ask anything."

## The out-of-scope sender

The sender attribution problem at bootstrap is structural: the first message cannot have a sender that already exists in the substrate, because the substrate is empty. The discipline's answer is that the first sender is *projected* into the substrate's scope by an entity outside the substrate's own scope. The host runtime's identity (its hostname, its OS-level identity) is the typical out-of-scope sender; the substrate's first messages cite this identity as the sender, and one of the first messages asserts the predications that bring this identity into the substrate's scope as a substrate entity.

After this point, the entity is in scope; subsequent messages from the same sender are ordinary in-scope messages, and the bootstrap distinction has dissolved.

## Engineering consequences

- **No constructor magic.** A substrate's beginning is a sequence of reified messages. There is no constructor function that pre-populates state. The substrate's first state is whatever its first messages produced.
- **Bootstrap is replayable.** Per [source-of-truth](source-of-truth.md), the bootstrap messages are in the event log alongside subsequent content; replaying the log from the beginning reconstructs the substrate's state including its bootstrap. Two substrates loaded from the same log have the same bootstrap state.
- **Bootstrap is editable.** Editing what the substrate bootstraps is editing the bootstrap messages — adding new initial vocabulary, removing an obsolete operator specification, revising a shape. The substrate's discipline of "edit-then-replay" applies to bootstrap content as it does to any other content.
- **Multiple bootstrap profiles compose.** A substrate may admit multiple bootstrap message-bundles in sequence — a "core" bootstrap that establishes basic vocabulary, a "scope" bootstrap that establishes a particular application's operators, a "session" bootstrap that establishes the current operating context. Each bundle is a sequence of ordinary messages; the composition is admission in order.
- **Bootstrap failures are substrate violations.** If a bootstrap message's admission fails (a closure rule rejects the content, the sender's signature fails verification, the substrate's value-domain produces a contradiction), the substrate is left in a partially-bootstrapped state and its further operation is suspended pending governance decision. The substrate's discipline is to surface bootstrap failures as substrate-level events, not as runtime crashes.

## Position in the substrate

Bootstrap is the substrate's *cold-start discipline*. Per [substrate-universality](substrate-universality.md), the same substrate machinery can be pointed at any data source, any folder, any network endpoint; what makes a particular pointing into a *particular predicated computer* is the bootstrap content that was admitted to its scope. The substrate's universality follows from its bootstrap discipline: a substrate is universal because its identity and behavior are determined by its bootstrap content, not by hardcoded runtime structure.

The pattern composes with [reification](reification.md) (bootstrap messages are reified messages), with [event-log](../objects/event-log.md) (bootstrap messages are the first events in the log), with [source-of-truth](source-of-truth.md) (the event log is the authoritative record of bootstrap), and with [scope](scope.md) (bootstrap establishes the scope's vocabulary and admission discipline).
