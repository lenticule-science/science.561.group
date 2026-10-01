import ObsmetrologiaManual.DocSetup
import ObsmetrologiaComputing.CausalityPacket

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching page for causality packets as boundary presentations of causal
carrier readouts.
-/

#doc (Manual) "Causality packets" =>

# Causality Packets

This page carries the packet/readout claim-site at the computing surface.

* claim-site: a packet as a boundary presentation of a causal carrier readout;
* phase: computing after causal settling and site support have been generated;
* generating sites: finite causal sets, cone geometry, and the bitopological
  settling site;
* downstream uses: program surfaces, endpoint readouts, Hoare programs, and
  runtime admission logs;
* Lean carrier: {name Computing.CausalCarrierReadout}`Computing.CausalCarrierReadout`
  and {name Computing.CausalityPacket}`Computing.CausalityPacket`;
* Blueprint nodes: `def:causal-carrier-readout`,
  `thm:causality-packet-boundary-presentation`, and
  `thm:causality-packet-reaches-trans`;
* provenance: the causal-carrier note on generated endpoint readouts;
* familiar comparison: a network packet or event packet;
* reader closure: the packet is a presentation of the carrier, not the carrier
  itself;
* frontier status: generated endpoint readouts and packet/log/form equality are
  not yet bundled as one endpoint category.

The governing sentence is:

> A causality packet is a boundary presentation of a causal carrier readout.

## The Carrier

The causal carrier readout is:

{docstring Computing.CausalCarrierReadout}

It carries finite causal support, observable site support, and a boundary
presentation value. The causal laws come from the causal support:

{docstring Computing.CausalCarrierReadout.reaches_trans}

{docstring Computing.CausalCarrierReadout.reaches_irrefl}

Checked:

```lean
example {E Q Boundary : Type}
    (R : Computing.CausalCarrierReadout E Q Boundary)
    {a b c : E}
    (h1 : R.Reaches a b) (h2 : R.Reaches b c) :
    R.Reaches a c :=
  R.reaches_trans h1 h2
```

This is why the carrier is not just a payload. Its causality is inherited from
the finite causal set and its site support, not from a transport envelope.

## The Packet

The packet is:

{docstring Computing.CausalityPacket}

It is checked as a boundary presentation:

{docstring Computing.causalityPacket_is_boundary_presentation}

Checked:

```lean
example {E Q Boundary : Type}
    {R : Computing.CausalCarrierReadout E Q Boundary}
    (packet : Computing.CausalityPacket R) :
    packet.presentation = R.boundaryPresentation :=
  Computing.causalityPacket_is_boundary_presentation packet
```

The packet therefore presents a carrier. It does not erase the causal support,
observable site support, or boundary law into an untyped blob.

## Inherited Causality

The packet carries causal composition only through the carrier:

{docstring Computing.causalityPacket_reaches_trans}

Checked:

```lean
example {E Q Boundary : Type}
    {R : Computing.CausalCarrierReadout E Q Boundary}
    (packet : Computing.CausalityPacket R)
    {a b c : E}
    (h1 : R.Reaches a b) (h2 : R.Reaches b c) :
    R.Reaches a c :=
  Computing.causalityPacket_reaches_trans packet h1 h2
```

This settles the narrow term. A "causality packet" is lawful only when it is a
boundary presentation of an already-generated causal carrier readout.

## Frontier Status

The Lean surface now separates carrier from packet. It does not yet prove the
larger endpoint category sketched in the note: generated endpoint readouts,
carrier readouts, packet/form/log presentations, composition handles, and
runtime witness logs as one bundled category.
