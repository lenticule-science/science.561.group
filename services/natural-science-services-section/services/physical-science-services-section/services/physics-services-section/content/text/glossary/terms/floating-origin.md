---
name: Floating origin
date-created: 2026-10-10
---

A **floating origin** is the technique of re-centring a simulation's coordinate origin on the camera or active object, so that coordinates near the player stay small and single-precision floats keep sub-millimetre spacing. IEEE single precision carries 24 significant bits: at 600 km from the origin its spacing is about 6 cm, and at interplanetary distances kilometres. Kerbal Space Program combines a floating origin with "Krakensbane" (subtracting the active vessel's velocity from the frame) over Unity's single-precision physics, and the seams between that domain and the double-precision planetary positions are a known source of phantom forces ("the Kraken"). The modern alternatives are 64-bit world coordinates throughout (Unreal Engine 5's Large World Coordinates), camera-relative rendering, and a hierarchy of frames — a body-fixed frame per celestial body and a local frame per vessel — so a pose is always a frame plus a small offset.

See the [note on integrators, coordinates and joints](../../documents/articles/notes/2026/10/10/2026-10-10-note-on-integrators-coordinates-and-joints-for-a-spaceflight-game.md).
