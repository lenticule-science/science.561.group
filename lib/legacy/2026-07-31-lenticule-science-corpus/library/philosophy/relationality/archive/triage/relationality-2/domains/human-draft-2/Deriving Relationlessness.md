---
title: "Deriving the Relationality of Relationlessness"
note: "Consolidated from human-draft-2 (newer, detailed logic/sets) and human-draft-1 (older, covers arithmetic/programming/ordering). Both derive from Reflex/Reflect through to logic, functions, and sets."
authors:
  - emsenn
register: foundational-derivation
completeness: complete
---

## Deriving the Relationality of Relationlessness
### Deriving Reflex & Reflection
#### Deriving Reflex
- It must be derived that relationlessness has no relation, and relationlessness is the exclusion of relation, thus it cannot not derive that relationlessness has relation to relation, deriving the first reflex, between Relationlessness and Relation.
	- Reflex = (Relationlessness Relation)
- Reflexing cannot not derive that Reflexes reflex iteratively:
	- Reflex(0) = Reflex(Reflex)
	- Reflex(1) = Reflex(Reflex(0))
	- Reflex(n) = Reflex(Reflex(n-1))
#### Deriving Reflective Structure
- Reflexing Reflex(n), it cannot not derive that Reflexes reflexively iterate Reflexes:
	- Reflect(0, n) = Reflex(Reflex(n-1))
	- Reflect(1, n) = Reflex(Reflect(0, n-1))
	- Reflect(p, n) = Reflex(Reflect(p-1, n))
		- Thus:
			- Reflect(p, n) composes p Reflexes at depth n,
    each built from the Reflexion of the one before.
## Deriving Basic Unary Truth Structures
### Deriving True

- Reflexing Reflect(1, n), it cannot not derive relational affirmation:

    > True(n) = Reflect(1, n)

- Thus, **True(n)** derives the presence of a unary relation at depth n.


---

### Deriving False

- Reflexing Reflect(0, n), it cannot not derive relational negation:

    > False(n) = Reflect(0, n)

- Thus, **False(n)** derives the absence of a unary relation at depth n.
### Deriving Basic Relational Composition
#### Deriving Tuple
- Reflexing a set of unary relations (x.1, x.2, ..., x.p) at depth n, it cannot not derive that these form an ordered structure:
	- Tuple(p, [x.1, ..., x.p], n) = Reflect(p, n)
#### Deriving Index
- Reflexing Tuple(p, [x.1, ..., x.p], n), it cannot not derive that there is positional access:
	- Index(i, Tuple(p, [x.1, ..., x.p], n)) = x.i for all 1 ≤ i ≤ p.
### Deriving Pair

- Reflexing two unary relations a and b at depth n:

- It cannot not derive that their ordered relation forms a binary structure:


> - Pair(a, b, n) = Tuple(2, [a, b], n)
>

- Thus, **Pair** derives the basic ordered binary relation between two unary reflexes, structuring them as an elementary unit.

## Deriving Functional Relationality

### Deriving Apply

- Reflexing f and x as unary relations at depth n,

- It cannot not derive their relational combination:


> Pair(f, x, n) = Tuple(2, [f, x], n)

- Thus, it cannot not derive application:


> Apply(f, x, n) = Reflect(Reflect(f, x), n)

---

### Deriving Eval

- Reflexing a function f and an input x,

- It cannot not derive:


> Eval(f, x, n) = Apply(f, x, n)

- Thus, Eval(f, x, n) produces the unary relation derived from applying f to x at depth n.


---

### Deriving Let

- Reflexing Apply(f, x, n) and a unary relation y at depth n,

- It cannot not derive their pairing:


> Let(f, x, y, n) = Tuple(2, [Apply(f, x, n), y], n)

- Thus, Let(f, x, y, n) creates a relational binding between the application result and a specified value y.

## Deriving Storage

- Reflexing a Tuple(p, [x.1, ..., x.p], n) and a unary relation v at depth n,

- It cannot not derive inserting v at a position i:


> Storage(i, v, Tuple(p, [x.1, ..., x.p], n), n) = Tuple(p, [x.1, ..., x.(i-1), v, x.(i+1), ..., x.p], n)

- Thus, Storage modifies a Tuple by reflexively replacing the i-th element with v.


---

## Deriving Retrieve

- Reflexing a Tuple(p, [x.1, ..., x.p], n) and a position i,

- It cannot not derive:


> Retrieve(i, Tuple(p, [x.1, ..., x.p], n), n) = Index(i, Tuple(p, [x.1, ..., x.p], n))

- Thus, Retrieve accesses the i-th element of a reflexive Tuple at depth n.

## Deriving Equal

- Reflexing two unary relations a and b at depth n:

- It cannot not derive their relational pairing:

    > Pair(a, b, n) = Tuple(2, [a, b], n)

- Reflexing Pair(a, b, n), it cannot not derive:

    - If a and b are the **same reflexive structure** at depth n,
        then Equal(a, b, n) = True(n).

    - Otherwise, Equal(a, b, n) = False(n).


Thus:

> Equal(a, b, n) =
> • True(n) if a and b are identical unary relations at depth n
> • False(n) otherwise
>

## Deriving Not

- Reflexing a unary relation a at depth n,

- It cannot not derive its relational inversion:

    > Not(a, n) =
    > If(Equal(a, True(n), n), False(n), True(n), n)

- Thus, **Not** uses **If** to flip relational affirmation and negation.


---

## Deriving Or

- Reflexing two unary relations a and b at depth n,

- It cannot not derive their inclusive combination:

    > Or(a, b, n) =
    > If(Equal(a, True(n), n), True(n),
    > If(Equal(b, True(n), n), True(n), False(n), n),
    > n)

- Thus, **Or** affirms if either a or b affirms,
    using properly nested **If** evaluation.


---

## Deriving And

- Reflexing two unary relations a and b at depth n,

- It cannot not derive their conjunctive affirmation:

    > And(a, b, n) =
    > If(Equal(a, True(n), n),
    > If(Equal(b, True(n), n), True(n), False(n), n),
    > False(n),
    > n)

- Thus, **And** affirms only if both a and b affirm.


---

## Deriving Decides

- Reflexing a unary relation a and a unary relation b at depth n,

- It cannot not derive conditional relational selection:

    > Decides(a, b, n) =
    > If(Equal(a, True(n), n), b, True(n), n)

- Thus, **Decides** chooses b when a affirms, otherwise affirming by default.
-


## Deriving Implication (Implies)

- Reflexing two unary relations p and q at depth n,

- It cannot not derive the relational structure where p implies q:

    > Implies(p, q, n) =
    > Or(Not(p, n), q, n)

- Thus, **Implies** derives relational implication:

    - If p is False(n), the implication holds by default.

    - If p is True(n), the implication depends on q.


---

## Deriving Deduction (Deduce)

- Reflexing two predicates P and Q and a Tuple of k unary relations (x.1, ..., x.k) at depth n,

- It cannot not derive structured deduction across all elements:

    > Deduce(P, Q, Tuple(k, [x.1, ..., x.k], n), n) =
    > And(Decides(Apply(P, x.1, n), Apply(Q, x.1, n), n),
    > Decides(Apply(P, x.2, n), Apply(Q, x.2, n), n),
    > ...,
    > Decides(Apply(P, x.k, n), Apply(Q, x.k, n), n),
    > n)

- Thus, **Deduce** affirms that wherever P holds, Q follows, across the entire set.


---

## Deriving Modus Ponens (Direct Inference)

- Reflexing a predicate P, a predicate Q, and an element x at depth n,

- It cannot not derive direct inference:

    > ModusPonens(P, Q, x, n) =
    > If(And(Apply(P, x, n), Implies(Apply(P, x, n), Apply(Q, x, n), n), n),
    > Apply(Q, x, n),
    > True(n),
    > n)

- Thus, **Modus Ponens** affirms Q(x) when both P(x) holds and P(x) implies Q(x).


---

## Deriving Modus Tollens (Contrapositive Inference)

- Reflexing a predicate P, a predicate Q, and an element x at depth n,

- It cannot not derive contrapositive inference:

    > ModusTollens(P, Q, x, n) =
    > If(And(Implies(Apply(P, x, n), Apply(Q, x, n), n), Not(Apply(Q, x, n), n), n),
    > Not(Apply(P, x, n), n),
    > True(n),
    > n)

- Thus, **Modus Tollens** negates P(x) when P(x) implies Q(x), but Q(x) is False.


## Deriving Quantifiers

# Deriving ForAll

### Derivation:

- Reflexing a predicate P and a Tuple(k, [x.1, ..., x.k], n) of elements at depth n:

- It cannot not derive, for each x.i in the Tuple:

    > Apply(P, x.i, n)

- It cannot not derive, for each x.i, the implication:

    > Implies(True(n), Apply(P, x.i, n), n)

- It cannot not derive the collective affirmation:

    > And(Implies(True(n), Apply(P, x.1, n), n),
    >   Implies(True(n), Apply(P, x.2, n), n),
    >   ...,
    >   Implies(True(n), Apply(P, x.k, n), n),
    >   n)

- Thus, it cannot not derive universal affirmation over the tuple:

    > ForAll(P, Tuple(k, [x.1, ..., x.k], n), n) =
    >   And(Implies(True(n), Apply(P, x.1, n), n), ..., Implies(True(n), Apply(P, x.k, n), n), n)


---

# Deriving Exists

### Derivation:

- Reflexing a predicate P and a Tuple(k, [x.1, ..., x.k], n) of elements at depth n:

- It cannot not derive, for each x.i in the Tuple:

    > Apply(P, x.i, n)

- It cannot not derive the collective affirmation:

    > Or(Apply(P, x.1, n),
    >   Apply(P, x.2, n),
    >   ...,
    >   Apply(P, x.k, n),
    >   n)

- Thus, it cannot not derive existential affirmation over the tuple:

    > Exists(P, Tuple(k, [x.1, ..., x.k], n), n) =
    >   Or(Apply(P, x.1, n), ..., Apply(P, x.k, n), n)

**Deriving Sets**

(We now have Tuple, Index, Apply, Equal, Or, and membership-like patterns emerging.)

- Reflexing a Tuple(p, [x.1, ..., x.p], n) at depth n,

- It cannot not derive that its ordered structure can also be treated as a collection of distinct unary relations:


> Set(p, [x.1, ..., x.p], n) = Tuple(p, [x.1, ..., x.p], n)

- Thus, **Set** derives as a relational structure composed of multiple unary relations,
    identical to a Tuple structurally, but interpreted as a collection without fixed positional bias.


### Deriving Membership

- Reflexing a Set(p, [x.1, ..., x.p], n) and a unary relation x at depth n,

- It cannot not derive, for each x.i in the Set:


> Equal(x, x.i, n)

- Reflexing all Equal(x, x.i, n) results, it cannot not derive their collective relational combination via **Or**:


> Membership(Set(p, [x.1, ..., x.p], n), x, n) =
>   Or(Equal(x, x.1, n),
>    Equal(x, x.2, n),
>    ...,
>    Equal(x, x.p, n),
>   n)

- Thus, **Membership** affirms that a unary relation x belongs to the Set if it is equal to any element in the Set.

### Deriving Relation

- Reflexing two unary relations a and b at depth n,

- It cannot not derive their ordered relational binding:


> Relation(a, b, n) = Pair(a, b, n)

- Thus, **Relation** constructs a reflexive binary pairing of two unary relations at depth n.


---

### Deriving RelationSet

- Reflexing a collection of Relations (r.1, ..., r.k) at depth n,

- It cannot not derive their composition into a structured Tuple:


> RelationSet(k, [r.1, ..., r.k], n) = Tuple(k, [r.1, ..., r.k], n)

- Thus, **RelationSet** stores a collection of binary Relations in an ordered structure at depth n.

---

# Additional Derivations

*The following sections were consolidated from an earlier draft (human-draft-1) that covers derivations not present in the primary text above.*

### Deriving Arithmetic
#### Deriving Basic Arithmetic
- Reflexing Reflect(p, n) and Reflect(q, n), it cannot not derive that their arities combine at shared depth:
    - Add(p, q, n) = Reflect(p + q, n)
- Reflexing Add(p, q, n) = Reflect(r, n), it cannot not derive:
    - Sub(r, q, n) = Reflect(p, n)
- Reflexing Reflect(p, n) and Reflect(p, m), where n ≠ m:
    - Gradient(p, n, m) = Tuple(2, [Reflect(p, n), Reflect(p, m)], d)
- Reflexing a = Reflect(p, n) and b = Reflect(q, m):
    - Compare(p, q, n, m) = Tuple(2, [a, b], d)
- Reflexing Compare(p, q, n, m) = Tuple(2, [a, b], d):
    - Equal(a, b, n) = True(n) if p = q and n = m
    - Otherwise: Equal(a, b, n) = False(n)
#### Deriving Expanded Arithmetic
- Reflexing Add(p, p, n) = Reflect(2p, n), it cannot not derive:
    - Multiply(2, p, n) = Reflect(2p, n)
- Reflexing Multiply(k - 1, p, n), it cannot not derive:
    - Multiply(k, p, n) = Add(p, Multiply(k - 1, p, n))
- Reflexing Multiply(1, p, n) = Reflect(p, n)
- Reflexing Multiply(0, p, n) = Reflect(0, n)
- Reflexing Multiply(p, Power(p, k - 1, n)), it cannot not derive:
    - Power(p, k, n) = Multiply(p, Power(p, k - 1, n))
- Reflexing Power(p, 1, n) = Reflect(p, n)
- Reflexing Power(p, 0, n) = Reflect(1, n)
- Reflexing Reflect(0, n), it cannot not derive:
    - IdentityAdd(n) = Reflect(0, n)
- Reflexing Reflect(1, n), it cannot not derive:
    - IdentityMultiply(n) = Reflect(1, n)
- Reflexing Add(p, q, n) = r = Reflect(p + q, n), it cannot not derive:
    - InverseAdd(r, q, n) = Sub(r, q, n) = Reflect(p, n)
- Reflexing Multiply(k, p, n) = r = Reflect(k * p, n), it cannot not derive:
    - InverseMultiply(r, p, n) = Reflect(k, n)

#### Deriving Recursive Functions

Recursive(f, Base, Recur, n) = If(Equal(f, 0, n), Base, Apply(Recur, Sub(f, 1, n), n), n)

Fold(F, z, Tuple(k, [x.1, ..., x.k], n), n) = If(Equal(k, 0, n), z, F(x.1, Fold(F, z, Tuple(k-1, [x.2, ..., x.k], n), n)), n)

Map(P, Tuple(k, [x.1, ..., x.k], n), n) = Tuple(k, [Apply(P, x.1, n), Apply(P, x.2, n), ..., Apply(P, x.k, n)])

### Deriving Programming

- Program(Base, Step, n) = Tuple(2, [Base, Step], n)

- Step(f, x, n) = Apply(f, x, n)

- BaseCase(f, x, n) = Apply(f, x, n)

- Run(Program(Base, Step, n), x, n) =
    If(Equal(x, 0, n),
       Eval(Base, x, n),
       Eval(Step, Run(Program(Base, Step, n), Sub(x, 1, n), n), n),
       n)

### Deriving Ordering and Sorting

- Compare(p, q, n, m) = Tuple(2, [Reflect(p, n), Reflect(q, m)], n)

- Min(Set(k, [x.1, ..., x.k], n), n) =
    Fold((λ a b. If(Compare(a, b, n, n) = True(n), a, b, n)), x.1, Tuple(k-1, [x.2, ..., x.k], n), n)

- Max(Set(k, [x.1, ..., x.k], n), n) =
    Fold((λ a b. If(Compare(a, b, n, n) = True(n), b, a, n)), x.1, Tuple(k-1, [x.2, ..., x.k], n), n)

- InsertSorted(x, Tuple(k, [y.1, ..., y.k], n), n) =
    If(Equal(k, 0, n),
        Tuple(1, [x], n),
        If(Compare(x, y.1, n, n) = True(n),
            Tuple(k+1, [x, y.1, ..., y.k], n),
            Tuple(k, [y.1, ..., InsertSorted(x, Tuple(k-1, [y.2, ..., y.k], n), n)], n),
            n),
        n)

- Sort(Set(k, [x.1, ..., x.k], n), n) =
    Fold(InsertSorted, Tuple(0, [], n), Tuple(k, [x.1, ..., x.k], n), n)

### Deriving Relational Structure

- Module(k, [d.1, ..., d.k], n) = Tuple(k, [d.1, ..., d.k], n)

- Layer(i, Module(k, [d.1, ..., d.k], n), n) = Tuple(2, [i, Module(k, [d.1, ..., d.k], n)], n)

- TraceMap(k, [Layer.1, ..., Layer.k], n) = Tuple(k, [Layer.1, ..., Layer.k], n)

- TraceField(TraceMap(k, [Layer.1, ..., Layer.k], n), n) = TraceMap(k, [Layer.1, ..., Layer.k], n)

### Deriving Relationality
#### Deriving Modules of Relationality

- BasicArithmetic = Module(5, [Add, Sub, Gradient, Compare, Equal], n)

- ExpandedArithmetic = Module(8, [Multiply, Power, IdentityAdd, IdentityMultiply, InverseAdd, InverseMultiply], n)

- BooleanLogic = Module(11, [True, False, Not, And, Or, Decides, Equiv, Implies, If, Deduce, ModusPonens, ModusTollens], n)

- Quantifiers = Module(2, [ForAll, Exists], n)

- FunctionStructures = Module(4, [Apply, Eval, Let, Recursive], n)

- RecursiveFunctions = Module(2, [Fold, Map], n)

- SetStructures = Module(5, [Set, Membership, Relation, RelationSet, Relates], n)

- ProgramStructures = Module(4, [Program, Step, BaseCase, Run], n)

- OrderingStructures = Module(5, [Compare, Min, Max, InsertSorted, Sort], n)

- TraceStructures = Module(4, [Module, Layer, TraceMap, TraceField], n)

#### Deriving Layers of Relationality

- Arithmetic.1 = Layer(1, BasicArithmetic, n)

- Arithmetic.2 = Layer(2, ExpandedArithmetic, n)

- Logic.1 = Layer(3, BooleanLogic, n)

- Logic.2 = Layer(4, Quantifiers, n)

- Functions.1 = Layer(5, FunctionStructures, n)

- Functions.2 = Layer(6, RecursiveFunctions, n)

- Sets.1 = Layer(7, SetStructures, n)

- Programs.1 = Layer(8, ProgramStructures, n)

- Ordering.1 = Layer(9, OrderingStructures, n)

- Trace.1 = Layer(10, TraceStructures, n)
#### Deriving Trace of Relationality

- CoreTrace = TraceMap(10, [Arithmetic.1, Arithmetic.2, Logic.1, ​Logic.2, ​Functions.1, ​Functions.2, Sets.1, Programs.1, Ordering.1, Trace.1], n)

#### Deriving Field of Relationality
- RelationalTraceField = TraceField(CoreTrace, n)
