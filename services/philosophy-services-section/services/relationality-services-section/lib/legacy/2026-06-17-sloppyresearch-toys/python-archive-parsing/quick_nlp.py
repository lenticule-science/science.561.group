#!/usr/bin/env python3
"""
analyze_archive_spacy_optimized.py

Parallelized, stopword-clean NLP analysis of a research archive.
Uses spaCy with batching, JSON export, and relative frequency reporting.
"""

import sys
import json
from pathlib import Path
from collections import Counter
import spacy

def load_texts(root_dir, extensions=(".org",)):
    """Yield (relpath, text) tuples from all .org files under root_dir."""
    for path in Path(root_dir).rglob("*"):
        if path.suffix.lower() in extensions:
            try:
                yield str(path.relative_to(root_dir)), path.read_text(encoding="utf-8", errors="ignore")
            except Exception as e:
                print(f"[WARN] Could not read {path}: {e}")

def analyze_archive(root_dir, batch_size=16, top_n=20):
    """Run spaCy analysis across all texts in the archive."""
    nlp = spacy.load("en_core_web_sm", disable=["textcat"])
    spacy.prefer_gpu()

    STOPWORDS = nlp.Defaults.stop_words
    lemma_counts = Counter()
    pos_counts = Counter()
    ent_counts = Counter()

    texts = list(load_texts(root_dir))
    print(f"[INFO] Processing {len(texts)} files...")

    for doc, (relpath, _) in zip(nlp.pipe((t for _, t in texts), batch_size=batch_size), texts):
        for t in doc:
            lemma = t.lemma_.lower()
            if not t.is_alpha or t.is_stop or lemma in STOPWORDS or len(lemma) < 2:
                continue
            lemma_counts[lemma] += 1
            pos_counts[t.pos_] += 1
        for e in doc.ents:
            ent_counts[e.label_] += 1

    total = sum(lemma_counts.values()) or 1
    print(f"\n=== Top Lemmas (stopwords removed) ===")
    for lem, c in lemma_counts.most_common(top_n):
        print(f"{lem:20s} {c:7d}  ({c/total:.2%})")

    print(f"\n=== POS Distribution ===")
    for pos, c in pos_counts.most_common():
        print(f"{pos:10s} {c}")

    print(f"\n=== Entity Labels ===")
    for ent, c in ent_counts.most_common():
        print(f"{ent:20s} {c}")

    out = {
        "lemma_counts": lemma_counts.most_common(),
        "pos_counts": pos_counts.most_common(),
        "ent_counts": ent_counts.most_common(),
        "model": nlp.meta["name"],
        "version": nlp.meta["version"],
        "files": len(texts),
    }
    Path("analysis_results.json").write_text(json.dumps(out, indent=2))
    print("\n[INFO] Results saved to analysis_results.json")

def main():
    if len(sys.argv) < 2:
        print("Usage: python analyze_archive_spacy_optimized.py /path/to/archive")
        sys.exit(1)
    root_dir = Path(sys.argv[1])
    if not root_dir.exists():
        print(f"Error: {root_dir} does not exist.")
        sys.exit(1)
    analyze_archive(root_dir)

if __name__ == "__main__":
    main()
