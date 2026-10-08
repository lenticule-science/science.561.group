---
type: reference
authors: [Rivieccio, Umberto, Jung, Achim, Jansana, Ramon]
year: 2017
title: "Four-Valued Modal Logic: Kripke Semantics and Duality"
venue: "Journal of Logic and Computation 27(1), 155–199"
description: U.
---

## Full citation

U. Rivieccio, A. Jung, R. Jansana. "Four-valued modal logic: Kripke semantics and duality." *Journal of Logic and Computation* 27(1), 155–199, 2017.

## Status

Read locally; PDF at `sources/rivieccio-et-al2017.pdf` (45 pp).

## Annotation

Develops a four-valued modal logic with four-valued Kripke semantics. The principal results we use:

**Twist translation (Definition / Proposition 5.20–5.21).** A formula $\phi$ in the four-valued modal language is translated into a pair $\nu(\phi) = (\nu_1(\phi), \nu_2(\phi))$ of classical bimodal formulas:

$$\nu_1(\Box \phi) = \Box_+ \nu_1(\phi) \sqcap \Box_- \sim \nu_2(\phi),$$
$$\nu_2(\Box \phi) = \sim \Box_+ \sim \nu_2(\phi).$$

**Theorem 5.22 (consequence-relation soundness and decidability).** Both local and global consequence are equi-expressive with classical bimodal logic on the $(\nu_1, \nu_2)$ components, and inherit decidability and the finite model property from classical bimodal logic.

**Non-normality.** The classical normality axiom $\Box(\phi \to \psi) \to (\Box \phi \to \Box \psi)$ fails in the four-valued setting. This is structurally important for our modal calculus on the predication fibers and is what distinguishes it from classical Kripke modalities.

Notation in the source: $\bowtie$ (written as $\boxtimes$ in the paper) for the twist product; $\Box_+, \Box_-$ for the positive and negative components of bimodal accessibility; $R_+, R_-$ for the bimodal Boolean accessibility relations.

Primary source for the foundational layer (modal calculus on predication fibers).

## Related local

- `sources/jung-rivieccio2013.pdf` — the LICS 2013 conference precursor, "Kripke semantics for modal bilattice logic." Less developed; this 2017 paper supersedes.
