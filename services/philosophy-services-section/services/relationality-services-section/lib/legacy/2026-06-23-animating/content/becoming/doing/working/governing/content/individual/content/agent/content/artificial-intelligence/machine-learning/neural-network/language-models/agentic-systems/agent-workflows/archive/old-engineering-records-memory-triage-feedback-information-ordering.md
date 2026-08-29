---
name: feedback_information-ordering
description: Content should appear immediately before its first dependent, not immediately after its dependencies or at the top of the hierarchy
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Information should be presented immediately before its first dependent, NOT immediately after its dependencies and NOT at the very top of the hierarchy.

Example: we don't need to define MASH at the top of our records. We introduce it at the point where more specific things (like the context-injector, or the agent dispatch system) need it in order to make sense.

**Why:** The user described this as their specific idea of "clean" information architecture. It ties into the virtual environment concept — in a MUD, you discover concepts when you encounter them, not from a top-level index. This is also how the depth filtration works: things exist at the depth where they first become necessary, not at the shallowest possible level.

**How to apply:** When organizing records, don't front-load abstract concepts. Place them at the point where their first concrete dependent appears. This means the ordering of records is driven by what-needs-what, not by abstraction level. At some point this principle should help us find the "right" context for any piece of information automatically.
