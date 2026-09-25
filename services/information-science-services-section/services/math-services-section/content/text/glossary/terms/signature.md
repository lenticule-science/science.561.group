---
name: "Signature"
description: "A Signature is a many-sorted specification S = (Sorts, Ops, ar) — a finite set of sort names, a family of named operation symbols, and an arity function assigning each operation a typed profile (input-sort sequence) → (output sort). The defining structure: a signature is the purely syntactic skeleton of a theory, specifying what operations a structure must provide without axioms or semantics. Signature morphisms (a sort-map and an operation-map that together preserve typed profiles) form the category Sig; they induce reduct functors on model categories that go backward, while sentence-translation goes forward — the satisfaction condition (Goguen & Burstall 1992)."
date-created: 2026-03-20
id: signature
date-modified: 2026-03-20
params:
  sorts: relational-universe
  operations: relational-universe-morphism
  arity-function: relational-universe-morphism
output: relational-universe-morphism
ast:
  many-sorted-interface:
    - arity-function:
        - sorts
        - operations
    - signature-morphism:
        - arity-function
        - arity-function

---


## Formal definition

A **Signature** is a triple $\mathbf{S} = (\mathcal{S}, \Omega, ar)$:

$$\mathbf{S} = (\mathcal{S} : \mathrm{FinSet},\; \Omega : \mathrm{FinSet},\; ar : \Omega \to \mathcal{S}^* \times \mathcal{S})$$

where:
- $\mathcal{S}$ is the **sort set** — a finite set of type names; sorts classify the objects a structure operates on; in the relational universe, the sort set is drawn from the type vocabulary $\mathrm{Types} = \{\mathrm{relational\text{-}universe},\; \mathrm{relational\text{-}universe\text{-}morphism},\; \mathrm{charter},\; \mathrm{person},\; \mathrm{area},\; \mathrm{relational\text{-}history},\; \ldots\}$
- $\Omega$ is the **operation symbol set** — a finite set of named operation symbols; each operation symbol names one thing a structure of this signature must provide
- $ar : \Omega \to \mathcal{S}^* \times \mathcal{S}$ is the **arity function** — assigning each operation $\omega \in \Omega$ a **profile** $(s_1 \cdots s_n,\; s) \in \mathcal{S}^* \times \mathcal{S}$, meaning $\omega$ takes inputs of sorts $s_1, \ldots, s_n$ and produces output of sort $s$; an operation with empty input sequence ($n = 0$) is a **constant** — it declares that a value of sort $s$ must be provided with no further input

**Four invariants.** $\mathbf{S}$ is a signature iff it satisfies:

1. **Finiteness**: $|\mathcal{S}| < \infty$ and $|\Omega| < \infty$ — signatures are finite; they admit decidable satisfaction checking; infinite signatures cannot be verified at any history.

2. **Profile closure**: $ar$ is well-typed — every sort appearing in any profile is in $\mathcal{S}$: for every $\omega \in \Omega$ with $ar(\omega) = (s_1 \cdots s_n, s)$, each $s_i$ and $s$ is in $\mathcal{S}$. A profile mentioning an undeclared sort is not a valid arity.

3. **No axioms**: a signature carries no equations, implications, or constraints on what the operations must do — it specifies the *syntactic* interface only. Adding axioms produces a [Theory](#open-questions); the signature and its theory are distinct objects. This is the Goguen-Burstall separation: the signature category **Sig** is the syntactic level; models (implementations) are the semantic level.

4. **Operation distinctness**: operation symbols in $\Omega$ are distinct names. Two operations $\omega_1, \omega_2 \in \Omega$ with identical profiles but distinct names are distinct operations — the name is part of the specification, not an implementation detail.

## Signature morphism

A **signature morphism** $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$ is a pair $\varphi = (\varphi_\mathcal{S}, \varphi_\Omega)$ where:
- $\varphi_\mathcal{S} : \mathcal{S}_1 \to \mathcal{S}_2$ is a **sort map** — a function on sort names
- $\varphi_\Omega : \Omega_1 \to \Omega_2$ is an **operation map** — a function on operation symbols

subject to the **profile-preservation condition**: for every $\omega \in \Omega_1$ with $ar_1(\omega) = (s_1 \cdots s_n,\; s)$,

$$ar_2(\varphi_\Omega(\omega)) = (\varphi_\mathcal{S}(s_1) \cdots \varphi_\mathcal{S}(s_n),\; \varphi_\mathcal{S}(s))$$

The morphism translates names: it maps each operation in $\mathbf{S}_1$ to an operation in $\mathbf{S}_2$ whose profile is the sort-translated profile of the original.

**Signature morphisms are not required to be injective.** A morphism may merge distinct sorts ($\varphi_\mathcal{S}$ need not be injective) or map distinct operations to the same target operation ($\varphi_\Omega$ need not be injective). This allows for renaming, collapsing, and forgetting.

**The category $\mathbf{Sig}$.** Signatures with their morphisms form a category: identity morphism $\mathrm{id}_\mathbf{S} = (\mathrm{id}_\mathcal{S}, \mathrm{id}_\Omega)$; composition $(\varphi' \circ \varphi)_\mathcal{S} = \varphi'_\mathcal{S} \circ \varphi_\mathcal{S}$, $(\varphi' \circ \varphi)_\Omega = \varphi'_\Omega \circ \varphi_\Omega$. Profile-preservation composes.

**$\mathbf{Sig}$ has all colimits** (set-theoretic construction). In particular, given a span $\mathbf{S}_1 \xleftarrow{\varphi_1} \mathbf{S}_0 \xrightarrow{\varphi_2} \mathbf{S}_2$, the pushout $\mathbf{S}_1 \sqcup_{\mathbf{S}_0} \mathbf{S}_2$ is formed by taking the disjoint union of sorts and operations from $\mathbf{S}_1$ and $\mathbf{S}_2$ and identifying the images of $\mathbf{S}_0$ under $\varphi_1$ and $\varphi_2$. This is the **signature union** over a common sub-signature.

**Inclusion morphism.** If $\mathbf{S}_1 = (\mathcal{S}_1, \Omega_1, ar_1)$ and $\mathbf{S}_2 = (\mathcal{S}_2, \Omega_2, ar_2)$ with $\mathcal{S}_1 \subseteq \mathcal{S}_2$, $\Omega_1 \subseteq \Omega_2$, and $ar_2|_{\Omega_1} = ar_1$, then the inclusions form a signature morphism $\iota : \mathbf{S}_1 \hookrightarrow \mathbf{S}_2$. This is the **subsumption morphism** used by CapabilitySignature: when all operations are 0-ary constants and the sort set is $\mathrm{Types}$, signature inclusion coincides with capability-signature subsumption.

## Implementations

A **$\mathbf{S}$-implementation** $M$ of a signature $\mathbf{S} = (\mathcal{S}, \Omega, ar)$ over a relational universe is an assignment:
- For each sort $s \in \mathcal{S}$: a carrier $M_s$ (a relational universe object of sort $s$)
- For each operation $\omega \in \Omega$ with $ar(\omega) = (s_1 \cdots s_n, s)$: a relational-universe-morphism $M_\omega : M_{s_1} \times \cdots \times M_{s_n} \to M_s$

An implementation *interprets* the signature: it provides concrete objects and morphisms for every declared sort and operation symbol.

**Reduct functor.** A signature morphism $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$ induces a **reduct functor** $\varphi^* : \mathrm{Impl}(\mathbf{S}_2) \to \mathrm{Impl}(\mathbf{S}_1)$ going *backward*:

$$\varphi^*(M)_s = M_{\varphi_\mathcal{S}(s)} \qquad \varphi^*(M)_\omega = M_{\varphi_\Omega(\omega)}$$

The reduct re-labels: it takes an $\mathbf{S}_2$-implementation and reads it as an $\mathbf{S}_1$-implementation by following the translation. The reduct *forgets* all operations and sorts in $\mathbf{S}_2$ that are not in the image of $\varphi$.

**Reduct is contravariantly functorial**: $(\varphi' \circ \varphi)^* = \varphi^* \circ (\varphi')^*$ and $\mathrm{id}^* = \mathrm{Id}$.

## Institution structure

The relational universe $(T, J, H)$ admits a signature-theoretic reading as an **institution** (Goguen & Burstall, *JACM* 39(1), 1992): an institution $\mathbf{I} = (\mathbf{Sig}, \mathrm{Sen}, \mathrm{Mod}, \models)$ consisting of:

- $\mathbf{Sig}$ — the category of signatures (as defined above)
- $\mathrm{Sen} : \mathbf{Sig} \to \mathbf{Set}$ — a covariant functor assigning to each signature $\mathbf{S}$ the set of $\mathbf{S}$-propositions expressible in the fiber Heyting algebra; a signature morphism $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$ acts on sentences by **forward translation** $\mathrm{Sen}(\varphi)$: substituting each sort and operation in a sentence with its $\varphi$-image
- $\mathrm{Mod} : \mathbf{Sig}^{op} \to \mathbf{Cat}$ — a contravariant functor assigning to each $\mathbf{S}$ the category of $\mathbf{S}$-implementations; a morphism $\varphi$ acts as the reduct functor $\varphi^*$ going backward
- $\models_{\mathbf{S},t} \subseteq |\mathrm{Mod}(\mathbf{S})| \times \mathrm{Sen}(\mathbf{S})$ — satisfaction at history $t$: implementation $M \models_{\mathbf{S},t} \rho$ iff $\rho \in H^*_t$ when interpreted under $M$

**The satisfaction condition** (Goguen & Burstall's coherence axiom): for every signature morphism $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$, every $\mathbf{S}_2$-implementation $M'$, and every $\mathbf{S}_1$-sentence $\rho$:

$$M' \models_{\mathbf{S}_2,t} \mathrm{Sen}(\varphi)(\rho) \iff \varphi^*(M') \models_{\mathbf{S}_1,t} \rho$$

*Truth is invariant under change of notation.* Translating a sentence forward to $\mathbf{S}_2$ (via $\mathrm{Sen}(\varphi)$) and checking it against $M'$ gives the same result as checking the original sentence against the reduct $\varphi^*(M')$. This coherence axiom is what makes the institution hang together: morphisms rename without changing what is true.

## Nuclear derivation

**Signature proposition.** For each signature $\mathbf{S}$ recognized within normative system $I$ at history $t$, define:

$$\mathbf{sig}_\mathbf{S} \in H_t$$

as the proposition "signature $\mathbf{S}$ is constitutively active in $I$ at history $t$." This is a proposition about the existence of the specification interface itself — distinct from any proposition about an implementation.

**Implementation proposition.** For each structure $M$ and signature $\mathbf{S}$ at history $t$, define:

$$\mathrm{impl}_{M,\mathbf{S}} \in H_t$$

as the proposition "structure $M$ implements signature $\mathbf{S}$ at history $t$" — $M$ provides a doubly-settled carrier and morphism for every sort and operation in $\mathbf{S}$.

**Signature operativity.** Signature $\mathbf{S}$ is operative at $t$ iff:

$$\mathbf{sig}_\mathbf{S} \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$

The double-settlement: $\sigma_t(\mathbf{sig}_\mathbf{S}) = \mathbf{sig}_\mathbf{S}$ — the interface is recognized by the normative community; $\Delta_t(\mathbf{sig}_\mathbf{S}) = \mathbf{sig}_\mathbf{S}$ — the interface is stable forward.

**Implementation operativity.** $M$ operatively implements $\mathbf{S}$ at $t$ iff:

$$\mathrm{impl}_{M,\mathbf{S}} \in H^*_t$$

This requires $\mathbf{sig}_\mathbf{S} \in H^*_t$ (signature operative) and, for each sort $s \in \mathcal{S}$, the carrier proposition $M_s \in H^*_t$, and for each operation $\omega \in \Omega$, the morphism proposition $M_\omega \in H^*_t$.

**Four failure modes** for $\mathbf{sig}_\mathbf{S}$:

| Quadrant | $\sigma_t(\mathbf{sig}_\mathbf{S})$ | $\Delta_t(\mathbf{sig}_\mathbf{S})$ | Signature status |
|---|---|---|---|
| $H^*_t$ | $= \mathbf{sig}_\mathbf{S}$ | $= \mathbf{sig}_\mathbf{S}$ | Operative: recognized and institutionally stable |
| $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ | $= \mathbf{sig}_\mathbf{S}$ | $> \mathbf{sig}_\mathbf{S}$ | Recognized but fragile — accepted as an interface but not institutionally sustained forward |
| $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ | $> \mathbf{sig}_\mathbf{S}$ | $= \mathbf{sig}_\mathbf{S}$ | Structurally required but unrecognized — the system needs this interface but no community has named it |
| $H_t \setminus (H^*_t \cup \mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ | $> \mathbf{sig}_\mathbf{S}$ | $> \mathbf{sig}_\mathbf{S}$ | Proposed only — drafted but inoperative |

**Theorem (Implementation Persistence).** If $\mathrm{impl}_{M,\mathbf{S}} \in H^*_t$ and $f : s \to t$ is a morphism in the site $(T, J)$, then $H(f)(\mathrm{impl}_{M,\mathbf{S}}) \in H^*_s$.

*Proof sketch.* By the Persistence Theorem for $H^*$ (Institution): restriction maps $H(f) : H_t \to H_s$ satisfy $H(f)(H^*_t) \subseteq H^*_s$. Since $\mathrm{impl}_{M,\mathbf{S}} \in H^*_t$, $H(f)(\mathrm{impl}_{M,\mathbf{S}}) \in H^*_s$. $\square$

Implementation Persistence is the nuclear content of the satisfaction condition: a structure that operatively implements a signature at $t$ also operatively implements it at every earlier history $s \leq t$.

**Theorem (Reduct Monotonicity).** If $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$ is a signature morphism and $\mathrm{impl}_{M,\mathbf{S}_2} \in H^*_t$, then $\mathrm{impl}_{\varphi^*(M),\mathbf{S}_1} \in H^*_t$.

*Proof sketch.* $\mathrm{impl}_{M,\mathbf{S}_2} \in H^*_t$ means every carrier $M_s$ and operation $M_\omega$ for $s \in \mathcal{S}_2$, $\omega \in \Omega_2$ is doubly settled. The reduct $\varphi^*(M)$ uses carriers $M_{\varphi_\mathcal{S}(s)}$ and operations $M_{\varphi_\Omega(\omega)}$ for $s \in \mathcal{S}_1$, $\omega \in \Omega_1$ — all in the image of $\varphi$, hence all doubly settled. Therefore $\mathrm{impl}_{\varphi^*(M),\mathbf{S}_1} \in H^*_t$. $\square$

Reduct Monotonicity is the nuclear statement of the satisfaction condition: implementing a richer signature entails implementing every signature into which a morphism exists. This is the general theorem of which CapabilitySignature's Subsumption Satisfaction Monotonicity is the restricted (0-ary inclusion-morphism) case.

## FARS instantiation

In FARS, two specific classes of signatures appear:

**0-ary signatures (params: blocks).** Every spec's `params:` block is a signature with sort set $\mathcal{S} \subseteq \mathrm{Types}$ and all operations of arity 0 (constants). The `params:` entry `name: type` declares a constant operation named `name` of output sort `type`. The capability-signature $\kappa : \mathrm{ParamNames} \to \mathrm{Types}$ (see CapabilitySignature) is the FARS name for this restricted form.

**Nuclear pair signature.** The nuclear pair $(\sigma_t, \Delta_t)$ on fiber $H_t$ has the signature:

$$\mathbf{S}_{\mathrm{nuc}} = (\{\mathrm{H}\},\; \{\sigma, \Delta\},\; ar)$$

with $ar(\sigma) = (\mathrm{H}, \mathrm{H})$ and $ar(\Delta) = (\mathrm{H}, \mathrm{H})$ — two 1-ary operations from sort $\mathrm{H}$ to sort $\mathrm{H}$. An implementation of $\mathbf{S}_{\mathrm{nuc}}$ is exactly a pair of endomorphisms on $H_t$ — the nuclear pair itself is one such implementation, and the axioms (inflation, monotonicity, idempotence) are added to obtain the theory of nuclei from this signature.

## Signature vs. adjacent concepts

| Concept | What it specifies | Has axioms? | Morphisms | Key source |
|---|---|---|---|---|
| **Signature** | Sort names + operation profiles | No | Sort-map + operation-map preserving profiles | Goguen & Burstall (1992) |
| **CapabilitySignature** | 0-ary signature over $\mathrm{Types}$ | No | Subsumption inclusion $\iota : \kappa_1 \hookrightarrow \kappa_2$ | This system; RBAC (Sandhu 1996) |
| **Theory** | Signature + axiom set | Yes | Theory morphism (sig morphism preserving consequence) | Goguen & Burstall (1992) |
| **Institution** | Category of signatures + Sen + Mod + $\models$ | No — axioms live in theories | Institution morphism | Goguen & Burstall (1992) |
| **NormativeSystem** | Roles + norms + deontic constraints | Yes | Normative morphism | This system |

A **signature** is the syntactic skeleton; a **theory** is the signature plus axioms; a **specification** is a theory intended for implementation (possibly open/parameterized); a **normative system** is a theory whose axioms are deontic (obligation, permission, prohibition).

## Open questions

- Whether the institution $(T, J, H)$ satisfies the **amalgamation property** for its signature pushouts: given a pushout $\mathbf{S}_1 \sqcup_{\mathbf{S}_0} \mathbf{S}_2$ and implementations $M_1 \in \mathrm{Impl}(\mathbf{S}_1)$, $M_2 \in \mathrm{Impl}(\mathbf{S}_2)$ agreeing on $\mathbf{S}_0$ (their reducts to $\mathbf{S}_0$ coincide), whether there exists an implementation $M \in \mathrm{Impl}(\mathbf{S}_1 \sqcup_{\mathbf{S}_0} \mathbf{S}_2)$ whose reducts to $\mathbf{S}_1$ and $\mathbf{S}_2$ are $M_1$ and $M_2$. This would allow theories to be combined by specification union — a key tool for modular specification.
- Whether **derived signature morphisms** — where an operation in $\mathbf{S}_1$ maps not to a single operation in $\mathbf{S}_2$ but to a term built from $\mathbf{S}_2$-operations — are necessary for expressing renaming-by-definition in this system; and whether derived morphisms preserve the satisfaction condition or require a stronger version (the term-translation variant studied in Mossakowski et al. 2016).
- Whether the **sort set** $\mathcal{S}$ of a signature should be closed under the type constructors of the relational universe (products $\times$, exponentials $\to$, presheaf type $H(-)$) — whether the FARS type vocabulary needs to be closed under these operations to form a well-behaved signature category, or whether partial closure is sufficient.
- Whether the **Grothendieck institution** construction (Diaconescu 2002) applies: given that our system has multiple "levels" of signature (0-ary for FARS specs, 1-ary for nuclear pairs, higher for general algebraic structures), whether there is an indexed institution $(i \mapsto \mathbf{I}_i)$ that is flattened into a single global institution via the Grothendieck construction — and whether the resulting global signature category captures the multi-level structure of the system.
- Whether the **initial algebra** $T_\mathbf{S}$ (the term algebra over signature $\mathbf{S}$) has a nuclear representation — whether $T_\mathbf{S}$ corresponds to the least doubly-settled implementation: $\mathrm{impl}_{T_\mathbf{S},\mathbf{S}} \in H^*_t$ and for any other $M$ with $\mathrm{impl}_{M,\mathbf{S}} \in H^*_t$, there is a unique implementation morphism $T_\mathbf{S} \to M$ that is doubly-settled.

## Earlier material

A signature category $\mathbf{Sig}$ is the syntactic core of an **institution** in the sense of Goguen and Burstall (*JACM* 39(1), 1992). An institution $\mathbf{I} = (\mathbf{Sig}, \mathrm{Sen}, \mathrm{Mod}, \models)$ consists of:

$$M' \models_{\mathbf{S}_2} \mathrm{Sen}(\varphi)(\rho) \iff \varphi^*(M') \models_{\mathbf{S}_1} \rho$$

| Concept | What it specifies | Has axioms? | Morphisms | Key source |
|---|---|---|---|---|
| **Signature** | Sort names + operation profiles | No | Sort-map + operation-map preserving profiles | Goguen & Burstall (1992) |
| **[CapabilitySignature](../../../../../../../natural-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/library/science/mathematics/engineering/theories/tech/terms/capability-signature.md)** | 0-ary signature over $\mathrm{Types}$ | No | Subsumption inclusion $\iota : \kappa_1 \hookrightarrow \kappa_2$ | This system; RBAC (Sandhu 1996) |
| **Theory** | Signature + axiom set | Yes | Theory morphism (sig morphism preserving consequence) | Goguen & Burstall (1992) |
| **Institution** | Category of signatures + Sen + Mod + $\models$ | No — axioms live in theories | Institution morphism | Goguen & Burstall (1992) |
| **[NormativeSystem](../../../../../../../social-science-services-section/content/text/glossary/terms/normative-system.md)** | Roles + norms + deontic constraints | Yes | Normative morphism | This system |

- Whether **amalgamation** holds in a given institution — given a pushout $\mathbf{S}_1 \sqcup_{\mathbf{S}_0} \mathbf{S}_2$ and models $M_1, M_2$ that agree on $\mathbf{S}_0$ via their reducts, whether there exists a model of the pushout signature whose reducts to $\mathbf{S}_1$ and $\mathbf{S}_2$ are $M_1$ and $M_2$. Amalgamation is the key tool for combining theories by specification union.
- Whether **derived signature morphisms** — where an operation in $\mathbf{S}_1$ maps to a term built from $\mathbf{S}_2$-operations rather than to a single operation — preserve the satisfaction condition or require a stronger version (the term-translation variant studied in Mossakowski et al. 2016).
- Whether the **Grothendieck institution** construction (Diaconescu 2002) is the right way to combine indexed institutions $(i \mapsto \mathbf{I}_i)$ into a single global institution that captures multi-level signature structure.
