import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Primitive tutorial" =>

# Tutorial: First Walk Through the Admission Boundary

Read the primitive spine in this order.

1. Open `Infomaterial.Mark`.

   Check that `Mark` has only a surface presentation, and that `Kind` has exactly
   two constructors: `token` and `claim`.

2. Open `Infomaterial.Utterance`.

   Read `Utterance` as an ordered pair. The token/claim distinction is recovered
   by position in the pair.

3. Open `Infomaterial.Articulating`.

   Read `Articulating.utter` as the recursive floor and `Articulating.pair` as
   the recursive step. Then read `floor` and `utter_ne_pair`.

4. Stop.

   Do not continue by assuming subject, predicate, truth, or order. The next
   topic will generate the articulation cell and predication.

## Check Yourself

After this tutorial, you should be able to answer:

* Which declarations admit free data?
* Why is an utterance not yet a predication?
* Why does articulating have a one-way reading?
* Which later concepts are not allowed in primitive explanations?
