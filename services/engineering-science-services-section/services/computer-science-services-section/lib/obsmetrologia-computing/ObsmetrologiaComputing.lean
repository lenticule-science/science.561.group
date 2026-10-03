import ObsmetrologiaComputing.BoundaryLinkGraphMatter
import ObsmetrologiaComputing.Calm
import ObsmetrologiaComputing.CausalityPacket
import ObsmetrologiaComputing.FormatsFour
import ObsmetrologiaComputing.GameTheory
import ObsmetrologiaComputing.GameTheory.VerificationTournament
import ObsmetrologiaComputing.HoareProgram
import ObsmetrologiaComputing.ProviderAttestation
import ObsmetrologiaComputing.WorkArena
import ObsmetrologiaComputing.WorkArena.Fragment

/-!
# ObsmetrologiaComputing

Computing over Obsmetrologia: program formats, Hoare programs, causality packets, boundary link graphs, game-theoretic verification tournaments, independent providers' attestation of one state, when a replica may act on what it has received (CALM), and the work arena's law with its coordination-free fragment.

Every module here imports the pure-mathematics package `Obsmetrologia`; nothing in
`Obsmetrologia` imports this package. Declarations written before the split keep their
`Obsmetrologia.*` names; new ones are named under `ObsmetrologiaComputing`.
-/
