---
name: nuclear-quartet-termset

description: "The four nuclear closure terms of a proposition in a nuclear language: the proposition itself, its saturation closure, its transfer closure, and its joint closure — the language-level counterpart of the nuclear quartet subalgebra."
---

### Definition — Nuclear Quartet Termset {#nuclear-quartet-termset}

Given a proposition $M$ in a nuclear language with nuclei $\mathrm{Saturate}$ and
$\mathrm{Transfer}$, the **nuclear quartet termset** of $M$ is the set of four terms:
$$
\bigl\{\; M,\quad \mathrm{Saturate}(M),\quad \mathrm{Transfer}(M),\quad \mathrm{Saturate}(\mathrm{Transfer}(M)) \;\bigr\}
$$
where $\mathrm{Saturate}(\mathrm{Transfer}(M)) = \mathrm{Transfer}(\mathrm{Saturate}(M))$
by the commutativity of the two nuclei.

The four terms are respectively:

| Term | Name | Role |
|---|---|---|
| $M$ | the proposition | free — no nuclear closure applied |
| $\mathrm{Saturate}(M)$ | [saturation closure](saturation-closure.md) | quiescent under Saturate |
| $\mathrm{Transfer}(M)$ | [transfer closure](transfer-closure.md) | quiescent under Transfer |
| $\mathrm{Saturate}(\mathrm{Transfer}(M))$ | [joint closure](joint-closure.md) | quiescent under both |

#### Structure of the Termset {#nuclear-quartet-termset-structure}

The four terms are ordered by the preorder of the nuclear language. By extensivity of
each nucleus:
$$
M \;\leq\; \mathrm{Saturate}(M), \quad M \;\leq\; \mathrm{Transfer}(M), \quad
\mathrm{Saturate}(M) \;\leq\; \mathrm{Saturate}(\mathrm{Transfer}(M)), \quad
\mathrm{Transfer}(M) \;\leq\; \mathrm{Saturate}(\mathrm{Transfer}(M)).
$$
These four inequalities give the same diamond shape as the
[reflective nuclear square](reflective-nuclear-square.md): $M$ at the free corner,
the joint closure at the doubly quiescent corner, the two individual closures at the
off-diagonal corners.

The two paths to the joint closure:
- **Saturate-first**: $M \to \mathrm{Saturate}(M) \to \mathrm{Transfer}(\mathrm{Saturate}(M))$
- **Transfer-first**: $M \to \mathrm{Transfer}(M) \to \mathrm{Saturate}(\mathrm{Transfer}(M))$

arrive at the same term because the nuclei commute. In
[FiberNuclearLanguage](fiber-nuclear-language.md), the canonical normal form is
$\mathrm{Saturate}(\mathrm{Transfer}(M))$ (reduction rule R7 orients mixed nestings
toward Transfer-first, so the written form is Transfer inside Saturate).

#### Relationship to the Nuclear Quartet Subalgebra {#nuclear-quartet-termset-vs-subalgebra}

The [nuclear quartet subalgebra](nuclear-quartet-subalgebra.md) operates at the
semantic level: its four objects are sub-algebras of a fiber Heyting algebra —
collections of propositions fixed by one or both nuclei.

The nuclear quartet termset operates at the syntactic level: its four objects are
specific terms — individual propositions, one at each nuclear grade of closure.

The correspondence is exact: the denotation map sends the nuclear quartet termset of
$M$ into the four corners of the nuclear quartet subalgebra. Specifically, $\llbracket
\mathrm{Saturate}(M) \rrbracket_t \in \mathrm{Fix}(\sigma_t)$, and so on for each
term. The termset is the internal-language image of the subalgebra quartet for the
element $\llbracket M \rrbracket_t$.

#### Instance in FiberNuclearLanguage {#nuclear-quartet-termset-fiber-instance}

In [FiberNuclearLanguage](fiber-nuclear-language.md), the nuclear quartet termset of any
proposition $M$ consists of precisely the four normal-form grades that the reduction
system R1–R19' can produce for nucleus-application terms over $M$. No further nuclear
nesting is possible: $\mathrm{Saturate}(\mathrm{Saturate}(M)) = \mathrm{Saturate}(M)$
by idempotency (R1), and the commutativity rule R7 collapses all mixed double nestings
to the canonical $\mathrm{Saturate}(\mathrm{Transfer}(M))$ form.
