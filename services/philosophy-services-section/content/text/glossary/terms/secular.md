---
id: 72c79a55-c160-4e42-9209-3ec79e077412
title: secular
date-created: 2025-08-31
visibility: public
---

***Secular*** is the [condition](../../../../services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/condition.md) of being [not](negation.md) [religious](religious.md).

# Relational Mapping

Secular is true when religious is not true.

## Unary Conditions

- [condition](../../../../services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/condition.md)

## Binary Conditions

| Condition                                            | Value                                          |
|------------------------------------------------------|------------------------------------------------|
| [religious](religious.md) | [not](negation.md) |

# Formalization

## Fennel

``` {#secular-fennel-fn .fennel}
(fn secular? [thing]
  (not (religious? thing)))
```
