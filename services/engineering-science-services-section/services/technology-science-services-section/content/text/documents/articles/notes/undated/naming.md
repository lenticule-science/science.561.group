---
title: Naming
description: This file provides a guide for how to name things.
aliases:
  - NAMING
---
NAMING
======

This file provides a guide for how to name things. Note that many
files in the library do not currently follow these guidelines.

It should work to use other file ending than ".agda", e.g. ".lagda.md"
for more flexible documentation - at the time of writing, this has not
been tested though.

For naming conventions specific to the Algebra subfolder, see
[Cubical/Algebra/NAMING.md](https://github.com/agda/cubical/blob/master/Cubical/Algebra/NAMING.md).

* Use either descriptive names for universe levels or
  ```
  ℓ ℓ' ℓ'' ℓ''' ...
  ```

* Names of types should begin with an uppercase letter; names of
  non-type terms should begin with a lowercase letter. The exception
  is types that represent properties, which should begin with `is`
  (for example `isProp`).

* Use abbreviations to avoid very long names, e.g.
  - `Comm` = commutative
  - `Assoc` = associative
  - `DistR`/`DistL` = distribute right/left

* Use camelCase as much as possible, also for properties/lemmas
  related to operations. For example: `+Assoc`, `·DistR+`.

* Avoid referring to variable names in the names of definitions.
  For example, prefer `+Comm` to something like `m+n≡n+m`.

* Use Equiv or `≃` to refer to equivalences of types or structures.

* Use Iso or `≅` to refer to isomorphisms of types or structures.
  Here an isomorphism is a function with a quasi-inverse, i.e. a
  quasi-equivalence in the sense of the HoTT Book.

* Use `Path` or `≡` to refer to paths in names, not `Eq`, `Id`, or
  other "equality" or "identity"-related names.

* Results about `PathP` (path overs) should end with `P` (like
  `compPathP`).

* The order of terms in names should reflect the type and things
  should appear in the order they appear in the type (like
  `isContrUnit`). For functions things can either be separated by `→`
  (like `isProp→isSet`) or `To` (like `isoToEquiv`).

* When defining eliminators, recursors and similar functions for datatypes,
  use the names `elim` and `rec`, potentially with a suitable suffix (like `elimProp`).
  Do not use `ind`.
  You can look
  [here](https://github.com/agda/cubical/blob/master/Cubical/HITs/SetQuotients/Properties.agda#L42-L92)
  and
  [here](https://github.com/agda/cubical/blob/master/Cubical/HITs/S1/Properties.agda#L14-L20)
  to see how different versions of `elim` and `rec` are named and typed.

* The `elim` and `rec` should be used as much as possible without
  renaming, but by importing and renaming the module.
  For instance use `open import Cubical.Data.Empty as ⊥`
  then use `⊥.rec` or `⊥.elim` rather than doing
  `renaming (rec to rec-⊥)` and using `rec-⊥`.

  Some convetional naming :
  - Empty                   -> ⊥
  - PropositionalTruncation -> PT
  - SetTruncation           -> ST
  - SetQuotient             -> SQ


---

<!-- source: archive/library/programming-languages/references/libraries/agda/guides/naming/NAMING--000465.md -->

## Imported source: archive/library/programming-languages/references/libraries/agda/guides/naming/NAMING--000465.md

NAMING
======

This file provides a guide for naming definitions in the Algebra folder.
You may divert from the naming scheme for sufficiently 'local' names,
e.g. names which are ```private``` or in a ```where```/```let``` clause.
If you need the operations and properties, of,
say the ```Group``` ```ℤGroup```,
use the names provided by ```open AbGroupStr (ℤGroup .snd)```.

* To name a property of an operation, write the name of the operation
  first, then the property. For example, `+Comm` or `·Assoc`.

* Use the following names and abbreviations for common properties.
  For laws that have left and right versions, use a suffix `L` or `R`.
  Check below to see which version is `L` and which is `R`.
  - `Assoc` = associativity

    ```
    ·Assoc : x · (y · z) ≡ (x · y) · z
    ```

  - `Comm` = commutativity

    ```
    ·Comm : x · y ≡ y · x
    ·CommL : x · (y · z) ≡ y · (x · z)
    ·CommR : (x · y) · z ≡ (x · z) · y
    ```

  - `Dist` = distributivity. The name should show first the operation
    that is distributed, whether it is distributing over the left or
    right, and then the operation that is distributed over.

    ```
    ·DistR+ : x · (y + z) ≡ (x · y) + (x · z)
    ·DistL+ : (x + y) · z ≡ (x · z) + (y · z)
    ```

  - `Id` = unit laws

    ```
    ·IdL : 1 · x ≡ x
    -Id : (- 0) ≡ 0
    ```

  - `Inv` = inverse laws

    ```
    +InvL : (- x) + x ≡ 0
    ```

  - `Absorb` = absorption. The name should show first the outer
    operation, whether it is absorbed on the left, then the inner
    operation.

    ```
    ∧AbsorbL∨ : x ∧ (x ∨ y) ≡ x
    ```

  - `Invol` = involution

    ```
    -Invol : - (- x) ≡ x
    ```

  - `Cancel` = cancellation

    ```
    ·CancelL : x · a ≡ x · b → a ≡ b
    ```

  - `Annihil` = annihilation

    ```
    ·AnnihilL : 0 · x ≡ 0
    ```

  - `Idem` = idempotency

    ```
    ∧Idem : x ∧ x ≡ x
    ```

* The fact that a homomorphism preserves a specific operation
  should be named `pres·` where `·` is the operation.

* An instance of an algebraic structure should include the
  name of the structure. For example `UnitGroup` and `ℤGroup`.

* Use traditional names for constructions in algebra as they could appear in a common textbook,
  like e.g. Serge Lang's 'Algebra'.
  So for exmaple, 'DirectSum' is to be preffered over 'Coproduct'.

* If there are two canonical subfolders for a construction or instance of an algebraic structure,
  use both and make one use the other.
