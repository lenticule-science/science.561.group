---
title: MdQuotedDelim.lagda
description: "data Bool : Set where true : Bool false : Bool aa : {- -} Bool"
---
```
  module MdQuotedDelim where

        data Bool : Set where
            true : Bool
            false : Bool
            aa : {- ``` -} Bool

        a : Bool
        a = true
```
