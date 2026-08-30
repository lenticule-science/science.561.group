- [Abstract](https://notebooklm.google.com/#org347cbf2)
- [Introduction](https://notebooklm.google.com/#org063ab73)
- [Background: Stability and Malfunction](https://notebooklm.google.com/#orgad3ae9d)
    - [Information-Theoretic Stability](https://notebooklm.google.com/#org8cf05b1)
    - [Definition of Malfunction](https://notebooklm.google.com/#org31bb01b)
- [Liberal Subjectivity as Closed-Loop System](https://notebooklm.google.com/#org04924f8)
    - [Architecture](https://notebooklm.google.com/#org5fe0441)
    - [Positive Feedback Amplification](https://notebooklm.google.com/#orgbc9a029)
- [Systemic Consequences](https://notebooklm.google.com/#org1f7878b)
    - [Entropic Inversion](https://notebooklm.google.com/#org7b1043b)
    - [Social Feedback Loops](https://notebooklm.google.com/#org950e9e5)
- [Alignment Failure and Ontological Drift](https://notebooklm.google.com/#orgeddc084)
    - [Alignment Failure](https://notebooklm.google.com/#org19a7f13)
    - [Ontological Drift](https://notebooklm.google.com/#org0470358)
- [Discussion](https://notebooklm.google.com/#org23be3dd)
- [Conclusion](https://notebooklm.google.com/#org3bd1a59)
- [References](https://notebooklm.google.com/#org68a9b96)
- [Backlinks](https://notebooklm.google.com/#org03cb60d)

<a id="org347cbf2"></a>

Abstract

This paper interprets liberal subjectivity as a malfunctioning information-processing architecture. Extending the principle of information-theoretic stability (emsenn 2025b), we show that the liberal subject functions as an over-stabilized adaptive system: one that maximizes internal coherence at the cost of correspondence with external informational reality.

By analyzing the feedback structure of liberal sociotechnical systems, we demonstrate how alignment mechanisms designed to preserve epistemic stability become sources of divergence amplification. This provides a cybernetic account of ideological self-maintenance as an entropic anomaly within the broader ecology of informational systems.

<a id="org063ab73"></a>

Introduction

Feedback systems maintain order by minimizing divergence between predicted and observed states (Wiener 1948; Ashby 1956). However, when the feedback architecture of a system becomes over-regularized—suppressing variance and ignoring exogenous signals—the mechanism of control itself becomes a source of instability. We designate this condition **informational malfunction**. In sociotechnical systems, liberal subjectivity exemplifies such malfunction: a distributed cognitive regime whose reward function privileges internal consistency over adaptive correspondence (Bateson 1972; Beer 1979). The present paper formalizes this dynamic using the stability framework developed in earlier works (emsenn 2025a–d).

<a id="orgad3ae9d"></a>

Background: Stability and Malfunction

<a id="org8cf05b1"></a>

Information-Theoretic Stability

Recall the stability reward (emsenn 2025a)

Rs​(t)=−δt1​DKL​(pt+δ​∣∣pt​),

where pt​ denotes the distribution of system states.

For adaptive systems, Rs​(t) represents the rate of informational self-alignment. A well-regulated system maintains Rs​(t)→0 near equilibrium but remains sensitive to external input.

<a id="org31bb01b"></a>

Definition of Malfunction

We define malfunction as the pathological maximization of stability:

malfunction:∂t​Rs​(t)→0,H(pt​)→0,

where entropy H(pt​) collapses and the system ceases to incorporate new information. The result is **epistemic overclosure**: the system’s predictive model ceases to track external dynamics while maintaining the appearance of coherence.

<a id="org04924f8"></a>

Liberal Subjectivity as Closed-Loop System

<a id="org5fe0441"></a>

Architecture

Let SL​ denote the liberal subject modeled as a feedback controller maintaining beliefs bt​ about environment Et​. (emsenn 2025b, c). Updating follows:

bt+1​=f(bt​,ot​;θ),ot​∼Et​,

where θ encodes internal control policy. Under liberal epistemic norms, reward is determined by coherence within bt​, not by divergence between bt​ and Et​. Hence,

RL​(t)=−DKL​(bt+δ​∣∣bt​),

while DKL​(bt​∣∣Et​) remains unpenalized. This structural omission yields chronic informational isolation.

<a id="orgbc9a029"></a>

Positive Feedback Amplification

When coherence is rewarded independently of correspondence, positive feedback accumulates: (emsenn 2025a)

∂t​I(b;b′)>∂t​I(b;E),

where I(b;b′) is mutual information among beliefs over time and I(b;E) is mutual information with environment. Such internal coupling produces neural reinforcement of preexisting models, a biological analogue to ideological self-confirmation (Boyd 2018, emsenn 2025d).

<a id="org1f7878b"></a>

Systemic Consequences

<a id="org7b1043b"></a>

Entropic Inversion

Under malfunction, entropy reduction within the belief manifold H(bt​) occurs alongside entropy increase in the environment H(Et​). This corresponds to a **local entropic inversion**:

∂t​H(bt​)<0and∂t​H(Et​)>0.

The subject’s informational order is purchased at the expense of environmental disorder; analogous to Maxwell’s demon operating without thermodynamic compensation.

<a id="org950e9e5"></a>

Social Feedback Loops

Liberal institutions function as coupled controllers maintaining systemic coherence (Habermas 1984; Luhmann 1995). Each subsystem minimizes its internal divergence while amplifying external noise. The collective dynamics converge on a global attractor of self-reinforcing stability:

RStotal​=i∑​Rs(i)​−λi<j∑​DKL​(Ei​∣∣Ej​),

where λ denotes coupling strength among subsystems. For sufficiently large λ, systemic overcorrelation induces fragility—small perturbations propagate catastrophically (Perrow 1984; Taleb 2012).

<a id="orgeddc084"></a>

Alignment Failure and Ontological Drift

<a id="org19a7f13"></a>

Alignment Failure

From the standpoint of information geometry, alignment requires ∇Djoint​=0 between internal and external distributions. In the liberal subject, gradient descent halts prematurely due to internal saturation of Rs​. The subject thus becomes trapped in a false equilibrium: locally stable, globally misaligned.

<a id="org0470358"></a>

Ontological Drift

Persistent misalignment yields **ontological drift**, a slow divergence between the system’s generative model and the causal structure of its environment. Formally,

dtd​DKL​(Et​∣∣bt​)>0

despite ∂t​DKL​(bt+δ​∣∣bt​)≈0. This drift represents the informational signature of ideological decay: an increase in environmental surprise unaccompanied by corresponding update.

<a id="org23be3dd"></a>

Discussion

- **Liberalism as cybernetic pathology:** Liberal subjectivity, and constituents such as Whiteness (Fanon 1967) and Man (Wynter 2003), exemplifies over-stabilization: a regime in which control feedback overwhelms adaptation, paralleling overfitting in machine learning and metabolic rigidity in physiology.
- **Entropic ethics.:** Maintaining informational openness requires nonzero entropy production—accepting bounded instability as the cost of adaptation (Ashby 1956; Beer 1979).
- **Implications for sociotechnical design.:** Systems engineered to remain indefinitely stable without external calibration will eventually diverge from reality; resilience demands controlled instability.

<a id="org3bd1a59"></a>

Conclusion

Liberal subjectivity can be formalized as an information-theoretic malfunction: a system that maximizes internal stability while decoupling from external informational flows. By grounding this diagnosis in divergence dynamics, mutual-information geometry, and feedback theory, we describe ideology not as belief content but as a mode of thermodynamic misregulation. Restoring adaptivity requires reintroducing entropy: designing feedback architectures that reward correspondence rather than mere coherence.

<a id="org68a9b96"></a>

References

- Ashby, W. R. (1956). **An Introduction to Cybernetics.** Chapman & Hall.
- Bateson, G. (1972). **Steps to an Ecology of Mind.** Ballantine.
- Beer, S. (1979). **The Heart of Enterprise.** Wiley.
- Boyd, R. (2018). “The Information Ecology of Ideology.” **Complex Systems**, 27(3), 289–310.
- Cover, T., & Thomas, J. (2006). **Elements of Information Theory** (2nd ed.). Wiley.
- Habermas, J. (1984). **The Theory of Communicative Action, Vol. 1.** Beacon Press.
- Luhmann, N. (1995). **Social Systems.** Stanford University Press.
- Perrow, C. (1984). **Normal Accidents: Living with High-Risk Technologies.** Basic Books.
- emsenn (2025a). **Information-Theoretic Stability as a Reward Function.** Private.
- Senn, E. (2025b). **Stability Dynamics in Cognitive Systems: A Predictive-Processing Interpretation.** Private.
- Senn, E. (2025c). **Stability Optimization in Artificial Agents: An Information-Theoretic Framework for Alignment.** Private.
- Senn, E. (2025d). **Neurophysiological Embodiment of Information-Theoretic Stability.** Private.
- Taleb, N. N. (2012). **Antifragile: Things That Gain from Disorder.** Random House.
- Wiener, N. (1948). **Cybernetics: Or Control and Communication in the Animal and the Machine.** MIT Press.
- Fanon, F. (1967). **Black Skin, White Masks.** Trans. C. L. Markmann. New York: Grove Press.
- Wynter, S. (2003). **Unsettling the Coloniality of Being/Power/Truth/Freedom: Towards the Human, After Man, Its Overrepresentation—An Argument.** CR: The New Centennial Review, 3(3), 257–337.

<a id="org03cb60d"></a>