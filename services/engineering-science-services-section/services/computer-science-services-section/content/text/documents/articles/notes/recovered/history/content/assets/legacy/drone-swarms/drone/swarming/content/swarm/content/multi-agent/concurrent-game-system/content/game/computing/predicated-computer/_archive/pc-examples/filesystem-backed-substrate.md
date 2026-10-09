---
type: example
status: documented
instantiates: [interfacer, source-of-truth, bootstrap, substrate-universality]
---

# A filesystem-backed substrate over an arbitrary directory

A working JavaScript implementation pairs the substrate's algebra and event-log model with a filesystem-server package: directory walk, blob store, format projectors for markdown/yaml/json/jsonl/javascript, and snapshot+delta replay. Pointing the runtime at any directory produces a substrate over that directory's content. The filesystem-server is a worked example of the substrate's [interfacer](teaching/explanations/interfacer.md), [source-of-truth](teaching/explanations/source-of-truth.md), and [substrate-universality](teaching/explanations/substrate-universality.md) disciplines applied at a real-world I/O boundary.

This example traces what the filesystem-server's responsibilities are and how each maps to a substrate-level concept.

## Boundary structure

The filesystem-server's three responsibilities:

- **Disk → Claims.** Walk a directory tree (honoring `.gitignore` / `.farsignore`), emit `ingest-file` events for each file's path and content hash, parse format-recognized files (markdown, yaml, json, jsonl, javascript) into claim sets through their format projectors. Per [interfacer](teaching/explanations/interfacer.md), this is the *extract* operation: external bytes become substrate predications.

- **Claims → Disk.** A `format-projection.create(root, model, options)` walks the model's claims for files of recognized formats and writes the corresponding bytes back. Per [interfacer](teaching/explanations/interfacer.md), this is the *apply* operation. The substrate's [counit law](../theorems/interfacer-counit-law.md) holds: parsing a file written from claims recovers the same claims (modulo non-predication artifacts the projector explicitly admits or excludes).

- **Persistence in-place.** A `.fars-store/` subdirectory inside the substrate's root carries the event log channels (substrate, messages, filetypes, kernel, meta), the content-addressed blob store, and snapshot files. Per [source-of-truth](teaching/explanations/source-of-truth.md), the event log is authoritative; the snapshot is an accelerator. Restarting the runtime replays the log against the snapshot's cutoff to reach the latest state.

## Format projectors as interfacers

Each supported format has an interfacer entity (in this implementation, a JavaScript module) realizing the [interfacer](teaching/explanations/interfacer.md)'s three operations:

- `parse(content) → claims` — extract the format's predications from raw bytes.
- `claimsFor({path, model})` — the canonical claim set for the file at `path` under the current model.
- `create({path, claims, model}) → bytes` — apply: serialize claims into format-conformant bytes.

Each module is small and stable. The format projectors for markdown, yaml, json, jsonl, javascript implement extract-apply pairs that pass the counit-law round-trip: write claims through `create`, read back through `parse`, get the same claims. The implementation cost of supporting a new format is one new module; runtime stepping code does not change.

## The substrate's ignorance of "filesystem"

The substrate's algebra has no concept of "filesystem." The filesystem-server is the boundary; everything inside the substrate is claims. A `path` is a predicate value, a `content-hash` is a value, an `extension` is a value. The substrate's settlement dispatcher matches closure rules over these claims regardless of how they got there. Per [substrate-universality](teaching/explanations/substrate-universality.md), the same substrate runtime pointed at a different filesystem (or a non-filesystem source — a database export, a mailbox, a sensor stream) produces a substrate over that source with the same machinery; only the boundary's interfacer changes.

## Persistence and replay

A typical session:

```js
import * as fs from "@561-group/predication-algebra-model-filesystem-server";
import * as projection from "@561-group/predication-algebra-model-filesystem-server/format-projection.js";
import { match } from "@561-group/predication-algebra-model";
import { blobs } from "@561-group/predication-algebra-model/event-log/index.js";

const root = "./content";

fs.regenerate(root);                        // walk + ingest-file events
const model = fs.open(root);                // replay log into in-memory model
projection.extract(model, { root, blobs }); // parse file contents into claims
```

Three load-bearing properties:

- `regenerate` is *idempotent*. Re-running with no filesystem changes emits zero new events — the content-hash predications already in the log do not change, so no new ingest events are produced.
- `open` *replays* the log. The in-memory model is a function of the log, per [source-of-truth](teaching/explanations/source-of-truth.md). If the snapshot is missing or corrupt, replay reconstructs the model from the log alone.
- `extract` is *separable*. The substrate persists in `.fars-store/` regardless of whether the user has parsed the file contents. Format projection is an additional operation the substrate runs on demand; the substrate's correctness does not depend on whether the contents have been parsed yet.

## Bootstrap: the host hostname as out-of-scope sender

When the substrate's `.fars-store/` does not yet exist at the root, the first run is a [bootstrap](teaching/explanations/bootstrap.md). Per the bootstrap discipline, the first messages cite the host's identity (default: `os.hostname()`) as the sender, and one of the first messages asserts the substrate's self-identity predications that bring this entity into scope. The bootstrap is just admission of ordinary messages; the substrate has no special primitive for booting.

After bootstrap, the substrate's content is whatever the directory contains, expressed as claims. Adding a file is admitting an `ingest-file` event with the file's path and content hash. Removing a file is a `file-deleted` event that elides the prior `ingest-file` per the substrate's elision discipline. Editing a file is a `file-changed` event that supersedes the prior content-hash predication.

## Position as an example

The filesystem-backed substrate is what makes [substrate-universality](teaching/explanations/substrate-universality.md) operative for the most common kind of data source — directories of text files. The example illustrates several substrate disciplines in one place:

- The boundary's interfacer-mediated structure (extract/apply/compose with the counit law).
- The persistence's source-of-truth discipline (events authoritative, snapshot accelerator).
- The runtime's [driver-substrate-split](teaching/explanations/driver-substrate-split.md): the filesystem-server is a thin pump (walk, parse, emit events; serialize, write); the substrate's content carries the program.
- The substrate-universality property: the same runtime, pointed at any directory, produces a predicated computer over that directory.
