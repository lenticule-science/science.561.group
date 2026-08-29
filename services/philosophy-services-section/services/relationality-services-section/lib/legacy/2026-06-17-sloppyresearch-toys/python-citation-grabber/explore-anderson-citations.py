#!/usr/bin/env python3
"""
explore-anderson-citations.py
---------------------------------
Quick analysis of whether Anderson-citing works use more 'moral' or 'method'
language, using a simple keyword frequency approach on abstracts.csv.

Input CSV must contain columns: label, text (abstract or concatenated text).
Label values: 'cites_anderson' or 'control'.

Outputs group means and 95% confidence intervals per 1000 words.
"""

import re, csv, statistics as stats
from collections import Counter

# --- Keyword patterns ---
METHOD = r"\b(method|methods|measurement|data(set)?|survey|fieldwork|interview|sampling|regress\w*|model\w*|estimate\w*|coding|reliab\w*|validi\w*|operationali\w*|variable\w*|hypothes\w*|test(ed|ing)?|significan\w*|simulat\w*|network\w*|experiment\w*|appendix|replicat\w*|code|archive|corpus|algorithm)\b"
MORAL  = r"\b(redempt\w*|inclusion|inclusive|recognit\w*|plural\w*|eurocentr\w*|decolonial\w*|coloniality|humanism|ethic(s|al)\b(?!\s*protocol)|empath\w*|conscience|guilt|atone\w*|moral\w*|legitim\w*|rehabilitat\w*|canon|legacy)\b"

def counts(text):
    """Return method rate, moral rate, and tilt per 1000 words."""
    t = text.lower()
    m = len(re.findall(METHOD, t))
    c = len(re.findall(MORAL, t))
    words = max(1, len(re.findall(r"\w+", t)))
    return m * 1000 / words, c * 1000 / words, (m - c) * 1000 / words

# --- Read CSV and compute counts ---
rows = []
with open("abstracts.csv", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    for r in reader:
        text = r.get("abstract") or r.get("text") or ""
        mrate, crate, tilt = counts(text)
        rows.append((r["label"], mrate, crate, tilt))

# --- Aggregate and report ---
def mean_ci(x):
    """Compute mean and 95% CI."""
    if not x:
        return (0.0, 0.0, 0.0)
    mu = stats.mean(x)
    sd = stats.pstdev(x)
    ci = 1.96 * sd / (len(x) ** 0.5)
    return mu, mu - ci, mu + ci

print("\n=== Keyword Tilt Summary (per 1,000 words) ===\n")
for label in ("cites_anderson", "control"):
    vals = [x for l, *x in rows if l == label]
    if not vals:
        continue
    m = [v[0] for v in vals]
    c = [v[1] for v in vals]
    t = [v[2] for v in vals]
    m_mu, m_lo, m_hi = mean_ci(m)
    c_mu, c_lo, c_hi = mean_ci(c)
    t_mu, t_lo, t_hi = mean_ci(t)
    print(f"Group: {label}")
    print(f"  Methods  : {m_mu:.3f} [{m_lo:.3f}, {m_hi:.3f}] per 1k words")
    print(f"  Moral    : {c_mu:.3f} [{c_lo:.3f}, {c_hi:.3f}] per 1k words")
    print(f"  Tilt (M−C): {t_mu:.3f} [{t_lo:.3f}, {t_hi:.3f}] per 1k words\n")

    from collections import defaultdict
    year_groups = defaultdict(list)
    for r in rows:
        try:
            y = int(r["year"])
            year_groups[(r["label"], y)].append(r["tilt"])
        except:
            continue
    print("\n=== Tilt by Year ===")
    for (label, y), vals in sorted(year_groups.items()):
        print(f"{label} {y}: mean tilt {stats.mean(vals):.3f} (n={len(vals)})")
