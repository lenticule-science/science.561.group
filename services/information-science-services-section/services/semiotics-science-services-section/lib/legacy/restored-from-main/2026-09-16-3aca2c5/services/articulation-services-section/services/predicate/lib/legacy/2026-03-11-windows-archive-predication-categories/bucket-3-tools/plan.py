#!/usr/bin/env python3
"""
Planner: read the math-edge graph and surface research demands.

Where the validator asks "is what we have correct?" and the builder asks
"how do we render what we have?", the planner asks "what does what we
have demand we write next?". It applies rules of *demand* and
*enablement* to the frontmatter graph and emits a research-direction
report — flags for the mathematician to consider, not directives.

Output: tools/build/research-program.md, regenerated each run.

Sections of the report:

  - Question readiness — each open question classified by the maturity
    of its `explores:` entities: answerable now, blocked on sketches /
    loose entities, or needing new construction.
  - Question clusters — connected components of the open-question graph
    where edges are shared not-firm explored entities. Multi-question
    components are roadmap "spines"; singletons are independent
    questions in the "fan."
  - Enablement frontier — entities explored by open questions but
    loosely characterized; adding theorems on these unblocks the listed
    questions. Sorted by unblock-count.
  - Demand clusters — entities shared across multiple open questions,
    leverage-weighted so not-firm bottlenecks rank above firm ones.
  - Shape-shift candidates — concepts heavily targeted by open
    questions, possibly wanting promotion to object/morphism or split.
  - Possible unnamed common ancestors — pairs of open questions whose
    `explores:` sets overlap moderately, suggesting a missing entity
    that would unify them.
  - Loose concepts — concepts defined but with no proven theorem about
    them; either intentionally primitive, or implicit demand.

The graph proposes; the mathematician disposes.
"""
from __future__ import annotations

import re
import sys
from collections import defaultdict
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
LIB_DIRS = ["concepts", "objects", "morphisms", "theorems",
            "examples", "narratives", "questions", "references"]

FM_RE = re.compile(r"\A---\n(.*?)\n---\n(.*)\Z", re.DOTALL)
LINK_RE = re.compile(
    r"\[[^\]]+\]\((?:\.\./[a-z]+/)?([A-Za-z0-9\-]+)\.md(?:#[A-Za-z0-9\-]+)?\)"
)

# Frontmatter relations that count as outgoing edges in the math-edge graph.
REL_KEYS = ("depends-on", "introduces", "recaps", "discusses",
            "instantiates", "see-also", "realizes", "closes",
            "chapters", "explores")


# ---------------------------------------------------------------- corpus IO

def load_corpus() -> dict[str, dict]:
    notes: dict[str, dict] = {}
    for d in LIB_DIRS:
        for p in (ROOT / d).glob("*.md"):
            if p.name == "README.md":
                continue
            text = p.read_text()
            m = FM_RE.match(text)
            if not m:
                continue
            try:
                fm = yaml.safe_load(m.group(1)) or {}
            except yaml.YAMLError:
                continue
            slug = p.stem
            notes[slug] = {
                "slug": slug,
                "dir": d,
                "kind": fm.get("kind", d.rstrip("s")),
                "fm": fm,
                "body": m.group(2),
                "path": p,
            }
    return notes


# ------------------------------------------------------------------- graph

def out_edges(note: dict) -> set[str]:
    """All slugs this note points to via frontmatter relations + body links."""
    edges: set[str] = set()
    for k in REL_KEYS:
        v = note["fm"].get(k)
        if isinstance(v, list):
            edges.update(v)
        elif isinstance(v, str):
            edges.add(v)
    edges.update(LINK_RE.findall(note["body"]))
    return edges


def in_edges_index(notes: dict[str, dict]) -> dict[str, set[str]]:
    """slug → set of slugs that point to it."""
    idx: dict[str, set[str]] = defaultdict(set)
    for s, n in notes.items():
        for tgt in out_edges(n):
            if tgt in notes:
                idx[tgt].add(s)
    return idx


def open_questions(notes: dict[str, dict]) -> list[str]:
    return [s for s, n in notes.items()
            if n["kind"] == "question"
            and n["fm"].get("status") in (None, "open", "partial")]


def proven_theorems_about(slug: str, notes: dict[str, dict],
                          idx: dict[str, set[str]]) -> int:
    """Count of `status: proved` theorems pointing at slug."""
    count = 0
    for s in idx.get(slug, ()):
        n = notes[s]
        if n["kind"] in ("theorem", "lemma", "proposition", "corollary") \
                and n["fm"].get("status") == "proved":
            count += 1
    return count


# ----------------------------------------------------------------- analyses

def find_enablement_frontier(notes, idx) -> list[tuple[str, dict]]:
    """Entities explored by open questions but with few characterizing
    theorems. Returns (slug, {questions, characterizing_theorems}) sorted
    by question-count descending."""
    demands: dict[str, dict] = {}
    for q in open_questions(notes):
        for ent in (notes[q]["fm"].get("explores") or []):
            if ent not in notes:
                continue
            char = proven_theorems_about(ent, notes, idx)
            d = demands.setdefault(ent, {"questions": [], "characterizing_theorems": char})
            d["questions"].append(q)
    # Frontier = demands sorted by unblock-effect (question count), filtered to
    # those with relatively few characterizing theorems (< 3).
    frontier = [(e, d) for e, d in demands.items()
                if d["characterizing_theorems"] < 3]
    frontier.sort(key=lambda x: (-len(x[1]["questions"]), x[1]["characterizing_theorems"]))
    return frontier


def entity_firmness(slug: str, notes: dict, idx: dict) -> str:
    """Classify an entity's maturity:
      - "missing": no note for the slug.
      - "sketch": a theorem-kind note at non-proved status.
      - "loose": a definition / concept / morphism with no proven
        theorem characterizing it.
      - "firm": everything else (proved theorems, well-anchored
        definitions, etc.).
    """
    if slug not in notes:
        return "missing"
    n = notes[slug]
    if n["kind"] in ("theorem", "lemma", "proposition", "corollary"):
        return "firm" if n["fm"].get("status") == "proved" else "sketch"
    if n["kind"] in ("definition", "concept", "morphism"):
        return "firm" if proven_theorems_about(slug, notes, idx) >= 1 else "loose"
    return "firm"


def question_blockers(q_slug: str, notes: dict, idx: dict) -> dict:
    """Per-question classification of explored entities by firmness.
    Returns dict with keys firm / sketch / loose / missing, each a list
    of entity slugs (sketch entries carry the entity's status as a tuple)."""
    explored = notes[q_slug]["fm"].get("explores") or []
    out = {"firm": [], "sketch": [], "loose": [], "missing": []}
    for ent in explored:
        firmness = entity_firmness(ent, notes, idx)
        if firmness == "sketch":
            out["sketch"].append((ent, notes[ent]["fm"].get("status") or "open"))
        elif firmness == "missing":
            out["missing"].append(ent)
        elif firmness == "loose":
            out["loose"].append(ent)
        else:
            out["firm"].append(ent)
    return out


def question_readiness(blockers: dict) -> str:
    """Reduce a question's blocker classification to a readiness tier."""
    if blockers["missing"]:
        return "needs-construction"
    if blockers["sketch"] or blockers["loose"]:
        return "blocked"
    if blockers["firm"]:
        return "answerable"
    return "unanchored"


def find_question_readiness_view(notes, idx) -> dict[str, list]:
    """Open questions grouped by readiness tier, with their blocker
    classifications."""
    tiers = {"answerable": [], "blocked": [], "needs-construction": [], "unanchored": []}
    for q in open_questions(notes):
        b = question_blockers(q, notes, idx)
        tiers[question_readiness(b)].append((q, b))
    for tier in tiers.values():
        tier.sort(key=lambda x: x[0])
    return tiers


def find_question_clusters(notes, idx) -> list[dict]:
    """Connected components of the open-question graph where two
    questions are linked iff they share a not-firm explored entity.
    Multi-question components are "spines" — clusters of questions whose
    progress is gated by the same upstream work. Singletons are
    independent questions in the parallel "fan"."""
    open_q = open_questions(notes)
    q_blockers: dict[str, set[str]] = {}
    for q in open_q:
        b = question_blockers(q, notes, idx)
        non_firm: set[str] = set()
        non_firm.update(e for e, _ in b["sketch"])
        non_firm.update(b["loose"])
        non_firm.update(b["missing"])
        q_blockers[q] = non_firm

    # Union-find: union any two questions sharing a non-firm blocker.
    parent: dict[str, str] = {q: q for q in open_q}

    def find(x: str) -> str:
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    def union(a: str, b: str) -> None:
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[ra] = rb

    blocker_to_qs: dict[str, list[str]] = defaultdict(list)
    for q, blockers in q_blockers.items():
        for b in blockers:
            blocker_to_qs[b].append(q)
    for qs in blocker_to_qs.values():
        for i in range(1, len(qs)):
            union(qs[0], qs[i])

    components: dict[str, set[str]] = defaultdict(set)
    for q in open_q:
        components[find(q)].add(q)

    out = []
    for comp in components.values():
        # Blockers internal to this component (shared by ≥2 of its members)
        shared = []
        for b, qs in blocker_to_qs.items():
            qs_in_comp = [q for q in qs if q in comp]
            if len(qs_in_comp) >= 2:
                shared.append((b, set(qs_in_comp)))
        shared.sort(key=lambda x: (-len(x[1]), x[0]))
        out.append({"questions": comp, "shared_blockers": shared})
    out.sort(key=lambda c: (-len(c["questions"]), sorted(c["questions"])[0]))
    return out


def find_demand_clusters(notes, idx) -> list[tuple[str, set[str], str, float]]:
    """Entities shared across multiple open questions, leverage-weighted.

    A bottleneck's leverage = (questions exploring it) × firmness-weight,
    where firmness-weight is 1.0 for not-firm entities (resolving them
    actually unblocks work) and 0.3 for firm entities (already resolved,
    so the shared dependency is informational rather than a blocker).
    Sorts by leverage descending, then by raw question count.
    """
    shared: dict[str, set[str]] = defaultdict(set)
    for q in open_questions(notes):
        for e in (notes[q]["fm"].get("explores") or []):
            shared[e].add(q)
    bottlenecks = []
    for e, qs in shared.items():
        if len(qs) < 2:
            continue
        firmness = entity_firmness(e, notes, idx)
        weight = 1.0 if firmness != "firm" else 0.3
        leverage = len(qs) * weight
        bottlenecks.append((e, qs, firmness, leverage))
    bottlenecks.sort(key=lambda x: (-x[3], -len(x[1]), x[0]))
    return bottlenecks


def realizers_index(notes) -> dict[str, list[str]]:
    """slug → list of slugs that ground this slug concretely.
    Two relations count as grounding:
      - objects/morphisms declaring `realizes: [..., slug, ...]` — the
        convention's bridge between concepts (roles) and structural realizers.
      - examples declaring `instantiates: [..., slug, ...]` — concrete
        instances of the concept/object. Examples-instantiating is the
        natural form of grounding for property-like concepts (regime
        classifications, syntactic schemas) that don't have structural
        realizers in the realizes-sense.
    """
    idx: dict[str, list[str]] = defaultdict(list)
    for s, n in notes.items():
        if n["kind"] in ("definition", "morphism"):
            rs = n["fm"].get("realizes") or []
        elif n["kind"] == "example":
            rs = n["fm"].get("instantiates") or []
        else:
            continue
        if isinstance(rs, str):
            rs = [rs]
        for r in rs:
            idx[r].append(s)
    return idx


def find_realization_gaps(notes) -> dict:
    """Audit the concept↔realization linkage:
      - concepts with no realizers: roles not yet realized in the corpus
      - objects/morphisms with no `realizes:`: constructions without a declared
        conceptual role
    """
    realizers = realizers_index(notes)
    unrealized_concepts = [s for s, n in notes.items()
                           if n["kind"] == "concept"
                           and not realizers.get(s)]
    unanchored_constructions = [
        s for s, n in notes.items()
        if n["kind"] in ("definition", "morphism")
        and not (n["fm"].get("realizes") or [])
    ]
    multi_realized = [(s, realizers[s]) for s in realizers
                      if len(realizers[s]) >= 2 and notes.get(s, {}).get("kind") == "concept"]
    return {
        "unrealized_concepts": sorted(unrealized_concepts),
        "unanchored_constructions": sorted(unanchored_constructions),
        "multi_realized": sorted(multi_realized, key=lambda x: -len(x[1])),
    }


def find_split_candidates(notes) -> list[dict]:
    """Concepts whose body describes multiple structurally-distinct moves,
    suggesting they bundle finer concepts. Heuristic: count distinct H2/H3
    section headings in the body — a concept that introduces 3+ named
    sections may be carrying multiple roles. Long slugs and long deps
    chains alone are noisy (a long compound name can encode precise math
    without indicating split-worthiness)."""
    section_re = re.compile(r"^##+ \S", re.MULTILINE)
    candidates = []
    for s, n in notes.items():
        if n["kind"] != "concept":
            continue
        sections = section_re.findall(n["body"])
        deps = (n["fm"].get("depends-on") or [])
        # Trigger only when there are MANY distinct named sections AND a
        # long dep chain. Either signal alone is too weak.
        if len(sections) >= 4 and len(deps) >= 4:
            candidates.append({
                "slug": s,
                "n_sections": len(sections),
                "n_deps": len(deps),
            })
    candidates.sort(key=lambda c: (-c["n_sections"], c["slug"]))
    return candidates


def find_unnamed_ancestor_candidates(notes) -> list[tuple[str, str, set[str], float]]:
    """Pairs of open questions whose `explores:` sets overlap moderately
    (Jaccard 0.2–0.5). The intersection may be a missing entity that would
    unify the questions."""
    open_q = open_questions(notes)
    explored = {q: set(notes[q]["fm"].get("explores") or []) for q in open_q}
    candidates = []
    for i, q1 in enumerate(open_q):
        e1 = explored[q1]
        if not e1:
            continue
        for q2 in open_q[i + 1:]:
            e2 = explored[q2]
            if not e2:
                continue
            jac = len(e1 & e2) / len(e1 | e2)
            if 0.2 <= jac <= 0.5:
                candidates.append((q1, q2, e1 & e2, jac))
    candidates.sort(key=lambda x: -x[3])
    return candidates[:15]


def find_loose_concepts(notes, idx) -> tuple[list[str], list[str]]:
    """Concepts with no proven theorem about them, split into:
      - primitives: `type: entity` and similar — notional anchors, expected
        to be loose.
      - non-primitive: candidates for theorem demand.
    """
    primitives, candidates = [], []
    for s, n in notes.items():
        if n["kind"] != "concept":
            continue
        if proven_theorems_about(s, notes, idx) > 0:
            continue
        type_ = n["fm"].get("type", "")
        if type_ in ("entity", "predicate-section"):
            primitives.append(s)
        else:
            candidates.append(s)
    return sorted(primitives), sorted(candidates)


def find_load_bearing_pillars(notes, idx) -> list[tuple[str, int]]:
    """Definitions/concepts/morphisms that are depended-on by the most
    proven theorems — the program's structural pillars."""
    pillars = []
    for s, n in notes.items():
        if n["kind"] not in ("concept", "definition", "morphism"):
            continue
        # treat as definition for counting load (anything but theorems/examples)
        thm_count = proven_theorems_about(s, notes, idx)
        if thm_count >= 5:
            pillars.append((s, thm_count))
    pillars.sort(key=lambda x: (-x[1], x[0]))
    return pillars


def find_isolated_morphisms(notes, idx) -> list[str]:
    """Morphisms whose source/target objects don't have proven theorems
    relating them via this morphism. Implicit demand for connecting theorems."""
    isolated = []
    for s, n in notes.items():
        if n["kind"] != "morphism":
            continue
        thm_count = proven_theorems_about(s, notes, idx)
        if thm_count == 0:
            isolated.append(s)
    return sorted(isolated)


# ----------------------------------------------------------------- rendering

def render_report(notes, idx) -> str:
    readiness = find_question_readiness_view(notes, idx)
    qclusters = find_question_clusters(notes, idx)
    frontier = find_enablement_frontier(notes, idx)
    clusters = find_demand_clusters(notes, idx)
    realization = find_realization_gaps(notes)
    splits = find_split_candidates(notes)
    ancestors = find_unnamed_ancestor_candidates(notes)
    primitives, loose = find_loose_concepts(notes, idx)
    isolated_morphisms = find_isolated_morphisms(notes, idx)
    pillars = find_load_bearing_pillars(notes, idx)

    out = []
    out.append("# Research-program report")
    out.append("")
    out.append(
        f"Generated from the frontmatter graph of {len(notes)} notes. "
        "Each section is a flag for the mathematician to consider — not a "
        "directive. The graph proposes; the mathematician disposes."
    )
    out.append("")

    # ------------------------------------------------------------ readiness
    out.append("## Question readiness")
    out.append("")
    out.append(
        "Each open question, classified by the maturity of its `explores:` "
        "entities. *Answerable* = every explored entity is a proved theorem "
        "or a definition / concept / morphism with at least one characterizing "
        "theorem. *Blocked* = some explored entity is at sketch / draft "
        "status, or is a definition / concept / morphism with no characterizing "
        "theorems yet. *Needs construction* = some explored entity has no "
        "note in the corpus."
    )
    out.append("")
    counts = {tier: len(qs) for tier, qs in readiness.items()}
    out.append(
        f"**Tally:** {counts['answerable']} answerable · "
        f"{counts['blocked']} blocked · "
        f"{counts['needs-construction']} need new construction"
        + (f" · {counts['unanchored']} unanchored" if counts['unanchored'] else "")
        + "."
    )
    out.append("")

    if readiness["answerable"]:
        out.append("### Answerable now")
        out.append("")
        for q, _ in readiness["answerable"]:
            out.append(f"- `{q}`")
        out.append("")

    if readiness["blocked"]:
        out.append("### Blocked on sketches / loose entities")
        out.append("")
        for q, b in readiness["blocked"]:
            blockers = []
            for ent, status in b["sketch"]:
                blockers.append(f"`{ent}` ({status})")
            for ent in b["loose"]:
                blockers.append(f"`{ent}` (loose)")
            out.append(f"- **`{q}`** — blocked on: {', '.join(blockers)}")
        out.append("")

    if readiness["needs-construction"]:
        out.append("### Need new construction")
        out.append("")
        for q, b in readiness["needs-construction"]:
            missing = ", ".join(f"`{e}`" for e in b["missing"])
            other = []
            for ent, status in b["sketch"]:
                other.append(f"`{ent}` ({status})")
            for ent in b["loose"]:
                other.append(f"`{ent}` (loose)")
            line = f"- **`{q}`** — missing: {missing}"
            if other:
                line += f" · also blocked on: {', '.join(other)}"
            out.append(line)
        out.append("")

    if readiness["unanchored"]:
        out.append("### Unanchored (no `explores:`)")
        out.append("")
        for q, _ in readiness["unanchored"]:
            out.append(f"- `{q}`")
        out.append("")

    # ------------------------------------------------------------ clusters
    out.append("## Question clusters")
    out.append("")
    out.append(
        "Connected components of the open-question graph where two "
        "questions are linked iff they share a not-firm explored entity. "
        "Multi-question components are roadmap *spines* — clusters of "
        "questions gated by the same upstream work. Singletons are "
        "independent questions in the parallel *fan*."
    )
    out.append("")
    multi = [c for c in qclusters if len(c["questions"]) >= 2]
    singletons = [c for c in qclusters if len(c["questions"]) == 1]
    if multi:
        for i, c in enumerate(multi, start=1):
            qs = sorted(c["questions"])
            out.append(f"### Spine {i} ({len(qs)} questions)")
            out.append("")
            for q in qs:
                out.append(f"- `{q}`")
            out.append("")
            if c["shared_blockers"]:
                out.append("Shared not-firm blockers (resolving these unblocks the spine):")
                out.append("")
                for b, blocking_qs in c["shared_blockers"][:8]:
                    firmness = entity_firmness(b, notes, idx)
                    out.append(f"- `{b}` ({firmness}, blocks {len(blocking_qs)} of {len(qs)})")
                out.append("")
    if singletons:
        out.append(f"### Independent ({len(singletons)} questions)")
        out.append("")
        out.append(
            "Open questions sharing no not-firm blockers with any other "
            "open question — answerable or advanceable in parallel."
        )
        out.append("")
        for c in singletons:
            (q,) = c["questions"]
            out.append(f"- `{q}`")
        out.append("")

    # ------------------------------------------------------------ frontier
    out.append("## Enablement frontier")
    out.append("")
    out.append(
        "Entities explored by open questions but loosely characterized "
        "(fewer than 3 proven theorems pointing at them). Writing theorems "
        "on these would unblock the listed questions. Sorted by unblock-count."
    )
    out.append("")
    for ent, d in frontier[:20]:
        kind = notes[ent]["kind"]
        n_thm = d["characterizing_theorems"]
        plural = "s" if n_thm != 1 else ""
        out.append(f"### `{ent}` ({kind}, {n_thm} characterizing theorem{plural})")
        out.append("")
        for q in sorted(d["questions"]):
            out.append(f"- explored by `{q}`")
        out.append("")

    # ------------------------------------------------------------ demand
    out.append("## Demand clusters (bottleneck entities)")
    out.append("")
    out.append(
        "Entities shared across multiple open questions, leverage-weighted. "
        "Leverage = (questions exploring it) × firmness-weight: 1.0 if the "
        "entity is itself not firm (sketch theorem / loose definition / "
        "missing slug), 0.3 if firm. A not-firm bottleneck shared by many "
        "questions is the highest leverage move on the board."
    )
    out.append("")
    for ent, qs, firmness, leverage in clusters[:15]:
        kind = notes[ent]["kind"] if ent in notes else "—"
        out.append(
            f"- **`{ent}`** ({kind}, {firmness}, leverage {leverage:.1f}) — "
            f"explored by {len(qs)} questions: {', '.join(sorted(qs))}"
        )
    out.append("")

    # ------------------------------------------------------------ realization
    out.append("## Realization graph")
    out.append("")
    out.append(
        "The `realizes:` relation is the convention's bridge between concepts "
        "(roles) and objects/morphisms (realizations of those roles). A concept "
        "without realizers is a role nobody has constructed; a construction "
        "without a `realizes:` declaration is unanchored conceptually."
    )
    out.append("")
    out.append(
        f"**Concepts without realizers ({len(realization['unrealized_concepts'])}):** "
        "roles described but no declared realization in the corpus. Either "
        "implicit demand for an object/morphism that realizes them, or the "
        "concept is currently aspirational."
    )
    out.append("")
    if realization["unrealized_concepts"]:
        out.append(
            ", ".join(f"`{s}`" for s in realization["unrealized_concepts"])
        )
    out.append("")
    out.append(
        f"**Constructions without `realizes:` ({len(realization['unanchored_constructions'])}):** "
        "objects/morphisms not declaring which concept they realize. Either "
        "they don't realize a named concept (legitimate — not every construction "
        "needs to), or they realize one but the link is undeclared (implicit "
        "demand to declare it)."
    )
    out.append("")
    if realization["multi_realized"]:
        out.append(
            "**Concepts with multiple realizations** "
            "(robust concepts earning their cross-construction keep):"
        )
        out.append("")
        for c, rs in realization["multi_realized"][:10]:
            out.append(f"- `{c}` realized by: {', '.join(f'`{r}`' for r in rs)}")
        out.append("")

    # ------------------------------------------------------------ split
    out.append("## Concept-splitting candidates")
    out.append("")
    out.append(
        "Concepts whose body has 4+ distinct named sections AND a "
        "depends-on chain of 4+ entries — both signals together suggest "
        "the body is doing structurally-distinct work that may want "
        "splitting into finer concepts. Either signal alone is noisy "
        "(a long compound name can encode precise math; a body with many "
        "sections may just be thorough)."
    )
    out.append("")
    if splits:
        for c in splits:
            out.append(f"- `{c['slug']}` — {c['n_sections']} sections, {c['n_deps']} deps")
    else:
        out.append("*(no candidates surfaced this run)*")
    out.append("")

    # ------------------------------------------------------------ ancestors
    out.append("## Possible unnamed common ancestors")
    out.append("")
    out.append(
        "Pairs of open questions whose `explores:` sets overlap moderately "
        "(Jaccard 0.2–0.5). The intersection may be a missing entity that "
        "would unify the questions and reframe both. Sparse overlap = "
        "weak signal; moderate overlap = potential structural shift."
    )
    out.append("")
    if ancestors:
        for q1, q2, common, jac in ancestors:
            shared = ", ".join(f"`{c}`" for c in sorted(common))
            out.append(f"- `{q1}` ↔ `{q2}` (Jaccard {jac:.2f}). Shared: {shared}")
    else:
        out.append("*(no candidates surfaced this run)*")
    out.append("")

    # ------------------------------------------------------------ loose
    out.append("## Concepts without characterizing theorems")
    out.append("")
    out.append(
        f"Primitives (notional anchors, expected to be loose): "
        f"{', '.join(f'`{p}`' for p in primitives) if primitives else '*(none)*'}."
    )
    out.append("")
    if loose:
        out.append(
            f"Non-primitive concepts with no proven theorem about them — "
            "implicit demand for characterization or candidates for splitting:"
        )
        out.append("")
        for c in loose:
            out.append(f"- `{c}`")
        out.append("")
    else:
        out.append("Every non-primitive concept has at least one characterizing theorem.")
        out.append("")

    # ------------------------------------------------------------ pillars
    out.append("## Load-bearing pillars")
    out.append("")
    out.append(
        "Definitions, concepts, and morphisms depended on by 5+ proven "
        "theorems — the structural center of gravity. Changes here ripple "
        "through the corpus."
    )
    out.append("")
    for s, c in pillars[:15]:
        out.append(f"- `{s}` ({notes[s]['kind']}) — {c} theorems")
    out.append("")

    # ------------------------------------------------------------ isolated
    out.append("## Morphisms without characterizing theorems")
    out.append("")
    out.append(
        f"{len(isolated_morphisms)} morphisms have no proven theorem about them. "
        "A morphism without theorems is a definition without consequences — "
        "either the consequences are baked into theorems about its source/"
        "target instead, or the morphism is awaiting characterization."
    )
    out.append("")
    for m in isolated_morphisms:
        out.append(f"- `{m}`")
    out.append("")

    return "\n".join(out)


# --------------------------------------------------------------------- main

def main() -> int:
    notes = load_corpus()
    idx = in_edges_index(notes)
    report = render_report(notes, idx)

    out_path = ROOT / "tools" / "build" / "research-program.md"
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(report)

    print(f"plan.py: {len(notes)} notes scanned")
    print(f"  report: {out_path.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
