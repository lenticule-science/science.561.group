"""Error code constants — see ``specs/kernel/error-codes.md``.

Codes are namespaced by subsystem prefix:

* ``PCC_*`` — closure / cell consistency
* ``PCR_*`` — closure rule
* ``PCM_*`` — message / respond
* ``PCS_*`` — storage
* ``PCH_*`` — heartbeat / runtime
* ``PCA_*`` — algebra / adjunction
* ``PCE_*`` — evidence / driver
"""

from __future__ import annotations

# Closure / cell consistency
PCC_MONOTONICITY_FAIL = "PCC_MONOTONICITY_FAIL"
PCC_HASH_MISMATCH = "PCC_HASH_MISMATCH"
PCC_CYCLE_DETECTED = "PCC_CYCLE_DETECTED"
PCC_FUEL_EXHAUSTED = "PCC_FUEL_EXHAUSTED"
# Stratum / witness consistency — per specs/filesystem/cell-record.md §1
# and specs/kernel/stratified-facts.md §1.
# - PCC_UNKNOWN_STRATUM: cell atom carries a stratum string outside the
#   spec'd {asserted, saturated, settled} set.
# - PCC_MISSING_WITNESS: a saturated/settled atom is missing required
#   derived_from/derived_via fields, OR respond.py cannot recover a
#   premise's witness cell-id when emitting a saturated atom.
# - PCC_MISSING_STRATUM and PCC_STRATUM_MONOTONICITY_FAIL: reserved for
#   v0.2 settled-stratum work (Δ-pass): emission without a stratum tag,
#   and σ-pass derivations that would lower a higher-stratum cell.
PCC_UNKNOWN_STRATUM = "PCC_UNKNOWN_STRATUM"
PCC_MISSING_WITNESS = "PCC_MISSING_WITNESS"
PCC_MISSING_STRATUM = "PCC_MISSING_STRATUM"
PCC_STRATUM_MONOTONICITY_FAIL = "PCC_STRATUM_MONOTONICITY_FAIL"
# Presheaf-projection consistency — per specs/filesystem/presheaf-storage.md
# §8 + §10 + specs/conformance-vectors.md §11.7.
# - PCC_PROJECTION_DIVERGED: a materialised projection file's contents
#   disagree with a fresh re-projection from the event log (cache
#   corruption or implementation bug; surfaced at startup recovery).
# - PCC_PROJECTION_UNKNOWN_INDEX: read requested a projection along an
#   index name not specified in presheaf-storage.md §2 (e.g. an unknown
#   stratum string in by-stratum/).
# - PCC_PROJECTION_AT_FUTURE_ORD: read requested a projection at an
#   event-ordinal cursor greater than the current log height.
PCC_PROJECTION_DIVERGED = "PCC_PROJECTION_DIVERGED"
PCC_PROJECTION_UNKNOWN_INDEX = "PCC_PROJECTION_UNKNOWN_INDEX"
PCC_PROJECTION_AT_FUTURE_ORD = "PCC_PROJECTION_AT_FUTURE_ORD"

# Closure rule
PCR_PREMISE_INVALID = "PCR_PREMISE_INVALID"
PCR_CONCLUSION_INVALID = "PCR_CONCLUSION_INVALID"
PCR_RULE_RETIRED = "PCR_RULE_RETIRED"
PCR_NO_MATCH = "PCR_NO_MATCH"
# σ/Δ pass codes — per ``specs/kernel/sigma-delta-passes.md`` §4 and §5.
# - PCR_DELTA_STABILIZED: a Δ-pass cell-level stabilization that produced
#   a new "settled" cell (repair-log entry, not a hard error).
# - PCR_DELTA_NO_MOVEMENT: Δ-pass examined a cell and found it already at
#   bilattice fixed point; no "settled" cell emitted (repair-log entry).
# - PCR_BILATTICE_DIVERGED: a single cell's Δ-stabilization exceeded
#   ``delta_fuel`` substeps — bounded-bilattice property failed.
# - PCR_SIGMA_FUEL_EXCEEDED: σ-pass exhausted its sigma-fuel before
#   reaching a fixed point (partial saturated state preserved).
# - PCR_SIGMA_CYCLE: σ-pass detected a self-justifying conclusion.
# - PCR_SIGMA_DELTA_DIVERGED: σ↔Δ outer-fuel alternation exceeded its
#   bound (partial state preserved).
PCR_DELTA_STABILIZED = "PCR_DELTA_STABILIZED"
PCR_DELTA_NO_MOVEMENT = "PCR_DELTA_NO_MOVEMENT"
PCR_BILATTICE_DIVERGED = "PCR_BILATTICE_DIVERGED"
PCR_SIGMA_FUEL_EXCEEDED = "PCR_SIGMA_FUEL_EXCEEDED"
PCR_SIGMA_CYCLE = "PCR_SIGMA_CYCLE"
PCR_SIGMA_DELTA_DIVERGED = "PCR_SIGMA_DELTA_DIVERGED"

# Message / respond
PCM_TARGET_INVALID = "PCM_TARGET_INVALID"
PCM_SENDER_UNAUTHORIZED = "PCM_SENDER_UNAUTHORIZED"
PCM_PAYLOAD_INVALID = "PCM_PAYLOAD_INVALID"
PCM_PAYLOAD_REJECTED = "PCM_PAYLOAD_REJECTED"
PCM_AUTH_FAILED = "PCM_AUTH_FAILED"
PCM_SESSION_CLOSED = "PCM_SESSION_CLOSED"
PCM_RUNLEVEL_INVALID = "PCM_RUNLEVEL_INVALID"
# Phase-marker repair-log entry kind — variants are the strings
# "sigma-start" / "delta-start" / "sigma-delta-iter" per
# ``specs/kernel/sigma-delta-passes.md`` §5.
PCM_RESPOND_PHASE = "PCM_RESPOND_PHASE"

# Storage
PCS_LOG_TAMPER = "PCS_LOG_TAMPER"
PCS_HASH_CHAIN_BROKEN = "PCS_HASH_CHAIN_BROKEN"
PCS_RECORD_NOT_FOUND = "PCS_RECORD_NOT_FOUND"
PCS_RECORD_CORRUPT = "PCS_RECORD_CORRUPT"
PCS_GENESIS_MISSING = "PCS_GENESIS_MISSING"
PCS_ROOT_UNWRITABLE = "PCS_ROOT_UNWRITABLE"

# Runtime
PCH_NOT_READY = "PCH_NOT_READY"
PCH_DEGRADED = "PCH_DEGRADED"
PCH_DRAINING = "PCH_DRAINING"
PCH_HEARTBEAT_STALL = "PCH_HEARTBEAT_STALL"
PCH_BOOT_FAILED = "PCH_BOOT_FAILED"

# Algebra
PCA_ADJUNCTION_VIOLATION = "PCA_ADJUNCTION_VIOLATION"
PCA_VALUE_INVALID = "PCA_VALUE_INVALID"
# Capability scope insufficient — sender lacks the required capability
# string against the action's target. Per
# ``specs/security/capability-model.md`` §8 and
# ``specs/process/inter-session-messaging.md`` §9.
PCA_SCOPE_INSUFFICIENT = "PCA_SCOPE_INSUFFICIENT"

# Inter-session messaging — per
# ``specs/process/inter-session-messaging.md`` §9. The PCS_MESSAGE_*
# codes are namespaced under PCS (storage) because the spec authors a
# session-message as a substrate cell record (a storage-shaped object)
# rather than a runtime control message.
PCS_MESSAGE_TYPE_UNKNOWN = "PCS_MESSAGE_TYPE_UNKNOWN"
PCS_MESSAGE_RECIPIENT_INVALID = "PCS_MESSAGE_RECIPIENT_INVALID"
PCS_MESSAGE_RECIPIENT_CLOSED = "PCS_MESSAGE_RECIPIENT_CLOSED"
PCS_MESSAGE_RESPONDS_TO_INVALID = "PCS_MESSAGE_RESPONDS_TO_INVALID"

# Regime / authorization / inconsistency / cost — v0.2 theorem-grounded
# subsystems (per library/.../predicated-computing/theorems/ ).
#
# - PCC_REGIME_MISMATCH: a RegimeRecord's declared regime disagrees
#   with what (rule_language_fragment, base_finiteness) supports per
#   rule-language-realizability-determines-regime; OR closure-ordinal
#   bound out of regime range; OR a regime-incompatible discipline
#   declaration (e.g. aperiodic + finite-per-cascade fuel).
# - PCC_AUTHZ_DENIED: a Box_R evaluation along the substrate's
#   accessibility relation R produced a non-TRUE value. RETAINED FOR
#   WIRE COMPATIBILITY ONLY — per t02-41 and
#   decisions/capability-not-acl.md, the substrate no longer raises on
#   insufficient authority. Restriction is algebraic: the AuthzGatePhase
#   records the decision on RespondResult.authz_decision and the
#   pipeline short-circuits with no event/cell emitted. Drivers
#   translating substrate outcomes onto wire protocols (HTTP, MCP,
#   federation) MAY still use this code to signal denial to peers
#   that expect an exceptional shape.
# - PCC_INCONSISTENCY_DETECTED: knowledge-join produced ⊤ from two
#   non-⊤ inputs; an InconsistencyWitness was emitted to the
#   inconsistency-sheaf record per audit-content-via-inconsistency-sheaf-cohomology.
#   Surfaced as a structured outcome on RespondResult, not raised — the
#   substrate's response to contradiction is to RECORD it, not to fail.
# - PCC_COST_EXCEEDED: a cost composition exceeded a declared budget
#   per cost-composition-via-lawvere-quantale.
# - PCC_QUANTALE_INVALID: a CostCell carries a quantale tag foreign to
#   the active substrate quantale (per the theorem's "quantale switching
#   mid-composition" prohibition).
PCC_REGIME_MISMATCH = "PCC_REGIME_MISMATCH"
PCC_AUTHZ_DENIED = "PCC_AUTHZ_DENIED"
PCC_INCONSISTENCY_DETECTED = "PCC_INCONSISTENCY_DETECTED"
PCC_COST_EXCEEDED = "PCC_COST_EXCEEDED"
PCC_QUANTALE_INVALID = "PCC_QUANTALE_INVALID"

# Evidence / driver
PCE_DRIVER_UNAVAILABLE = "PCE_DRIVER_UNAVAILABLE"
PCE_EVIDENCE_INVALID = "PCE_EVIDENCE_INVALID"

# Compaction — placeholder codes registered alongside the draft
# specs/kernel/compaction.md (status: draft). The compaction
# discipline is currently blocked pending the captain disposition
# of surveys/compaction-grounding-2026-05-03.md (secondary theory's
# log-rewriting cosettling-equivalence-class compaction diverges
# from the dev-doc draft's append-summary-event compaction). These
# codes are not yet emitted from any code path; their semantics
# will be revised against the ratified design.
# - PCC_COMPACT_GAP / _OVERLAP / _FUTURE / _TAIL_MISMATCH: malformed
#   compact event envelope (tile-without-gap discipline, future-ord,
#   tail-id mismatch).
# - PCC_COMPACT_SUMMARY_INCOMPLETE / _NON_LATEST / _ROOT_DIVERGED:
#   summary_cells body discipline failures.
# - PCC_COMPACT_REPLAY_DIVERGED: byte-identical replay invariant
#   broken between from-genesis walk and compact-seeded walk.
PCC_COMPACT_GAP = "PCC_COMPACT_GAP"
PCC_COMPACT_OVERLAP = "PCC_COMPACT_OVERLAP"
PCC_COMPACT_FUTURE = "PCC_COMPACT_FUTURE"
PCC_COMPACT_TAIL_MISMATCH = "PCC_COMPACT_TAIL_MISMATCH"
PCC_COMPACT_SUMMARY_INCOMPLETE = "PCC_COMPACT_SUMMARY_INCOMPLETE"
PCC_COMPACT_SUMMARY_NON_LATEST = "PCC_COMPACT_SUMMARY_NON_LATEST"
PCC_COMPACT_SUMMARY_ROOT_DIVERGED = "PCC_COMPACT_SUMMARY_ROOT_DIVERGED"
PCC_COMPACT_REPLAY_DIVERGED = "PCC_COMPACT_REPLAY_DIVERGED"

# Boundary / identity — see specs/security/user-as-boundary.md §7.
# - PCB_BOUNDARY_SCHEME_DIVERGED: a re-boot found a migrated personnel
#   record whose recorded boundary-scheme version disagrees with the
#   current code's BOUNDARY_SCHEME_VERSION. Per pt-08, the migration is
#   a deterministic function of (legacy personnel set, boundary scheme
#   version); a divergence means the on-disk migration cannot be
#   replayed bit-identically by the running code, and boot transitions
#   to degraded rather than silently re-deriving against the new scheme.
PCB_BOUNDARY_NOT_FOUND = "PCB_BOUNDARY_NOT_FOUND"
PCB_BOUNDARY_INACTIVE = "PCB_BOUNDARY_INACTIVE"
PCB_PROJECTION_UNKNOWN = "PCB_PROJECTION_UNKNOWN"
PCB_PROJECTION_NOT_AUTHORISED = "PCB_PROJECTION_NOT_AUTHORISED"
PCB_PRIVACY_PROJECTION_VIOLATION = "PCB_PRIVACY_PROJECTION_VIOLATION"
PCB_BOUNDARY_COMPOSITION_AMPLIFIES = "PCB_BOUNDARY_COMPOSITION_AMPLIFIES"
PCB_BOUNDARY_SCHEME_DIVERGED = "PCB_BOUNDARY_SCHEME_DIVERGED"


class SubstrateError(Exception):
    """Base class for substrate-raised errors carrying a stable code."""

    def __init__(self, code: str, message: str = "", **details):
        super().__init__(f"[{code}] {message}" if message else f"[{code}]")
        self.code = code
        self.message = message
        self.details = details

    def to_dict(self) -> dict:
        out = {"code": self.code, "message": self.message}
        if self.details:
            out["details"] = self.details
        return out
