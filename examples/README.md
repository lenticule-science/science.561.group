# Reproduce the relational physics examples

These finite calculations accompany the four subject-owned research articles in
`content/`. They expose their arithmetic and counterexamples without requiring
access to the private Obsmetrologia source. They are educational reproductions,
not replacements for Metrologic, a new solver service, or empirical observations.

Run with Python 3 and its standard library:

```sh
python3 examples/relational-examples.py
python3 examples/quantum-contexts.py
```

Both commands print deterministic JSON and assert the cases stated in the
articles. `relational-examples.py` checks interval sequencing, a strictly
preserving map that loses independence, the rejected collapsed interval,
two different orders with the same ordering fraction, parity readout fibers,
exact reconstruction with another observation, and the stated conditional
entropies. The entropy calculation uses `math.log2`; all probabilities in these
cases are powers of two and the reported bit values are exact for the listed
distributions.

`quantum-contexts.py` uses `fractions.Fraction` for the rational tables. It
checks all sixteen deterministic assignments, constructs the classical
boundary mixture, and evaluates five parameter values. The JSON includes
natural-number weights that represent the same rational tables in the current
Obsmetrologia `WDist` style. A positive common total is explicitly supplied;
the native carrier does not prove that condition merely by containing weights.
The script does not claim to instantiate or kernel-check the native Lean
definitions. Its quantum classification uses the separate analytic
construction and cited bound explained in the article.

The three SVG figures in `static/figures/` are original deterministic explanatory
diagrams. Their coordinates and labels represent the declared examples, with
text alternatives in both SVG metadata and the articles. They are not generated
photographs or measured datasets.

The source remains part of the existing Science publication repository. The
owner TUFTE/CAIRN publisher still owns public HTML, mathematical typesetting,
search, feeds, admission and deployment. These examples create none of those
mechanisms and grant no new reuse license.
