//! # mash-library
//!
//! OQRA-structured content over the `mash-engine` substrate.
//!
//! The engine is ontology-neutral — claims, fibers, morphisms, derivation
//! without commitment to what subjects, predicates, or objects *mean*.
//! The library is where meaning is constructed, via the four ontological
//! primitives documented in the research library:
//!
//! - **Object** — what is constituted (Aristotle's substance; the intrinsic abstract)
//! - **Quality** — what can be said of objects (Aristotle's *poiotes*; the predicate-face)
//! - **Relation** — connection and constraint (Aristotle's *pros ti*; Whitehead's prehension)
//! - **Act** — generation and settlement (Aristotle's *energeia*; Whitehead's actual occasion)
//!
//! A **thing** is the composite: an object with qualities, standing in
//! relations, capable of acts. Everything in this library — from a room
//! in the MUD to an office in the ship's charter — is a thing, expressed
//! through OQRA predication and carried by the engine's five morphisms
//! (specialization, inversion, composition, fusion, implication).
//!
//! The framing discipline is Wiener/Barad, not Shannon/Turing: a thing
//! IS its pattern of settled claims, not an object that has properties;
//! acts emerge from relational intra-action, not method dispatch; the
//! substrate settles rather than transforming encoded symbols.
//!
//! ## Modules
//!
//! - [`foundation`] — OQRA vocabulary: THING/OBJECT/QUALITY/RELATION/ACT
//!   terms, relator predicates, morphism triggers, witnessing primitives.
//! - [`container`] — container specialization, membership (contains /
//!   excludes-from as algebraic-negation pair), cardinality, naming,
//!   and description qualities.
//! - [`space`] — spatial dimension: rooms (specializing container),
//!   exits, directions and opposite-pairs, aliases.
//! - [`presence`] — session, effector, avatar, and the binding
//!   predicates that make a person present in the world.
//! - [`ops`] — operations / functions / results: the instruction-set
//!   the cascade (proof-engine-as-CPU) consumes.
//! - [`dispatch`] — picks which operations to feed the CPU next via
//!   candidate-subject admission cascade. First-pass admission chain
//!   (op-ready ∧ performer-available → admissible) + one undercut
//!   (capability mismatch). Full 8-stage chain from old-library is
//!   future work.
//! - [`offices`] — offices, charter, Hohfeldian deontic structure,
//!   directive hierarchy (rule/guideline/preference/instruction),
//!   ship/confederacy commissioning. The operational bridge from
//!   duty to op-minting is future work.
//! - [`movement`] — movement as an operation; direction/exit/source/
//!   destination predicates; containment swap via CONTAINS double-
//!   inversion from the container module.
//! - [`perception`] — perception (looking, describing) as an
//!   operation; intent pair (looks-at + reports-to), rendering
//!   predicates.
//! - [`conduit`] — protocol-facing vocabulary: request routing,
//!   surface-ready body delivery. Actual TCP/IRC/stdio subprocess
//!   binaries are deferred port-level work.
//! - [`teraum`] — minimal reference scene (three rooms, exits, spawn
//!   declaration) demonstrating the full library stack composes into
//!   bootable content.

#![warn(missing_docs)]

// Organized modules (target layout — being populated by the V3 reorg).
pub mod cognition;
pub mod discourse;
pub mod execution;
pub mod foundation;
pub mod governance;
pub mod language;
pub mod networking;
pub mod operation;
pub mod projection;
pub mod storage;
pub mod testing;
pub mod time;

// Legacy root-level modules (migrating under V3 — each will move to
// a subdirectory as its cluster is processed).
pub mod container;
pub mod movement;
pub mod mud;
pub mod perception;
pub mod planning;
pub mod presence;
pub mod space;
pub mod teraum;
