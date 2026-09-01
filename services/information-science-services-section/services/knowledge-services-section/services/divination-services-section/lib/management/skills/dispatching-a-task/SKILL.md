---
name: dispatching-a-task
description: "Hands a seated task to a seated office by raising a dispatch — the record make-a-task.js points at when it says who the task is handed to belongs to the dispatch, never to the record. Refuses a task that seats nowhere, an office that seats in no roster, and a second dispatch of a task already dispatched. Use after raising a task, to put it on the board; a dispatch is open while the task's goal is unachieved, and openness is a readout, never a field."
---

A dispatch is the hand-off: a seated task, joined to the office that will
answer for it.

The vocabulary is exact, because each record carries one thing and the
dispatch is what joins them:

  - The TASK carries the goal — commands a machine runs, so the work can fail.
  - The DUTY carries the obligation — it stands, and the task discharges
    against it.
  - The OFFICE carries the answering-for — it outlives whoever holds it.
  - The DISPATCH is only the fact that a task and an office were joined,
    which is why it holds nothing else of substance.

It is handed to an office, never to a person, for the charter's reason
exactly: handed to a person it dies with the person. Handed to a session,
it dies with the context window.

## Openness is a readout

A dispatch is OPEN while the dispatched task's goal is unachieved, and that
is derived, never recorded: re-run the goal — `make-a-task.js --verify
<task>` — and the board is the truth. The record has no status field, no
open key, no closed key, and this is the same rule as the task's: a
dispatch that could assert its own closure would be the worker marking the
board instead of the goal marking it. The query that reads the whole board
this way is `list-open-obligations.js`, under
fulfilling-the-obligations-of-an-office.

## Run it

```sh
echo '{"id":"…","task":"<task-id>","office":"<office-id>"}' \
  | node .../dispatch-a-task.js

node .../dispatch-a-task.js --read <id>
node .../dispatch-a-task.js --list
```

Input is JSON. Output is JSON. `id` defaults to the task's id — one task,
one dispatch, so the task's name is usually the dispatch's.

## What it refuses, and why that is the skill

Emitting a dispatch is trivial; what makes it a hand-off rather than a
wish is that both ends exist and no other hand holds the same task:

- **A task that seats nowhere** — refused. Dispatching it hands an office
  nothing and leaves it answering for it anyway. Raise the task first
  (making-a-task); a dispatch hands over what exists.
- **An office that seats in no roster** — refused. A dispatch to nobody is
  the operator keeping the work, with a record saying otherwise.
- **A second dispatch of a task already dispatched** — refused, both named.
  Two dispatches of one task is two offices answering for one goal — a
  contradiction to name, not a queue to append to.
- **A dispatch id already seated** — refused, never overwritten.

## When NOT to use

- Not to raise the task — that is making-a-task. This hands over what
  already seats.
- Not to record that dispatched work is done. There is nothing to record:
  the goal settles it, and the witness re-runs it (attesting-a-work-product).
- Not to reassign a task. A dispatch is not amended; the contradiction of
  a second dispatch is deliberate. If the hand-off was wrong, that is a
  decision for the offices, taken where decisions are recorded — not a
  field to overwrite.
