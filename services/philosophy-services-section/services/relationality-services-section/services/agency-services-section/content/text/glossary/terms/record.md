---
name: "Record"
type: "page"
date-created: 2026-03-20
description: A Record is a triple (K, V, τ) — a key K that identifies the record and situates it within an indexing scheme, a value V that constitutes the record's content (a structured assignment from field names to field values), and a time-stamp or…
---

A Record is a triple (K, V, τ) — a key K that identifies the record and situates it within an indexing scheme, a value V that constitutes the record's content (a structured assignment from field names to field values), and a time-stamp or history marker τ that anchors the record to a specific moment in the history — such that the record persists and is accessible at all later histories. The defining property: a record is a committed fact — it has been written, not merely thought or planned. Once written, a record constrains the histories that can coherently follow it.

Table of contents

- [Formal definition](#formal-definition)

- [Records in type theory: record types and record values](#records-in-type-theory-record-types-and-record-values)

- [Records in law: registration, certification, and evidentiary records](#records-in-law-registration-certification-and-evidentiary-records)

- [Records in databases: the row as the atomic unit](#records-in-databases-the-row-as-the-atomic-unit)

- [Records in the history monoid: traces as records](#records-in-the-history-monoid-traces-as-records)

- [Open questions](#open-questions)


## Formal definition

A **Record** is a triple $\mathcal{R} = (K, V, \tau)$:

R=(K:Key,  V:Value,  τ:HistoryMarker)\mathcal{R} = (K : \mathrm{Key},\; V : \mathrm{Value},\; \tau : \mathrm{HistoryMarker})

where:

- $K$ is the **key** — the identifier that distinguishes this record from all others in the same indexing scheme; $K$ must be unique within its context; the key provides the external face of the record — the address by which it is retrieved, cited, and cross-referenced

- $V$ is the **value** (the record&rsquo;s content) — a structured assignment of values to named fields; in the simplest case, $V$ is a tuple $(f_1 = v_1, \ldots, f_n = v_n)$ where fif_i are field names and viv_i are their values; in richer cases, $V$ is a dependent record (fields whose types depend on prior fields) or a partial record (some fields may be absent or computed on access)

- $\tau$ is the **history marker** — the specific point in the history at which the record was committed; $\tau$ anchors $\mathcal{R}$ to a definite moment; the record is accessible at all $t \geq \tau$ (it persists forward in history); it is not accessible at tR\mathcal{R} is a record iff:

- **Committed**: the record has been written — not planned, not queued, not intended. The commitment is the act that creates the record. A fact that is known but not written is not a record. A plan to create a record is not a record. The record exists from $\tau$ onward; before $\tau$, no record exists. This is what distinguishes a record from a belief or an intention.

- **Persistent**: once committed at $\tau$, the record persists at all subsequent histories $t \geq \tau$. A record that can be unwritten (overwritten without trace, deleted without audit) is not a full record. Record systems designed for accountability maintain append-only logs: records can be *annotated*, *superseded*, or *corrected* by new records, but the original record persists. The immutability of records is the foundation of their evidentiary value.

- **Structured**: $V$ is not raw data but structured content — a typed, field-organized value. The structure is what makes the record legible, retrievable, and composable with other records. A pure bit-string is data; a record is data plus structure. The structure makes the record interpretable by any agent that understands the schema.

## Records in type theory: record types and record values

In dependent type theory and programming language theory, a **record type** is a named product type:

RecordType  r={f1:A1,  f2:A2(f1),  …,  fn:An(f1,…,fn−1)}\mathrm{RecordType}\; r = \{f_1 : A_1,\; f_2 : A_2(f_1),\; \ldots,\; f_n : A_n(f_1, \ldots, f_{n-1})\}

where each field fif_i has a type AiA_i that may depend on the earlier fields&rsquo; values (dependent record). A **record value** is a term of a record type: a tuple $(f_1 = v_1, \ldots, f_n = v_n)$ where each vi:Ai(v1,…,vi−1)v_i : A_i(v_1, \ldots, v_{i-1}).

The record type is the **schema** — the specification of what fields exist and what their types are. The record value is the **instance** — the specific assignment of values conforming to the schema.

Every spec file in this system is a record in this sense:

- **Record type** = the `spec/` schema (the frontmatter template with `id`, `description`, `defines`, `params`, `output`, `ast` fields and their types)

- **Record value** = a specific spec file (e.g., `group.md` with its specific field assignments)

- **Key** $K$ = the `id:` field

- **Value** $V$ = the full frontmatter plus markdown body

- **History marker** $\tau$ = the `date-created:` field (the commitment event)

The `defines:` field is the record&rsquo;s **status function declaration**: &ldquo;the concept with key K counts as an entity in the relational system.&rdquo; The record&rsquo;s persistence property ensures that once `group.md` is written and committed, `Group` persists as a named entity at all subsequent histories.

## Records in law: registration, certification, and evidentiary records

Legal systems maintain records because records are the mechanism by which institutional facts are made durable and enforceable. The key legal record types:

**Public registers**: land registries, company registers, ship registries, birth registers. These are authoritative records of institutional facts: &ldquo;as of date $\tau$, parcel P is owned by person Q.&rdquo; The register entry is both a record (a committed fact) and a [StatusFunctionDeclaration](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/status-function-declaration.md): ownership is constituted by the register entry, not merely reported by it (in register-based systems). The key innovation of registration systems: the institutional fact (ownership, personhood, incorporation) is anchored to a record that can be retrieved, verified, and relied upon.

**Ship&rsquo;s log**: the master&rsquo;s official record of all significant events during a voyage — courses steered, weather, personnel changes, cargo events, incidents. The ship&rsquo;s log is the vessel&rsquo;s [History](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/math/relational-history-monoid.md) rendered as a linear record. In maritime law, the log is presumptive evidence of what occurred; discrepancies between the log and other evidence must be resolved in favor of the log absent clear proof of falsification. *The log is the vessel&rsquo;s memory.*

**Court records**: the official transcript and record of proceedings — the pleadings, evidence, orders, and judgments of a case. Court records are both evidentiary (what happened in the proceeding) and constitutive (the judgment is the court&rsquo;s finding; the record of the judgment is the institutional fact of the judgment&rsquo;s existence). The *res judicata* doctrine (a matter once judged cannot be relitigated) is the legal doctrine of record persistence: once a matter is in the record, it constrains all subsequent proceedings.

**The Public Record**: in English law, &ldquo;a matter of record&rdquo; has a specific meaning — it is a fact established by an official court record that cannot be contradicted by other evidence. The record is conclusive. This is the strongest form of record persistence: not merely stored but irrefutable.

## Records in databases: the row as the atomic unit

In relational database theory (Codd, 1970), a **record** (or **row**) is a tuple — one instance of a relation (a table). The table schema defines the record type (field names and types); each row is a record value.

The relational model:

- **Relation** = a set of tuples (records) all conforming to the same schema

- **Key** = a minimal set of fields that uniquely identifies a record within the relation

- **Normalization** = the process of removing redundancy from records to ensure that each fact is stored in exactly one place

Codd&rsquo;s insight: a database is not merely a store of records but a store of *facts* — atomic, independent, compositional. The relational model is based on mathematical relations (set theory): a table is a relation in the mathematical sense; querying the database is computing new relations from old ones.

**ACID properties** (the guarantees of a transactional database system):

- **Atomicity**: a transaction either commits fully or not at all — no partial records

- **Consistency**: a committed transaction leaves the database in a valid state — records conform to their schema and constraints

- **Isolation**: concurrent transactions do not interfere — each transaction sees a consistent snapshot

- **Durability**: once committed, a record persists even through system failures — the committed fact survives crashes

The ACID properties are the database formulation of the record invariants: commitment (atomicity + durability), persistence (durability), and structure (consistency).

**Immutability and audit logs**: some systems maintain **append-only logs** where records are never modified — only new records are appended. The history of changes is preserved. This models the ideal record system: all records from all times are accessible. The history at time $t$ is exactly the set of records committed at or before $t$.

## Records in the history monoid: traces as records

In the relational hyperverse, a **history** $t \in T$ (an element of the history monoid) is itself a record — the trace of all steps taken to reach the current state. The history is the key $K$ of the current state; the fiber HtH_t is the value $V$ available given that history; the empty history $\varepsilon$ is the beginning of the trace.

Every step $s \in \Sigma$ that extends a history $t$ to $s \star t$ is a **record event**: a committed act that extends the current trace. The history monoid is the record of all such extensions: it is the set of all possible traces, structured by the monoid operation of concatenation.

The **restriction maps** H(f):Ht′→HtH(f) : H_{t&#x27;} \to H_t for prefix f:t→t′f : t \to t&#x27; are the operations that allow reading earlier records from later histories: given that we are at t′t&#x27;, we can access the information available at the earlier history $t$ by restricting. The fiber HtH_t is the &ldquo;record as of history tt&rdquo; — the full information state committed by history $t$.

**Entity files as records in H_t**: every entity file in a FARS locale is a record committed at some history $\tau$ and persisting through all subsequent histories. The entity file&rsquo;s `date-created:` field is the history marker $\tau$. The file&rsquo;s content is the value $V$. The file&rsquo;s `id:` field is the key $K$. The file is the physical implementation of the record triple $\mathcal{R} = (K, V, \tau)$.

**Fixed fiber as the settled record set**: Ht∗H^*_t is the sublattice of HtH_t consisting of propositions that are both meaning-settled ($\mathrm{Fix}(\sigma_t)$) and execution-settled ($\mathrm{Fix}(\Delta_t)$). These are the *settled records* — the facts that have passed through both nuclei and are fully institutionally established at history $t$. An element of Ht∖Ht∗H_t \setminus H^*_t is present (in the fiber) but not yet settled (still being processed by the nuclei).

**The record at the frontier**: at the current history $t = \varepsilon \star s_1 \star s_2 \star \ldots \star s_n$, the records in Ht∗H^*_t are the settled institutional facts. Records in Ht∖Ht∗H_t \setminus H^*_t are pending — present but not yet fully processed. Future steps sn+1s_{n+1} will either settle them (moving them into Hsn+1⋆t∗H^*_{s_{n+1} \star t}) or leave them pending.

## Open questions

- Whether the ACID properties (atomicity, consistency, isolation, durability) have formal nuclear analogs — whether atomicity corresponds to the all-or-nothing character of reaching Ht∗H^*_t, consistency to the constraint that all records in Ht∗H^*_t are mutually consistent (no contradictions in the Heyting algebra), isolation to the fiber&rsquo;s independence from other concurrent fibers, and durability to the persistence property of the fixed fiber across future histories.

- Whether there is a formal distinction between **mutable records** (records whose content can be updated in place, losing the old value) and **immutable records** (records that persist at their original value, with updates creating new records) — and whether this corresponds to the distinction between ordinary elements of HtH_t (which may shift under nucleus application) and elements of Ht∗H^*_t (which are stable at their settled values).

- Whether the append-only log structure has a direct fiber analog — whether the full history $t = s_1 \star \ldots \star s_n$ is the &ldquo;append-only log&rdquo; and the fiber HtH_t is the &ldquo;current state derived from the log&rdquo; — and whether this makes every relational universe an implicit append-only log system.

- Whether **schema evolution** (changing the record type while preserving existing records) corresponds to a morphism between fibers — a natural transformation that maps records under the old schema to records under the new schema, and whether this is always possible (all schemas are interoperable) or only when certain compatibility conditions hold.
