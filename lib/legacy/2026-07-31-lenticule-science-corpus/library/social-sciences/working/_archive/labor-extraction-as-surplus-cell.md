---
type: theorem
status: conjecture
depends-on: [operations-settling, task-cell-system, capability-fiber-bundle, shared-closure-rule-vocabulary]
proves: []
---

# Labor extraction as surplus cell

When an agent $A$ executes a task $T$ on the operations settling $\mathcal{E}_{\mathrm{op}}$, the work produces cells that settle to $\mathbf{t}$. The agent's entitlement to those cells — which cells $A$ may claim, reference, or transfer — is constrained by the [authority-gate](theories/predicated-governance/concepts/authority-gate.md) and the normative system $\mathcal{S}_{\mathrm{charter}}$. The gap between what $A$'s work produces and what $A$ is permitted to claim is the **surplus cell set** — the substrate formalization of surplus value.

## Setup

Let $T$ be a task with task-cell-system $\Gamma_T = (E_T, \mathcal{S}_T, v_T^{\mathrm{target}})$. Let $A$ be the agent assigned to execute $T$.

**Value produced by execution**: Let $V_T \subseteq \mathcal{E}_{\mathrm{op}}$ be the set of cells that advance in the knowledge order as a direct result of $A$'s execution — cells whose values change from $\bot$ toward $\mathbf{t}$ because of $A$'s [witness-as-increment](../morphisms/witness-as-increment.md) contributions.

**Value claimable by $A$**: Let $V_A \subseteq V_T$ be the subset of cells that $A$ is permitted to claim — cells whose claim is authorized by the authority-gate at the time of claim. Authorization requires $\mathrm{gate}(A, \mathrm{claim}, c) = \mathbf{t}$ for each $c \in V_A$.

**Surplus cell set**: $\Sigma_T^A = V_T \setminus V_A$.

## Claim

$\Sigma_T^A$ is non-empty if and only if $\mathcal{S}_{\mathrm{charter}}$ contains at least one authority-gate rule that prevents $A$ from claiming cells $A$ produced.

## Proof sketch

If $\Sigma_T^A = \emptyset$, every cell $A$ produces is claimable by $A$. This requires: for every $c \in V_T$, the authority-gate rule $\mathrm{gate}(A, \mathrm{claim}, c) = \mathbf{t}$ fires. This fires only when $\mathcal{S}_{\mathrm{charter}}$ contains no blocking rule for $c$. If $\mathcal{S}_{\mathrm{charter}}$ contains at least one rule of the form "if $\langle c, \texttt{produced-by}, A\rangle = \mathbf{t}$ then $\langle A, \texttt{claim-right}, c\rangle = \mathbf{f}$," then the authority-gate blocks $A$'s claim on $c$ even as $c$ enters $V_T$ — exactly the surplus condition. The converse is immediate. $\square$

## Interpretation

The cells in $\Sigma_T^A$ are produced by $A$'s labor but appropriated by the charter-holder. They enter $\mathcal{S}_{\mathrm{shared}}$ as rules or settle into cells accessible only to principals — the substrate equivalent of surplus value flowing from labor to capital.

The [shared-closure-rule-vocabulary](teaching/explanations/shared-closure-rule-vocabulary.md) shows that $\mathcal{S}_{\mathrm{shared}}$ accumulates from past work. Surplus cells that become rules in $\mathcal{S}_{\mathrm{shared}}$ are the substrate's general intellect — knowledge produced by labor that becomes a collective resource the laborer cannot individually claim.

## Connection to the iron cage

The [closure-rules-and-the-iron-cage](teaching/explanations/closure-rules-and-the-iron-cage.md) narrative shows that the closure-rule system exercises Weber's iron cage over workers: the rules governing what can be claimed are themselves products of past work (via $\mathcal{S}_{\mathrm{shared}}$), sedimented into the substrate and not revocable by individual workers. The surplus cell structure is the precise form this cage takes: $\mathcal{S}_{\mathrm{charter}}$ determines $V_A$ by determining which authority-gate rules fire, and those rules reflect the institutional history of labor-capital relations encoded in the settling.

## Open directions

Whether the surplus cell structure admits a formal analog of the rate of surplus value ($|\Sigma_T^A| / |V_A|$), and whether this ratio is a substrate-computable quantity, remains open. Connection to [quantale-enriched-dispatch](questions/quantale-enriched-dispatch-for-work.md): if capabilities carry quantale-valued costs, the surplus cell set may carry a cost dimension, making the extraction rate a quantale-valued quantity.
