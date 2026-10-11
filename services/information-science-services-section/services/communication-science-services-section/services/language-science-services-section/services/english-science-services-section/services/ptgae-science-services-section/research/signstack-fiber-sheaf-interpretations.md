# PlainEng in the Sign stack: predication fibers, interpretation sheaves and bounded obstructions

**Scientific construction proposal 0.2, 2026-10-10.** Applies only after a specified English parsing and source-admission interface exists. Distinguish actual upstream software, proposed mathematical structures and untested linguistic hypotheses.

## 1. Receive the actual substrate in the correct direction

The proposed PlainEng language contract follows:

1. **English language facts and utterance:** source-preserving marks, articulation, token spans and the [Lenticule English language algebra](https://github.com/lenticule-science/linguistics-services-section/tree/main/services/english-language-algebra). This is descriptive/grammatical evidence, not a true statement about the world.
2. **SignCell:** [mark, utterance, predication, typed semantic claims](https://github.com/red-cup-engineering/computer-data-engineering-services-section/tree/main/apps/signcell/src). A source parser may **propose** cells; only admitted, source-witnessed semantic claims receive their actual evidence readings.
3. **SignChain:** [typed consequence and evidence orders](https://github.com/red-cup-engineering/computer-engineering-services-section/tree/main/services/computer-code-engineering-services-section/apps/signchain/src). Reason over typed claims with documented inference rules and premises.
4. **SignGraph:** [predicate fibers](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/fiber.mjs) and [cellular sheaves](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/cellular-sheaf.mjs). Relate readings across source/context sites and test compatible restrictions.
5. **SignCraft:** [inference, settlement, trace and repair](https://github.com/red-cup-engineering/computer-engineering-services-section/tree/main/services/signcraft/src/inference). Integrate independently justified inference/repair effects and receipts.
6. **English realization and PTGAE conformance:** return a readable, possibly restricted English surface linked to typed meaning and source. Reader comprehension and publication authority are tested separately.

This is a **targeted integration**. It does not assert that current PTGAE engineering imports or interoperates with the entire chain. The real [SignCraft RelConLang](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/signcraft/src/inference/relconlang.mjs) is a useful experimental comparison because it already represents clause readings, verb roots, aspect and discourse force, but a specialized constructed language is not itself an English grammar.

## 2. Fiber algebra over grammatical relations

Choose a finite set of source-identified tokens/phrases \(E\) and a controlled, typed predicate inventory \(\Pi\). A grammar proposal can be indexed by the relational carrier

\[
\Phi = E\times\Pi\times E.
\]

For a predicate \(p\in\Pi\), a candidate relation fiber \(F_p\) maps each source-identifiable pair \((s,o)\) to a **set of hypotheses/derivations** with span witnesses. This should be distinguished from an admitted SignCell evidence reading.

After type checking and testimony admission, SignGraph's [predicateFiber](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/fiber.mjs) can read evidence/FOUR over \(E\times E\) for a fixed \(p\). Its actual operators include knowledge/truth orders, cellwise fusion and residuation, and pullback, existential and universal folds for subject/object projections. Those operations live in the existing SignGraph/SignChain mathematics; PlainEng should **reuse** them, not invent a parallel fiber algebra.

The key distinction is **grammatical candidate vs affirmed proposition**:

- \((\text{graded},\mathrm{nsubj},\text{teacher})\) may be a grammatical dependency proposal witnessed by an algorithm/annotation; it is not evidence that an examination really occurred.
- \((\text{teacher},\mathrm{graded},\text{exam})\), with grounded referents and source metadata, is a candidate semantic predication. Its evidence state initially remains unwitnessed until an identified source/witness tells for or against it.
- The same spelling may occur twice in one sentence: the entity set must carry stable span identity, not token strings alone. A relation keyed by word text can collapse distinct referents and invalidate adjunction/gluing calculations.
- Distinct senses or referents must not be merged by surface synonym substitution alone.

This builds on the older [sentence fiber algebra](https://github.com/lenticule-science/linguistics-services-section/blob/main/content/text/documents/articles/notes/recovered/history/triage/sentence-fiber-algebra.md), while treating its 2026-06-03 implementation claims as historical and checking them against current software.

## 3. FOUR-valued evidence is not the set of grammatical alternatives

Let \(K(p,c)\) be the admitted witness profile of one **typed** proposition \(p\) in context \(c\). FOUR distinguishes lack of witnesses, one-sided support, one-sided counterevidence, and both. The actual SignCell implementation derives those readings from source witnesses; it does not permit a parser to stamp a truth/knowledge value without evidence.

For “I saw the scientist with the camera”, there may be two compatible English analyses:

- \(r_1\): the seeing used the camera;
- \(r_2\): the scientist had the camera.

These are **different interpretations**. In a candidate space \(R(s,c)\), \(r_1,r_2\in R(s,c)\) can coexist even if each alone would be consistent. Unless an additional typed exclusion constraint and **evidence against the same proposition** are present, this is not a FOUR “both”/stable case. A parser deciding between them without evidence discards information.

By contrast, two independent records that explicitly affirm and deny the *same* declared proposition under the same reference/time may yield a both-witness reading. The difference matters to safety, agent repair, and future Lean proofs.

## 4. Local interpretations as a presheaf: declare the site

Let \(B\) be a finite category/poset of source/context windows, discourse turns, or agent-local observations with inclusions/overlaps. This base must be specified for each experiment; it is **not** the English grammar itself.

For each \(b\in B\), define \(R(b)\) as admissible local readings under pinned grammar, domain, source and task. For \(b'\subseteq b\), a restriction map \(\rho_{b,b'}:R(b)\to R(b')\) forgets only the portions outside the subcontext. Require:

\[
\rho_{b,b} = \mathrm{id}, \qquad
\rho_{b',b''}\circ\rho_{b,b'} = \rho_{b,b''}.
\]

This is a presheaf candidate (contravariant on inclusions). A **cover** of a context is an explicitly selected family of subcontexts whose union or coverage semantics are defined. A *matching family* chooses one local reading per covered piece and agrees on their intersections.

A **global section** is a reading of the whole covered context restricting to the matching local readings. The sheaf axiom is existence and uniqueness of gluing for all required covers, a proposition to test/prove. Neither a parser nor a sheaf axiom creates an interpretation when the source provides insufficient context.

Three different outcomes:

1. Several global sections: genuine unresolved interpretive alternatives, **not** an obstruction.
2. Local readings incompatible on intersections: a **failed matching condition** requiring clarification, not automatically a nontrivial cohomology class.
3. Matching local readings with no global gluing: an actual **global obstruction**, provided the site, constraints and the existence claim are formalized.

This is scientifically more useful than writing “ambiguity is cohomology” without specifying the mathematics.

## 5. Sheaf Laplacian only after an explicit numerical model

The existing SignGraph [cellular-sheaf implementation](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/cellular-sheaf.mjs) works over finite-dimensional stalks at graph vertices/edges with restriction matrices. For an oriented edge \(e:v\to w\), an incidence residual has the form

\[
(\delta x)_e = \rho_{w,e}x_w-\rho_{v,e}x_v,
\qquad L=\delta^\top\delta,
\qquad \mathcal E(x)=\lVert\delta x\rVert^2.
\]

It computes exact rational rank for eligible matrices, and floating numerical diffusion with explicit tolerances. The kernel characterizes compatible zero-cochains **for this linear representation**. FOUR, word meanings and raw parsing alternatives are not vector spaces by default. A selected embedding \(\iota:R(b)\to\mathbb R^{d_b}\) is a modeling decision that can lose structure.

### Two-node example (mathematical, not empirical English)

Two contexts \(v,w\) share one scalar feature on overlap \(e\), with one-dimensional stalks and identity restrictions. Set

\[
\delta = \begin{bmatrix}-1 & 1\end{bmatrix},\quad
L = \begin{bmatrix}1 & -1\\-1 & 1\end{bmatrix}.
\]

For \(x=(1,1)\), the overlap residual and energy are zero; the sections agree. For \(x=(1,0)\), \(\delta x=-1\), energy is \(1\), and \(Lx=(1,-1)\). The second model has **one feature disagreement on this chosen overlap**, not “one unit of real-world language ambiguity.” The constant sheaf has a one-dimensional \(H^0\) on this connected edge and trivial \(H^1\).

This toy result is elementary linear algebra, not a runtime test or evidence that the real SignGraph library has processed an English sentence. A robust engineering experiment would instantiate the real library's matrix contracts, reproduce the values, then add typed semantic features and a negative control.

## 6. Predicate quantifiers as adjoints: opportunity and constraint

SignGraph's [fiber API](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/fiber.mjs) implements pullbacks plus \(\exists,\forall\)-style adjoint folds over projection maps, with generator law checks.

This offers a precise research question: can a restricted English quantified clause “For every accepted application A, ...” be compiled to a type-scoped predicate fiber and a corresponding adjoint operation? If so, what are the domain, valuation, free/bound variables, presuppositions and witness obligations? A finite fold over a known set is **not automatically** all real-world universal quantification. Domain closure, unknown members, negation and normative force require explicit policy.

Proposed checks: preserve the grammar's scope tree; reject unbound quantified variables; compare both directions of “if and only if”; test referent/dialect variants; prove exact identities for restricted cases if executable Lean definitions exist.

## 7. Communication and repair

A future PlainEng response may say:

- “Two readings remain possible: the camera belongs to the scientist, or the camera was used to see the scientist.”
- “The source does not decide between these readings.”
- “Which reading was intended?”

It should not emit “Disputed: the scientist used a camera” merely because two parsers disagree. Where source witnesses truly disagree on the same proposition, the system can show both with provenance. Where an agent lacks authority, it must not convert a syntactically well-formed imperative into an executable command.

Computational budget can guide which ambiguity to resolve first (e.g. expected loss, verification cost, consequence), but such a valuation must be measured/calibrated; it cannot be manufactured from a graph residual with arbitrary units.

## 8. Test/proof obligations and maturity

- **Syntactic:** parser candidates remain linked to true source spans, including duplicate tokens and astral Unicode.
- **Semantic:** alternatives, contradictions, unknown references and source disagreements have distinct typed constructors.
- **Algebraic:** SignCell/SignChain evidence order and SignGraph predicate-fiber laws are preserved by admitted mapping; no claim is attached without actual witness.
- **Sheaf:** specified site/cover/restrictions satisfy composition; report matching failure versus gluing obstruction correctly.
- **Numerical:** vector stalk dimensions/units are documented; exact and floating diagnostics are distinguished; unsupported linearization abstains.
- **Formal:** machine-checked proof receipts cover *restricted* constructs; no assertion of a proof of arbitrary English meaning.
- **Human:** reader-task experiments test whether additional constraints improve actual understanding and action.

Research owner: [Lenticule issue #60](https://github.com/lenticule-science/science-services-section/issues/60). Engineering consumer: [Red Cup issue #8](https://github.com/red-cup-engineering/ptgae-engineering-services-section/issues/8). Adjacent model: [contextual semantics](../../../research/english-language-research-program.md) and [PlainEng theory](plaineng-constrained-english-theory.md).
