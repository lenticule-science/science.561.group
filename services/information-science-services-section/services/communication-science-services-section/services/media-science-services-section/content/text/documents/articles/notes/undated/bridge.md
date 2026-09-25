---
type: place
name: "bridge"
description: "The bridge of the Okaga — two consoles of analog dials peppered with brass wheels and levers flank the room's center, angled to form an open arrow pointing to the bow's window. Ikmu the calico cat lives here."
visual-description: "This is the bridge of a ship. Two consoles of analog dials, peppered with brass wheels and levers, flank the center of the room, angled slightly to form an open arrow pointing to the ship's bow, where there is a window paneled with thick glass. From here, open doors lead starboard, to the airlock, and port, to the quarters. A door aft leads to a passageway."
behaviors: [area, noisy]
contents: [okaga-bridge-ship, okaga-bridge-consoles, okaga-bridge-instruments, okaga-bridge-center, okaga-bridge-fore-hull, okaga-bridge-window, okaga-bridge-glass, okaga-bridge-stars, okaga-bridge-fixtures, ikmu]
in-region: okaga
exits:
  starboard: airlock
  port: quarters
  aft: fore-passageway
noises:
  - [1, "A few dials on the consoles slowly twist and settle into new positions."]
title: bridge
---
