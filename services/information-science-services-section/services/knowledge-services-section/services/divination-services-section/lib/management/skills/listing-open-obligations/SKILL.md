---
name: listing-open-obligations
description: "Reads the dispatch board and derives which dispatches are OPEN — a dispatch is open while its task's goal is unachieved, achievement derived by re-running the goal (make-a-task.js --verify), never read from any record. Given an office, reads only that office's board; given nothing, the whole board. Use at session start to learn what an office owes, and any time the question is what work is outstanding — the answer is executed, not remembered."
---

The board is the truth because nobody wrote it down.

A dispatch record names a task and an office, and nothing else — no status,
no open key, no closed key. So the only way to know what is outstanding is
to ask the goals, and that is this script: for every dispatch (or every
dispatch to one office), re-run the dispatched task's goal and report the
dispatch OPEN where the goal is unachieved. Achievement is derived by
`make-a-task.js --verify` — the one derivation, called and never copied —
so this query and the witness's instrument can never disagree.

Slower than reading a status field, on every occasion. That is the cost of
a board that cannot drift: a status field is the worker's memory of the
work, and this is the work, asked directly.

## Run it

```sh
node .../list-open-obligations.js                    # the whole board
node .../list-open-obligations.js <office>           # one office's board
node .../list-open-obligations.js --pool <enterprise>/dispatches --task-pool <enterprise>/tasks
```

`--pool` names the dispatch board and `--task-pool` the tasks pool the
derivation runs against — absent, both fall back to the emsenn enterprise's,
so a foreign enterprise's board names its own pools or reads the wrong ones.

Output is JSON: every dispatch on the queried board, `open` (with the gap —
the goal conditions that did not settle) or `settled`. Exits 0 when the
query ran whole, 1 on a contradiction — a dispatch naming a task that
seats nowhere, or an office argument that seats in no roster.

## When NOT to use

- Not to close a dispatch. Nothing closes a dispatch; the goal settling
  closes it, and this only reports that it has.
- Not as the worker's proof its own work is done. The same rule as
  --verify, whose readout this carries: a worker running it on itself
  proves nothing. Attestation belongs to attesting-a-work-product.
- Not to decide what to work first. The board is a board, not a queue;
  ordering the work is the incumbent's judgment at the board.
