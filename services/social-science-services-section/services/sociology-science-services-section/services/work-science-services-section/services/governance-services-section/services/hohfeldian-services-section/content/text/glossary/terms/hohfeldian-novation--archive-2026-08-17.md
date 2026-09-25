---

name: "Novation"
description: "A Novation is a triple (K₁, K₂, π) — an existing obligation or contract K₁, a replacement obligation or contract K₂, and an agreement π among the relevant parties that K₁ is extinguished and K₂ takes its place. The defining structure: novation is the site morphism that combines an extinction of K₁ (terminal morphism to ⊥) with a fresh genesis of K₂ (new site constitution), where at least one party or one material term changes (distinguishing novation from amendment, which preserves community identity G₁ = G₂). Formally: the composition of a termination morphism K₁ → ∅ followed by a genesis morphism ∅ → K₂; novation is not a morphism between K₁ and K₂ but a replacement of one object by another, mediated by the parties' agreement π."
date-created: 2026-03-20
---

## Formal definition

A **Novation** is a triple $\mathcal{N} = (K_1, K_2, \pi)$:

$$\mathcal{N} = (K_1 : \mathrm{Obligation},\; K_2 : \mathrm{Obligation},\; \pi : \mathrm{Agreement}(K_1, K_2))$$

together with:
- An **extinction act** $\varepsilon : K_1 \to \emptyset$ — the termination of the original obligation; $K_1$'s obligations, rights, and claims are discharged in full at the moment $\pi$ is effective
- A **genesis act** $\gamma : \emptyset \to K_2$ — the constitution of the replacement obligation; $K_2$ comes into existence simultaneously with $K_1$'s extinction
- The **agreement** $\pi$ — the consent of all parties whose rights are extinguished or created by the novation; $\pi$ must be given by every party whose position changes materially

**Four invariants.** $\mathcal{N}$ is a valid novation iff:

1. **Extinguishment**: $K_1$ is fully discharged at the moment $\pi$ is effective. No residual obligations, liabilities, or claims from $K_1$ survive into $K_2$'s operation. The extinguishment is clean: $K_1 \to \emptyset$ is a terminal morphism (the empty obligation, with no remaining force). This distinguishes novation from assignment (where $K_1$'s obligations persist, only the party changes) and from amendment (where $K_1$ continues as $K_2$ via a morphism, not a replacement).

2. **Genesis**: $K_2$ comes into existence as a new obligation with its own validity, parties, and terms. $K_2$ is not derived from $K_1$; it does not inherit $K_1$'s defects, defenses, or history. A party who had a defense against $K_1$ (e.g., fraudulent inducement) does not automatically have that defense against $K_2$ — $K_2$ must be independently valid.

3. **Tripartite consent** (standard case): all parties whose rights are extinguished or created must consent. In the standard novation of a contract with three parties — original debtor $D$, creditor $C$, and new debtor $D'$ — consent of $D$, $C$, and $D'$ is required. Without $C$'s consent, $D$ cannot unilaterally transfer their obligation to $D'$ (the creditor has the right to choose their debtor).

4. **Material change**: at least one of (a) a party, (b) the subject matter, or (c) the consideration is different between $K_1$ and $K_2$. If nothing material changes, the act is not a novation but a restatement (a clarifying rewrite of the same obligation). The material-change requirement is what distinguishes novation from amendment with complete rewriting.

## The four novation types

Roman law (Digest 46.2) distinguished four forms of novation, all still operative in modern common law and civil law systems:

### Substitution of debtor (expromissio / delegatio)

$D$ (original debtor) is replaced by $D'$ (new debtor). $C$ (creditor) releases $D$ and accepts $D'$ as the new obligor. $K_1 = (D \to C : \text{pay X})$ is extinguished; $K_2 = (D' \to C : \text{pay X})$ is constituted.

**Delegatio** (Dig. 46.2.11): $D$ authorizes $D'$ to assume the obligation; $C$ accepts the substitution. The requirement: $C$'s express consent — a creditor cannot have their debtor changed without agreeing to accept the new one. *Nemo invitus compellitur ad novationem* (Dig. 46.2.14: no one is compelled to novate against their will).

### Substitution of creditor (cessio in novationem)

$C$ is replaced by $C'$. Less common because assignment of credits ($K_1 \to K_1'$ with $C' = C$) achieves the same result without requiring $D$'s consent. True novation of the creditor requires extinguishment of $D$'s obligation to $C$ and creation of a new obligation to $C'$, requiring $D$'s consent to the new obligation.

### Substitution of obligation (novation of terms)

Same parties; different terms. The subject matter, the consideration, or the conditions change. Example: a loan obligation is novated by a promissory note (Dig. 46.2.1: "si quis stipulatus sit... novatio fit"). The old claim is extinguished; the note creates a new claim with its own defenses and limitations period.

This is the type most easily confused with amendment. The test: is the community preserved? If the parties are the same and the new obligation is a morphism from the old one (continuous, conservative or otherwise), it is amendment ([Amendment](../../../../../../../../../../../../content/text/glossary/terms/amendment.md)). If the new obligation extinguishes the old and reconstitutes entirely, even between the same parties, it is novation.

### Addition of a surety or condition

A new party is added to an existing obligation, transforming a simple bilateral obligation into a three-party structure. This is novation because the original obligation (A owes B) is extinguished and replaced by a new tripartite structure. In modern law, this is more typically handled by surety addition without novation, but historically it required novation.

## Novation vs. amendment

The central distinction (see [Amendment](../../../../../../../../../../../../content/text/glossary/terms/amendment.md)):

| Dimension | Amendment | Novation |
|---|---|---|
| Community identity | Preserved ($G_1 = G_2$) | Changed ($G_1 \neq G_2$ — at least one party changes) |
| Continuity of obligation | Obligation persists through change | Original obligation extinguished; new obligation created |
| Prior defenses | Carried forward | Not automatically carried forward |
| Prior obligations | Survive unless explicitly modified | Discharged in full at extinction |
| Authorization | Derived from obligation's amendment procedure | Requires fresh consent from all affected parties |
| Math | Morphism in the category of charters | Terminal morphism ∘ genesis — replacement, not morphism |

The test for novation vs. amendment: "is there a morphism $\mathcal{C}_1 \to \mathcal{C}_2$ that preserves community identity?" If yes, it is an amendment. If the only path from $\mathcal{C}_1$ to $\mathcal{C}_2$ passes through $\emptyset$ (extinction followed by genesis), it is novation.

## Novation vs. assignment

Assignment transfers a right from one party to another without the obligor's consent (the right to receive payment is alienable). Novation extinguishes the entire obligation and creates a new one. The difference:

| Dimension | Assignment | Novation |
|---|---|---|
| Obligor's consent | Not required for assignment of rights | Required (new obligation must be consented to) |
| Obligation continuity | Original obligation persists; right changes hands | Original obligation extinguished |
| Defenses | Obligor retains all defenses against the original | Obligor may lose defenses against new obligation |
| What transfers | The right (a Hohfeldian claim) | Nothing transfers — old extinguished, new created |

## Math grounding

The novation is the composition of two morphisms in the category of charters:

$$\mathcal{N} = \gamma \circ \varepsilon : K_1 \xrightarrow{\varepsilon} \emptyset \xrightarrow{\gamma} K_2$$

where:
- $\varepsilon : K_1 \to \emptyset$ is the **terminal morphism** — the unique morphism from $K_1$ to the empty charter (the charter with no obligations, no parties, no history); this is the categorical termination
- $\gamma : \emptyset \to K_2$ is the **genesis morphism** — the unique morphism from the empty charter to $K_2$; this is the categorical constitution of a new obligation from nothing

In site-morphism terms ([Amendment](../../../../../../../../../../../../content/text/glossary/terms/amendment.md)): $\varepsilon$ collapses the site $(T_{K_1}, J_{K_1})$ to the empty site $(\emptyset, \emptyset)$; $\gamma$ constructs the new site $(T_{K_2}, J_{K_2})$ from scratch. The agreement $\pi$ is the colimit of the diagram $K_1 \xleftarrow{\varepsilon^{-1}} \emptyset \xrightarrow{\gamma} K_2$ — the party-wise consent that makes the composition effective.

The novation is not a morphism $K_1 \to K_2$ (there is no site morphism between two charters with different communities — different community identity means different base categories, and there is no continuous functor between them unless the community is preserved). Instead it passes through the empty site.

## Open questions

- Whether the "tripartite consent" requirement (all parties must agree) corresponds to a limit condition in the category of charters: whether $\pi$ is the limit of the diagram consisting of all parties' consent morphisms, and whether the novation is valid iff this limit exists.
- Whether the requirement that $K_2$'s defenses are independent of $K_1$'s corresponds to the genesis morphism $\gamma : \emptyset \to K_2$ being an initial morphism (no information from $K_1$ is carried forward) rather than a partial morphism from $K_1$.
- Whether there is a weaker notion — novation up to homotopy — where $K_1$ and $K_2$ are different but homotopy-equivalent charters (the same "up to continuous deformation"), and whether this corresponds to Morita equivalence of the corresponding sites.
