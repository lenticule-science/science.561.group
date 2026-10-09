---
type: "[[function]]"
function-name: "classify-function-type"
function-type: classify
function-classifies: function type
function-accepts: function
function-results: structured descriptor
---

The ***classify function type*** [[function]] takes a [[function]] and returns a [[structured description]] of what [[function type|type]] of function it is, including its [[constraint behaviors]], [[evaluation shape]], and [[modulation effect|modulation effects]].

- Let `f: A → B` be a function
	- Let [[function structure]] be one of:
		- [[pointwise]]
		- [[recursive]]
		- [[closure]]
		- [[constructor]]
	- Let [[function trace]] be one of:
		- [[static]]
		- [[propagating]]
		- [[cyclic]]
		- [[accumulating]]
