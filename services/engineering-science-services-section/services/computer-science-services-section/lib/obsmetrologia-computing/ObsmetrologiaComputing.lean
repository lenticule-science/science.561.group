import ObsmetrologiaComputing.BoundaryLinkGraphMatter
import ObsmetrologiaComputing.CausalityPacket
import ObsmetrologiaComputing.FormatsFour
import ObsmetrologiaComputing.GameTheory
import ObsmetrologiaComputing.GameTheory.VerificationTournament
import ObsmetrologiaComputing.HoareProgram
import ObsmetrologiaComputing.ProviderAttestation

/-!
# ObsmetrologiaComputing

Computing over Obsmetrologia: program formats, Hoare programs, causality packets, boundary link graphs, game-theoretic verification tournaments, and independent providers' attestation of one state.

Every module here imports the pure-mathematics package `Obsmetrologia`; nothing in
`Obsmetrologia` imports this package. Declarations written before the split keep their
`Obsmetrologia.*` names; new ones are named under `ObsmetrologiaComputing`.
-/
