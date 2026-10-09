---
type: concept
class: pattern
depends-on: [boundary, canonical-form]
see-also: [insertion, retraction, traversal]
---

# Interfacer

The pattern by which a predication substrate translates between its internal predication content and an external representation (markdown text, JSON document, JSON-RPC message, agent context window, HTTP body, file format). An **interfacer** is the substrate's I/O discipline: the rules that govern how predications enter the substrate from outside and how predications exit the substrate to outside, with the substrate-level guarantees that round-trips do not silently corrupt content.

## Three operations

Every interfacer realizes three operations on its boundary:

- **Extract.** Read external representation $\to$ predications. The interfacer parses the external format (markdown, JSON, etc.) and produces predications that enter the substrate via [insertion](../morphisms/insertion.md). Extraction is the *read* direction: external content becomes substrate content.
- **Apply.** Predication-changes $\to$ modified external representation. The interfacer takes a set of insertions and retractions destined for content already represented externally and produces the corresponding edit to the external representation. Apply is the *write* direction: substrate-recorded changes become external content.
- **Compose.** Multiple substrate fibers $\to$ new external representation. The interfacer reads multiple predications, possibly across multiple entities, and emits a derived external representation that is *not* a direct serialization of any one entity's content. Compose is the *observation* direction: substrate content becomes a derived document.

The three operations are not symmetric. Extract and apply form a [canonical-form](canonical-form.md) round-trip pair (write what you read, read what you wrote, get back the same predications). Compose is unidirectional: a composed observation can be re-extracted from its emission, but the composition itself is not invertible — multiple substrate states can produce the same composed output.

## The counit law

For an extract-apply pair on a single representation, the substrate's discipline is:

$$\textsf{extract}(\textsf{apply}(\Delta, c)) = \textsf{extract}(c) \oplus \Delta$$

Read in words: applying a change-set $\Delta$ to external content $c$ and then extracting from the result yields the original content's predications joined with the change-set's predications. This is the *counit law* of the interfacer: write-then-read round-trips losslessly. An interfacer that fails the counit law is broken; its applies silently lose information that subsequent extracts cannot recover.

A second law is **apply-coassociativity**: applying $\Delta_1$ and then $\Delta_2$ to content $c$ yields the same result as applying their composition $\Delta_2 \circ \Delta_1$ in one step. This is what makes batched edits and incremental edits interchangeable.

A third is **locality of glue**: when two compatible apply operations are issued against the same content, their effects glue (per [coherence-glue](../morphisms/coherence-glue.md)). When they are incompatible, the substrate emits a contested predication rather than one apply silently overwriting the other.

The three laws together are the substrate's contract that interfacers are not lossy serialization adapters but algebraically-disciplined translators.

## Layered architecture

Engineering realizations of an interfacer separate four layers:

- **Entity fibers** — *what* the predications are. Substrate content.
- **Precompiled cache** — fast-lookup representation of the fibers, computed deterministically from substrate content.
- **Stepping mechanism** — a small piece of stable runtime code that walks predications and applies the interfacer's per-format rules. The code is kept minimal; per-format variation lives in entity content, not in the stepping code.
- **Protocol adapter** — the *where/when* of the interfacer: which file system path, which network port, which request channel. Substrate-external concerns isolated from substrate content.

The architecture's discipline is that adding a new format or a new content rule should be a substrate edit (add an entity defining the format's pattern), not a code change to the stepping mechanism or protocol adapter. The stepping mechanism is small and stable; the entity-defined rules carry the variation.

## Validation as composition

When external content is being extracted into substrate content, the substrate's [shape](theories/agential-orchestration-platform/concepts/shape.md) discipline can be applied as part of the interfacer's extract: the extracted predications are composed against the type's shape predications, and a contradiction (a predication whose extracted value disagrees with the shape's expectation) surfaces as a contested predication rather than a silent reject. The substrate's response is then either to accept the contested state (admit the predication and record the contradiction for later reconciliation per the substrate's [repair](repair.md) discipline) or to refuse the extract and surface the contradiction to the caller. The choice is per-interfacer policy.

The pattern means *validation is composition*, not a separate code path: the same algebra that produces substrate content evaluates whether the content is admissible.

## Position in the substrate

Interfacers are the substrate's *external surface discipline*. Without them, every I/O is an ad-hoc serialization with no algebraic guarantees: round-trips lose information, parallel applies silently clobber, format additions are code changes. With them, the substrate's content has a stable contract with the outside world: any external representation is a deterministic function of substrate content, any external edit is a deterministic substrate change, and the substrate's audit trail covers every transition.

The pattern composes with [boundary](boundary.md): a boundary is the structural edge between two substrate regions, and an interfacer is the discipline that governs predication flow across that edge when the regions speak different external formats. The two are orthogonal; a substrate may have interfacer-mediated flows internally (between sublocales speaking different vocabularies) and boundary-controlled flows externally (between the substrate and its host runtime).
