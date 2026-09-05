---
type: concept
class: framing
depends-on: [closure-rule, vocabulary-completeness, scope-maturation]
see-also: [algebraic-constraint-validation, closure-conditions, doctrine-fidelity]
---

# Geometric blueprint

The framing under which a region's full structural specification is a *geometric theory* — a pair $\mathbb{T} = (\mathbf{S}, \mathrm{Ax})$ consisting of a signature $\mathbf{S}$ (the region's vocabulary of sorts and operations) and an axiom set $\mathrm{Ax}$ (a finite collection of geometric sequents constraining which configurations are admissible). The framing is the engineering reformulation of what the [Blueprint](scope-maturation.md) milestone of a region's maturation actually contains: not just "shapes plus structural procedures" loosely described, but a precise mathematical specification expressible as a geometric theory.

The framing matters because the substrate's discipline at the blueprint stage is checkable: a region claiming to be a blueprint *must* have a fully-specified $(\mathbf{S}, \mathrm{Ax})$, and the substrate's [algebraic constraint validation](algebraic-constraint-validation.md) checks every commit against $\mathrm{Ax}$. Without the formal grounding, "blueprint" would be a name for "we wrote some validation rules"; with it, blueprint is a precise mathematical object the substrate's runtime can act on.

## What a geometric blueprint contains

The two components:

- **Signature $\mathbf{S} = (\mathcal{S}, \Omega, \mathrm{ar})$.** The region's *vocabulary*: a set of sort names $\mathcal{S}$ (the kinds of entities the region admits — entities, relations, scopes, sublocales, ...), a set of operation symbols $\Omega$ (the named operations declared on entities of those sorts), and an arity function $\mathrm{ar}$ assigning each operation symbol its typed input/output profile. The signature is what the region's [outpost](scope-maturation.md) stage establishes; it is purely syntactic, with no commitments about which configurations are valid.
- **Axiom set $\mathrm{Ax}$.** A finite set of *geometric sequents* $\phi \vdash_{\vec{x}} \psi$, where $\phi$ and $\psi$ are *geometric formulas*: built from $\top$, $\bot$, finitary $\wedge$, arbitrary $\bigvee$, and $\exists$. The geometric fragment forbids $\forall$ at the meta-level, forbids classical negation, and forbids meta-level implication. The fragment is exactly what the substrate needs to specify constraint conformance, sheaf-style gluing, and inductive construction without invoking classical first-order logic.

The geometric restriction is not arbitrary: geometric theories admit *classifying topoi* — a categorical universe in which the theory's models are exactly the geometric morphisms into the universe. The substrate's locale-level operation, per [scope-maturation](scope-maturation.md), is the realization of the blueprint's classifying topos with all sections instantiated.

## What a geometric blueprint is not

- **A blueprint is not a signature.** A signature has no axioms; it declares vocabulary without constraining it. An outpost stage carries only the signature; advancing to blueprint adds the axioms.
- **A blueprint is not a charter.** A blueprint has no covering structure. Adding a Grothendieck topology to a blueprint produces a charter. The blueprint determines what is *valid*; the charter determines what counts as *covering*.
- **A blueprint is not a model.** A model of $\mathbb{T}$ is a structure that interprets the signature and satisfies the axioms. Many distinct models can satisfy the same blueprint; the blueprint is the invariant that they share. The substrate's runtime instantiation of a region is one model.
- **A blueprint is not a runtime configuration.** Per [self-representation](self-representation.md), the blueprint is itself substrate content: predications declaring the signature, predications expressing each axiom, all editable through the substrate's normal change discipline. Two implementations of the substrate that disagree on a blueprint disagree about specific substrate predications.

## Why the geometric fragment

The substrate restricts to geometric sequents because three engineering properties follow:

- **Classifying topos exists.** Every geometric theory has a classifying topos: a universe whose objects are the theory's syntactic terms and whose morphisms preserve the theory's axioms. The classifying topos is what the substrate's [locale](../objects/locale.md) realizes — the substrate at runtime is computing within the blueprint's classifying topos with sections filled in by admitted content.
- **Sheaf gluing is expressible.** Closure condition 7 (compatible local sections assemble uniquely into global sections) is itself a geometric sequent. A non-geometric theory could not state the gluing condition as an axiom; it would have to handle gluing externally. The geometric framing keeps everything in the substrate.
- **Separation is not assumed.** The geometric fragment cannot express "any two amalgamations of a matching family are equal" (that requires $\forall$). The substrate's response is structurally elegant: separation is *not* a primitive axiom, but a consequence of the substrate's [closure operators](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) acting on shadow elements (per the math reformulation, the past- and future-direction closures collapse non-separated pairs to a unique fixed-point representative on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)). The framing preserves the substrate's commitment to construction over assertion.

The third property is what distinguishes the geometric framing from naive first-order specifications: the substrate does not hand-wave about uniqueness; it builds uniqueness through the closure-operator quotient.

## Engineering use of the framing

The geometric-blueprint framing produces several substrate-level commitments:

- **Axioms are queryable substrate content.** Each axiom in $\mathrm{Ax}$ is a predication on an axiom-record entity, queryable through the substrate's normal traversal operators. An auditor inspecting "what does this blueprint commit to?" reads the axiom records directly. There is no separate axiom database.
- **Axiom shadow class identifies axiom status.** The substrate's two-[closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) quotient (per the math reformulation) classifies any predication into one of four shadow types: doubly fixed (settled), past-closure-fixed only (recognized but fragile), future-closure-fixed only (structurally required but unarticulated), free (proposed). Applied to axiom predications: a doubly-fixed axiom is *invariant* (recognized and structurally required); a past-fixed axiom is a *working assumption* (community-recognized but not forward-stable); a future-fixed axiom is a *latent* axiom (the substrate's operations require it but the community has not articulated it); a free axiom is a *draft*. The substrate's audit can identify latent axioms automatically by traversing the future-fixed shadow class.
- **Blueprint extension is monotone.** Per the substrate's [installed-base constraint](infrastructure-as-substrate.md), adding axioms to $\mathrm{Ax}$ does not retract prior axioms — extension is monotone. A blueprint extension is itself a substrate edit (admitting new axiom records); the substrate's `align` operator can drive a blueprint to a richer blueprint, with the witness chain recording the additions.
- **Blueprint morphisms produce reduct functors.** A blueprint morphism $\varphi: \mathbb{T}_1 \to \mathbb{T}_2$ is a signature morphism preserving axioms — every axiom of $\mathbb{T}_1$ must translate to an axiom of $\mathbb{T}_2$. By the satisfaction condition (Goguen-Burstall), implementing $\mathbb{T}_2$ entails implementing $\mathbb{T}_1$ via reduct. The engineering content: a substrate that respects a richer blueprint automatically respects every blueprint embedded into it.

## Connection to nearby specifications

The geometric blueprint is the substrate's reformulation of several adjacent specification traditions:

- **Lawvere's algebraic theories** (1963): a category with finite products whose objects are natural numbers and whose morphisms are the theory's operations. The equational fragment of geometric theories. The substrate's blueprint subsumes Lawvere theories when $\mathrm{Ax}$ contains only equational axioms.
- **Ehresmann's sketches** (1968): a small category with designated cones and cocones; models are functors preserving the designations. The substrate's blueprint is an Ehresmann sketch in the geometric fragment.
- **Birkhoff's equational specifications** (1935): the original "set of operations satisfying a set of equations" framing. The substrate's blueprint generalizes this to allow existentials and infinitary disjunctions.
- **Algebraic specification languages** (CASL, OBJ, Maude, etc.): software-engineering languages for specifying data types and behavior algebraically. The substrate's blueprint is the substrate-internal analog: the specification is in the substrate as predications, not in an external file format.

The substrate's contribution is to make the specification *content* rather than *syntax*: a blueprint is a structure of substrate predications, edited through the substrate's normal admission discipline, and acted on by the substrate's closure-rule machinery. There is no separate compile step; the substrate reads its own blueprint by traversal.

## Position in the substrate

Geometric blueprint is the substrate's *formal-specification reformulation*. Without it, the substrate's blueprint stage is described informally; with it, "blueprint" is a precise mathematical object the substrate's runtime can act on, audit can inspect, and federation can align across peers.

The framing composes with [scope-maturation](scope-maturation.md) (the blueprint stage is the substrate at a region having advanced through closure conditions 1–6), with [algebraic-constraint-validation](algebraic-constraint-validation.md) (which evaluates the blueprint's axioms before commits), with [doctrine-fidelity](doctrine-fidelity.md) (which requires that any model the substrate carries is structurally faithful to its blueprint), and with [vocabulary-completeness](vocabulary-completeness.md) (which is the substrate's commitment that every signature element used has a corresponding substrate entity defining it).

The framing's hard discipline: a substrate region claiming blueprint status that lacks a fully-specified $(\mathbf{S}, \mathrm{Ax})$ has not actually reached blueprint — it has named the milestone without earning it. The substrate's `align` operator refuses to advance a region to blueprint without the formal specification in place.
