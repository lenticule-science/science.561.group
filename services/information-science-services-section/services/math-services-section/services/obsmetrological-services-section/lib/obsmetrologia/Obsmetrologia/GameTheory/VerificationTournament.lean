import Obsmetrologia.Closure.Monad

/-!
# Verification tournament certificate

This module records the Lean-backed part of the gaming verification-tournament
certificate. It does not formalize libp2p transport, matchmaking, or the full
Dialectica game semantics. Its scope is narrower and explicit: once the runtime
tournament has witnessed a returned monotone closure orbit, `Charge.no_periodic_orbits`
turns that orbit into a fixed point, and the finite certificate obligations bundle
Nash stability with survivor correspondence.
-/

namespace Obsmetrologia
namespace GameTheory
namespace VerificationTournament

/-- The proposition-level part of a runtime verification-tournament certificate. -/
structure Certificate where
  /-- No admitted strategy can improve by unilaterally deviating from the settled play. -/
  noProfitableDeviation : Prop
  /-- The settled claim is still present as the Dialectica witness. -/
  dialecticaWitnessSurvives : Prop
  /-- The equilibrium reading names the same surviving claim. -/
  equilibriumMatchesSurvivor : Prop

/-- The runtime proof obligations emitted by `lib/gaming` for one finite tournament. -/
structure RuntimeObligations where
  /-- Claims were mapped to Dialectica witnesses and refutations to challenges. -/
  dialecticaObjectMap : Prop
  /-- The libp2p/FSym peer roster witnessed all agents used by the tournament. -/
  transportRosterWitnessed : Prop
  /-- The global matchmaker admitted each peer ticket once. -/
  matchmakingOnceOnly : Prop
  /-- Every claim/refutation play has a pairwise matchmaker bracket and libp2p stream. -/
  strategyPlayWitnessed : Prop
  /-- The finite bracket has no profitable unilateral deviation from the settled strategy. -/
  nashStable : Prop
  /-- The settled claim remains the Dialectica witness. -/
  dialecticaWitnessSurvives : Prop
  /-- The equilibrium strategy is exactly the surviving claim. -/
  equilibriumMatchesSurvivor : Prop

/-- The two strategy roles in a claim/refutation verification game. -/
inductive StrategyRole
  | claim
  | refutation
  deriving DecidableEq

/-- Operational witnesses emitted by gaming for one finite runtime bracket. -/
structure OperationalWitnesses where
  /-- Claims were mapped to Dialectica witnesses and refutations to challenges. -/
  dialecticaObjectMap : Prop
  /-- The libp2p/FSym peer roster witnessed all agents used by the tournament. -/
  transportRosterWitnessed : Prop
  /-- The global matchmaker admitted each peer ticket once. -/
  matchmakingOnceOnly : Prop
  /-- Every claim/refutation play has a pairwise matchmaker bracket and libp2p stream. -/
  strategyPlayWitnessed : Prop

/-- The structural reading of the runtime tournament transcript. -/
structure StructuralOperationalReading where
  /-- Number of submitted claims. -/
  claims : Nat
  /-- Number of submitted refutations. -/
  refutations : Nat
  /-- Number of libp2p peers admitted into the tournament roster. -/
  peers : Nat
  /-- Number of claim/refutation plays. -/
  plays : Nat
  /-- Number of Dialectica witnesses built from claims. -/
  dialecticaWitnesses : Nat
  /-- Number of Dialectica challenges built from refutations. -/
  dialecticaChallenges : Nat
  /-- Number of claim/refutation/play pubsub transcript messages. -/
  transcriptMessages : Nat
  /-- Number of peer tickets admitted by the global matchmaker. -/
  ticketedPeers : Nat
  /-- Number of players that appear in formed global matches. -/
  matchedPlayers : Nat
  /-- Number of pairwise claim/refutation matches. -/
  pairwiseMatches : Nat
  /-- Number of pairwise libp2p streams opened for claim/refutation plays. -/
  pairwiseStreams : Nat
  /-- No peer submitted more than one global matchmaker ticket. -/
  ticketsUnique : Prop
  /-- No player appears in more than one formed global match. -/
  matchedPlayersUnique : Prop
  /-- Every matched player is present in the libp2p roster. -/
  matchedPlayersKnown : Prop

/-- Structural evidence that the Dialectica object map covered the claims/refutations. -/
def DialecticaObjectMapped (reading : StructuralOperationalReading) : Prop :=
  reading.dialecticaWitnesses = reading.claims /\
    reading.dialecticaChallenges = reading.refutations

/-- Structural evidence that the libp2p transcript covers claims, refutations, and plays. -/
def TransportRosterWitnessed (reading : StructuralOperationalReading) : Prop :=
  reading.transcriptMessages = reading.claims + reading.refutations + reading.plays

/-- Structural evidence that the global matchmaker admitted each peer once. -/
def MatchmakingOnceOnly (reading : StructuralOperationalReading) : Prop :=
  reading.ticketedPeers = reading.peers /\
    reading.ticketsUnique /\
    reading.matchedPlayersUnique /\
    reading.matchedPlayersKnown

/-- Structural evidence that every strategy play has a pairwise match and stream. -/
def StrategyPlayWitnessed (reading : StructuralOperationalReading) : Prop :=
  reading.pairwiseMatches = reading.plays /\
    reading.pairwiseStreams = reading.plays

/-- Build operational witnesses from the structural runtime transcript reading. -/
def operationalWitnessesOfStructuralReading
    (reading : StructuralOperationalReading) : OperationalWitnesses where
  dialecticaObjectMap := DialecticaObjectMapped reading
  transportRosterWitnessed := TransportRosterWitnessed reading
  matchmakingOnceOnly := MatchmakingOnceOnly reading
  strategyPlayWitnessed := StrategyPlayWitnessed reading

/-- The finite survivor reading computed from claim/refutation play settlements. -/
structure SurvivorReading where
  /-- The unique settled equilibrium strategy id. -/
  settledStrategy : Nat
  /-- The unique surviving claim id. -/
  survivingClaim : Nat
  /-- The role of the settled strategy. -/
  settledRole : StrategyRole
  /-- The monotone equilibrium reading reached a fixed point. -/
  fixedPoint : Prop
  /-- There is one pure settled strategy. -/
  pure : Prop
  /-- Every refutation against the surviving claim was answered by a surviving play. -/
  allRefutationsAnswered : Prop
  /-- No refutation strategy remains dominant against the settled claim. -/
  noDominantRefutation : Prop

/-- The finite reading has no profitable deviation from the settled strategy. -/
def NashNoDeviation (reading : SurvivorReading) : Prop :=
  reading.fixedPoint /\ reading.pure /\ reading.noDominantRefutation

/-- The settled strategy is still the Dialectica witness claim. -/
def DialecticaWitnessSurvives (reading : SurvivorReading) : Prop :=
  reading.settledRole = StrategyRole.claim /\
    reading.settledStrategy = reading.survivingClaim /\
    reading.allRefutationsAnswered

/-- The equilibrium strategy is exactly the surviving claim. -/
def EquilibriumMatchesSurvivor (reading : SurvivorReading) : Prop :=
  reading.fixedPoint /\ reading.pure /\ reading.settledStrategy = reading.survivingClaim

/-- Build the runtime theorem obligations from operational witnesses plus the survivor reading. -/
def runtimeObligationsOfReading
    (ops : OperationalWitnesses) (reading : SurvivorReading) : RuntimeObligations where
  dialecticaObjectMap := ops.dialecticaObjectMap
  transportRosterWitnessed := ops.transportRosterWitnessed
  matchmakingOnceOnly := ops.matchmakingOnceOnly
  strategyPlayWitnessed := ops.strategyPlayWitnessed
  nashStable := NashNoDeviation reading
  dialecticaWitnessSurvives := DialecticaWitnessSurvives reading
  equilibriumMatchesSurvivor := EquilibriumMatchesSurvivor reading

/-- Stability for a dominance seed: closure fixed point plus Nash no-deviation. -/
def StableFor (cl : Charge.Closure) (seed : Charge) (cert : Certificate) : Prop :=
  cl.op seed = seed /\ cert.noProfitableDeviation

/-- Survivor correspondence: the surviving Dialectica witness is the equilibrium strategy. -/
def CorrespondsToSurvivor (cert : Certificate) : Prop :=
  cert.dialecticaWitnessSurvives /\ cert.equilibriumMatchesSurvivor

/-- The certificate-level settled verdict. -/
def SettledVerdict (cl : Charge.Closure) (seed : Charge) (cert : Certificate) : Prop :=
  StableFor cl seed cert /\ CorrespondsToSurvivor cert

/-- A runtime tournament whose operational witnesses have been carried into the certificate. -/
structure RuntimeTournamentSettled (cl : Charge.Closure) (seed : Charge)
    (ops : RuntimeObligations) where
  /-- The closure/no-deviation/survivor certificate is settled. -/
  settled : SettledVerdict cl seed {
    noProfitableDeviation := ops.nashStable
    dialecticaWitnessSurvives := ops.dialecticaWitnessSurvives
    equilibriumMatchesSurvivor := ops.equilibriumMatchesSurvivor
  }
  /-- The Dialectica object-map obligation used by the runtime certificate. -/
  dialecticaObjectMap : ops.dialecticaObjectMap
  /-- The libp2p/FSym roster obligation used by the runtime certificate. -/
  transportRosterWitnessed : ops.transportRosterWitnessed
  /-- The once-only matchmaker obligation used by the runtime certificate. -/
  matchmakingOnceOnly : ops.matchmakingOnceOnly
  /-- The pairwise claim/refutation play+stream obligation used by the runtime certificate. -/
  strategyPlayWitnessed : ops.strategyPlayWitnessed

/--
Certificate theorem for the verification tournament.

If the dominance-seed closure orbit returns to its start after at least one step,
`Charge.no_periodic_orbits` proves that the seed was already at a fixed point. With
the runtime no-deviation and survivor-correspondence obligations, the certificate is
therefore stable and corresponds to the surviving claim.
-/
theorem settled_verdict_of_closure_certificate
    (cl : Charge.Closure) (seed : Charge) {k : Nat} (hk : 1 <= k)
    (hcycle : Charge.iter cl.op k seed = seed)
    (cert : Certificate)
    (hNoDeviation : cert.noProfitableDeviation)
    (hWitness : cert.dialecticaWitnessSurvives)
    (hCorresponds : cert.equilibriumMatchesSurvivor) :
    SettledVerdict cl seed cert := by
  constructor
  · exact ⟨Charge.no_periodic_orbits cl seed hk hcycle, hNoDeviation⟩
  · exact ⟨hWitness, hCorresponds⟩

/--
Runtime certificate theorem for the verification tournament.

This is still intentionally certificate-level: the runtime supplies proofs of the
operational obligations for the finite tournament instance. Lean then checks that
those obligations, together with the monotone closure no-periodic-orbit law, yield
a settled Nash certificate whose equilibrium strategy corresponds to the surviving
Dialectica witness.
-/
theorem runtime_tournament_settled_of_obligations
    (cl : Charge.Closure) (seed : Charge) {k : Nat} (hk : 1 <= k)
    (hcycle : Charge.iter cl.op k seed = seed)
    (ops : RuntimeObligations)
    (hDialectica : ops.dialecticaObjectMap)
    (hTransport : ops.transportRosterWitnessed)
    (hMatchmaking : ops.matchmakingOnceOnly)
    (hStrategyPlay : ops.strategyPlayWitnessed)
    (hNash : ops.nashStable)
    (hWitness : ops.dialecticaWitnessSurvives)
    (hCorresponds : ops.equilibriumMatchesSurvivor) :
    RuntimeTournamentSettled cl seed ops where
  settled :=
    settled_verdict_of_closure_certificate cl seed hk hcycle
      {
        noProfitableDeviation := ops.nashStable
        dialecticaWitnessSurvives := ops.dialecticaWitnessSurvives
        equilibriumMatchesSurvivor := ops.equilibriumMatchesSurvivor
      }
      hNash hWitness hCorresponds
  dialecticaObjectMap := hDialectica
  transportRosterWitnessed := hTransport
  matchmakingOnceOnly := hMatchmaking
  strategyPlayWitnessed := hStrategyPlay

/--
Survivor correspondence from the finite claim/refutation reading.

If the equilibrium is fixed and pure, its settled strategy is a claim, that strategy
is the surviving claim, every refutation against it has been answered, and no
refutation remains dominant, then the Nash, Dialectica-witness, and survivor
correspondence obligations follow from the reading itself.
-/
theorem survivor_correspondence_of_unique_dominant_claim
    (reading : SurvivorReading)
    (hFixed : reading.fixedPoint)
    (hPure : reading.pure)
    (hRole : reading.settledRole = StrategyRole.claim)
    (hSame : reading.settledStrategy = reading.survivingClaim)
    (hAnswered : reading.allRefutationsAnswered)
    (hNoRefutation : reading.noDominantRefutation) :
    NashNoDeviation reading /\
      DialecticaWitnessSurvives reading /\
      EquilibriumMatchesSurvivor reading := by
  constructor
  · exact ⟨hFixed, hPure, hNoRefutation⟩
  · constructor
    · exact ⟨hRole, hSame, hAnswered⟩
    · exact ⟨hFixed, hPure, hSame⟩

/--
Operational witnesses from a structural tournament transcript.

The runtime still computes the structural counts and uniqueness facts, but the
four operational witness propositions are now obtained uniformly from that
single structural reading.
-/
theorem operational_witnesses_of_structural_reading
    (reading : StructuralOperationalReading)
    (hWitnesses : reading.dialecticaWitnesses = reading.claims)
    (hChallenges : reading.dialecticaChallenges = reading.refutations)
    (hTranscript : reading.transcriptMessages = reading.claims + reading.refutations + reading.plays)
    (hTickets : reading.ticketedPeers = reading.peers)
    (hTicketsUnique : reading.ticketsUnique)
    (hMatchedUnique : reading.matchedPlayersUnique)
    (hMatchedKnown : reading.matchedPlayersKnown)
    (hPairMatches : reading.pairwiseMatches = reading.plays)
    (hPairStreams : reading.pairwiseStreams = reading.plays) :
    (operationalWitnessesOfStructuralReading reading).dialecticaObjectMap /\
      (operationalWitnessesOfStructuralReading reading).transportRosterWitnessed /\
      (operationalWitnessesOfStructuralReading reading).matchmakingOnceOnly /\
      (operationalWitnessesOfStructuralReading reading).strategyPlayWitnessed := by
  constructor
  · exact And.intro hWitnesses hChallenges
  · constructor
    · exact hTranscript
    · constructor
      · exact And.intro hTickets (And.intro hTicketsUnique (And.intro hMatchedUnique hMatchedKnown))
      · exact And.intro hPairMatches hPairStreams

/--
Runtime tournament theorem derived from the survivor reading.

This theorem moves the proof boundary inward: the runtime still supplies the
operational witnesses for Dialectica mapping, transport, matchmaking, and pairwise
play streams, but the Nash and survivor-correspondence obligations are derived
from the finite settled claim/refutation reading.
-/
theorem runtime_tournament_settled_of_reading
    (cl : Charge.Closure) (seed : Charge) {k : Nat} (hk : 1 <= k)
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
    (hSame : reading.settledStrategy = reading.survivingClaim)
    (hAnswered : reading.allRefutationsAnswered)
    (hNoRefutation : reading.noDominantRefutation) :
    RuntimeTournamentSettled cl seed (runtimeObligationsOfReading ops reading) := by
  have hReading := survivor_correspondence_of_unique_dominant_claim
    reading hFixed hPure hRole hSame hAnswered hNoRefutation
  exact runtime_tournament_settled_of_obligations
    cl seed hk hcycle (runtimeObligationsOfReading ops reading)
    hDialectica hTransport hMatchmaking hStrategyPlay
    hReading.1 hReading.2.1 hReading.2.2

/--
Runtime tournament theorem derived from structural and survivor readings.

The runtime supplies one structural operational reading plus one finite survivor
reading. Lean derives the operational witness bundle from the structural reading,
derives Nash/survivor correspondence from the survivor reading, and then assembles
the settled runtime certificate.
-/
theorem runtime_tournament_settled_of_structural_reading
    (cl : Charge.Closure) (seed : Charge) {k : Nat} (hk : 1 <= k)
    (hcycle : Charge.iter cl.op k seed = seed)
    (structural : StructuralOperationalReading)
    (reading : SurvivorReading)
    (hWitnesses : structural.dialecticaWitnesses = structural.claims)
    (hChallenges : structural.dialecticaChallenges = structural.refutations)
    (hTranscript : structural.transcriptMessages = structural.claims + structural.refutations + structural.plays)
    (hTickets : structural.ticketedPeers = structural.peers)
    (hTicketsUnique : structural.ticketsUnique)
    (hMatchedUnique : structural.matchedPlayersUnique)
    (hMatchedKnown : structural.matchedPlayersKnown)
    (hPairMatches : structural.pairwiseMatches = structural.plays)
    (hPairStreams : structural.pairwiseStreams = structural.plays)
    (hFixed : reading.fixedPoint)
    (hPure : reading.pure)
    (hRole : reading.settledRole = StrategyRole.claim)
    (hSame : reading.settledStrategy = reading.survivingClaim)
    (hAnswered : reading.allRefutationsAnswered)
    (hNoRefutation : reading.noDominantRefutation) :
    RuntimeTournamentSettled cl seed
      (runtimeObligationsOfReading (operationalWitnessesOfStructuralReading structural) reading) := by
  have hOps := operational_witnesses_of_structural_reading
    structural hWitnesses hChallenges hTranscript hTickets hTicketsUnique
    hMatchedUnique hMatchedKnown hPairMatches hPairStreams
  exact runtime_tournament_settled_of_reading
    cl seed hk hcycle (operationalWitnessesOfStructuralReading structural) reading
    hOps.1 hOps.2.1 hOps.2.2.1 hOps.2.2.2
    hFixed hPure hRole hSame hAnswered hNoRefutation

end VerificationTournament
end GameTheory
end Obsmetrologia
