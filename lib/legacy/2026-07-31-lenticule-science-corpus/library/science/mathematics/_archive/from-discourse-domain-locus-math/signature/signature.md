---

title: "Signature"
description: "A Signature is a many-sorted specification S = (Sorts, Ops, ar) — a finite set of sort names, a family of named operation symbols, and an arity function assigning each operation a typed profile (input-sort sequence) → (output sort). The defining structure: a signature is the purely syntactic skeleton of a theory, specifying what operations a structure must provide without axioms or semantics. Signature morphisms (a sort-map and an operation-map that together preserve typed profiles) form the category Sig; they induce reduct functors on model categories that go backward, while sentence-translation goes forward — the satisfaction condition (Goguen & Burstall 1992)."
date-created: 2026-03-20
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

**Inclusion morphism.** If $\mathbf{S}_1 = (\mathcal{S}_1, \Omega_1, ar_1)$ and $\mathbf{S}_2 = (\mathcal{S}_2, \Omega_2, ar_2)$ with $\mathcal{S}_1 \subseteq \mathcal{S}_2$, $\Omega_1 \subseteq \Omega_2$, and $ar_2|_{\Omega_1} = ar_1$, then the inclusions form a signature morphism $\iota : \mathbf{S}_1 \hookrightarrow \mathbf{S}_2$. This is the **subsumption morphism** used by [CapabilitySignature](../../../engineering/theories/tech/terms/capability-signature.md): when all operations are 0-ary constants and the sort set is $\mathrm{Types}$, signature inclusion coincides with capability-signature subsumption.

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

A signature category $\mathbf{Sig}$ is the syntactic core of an **institution** in the sense of Goguen and Burstall (*JACM* 39(1), 1992). An institution $\mathbf{I} = (\mathbf{Sig}, \mathrm{Sen}, \mathrm{Mod}, \models)$ consists of:

- $\mathbf{Sig}$ — the category of signatures (as defined above)
- $\mathrm{Sen} : \mathbf{Sig} \to \mathbf{Set}$ — a covariant functor assigning to each signature $\mathbf{S}$ the set of $\mathbf{S}$-sentences; a signature morphism $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$ acts on sentences by **forward translation** $\mathrm{Sen}(\varphi)$: substituting each sort and operation in a sentence with its $\varphi$-image
- $\mathrm{Mod} : \mathbf{Sig}^{op} \to \mathbf{Cat}$ — a contravariant functor assigning to each $\mathbf{S}$ the category of $\mathbf{S}$-models (implementations); a morphism $\varphi$ acts as the reduct functor $\varphi^*$ going backward
- $\models_{\mathbf{S}} \subseteq |\mathrm{Mod}(\mathbf{S})| \times \mathrm{Sen}(\mathbf{S})$ — the satisfaction relation between models and sentences

**The satisfaction condition** (Goguen & Burstall's coherence axiom): for every signature morphism $\varphi : \mathbf{S}_1 \to \mathbf{S}_2$, every $\mathbf{S}_2$-model $M'$, and every $\mathbf{S}_1$-sentence $\rho$:

$$M' \models_{\mathbf{S}_2} \mathrm{Sen}(\varphi)(\rho) \iff \varphi^*(M') \models_{\mathbf{S}_1} \rho$$

*Truth is invariant under change of notation.* Translating a sentence forward to $\mathbf{S}_2$ (via $\mathrm{Sen}(\varphi)$) and checking it against $M'$ gives the same result as checking the original sentence against the reduct $\varphi^*(M')$. This coherence axiom is what makes the institution hang together: morphisms rename without changing what is true.

## Signature vs. adjacent concepts

| Concept | What it specifies | Has axioms? | Morphisms | Key source |
|---|---|---|---|---|
| **Signature** | Sort names + operation profiles | No | Sort-map + operation-map preserving profiles | Goguen & Burstall (1992) |
| **[CapabilitySignature](../../../engineering/theories/tech/terms/capability-signature.md)** | 0-ary signature over $\mathrm{Types}$ | No | Subsumption inclusion $\iota : \kappa_1 \hookrightarrow \kappa_2$ | This system; RBAC (Sandhu 1996) |
| **Theory** | Signature + axiom set | Yes | Theory morphism (sig morphism preserving consequence) | Goguen & Burstall (1992) |
| **Institution** | Category of signatures + Sen + Mod + $\models$ | No — axioms live in theories | Institution morphism | Goguen & Burstall (1992) |
| **[NormativeSystem](../../../humanities/theories/sociology/theories/work/theories/governance/terms/normative-system.md)** | Roles + norms + deontic constraints | Yes | Normative morphism | This system |

A **signature** is the syntactic skeleton; a **theory** is the signature plus axioms; a **specification** is a theory intended for implementation (possibly open/parameterized); a **normative system** is a theory whose axioms are deontic (obligation, permission, prohibition).

## Open questions

- Whether **amalgamation** holds in a given institution — given a pushout $\mathbf{S}_1 \sqcup_{\mathbf{S}_0} \mathbf{S}_2$ and models $M_1, M_2$ that agree on $\mathbf{S}_0$ via their reducts, whether there exists a model of the pushout signature whose reducts to $\mathbf{S}_1$ and $\mathbf{S}_2$ are $M_1$ and $M_2$. Amalgamation is the key tool for combining theories by specification union.
- Whether **derived signature morphisms** — where an operation in $\mathbf{S}_1$ maps to a term built from $\mathbf{S}_2$-operations rather than to a single operation — preserve the satisfaction condition or require a stronger version (the term-translation variant studied in Mossakowski et al. 2016).
- Whether the **Grothendieck institution** construction (Diaconescu 2002) is the right way to combine indexed institutions $(i \mapsto \mathbf{I}_i)$ into a single global institution that captures multi-level signature structure.
