---
type: reference
class: engineering-system
status: cited
authors: [W3C SPARQL Working Group]
year: 2013
title: "SPARQL 1.1 Query Language"
venue: "W3C Recommendation, 21 March 2013"
---

## Source

S. Harris, A. Seaborne (eds.). *SPARQL 1.1 Query Language*. W3C Recommendation, 21 March 2013. <https://www.w3.org/TR/sparql11-query/>

## Form

Standards specification. The normative definition of the SPARQL 1.1 query language for RDF.

## Content summary

Specifies SPARQL 1.1: a query language for [RDF](w3c-rdf11.md) graphs and datasets. Core constructs are *basic graph patterns* (sets of triple patterns with variables), *group graph patterns* (combining patterns with `JOIN`, `OPTIONAL`, `UNION`, `MINUS`, `FILTER`), *property paths* (regular-expression-style traversal of predicate sequences, with transitive closure `*` and `+`), *aggregation* (`GROUP BY`, `COUNT`, `SUM`, ...), *subqueries*, *named-graph dispatch* (`FROM`, `FROM NAMED`, `GRAPH`), and *federated query* (`SERVICE` for cross-endpoint queries). The companion SPARQL 1.1 Update specification adds insertion, deletion, and graph-management operations. Property paths are the recursive-query primitive that, together with subqueries, gives SPARQL 1.1 expressive power beyond the original SPARQL 1.0 / relational-algebra fragment.
