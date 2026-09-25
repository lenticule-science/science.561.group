---
type: definition
class: void-cone-substructure
symbol: "\\mathcal{H}_F"
depends-on: [lorentzian-causal-settling, void-cone-cohomology, predication-settling, entity-set]
see-also: [horizon-area-bound, lorentzian-apex-void-as-timelike-spacelike, continuum-lorentzian-limit, replica-mayer-vietoris]
---

# Settling horizon

A **settling horizon** is the void-cone boundary relative to a bipartition of the entity set — the set of permanently-void cells that straddle the boundary between two regions. In the [Lorentzian causal settling](../../lorentzian-causal-settling/lorentzian-causal-settling.md), settling horizons model causal horizons: regions where events on one side can have no causal influence on events on the other side.

## Definition

Let $v_\kappa$ be a predication settling on entity set $E$ with closure ordinal $\kappa$ and void cone $V_\infty = \{(e_1, e_2) : v_\kappa(e_1, e_2) = \bot\}$.

Fix a **bipartition** $E = F \sqcup (E \setminus F)$ of the entity set into two disjoint non-empty parts. The **settling horizon** relative to $F$ is:
$$\mathcal{H}_F \;:=\; \bigl\{(e_1, e_2) \in V_\infty \;:\; e_1 \in F,\; e_2 \notin F\bigr\} \;\cup\; \bigl\{(e_1, e_2) \in V_\infty \;:\; e_1 \notin F,\; e_2 \in F\bigr\}.$$

In words: $\mathcal{H}_F$ is the set of permanently-void pairs that cross the bipartition boundary. These are entity pairs that are permanently unable to exert causal influence on each other *and* that straddle the $F / (E \setminus F)$ divide.

The horizon is a subset of $V_\infty$ — it consists only of void cells, never apex cells. An apex cell $(e_1, e_2)$ (with $v_\kappa(e_1, e_2) = \mathbf{t}$) crossing the bipartition is not part of the horizon; it represents a causal connection across the boundary, not a horizonal separation.

## Horizon decomposition

The void cone $V_\infty$ splits under the bipartition into three disjoint parts:

$$V_\infty \;=\; V_\infty^{F \times F} \;\sqcup\; \mathcal{H}_F \;\sqcup\; V_\infty^{(E \setminus F) \times (E \setminus F)}$$

where:
- $V_\infty^{F \times F} = \{(e_1, e_2) \in V_\infty : e_1, e_2 \in F\}$ — void pairs within $F$ (internally spacelike).
- $\mathcal{H}_F = \{(e_1, e_2) \in V_\infty : e_1 \in F \oplus e_2 \in F\}$ — void pairs crossing the boundary (the horizon).
- $V_\infty^{(E\setminus F)^2} = \{(e_1, e_2) \in V_\infty : e_1, e_2 \notin F\}$ — void pairs within $E \setminus F$.

The horizon $\mathcal{H}_F$ is the "cross-boundary" component of the void.

## Settling entropy

The **settling entropy** of the horizon $\mathcal{H}_F$ is:
$$S(v, F) \;:=\; |\mathcal{H}_F|$$
— the cardinality of the horizon (number of permanently-void pairs crossing the boundary). For infinite entity sets, this is defined as the $\mathbb{Z}$-rank of $\mathbb{Z}^{\mathcal{H}_F}$, the free abelian group on horizon cells.

In the [Lorentzian causal settling](../../lorentzian-causal-settling/lorentzian-causal-settling.md), $S(v, F)$ counts the number of spacelike-separated event pairs straddling the boundary — a discrete analog of the Bekenstein–Hawking horizon area (which counts Planck-scale degrees of freedom at the horizon). See the [horizon area bound theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/horizon-area-bound.md) for the formal bound.

## Cauchy surfaces

A **Cauchy surface** relative to $F$ is a bipartition $E = F \sqcup (E \setminus F)$ such that every maximal chain $e_1 \prec e_2 \prec \cdots$ in the causal order of $E_\infty$ intersects $F$ in exactly one event. In a causal-set context, a Cauchy surface is a "time slice" — a set of events representing "one moment" in the discrete spacetime.

For a Cauchy-surface bipartition, every pair $(e_1, e_2)$ with $e_1 \in F$ and $e_2 \notin F$ either has $e_1 \preceq e_2$ (a timelike/null pair crossing forward: in the apex, not the horizon) or is spacelike-separated (in the horizon). The Cauchy surface saturates the horizon: no apex pairs cross the boundary in one direction without a corresponding causal connection.

The [horizon area bound theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/horizon-area-bound.md) shows that the horizon entropy is maximized when $F$ is a Cauchy surface.

## Mayer–Vietoris structure

The bipartition $E = F \sqcup (E \setminus F)$ gives a cover of the settling site by two sub-sites:
- $\mathbf{T}^*_F$ — the site of settling content within $F$,
- $\mathbf{T}^*_{E \setminus F}$ — the site of settling content within $E \setminus F$,
- $\mathbf{T}^*_{\mathcal{H}_F}$ — the site of cross-boundary content (the horizon sub-site).

The [replica Mayer–Vietoris sequence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/replica-mayer-vietoris.md) applied to this cover gives:
$$\cdots \to H^{n-1}(\mathbf{T}^*_{\mathcal{H}_F}, \mathcal{F}) \xrightarrow{\delta} H^n(\mathbf{T}^*, \mathcal{F}) \to H^n(\mathbf{T}^*_F, \mathcal{F}) \oplus H^n(\mathbf{T}^*_{E \setminus F}, \mathcal{F}) \to \cdots$$

The connecting homomorphism $\delta^0 : H^0(\mathbf{T}^*_{\mathcal{H}_F}, \mathcal{F}) \to H^1(\mathbf{T}^*, \mathcal{F})$ maps horizon-crossing data to global cohomology classes. A non-zero $\delta^0$ indicates that the horizon's cross-boundary sections cannot be consistently extended to global sections — a "horizon obstruction" in the cohomological sense.

## Horizon in the Lorentzian context

For the Lorentzian causal settling on $(E, \prec_0)$ with bipartition into "past" $F$ and "future" $E \setminus F$:

- **Past horizon**: $\mathcal{H}^+_F = \{(e_1, e_2) \in V_\infty : e_1 \in F, e_2 \notin F\}$ — spacelike pairs where the $F$-event cannot influence the non-$F$-event.
- **Future horizon**: $\mathcal{H}^-_F = \{(e_1, e_2) \in V_\infty : e_1 \notin F, e_2 \in F\}$ — spacelike pairs where the non-$F$-event cannot influence the $F$-event.

For a black-hole–type bipartition (where $F$ is the "inside" of a black hole and $E \setminus F$ is the exterior):
- $\mathcal{H}^+_F$ is the **event horizon** proper: inside events that cannot send causal signals outside.
- The entropy $S(v, F) = |\mathcal{H}_F|$ counts the number of frustrated would-be causal connections — a discrete "area" of the horizon.

For a cosmological bipartition (where $F$ is "the observable universe" and $E \setminus F$ is beyond the cosmological horizon):
- $\mathcal{H}_F$ counts the spacelike pairs straddling the cosmological horizon.
- $S(v, F)$ is a discrete "cosmological entropy" counting observationally-inaccessible causal connections.

## Example: the diamond causal set

On $E = \{a, b, c, d\}$ with $\prec_0 = \{a \prec b, a \prec c, b \prec d, c \prec d\}$ (a diamond), take the bipartition $F = \{a, b\}$ and $E \setminus F = \{c, d\}$.

Causal order (transitive closure): $a \preceq b, a \preceq c, a \preceq d, b \preceq d, c \preceq d$.

Void pairs: $(b, c)$ and $(c, b)$ — the only spacelike pair.

Horizon $\mathcal{H}_F = \{(b, c), (c, b)\}$ — both spacelike pairs cross the $\{a,b\}/\{c,d\}$ boundary.

Settling entropy: $S(v, F) = 2$.

This is the smallest non-trivial horizon: a 2-event boundary in a 4-event diamond causal set, capturing the single spacelike relation.

## Position in predication categories

The settling horizon is predication categories' first object modeling horizon structure — the boundary between causally-connected and causally-disconnected regions. It lifts the void-cone structure (which is a global object: the entire void of a settling) to a local object indexed by a bipartition.

Together with the [horizon area bound theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/horizon-area-bound.md) and the [causal-set substitution settling](causal-set-substitution-settling.md), it forms the corpus's nascent causal-structure / horizon cluster.

**Open downstream:**
- *Information recovery across the horizon.* Can settling content inside $F$ be reconstructed from settling content outside $F$, via formal deformations at the horizon? This is the corpus's analog of the black-hole information paradox. The openness-defect deformation theory (see [deformation-theory-opener](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/deformation-theory-opener.md)) is the natural framework.
- *Horizon entropy for substitution settlings.* For a causal-set substitution settling, the horizon entropy $S(v^\mathrm{CS}_\mathcal{S}, F)$ should be expressible in terms of the Perron eigenvalue $\lambda_\mathrm{PF}$ and the bipartition's position in the substitution hierarchy.
- *Thermal structure.* In quantum gravity, the Hawking temperature is $T \propto 1/|\mathcal{H}|$. A corpus-internal "temperature" for a settling horizon — possibly as a parameter in a stochastic extension of the settling dynamics — is open.
