---
kind: example
status: verified
depends-on: [strong-mld-via-composed-duality, d-frame-verdier-composition, social-network-verdier-dual, multi-agent-epistemic-settling, relational-database-settling]
instantiates: [strong-mld-via-composed-duality]
lineage: 2
---

# Strong-MLD orbits on the social network: exchange-paired truth-only/falsity-only

A worked instance of the [strong-MLD classification](../theorems/strong-mld-via-composed-duality.md)'s exchange-orbit case on the **Lineage 2** social-network base. Concrete pair: a settling where "Alice likes Bob" with truth-only firing, and a paired settling where "Alice does not like Bob" with falsity-only firing. These two are MLD-equivalent (same firing-ordinal set: $\{1\}$) but NOT strong-MLD-equivalent (firing-types differ).

## Setup

L2 base, $E = \{a, b\}$ (Alice, Bob), single predicate $P$ (Likes), $\lambda = 2$. Two paired settlings:

- **Settling $v$:** increment $u_1 = (\text{told } P(a, b) = \mathbf{t})$ — Alice likes Bob (truth-only firing).
- **Settling $v'$:** increment $u_1' = (\text{told } P(a, b) = \mathbf{f})$ — Alice does not like Bob (falsity-only firing).

Both have closure ordinal $\kappa = 1$, single firing ordinal $L_{\mathrm{ns}}(1) = \{1\}$.

## MLD-equivalence

The classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}$ on the truth-side sheaf $\mathcal{F}^{(t)}$:

- $v$: $\mathrm{cl}\text{-}\mathrm{inv}(v) = e_1 \in H^1$ — one truth-positive cell at $(a, b)$ at firing 1.
- $v'$: $\mathrm{cl}\text{-}\mathrm{inv}(v') = 0 \in H^1$ — no truth-positive cells.

So *bigraded*-MLD distinguishes them. But considering the joint truth-side / falsity-side classifying invariant, both have:

- One firing at ordinal 1.
- One newly-positive cell ($(a, b)$ on truth-side for $v$; $(a, b)$ on falsity-side for $v'$).

The settling-shift bijection that maps $v$'s firing-ordinal set $\{1\}$ to $v'$'s firing-ordinal set $\{1\}$ is the identity. Both have "one firing at ordinal 1 contributing one new cell." **In the MLD-equivalence sense, they are equivalent** — same firing-ordinal data ignoring evidence side.

## Strong-MLD: distinguishes them

The strong-MLD invariant adds the **firing-orbit-type function** $\tau^{\mathbb{D}}$:

- $\tau^{\mathbb{D}}(v)(1) = $ truth-only.
- $\tau^{\mathbb{D}}(v')(1) = $ falsity-only.

These differ. So $\mathrm{cl}\text{-}\mathrm{inv}^{\mathbb{D}}(v) \neq \mathrm{cl}\text{-}\mathrm{inv}^{\mathbb{D}}(v')$, and $v \not\sim_{\mathrm{sMLD}} v'$.

The two settlings form an **exchange orbit** under composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$: $\mathbb{D}(v) = v'$ (after the canonical Verdier-duality identification).

## What this exhibits

The strong-MLD classification's *strict refinement* of MLD: two settlings can be MLD-equivalent but strong-MLD-distinct, and the L2 social-network setting makes the distinction socially interpretable. "Alice likes Bob" and "Alice does not like Bob" are clearly different facts; bigraded cohomology alone treats one as zero and the other as a generator, but composed-duality orbit-type recognizes them as paired-but-distinct.

## Position in Lineage 2

The L2 instance for the strong-MLD classification's exchange-orbit case. Pairs structurally with the L1 self-dual orbit instance ([strict-regime-top-firing-verdier-self-dual](strict-regime-top-firing-verdier-self-dual.md)). Together: L2 has both *types* of strong-MLD orbits (exchange and self-dual) exhibited concretely.

For the L2 self-dual case: a settling with $\top$-firing on the social-network base. Concretely: increment $u_1 = (\text{told } P(a, b) = \top)$ — "the Alice-likes-Bob claim is paraconsistent." Such a settling is $\mathbb{D}$-fixed (per the strong-MLD characterization). Reading: the social network has an inherent contradiction that no negation can resolve.
