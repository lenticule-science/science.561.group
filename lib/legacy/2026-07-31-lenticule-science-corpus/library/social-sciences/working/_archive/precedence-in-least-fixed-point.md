---
type: question
status: partial
explores: [charter-as-closure-system, operations-settling]
---

# How does charter-tier precedence behave in the least-fixed-point construction?

The [charter-as-closure-system theorem](../theorems/charter-as-closure-system.md) treats the charter as a partition of $\mathcal{S}_{\mathrm{op}}$ into rules, guidelines, preferences, and instructions, with strict precedence: rules > guidelines > preferences > instructions. The theorem states that the precedence is "enforced by the closure-rule system's least-fixed-point construction."

Open: when a guideline's consequent contradicts a rule's consequent on some cell — guideline-rule says "settle to $\mathbf{t}$"; rule-rule says "settle to $\mathbf{f}$" — what does the LFP $\mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}$ produce?

## The naive LFP problem

The math's [closure-rule-system definition](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) constructs the LFP as the *least* operator satisfying all rules' consequents jointly. Joint satisfaction of contradicting consequents drives the cell to $\top$ (both $\mathbf{t}$ and $\mathbf{f}$ asserted). The LFP does not natively respect precedence — it treats rule and guideline symmetrically and produces a contradiction state wherever they disagree.

If charter compliance is "the settling is a fixed point of $\mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}$," then the naive LFP encoding produces compliance even when guideline rules dominate rule rules — which is not the charter's intent.

## Resolution: tiered closure operator via tier-settlement markers

The resolution replaces the single LFP with a *tiered composition of LFPs*, each restricted to cells not yet settled by a higher-priority tier. The mechanism:

### Tier-settlement markers

For each predication cell $c \in \Phi_{\mathrm{op}}$ and each tier $X \in \{\texttt{rules}, \texttt{guidelines}, \texttt{preferences}, \texttt{instructions}\}$, introduce a *tier-settlement-marker cell* $\langle c, \texttt{settled-by-tier}, X\rangle \in \Phi_{\mathrm{op}}$. This cell is asserted to $\mathbf{t}$ when tier $X$'s closure-rule application changes $c$'s value during the LFP for tier $X$.

A closure rule $r \in \mathcal{S}_{X}$ at tier $X$ has the following guard added to every consequent cell $c_i$ in $r$'s consequent:

$$\text{Guard: } v\bigl(\langle c_i, \texttt{settled-by-tier}, X'\rangle\bigr) = \bot \text{ for all } X' >_{\mathrm{tier}} X$$

— the consequent cell $c_i$ has not already been settled by a higher-priority tier. If this guard fails (a higher-priority tier has already asserted $c_i$), the rule's consequent *on $c_i$* does not fire, even if the rest of the antecedent is satisfied. The guard is an additional Π₁ antecedent conjunct; no new closure-rule fragment is required.

### The tiered closure operator

Define the tiered charter closure operator as the sequential composition:

$$\mathrm{cl}^{\mathrm{charter}} \;=\; \mathrm{cl}^{\mathcal{S}_{\mathrm{inst}}^{\downarrow}} \;\circ\; \mathrm{cl}^{\mathcal{S}_{\mathrm{pref}}^{\downarrow}} \;\circ\; \mathrm{cl}^{\mathcal{S}_{\mathrm{guide}}^{\downarrow}} \;\circ\; \mathrm{cl}^{\mathcal{S}_{\mathrm{rules}}^{\downarrow}}$$

where $\mathcal{S}_{X}^{\downarrow}$ denotes tier $X$'s rule-set with the guard conjuncts added. The composition is applied left-to-right on an initial valuation $v_0$:

1. Apply $\mathrm{cl}^{\mathcal{S}_{\mathrm{rules}}^{\downarrow}}$ to reach a rules-tier fixed point $v_1$. Every cell $c$ that changed during this LFP receives $\langle c, \texttt{settled-by-tier}, \texttt{rules}\rangle = \mathbf{t}$.
2. Apply $\mathrm{cl}^{\mathcal{S}_{\mathrm{guide}}^{\downarrow}}$ starting from $v_1$. Guidelines fire only on cells whose rules-settlement marker is at $\bot$. Cells already pinned by rules are untouched.
3. Apply $\mathrm{cl}^{\mathcal{S}_{\mathrm{pref}}^{\downarrow}}$ starting from the guidelines fixed point. Preferences fire only on cells not pinned by rules or guidelines.
4. Apply $\mathrm{cl}^{\mathcal{S}_{\mathrm{inst}}^{\downarrow}}$ starting from the preferences fixed point. Instructions fire only on cells not pinned by any prior tier.

The result $v_4 = \mathrm{cl}^{\mathrm{charter}}(v_0)$ is the tiered fixed point. A cell's final value is determined by the highest-priority tier whose rules fire on it.

### What happens to the contradicting case

If a rule-rule $r_R \in \mathcal{S}_{\mathrm{rules}}$ asserts $c = \mathbf{f}$ and a guideline-rule $r_G \in \mathcal{S}_{\mathrm{guide}}$ asserts $c = \mathbf{t}$:

1. The rules LFP fires $r_R$: $c$ moves to $\mathbf{f}$; $\langle c, \texttt{settled-by-tier}, \texttt{rules}\rangle = \mathbf{t}$.
2. The guidelines LFP attempts to fire $r_G$: its guard checks $\langle c, \texttt{settled-by-tier}, \texttt{rules}\rangle = \bot$ — this check **fails** (the marker is at $\mathbf{t}$). So $r_G$ does not fire on $c$.
3. $c$ retains value $\mathbf{f}$ in $v_4$. No contradiction state is produced. The rule prevails.

The tiered operator correctly enforces precedence without producing $\top$ on the contested cell.

### Regime of the tiered operator

Each $\mathrm{cl}^{\mathcal{S}_{X}^{\downarrow}}$ is itself a closure operator. The tier-settlement guards are Π₁ conjuncts. If all tiers' rule-sets are in the strict-class, each tier's LFP terminates in finitely many steps; the sequential composition terminates in at most $4 \cdot \max_X \kappa_X$ steps — still strictly finite. The tiered operator preserves the strict regime for strict-class charters.

For charters admitting Scott-continuous rules in the guidelines tier, the guidelines LFP may require $\omega$ steps, but the rules tier still terminates finitely. The tiered composition's total closure ordinal is at most $\kappa_{\mathrm{rules}} + \kappa_{\mathrm{guide}} + \kappa_{\mathrm{pref}} + \kappa_{\mathrm{inst}}$, bounded by the maximum regime of any individual tier.

## Where the contradiction marker $\top$ still accumulates

The tiered operator eliminates cross-tier contradictions by construction. But *same-tier* contradictions — two rules-tier rules asserting contradicting values on the same cell — still produce $\top$. This is the appropriate behavior: same-tier contradictions are *genuine rule conflicts* requiring charter repair, not precedence issues. The substrate correctly surfaces these as $\top$ (repair conditions) that the governance process must address.

Different-tier conflicts are *precedence issues*, not conflicts: the higher tier wins. The tiered operator encodes this structurally so that precedence conflicts never reach the substrate as $\top$.

## Charter compliance under the tiered operator

A settling complies with the charter under the tiered operator iff it is a fixed point of $\mathrm{cl}^{\mathrm{charter}}$: running the tiered composition changes nothing. This is a stronger condition than being a fixed point of any single tier's LFP — it requires compliance with rules first, then guidelines (on cells not pinned by rules), then preferences, then instructions.

Charter *rule-compliance* alone is the fixed-point condition for $\mathrm{cl}^{\mathcal{S}_{\mathrm{rules}}^{\downarrow}}$. This is what the [charter-as-closure-system theorem](../theorems/charter-as-closure-system.md) identifies as the substrate-detectable compliance condition. Full charter compliance (all four tiers) adds the guideline, preference, and instruction conditions on their respective unpinned cells.

## Same-tier contradiction and the truth-knowledge LES

**Same-tier contradiction resolution.** If two rules-tier rules conflict on the same cell $c$ — one asserts $c = \mathbf{t}$, the other $c = \mathbf{f}$ — then $c$ reaches $\top$ in $v_1$ (the rules-tier fixed point). The tiered operator does not prevent this; same-tier contradictions are the correct repair signal.

The [truth-knowledge long exact sequence](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) gives this contradiction a precise cohomological signature. Let $\mathcal{F}^{(\top)}_{\mathrm{rules}}$ be the inconsistency sheaf for the rules-tier fixed point $v_1$ — non-zero precisely on the cells that reached $\top$. The LES:

$$\cdots \to H^{n-1}(\mathcal{F}^{(\top)}_{\mathrm{rules}}) \xrightarrow{\partial} H^n_t(\mathcal{F}^{(t)}_{\mathrm{rules}}) \to H^n_k(\mathcal{F}^{(k)}_{\mathrm{rules}}) \to H^n(\mathcal{F}^{(\top)}_{\mathrm{rules}}) \to \cdots$$

When a same-tier contradiction exists on cell $c$:
- $H^0(\mathcal{F}^{(\top)}_{\mathrm{rules}})$ is free abelian on $\{c\}$ — a rank-1 group recording the unresolved conflict.
- $\partial: H^0(\mathcal{F}^{(\top)}_{\mathrm{rules}}) \to H^1_t(\mathcal{F}^{(t)}_{\mathrm{rules}})$ is non-zero — the contradiction creates a degree-1 obstruction class in truth-order cohomology.
- The class $[\partial c] \in H^1_t$ is the *charter repair class*: a non-trivial class means the charter's rules-tier has an irresolvable conflict that elevates to degree-1 cohomological obstruction. The charter is in need of structural amendment, not just incremental repair.

When same-tier contradictions are repaired by an explicit resolution increment (a governance act that settles $c$ unambiguously in one direction): the cell moves to $\mathbf{t}$ or $\mathbf{f}$, $\mathcal{F}^{(\top)}_{\mathrm{rules}}$ becomes zero on $c$, and $[\partial c]$ becomes trivial. The LES collapses back to $H^n_t \cong H^n_k$. Charter amendment corresponds exactly to making the rules-tier inconsistency sheaf zero — restoring cohomological triviality.

The *policy for resolving rule-tier conflicts* (which rule prevails) is a governance question not derivable from the substrate, but the *structural signature of the conflict* (the cohomological class $[\partial c]$) is substrate-readable and provides a substrate-objective characterization of "the charter has a contradiction requiring repair."

**Tier-settlement marker growth.** The marker cells $\langle c, \texttt{settled-by-tier}, X\rangle$ are additional cells in $\Phi_{\mathrm{op}}$. For a predicate set of size $|\Phi_{\mathrm{op}}|$, the markers add at most $4|\Phi_{\mathrm{op}}|$ cells. This is bounded and does not change the regime. The markers must be initialized to $\bot$ and correctly maintained across the tiered LFP applications — an implementation commitment, not a theoretical obstacle.
