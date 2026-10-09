---
type: theorem
status: proved
depends-on: [four-bilattice, twist-product-right-residual, four-bilattice-residuation-properties]
see-also: [bilattice-stabilization-nucleus, predication-fiber-algebra]
---

# Residuated restriction by a fixed authority element

Fix $a \in \mathbf{FOUR}$ — interpreted as an *authority value* — and consider the unary [right residuation operator](../morphisms/right-residuation-operator.md) $\mathrm{R}_a(x) := a \Rightarrow x$ on $\mathbf{FOUR}$. The operator's complete behavior, by direct calculation from the [twist-product right residual](../morphisms/twist-product-right-residual.md) formula on the encoding $\bot = \langle 0, 0 \rangle$, $\mathbf{f} = \langle 0, 1 \rangle$, $\mathbf{t} = \langle 1, 0 \rangle$, $\top = \langle 1, 1 \rangle$, is given by the table

| $\mathrm{R}_a(x)$, with $a \backslash x$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\mathbf{t}$ | $\mathbf{t}$ | $\bot$ | $\bot$ |
| $\mathbf{t}$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\mathbf{f}$ |
| $\mathbf{f}$ | $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ |
| $\top$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |

The four rows correspond to four authority profiles. Their authorization-theoretic readings:

1. **$a = \bot$ (silent authority).** Outputs $\{\mathbf{t}, \mathbf{t}, \bot, \bot\}$. Silent authority produces $\mathbf{t}$ on payloads with no negative component (i.e. $x \in \{\bot, \mathbf{t}\}$, where the second coordinate is $0$) and $\bot$ on payloads carrying negative evidence ($x \in \{\mathbf{f}, \top\}$, where the second coordinate is $1$). Silent authority *does not pass payloads through unchanged*: it strips structure. The pattern is "vacuously affirm what carries no negation; collapse to silence what carries negation."
2. **$a = \mathbf{t}$ (affirming authority).** Outputs $\{\bot, \mathbf{t}, \mathbf{f}, \mathbf{f}\}$. Affirming authority is the identity on $\{\bot, \mathbf{t}, \mathbf{f}\}$ and demotes paraconsistent $\top$ to its negative-only reading $\mathbf{f}$. Affirming authority is *not transparent on every payload*: it filters out the positive-evidence component of paraconsistent payloads, keeping only the negative-evidence component.
3. **$a = \mathbf{f}$ (denying authority).** Outputs $\{\mathbf{t}, \mathbf{t}, \mathbf{t}, \mathbf{t}\}$ — uniformly $\mathbf{t}$. Denying authority over any payload produces affirmation. This is the residuated-lattice fact that $0 \to z = 1$ for every $z$, lifted to the twist product. The denying-authority row is *uniformly permissive*: an authority element that internally denies, applied as a residual, produces uniform affirmation. This is paraconsistent linear logic's ex-falso-quodlibet at the twist-product level.
4. **$a = \top$ (paraconsistent authority).** Outputs $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$ — the **identity** on $\mathbf{FOUR}$. The paraconsistent-authority row is structurally distinguished: $\top$ is the *right-side unit* for the twist-product right residual, by the calculation $\langle 1, 1 \rangle \Rightarrow \langle z, v \rangle = \langle (1 \to z) \wedge (v \to 1),\ 1 \cdot v \rangle = \langle z \wedge 1,\ v \rangle = \langle z, v \rangle$. Paraconsistent authority passes every payload through unchanged.

## Proof

Direct enumeration on the $|\mathbf{FOUR}|^2 = 16$ pairs $(a, x)$. Each entry is computed from the formula

$$\langle x_1, x_2 \rangle \Rightarrow \langle z_1, z_2 \rangle = \langle (x_1 \to z_1) \wedge (z_2 \to x_2),\ x_1 z_2 \rangle$$

with $\to, \cdot$ taken in the Boolean residuated lattice $\mathbf{2}$ (so $\to$ is material implication and $\cdot$ is conjunction). The diagonal entries $a \Rightarrow a$ are recorded by [four-bilattice residuation properties](../../../../../../../pre-bilattice/content/bilattice/content/four-bilattice/references/four-bilattice-residuation-properties.md) (4); the remaining 12 entries follow the same calculation.

For example, $\bot \Rightarrow \top = \langle 0, 0 \rangle \Rightarrow \langle 1, 1 \rangle = \langle (0 \to 1) \wedge (1 \to 0),\ 0 \cdot 1 \rangle = \langle 1 \wedge 0,\ 0 \rangle = \langle 0, 0 \rangle = \bot$, matching row 1 column 4. The remaining 11 off-diagonal entries are verified identically. $\square$

## Remark — silent authority is not uniformly permissive

A widespread engineering intuition holds that a silent authority element should produce a *uniformly $\mathbf{t}$-valued* residuation (vacuously permitting every payload). The table refutes this: silent authority $\bot$ produces $\mathbf{t}$ on payloads with $x_2 = 0$ but $\bot$ on payloads with $x_2 = 1$. Half the rows are *not* permissive in the $\mathbf{t}$-producing sense.

There is a sense in which silent authority is permissive — it never produces $\mathbf{f}$ — but the operative output is $\bot$, not $\mathbf{t}$, on negative-content payloads. Engineering specifications that need "silent authority lets everything through" must use a different operator (e.g. an explicit projection that promotes $\bot$-results to $\mathbf{t}$); the residuation alone does not give that semantics.

## Remark — denying authority's ex-falso row

Row 3 produces $\mathbf{t}$ on every payload — including $\mathbf{f}$ payloads. The reading "denying authority lets affirmations through" is paraconsistent linear logic's ex-falso semantics: an authority that denies internally satisfies implications against any payload because the antecedent is false. In substrate terms, this row is what makes a *deny-by-default* authority element undesirable as a gate: every payload becomes affirmed. Substrate authority disciplines that want a deny-by-default semantics must use a different operator (e.g. the dual residual on the truth-axis, or an explicit knowledge-axis projection).

## Remark — paraconsistent authority is the unit

Row 4 is structurally important beyond the authorization reading: $\top$ is the right-side unit for $\Rightarrow$. This means paraconsistent authority is the *trivial* residuation — it does nothing, returning each payload unchanged. Substrates that use $\top$ as a "high-permission" or "system-administrator" authority value are accidentally specifying *no gating at all*: the residuation by $\top$ is the identity, which is the absence of authority filtering, not its strongest form.

## Position

This theorem is the math grounding for *sender-as-authority residuation gating* — the discipline of gating an incoming payload's contribution to the substrate fiber by a sender-authority element via the operation

$$\text{incoming-constrained}(s, p, o) \;:=\; \text{sender-authority}(s, p, o) \;\Rightarrow\; \text{payload}(s, p, o).$$

Engineering uses of this discipline must read the table above explicitly, since each authority row has a determinate behavior on each payload value. Three substrate-design corollaries follow directly:

- A "silent" authority element ($\bot$) does not let negative-content payloads through; it collapses them to silence. Specifications that require negative content to propagate through a silent authority gate must use a different operator.
- A "denying" authority element ($\mathbf{f}$) produces uniform $\mathbf{t}$, the opposite of what the name suggests. Specifications that read $\mathbf{f}$ as "this authority denies access" cannot use the residual as the gate.
- A "paraconsistent" authority element ($\top$) is the identity for the residuation. Specifications that read $\top$ as "highest authority" or "admin override" are inadvertently specifying *no gating*.

The four authority profiles are structurally distinct, and three of the four exhibit behaviors that diverge from the prose intuitions commonly attached to their names. The table is the conformance contract.

The theorem is restricted to $\mathbf{FOUR}$. For richer twist-product algebras $\mathbf{L}^\bowtie$, the analogous tables are larger and the rows do not factor as cleanly into single intuitive readings; the four-row structure here is a feature of the Boolean base $\mathbf{2}$, not a generic residuated-lattice property.
