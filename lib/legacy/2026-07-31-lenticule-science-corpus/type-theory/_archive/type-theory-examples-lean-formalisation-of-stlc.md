---
type: example
status: sketch
depends-on: [simply-typed-lambda-calculus, subject-reduction, progress, dependent-type-theory]
---

# A Lean formalisation of STLC (sketch)

This example sketches what a [Lean](../objects/dependent-type-theory.md) formalisation of the [simply-typed-lambda-calculus](../objects/simply-typed-lambda-calculus.md) — its syntax, typing rules, reduction relation, and the [subject-reduction](../theorems/subject-reduction.md) and [progress](../theorems/progress.md) theorems — would look. It is a *sketch* because the corpus has not yet committed to which proof-assistant project would host it.

## The shape of the formalisation

```lean
-- Types of STLC
inductive Ty where
  | base : Ty
  | arrow : Ty → Ty → Ty

-- Terms (de Bruijn, well-typed by intrinsic encoding)
inductive Term : List Ty → Ty → Type where
  | var : (Γ : List Ty) → (i : Fin Γ.length) → Term Γ (Γ.get i)
  | abs : Term (A :: Γ) B → Term Γ (Ty.arrow A B)
  | app : Term Γ (Ty.arrow A B) → Term Γ A → Term Γ B

-- β-reduction step
inductive Step : Term Γ A → Term Γ A → Prop where
  | beta : Step (Term.app (Term.abs M) N) (subst M N)
  | congArg : Step M M' → Step (Term.app M N) (Term.app M' N)
  | congFun : Step N N' → Step (Term.app M N) (Term.app M N')
  | congAbs : Step M M' → Step (Term.abs M) (Term.abs M')

-- Subject reduction is "free" with the intrinsic encoding
theorem subject_reduction : Step M N → True := fun _ => trivial
```

The *intrinsic* encoding (terms are indexed by their context and type) makes [subject-reduction](../theorems/subject-reduction.md) trivial — the type system enforces it. With an *extrinsic* encoding (terms are raw syntax, typing is a separate inductive predicate), subject reduction becomes a non-trivial inductive proof.

## What this would establish

- *That this directory's [simply-typed-lambda-calculus](../objects/simply-typed-lambda-calculus.md) definition is mechanisable.* Type-checking the Lean source verifies that the typing rules are consistent and the reduction is well-defined.
- *That [subject-reduction](../theorems/subject-reduction.md) holds.* Either trivially (intrinsic encoding) or as a checked theorem (extrinsic).
- *Where to bind subsequent theorems.* Once an STLC formalisation exists, [progress](../theorems/progress.md), [strong-normalization-stlc](../theorems/strong-normalization-stlc.md), and [principal-typing-stlc](../theorems/principal-typing-stlc.md) become candidates for binding via `lean:` frontmatter.

## Status: sketch

No corresponding Lean project exists in the corpus yet. The [questions/lean-binding](questions/lean-binding.md) plan scopes when this would happen. A small starter project could live in a sibling `applications/` or `formalisations/` directory under [predication-categories](../../categories/theories/predication-categories/_index.md) once the latter has its own Lean binding established.

## Remarks

The unusual feature of this directory is that *most of its theorems are meta-theorems about the formaliser itself*. Strong normalization for STLC is not provable inside Lean about Lean's own kernel (Lean's kernel is *more* than STLC); it can be proved inside Lean about a *separately formalised* STLC. The latter is what this example sketches. Reference: see *Software Foundations* (Pierce et al.) for the analogous Coq formalisation.
