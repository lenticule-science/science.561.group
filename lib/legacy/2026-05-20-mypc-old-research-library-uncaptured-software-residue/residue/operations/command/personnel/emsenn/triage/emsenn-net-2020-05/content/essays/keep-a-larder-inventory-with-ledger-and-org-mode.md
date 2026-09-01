+++
title = "Keep a Larder Inventory with Ledger and Org-mode"
author = ["emsenn"]
date = 2016-01-10
tags = ["homecraft", "Ledger", "Org-mode"]
draft = false
predecolonial = true
+++

## <code>[0/3]</code> Set up your tech stack. {#set-up-your-tech-stack-dot}

-   [ ] Install Emacs.
-   [ ] Install Org-mode.
-   [ ] Configure Org-babel.


## Create a log. {#create-a-log-dot}


### Create a header {#create-a-header}

```org
#+TITLE: Larder Log
#+OPTIONS: c:t d:t
```


### Lay out the datetree {#lay-out-the-datetree}

```org
* 2019
** 2019-01 January
*** 2019-01-01 Tuesday
```


## Buy groceries {#buy-groceries}

```org
**** Shopping
#+BEGIN_SRC ledger :noweb yes :tangle larder-demo.ledger
2019/01/01 * Grocery Store
  Inventory:Larder:eggs                    4         @@ \$0.99
  Inventory:Larder:sausage                 2    lbs  @@ \$1.99
  Inventory:Larder:coffee                 90    tbsp @@ \$3.99
  Supplier:Harris Teeter
#+END_SRC
```


## Make coffee {#make-coffee}

```org
**** Cooking
#+BEGIN_SRC ledger :noweb yes :tangle larder-demo.ledger
2019/01/01 * Coffee
  Inventory:Larder:coffee                 -3    tbsp
  Life:Eating
```


## Make dinner {#make-dinner}

```org
2019/01/01 * Dinner
  Inventory:Larder:eggs                   -4
  Inventory:Larder:sausage                -2    lbs
  Life:Eating
#+END_SRC
```