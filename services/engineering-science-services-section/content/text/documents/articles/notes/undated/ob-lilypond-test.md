---
title: Test org lilypond file
description: \score { \relative c' { c8 d e f g a b c | b a g f e d c4 | }
---
# Test org lilypond file

This is a simple file for test purposes

## LilyPond Version

``` lilypond

\version "2.12.3"

```

## <span class="done DONE">DONE</span> lilypond block for test purposes {#lilypond-block-for-test-purposes}

``` lilypond

\score {
  \relative c' {
    c8 d e f g a b c |
    b a g f e d c4   |
  }

```

``` lilypond

\layout {
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 150 4)
    }
  }
}

```
