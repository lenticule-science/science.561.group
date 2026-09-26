---
title: "Exploring the semantics of The Late Marx citers"
type: doc
status: draft
author: emsenn
date: 2025-10-17
keywords:
  - marxism
  - methodology
  - citations
publish_to:
  - emsenn-net
date-created: 2025-10-17
description: OUTFILE = "abstracts.csv" CONTACTEMAIL = "emsenn@emsenn.net" MAXRESULTS = 200 SLEEP = 1.2 SEED = 42 random.seed(SEED)
aliases:
  - "--- Main collection"
---

```python
import csv, json, re, time, random
import requests

OUTFILE = "abstracts.csv"
CONTACT_EMAIL = "emsenn@emsenn.net"
MAX_RESULTS = 200
SLEEP = 1.2
SEED = 42
random.seed(SEED)

QUERY_ANDERSON = '"Kevin B. Anderson" "The Late Marx and the Russian Road"'
QUERY_CONTROL  = 'Marxism OR "Karl Marx"'
MARX_FILTER = re.compile(r"(marx|marxism|historical materialism|capitalis\w*|communis\w*|class struggle)", re.I)
BAD_SUBJECTS = {"chemistry", "physics", "materials", "engineering", "medicine", "biology", "geology"}

def query_crossref(query, rows=100, cursor="*"):
    url = "https://api.crossref.org/works"
    params = {"query.bibliographic": query, "rows": rows, "cursor": cursor, "mailto": CONTACT_EMAIL}
    while True:
        r = requests.get(url, params=params, timeout=30)
        if r.status_code != 200:
            print("Error", r.status_code, r.text)
            break
        data = r.json()
        items = data["message"]["items"]
        for it in items:
            yield it
        cursor_next = data["message"].get("next-cursor")
        if not cursor_next or len(items) == 0:
            break
        params["cursor"] = cursor_next
        time.sleep(SLEEP)

def clean(text):
    if not text:
        return ""
    return re.sub(r"\s+", " ", str(text)).strip()

def extract(it):
    doi = it.get("DOI", "")
    title = clean(" ".join(it.get("title", [])))
    abstract = clean(it.get("abstract", ""))
    year = None
    for fld in ("published-print","published-online","created"):
        if fld in it and "date-parts" in it[fld]:
            year = it[fld]["date-parts"][0][0]
            break
    authors = ", ".join([a.get("family","") for a in it.get("author",[]) if "family" in a])
    publisher = it.get("publisher", "")
    subjects = [s.lower() for s in it.get("subject", [])]
    lang = it.get("language","").lower() if it.get("language") else ""
    return {"doi":doi,"title":title,"abstract":abstract,"year":year,
            "authors":authors,"publisher":publisher,"subjects":subjects,"lang":lang}

def is_marxist(rec):
    """Heuristic: English + humanities/social + Marx lexicon"""
    if rec["lang"] and not rec["lang"].startswith("en"):
        return False
    if any(bad in rec["subjects"] for bad in BAD_SUBJECTS):
        return False
    text = f"{rec['title']} {rec['abstract']}".lower()
    return bool(MARX_FILTER.search(text))

# --- Main collection ---
def collect(query, label):
    records = []
    for item in query_crossref(query, rows=100):
        rec = extract(item)
        if not is_marxist(rec):
            continue
        rec["label"] = label
        records.append(rec)
        if len(records) >= MAX_RESULTS:
            break
    return records

print("Fetching Anderson-related records…")
anderson_records = collect(QUERY_ANDERSON, "cites_anderson")

print("Fetching Marxist control records…")
control_records = collect(QUERY_CONTROL, "control")

rows = anderson_records + control_records
random.shuffle(rows)

# --- Write CSV ---
with open(OUTFILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=[
        "label","year","title","authors","publisher","doi","abstract"
    ])
    writer.writeheader()
    for r in rows:
        writer.writerow({k:r.get(k,"") for k in writer.fieldnames})

print(f"Wrote {len(rows)} records to {OUTFILE}")
print("Sample titles:")
for r in rows[:10]:
    print(f"- [{r['label']}] {r['year']} {r['title'][:80]}…")
```

```python
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
MORAL  = r"\b(redempt\w*|inclusion|inclusive|recognit\w*|plural\w*|eurocentr\w*|decolonial\w*|coloniality|humanism|ethic(s|al)\b(?!\s*protocol)|empath\w*|conscience|guilt|atone\w*|moral\w*|legitim\w*|rehabilitat\w*|reconciliat\w*|solidarit\w*|utopian\w*|hopeful|hope|salvat\w*|justice|injustic\w*|violenc\w*|suffer\w*|oppress\w*|emancipat\w*|dignit\w*|liberat\w*|redress|repair|healing)\b"

METHOD_RE = re.compile(METHOD, re.I)
MORAL_RE  = re.compile(MORAL, re.I)

def normalize(text):
    if not text:
        return ""
    return re.sub(r"\s+", " ", text).lower()

def count_keywords(text, pattern):
    return len(pattern.findall(text))

def load_records(path="abstracts.csv"):
    records = []
    with open(path, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            label = row.get("label","").strip()
            # Concatenate title + abstract for analysis
            text = normalize((row.get("title","") or "") + " " + (row.get("abstract","") or ""))
            if not text:
                continue
            records.append({"label":label, "text":text})
    return records

def compute_scores(records):
    results = []
    for rec in records:
        words = rec["text"].split()
        n_words = len(words) if words else 1
        method_count = count_keywords(rec["text"], METHOD_RE)
        moral_count  = count_keywords(rec["text"], MORAL_RE)
        # Per 1000 words
        mth_per_1k = method_count * 1000.0 / n_words
        mor_per_1k = moral_count * 1000.0 / n_words
        results.append({
            "label": rec["label"],
            "method_per_1k": mth_per_1k,
            "moral_per_1k": mor_per_1k
        })
    return results

def group_stats(results):
    groups = {}
    for r in results:
        groups.setdefault(r["label"], {"method":[], "moral":[]})
        groups[r["label"]]["method"].append(r["method_per_1k"])
        groups[r["label"]]["moral"].append(r["moral_per_1k"])
    return groups

def summarize(vals):
    if not vals:
        return (0.0,0.0,0.0)
    mean = stats.mean(vals)
    if len(vals) > 1:
        stdev = stats.pstdev(vals)
        # 95% CI ~ mean ± 1.96 * (stdev / sqrt(n))
        se = stdev / (len(vals) ** 0.5)
        ci_low = mean - 1.96 * se
        ci_high = mean + 1.96 * se
    else:
        ci_low = ci_high = mean
    return (mean, ci_low, ci_high)

def main():
    records = load_records()
    results = compute_scores(records)
    groups = group_stats(results)

    print("Group\tType\tMean\tCI_low\tCI_high\tN")
    for label, vals in groups.items():
        for kind in ("method","moral"):
            arr = vals[kind]
            mean, lo, hi = summarize(arr)
            print(f"{label}\t{kind}\t{mean:.2f}\t{lo:.2f}\t{hi:.2f}\t{len(arr)}")

if __name__ == "__main__":
    main()
```

#+begin_src python :tangle ./src/python/grab-anderson-citations.py
  import csv, json, re, time, random
  import requests

#+begin_src python :tangle ./src/python/explore-anderson-citations.py
  #!/usr/bin/env python3
  """
  explore-anderson-citations.py
  ---------------------------------
  Quick analysis of whether Anderson-citing works use more 'moral' or 'method'
  language, using a simple keyword frequency approach on abstracts.csv.

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
#+end_src
