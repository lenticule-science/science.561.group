---
aliases: 
keywords:
  - eee
  - 31B
  - 42C
  - 42c3
  - 31b7
created: 2019-04-29T11:22:09
modified: 2025-07-13T11:22:12
---

## Table of Contents

- [Introduction](https://emsenn.neocities.org/oats#org8212ac4)
	- [License and Editorial Information](https://emsenn.neocities.org/oats#org06caa69)
- [Design Philosophy](https://emsenn.neocities.org/oats#org571c0e4)
- [CSS Rules](https://emsenn.neocities.org/oats#org433a37c)
	- [Base Rules](https://emsenn.neocities.org/oats#org91186b3)
		- [HTML Tag Rules](https://emsenn.neocities.org/oats#org833fa19)
		- [Body Tag Rules](https://emsenn.neocities.org/oats#org8d8a68c)
		- [Header Tag Rules](https://emsenn.neocities.org/oats#orgc1dad4f)
		- [Main Tag Rules](https://emsenn.neocities.org/oats#org4927fcd)
		- [Footer Tag Rules](https://emsenn.neocities.org/oats#orga47d7c1)
		- [Headline Tag Rules](https://emsenn.neocities.org/oats#org78152a7)
		- [Link Tag Rules](https://emsenn.neocities.org/oats#org2bfc307)
		- [Image Tag Rules](https://emsenn.neocities.org/oats#org82a5b84)
	- [Partials Rules](https://emsenn.neocities.org/oats#org68d5bf5)
		- [Skip-to-Content Rules](https://emsenn.neocities.org/oats#orge0ab9de)
	- [State Rules](https://emsenn.neocities.org/oats#orgdc9849e)
		- [Selection Rules](https://emsenn.neocities.org/oats#org63fc0b9)
- [Demonstration HTML Document](https://emsenn.neocities.org/oats#orgcc0f82a)

## Design Philosophy

The *Oats* theme is based on my own [_Brutstrap_](https://emsenn.net/projects/brutstrap/), which claims to style content as it's constructed.

However, *Brutstrap* is catered toward a rather stark aesthetic, to make it more readily match the [brutalism](https://brutalist-web.design/) advocated by [David Bryant Copeland](https://naildrivin5.com/).

*Oats* tries to be a little softer and more friendly. While nothing about the stylesheet contradicts the brutalist priciples Copeland provides, it does a little more styling than is strictly necessary.

## CSS Rules

All of *Oats* CSS lives in a single style-sheet, `oats.css`.

### Base Rules

The theme's ***base rules*** are those that go with HTML tags directly.

#### HTML Tag Rules

Document-wide settings, including those relevant to font-styling, are declared in the `html` rule.

```
html {
  color: #444;
  background-color: #eee;

These colors are the lowest-contrast, three-digit hex codes that still pass [WCAG2 AAA](https://www.w3.org/TR/WCAG20/).

  hyphens: auto;
  font-family: sans-serif;
  letter-spacing: .03em;
  word-spacing: .05em;
  line-height: 1.4;
  font-size: 1.3rem;
}

```

Adding some spacing between letters and words helps make the document feel a little more "friendly," and makes it a little safer to use more distinctive fonts in your body text.

#### Body Tag Rules
```
body {
  margin: 0;
}
```
#### Header Tag Rules

```
header {
  overflow: hidden;
  padding: 1rem 0 3rem 0;
}
```
#### Main Tag Rules

```
main{
  width: 85vw;
  max-width: 40rem;
  margin: -4rem auto -6rem;
  padding: 3rem 2rem 6rem;
}
```
#### Footer Tag Rules

```
footer {
  padding: 4rem 1rem 1rem;
}
```
#### Headline Tag Rules

##### H1 Tag Rules

```
h1 {
  font-weight: normal;
  font-size: 2.8em;
  text-shadow: .08em .03em .03em rgba(68,68,68,.3);
  margin: 0;
  padding: 0 .5em;
}
```

##### H2 through H6 Tag Rules

h2,h3,h4,h5,h6,h7,h8,h9 {
  text-align: center;
  font-style: bold;
  letter-spacing: 0.1em;
}

#### Link Tag Rules

a {
  color: #31B;
  text-decoration: underline dotted #4447;
  text-shadow: 0 0 .1em rgba(68,68,68,.2);
}
a:visited {
  color: #718;
}
a:hover {
  color: #42C;
  outline-style: none;
  text-decoration: underline solid #42c3;
  text-shadow: 0 0 .1em #31b7;
}
a:focus {
  color: #42C;
  outline-style: none;
  text-decoration: underline solid #42c3;
  text-shadow: 0 0 .1em #31b7;
}
a:visited:hover, a:visited:focus {
  color: #918;
  text-decoration: underline solid #9183;
  text-shadow: 0 0 .1em #7187;
}

#### Image Tag Rules

img {
  max-width: 100%;
  max-height: 20em;
}

### Partials Rules

#### Skip-to-Content Rules

.skipToContentLink {
  opacity: 0;
  position: absolute;
}
.skipToContentLink:focus{
  opacity:1
}

### State Rules

#### Selection Rules

::selection {
  color: #222;
  background-color: #777;
}

## Demonstration HTML Document

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
	<link href="https://gmpg.org/xfn/11" rel="profile">
	<meta charset="UTF-8">
	<meta name="description" content="Oats is a simple and neutral CSS theme.">
	<meta name="keywords" content="oats, css, theme">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="./oats.css">
	<title>Oats</title>
  </head>
  <body>
	<a class="skipToContentLink" href="#content">Skip to Content</a>
	<header>
	  <h1>Oats</h1>
	</header>
	<main id="content">
	  <p>
		Oats is a simple and neutral CSS theme.
	  </p>
	  <section id="features">
		<h2>Features</h2>
		<ul>
		  <li>
			<strong>Very little,</strong> honestly.
		  </li>
		</ul>
	  </section>
	</main>
  </body>
</html>