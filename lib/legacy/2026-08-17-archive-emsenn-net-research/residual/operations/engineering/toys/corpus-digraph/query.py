#!/usr/bin/env python3
"""Ask questions of the geometry stored in eavt.db.

Questions shaped as walks in the fiber, not SQL:
  asks <S> <P>       cells at (S, P, ?) — what S claims via P
  asks-who <P> <O>   cells at (?, P, O) — who lands at O through P
                     (the walk the substrate performs when the inversion
                      morphism cascades the claim back to O's fiber)
  fiber <P>          every cell in predicate P's fiber: (S, P, O)
  split <P1> <P2>    show two fibers side by side — for diagnosing
                     when one predicate has fragmented across spellings

Graph hygiene reports:
  dangling           edge predicates whose values don't resolve to any
                     known entity (file stem or domain directory).
                     Excludes META and SCALAR_CONFIG predicates.
  health             per-predicate cells, distinct, category, smell flag.
  neighborhood <S>   all in/out edges for entity S, with dead-out flagged.
  triage-cands       triaged files with library-side inbound edges,
                     ranked by leverage (move candidates).

Specialization-chain resolution:
  chain <slug>       show the specializes: chain rooted at a domain.
  resolve <src> <slug>
                     show how `slug` resolves from source file `src`
                     (path or stem). Walks colocated → directory ancestors
                     → specializes-chain on the source's domain.

Body-link reports (links table — markdown links in text):
  links              one-line link health summary.
  broken-links       top broken targets (most-referenced missing files).
  broken-by-domain   broken outbound count grouped by top-level domain.
  near-misses        broken targets whose basename matches an existing
                     entity exactly somewhere else in the corpus —
                     candidates for path-rewrite vs. fresh creation.
  dead-ends          files where most outbound .md links are broken.
  whose-broken <slug>
                     who points at <slug>.md when no such file exists.
  nominate           rank library/ files by hand-curation leverage:
                     inbound × broken-outbound × thin-body × no-description.
                     A high score means: many people see this page, the
                     page itself shows broken neighborhoods to readers,
                     the content is thin, and there's no meta description
                     for SERP/social. Worst single offender = top.
  champion           inverse of nominate: rank library/*/terms/*.md files
                     by combined quality signals — inbound traffic,
                     description present, references structured, body
                     in healthy size range, zero broken outbounds, rubric
                     sections present, citations used, no slop markers.

Predicate categories:
  META          — file-about-itself: title, description, dates, authors,
                  layout, aliases, permalinks. Not graph edges.
  SCALAR_CONFIG — literal scalar values, not entity references:
                  temperature, top_p, max_tokens, version, year, etc.
  EDGE          — typed graph relations: defines, depends-on, requires,
                  related, contrasts-with, etc. (default for unknowns)
"""
import sqlite3, sys, re
from pathlib import Path

DB = Path(__file__).parent / "eavt.db"
# query.py lives at <repo>/operations/engineering/toys/corpus-digraph/query.py,
# so parents[4] is the repo root.
ROOT = Path(__file__).resolve().parents[4]

# --- vendored content: not ours, never analyzed -----------------------------
# Vendored markers in path components. EAVT scan still captures these (so we
# CAN query them with `asks`/`asks-who`/`fiber` if we ever want to), but every
# graph-hygiene report (dangling, health, triage-cands, neighborhood) excludes
# them — we don't hold other software projects to our predicate conventions.
VENDORED_MARKERS = ('reference-source-code/',)

def _vendored_clause(prefix='src'):
    """SQL fragment that excludes rows whose `src` is in vendored paths."""
    parts = [f"{prefix} NOT LIKE '%{m}%'" for m in VENDORED_MARKERS]
    return ' AND '.join(parts)

# --- predicate categorization -----------------------------------------------
META = {
    'title','description','summary','name','slug','layout','aliases',
    'date','date-created','date-modified','date-updated','date-completed',
    'date-published','date-introduced','modified','task-done',
    'authors','permalink','dg-permalink','dg-publish','x-permalink',
    'toc','draft','draft-names','color','color-scheme','language',
    'redirect_to','description-title','x-i18n','tags','readiness',
}

SCALAR_CONFIG = {
    # LLM parameters
    'temperature','top_p','presence_penalty','frequency_penalty',
    'max_tokens','n','model','stop',
    # Numeric/ordering
    'version','nav_order','index','priority','number','position-in-cycle',
    'year','section',
    # Boolean-ish
    'note-maturity','title-class',
}
# everything else with a value is treated as EDGE.

def category(predicate):
    if predicate in META: return 'META'
    if predicate in SCALAR_CONFIG: return 'SCALAR_CONFIG'
    return 'EDGE'

# --- entity resolution ------------------------------------------------------
def build_entity_index():
    """Return {stem_lowercase: [paths]} for OUR content (no vendored).
    Includes domain dirs via _index.md."""
    idx = {}
    for md in ROOT.rglob('*.md'):
        if any(p in md.parts for p in ('.git','node_modules','public')): continue
        rel = str(md.relative_to(ROOT))
        if any(m in rel for m in VENDORED_MARKERS): continue
        if md.name == '_index.md':
            parent = md.parent.name.lower()
            idx.setdefault(parent, []).append(rel)
        else:
            idx.setdefault(md.stem.lower(), []).append(rel)
    return idx

def _conn():
    return sqlite3.connect(DB)

def _rows(sql, *args):
    return _conn().execute(sql, args).fetchall()

# --- specializes-chain resolution -------------------------------------------
# Subdir names that are containers within a domain, not domains themselves.
SUBCOLLECTIONS = {
    'terms','texts','narratives','concepts','objects','morphisms',
    'theorems','questions','examples','references','archive','domains',
    'logs','records',
}

def find_domain_dir(start: Path) -> Path | None:
    """Walk up from `start` to the nearest directory that is a domain
    (has _index.md, name not in SUBCOLLECTIONS). Returns the domain Path or None."""
    p = start if start.is_dir() else start.parent
    while True:
        if (p / '_index.md').exists() and p.name.lower() not in SUBCOLLECTIONS and p != ROOT:
            return p
        if p == ROOT or p.parent == p:
            return None
        p = p.parent

def read_specializes(domain_dir: Path) -> str | None:
    """Read the `specializes:` value from a domain's _index.md, or None."""
    idx = domain_dir / '_index.md'
    if not idx.exists(): return None
    text = idx.read_text(encoding='utf-8', errors='replace')
    if not text.startswith('---'): return None
    end = text.find('\n---', 3)
    if end < 0: return None
    fm = text[3:end]
    m = re.search(r'(?m)^specializes:\s*(.+)$', fm)
    if not m: return None
    val = m.group(1).strip().strip('"').strip("'")
    return val or None

def find_domain_by_name(name: str) -> Path | None:
    """Find the (single) domain dir with the given name in our content tree."""
    name = name.lower()
    candidates = []
    for idx in ROOT.rglob('_index.md'):
        if any(p in idx.parts for p in ('.git','node_modules','public')): continue
        rel = str(idx.relative_to(ROOT))
        if any(m in rel for m in VENDORED_MARKERS): continue
        if idx.parent.name.lower() == name and idx.parent.name.lower() not in SUBCOLLECTIONS:
            candidates.append(idx.parent)
    # Prefer library/ over operations/ when both exist
    candidates.sort(key=lambda p: (0 if str(p).startswith(str(ROOT/'library')) else 1, len(str(p))))
    return candidates[0] if candidates else None

def specializes_chain(start: Path, max_steps: int = 10) -> list[Path]:
    """Return the list [start, parent, grandparent, ...] following _index.md
    `specializes:` declarations. Cycles cut off."""
    chain = [start]
    seen = {start}
    cur = start
    for _ in range(max_steps):
        spec = read_specializes(cur)
        if not spec: break
        nxt = find_domain_by_name(spec)
        if not nxt or nxt in seen: break
        chain.append(nxt)
        seen.add(nxt)
        cur = nxt
    return chain

def resolve_term(source: Path, slug: str) -> tuple[Path | None, str]:
    """Find the .md file `slug` refers to, from `source`'s vantage.
    Returns (path, reason) where reason is the resolution rule that hit."""
    slug = slug.lower()
    src_dir = source.parent if source.is_file() else source

    # 1. colocated
    cand = src_dir / f'{slug}.md'
    if cand.exists() and cand != source:
        return cand, 'colocated'

    # 2. directory ancestors (each ancestor's terms/<slug>.md, then ancestor/<slug>.md)
    cur = src_dir
    while cur != ROOT and cur.parent != cur:
        for sub in ('terms', ''):
            cand = (cur / sub / f'{slug}.md') if sub else (cur / f'{slug}.md')
            if cand.exists() and cand != source:
                return cand, f'directory-ancestor({cur.relative_to(ROOT)})'
        cur = cur.parent

    # 3. specializes chain
    domain = find_domain_dir(source)
    if domain is None:
        return None, 'no-domain-found'
    for step in specializes_chain(domain)[1:]:  # skip the source's own domain
        for sub in ('terms', ''):
            cand = (step / sub / f'{slug}.md') if sub else (step / f'{slug}.md')
            if cand.exists():
                return cand, f'specializes-chain({step.name})'

    return None, 'unresolved'

# --- original walks ---------------------------------------------------------
def asks(s, p):
    rows = _rows("SELECT v, src FROM eavt WHERE e=? AND a=? AND flat=1", s, p)
    if not rows:
        print(f"  empty: no cells at ({s}, {p}, ?)"); return
    for v, src in rows:
        print(f"  {s}  {p}  {v}    [{src}]")

def asks_who(p, o):
    rows = _rows("SELECT e, src FROM eavt WHERE a=? AND v=? AND flat=1", p, o)
    if not rows:
        print(f"  empty: no cells at (?, {p}, {o})"); return
    for e, src in rows:
        print(f"  {e}  {p}  {o}    [{src}]")

def fiber(p):
    rows = _rows("SELECT e, v FROM eavt WHERE a=? AND flat=1 ORDER BY e", p)
    for e, v in rows:
        print(f"  {e}  {p}  {v}")
    print(f"  ({len(rows)} cells)")

def split(p1, p2):
    n1 = _rows("SELECT COUNT(*) FROM eavt WHERE a=? AND flat=1", p1)[0][0]
    n2 = _rows("SELECT COUNT(*) FROM eavt WHERE a=? AND flat=1", p2)[0][0]
    o1 = {v for v, in _rows("SELECT DISTINCT v FROM eavt WHERE a=? AND flat=1", p1)}
    o2 = {v for v, in _rows("SELECT DISTINCT v FROM eavt WHERE a=? AND flat=1", p2)}
    print(f"  {p1}: {n1} cells, {len(o1)} distinct objects")
    print(f"  {p2}: {n2} cells, {len(o2)} distinct objects")
    print(f"  objects shared by both fibers: {len(o1 & o2)}")
    print(f"  objects only in {p1}: {len(o1 - o2)}")
    print(f"  objects only in {p2}: {len(o2 - o1)}")

# --- new graph hygiene reports ---------------------------------------------
def dangling():
    """Edge predicates whose values don't resolve to any entity (our content only)."""
    idx = build_entity_index()
    counts = {}
    preds_for = {}
    for a, v in _rows(f"SELECT a, v FROM eavt WHERE flat=1 AND v IS NOT NULL AND {_vendored_clause()}"):
        if not v or len(v) > 80 or '\n' in v: continue
        if category(a) != 'EDGE': continue
        # bare-numeric values are scalar leakage in edge predicates — flag them
        v_norm = v.strip().lower()
        if v_norm in idx: continue
        counts[v_norm] = counts.get(v_norm, 0) + 1
        preds_for.setdefault(v_norm, set()).add(a)
    ranked = sorted(counts.items(), key=lambda x: -x[1])
    print(f'{len(ranked)} distinct dangling values across edge predicates')
    print(f'{"count":>5s}  {"value":40s} {"predicates"}')
    for v, c in ranked[:30]:
        preds = ','.join(sorted(preds_for[v])[:4])
        print(f'  {c:5d}  {v:40s} {preds}')

def health():
    """Predicate health table with category (our content only)."""
    vc = _vendored_clause()
    print(f'{"category":13s} {"predicate":35s} {"cells":>6s} {"distinct":>8s} {"top values"}')
    print('-' * 110)
    for a, c in _rows(f"SELECT a, COUNT(*) FROM eavt WHERE flat=1 AND {vc} GROUP BY a ORDER BY 2 DESC LIMIT 60"):
        if c < 30: continue
        cat = category(a)
        distinct = _rows(f'SELECT COUNT(DISTINCT v) FROM eavt WHERE a=? AND flat=1 AND {vc}', a)[0][0]
        tops = [v for v,_ in _rows(f"SELECT v, COUNT(*) FROM eavt WHERE a=? AND flat=1 AND {vc} GROUP BY v ORDER BY 2 DESC LIMIT 3", a)]
        ratio = distinct / c if c else 0
        smell = '⚠' if (cat == 'EDGE' and ratio < 0.05 and c > 200) else ' '
        print(f'  {smell} {cat:11s} {a:35s} {c:6d} {distinct:8d}  {tops}')

def neighborhood(s):
    """All in/out edges for entity s, dead-outs flagged. Excludes vendored."""
    vc = _vendored_clause()
    idx = build_entity_index()
    s_lower = s.lower()
    print(f'=== {s} ===')
    print()
    print('OUTBOUND (this entity points at...):')
    for a, v in _rows(f"SELECT a, v FROM eavt WHERE e=? AND flat=1 AND {vc}", s):
        if not v: continue
        cat = category(a)
        if cat == 'EDGE':
            resolves = '✓' if v.lower() in idx else '✗'
            print(f'  [{cat:4s}] {resolves}  {a:25s} {v}')
        else:
            print(f'  [{cat:4s}]    {a:25s} {v}')
    print()
    print('INBOUND (entities pointing at this one):')
    rows = _rows(f"SELECT e, a, src FROM eavt WHERE flat=1 AND lower(v)=? AND {vc} ORDER BY a, e", s_lower)
    if not rows:
        print('  (no inbound edges)')
    else:
        by_pred = {}
        for e, a, src in rows:
            if category(a) != 'EDGE': continue
            by_pred.setdefault(a, []).append((e, src))
        for a, items in sorted(by_pred.items(), key=lambda x: -len(x[1])):
            print(f'  via {a} ({len(items)}):')
            for e, src in items[:6]:
                print(f'      {e}  [{src}]')
            if len(items) > 6:
                print(f'      ... and {len(items)-6} more')

def triage_cands():
    """Triaged entities with non-triage inbound, ranked by leverage.
    Single SQL pass; vendored content excluded."""
    idx = build_entity_index()
    skip_preds = META | SCALAR_CONFIG
    placeholders = ','.join('?' * len(skip_preds))
    vc = _vendored_clause()
    # one pass: count inbound by EDGE preds from non-triage non-vendored sources
    inbound_counts = {}
    sql = f"SELECT lower(v), src FROM eavt WHERE flat=1 AND v IS NOT NULL AND a NOT IN ({placeholders}) AND {vc}"
    for k, src in _conn().execute(sql, list(skip_preds)):
        if not k or 'triage' in src: continue
        inbound_counts[k] = inbound_counts.get(k, 0) + 1
    print('=== triage files with non-triage library/ops inbound (move candidates) ===')
    print(f'{"in-deg":>6s}  {"slug":35s} {"location"}')
    cands = []
    for stem, paths in idx.items():
        if stem not in inbound_counts: continue
        canonical = sorted(paths, key=lambda p: ('triage' in p, 'archive' in p, 'public' in p, len(p)))[0]
        if 'triage' not in canonical: continue
        cands.append((inbound_counts[stem], stem, canonical))
    for indeg, stem, canonical in sorted(cands, key=lambda x: -x[0])[:25]:
        print(f'  {indeg:5d}  {stem:35s} {canonical}')

# --- specialization-chain commands ------------------------------------------
def chain(slug):
    """Show the specializes: chain rooted at a domain by name."""
    start = find_domain_by_name(slug)
    if not start:
        print(f'  no domain named {slug!r} found')
        return
    walk = specializes_chain(start)
    print(f'specializes-chain rooted at {slug}:')
    for i, d in enumerate(walk):
        spec = read_specializes(d) or '(root)'
        print(f'  {i}. {d.relative_to(ROOT)}    specializes: {spec}')

def resolve(src, slug):
    """Show how `slug` resolves from source `src` (file path or stem)."""
    src = src.strip()
    # accept either a relative/absolute path, or a slug to look up
    src_path = None
    if '/' in src or src.endswith('.md'):
        src_path = (ROOT / src).resolve() if not Path(src).is_absolute() else Path(src)
    else:
        # treat as a slug; look up in entity index
        idx = build_entity_index()
        if src in idx:
            src_path = ROOT / idx[src][0]
    if not src_path or not src_path.exists():
        print(f'  source {src!r} not found')
        return
    print(f'resolving {slug!r} from {src_path.relative_to(ROOT)}:')
    target, reason = resolve_term(src_path, slug)
    if target:
        print(f'  ✓  {target.relative_to(ROOT)}')
        print(f'     via: {reason}')
    else:
        print(f'  ✗  unresolved   ({reason})')

# --- body-link reports -------------------------------------------------------
def _link_vc(prefix='src'):
    parts = [f"{prefix} NOT LIKE '%{m}%'" for m in VENDORED_MARKERS]
    return ' AND '.join(parts)

def links():
    """One-line link health summary, our content only."""
    vc = _link_vc()
    total = _rows(f"SELECT COUNT(*) FROM links WHERE kind IN ('relative','absolute') AND {vc}")[0][0]
    broken = _rows(f"SELECT COUNT(*) FROM links WHERE kind IN ('relative','absolute') AND target_resolved IS NULL AND {vc}")[0][0]
    ext = _rows(f"SELECT COUNT(*) FROM links WHERE kind='external' AND {vc}")[0][0]
    anchor = _rows(f"SELECT COUNT(*) FROM links WHERE kind='anchor' AND {vc}")[0][0]
    asset = _rows(f"SELECT COUNT(*) FROM links WHERE kind='asset' AND {vc}")[0][0]
    pct = (broken / total * 100) if total else 0
    print(f'  internal .md links: {total}  ({broken} broken, {pct:.1f}%)')
    print(f'  external:           {ext}')
    print(f'  anchor (#frag):     {anchor}')
    print(f'  asset (img/etc):    {asset}')

def broken_links():
    """Top broken targets — most-referenced missing files."""
    vc = _link_vc()
    # Reduce raw target paths to bare basename to aggregate variants
    rows = _rows(f"""
        SELECT target_raw, COUNT(*) AS n
        FROM links
        WHERE kind IN ('relative','absolute') AND target_resolved IS NULL AND {vc}
        GROUP BY target_raw
        ORDER BY n DESC
        LIMIT 50
    """)
    if not rows:
        print('  no broken links'); return
    print(f'{"count":>5s}  basename                                   target_raw')
    for tgt, n in rows:
        base = tgt.split('/')[-1].split('#')[0]
        print(f'  {n:5d}  {base:40s} {tgt}')

def broken_by_domain():
    """Group broken outbound links by top-level domain (library/operations/...)."""
    vc = _link_vc()
    counts = {}
    rows = _rows(f"""
        SELECT src, COUNT(*) AS n
        FROM links
        WHERE kind IN ('relative','absolute') AND target_resolved IS NULL AND {vc}
        GROUP BY src
    """)
    for src, n in rows:
        parts = src.split('/')
        # bucket by first 4 levels
        bucket = '/'.join(parts[:4]) if len(parts) >= 4 else '/'.join(parts[:2])
        counts[bucket] = counts.get(bucket, 0) + n
    print(f'{"broken":>7s}  {"bucket"}')
    for bucket, n in sorted(counts.items(), key=lambda x: -x[1])[:30]:
        print(f'  {n:6d}  {bucket}')

def near_misses():
    """Broken targets whose basename matches an existing entity exactly.
    These are likely path-rewrite candidates — a real file exists with the
    right slug, the link just points to the wrong place."""
    idx = build_entity_index()  # stem.lower() -> [paths]
    vc = _link_vc()
    miss_counts = {}
    miss_examples = {}
    for src, target_raw in _rows(f"""
        SELECT src, target_raw FROM links
        WHERE kind IN ('relative','absolute') AND target_resolved IS NULL AND {vc}
    """):
        path = target_raw.split('#')[0].split('?')[0]
        if not path.endswith('.md'): continue
        base = path.rsplit('/', 1)[-1]
        stem = base[:-3].lower()
        if stem in idx and len(idx[stem]) >= 1:
            miss_counts[stem] = miss_counts.get(stem, 0) + 1
            miss_examples.setdefault(stem, idx[stem][0])
    print(f'{"refs":>5s}  {"stem":40s} canonical-path')
    for stem, n in sorted(miss_counts.items(), key=lambda x: -x[1])[:40]:
        print(f'  {n:5d}  {stem:40s} {miss_examples[stem]}')
    print(f'\n  {len(miss_counts)} distinct near-miss stems, {sum(miss_counts.values())} broken refs')

def dead_ends():
    """Files where most outbound .md links are broken — likely orphaned
    or pointing at a vanished neighborhood."""
    vc = _link_vc()
    rows = _rows(f"""
        SELECT src,
               SUM(CASE WHEN target_resolved IS NULL THEN 1 ELSE 0 END) AS broken,
               COUNT(*) AS total
        FROM links
        WHERE kind IN ('relative','absolute') AND {vc}
        GROUP BY src
        HAVING total >= 5 AND broken * 2 >= total
        ORDER BY broken DESC
        LIMIT 30
    """)
    print(f'{"broken/total":>13s}  src')
    for src, broken, total in rows:
        print(f'  {broken:>5d}/{total:<5d}  {src}')

def nominate():
    """Rank library/ files by hand-curation leverage. Composite score:

       score = inbound × (broken_out + 1) × (no_desc ? 1 : 0.4) × thinness
                                                                  ^^^^^^^^^
                                                  thinness = 1 if body<500ch,
                                                             0.7 if body<1500,
                                                             0.4 otherwise.

    Top of the list = single file most worth hand-curating: many readers,
    visibly broken neighborhoods, thin content, missing meta description.
    """
    import re
    # 1. inbound counts (only edges into library/ targets)
    inbound = {}
    for tgt, in _conn().execute("""
        SELECT target_resolved FROM links
        WHERE target_resolved IS NOT NULL
              AND target_resolved LIKE 'library/%'"""):
        inbound[tgt] = inbound.get(tgt, 0) + 1

    # 2. broken-outbound counts per source
    broken_out = {}
    for src, in _conn().execute("""
        SELECT src FROM links
        WHERE kind IN ('relative','absolute') AND target_resolved IS NULL
              AND src LIKE 'library/%'"""):
        broken_out[src] = broken_out.get(src, 0) + 1

    # 3. body thinness + missing description, walked from disk
    rows = []
    for src in inbound:
        full = ROOT / src
        if not full.exists(): continue
        try: text = full.read_text(encoding='utf-8', errors='replace')
        except: continue
        m = re.match(r'^---\n(.*?)\n---\n(.*)$', text, re.DOTALL)
        if not m: continue
        fm_text, body = m.group(1), m.group(2)
        body_len = len(body.strip())
        has_desc = bool(re.search(r'(?m)^description:\s*\S', fm_text))

        thinness = 1.0 if body_len < 500 else (0.7 if body_len < 1500 else 0.4)
        desc_factor = 1.0 if not has_desc else 0.4
        in_n = inbound[src]
        out_b = broken_out.get(src, 0)
        score = in_n * (out_b + 1) * desc_factor * thinness
        rows.append((score, src, in_n, out_b, body_len, has_desc))

    rows.sort(key=lambda r: -r[0])
    print(f'{"score":>7s}  {"in":>3s}  {"out!":>4s}  {"body":>5s}  desc  src')
    for score, src, in_n, out_b, body_len, has_desc in rows[:15]:
        d = '✓' if has_desc else '✗'
        print(f'  {score:6.1f}  {in_n:3d}  {out_b:4d}  {body_len:5d}   {d}    {src}')

def champion():
    """Rank library term-files by combined quality signals.

    Signals (each a 0–1 factor unless noted):
      inbound          raw inbound count (the volume term)
      desc             description present (1.0) or absent (0.3)
      sourced          min(1, refs_frontmatter / 5) — citation density
      cited            min(1, body_citations / 3)   — refs are actually used
      structured       min(1, h2_count / 5)         — section headers
      rubric           fraction of canonical rubric sections present
                       (Etymology|Lineage, Definitional structure,
                        Examples, Adjacent, Open questions, See Also)
      density          length curve peaking at 4–10k chars
      clean_out        (1 - broken_out / total_out) for outbound .md links
      no_slop          0.6 if LLM-slop phrase markers detected, else 1.0

    score = inbound × desc × sourced × cited × structured ×
            rubric × density × clean_out × no_slop
    """
    import re
    SLOP_RE = re.compile(r'(?:^|\n)\s*(?:As an AI|I cannot|Here\'s a|As a language model|I apologize)\b', re.I)
    RUBRIC = [
        re.compile(r'(?im)^##\s+(etymology|conceptual sources|lineage|conceptual lineage|origins?)\b'),
        re.compile(r'(?im)^##\s+(definitional structure|what.*is|definition)\b'),
        re.compile(r'(?im)^##\s+examples?\b'),
        re.compile(r'(?im)^##\s+(adjacent|distinguished|distinctions|related concepts)\b'),
        re.compile(r'(?im)^##\s+(open questions|questions|unresolved)\b'),
        re.compile(r'(?im)^##\s+(see also|further reading|cross.references)\b'),
    ]

    def density_curve(n):
        if n < 800: return n / 800.0 * 0.5
        if n < 4000: return 0.5 + (n - 800) / 3200 * 0.5
        if n < 10000: return 1.0
        if n < 18000: return 1.0 - (n - 10000) / 8000 * 0.3
        return 0.7

    inbound = {}
    for tgt, in _conn().execute("""
        SELECT target_resolved FROM links WHERE target_resolved IS NOT NULL
              AND target_resolved LIKE 'library/%/terms/%' """):
        inbound[tgt] = inbound.get(tgt, 0) + 1

    out_total = {}
    out_broken = {}
    for src, resolved in _conn().execute("""
        SELECT src, target_resolved FROM links
        WHERE kind IN ('relative','absolute') AND src LIKE 'library/%/terms/%' """):
        out_total[src] = out_total.get(src, 0) + 1
        if resolved is None:
            out_broken[src] = out_broken.get(src, 0) + 1

    rows = []
    for src, in_n in inbound.items():
        full = ROOT / src
        if not full.exists(): continue
        try: text = full.read_text(encoding='utf-8', errors='replace')
        except: continue
        m = re.match(r'^---\n(.*?)\n---\n(.*)$', text, re.DOTALL)
        if not m: continue
        fm_text, body = m.group(1), m.group(2)
        body_stripped = body.strip()
        body_len = len(body_stripped)

        # frontmatter signals via regex (avoid heavy yaml parse)
        has_desc = bool(re.search(r'(?m)^description:\s*\S', fm_text))
        # count entries in references: by looking at top-level keys under it
        refs_block = re.search(r'(?ms)^references:\s*\n((?:  .+\n?)+)', fm_text)
        n_refs = 0
        if refs_block:
            n_refs = len(re.findall(r'(?m)^  [a-zA-Z][\w.-]*:\s*$', refs_block.group(1)))

        h2 = len(re.findall(r'(?m)^##\s+\S', body_stripped))
        cites = len(re.findall(r'\[@[a-zA-Z0-9_:.-]+', body_stripped)) + len(re.findall(r'\(([^)]+\.md)\)', body_stripped))
        rubric_hits = sum(1 for pat in RUBRIC if pat.search(body_stripped))
        slop = bool(SLOP_RE.search(body_stripped))

        ot = out_total.get(src, 0)
        ob = out_broken.get(src, 0)
        clean_out = 1.0 if ot == 0 else (ot - ob) / ot

        f_desc = 1.0 if has_desc else 0.3
        f_sourced = min(1.0, n_refs / 5.0)
        f_cited = min(1.0, cites / 3.0)
        f_struct = min(1.0, h2 / 5.0)
        f_rubric = rubric_hits / len(RUBRIC)
        f_density = density_curve(body_len)
        f_no_slop = 0.6 if slop else 1.0

        score = (in_n * f_desc * (f_sourced or 0.2) * (f_cited or 0.2) *
                 (f_struct or 0.2) * (f_rubric or 0.2) *
                 f_density * clean_out * f_no_slop)

        rows.append((score, src, in_n, body_len, n_refs, h2, rubric_hits,
                     '✓' if has_desc else '✗', clean_out, slop))

    rows.sort(key=lambda r: -r[0])
    print(f'{"score":>7s}  {"in":>4s}  {"body":>5s}  {"refs":>4s}  {"h2":>2s}  {"rub":>3s}  desc  c_out  src')
    for r in rows[:15]:
        score, src, in_n, body_len, n_refs, h2, rub, desc, c_out, slop = r
        slop_mark = ' (slop!)' if slop else ''
        print(f'  {score:6.1f}  {in_n:4d}  {body_len:5d}  {n_refs:4d}  {h2:2d}  {rub:1d}/6   {desc}    {c_out:.2f}   {src}{slop_mark}')

def whose_broken(slug):
    """Who points at <slug>.md when no such file exists?"""
    vc = _link_vc()
    rows = _rows(f"""
        SELECT src, target_raw, line FROM links
        WHERE kind IN ('relative','absolute') AND target_resolved IS NULL
              AND target_raw LIKE ? AND {vc}
        ORDER BY src, line
    """, f'%{slug}.md%')
    if not rows:
        print(f'  no broken refs to {slug}.md'); return
    by_src = {}
    for src, tgt, line in rows:
        by_src.setdefault(src, []).append((tgt, line))
    print(f'  {sum(len(v) for v in by_src.values())} broken refs across {len(by_src)} files:')
    for src, refs in sorted(by_src.items()):
        for tgt, line in refs:
            print(f'    {src}:{line}    -> {tgt}')

# --- dispatch ---------------------------------------------------------------
CMDS = {
    "asks": (asks, 2), "asks-who": (asks_who, 2),
    "fiber": (fiber, 1), "split": (split, 2),
    "dangling": (dangling, 0), "health": (health, 0),
    "chain": (chain, 1), "resolve": (resolve, 2),
    "neighborhood": (neighborhood, 1), "triage-cands": (triage_cands, 0),
    "links": (links, 0), "broken-links": (broken_links, 0),
    "broken-by-domain": (broken_by_domain, 0), "near-misses": (near_misses, 0),
    "dead-ends": (dead_ends, 0), "whose-broken": (whose_broken, 1),
    "nominate": (nominate, 0), "champion": (champion, 0),
}

def main():
    if len(sys.argv) < 2 or sys.argv[1] not in CMDS:
        print(__doc__); return
    fn, arity = CMDS[sys.argv[1]]
    if len(sys.argv) != 2 + arity:
        print(__doc__); return
    fn(*sys.argv[2:])

if __name__ == "__main__":
    main()
