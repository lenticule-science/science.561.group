---
name: form
description: A categorical object equipped with an inhabitance relation to a base set — a Bourbaki / Mac-Lane structure carrying the additional data of which entities (elements of the base) realize it.
references:
  - id: bourbaki1968
    type: book
    title: Theory of Sets
    publisher: Hermann
    location: Paris
    author:
      - literal: Bourbaki, Nicolas
    issued:
      - year: 1968
  - id: maclane1971
    type: book
    title: Categories for the Working Mathematician
    publisher: Springer
    location: New York
    author:
      - literal: Mac Lane, Saunders
    issued:
      - year: 1971
  - id: lambek-scott1986
    type: book
    title: Introduction to Higher-Order Categorical Logic
    publisher: Cambridge University Press
    location: Cambridge
    author:
      - literal: Lambek, Joachim
      - literal: Scott, Philip J.
    issued:
      - year: 1986
title: form
---

A **form** is a pair $(S, \mathrm{inh})$ where:

- $S$ is a structure in the Bourbaki / Mac-Lane sense [@bourbaki1968, ch. IV; @maclane1971, ch. II §1] — a categorical object equipped with a signature declaring its characterizations and a set of axioms those characterizations must satisfy.
- $\mathrm{inh} \subseteq E \times \{S\}$ is the *inhabitance relation* between a base set $E$ of entities and the singleton-class of $S$, sending each element $e \in E$ to $\{S\} \cap \{S : e \text{ satisfies } S\text{'s signature}\}$.

A structure becomes a form when an inhabitance relation is exhibited for it. A form's inhabitance relation is the data that distinguishes the categorical-logic reading of the structure (an interpretation in a semantic category, with elements realizing the type; [@lambek-scott1986, Part II §11]) from the purely-syntactic structure (signature plus axioms, no chosen interpretation).

The compound **structure-form** names this joint type: a structure-form is a structure paired with its inhabitance relation. Every form is a structure-form by definition; the compound emphasizes that both pieces of data — the categorical-object side and the inhabitance side — are in play.

## The X-form compound pattern

A form has a name. The compound `X-form`, for a name `X`, denotes the form whose underlying structure is named `X`. Examples:

| Compound          | Underlying structure           | Inhabitance carriers                                  |
|-------------------|--------------------------------|--------------------------------------------------------|
| structure-form    | a structure                    | records at `code/structures/<slug>.md`                |
| transformer-form  | a transformer (morphism)       | records at `code/transformers/<gerund>.md`            |
| skill-form        | a skill                        | directories at `doing/working/hacking/doing/working/skills/<slug>/`          |

The compound is not a separate record; it is a compound noun. The record at `code/structures/X.md` is the structure $S$ of the form `X-form`; the inhabitance relation is exhibited by the carriers shown.

## Open obligation

Records in the corpus already use compounds such as `agent-form`, `entity-form`, `character-form`, `persona-form`, `officer-form`, `body-natural-form`, `role-form`. Whether each of these compounds names a form in the sense defined above — that is, whether each names a structure paired with a coherently-exhibited inhabitance relation — is a per-record audit that has not been performed. Some older records may use `X-form` in ways that do not match this definition. Updating those records is follow-up work.

The definition above is the math the audit will check against; it is not derived from the prior usage but stated independently and provable from the categorical-algebra source.
