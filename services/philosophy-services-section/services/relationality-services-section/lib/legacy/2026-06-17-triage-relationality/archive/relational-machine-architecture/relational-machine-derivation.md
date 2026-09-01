---
specialization: automaton
constituted-by:
  - relational-history-site
  - fiber-nuclear-heyting-doctrine
  - joint-closure-projection
  - fixed-proposition-global-sections
requires: doctrine-isomorphism
emits: newly-fixed-proposition
pays: landauer-cost
bound-by: church-turing-thesis
satisfies: good-regulator-theorem
corresponds-to:
  - turing-machine
  - mealy-transducer
  - moore-automaton
  - von-neumann-architecture
  - shannon-channel
  - eilenberg-variety
  - manes-arbib-bialgebra
  - wiener-cybernetics
  - good-regulator
  - landauer-erasure
  - marxian-machinery
date-created: 2026-03-18
date-modified: 2026-04-11
---

# Relational Machine

A **relational machine** is an [automaton](automaton.md) whose state is an instance of the relational universe $R = \mathbf{Sh}(T,J)$. It is the triple

$$M = \bigl(\, (\phi, \alpha),\ \pi_t,\ \Gamma_{\mathrm{new}} \,\bigr)$$

— an input morphism $(\phi, \alpha)$ carrying a doctrine isomorphism, a mechanism $\pi_t$ that settles propositions, and an output $\Gamma_{\mathrm{new}}$ of fixed propositions newly stabilized.

## Definition

The input morphism $(\phi, \alpha) : U_{\text{sender}} \to M$ is an [RU morphism](relational-universe-morphism.md) with two components.

- A continuous history functor $\phi : T_U \to T_M$ translates the sender's history into the machine's.
- A natural **isomorphism** $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ identifies the sender's fiber doctrine with its pullback along $\phi$.

The isomorphism — not a mere natural transformation — is the Good Regulator condition (Conant and Ashby 1970). The machine must carry a faithful internal model of the sender's full propositional structure: same variety, not a quotient.

The mechanism $\pi_t = \sigma_t \circ \Delta_t : H_t \twoheadrightarrow H^*_t$ is the joint projection of the machine's [fiber nuclear Heyting doctrine](fiber-nuclear-heyting-doctrine.md). It retracts the fiber $H_t$ onto the doubly-stable subalgebra $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. The mechanism IS the nuclear doctrine — not an arbitrary transformation from input to output, but the settling process constitutive of the machine.

The output $\Gamma_{\mathrm{new}}(t, t') = \Gamma(H^*_{t'}) \setminus \Gamma(H^*_t)$ is the set of [fixed propositions](fixed-proposition.md) newly settled between two history steps — propositions that crossed from unsettled to doubly stable.

## Mechanism: what the machine can compute

The machine can settle exactly what the joint projection can settle. This is the relational-universe form of the Church-Turing restriction: the mechanism IS the nuclei; the computation is the settlement; nothing outside the reach of $\sigma_t$ and $\Delta_t$ is computable.

$\sigma_t$ is the [saturating nucleus](saturating-nucleus.md) — closure against the past. A proposition is meaning-settled at $t$ when $\sigma_t$ fixes it. $\Delta_t$ is the [transferring nucleus](transferring-nucleus.md) — closure against forward extensions. A proposition is transfer-settled at $t$ when every continuation of the history preserves it. Both nuclei are extensive, idempotent, meet-preserving, and commute: $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$. Their joint closure is itself a nucleus, and $H^*_t$ is its image.

## Output and Landauer cost

Every step that produces nonempty output pays a Landauer cost: the thermodynamic price of settling propositions that do not carry back to the pre-operation history.

Let $\varepsilon_s(t) : H_{s \star t} \to H_t$ be the counit of step $s$, restricting the new fiber to the old. The kernel $\mathcal{K}_s(t) = \ker(\varepsilon_s(t))$ holds the propositions newly fixed in $H_{s \star t}$ that cannot be recovered from $H_t$. Information produced; information erased. By Landauer's principle, each such bit requires at least $k_B T \ln 2$ energy to erase.

The Landauer cost of the step is $\mathcal{L}_s(t) = M(\delta|_{\mathcal{K}_s(t)})$ — the spectral mass of $\mathcal{K}_s(t)$ under the spectral measure $\delta$. Output and cost are co-measured:

- If $\Gamma_{\mathrm{new}} = \emptyset$ then $\mathcal{K}_s(t) = \{0\}$: zero output, zero cost.
- If $|\Gamma_{\mathrm{new}}| > 0$ then $\mathcal{L}_s(t) > 0$: nonempty output entails nonzero erasure.
- Reading — translating input via $\alpha$ without advancing $\pi_t$ — is free. Only settling pays.

Bennett (1973) showed any irreversible computation can in principle be made reversible by preserving the erased history. In the relational universe, if the machine preserves $\mathcal{K}_s(t)$ as a recoverable record, the Landauer cost is deferred, not eliminated. Whether the history site supports lossless recovery of the kernel is an open question about fiber preservation.

## Doctrine isomorphism

The condition $\alpha : H_U \xrightarrow{\sim} \phi^* H_M$ is the strictest requirement in the definition.

If $\alpha$ were only a natural transformation, the machine could process quotients of the sender's fiber — projections losing propositional structure. That is a partial regulator: sufficient variety for some inputs, not all. Inputs in the kernel of $\alpha$ are invisible to the machine.

If $\alpha$ is an isomorphism, the machine contains an isomorphic copy of the sender's full fiber doctrine over the history translation $\phi$. Every proposition in $H_U$ has a unique counterpart in $\phi^* H_M$. Every nuclear relation is reflected exactly. The machine can invert $\alpha$ to recover the sender's propositions from their images.

This is the Good Regulator theorem applied to the machine. Ashby's Law of Requisite Variety is the prerequisite: a regulator must have at least the variety of the system it regulates. The doctrine isomorphism is that law in categorical form.

The isomorphism is a condition on syntax, not semantics. See *syntax and semantics* below.

## Nuclear positions

Propositions in $H_t$ fall into four positions under the two nuclei.

| Position | Status | Processing |
|---|---|---|
| $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ | Doubly stable — at the attractor | No closure; zero cost |
| $\mathrm{Fix}(\sigma_t) \setminus \mathrm{Fix}(\Delta_t)$ | Meaning-settled, not transfer-settled | $\Delta_t$ closes forward |
| $\mathrm{Fix}(\Delta_t) \setminus \mathrm{Fix}(\sigma_t)$ | Transfer-settled, not meaning-settled | $\sigma_t$ closes past |
| $H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ | Free — unsettled in both | Both closures; maximum cost |

The saturating nucleus $\sigma_t$ is determined entirely by the restriction maps to proper sub-histories $t_0 < t$ — by what is already laid down up to $t$. No act at $t$ alters $\sigma_t$. An act can advance the history to $s \star t$, producing a new $\sigma_{s \star t}$ at the new history. The old $\sigma_t$ is untouched.

## Correspondences

Eleven external traditions render the same object under different vocabulary.

| Tradition | Internal rendering |
|---|---|
| **Turing machine** | $(\phi, \alpha)$ carries the configuration; $\pi_t$ applies the transition; $\Gamma_{\mathrm{new}}$ is the settled result. Church-Turing restriction = mechanism IS the fiber doctrine. |
| **Mealy transducer** | Output depends on current history $t$ and incoming content via $\alpha$. $\pi_t$ applied to content already carrying the sender's structure. |
| **Moore automaton** | Output is read after $\pi_t$ reaches fixpoint. Depends only on the post-processing state $H^*_t$, not on input form. |
| **Von Neumann stored program** | Mechanism (the nuclei) and content (fiber elements) cohabit the same sheaf topos. Code is data because both are entities of $R$. |
| **Shannon channel** | Capacity bounded by the spectral mass $\mathcal{M}(H^*_t)$ — maximum propositional content settable per step. |
| **Eilenberg variety** | History monoid $M(\Sigma, I)$ is the input algebra; variety is $H^*_t$, a quotient by nuclear closure. Topology $J$ determines variety. |
| **Manes–Arbib bialgebra** | Input morphism = algebra component; [carrier](carrier.md) stepping maps = coalgebra component; $\pi_t$ = bialgebra structure map. |
| **Wiener cybernetics** | $\pi_t$ IS a negative feedback operator. Error signal: $\pi_t(a) \setminus a$. Attractor: $H^*_t$. Machine terminates when the gap closes. |
| **Good Regulator** | Doctrine isomorphism IS the Good Regulator condition — faithful model of the sender's variety. |
| **Landauer erasure** | Every nonempty output pays $\mathcal{L}_s(t) = M(\delta|_{\mathcal{K}_s(t)})$ in spectral mass of the kernel. |
| **Marxian machinery** | The mechanism is intrinsic to the machine; the input morphism supplies raw content. The machine has its own motive force, independent of the operator. |

## Syntax and semantics

The machine executes $\pi_t$, settling propositions into $H^*_t$. A proposition $a \in H^*_t$ is doubly stable — the machine has settled it. What $a$ means — what external situation it describes, what normative consequence it has — is not carried by $a$ itself. Meaning lives in the correspondence between $H_t$ and the world the topos models.

An isomorphic copy of the sender's doctrine preserves the structure of meaning without providing meaning. The machine is a good syntactic regulator while remaining potentially semantically empty. Whether propositions in $H^*_t$ can acquire meaning from the machine's own internal structure, without an external interpretation, is the relational-universe form of Searle's Chinese Room (1980), and is not yet resolved.

## Open questions

- **Graded doctrine fidelity.** A machine may be a good-enough regulator for a subclass of inputs even with $\alpha$ only a monomorphism. Whether a graded fidelity measure parameterized by $\alpha$'s departure from an isomorphism coincides with Shannon capacity — what fraction of the input's propositional mass can be faithfully settled — is not yet derived.
- **Church-Turing completeness theorem.** The restriction that the mechanism is $\pi_t = \sigma_t \circ \Delta_t$ means the machine settles exactly what the two nuclei can settle. Whether this is complete — whether every proposition reachable by any faithful transformation is reachable by the nuclei — is the relational-universe analog of the Church-Turing thesis. Open for infinite-dimensional fibers.
- **Mealy vs. Moore as distinct categorical structures.** Whether sampling $\Gamma_{\mathrm{new}}$ during $\pi_t$'s application (Mealy) versus after fixpoint (Moore) corresponds to different colimit shapes in the category of $G_s$-coalgebras is not yet derived.
- **Good Regulator vs. Church-Turing as one condition.** Church-Turing bounds the mechanism; Good Regulator bounds the input. Both are completeness-type conditions. Whether they are projections of a single categorical property — "fully powered and fully faithful" — is an open question with formal content.
- **Relational-machine morphisms.** A morphism $f : M_1 \to M_2$ should preserve the transformation interface and commute with the joint projections: $\beta \circ \pi^{M_1}_t = \pi^{M_2}_{\psi(t)} \circ \beta$. Whether this gives a subcategory of **RU** with a terminal object, and whether simulation coincides with behavioral equivalence, is not yet derived.

## References

Turing, "On Computable Numbers," *Proc. London Math. Soc.* ser. 2, 42 (1937), pp. 230–265. Mealy, *Bell System Tech. J.* 34 (1955), pp. 1045–1079. Moore, in *Automata Studies*, Princeton (1956), pp. 129–153. Von Neumann, *First Draft of a Report on the EDVAC* (1945). Shannon, *Bell System Tech. J.* 27 (1948), pp. 379–423. Eilenberg and Wright, *Inf. Control* 11 (1967), pp. 452–470. Eilenberg, *Automata, Languages, and Machines*, Academic Press (1976). Manes and Arbib, *Algebraic Approaches to Program Semantics*, Springer (1986). Wiener, *Cybernetics*, MIT Press (1948). Conant and Ashby, *Int. J. Systems Sci.* 1 (1970), pp. 89–97. Ashby, *An Introduction to Cybernetics*, Chapman and Hall (1956). Landauer, *IBM J. Res. Dev.* 5 (1961), pp. 183–191. Bennett, *IBM J. Res. Dev.* 17 (1973), pp. 525–532. Marx, *Capital* Vol. 1, Ch. 15 (1867). Searle, *Behavioral and Brain Sciences* 3 (1980), pp. 417–457.
