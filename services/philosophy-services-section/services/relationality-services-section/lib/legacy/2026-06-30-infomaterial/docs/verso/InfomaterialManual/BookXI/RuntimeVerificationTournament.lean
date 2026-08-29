import InfomaterialManual.DocSetup
import Infomaterial.Relational.Gaming.VerificationTournament

open Verso.Genre Manual InlineLean
open Infomaterial
open Infomaterial.Relational.Gaming.VerificationTournament

/-!
A frontier-lab chapter for runtime verification tournament certificates.
-/

#doc (Manual) "Runtime verification tournament" =>

# Runtime Verification Tournament

The frontier lab needs a page for computational/runtime evidence that is neither
loose anecdote nor a fully internal proof of the whole runtime system.
`VerificationTournament` supplies that boundary. It records the proposition-level
certificate that a finite claim/refutation tournament must carry before the
manual may say that a runtime survivor has been promoted into a settled claim.

The claim-site carried here is:

* claim-site: runtime verification tournament certificate;
* phase: frontier diagnostics over closure, gaming, and runtime evidence;
* generating sites: monotone closure, no-periodic-orbit law, structural
  tournament transcript, operational witness bundle, finite survivor reading,
  Nash no-deviation, and Dialectica witness survival;
* downstream uses: frontier-lab promotion checks, publication/runtime audit
  surfaces, executable notebook diagnostics, proof-tree drift detection, and
  future Dialectica/game-semantics carriers;
* Lean carrier: `Infomaterial.Relational.Gaming.VerificationTournament`;
* Blueprint/proof-tree nodes:
  `thm:verification-tournament-runtime-certificate`;
* provenance: the runtime gaming certificate records the Lean-backed part of a
  finite verification tournament while leaving libp2p transport, matchmaking,
  and full Dialectica semantics outside the current formal carrier;
* familiar comparison: adversarial review, Nash equilibrium, proof game,
  runtime attestation, and survivor selection;
* reader closure: separate a runtime transcript from the Lean proposition that
  the transcript is meant to witness;
* frontier status: libp2p, FSym peer identity, global matchmaking,
  executable strategy semantics, and full Dialectica game semantics remain
  missing carriers. This page proves only the certificate assembly once their
  obligations are supplied.

The governing sentence is:

> Runtime evidence enters the manual only as obligations that Lean can assemble
> into a certificate.

## Certificate Shape

The proposition-level certificate is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.Certificate}

The full runtime obligation bundle is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.RuntimeObligations}

The smaller operational witness bundle separates transport and bracket
obligations from survivor reasoning:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.OperationalWitnesses}

This is the first discipline. A transcript is not a theorem. It becomes useful
to the manual only when its required propositions are named.

## Structural Operational Reading

The structural transcript reading records counts and uniqueness facts:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.StructuralOperationalReading}

The four structural predicates are:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.DialecticaObjectMapped}

{docstring Infomaterial.Relational.Gaming.VerificationTournament.TransportRosterWitnessed}

{docstring Infomaterial.Relational.Gaming.VerificationTournament.MatchmakingOnceOnly}

{docstring Infomaterial.Relational.Gaming.VerificationTournament.StrategyPlayWitnessed}

They assemble into operational witnesses:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.operationalWitnessesOfStructuralReading}

and the theorem extracts all four operational obligations from one structural
reading:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.operational_witnesses_of_structural_reading}

Checked:

```lean
example (reading : StructuralOperationalReading)
    (hWitnesses :
      reading.dialecticaWitnesses = reading.claims)
    (hChallenges :
      reading.dialecticaChallenges = reading.refutations)
    (hTranscript : reading.transcriptMessages =
      reading.claims + reading.refutations + reading.plays)
    (hTickets : reading.ticketedPeers = reading.peers)
    (hTicketsUnique : reading.ticketsUnique)
    (hMatchedUnique : reading.matchedPlayersUnique)
    (hMatchedKnown : reading.matchedPlayersKnown)
    (hPairMatches : reading.pairwiseMatches = reading.plays)
    (hPairStreams :
      reading.pairwiseStreams = reading.plays) :
    (operationalWitnessesOfStructuralReading
        reading).dialecticaObjectMap ∧
      (operationalWitnessesOfStructuralReading
        reading).transportRosterWitnessed ∧
      (operationalWitnessesOfStructuralReading
        reading).matchmakingOnceOnly ∧
      (operationalWitnessesOfStructuralReading
        reading).strategyPlayWitnessed :=
  operational_witnesses_of_structural_reading
    reading hWitnesses hChallenges hTranscript hTickets
    hTicketsUnique hMatchedUnique hMatchedKnown
    hPairMatches hPairStreams
```

This is an audit page, not an implementation page. It says what a runtime system
must provide before the certificate can be checked.

## Survivor Reading

The survivor reading records the finite equilibrium side:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.SurvivorReading}

Nash no-deviation is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.NashNoDeviation}

Dialectica witness survival is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.DialecticaWitnessSurvives}

Equilibrium/survivor agreement is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.EquilibriumMatchesSurvivor}

The theorem deriving those obligations from a unique dominant claim is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.survivor_correspondence_of_unique_dominant_claim}

Checked:

```lean
example (reading : SurvivorReading)
    (hFixed : reading.fixedPoint)
    (hPure : reading.pure)
    (hRole : reading.settledRole = StrategyRole.claim)
    (hSame :
      reading.settledStrategy = reading.survivingClaim)
    (hAnswered : reading.allRefutationsAnswered)
    (hNoRefutation : reading.noDominantRefutation) :
    NashNoDeviation reading ∧
      DialecticaWitnessSurvives reading ∧
      EquilibriumMatchesSurvivor reading :=
  survivor_correspondence_of_unique_dominant_claim
    reading hFixed hPure hRole hSame
    hAnswered hNoRefutation
```

The page may now use "Nash" only as this finite no-deviation obligation. It is
not a theorem about all game semantics or all equilibria.

## Closure Turns Return Into Fixed Point

The certificate depends on closure already generated in Book IV. Stability is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.StableFor}

Survivor correspondence is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.CorrespondsToSurvivor}

The settled verdict is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.SettledVerdict}

The certificate theorem is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.settled_verdict_of_closure_certificate}

Checked:

```lean
example (cl : Charge.Closure) (seed : Charge)
    {k : Nat} (hk : 1 <= k)
    (hcycle : Charge.iter cl.op k seed = seed)
    (cert : Certificate)
    (hNoDeviation : cert.noProfitableDeviation)
    (hWitness : cert.dialecticaWitnessSurvives)
    (hCorresponds : cert.equilibriumMatchesSurvivor) :
    SettledVerdict cl seed cert :=
  settled_verdict_of_closure_certificate
    cl seed hk hcycle cert
    hNoDeviation hWitness hCorresponds
```

The mathematical hinge is not gaming vocabulary. It is the closure theorem that
a returned monotone orbit is a fixed point, combined with explicitly supplied
runtime obligations.

## Runtime Assembly

A settled runtime tournament packages the verdict plus operational evidence:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.RuntimeTournamentSettled}

Operational and survivor readings build the runtime obligations:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.runtimeObligationsOfReading}

The theorem that assembles the runtime certificate from readings is:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.runtime_tournament_settled_of_reading}

Checked:

```lean
example (cl : Charge.Closure) (seed : Charge)
    {k : Nat} (hk : 1 <= k)
    (hcycle : Charge.iter cl.op k seed = seed)
    (ops : OperationalWitnesses)
    (reading : SurvivorReading)
    (hDialectica : ops.dialecticaObjectMap)
    (hTransport : ops.transportRosterWitnessed)
    (hMatchmaking : ops.matchmakingOnceOnly)
    (hStrategyPlay : ops.strategyPlayWitnessed)
    (hFixed : reading.fixedPoint)
    (hPure : reading.pure)
    (hRole : reading.settledRole = StrategyRole.claim)
    (hSame :
      reading.settledStrategy = reading.survivingClaim)
    (hAnswered : reading.allRefutationsAnswered)
    (hNoRefutation : reading.noDominantRefutation) :
    RuntimeTournamentSettled cl seed
      (runtimeObligationsOfReading ops reading) :=
  runtime_tournament_settled_of_reading
    cl seed hk hcycle ops reading
    hDialectica hTransport hMatchmaking hStrategyPlay
    hFixed hPure hRole hSame hAnswered hNoRefutation
```

There is also a stronger assembly theorem from structural and survivor
readings:

{docstring Infomaterial.Relational.Gaming.VerificationTournament.runtime_tournament_settled_of_structural_reading}

This is the current frontier-lab promotion path for runtime gaming evidence.
If the runtime supplies structural and survivor propositions, Lean assembles the
certificate. Lean does not yet run the network, verify peer identity, or
formalize the full game semantics.

## Repair Path

If a future page says "the tournament proved the claim," check which statement
is meant:

1. a runtime transcript exists;
2. the transcript has been read into structural and survivor obligations;
3. those obligations have been checked by Lean as a `RuntimeTournamentSettled`;
4. the runtime transport and game semantics have themselves been formalized.

Only item 3 is settled here. Item 4 is the promotion target. Until those
carriers exist, the phrase "runtime proof" must mean a Lean-assembled
certificate from supplied obligations, not an end-to-end verified runtime.
