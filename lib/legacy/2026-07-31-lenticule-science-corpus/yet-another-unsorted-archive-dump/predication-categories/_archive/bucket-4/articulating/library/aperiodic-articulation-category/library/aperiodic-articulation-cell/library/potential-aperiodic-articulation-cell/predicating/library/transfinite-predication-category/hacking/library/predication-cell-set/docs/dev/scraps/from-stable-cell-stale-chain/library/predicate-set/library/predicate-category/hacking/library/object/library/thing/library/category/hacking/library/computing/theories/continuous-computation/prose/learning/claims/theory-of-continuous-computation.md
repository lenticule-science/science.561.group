---
name: theory-of-continuous-computation
type: theorem
status: proved
description: RT(K₂) — the realizability topos over Kleene's second algebra — is the theory of continuous computation. It is a sibling of Eff, connected by a one-directional geometric morphism from Eff, and is strictly larger: Brouwer's fan functional is realizable in RT(K₂) but not in Eff.
see-also: [theory-of-computability, what-are-the-subtheories-of-computing]
---

# The Theory of Continuous Computation

**Theorem.** $RT(\mathcal{K}_2)$ — the realizability topos over Kleene's second algebra $\mathcal{K}_2 = (\omega^\omega, \cdot)$ — is the theory of continuous computation. There is a geometric morphism $\mathbf{Eff} \to RT(\mathcal{K}_2)$ induced by an applicative morphism $\mathcal{K}_1 \to \mathcal{K}_2$, but no reverse geometric morphism exists. $RT(\mathcal{K}_2)$ is therefore a sibling of $\mathbf{Eff}$, not a subtopos.

**Proof.**

*The applicative morphism $\mathcal{K}_1 \to \mathcal{K}_2$.* Every partial recursive function $\varphi_e: \omega \to \omega$ extends to a continuous function on Baire space by treating natural numbers as constant functions: $\hat{\varphi}_e(f) = \lambda n. \varphi_e(f(0))$. The map $\gamma: \mathcal{K}_1 \to \mathcal{K}_2$ defined by $\gamma(e) = \hat{\varphi}_e$ is an applicative morphism: $\gamma(a \cdot_{\mathcal{K}_1} b) = \gamma(a) \cdot_{\mathcal{K}_2} \gamma(b)$ (since Kleene application on natural numbers is a special case of continuous application on Baire space). This induces a geometric morphism $RT(\mathcal{K}_1) = \mathbf{Eff} \to RT(\mathcal{K}_2)$ (van Oosten 2008, Theorem 3.5.3).

*No reverse applicative morphism.* An applicative morphism $\mathcal{K}_2 \to \mathcal{K}_1$ would mean every $\mathcal{K}_2$-computable total function is $\mathcal{K}_1$-computable. But $\mathcal{K}_2$-realizable total functions include Brouwer's fan functional $\Phi: (\{0,1\}^\omega \to \omega) \to \omega$, which takes any uniformly continuous $f: \{0,1\}^\omega \to \omega$ and returns the modulus of uniform continuity. The fan functional is continuous on Baire space (hence $\mathcal{K}_2$-computable) but not partial recursive (not $\mathcal{K}_1$-computable). Therefore no applicative morphism $\mathcal{K}_2 \to \mathcal{K}_1$ exists, and no geometric morphism $RT(\mathcal{K}_2) \to \mathbf{Eff}$ with full faithful direct image exists.

*$RT(\mathcal{K}_2)$ is strictly larger.* Since $\mathbf{Eff} \to RT(\mathcal{K}_2)$ exists but $RT(\mathcal{K}_2) \not\hookrightarrow \mathbf{Eff}$, continuous computation is a strictly larger theory: it proves everything $\mathbf{Eff}$ proves (via the geometric morphism) and additionally proves statements about uniformly continuous functions (Brouwer's fan theorem holds in $RT(\mathcal{K}_2)$ but not in $\mathbf{Eff}$). $RT(\mathcal{K}_2)$ is the natural setting for computable analysis (Weihrauch reducibility, represented spaces), denotational semantics of programming languages (Scott domains are $\mathcal{K}_2$-modest sets), and domain theory. $\square$
