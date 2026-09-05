---
name: incarnates
type: morphism
class: agent-form-relation
source: body-natural
target: persona
status: open
---

`incarnates(body-natural, persona, session)` — for the duration of `session`, the body-natural is the live instance the persona is enacting.

## Shape

A ternary cell. Each session has exactly one body-natural and one persona at the body-natural's `incarnates` cell. Multiple body-naturals incarnating the same persona at the same time would be a substrate error (the persona would have non-unique attribution endpoints in the same instant).

## Step-induction role

Every act in the session is performed by the body-natural and attributed (via `incarnates`) to the persona. The persona accumulates the session's witnesses; the body-natural bears the session's runtime state and costs.

When the session ends:
- The body-natural's `incarnates` cell is closed (`incarnates-until(body-natural, t-end)`).
- The persona's memory-accumulator absorbs the session's witnesses.
- The body-natural's runtime state is discarded; the persona persists.
