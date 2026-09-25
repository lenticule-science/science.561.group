---
title: Org mode with multiple languages
description: "data Bool : Set where true : Bool false : Bool"
---
# Org mode with multiple languages

## Have some Agda!

``` agda2
module OrgMultipleLanguages where

data Bool : Set where
  true  : Bool
  false : Bool
```

## Have some Haskell!

``` haskell
main = putStrLn "Hello!"
```

## Have some elisp

``` elisp
(message "Hello!")
```

## Invalid (ignored) Agda

``` agda2-foo
module Wrong where
```

``` agda
module Wrong where
```
