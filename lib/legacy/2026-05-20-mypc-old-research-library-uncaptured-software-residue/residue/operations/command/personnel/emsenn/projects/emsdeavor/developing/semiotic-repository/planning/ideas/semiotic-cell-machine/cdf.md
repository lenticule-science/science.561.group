---
title: "Cdf"
date-created: 2026-03-06T00:00:00
---
Cellular Data Serialization (CDS)

Specification – Version 0.x (Draft)

1. Introduction

The Cellular Data Serialization (CDS) defines a complete, self‑contained, canonical, machine‑readable serialization of a single local universe (a cell) of a Generative Fibered Relational Trace Universe (GFRTU).

Mathematically, a cell is a sheaf topos of the form:

𝑅
𝑈
=
𝑆
ℎ
(
𝑈
,
𝐽
∣
𝑈
)
,
R
U
	​

=Sh(U,J∣
U
	​

),

where 
𝑈
⊆
𝑇
U⊆T is a full subcategory of the global trace site and 
𝐽
∣
𝑈
J∣
U
	​

 is the restricted Grothendieck topology. 

gfrtu

A CDS serialization:

encodes the cell site 
𝑈
U and restricted topology 
𝐽
∣
𝑈
J∣
U
	​

;

encodes the restricted recognition functor 
𝐻
∣
𝑈
:
𝑈
𝑜
𝑝
→
𝑅
𝑒
𝑐
𝐹
𝑖
𝑏
H∣
U
	​

:U
op
→RecFib and its fixed layer 
𝐻
𝑈
\*
H
U
\*
	​

;

binds the Recognition Term Language (RTL) to this cell’s objects and operations;

enumerates the structural vocabulary and generative constructors allowed in the cell;

records admissibility, canonicalization, and invariant laws governing terms and structure;

stores at least one defining RTL expression whose generative closure yields this cell.

CDS is closed‑world: all data required to interpret RTL terms and run the Cellular Closure Engine (CCE) on this cell MUST be contained in a single CDS serialization. References to external semantic state are prohibited.

2. Conformance and Terminology

The key words MUST, MUST NOT, REQUIRED, SHOULD, MAY are to be interpreted as described in RFC 2119.

A CDS serialization is a JSON object conforming to this specification.

A cell is the semantic structure represented by a CDS serialization.

A CDS implementation is any component that parses, validates, or produces CDS serializations.

A cell‑aware system is a CDS implementation that also supports RTL and the CCE.

A conforming CDS implementation MUST:

Accept any serialization that satisfies all MUST‑level requirements in this specification.

Reject serializations that violate any MUST‑level requirement.

3. Overall Document Structure
3.1 Top‑Level JSON Object

A CDS serialization MUST be a single JSON object with at least the following fields:

{
  "type": "cds-cell",
  "version": "0.x",

  "id": "<canonical-hash>",

  "cell_site": { ... },
  "fibers": { ... },
  "fixed_layer": { ... },          // optional if derivable
  "rtl_signature": { ... },
  "structural_vocabulary": { ... },
  "generative_constructors": { ... },
  "laws": { ... },
  "defining_expression": { ... },

  "metadata": { ... }
}


Requirements:

"type" MUST be the string "cds-cell".

"version" MUST be a version string understood by the implementation (e.g. "0.1").

All keys MUST be unique and MUST NOT be null.

The serialization MUST be expressible in canonical JSON form (Section 4).

Additional fields MAY be present in future versions but MUST NOT alter the semantics defined by this spec.

3.2 Top‑Level Semantics

The top‑level object represents exactly one local universe 
𝑅
𝑈
=
𝑆
ℎ
(
𝑈
,
𝐽
∣
𝑈
)
R
U
	​

=Sh(U,J∣
U
	​

), with:

a small site 
𝑈
U and topology 
𝐽
∣
𝑈
J∣
U
	​

; 

gfrtu

a recognition functor 
𝐻
∣
𝑈
:
𝑈
𝑜
𝑝
→
𝑅
𝑒
𝑐
𝐹
𝑖
𝑏
H∣
U
	​

:U
op
→RecFib; 

gfrtu

a fixed‑fiber subsheaf 
𝐻
𝑈
\*
⊆
𝐻
𝑈
H
U
\*
	​

⊆H
U
	​

; 

gfrtu

the interpretation of RTL types and constructors in this cell; 

gfrtu

the structural vocabulary 
𝐹
F and allowed constructors 
𝐶
𝑜
𝑛
𝑠
Cons used by the generative closure operator 
𝑈
𝐺
UG.

No CDS serialization may represent more than one cell.

4. Canonicalization and Hashing
4.1 Canonical JSON

CDS uses the JSON Canonicalization Scheme (JCS), as defined in RFC 8785, for all normative serialization.

A CDS serialization MUST conform to RFC 8785 canonical JSON:

Object keys MUST be lexicographically sorted.

Numeric values MUST be encoded in the canonical JCS numeric form.

Strings MUST be normalized as per JCS rules.

No insignificant whitespace or alternate encodings are allowed.

Whenever this spec refers to the “canonical CDS serialization,” it means the JCS‑canonical UTF‑8 byte sequence of the CDS JSON object.

4.2 Cell Identity and "id" Field

The "id" field is the canonical identifier for the cell. It MUST be constructed as follows:

Take the CDS serialization and temporarily replace "id" with a fixed placeholder value (e.g. the empty string), or omit it entirely.

Serialize the modified serialization object to canonical JSON as per RFC 8785.

Compute a cryptographic hash of the resulting byte sequence using a hash algorithm specified in "metadata.hash_algorithm" (Section 12).

Encode the hash as a lowercase hexadecimal string.

Set "id" to that string.

Two CDS serializations represent the same cell if and only if:

They use the same hash algorithm, and

Their "id" fields and canonical serializations are identical.

A CDS implementation MUST verify that the "id" field matches the hash of the canonicalized serialization as described above. If it does not match, the serialization MUST be rejected as invalid.

5. Cell Site ("cell_site")
5.1 Purpose

"cell_site" encodes the full small category 
𝑈
U and the restricted Grothendieck topology 
𝐽
∣
𝑈
J∣
U
	​

 that define the cell site. 

gfrtu

5.2 JSON Structure
"cell_site": {
  "objects": ["t0", "t1", ...],

  "morphisms": [
    { "id": "f0", "src": "t0", "dst": "t1" },
    { "id": "id_t0", "src": "t0", "dst": "t0" },
    ...
  ],

  "identities": {
    "t0": "id_t0",
    "t1": "id_t1"
  },

  "composition": [
    { "pair": ["f0", "f1"], "result": "f1∘f0" },
    ...
  ],

  "covers": [
    { "object": "t0", "families": [
        { "morphisms": ["f0","f1"] },
        { "morphisms": ["g0"] }
      ]
    },
    ...
  ]
}

5.3 Category Requirements

The cell_site.objects and cell_site.morphisms fields MUST define a small category:

"objects" MUST be a nonempty finite or countable array of unique string IDs.

"morphisms" MUST list all morphisms of U:

Each morphism object MUST have "id", "src", and "dst" fields.

"src" and "dst" MUST reference objects in "objects".

"identities" MUST map each object ID to a morphism ID in "morphisms" such that:

For each object t, "identities[t]" is a morphism with "src" = "dst" = t.

"composition" MUST list all composable pairs and their composites:

For each entry, "pair" is a 2‑element array of morphism IDs [f, g] where cod(f) = dom(g).

"result" is a morphism ID representing 
𝑔
∘
𝑓
g∘f.

The following axioms MUST hold and MUST be mechanically checkable:

Identity: For each morphism f: s → t,

"identities[t]" ∘ f = f,

f ∘ "identities[s]" = f.

Associativity: For composable triples (f,g,h), composition MUST satisfy (h∘g)∘f = h∘(g∘f).

CDS implementations MUST validate these axioms; invalid categories MUST cause rejection.

5.4 Topology Requirements

The "covers" field encodes the Grothendieck topology 
𝐽
∣
𝑈
J∣
U
	​

. For each object t:

covers MAY contain an entry with "object": t and a "families" array.

Each "families[i].morphisms" MUST be a nonempty array of morphism IDs 
𝑢
𝑖
:
𝑡
𝑖
→
𝑡
u
i
	​

:t
i
	​

→t.

The collection of all such families across all objects defines 
𝐽
∣
𝑈
J∣
U
	​

.

The following Grothendieck topology axioms MUST be enforced: 

gfrtu

Isomorphism Covers: For each isomorphism 
𝑢
:
𝑡
′
→
𝑡
u:t
′
→t, {u} MUST be in J(t).

Stability Under Pullback: For any morphism 
𝑓
:
𝑠
→
𝑡
f:s→t and cover 
{
𝑢
𝑖
:
𝑡
𝑖
→
𝑡
}
∈
𝐽
(
𝑡
)
{u
i
	​

:t
i
	​

→t}∈J(t), there MUST exist a cover 
{
𝑣
𝑗
:
𝑠
𝑗
→
𝑠
}
∈
𝐽
(
𝑠
)
{v
j
	​

:s
j
	​

→s}∈J(s) and morphisms making each v_j a pullback of some u_i.

Transitivity: If 
{
𝑢
𝑖
:
𝑡
𝑖
→
𝑡
}
∈
𝐽
(
𝑡
)
{u
i
	​

:t
i
	​

→t}∈J(t) and for each i, 
{
𝑣
𝑖
𝑗
:
𝑠
𝑖
𝑗
→
𝑡
𝑖
}
∈
𝐽
(
𝑡
𝑖
)
{v
ij
	​

:s
ij
	​

→t
i
	​

}∈J(t
i
	​

), then 
{
𝑢
𝑖
∘
𝑣
𝑖
𝑗
:
𝑠
𝑖
𝑗
→
𝑡
}
{u
i
	​

∘v
ij
	​

:s
ij
	​

→t} MUST be in J(t).

CDS implementations MUST either:

check these axioms directly, or

rely on a trusted construction process that guarantees them.

6. Recognition Fibers ("fibers")
6.1 Purpose

The "fibers" section encodes the restriction of the GFRTU recognition functor:

𝐻
∣
𝑈
:
𝑈
𝑜
𝑝
→
𝑅
𝑒
𝑐
𝐹
𝑖
𝑏
,
H∣
U
	​

:U
op
→RecFib,

where each fiber 
𝐻
𝑡
H
t
	​

 is a finite Heyting algebra with stabilizer 
𝜎
𝑡
σ
t
	​

 and drift 
Δ
𝑡
Δ
t
	​

, and each restriction 
𝐻
(
𝑓
)
:
𝐻
𝑡
′
→
𝐻
𝑡
H(f):H
t
′
	​

→H
t
	​

 is a RecFib morphism. 

gfrtu

6.2 JSON Structure
"fibers": {
  "t0": {
    "elements": ["e0","e1","e2"],

    "heyting": {
      "meet": { "e0,e0": "e0", "e0,e1": "e0", ... },
      "join": { "e0,e0": "e0", "e0,e1": "e1", ... },
      "imp":  { "e0,e0": "e2", "e1,e2": "e2", ... },
      "bot": "e0",
      "top": "e2"
    },

    "sigma": { "e0": "e0", "e1": "e2", "e2": "e2" },
    "delta": { "e0": "e0", "e1": "e1", "e2": "e2" },

    "restrictions": {
      "f0": { "map": { "e0": "e0", "e1": "e1", "e2": "e2" } }
    }
  },

  "t1": { ... }
}


Each key under "fibers" MUST be an object ID from "cell_site.objects".

6.3 Fiber‑Level Requirements

For each object t:

"elements" MUST be a nonempty finite array of unique element IDs.

"heyting" MUST define:

"meet", "join", and "imp" as total binary operations:

For every ordered pair (a,b) of elements, the key "a,b" MUST exist and refer to an element ID.

"bot" and "top" as element IDs in "elements".

The operations defined by "heyting" MUST make 
𝐻
𝑡
H
t
	​

 into a finite Heyting algebra (bounded distributive lattice with implication). 

gfrtu

"sigma" MUST map every element to an element of the same fiber:

σ_t MUST be monotone, extensive (a ≤ σ_t(a)), and idempotent.

"delta" MUST map every element to an element of the same fiber:

Δ_t MUST be monotone, inflationary (a ≤ Δ_t(a)), and eventually idempotent (Δ_t^k(a) stabilizes for some finite k).

σ_t and Δ_t MUST commute:

𝜎
𝑡
(
Δ
𝑡
(
𝑎
)
)
=
Δ
𝑡
(
𝜎
𝑡
(
𝑎
)
)
∀
𝑎
∈
𝐻
𝑡
.
σ
t
	​

(Δ
t
	​

(a))=Δ
t
	​

(σ
t
	​

(a))∀a∈H
t
	​

.

A CDS implementation MUST validate these properties by exhaustive check over the finite tables.

6.4 Restrictions and Functoriality

For each morphism f : s → t in U:

"fibers[t].restrictions[f_id]" MUST be present and MUST define:

a total map from fibers[t].elements to fibers[s].elements via "map".

The map MUST be a RecFib homomorphism:

It MUST preserve meet/join/imp, ⊥, ⊤, and commute with σ, Δ:

𝐻
(
𝑓
)
(
𝑎
∧
𝑡
𝑏
)
=
𝐻
(
𝑓
)
(
𝑎
)
∧
𝑠
𝐻
(
𝑓
)
(
𝑏
)
H(f)(a∧
t
	​

b)=H(f)(a)∧
s
	​

H(f)(b), and similarly for join and implication.

𝐻
(
𝑓
)
(
𝜎
𝑡
(
𝑎
)
)
=
𝜎
𝑠
(
𝐻
(
𝑓
)
(
𝑎
)
)
H(f)(σ
t
	​

(a))=σ
s
	​

(H(f)(a)).

𝐻
(
𝑓
)
(
Δ
𝑡
(
𝑎
)
)
=
Δ
𝑠
(
𝐻
(
𝑓
)
(
𝑎
)
)
H(f)(Δ
t
	​

(a))=Δ
s
	​

(H(f)(a)). 

gfrtu

Functoriality MUST hold:

For each object t, "restrictions[identity_of_t]" MUST be the identity map on "elements".

For each composable pair 
𝑔
:
𝑟
→
𝑠
g:r→s, 
𝑓
:
𝑠
→
𝑡
f:s→t:

"restrictions[f∘g]" MUST equal "restrictions[g]" ∘ "restrictions[f]" pointwise on elements.

A CDS implementation MUST reject any serialization that violates these constraints.

7. Fixed Layer ("fixed_layer")
7.1 Purpose

The fixed layer encodes the subsheaf 
𝐻
𝑈
\*
⊆
𝐻
𝑈
H
U
\*
	​

⊆H
U
	​

 consisting of elements fixed under σ and Δ:

𝐻
𝑡
\*
=
{
𝑎
∈
𝐻
𝑡
∣
𝜎
𝑡
(
𝑎
)
=
𝑎
=
Δ
𝑡
(
𝑎
)
}
,
𝑡
∈
𝑈
,
H
t
\*
	​

={a∈H
t
	​

∣σ
t
	​

(a)=a=Δ
t
	​

(a)},t∈U,

which, by Assumption 2.1, forms a sheaf on 
(
𝑈
,
𝐽
∣
𝑈
)
(U,J∣
U
	​

). 

gfrtu

7.2 JSON Structure
"fixed_layer": {
  "explicit": true | false,
  "fibers": {
    "t0": ["e0","e3"],
    "t1": ["e1","e2"],
    ...
  }
}


If "explicit" is true, "fibers[t]" MUST explicitly list the fixed elements in H_t^*.

If "explicit" is false (or the entire "fixed_layer" field is omitted), CCE MUST compute fixed fibers by definition from σ and Δ.

7.3 Requirements

For each object t:

Every element listed in "fixed_layer.fibers[t]" MUST be in "fibers[t].elements".

Each such element MUST satisfy σ_t(a)=a=Δ_t(a).

For each morphism f : s→t:

"fibers[t].restrictions[f]" MUST map fixed elements in H_t^* into fixed elements in H_s^*.

The family 
𝐻
𝑈
\*
=
{
𝐻
𝑡
\*
}
H
U
\*
	​

={H
t
\*
	​

} MUST satisfy the sheaf condition for 
𝐽
∣
𝑈
J∣
U
	​

:

For each cover 
{
𝑢
𝑖
:
𝑡
𝑖
→
𝑡
}
{u
i
	​

:t
i
	​

→t} in J(t), any compatible family of fixed elements 
𝑎
𝑖
∈
𝐻
𝑡
𝑖
\*
a
i
	​

∈H
t
i
	​

\*
	​

 along the restrictions MUST glue to a unique fixed element a ∈ H_t^*.

A CDS implementation MAY:

validate this condition directly using fibers and covers, or

trust a construction process known to produce sheaves.

If explicit fixed fibers are provided and they fail these properties, the CDS serialization MUST be rejected.

8. RTL Signature Binding ("rtl_signature")
8.1 Purpose

The "rtl_signature" section specifies how RTL’s types and constructors are interpreted inside this cell. It provides the bridge from the syntax of RTL to the internal objects and arrows of 
𝑅
𝑈
R
U
	​

. 

gfrtu

CCE uses this section to:

typecheck RTL judgments;

interpret terms as arrows in the sheaf topos;

ensure modal and logical constructors act on the recognition object.

8.2 JSON Structure

A typical structure:

"rtl_signature": {
  "types": {
    "Rec":   { "kind": "builtin", "object": "H_U" },
    "Prod":  { "kind": "type_constructor", "op": "product" },
    "Arrow": { "kind": "type_constructor", "op": "exponential" }
  },

  "constructors": {
    "and": {
      "kind": "rec_op",
      "op": "heyting.meet",
      "arity": 2
    },
    "or": {
      "kind": "rec_op",
      "op": "heyting.join",
      "arity": 2
    },
    "imp": {
      "kind": "rec_op",
      "op": "heyting.imp",
      "arity": 2
    },
    "true": {
      "kind": "rec_const",
      "op": "heyting.top"
    },
    "false": {
      "kind": "rec_const",
      "op": "heyting.bot"
    },
    "stabilize": {
      "kind": "modal",
      "op": "sigma"
    },
    "drift": {
      "kind": "modal",
      "op": "delta"
    }
  }
}

8.3 Requirements

"types.Rec" MUST designate the recognition object of the cell (denoted H_U).

"types.Prod" and "types.Arrow" MUST correspond to the topos product and exponential constructors.

For every RTL constructor in use:

There MUST be an entry under "constructors".

The entry MUST be consistent with the semantics of that constructor in GFRTU:

logical ops refer to Heyting operations on H_U,

modal ops refer to σ_U, Δ_U : H_U→H_U.

No RTL type or constructor may be used in a judgment unless it is declared here and can be interpreted from the data in the CDS.

9. Structural Vocabulary ("structural_vocabulary") and Generative Constructors ("generative_constructors")
9.1 Purpose

GFRTU defines a finite structural vocabulary 
𝐹
F and a set of allowed constructions 
𝐶
𝑜
𝑛
𝑠
Cons which determine the generative closure operator 
𝑈
𝐺
UG.

In CDS, "structural_vocabulary" and "generative_constructors" encode the local restrictions of these to the cell.

9.2 Structural Vocabulary
"structural_vocabulary": {
  "primitive_ops": [
    "trace:concat",
    "heyting:meet",
    "heyting:join",
    "heyting:imp",
    "modal:sigma",
    "modal:delta",
    "sheaf:product",
    "sheaf:exponential"
  ]
}


"primitive_ops" MUST list the primitive operations available in this cell.

Each listed operation MUST correspond to:

an operation on traces, recognitions, or sheaves defined from the underlying GFRTU primitive data, and/or

standard topos constructions (finite limits, exponentials).

9.3 Generative Constructors
"generative_constructors": {
  "allowed": [
    "finite-limit",
    "finite-colimit",
    "exponential",
    "finitely-presented-subobject",
    "sheafification",
    "restriction"
  ]
}


"allowed" MUST be a list of strings naming constructions that may be used by the CCE during closure.

The allowed set MUST be a subset of GFRTU’s 
𝐶
𝑜
𝑛
𝑠
Cons: finitary, structural, and local to 
𝑅
𝑈
R
U
	​

. 

gfrtu

CCE MUST treat these lists as a whitelist: it MUST NOT introduce objects or morphisms using constructions not present in "generative_constructors.allowed".

10. Laws ("laws")
10.1 Purpose

The "laws" section encodes machine‑checkable constraints that govern:

Admissibility: when an RTL judgment is allowed in this cell.

Canonicalization: how terms and values are reduced to canonical forms.

Invariants: structural properties that must hold for the cell to be a valid fragment of a GFRTU.

These laws turn the GFRTU’s mathematical assumptions (e.g. fixed fibers forming a sheaf, closure rules, etc.) into runtime‑enforceable conditions.

10.2 JSON Structure

At minimum:

"laws": {
  "admissibility": [
    { "id": "no-foreign-op", "kind": "constructor-whitelist", "constructors": ["..."] },
    ...
  ],
  "canonicalization": [
    { "id": "modal-order", "rule": "stabilize-outside-drift" },
    ...
  ],
  "invariants": [
    { "id": "fixed-layer-sheaf", "kind": "fixed-sheaf", "check": true },
    ...
  ]
}


This spec does not fix a concrete DSL for laws; instead, it imposes semantic requirements:

Admissibility laws MUST be sufficient for CCE to:

reject uses of RTL constructors not declared in "rtl_signature" or "structural_vocabulary";

reject any judgment that requires non‑allowed generative constructors;

enforce any cell‑specific syntactic restrictions (e.g., restricted use of modalities).

Canonicalization laws MUST:

define how modal operators are ordered in canonical terms;

define any additional rewrite rules beyond RTL’s βη normalization that are required to match the cell’s equational theory.

Invariant laws MUST include at least:

the fixed‑layer sheaf condition,

functoriality and RecFib constraints on "fibers" (may be implied by construction),

closure and stability conditions consistent with GFRTU.

A CDS implementation MAY embed a structured law DSL, but MUST ensure CCE can evaluate these laws deterministically.

11. Defining Expression ("defining_expression")
11.1 Purpose

The "defining_expression" field stores at least one RTL term (or judgment) that acts as the operational origin of the cell:

When submitted to the CCE starting from a smaller universe (e.g., an initial or prior CDS), its generative closure yields the current cell.

This enables reproduction, verification, and provenance tracking.

This is an operational convenience, not a primitive requirement of GFRTU, but it is strongly RECOMMENDED.

11.2 JSON Structure

Minimal form:

"defining_expression": {
  "judgment": {
    "ctx":  [ ... ],
    "term": { ... },   // RTL term AST
    "type": { ... }    // RTL type AST
  },
  "notes": "Produced by closure on 2025-12-04"
}


Requirements:

"judgment" MUST be a valid RTL judgment in canonical JSON form.

The judgment MUST be admissible in this cell and MUST reflect the cell’s own "rtl_signature".

A CDS implementation MAY record a sequence or tree of defining expressions, but MUST preserve at least one canonical origin.

12. Metadata ("metadata")

The "metadata" object is optional and purely informational; it MUST NOT affect semantics.

Example:

"metadata": {
  "hash_algorithm": "sha256",
  "created": "2025-12-04T00:00:00Z",
  "author": "user@domain",
  "labels": ["local", "demo"],
  "description": "Toy two-object cell with nontrivial drift"
}


"hash_algorithm" MUST name the hash used for "id" ("sha256" or "sha3-256" are RECOMMENDED).

Other fields MAY include timestamps, authorship, comments, tags, etc.

Implementations MUST ignore unknown metadata fields for purposes of semantics and validation.

13. Determinism Requirements

A CDS‑compliant system MUST ensure:

Parsing determinism: A given byte sequence representing canonical JSON parses to a unique internal representation.

Identity determinism: The "id" field of a valid CDS serialization is uniquely determined by its own canonical JSON byte sequence and the declared hash algorithm.

Equivalence: Two semantically equivalent cells MUST serialize to identical canonical JSON, and thus share the same "id".

These properties are required so that CCE and external tooling can rely on stable cell identities and reproducible semantics.

14. Versioning and Compatibility

A CDS serialization’s "version" identifies the version of this specification it targets.

Implementations SHOULD reject serializations whose "version" they do not understand.

Future versions MAY:

add new optional fields,

refine the structure of "laws",

extend the representation of "rtl_signature" and "structural_vocabulary",
but MUST preserve backward compatibility at the semantic level for cells that conform to this version.

15. Security Considerations

CDS serializations are data, not code:

Implementations MUST treat all fields as untrusted input.

Implementations MUST NOT execute code based on values found in CDS (e.g., in "metadata" or "laws"), unless such execution is explicitly mediated by a vetted interpreter.

Implementations MUST avoid network access or file system access based on CDS contents.

Malformed CDS input MUST be handled gracefully:

Serializations failing validation MUST be rejected with clear error reports.

Resource limits SHOULD be imposed on the size and complexity of sites, fibers, and laws to prevent denial‑of‑service scenarios.