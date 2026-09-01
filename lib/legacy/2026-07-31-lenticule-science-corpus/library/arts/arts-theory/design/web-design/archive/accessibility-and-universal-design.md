---
title: "Accessibility and Universal Design"
aliases:
  - "Accessibility and Universal Design"
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - WebDesign
teaches:
  - "Accessibility and Universal Design"
cites:
  - "Accessible Environments: Toward Universal Design"
  - "As We Have Always Done: Indigenous Freedom through Radical Resistance"
  - "Don't Make Me Think, Revisited"
  - "Sorting Things Out: Classification and Its Consequences"
---

## What this lesson covers

What web accessibility means, why it matters, the standards that guide it, and the design principles that make web content usable by people across the full range of human ability and circumstance.

## Prerequisites

[Document Structure and Semantic HTML](./document-structure-and-semantic-html.md).

---

## What accessibility means

Web accessibility means that people with disabilities can perceive, understand, navigate, and interact with web content. The term covers a wide range of conditions — visual, auditory, motor, cognitive, neurological — and an equally wide range of assistive technologies: screen readers, magnifiers, voice control, switch devices, eye trackers, Braille displays.

But accessibility is not only about disability in the medical sense. It also encompasses situational limitations: a person using a phone in bright sunlight, someone with a temporary injury, a user on a slow connection, a reader in a noisy environment who cannot play audio. The boundaries between "disabled" and "non-disabled" use are blurry, context-dependent, and shift over a person's lifetime.

## The social model of disability

Accessibility work is grounded in the social model of disability, which distinguishes between *impairment* (a characteristic of a person's body or mind) and *disability* (a barrier created by the environment). A person who uses a wheelchair is not disabled by the wheelchair — they are disabled by the staircase. A blind person is not disabled by blindness — they are disabled by a website that requires sight to navigate.

This reframing shifts responsibility from the individual to the designer. If a website is inaccessible, the problem is in the website, not in the person who cannot use it. This is consistent with the Universal Design principle: designing for the widest possible range of users from the start, rather than retrofitting accommodations later.

## Universal Design

Universal Design originated in architecture. Ronald Mace, an architect who used a wheelchair, coined the term at North Carolina State University in the 1980s [@mace_AccessibleEnvironments_1991]. The core idea: design that works for people with disabilities tends to work better for everyone. Curb cuts help wheelchair users, but also parents with strollers, delivery workers with carts, and travelers with rolling luggage.

The seven principles of Universal Design (established by Mace and colleagues in 1997):

1. **Equitable use** — useful to people with diverse abilities
2. **Flexibility in use** — accommodates a wide range of preferences and abilities
3. **Simple and intuitive** — easy to understand regardless of experience or knowledge
4. **Perceptible information** — communicates necessary information regardless of conditions or sensory abilities
5. **Tolerance for error** — minimizes hazards and consequences of accidental actions
6. **Low physical effort** — can be used efficiently and comfortably
7. **Size and space for approach and use** — appropriate for any body size, posture, or mobility

On the web, these principles translate to practices like providing text alternatives for images, ensuring sufficient color contrast, supporting keyboard navigation, writing clear and predictable interfaces, and allowing users to control timing and motion.

## WCAG: the Web Content Accessibility Guidelines

The Web Content Accessibility Guidelines (WCAG), published by the W3C's Web Accessibility Initiative (WAI), are the primary standards for web accessibility. WCAG 2.1 (2018) and WCAG 2.2 (2023) organize their guidelines around four principles, known as POUR:

### Perceivable

Information and user interface components must be presentable in ways users can perceive. This does not mean every user must perceive them the same way — it means alternative representations must exist.

- **Text alternatives**: every non-text element (image, video, audio, chart) needs a text equivalent. For images, this is the `alt` attribute. For complex diagrams, it may be a longer description.
- **Captions and transcripts**: video needs captions; audio needs transcripts.
- **Adaptable presentation**: content should be presentable in different ways (e.g., a simpler layout) without losing information or structure.
- **Distinguishable content**: sufficient color contrast (minimum 4.5:1 for normal text), resizable text, no information conveyed by color alone.

### Operable

Users must be able to operate the interface. Not everyone uses a mouse.

- **Keyboard accessible**: all functionality available from a keyboard. Focus order should follow a logical sequence.
- **Enough time**: users can adjust or extend time limits. Nothing disappears before a user can read or act on it.
- **Seizures and physical reactions**: no content that flashes more than three times per second.
- **Navigable**: mechanisms to bypass repeated blocks (skip links), descriptive page titles, meaningful link text, multiple ways to find content.

### Understandable

Content and interface behavior should be predictable and comprehensible.

- **Readable**: language of the page is identified in markup; unusual words and abbreviations are explained.
- **Predictable**: navigation is consistent across pages; components that look the same behave the same [@krug_DontMakeMeThink_2014].
- **Input assistance**: errors are identified, described, and (where possible) suggestions for correction are offered.

### Robust

Content must be compatible with current and future technologies, including assistive technologies.

- **Compatible**: markup is valid and well-formed; custom interface components use appropriate ARIA (Accessible Rich Internet Applications) roles and properties.

## ARIA: when HTML is not enough

HTML's built-in semantic elements handle most common patterns. But modern web applications include custom components — tabs, sliders, modal dialogs, drag-and-drop interfaces — that have no native HTML equivalent.

ARIA (Accessible Rich Internet Applications) is a set of attributes that supplement HTML semantics. ARIA roles declare what a component *is* (`role="tablist"`, `role="dialog"`); ARIA states and properties declare the component's current condition (`aria-expanded="true"`, `aria-selected="false"`).

The first rule of ARIA use, stated in the W3C specification, is: do not use ARIA if a native HTML element already provides the semantics you need. A `<button>` is better than a `<div role="button">` because the native element comes with built-in keyboard handling, focus management, and assistive technology support.

## Accessibility as justice

Accessibility is often framed as compliance — meeting WCAG criteria to satisfy legal requirements. But the deeper argument is one of justice: the web was designed as a universal medium, and excluding people from it is a form of structural harm.

This connects to the social model of disability and to broader questions about who designs information systems and whose needs those systems serve. [Bowker](../../../../general/people/geoffrey-bowker.md) and [Star](../../../../general/people/susan-leigh-star.md) observed that infrastructure becomes invisible to those it serves well — and visible only to those it fails [@bowker_SortingThingsOut_1999]. Inaccessible web design is invisible infrastructure failure.

Indigenous scholars, including [Simpson](../../../../general/people/leanne-simpson.md) and Kim TallBear, have argued that dominant knowledge systems frequently exclude through their design assumptions — privileging literacy over orality, individual authorship over collective knowledge, visual media over other senses [@simpson_AsWeHaveAlwaysDone_2017]. Accessible design, at its best, questions these assumptions rather than encoding them.

## Applications

Accessibility principles apply to any information system, not only web pages. Document formatting, knowledge base organization, curricula design, and software interfaces all face the same core questions: who can perceive this information, who can navigate it, and whose needs has the designer not considered.

