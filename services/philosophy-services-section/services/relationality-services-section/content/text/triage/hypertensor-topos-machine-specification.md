# Relational Hypertensor Machine v1.0  
*(Standalone Operational Specification)*

## 0. Purpose and Scope

This document specifies a **deterministic, implementable runtime** (“the Machine”) whose behavior is fully determined by:

- finite algebraic structures called **Cells**;
- **witness traces** capturing temporal structure;
- **Profiles**, which provide local term languages, typing, judgments, and semantics over Cells;
- an **Instruction Set Architecture (ISA)** of primitive operators;
- a **Program** layer built over the ISA;
- a single external operation `submit_observation`.

The intent is that a competent engineer (or code model) can build a conformant engine **without any other document**. Hypertensor / topos language is allowed as motivation, but all normative content is in this file.

When there is tension between options, this spec always takes the **most constrained / most canonical** choice.

---

## 0.1 Requirements Language and Conventions

We use RFC 2119‑style keywords:

- **MUST / MUST NOT** — strict requirements;
- **SHOULD / SHOULD NOT** — strong recommendations;
- **MAY** — allowed but not required.

We distinguish:

- **Normative** sections: define required behavior and data shapes.
- **Informative** notes: explanations and non‑binding examples.

### 0.1.1 Canonical JSON and Hash IDs

All persistent objects are represented in **canonical JSON** and identified by hash‑derived IDs.

**Canonical JSON:**

- Object keys sorted lexicographically.
- Arrays in a deterministic order as specified per type below.
- Numbers use a fixed representation (e.g. no trailing `.0`, no leading `+`).
- Strings are UTF‑8, with a fixed escaping strategy.

**Hash‑derived IDs:**

- For any payload `payload`, let `bytes = canonical_json(payload)` and `id = sha256(bytes)` (32‑byte digest, encoded as 64‑char lowercase hex).
- `CellID`, `ProfileID`, `EdgeID`, `ProgramID`, etc., are always such hashes.
- Any mismatch between stored ID and recomputed hash MUST be treated as an `implementation_error`.

---

## 0.2 Runtime Ontology

At runtime there are only these primitive carriers:

- **Cell** — finite algebraic recognition unit.
- **Trace** — finite sequence of **TraceStep**s with normalization.
- **Profile** — semantic layer over one or more Cells (syntax, typing, judgments, semantics).
- **Program** — finite linear composition of operators.
- **Edge** — a single operator instance in the ambient operator graph.
- **MachineState** — the global mutable state: all Cells, Profiles, and Edges.

No other mutable global state is allowed. Caches or indices are derived and MUST NOT affect observable behavior.

---

## 1. Cell Specification (Normative)

### 1.1 Cell Carrier and Operations

Each **Cell** is a finite structure:

```text
Cell:
  id:            CellID
  elements:      list[Element]
  bottom_index:  int              # index into elements
  top_index:     int              # index into elements
  leq_matrix:    list[list[bool]] # leq_matrix[i][j] = True iff e_i ≤ e_j
  meet_table:    list[list[int]]  # meet_table[i][j] = k
  join_table:    list[list[int]]  # join_table[i][j] = k
  imply_table:   list[list[int]]  # imply_table[i][j] = k
  negate_table:  list[int]        # negate_table[i] = j
  nucleus_table: list[int]        # nucleus_table[i] = j
  flow_table:    list[int]        # flow_table[i] = j
  meta:          object           # optional, semantically irrelevant
```

Where:

- `elements` is a non‑empty list; each element is opaque payload (may be a small record), but its **position** is its semantic identity.
- All tables reference indices in `0 .. len(elements)-1`.

**Normative requirements:**

1. `leq_matrix` defines a **finite bounded lattice**:
   - partial order: reflexive, antisymmetric, transitive;
   - `bottom_index` and `top_index` are least/greatest;
   - `meet_table`/`join_table` compute infimum/supremum w.r.t. this order.
2. `imply_table`, `negate_table` define at least **Heyting implication & negation** compatible with the order; in particular:
   - `imply(a,b)` is the largest `c` such that `meet(a,c) ≤ b`;
   - `negate(a) = imply(a, bottom)`.
3. `nucleus_table`, `flow_table` are **monotone, idempotent, extensive** operators:
   - `a ≤ nucleus(a)` and `nucleus(nucleus(a)) = nucleus(a)`;
   - `flow(flow(a)) = flow(a)` (idempotent);
   - both monotone with respect to `≤`.

All of this MUST be checkable purely from the finite tables.

### 1.2 Element and Recognition

We distinguish:

```text
ElementIndex  ::= int                # position in elements list
Recognition   ::= { "cell": CellID, "index": ElementIndex }
```

The canonical representation of a recognition is **exactly** that pair.

**NF_recognition:**

```text
NF_recognition(rec: Recognition, MS: MachineState) → Recognition | Error
```

Algorithm:

1. Look up `cell = MS.cells[rec.cell]`. If absent → `Error("unknown_cell")`.
2. Check `0 ≤ rec.index < len(cell.elements)`. If not → `Error("bad_index")`.
3. Return `rec` unchanged.

In this strict v1 spec, there are **no “alias” elements** inside a Cell: all recognitions are already canonical. Any “equivalence of presentations” lives entirely in Profiles and traces.

---

## 2. Hypertensor Instance and Ground Cell

### 2.1 Hypertensor Background (Informative)

The name “Hypertensor” motivates the idea that:

- Each Cell is a finite local piece of an underlying quasicrystalline universe.
- `nucleus` / `flow` correspond to internal closure and time‑like evolution.

**However:** no external “HTT‑SPEC” is required. Everything needed to build the runtime is contained here.

### 2.2 Ground Cell (Normative)

A conformant implementation **MUST** ship with exactly one initial Cell: the **Ground Cell**.

Canonical payload (in prose; JSON is determined by §0.1):

```text
elements:      [ e_bottom, e_top ]         # positions 0 and 1
bottom_index:  0
top_index:     1

leq_matrix:
  [ [ True,  True  ],
    [ False, True  ] ]

meet_table:
  meet(0,0) = 0; meet(0,1) = 0
  meet(1,0) = 0; meet(1,1) = 1

join_table:
  join(0,0) = 0; join(0,1) = 1
  join(1,0) = 1; join(1,1) = 1

imply_table:   standard implication on {⊥,⊤}
  imply(0,0) = 1; imply(0,1) = 1
  imply(1,0) = 0; imply(1,1) = 1

negate_table:
  negate(0) = 1
  negate(1) = 0

nucleus_table:
  nucleus(0) = 0
  nucleus(1) = 1

flow_table:
  flow(0) = 0
  flow(1) = 1
```

The Ground Cell is conceptually “just true/false” with trivial nucleus and flow.

### 2.3 Additional Cells

The spec allows additional Cells to be created by Programs, but every Cell MUST satisfy §1.1. This document does **not** require any other hypertensor structure beyond those finite tables.

---

## 3. Traces and Witness Semantics

### 3.1 TraceStep and TraceStepKind

Traces encode temporal structure as sequences of steps.

```text
Trace:
  steps: list[TraceStep]

TraceStep:
  kind:      TraceStepKind
  payload:   object         # kind-specific
  read_ids:  list[SupportID]
  write_ids: list[SupportID]
```

`SupportID` is a string encoding “what this step touches”. For v1:

```text
SupportID ::= "cell:<CellID>"
            | "profile:<ProfileID>"
            | "judgment:<JudgmentID>"
            | "program:<ProgramID>"
            | "edge:<EdgeID>"
```

#### 3.1.1 Fixed StepKind Registry (Normative)

`TraceStepKind` is a **closed** enum in v1:

- `OperandStep` — marks initial recognition witnesses (e.g. reading `(cell,index)`).
- `OperatorStep` — application of an ISA operator.
- `JudgmentStep` — introduction or transformation of a judgment.
- `ObsIntakeStep` — intake of an external observation.
- `ObsKernelStep` — internal normalization of an observation term/trace.
- `ObsNucleateStep` — stabilization of an observation into profile invariants.
- `ProfileConstructStep` — steps in profile construction.
- `ProgramStepMarker` — bookkeeping for Program execution (optional).

Implementations MUST NOT introduce new `TraceStepKind` values in v1.

For each `TraceStepKind`, the implementation MUST define:

- JSON schema of `payload`.
- How to compute `read_ids` and `write_ids` from the payload and current `MachineState`.

### 3.2 Independence and NF_trace

Two steps `s1`, `s2` are **dependent** if any of:

- they write to the same `SupportID`;
- one writes to a `SupportID` that the other reads;
- they are both `ObsIntakeStep` for the same `ProfileID`.

Otherwise, they are **independent**.

This gives a binary relation `dependent(s1,s2)` on steps; `independent` is its negation.

#### 3.2.1 Shuffle and Partial Order

Given a trace `t = [s_0, …, s_{n-1}]`, define a partial order `≺` on indices `0..n-1`:

- For any `i < j`, if `s_i` and `s_j` are dependent, then **mandate** `i ≺ j`.
- Close `≺` transitively.

Any linear extension of this partial order is a shuffle‑equivalent reordering.

#### 3.2.2 Canonical Normal Form NF_trace

`NF_trace` is defined as the **lexicographically minimal** linear extension of this partial order when steps are ordered by:

1. `key(s) = canonical_json({ kind, payload, read_ids, write_ids })`
2. Ties broken by original index.

Normatively:

```text
NF_trace(trace) → canonical_trace
trace_equiv(t1,t2) := (NF_trace(t1) == NF_trace(t2))
```

Algorithm (one valid implementation):

1. Construct a DAG `G` whose vertices are step indices `0..n-1`, with edges `(i → j)` if `i < j` and `s_i` and `s_j` are dependent.
2. While there are vertices not yet output:
   - Among vertices with no incoming edges in `G`, select the one with minimal `key(s)`.
   - Append its step to the output list.
   - Remove that vertex and its outgoing edges from `G`.
3. The resulting list of steps is `canonical_trace.steps`.

`NF_trace` MUST be deterministic and idempotent.

Implementations MUST use `NF_trace` for:

- comparing traces;
- storing traces in canonical form;
- projecting witnesses (`witness_recognition`, `witness_judgment`) as described next.

### 3.3 Witness Functions

There exist partial functions:

```text
witness_recognition: Trace → Recognition
witness_judgment:    Trace → JudgmentID
```

Requirements:

- Total on stored recognitions/judgments:
  - For every stored recognition `(c,e)` there exists some `t` with `witness_recognition(t) = (c,e)`.
- Stable under `NF_trace`:
  - If `witness_recognition(t) = r`, then `witness_recognition(NF_trace(t)) = r` as well (similarly for judgments).
- Compatible with Cell/ISA:
  - Witnesses for `meet`, `join`, etc., are built using the construction patterns below.

### 3.3.0 Canonical Witness Projection (Normative)

Define a total function:

```
project_recognition(trace, MS) → Recognition | Error
```

Algorithm:

1. Let `t = NF_trace(trace)`.
2. Scan `t.steps` from **left to right**, selecting the **last** `OperatorStep` whose operator has a recognition-typed output.
3. Extract its output `(cell, index)` and return `NF_recognition((cell,index), MS)`.
4. If no such step exists → `Error("no_recognition_output")`.

Define similarly:

```
project_judgment(trace, MS) → JudgmentID | Error
```

using the last `OperatorStep` with a judgment-typed output.

**Uniqueness Requirement:**  
If `NF_trace(t1) == NF_trace(t2)`, then  
`project_recognition(t1,MS) == project_recognition(t2,MS)` (and similarly for judgments).

Any stored recognition’s witness MUST satisfy this projection rule.


#### 3.3.1 Canonical Witness Construction (Normative)

For any ISA operator `op` with inputs `r1…rk` and output `r_out`:

1. Let `t_i` be canonical witnesses for each input recognition or judgment.
2. Create an `OperatorStep`:

   ```text
   step_op:
     kind:    "OperatorStep"
     payload: { "operator": op, "inputs": [i1, …, ik] }
     read_ids:  support of inputs
     write_ids: support of outputs
   ```

3. Define:

   ```text
   t_out = NF_trace(concat_trace(t_1, …, t_k, [step_op]))
   ```

4. Require `witness_recognition(t_out) = r_out` (or `witness_judgment` for judgment‑level operators).

This scheme is **normative** in v1. Alternative witness encodings MAY exist internally, but any canonical representation MUST be `NF_trace`‑equivalent to the one above.

---

## 4. Judgments and Contexts

### 4.1 Judgment Forms

We assume a minimal PTL‑style language (see §5) and define two main classes of judgments:

- **Typing judgments**: `Γ ⊢ term : Type`.
- **Semantic judgments**: `Γ ⊢ term ≡ term` or `Γ ⊢ φ` where `φ` is a profile‑specific proposition.

For normalization we care about their **canonical encoding**:

```text
Judgment:
  context: Context       # ordered list of bindings
  payload: JudgmentCore  # type judgment, equality, or proposition
```

`JudgmentID` is the hash of the canonical JSON of `Judgment`.

### 4.2 Context Normalization NF_context

A `Context` is a list of bindings:

```text
Binding:
  name: string
  type: Type
  origin: optional metadata
```

`Context` normalization:

1. Remove shadowed bindings: if the same `name` appears twice, keep only the **rightmost** occurrence.
2. Sort the remaining bindings lexicographically by `name`.
3. For each binding, ensure `Type` is in canonical form (see §5).

`NF_context(Γ)` performs this process and returns a canonical `Context`.

### 4.3 NF_judgment

`NF_judgment(J)`:

1. Normalize `J.context` with `NF_context`.
2. Normalize any contained types and terms via `NF_type` / `NF_term` (see §5).
3. Normalize any inner recognitions using `NF_recognition` (§1.2).
4. Re‑encode as canonical JSON.

Equal judgments are those with equal canonical JSON.

### 4.4 Semantic Judgment Calculus (Normative)

In v1, semantic judgments are restricted to:

```
Γ ⊢ a ≤ b          # order relation in any visible Cell
Γ ⊢ a = b          # equality, defined as a ≤ b and b ≤ a
Γ ⊢ φ ∧ ψ
Γ ⊢ φ ∨ ψ
Γ ⊢ φ → ψ
Γ ⊢ ⊤
Γ ⊢ ⊥
```

Inference rules:

1. Reflexivity: `Γ ⊢ a ≤ a`.
2. Transitivity: from `a ≤ b` and `b ≤ c`, infer `a ≤ c`.
3. Meet/Join laws:  
   - `Γ ⊢ a ∧ b ≤ a`, `Γ ⊢ a ∧ b ≤ b`;  
   - `Γ ⊢ a ≤ a ∨ b`, `Γ ⊢ b ≤ a ∨ b`.
4. Heyting implication:  
   - from `Γ ⊢ a ∧ c ≤ b`, infer `Γ ⊢ c ≤ (a → b)`.

`NF_judgment` MUST reduce semantic propositions using these rules and the Cell tables.

Profiles MAY extend the calculus but MUST NOT alter these core rules.


---

## 5. Profile Layer and PTL

Profiles provide a local term language, typing, judgments, and semantics.

### 5.1 Fixed Core Term Language (PTL)

In v1, the **core term language is *fixed*** and not parametrized by profiles. Profiles only influence:

- which recognitions exist;
- how terms are interpreted as recognitions;
- which additional judgments they track.

#### 5.1.1 PTL Types

We define a small type language:

```text
Type ::=
    Rec                      # recognition elements
  | Bool                     # truth values in profile topos
  | Prod(Type, Type)         # product
  | Sum(Type, Type)          # sum
  | Arrow(Type, Type)        # function type
  | FixTypeLeast(Functor)
  | FixTypeGreatest(Functor)
```

#### 5.1.2 Restricted Functors for Fixed Points

`Functor` is restricted to **polynomial functors over `Rec`**:

```text
Functor ::=
    FId                      # identity on the carrier of the type
  | FConst(Type)             # constant functor
  | FProd(Functor, Functor)
  | FSum(Functor, Functor)
  | FArrow(Functor, Functor)
```

- The semantics of `Functor` is always a **monotone endofunctor** on a finite poset; fixed points exist and are unique.
- Profiles MUST NOT introduce arbitrary custom `Functor` encodings in v1; only this grammar is allowed.

#### 5.1.3 PTL Terms (Abstract Syntax)

Terms:

```text
Term ::=
    Var(name)
  | Lam(name, Type, Term)
  | App(Term, Term)
  | Pair(Term, Term)
  | Fst(Term)
  | Snd(Term)
  | Inl(Term, Type)
  | Inr(Term, Type)
  | Case(Term, (name, Term), (name, Term))

  | FixLeast(name, Type, Term)        # μ
  | FixGreatest(name, Type, Term)     # ν

  # Recognition-level embeddings:
  | Recog(CellID, ElementIndex)
  | NucleusTerm(Term)
  | FlowTerm(Term)
  | MeetTerm(Term, Term)
  | JoinTerm(Term, Term)
  | ImplyTerm(Term, Term)
  | NegateTerm(Term)

  # Boolean-level terms (over Ω_P when present):
  | True
  | False
  | And(Term, Term)
  | Or(Term, Term)
  | Not(Term)
  | Implies(Term, Term)
```

#### 5.1.4 PTL EBNF (Concrete Syntax, Informative)

A concrete textual syntax is allowed and may follow a standard lambda‑calculus style; the normative semantics is the abstract syntax above. Any textual representation MUST round‑trip to/from this AST.

### 5.2 JSON Encoding of Terms and Types

**Types** as JSON:

```json
{ "kind": "Rec" }
{ "kind": "Bool" }
{ "kind": "Prod", "left": Type, "right": Type }
{ "kind": "Sum", "left": Type, "right": Type }
{ "kind": "Arrow", "from": Type, "to": Type }
{ "kind": "FixLeastType", "functor": Functor }
{ "kind": "FixGreatestType", "functor": Functor }
```

**Functors**:

```json
{ "kind": "FId" }
{ "kind": "FConst", "type": Type }
{ "kind": "FProd", "left": Functor, "right": Functor }
{ "kind": "FSum", "left": Functor, "right": Functor }
{ "kind": "FArrow", "from": Functor, "to": Functor }
```

**Terms**:

```json
{ "kind": "Var", "name": "x" }
{ "kind": "Lam", "name": "x", "type": Type, "body": Term }
{ "kind": "App", "fn": Term, "arg": Term }
{ "kind": "Pair", "fst": Term, "snd": Term }
{ "kind": "Fst", "term": Term }
{ "kind": "Snd", "term": Term }
{ "kind": "Inl", "term": Term, "right_type": Type }
{ "kind": "Inr", "term": Term, "left_type": Type }
{ "kind": "Case",
  "scrutinee": Term,
  "inl": { "name": "x", "body": Term },
  "inr": { "name": "y", "body": Term } }

{ "kind": "FixLeast", "name": "x", "type": Type, "body": Term }
{ "kind": "FixGreatest", "name": "x", "type": Type, "body": Term }

{ "kind": "Recog", "cell": CellID, "index": int }
{ "kind": "NucleusTerm", "term": Term }
{ "kind": "FlowTerm", "term": Term }
{ "kind": "MeetTerm", "left": Term, "right": Term }
{ "kind": "JoinTerm", "left": Term, "right": Term }
{ "kind": "ImplyTerm", "left": Term, "right": Term }
{ "kind": "NegateTerm", "term": Term }

{ "kind": "True" }
{ "kind": "False" }
{ "kind": "And", "left": Term, "right": Term }
{ "kind": "Or", "left": Term, "right": Term }
{ "kind": "Not", "term": Term }
{ "kind": "Implies", "left": Term, "right": Term }
```

All term equality and normalization uses this JSON representation with canonical key ordering.

### 5.3 Typing Rules (Normative)

Typing judgments:

```text
Γ ⊢ term : Type
```

V1 uses a standard simply‑typed λ‑calculus with products, sums, and the extra constructors above. Examples (schematic):

- Variables:

  ```text
  (x : A) ∈ Γ
  ───────────── VAR
  Γ ⊢ Var(x) : A
  ```

- Abstraction / application:

  ```text
  Γ, x:A ⊢ t : B
  ───────────────────────── LAM
  Γ ⊢ Lam(x:A, t) : Arrow(A,B)

  Γ ⊢ f : Arrow(A,B)    Γ ⊢ a : A
  ────────────────────────────── APP
  Γ ⊢ App(f,a) : B
  ```

- Recognition‑typed terms:

  ```text
  Γ ⊢ Recog(c,e) : Rec
  Γ ⊢ a : Rec, b : Rec  ⇒  Γ ⊢ MeetTerm(a,b) : Rec, etc.
  ```

- Fixed points (restricted by §5.1.2):

  ```text
  Γ, x:FixTypeLeast(F) ⊢ t : ⟦F⟧(FixTypeLeast(F))
  ───────────────────────────────────────────────  FIX-LEAST
  Γ ⊢ FixLeast(x:FixTypeLeast(F), t) : FixTypeLeast(F)

  Γ, x:FixTypeGreatest(F) ⊢ t : ⟦F⟧(FixTypeGreatest(F))
  ─────────────────────────────────────────────────────  FIX-GREATEST
  Γ ⊢ FixGreatest(x:FixTypeGreatest(F), t) : FixTypeGreatest(F)
  ```

Here `⟦F⟧` is the functor semantics on types induced by the restricted `Functor` grammar.

The typing rules themselves are not parametrized by the Profile; Profiles may **add additional judgments**, but the core typing is fixed.

### 5.4 Term Normalization NF_term and NF_type

`NF_type` and `NF_term` remove superficial syntactic variation:

- For `Type`, remove redundant parentheses, normalize nested products/sums (e.g. treat `(A × B) × C` as right‑associated or left‑associated consistently), and reorder symmetric forms in a canonical way.
- For `Term`, alpha‑convert bound variables to a standard scheme (e.g. de Bruijn indices encoded as canonical variables), normalize trivial β‑redexes where they do not change semantic behavior (or simply leave evaluation to semantics and keep terms as‑is; both are allowed as long as equalities use canonical JSON).

In this v1 spec, an implementation MAY choose to make `NF_term` be just “AST with alpha‑normalization and sorted annotations, no β‑reduction”, as long as it is deterministic and idempotent.

---

## 6. Profiles

### 6.0 Profile Evolution Model (Normative)

Profiles in v1 are **structurally immutable**:

1. `visible_cells` MUST NOT change after profile creation.
2. `fixed_recognitions` MUST NOT change unless:
   - a Cell in `visible_cells` is replaced by an identically-keyed Cell whose tables differ only in metadata, *or*
   - an operator explicitly reconstructs the Profile via `ConstructProfile`.
3. Profiles MUST NOT gain or lose recognitions except through observation-driven semantic judgments.
4. A judgment referencing recognitions not present in the Profile MUST be rejected with `Error("foreign_recognition")`.

This prevents Profiles from drifting semantically during long-running operation.


### 6.1 Profile Structure

A Profile is:

```text
Profile:
  id:              ProfileID
  visible_cells:   list[CellID]
  fixed_recognitions: list[Recognition]    # all (cell,index) s.t. nucleus=flow=e
  term_env:        object                  # implementation detail
  judgment_env:    object                  # implementation detail
  meta:            object                  # optional, non-semantic
```

Constraints:

- `visible_cells` is a non‑empty list of distinct `CellID`s.
- `fixed_recognitions` contains **all and only** recognitions `(c,e)` such that:
  - `c ∈ visible_cells`;
  - `nucleus(c,e) = e` and `flow(c,e) = e`.

`fixed_recognitions` entries MUST be sorted by `(cell, index)` to canonicalize.

### 6.2 Term Semantics in a Profile

Evaluation judgment:

```text
Γ ⊢_P term ⇓ Recognition
```

Interpreted as: in Profile `P` and context `Γ`, `term` evaluates to a recognition `(cell,index)` among `P.visible_cells`.

**Core semantic clauses:**

- `Recog(c,e)` evaluates directly to `(c,e)` if `c ∈ P.visible_cells`.
- `MeetTerm`, `JoinTerm`, etc., apply the corresponding Cell operations.
- `NucleusTerm`, `FlowTerm` apply `nucleus_table` / `flow_table`.
- `FixLeast` and `FixGreatest` compute least/greatest fixed points of the monotone operator induced by `Functor` on the finite carrier, by **explicit iteration**:

  - For least fixed point over a finite lattice `(L,≤)`:

    ```text
    μF = lub { x ∈ L | F(x) ≤ x }
    ```

    Implemented by enumerating `L`, computing `F` on each, and checking `F(x) ≤ x`. (Any equivalent finite algorithm is acceptable; infinite methods are forbidden.)

  - Similarly for greatest fixed point as glb of `{ x | x ≤ F(x) }`.

Evaluation MUST:

- be deterministic and terminating for well‑typed terms over finite structures;
- use only ISA operators and Profile data (no hidden side effects).

---

## 7. Observation and Observation Normalization

### 7.1 Internal Observation Carrier

Internally, an observation is:

```text
Observation:
  trace: Trace
  term:  Term
```

It is always associated to a specific `ProfileID` (by the pipeline, not stored here).

### 7.2 NF_observation

`NF_observation(obs)`:

1. Replace `obs.trace` with `NF_trace(obs.trace)` (§3.2).
2. Replace `obs.term` with `NF_term(obs.term)` (§5.4).
3. For any recognitions embedded in `term`, apply `NF_recognition`.
4. Re‑encode in canonical JSON.

Two observations are equal iff their normalized forms are equal.

---

## 8. Programs and Execution

### 8.0 Execution Model (Normative)

All operator evaluation follows a strict **call-by-value**, **left-to-right** strategy:

1. Inputs to a ProgramStep are evaluated in the lexical order they appear in the canonical JSON list.
2. Each operator invocation MUST:
   - validate all preconditions;
   - compute outputs using only its inputs and the given MachineState;
   - return either `(MS', outputs...)` or `Error`.
3. **Operator Atomicity**:  
   If an operator returns `Error`, no mutation to MachineState MUST be committed.
4. **Program Atomicity**:  
   Execution of a ProgramStep sequence is atomic.  
   If any step fails:
   - the entire Program returns `Error`,
   - MachineState MUST remain bit-identical to the state before step 0.
5. **Trace Recording Semantics**:  
   OperatorSteps created during Program execution MUST be kept **internal only** unless the operator itself is part of the Observation pipeline (§10.3), in which case the Profile trace MUST record those steps.
6. **Determinism Requirement**:  
   Given canonical input JSON, the same Program MUST always produce the same output JSON and identical MachineState hashes.

This closes the space of possible execution semantics and enforces runtime reproducibility.


### 8.1 Program Carrier

A Program is a finite linear composition of ISA operators:

```text
Program:
  id:      ProgramID
  name:    string
  steps:   list[ProgramStep]
  meta:    object           # optional, non-semantic
```

```text
ProgramStep:
  index:      int           # unique, 0..n-1
  operator:   OperatorName
  inputs:     list[InputRef]
  outputs:    list[OutputRef]
  comment:    optional string
```

`InputRef` / `OutputRef` denote roles (e.g. “MachineState”, “ProfileID”, “Observation”) and how they map through the program. Exact shapes are implementation detail as long as `exec_program` below can be defined.

### 8.2 ISA Operators and Signatures

We fix a **closed set of operator names** in v1:

Recognition-level:

- `MeetRecognition(MS, cell:CellID, a:ElementIndex, b:ElementIndex) → (MS, ElementIndex)`
- `JoinRecognition`
- `ImplyRecognition`
- `NegateRecognition`
- `OrderRecognition(MS, cell, a, b) → (MS, bool)`
- `NucleusOp`
- `FlowOp`
- `FixNucleusOp`
- `FixFlowOp`
- `FixBothOp`

Trace-level:

- `EmptyTrace() → Trace`
- `ConcatTrace(t1:Trace, t2:Trace) → Trace`
- `NFTraceOp(t:Trace) → Trace`
- `FlowTrace(t:Trace, MS:MachineState) → (Trace, MachineState)` (for modal evolution of witnesses).

Profile-level:

- `BuildProfileRecognitions`
- `BuildFixedProfileRecognitions`
- `EvaluateTerm`
- `CheckJudgment`

Observation-level:

- `IntakeObservation`
- `KernelObservation`
- `NucleateObservation`

Each operator is a **pure function** over its inputs, except where it explicitly returns an updated `MachineState`. All mutating operators MUST take `MachineState` as an input and return an updated copy; they MUST NOT mutate in place in a way observable outside the function call.

The step from this fixed operator set to concrete host functions is a straightforward mapping; the important constraint is that operators:

- MUST be total on their stated domain or return an `Error` carrier;
- MUST enforce all invariants (e.g. lattice laws, typing).

#### 8.2.1 FlowTrace Semantics (Normative)

`FlowTrace(t, MS)` performs temporal evolution of witnesses:

1. Let `t' = NF_trace(t)`.
2. For each `OperatorStep` in `t'.steps`, rewrite any recognition `(c,e)` appearing in its payload to `(c, flow_table[e])`.
3. Remove any steps where all rewritten recognitions remain identical to their originals.
4. Recompute `t'' = NF_trace` of the rewritten sequence.

Return `(t'', MS)` (FlowTrace does not mutate MachineState in v1).

If any referenced Cell lacks a `flow_table`, return `Error("flow_undefined")`.


### 8.3 Program Normalization NF_program

`NF_program(P)`:

1. Sort `steps` by `index` ascending.
2. Require that indices are `0..n-1` without gaps; if not, reindex canonically or reject as `implementation_error`.
3. For each `ProgramStep`, canonicalize any list‐valued fields (e.g. `inputs`, `outputs`) by a fixed deterministic rule (e.g. by role name).
4. Remove unreachable or syntactically redundant steps (e.g. dead code) if they provably do not affect outputs.
5. Encode as canonical JSON.

Two Programs are equivalent iff `NF_program(P1) == NF_program(P2)`.

### 8.4 exec_program

Execution:

```text
exec_program(P: Program, MS: MachineState, args...) → (MachineState, outputs...) | Error
```

Semantics:

- Steps are executed in order of `index` after normalization.
- Each step:

  - maps its `inputs` to actual values (from `args` or previous outputs);
  - calls the corresponding operator implementation;
  - records an `OperatorStep` in a private internal trace (for debugging) if desired;
  - passes updated `MachineState` forward.

- If any operator returns an `Error`, execution stops and that `Error` is returned as the result of `exec_program`.

---

## 9. Observation Pipeline and External Interface

### 9.1 External Observation Blob Format (Normative Default)

In v1, there is a **standard wire format** for observations. Other encodings MAY exist, but support for this one is REQUIRED.

External `observation_blob` is canonical JSON of:

```json
{
  "trace": TraceJSON,
  "term": TermJSON,
  "meta": { ... }     // optional, ignored by semantics
}
```

Where `TraceJSON` and `TermJSON` are canonical encodings as defined in §3 and §5.

A Profile MAY add additional decoders for other payload shapes, but the **default decoder** for this format MUST be implemented for all Profiles.

### 9.2 decode_observation

```text
decode_observation(P: Profile, blob: observation_blob) → (Trace, Term) | Error
```

For the default format:

1. Parse `blob` as JSON.
2. Validate that it has `"trace"` and `"term"` fields.
3. Decode those into internal `Trace` and `Term` structures.
4. Return `(trace, term)`.

This function MUST be pure and deterministic.

### 9.3 submit_observation

External API:

```text
submit_observation(MS, profile_id, observation_blob) → (MS', ObservationResult) | Error
```

Normative procedure:

1. Find `P = MS.profiles[profile_id]`. If missing → `Error("unknown_profile")`.
2. `(T_raw, S_raw) = decode_observation(P, observation_blob)`.
3. Build `term` from `S_raw` (for the default format, `term = S_raw`).
4. Typecheck: if `Γ_P ⊢ term : T_type` fails, return `Error("type_error")` and unchanged `MS`.
5. Normalize:

   - `T = NF_trace(T_raw)`.
   - `term' = NF_term(term)`.

6. Build internal `Observation`:

   ```text
   obs = { trace: T, term: term' }
   ```

7. Run the **HandleObservation** standard program (see §10.3):

   ```text
   MS', obs_result = exec_program(HandleObservation, MS, P, obs)
   ```

8. Return `(MS', obs_result)`.

`ObservationResult` MUST include at least:

- a success/failure flag;
- IDs of any new recognitions or judgments added to the Profile;
- any `Error` or `LawDiagnostic` carriers produced by law‑checker programs.

---

## 10. Standard Programs

This spec fixes a small set of **standard programs** that all conformant implementations MUST provide. Their *logical structure* is normative; their exact step indices and internal traces are not.

### 10.1 ConstructProfile

Purpose: build a new `Profile` from a set of `visible_cells`.

Inputs:

- `MS`, `visible_cells:list[CellID]`.

Outputs:

- `MS'` with new Profile added.
- New `ProfileID`.

Outline:

1. Validate that each `CellID` exists and satisfies §1.
2. Construct `fixed_recognitions` by iterating all recognitions `(c,e)` with `c ∈ visible_cells` and keeping those with `nucleus_table[e] = e` and `flow_table[e] = e`.
3. Allocate a `Profile` with the given `visible_cells` and computed `fixed_recognitions`.
4. Add the new Profile to `MS.profiles`.

This is required at bootstrap (Ground Cell) and whenever new Profiles are created.

### 10.2 BootstrapMachine

Purpose: create initial `MachineState`.

Steps (normative):

1. Instantiate the Ground Cell as in §2.2; compute its `CellID` hash.
2. Initialize `MS.cells` with this single Cell.
3. Run `ConstructProfile` with `visible_cells = [GroundCellID]` to obtain `Profile0`.
4. Set `MS.profiles[Profile0.id] = Profile0`.
5. Initialize `MS.edges` as empty.

### 10.3 HandleObservation

Purpose: process a single internal `Observation` for a given Profile.

Inputs:

- `MS`, `ProfileID`, `Observation`.

Outputs:

- `MS'` (possibly with new judgments or recognitions).
- `ObservationResult`.

Normative high‑level structure:

1. **Intake stage** — record an `ObsIntakeStep` in a Profile‑local trace, obtain canonical `Observation` via `NF_observation`.
2. **Kernel stage** — evaluate the term:

   ```text
   Γ_P ⊢_P obs.term ⇓ rec
   ```

   using `EvaluateTerm`; record result via `ObsKernelStep`.

3. **Nucleation stage** — decide whether to:

   - integrate `rec` into profile invariants (for example, update some judgment or internal structure), or
   - treat it as a transient observation.

   Record via `ObsNucleateStep` and update `MS` accordingly.

4. Assemble `ObservationResult`:

   - success flag;
   - any new `JudgmentID`s or other diagnostic carriers.

The precise policy in step 3 is Profile‑specific, but MUST be deterministic and MUST NOT violate Cell invariants or normalization laws.

---

# 11. MachineState

`MachineState` is a simple record:

```text
MachineState:
  cells:    map[CellID → Cell]
  profiles: map[ProfileID → Profile]
  edges:    map[EdgeID  → Edge]     # optional recording of executed edges/programs
```

All persistent behavior is encoded via cells, profiles, edges. No hidden mutable globals are permitted.

---

## 11.1 Global Normalization Invariants (Normative)

The MachineState MUST satisfy the following invariants at all times:

1. Every stored `Recognition` MUST satisfy `NF_recognition`.
2. Every stored `Trace` MUST be in `NF_trace` form.
3. Every stored `Term` MUST satisfy `NF_term`.
4. Every stored `Judgment` MUST satisfy `NF_judgment`.
5. Programs MUST:
   - consume only normalized inputs,
   - produce only normalized outputs,
   - normalize all intermediate structures before committing results.

If committing a result would violate these invariants, the committing operator or Program MUST instead return `Error("invariant_violation")`.


# 12. Implementation Profile (Environment and Concurrency)

To avoid unbounded degrees of freedom, v1 includes a minimal “implementation profile”:

1. **Single‑threaded semantics**:
   - All ISA operators and programs are executed in a single logical thread.
   - No concurrent mutation of `MachineState` is allowed.
2. **Determinism**:
   - Given the same canonical JSON encodings of inputs, every function (`NF_trace`, `NF_term`, `exec_program`, `submit_observation`) MUST produce the same outputs.
3. **Persistence**:
   - If the implementation persists `MachineState` to disk, it MUST use canonical JSON and hash‑matching filenames (`<ID>.json`).
4. **No background work**:
   - The Machine only changes state in response to explicit calls to:
     - `BootstrapMachine`,
     - `ConstructProfile`,
     - `exec_program` for user programs,
     - `submit_observation`.

## 12.1 Well-Formedness and Size Constraints (Normative)

1. All Cells MUST remain finite; operators creating Cells MUST enforce an upper bound on element count if implementation chooses.
2. All Terms MUST be finite ASTs with no cyclic references.
3. All Traces MUST be finite sequences of finite TraceSteps; cyclic trace structures are forbidden.
4. Observations exceeding implementation-defined size limits MUST yield `Error("observation_too_large")`.
5. Programs MUST be finite DAGs of ProgramSteps; self-referential or cyclic Programs MUST return `Error("cyclic_program")`.

These constraints guarantee totality, decidability, and runtime safety.


---

## 13. Errors and Law Diagnostics

### 13.0 Transactional Error Semantics (Normative)

All mutating operations in the Machine follow a strict **transaction model**:

1. A mutation to MachineState MAY occur *only* inside an ISA operator explicitly marked as mutating.
2. A mutating operator MUST:
   - compute its updated MachineState on a private copy,  
   - validate invariants,  
   - return the new MachineState only on success.
3. If any invariant check fails, the operator MUST return `Error` and MUST NOT commit partial updates.
4. A Program containing one or more mutating steps MUST:
   - stage all intermediate MachineState modifications on a private working copy,
   - commit the final MachineState only if **every** step succeeds.
5. If a Program errors, the MachineState MUST revert to the exact canonical JSON state from before step 0.
6. Failed observations produce:
   - no changes to Profiles,
   - no changes to recognitions or judgments,
   - but MAY produce diagnostic edges for debugging.

These rules guarantee semantic purity and reproducibility across independent implementations.


### 13.1 Error Carrier

Errors are structured:

```text
Error:
  kind:    string        # "type_error", "precondition_failed", "implementation_error", ...
  message: string
  data:    object        # optional detail
```

`ErrorID` (when needed) is the hash of the canonical JSON encoding of `Error`.

### 13.2 LawDiagnostic

To validate conformance, implementations MAY provide law‑checker Programs that produce:

```text
LawDiagnostic:
  law_name: string
  passed:   bool
  details:  object
```

Law‑checker programs MUST be pure (no persistent state changes), except for recording diagnostics.

### 13.3 Law Layer Interface (Normative)

A *Law* is a named, pure Program:

```text
Law:
  name: string
  program: ProgramID
```

The Machine MUST maintain a list `MS.laws : list[Law]`.

A Law `L` is checked via:

```
check_law(MS, L) → LawDiagnostic
```

Procedure:

1. Execute `exec_program(L.program, MS)` in a pure sandbox (no commits).
2. If execution returns `Error`, produce `LawDiagnostic(L.name, false, details)`.
3. Otherwise record `passed = true`.

The Machine MAY expose a command:

```
validate_all_laws(MS) → list[LawDiagnostic]
```

Useful for conformance testing and CI.


---

## 14. Conformance Summary

An implementation conforms to this v1 spec if and only if:

1. It represents all primitive carriers (Cells, Traces, Profiles, Programs, Observations) in canonical JSON as described.
2. It implements:
   - `NF_recognition`, `NF_trace`, `NF_term`, `NF_observation`, `NF_program` exactly as specified;
   - the fixed PTL core syntax, typing, and semantics;
   - the fixed operator set and their signatures;
   - `exec_program`, `BootstrapMachine`, `ConstructProfile`, `HandleObservation`;
   - the default observation wire format and `submit_observation` semantics.
3. All identity and equality questions are decided via normalization (`NF_*`) and hash‑derived IDs.
4. All effects on `MachineState` occur only through the specified operators and standard programs and respect all invariants in this document.
