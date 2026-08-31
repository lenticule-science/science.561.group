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
---

## Consolidated material from okaga-bridge-center.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "center"
description: "The center of the Okaga's bridge, presumably where the captain would stand — directly under the sole light in the room (an off-white hemisphere embedded in the deckhead) with most instruments accessible from here."
visual-description: "The center of the room, presumably where the ship's captain would stand, is directly under the sole light in the room, an off-white hemisphere embedded in the deckhead. Most of the instruments would be accessible from here."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-consoles.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "consoles"
description: "The two consoles in the center of the Okaga's bridge — held up by thick posts of dull gray metal, surfaces textured with verdigris, covered in analog dials and brass levers and wheels."
visual-description: "The consoles in the center of the room are held up by thick posts made of dull gray metal. On their surface, textured with verdigris, there are a variety of instruments for, presumably, monitoring and controlling the craft."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-stars.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "stars"
description: "The view of stars through the Okaga's bridge window — too abundant to make sense of, the background coalescing into a field as dense as static."
visual-description: "The stars outside the window are too abundant to make much sense of: while at a glance a few stars seem to be distinctive, the background quickly coalesces into a field of stars, as dense as static: there is no place uninfluenced by the twinkle."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-instruments.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "instruments"
description: "Analog dials, brass levers, and brass wheels covering the face of the bridge consoles — most shiny from use, with deep patina over the untouched parts."
visual-description: "The face of the console is covered in analog dials of various sizes, and a variety of brass levers and wheels rise up. Most are shiny from use, though hold a deep petina over the untouched parts."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-window.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "window"
description: "The fore-window on the Okaga's bridge — covers almost the whole width of that section of the hull, paneled with very thick glass that distorts the view around the edges."
visual-description: "The window to fore, which covers almost the whole width of that section of the hull, provides a view of space: a vast rainbow static."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-ship.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "ship"
description: "The Okaga, viewed from inside the bridge — fixtures make it clear this is a ship; the type is revealed only by the view out the front window: a cavalcade of stars."
visual-description: "The fixtures of the room make it clear this is a ship. What sort is revealed only by the view out the front window: a cavalcade of stars."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-glass.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "glass"
description: "The glass that fills the bridge window — very thick, distorting the view around the edges rather severely."
visual-description: "The glass that fills the window is very thick, and appears to distort the view around the edges rather severely."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-fixtures.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "fixtures"
description: "The fixtures of the bridge — they make its purpose clear: this is the place for operating a ship."
visual-description: "The fixtures of this room make its purpose clear: it is the place for operating a ship."
behaviors: [lookable]
located-in: bridge
```

## Consolidated material from okaga-bridge-fore-hull.md

Structured claims from source frontmatter:

```yaml
type: thing
name: "fore hull"
description: "The fore section of the Okaga's hull, with a large window embedded in it."
visual-description: "To the fore is the hull of the ship, which has a large window embedded in it."
behaviors: [lookable]
located-in: bridge
```
