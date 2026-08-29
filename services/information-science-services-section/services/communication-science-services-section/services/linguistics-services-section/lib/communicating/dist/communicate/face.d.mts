/**
 * communicate/face — communicating's ACROSS / TRUTH local section over an agent
 * membrane, the boundary face animating (the bulk) reads instead of faking the across
 * face with a generic relating `descend`.
 *
 * animating is a holographic BULK over three boundary FACES (communicating = across,
 * knowing = inside, playing = outside; dev/docs/notes/2026-06-21-bulk-over-faces-
 * local-section-threading.md). Each face is a LOCAL SECTION over the agent's membrane
 * (a `readonly UtteranceCarrier[]` log), read on one of the three transverse
 * agentive-triad bilattice axes. communicating supplies the ACROSS face on the TRUTH
 * axis (`≤_t` — which way it leans; negation antitone): the across reading is the
 * agent's settled truth-DIRECTION over its own membrane. At scale 1 the bulk is a
 * single agent over its own three faces, so this gluing is always coordination-free
 * (one self cannot contest itself across filtrations) — but the truth axis can still
 * carry a HELD contradiction when the same membrane both asserts and denies one
 * subject; that stable cell is the across face's `contested` reading.
 *
 * Crucially this is communicating's OWN meme reading, NOT a copy of animating's generic
 * descend-then-section. communicating WORKS OVER relating's meme carrier (its core morphisms are
 * meme → meme; the ≤_t semiotic structure is a description, not a definition — see
 * dev/docs/notes/2026-06-21-communicating-as-end-meme-semiotics.md). The membrane is
 * settled into communicating's own MEMES — one meme per utterance, charged by its
 * truth-DIRECTION — and same-subject memes are POOLED along the bilattice so the across
 * direction reads off the pooled charge of each subject cell, not off a bare descent
 * state:
 *
 *   cover     = the distinct subject cells the membrane settles into memes (each a cell
 *               of this local section over the agent's membrane)
 *   held      = the cells whose pooled charge carries a settled truth DIRECTION
 *               (a definite potential/active lean, or a stable held-contradiction) —
 *               the cells the agent settles which way it leans
 *   contested = the cells pooled to `stable` (`⊤`) — HELD truth contradictions where
 *               the membrane both asserts and denies the SAME subject (paraconsistent,
 *               both witnesses retained) — the across face's contested cells
 *
 * The TRUTH axis enters in how a claim becomes a charge: an assertion leans `potential`
 * (positive, `≤_t`-up — `witnessedPotential`); a denial/negation leans `active`
 * (negative, `≤_t`-down) — and a denial is read by applying communicating's OWN polarity
 * involution `negate` (the meme `negate` morphism's charge operator, the truth-axis
 * antitone generator `~`) to the asserted charge. So an assertion and a denial on the
 * same subject become OPPOSED on the truth axis (negation antitone); pooling them
 * (`joinKnowledge`, the bilattice accumulation that retains both witnesses) lands on
 * `stable` — the across face's held-contradiction. Grounded in the agentive-triad's
 * truth axis (content/_archive predication-categories truth.md; Avron twist-product;
 * negation acts antitonely on `≤_t`) and communicating's own meme/negate surface.
 *
 * Dependency (the DAG): this is a LEAF over relating + the package's own meme surface.
 * It does NOT import @red-cup-engineering/animating (the bulk). animating imports THIS.
 */
import { type ChargeValueName, type Meme, type UtteranceCarrier } from "@red-cup-engineering/relating";
/** The axis this face reads — the agentive-triad TRUTH axis (`≤_t`, negation antitone). */
export declare const COMMUNICATING_FACE_AXIS: "truth";
/** The truth-axis Belnap census of the pooled truth-direction of each subject cell. */
export interface TruthBelnap {
    /** absurd `⊥` — no membrane utterance settled this cell (never reached: a cell exists only by an utterance). */
    readonly absurd: number;
    /** potential `t` — the membrane leans FOR (asserted, `≤_t`-up). */
    readonly potential: number;
    /** active `f` — the membrane leans AGAINST (denied, `≤_t`-down). */
    readonly active: number;
    /** stable `⊤` — a HELD truth contradiction: the membrane both asserted and denied the subject. */
    readonly stable: number;
}
/**
 * communicating's ACROSS / TRUTH local section over an agent membrane. The thin triple
 * { cover, held, contested } is exactly animating's `Face` contract (integers ≥ 0); the
 * thick fields expose the meme reading it was projected from (the per-cell truth-axis
 * Belnap census) so the across direction is inspectable — a genuine meme reading, not a
 * generic descend.
 */
export interface CommunicatingFace {
    readonly kind: "communicating.face";
    readonly faculty: "communicating";
    readonly direction: "across";
    readonly axis: typeof COMMUNICATING_FACE_AXIS;
    /** cells of the local section over the membrane — the distinct subject memes. */
    readonly cover: number;
    /** cells the agent holds a truth DIRECTION on — pooled charge not absurd. */
    readonly held: number;
    /** stable / held-contradiction cells — subjects both asserted and denied (pooled `stable`). */
    readonly contested: number;
    /** the number of membrane utterances settled into memes. */
    readonly utterances: number;
    /** the truth-axis Belnap census of the per-cell pooled truth-directions. */
    readonly belnap: TruthBelnap;
    /** communicating's REAL across/truth work: the collective LEAN — which way the whole membrane
     *  leans on the truth order ≤_t (the TRUTH-axis join ∨_t, DUAL to knowing's ≤_k accumulation):
     *  `potential` leans FOR, `active` leans AGAINST, `stable` is polarized (told-both wins), `absurd`
     *  is no lean. Parameterized from relating's `truthAggregateOfCensus`. This is the across face's
     *  defining reading ("which way the boundary leans"); the census says how the votes split, the
     *  lean says the resultant DIRECTION. */
    readonly lean: ChargeValueName;
}
/**
 * Settle one membrane utterance into a communicating MEME on the truth axis. The meme's cell is the
 * COMMUNICATION EDGE `(subject, predicate, utterer)` — the utterer speaks *about* the claim's bare
 * subject — NOT a reflexive `(subject, …, subject)` self-loop. This keeps the relational structure the
 * utterance actually carries (who said what), so a membrane's memes form a genuine speaker↔subject
 * channel graph (the information-theoretic substrate the discourse readings — cohesion, spacetime —
 * thread over); a self-claim (utterer = subject) is the degenerate reflexive case. The charge is the
 * truth-DIRECTION: `witnessedPotential` (the utterer the sole truth-side witness, `≤_t`-up) for an
 * assertion, and its `negate` for a denial. The utterer is BOTH the cell's object and the charge
 * witness, so same-subject both-ways pooling still retains both witnesses (paraconsistent). The face
 * pools by the claim-subject key, independent of the cell shape, so this is invisible to cover/held/
 * contested and visible only to the relational readings that need it.
 */
export declare function membraneMeme(carrier: UtteranceCarrier): Meme;
/**
 * communicatingFace — communicating's OWN across/truth local section over an agent
 * membrane, the face animating (the bulk) consumes instead of faking it with a generic
 * relating descend. Each membrane utterance is settled into a communicating MEME charged
 * by its truth-DIRECTION (assertion `potential`, denial the `negate` of it — the
 * polarity involution on the truth axis); memes are grouped by their subject cell and
 * the same-subject charges POOLED along the bilattice (`joinKnowledge`, retaining both
 * witnesses). The thin triad is the truth-axis reading of that pooled cover:
 *
 *   cover     = the distinct subject cells (memes) the membrane settles
 *   held      = cells whose pooled charge carries a truth direction (not absurd)
 *   contested = cells pooled to `stable` (`⊤`) — both asserted AND denied (held
 *               contradiction; negation antitone on the truth axis)
 *
 * The thick `belnap` is the per-cell truth-axis Belnap census. Pure; never imports the
 * bulk — this is communicating's meme/negate reading, not animating's generic descend.
 * The empty membrane is the empty across face (all zero).
 */
export declare function communicatingFace(membrane: readonly UtteranceCarrier[]): CommunicatingFace;
//# sourceMappingURL=face.d.mts.map