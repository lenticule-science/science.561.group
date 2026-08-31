// Accessible tooltip/popover for glossary terms. WAI-ARIA "tooltip"
// pattern: the trigger stays a plain focusable element that points at a
// role="tooltip" node via aria-describedby only while shown, rather than a
// role="dialog" popup — a glossary gloss is supplementary description, not
// an interactive surface of its own. No DOM access at module top level
// (only inside attachHoverCards and the closures it returns), so this file
// imports cleanly under `node --test`.
//
// Usage: after rendering HTML containing `<span data-term="liberty">…</span>`
// markup, call `attachHoverCards(container, glossary)` (glossary from
// lib/glossary-index.mjs's loadGlossary). Returns `{ destroy() }`.

const HOVER_CARD_ID = "weiqi-learn-hover-card";

/**
 * @param {HTMLElement} rootEl - subtree to scan for `[data-term]` elements.
 * @param {import("../lib/glossary-index.mjs").GlossaryIndex} glossary
 * @returns {{ destroy(): void }}
 */
export function attachHoverCards(rootEl, glossary) {
  const doc = rootEl.ownerDocument;
  const triggers = Array.from(rootEl.querySelectorAll("[data-term]"));

  /** @type {HTMLElement | null} */
  let card = null;
  /** @type {HTMLElement | null} */
  let openTrigger = null;
  let pointerIsDown = false;

  function ensureCard() {
    if (card) return card;
    card = doc.createElement("div");
    card.id = HOVER_CARD_ID;
    card.className = "hover-card";
    card.setAttribute("role", "tooltip");
    card.hidden = true;
    // Positioning is this component's own concern (it owns no stylesheet),
    // so the layout-critical rules live here; visual skinning is left to
    // styles.css via the "hover-card" class.
    card.style.position = "fixed";
    card.style.zIndex = "1000";
    doc.body.appendChild(card);
    return card;
  }

  function renderCardContent(term) {
    const c = ensureCard();
    c.textContent = "";
    const heading = doc.createElement("strong");
    heading.className = "hover-card__title";
    heading.textContent = term.title;
    c.appendChild(heading);
    const def = doc.createElement("p");
    def.className = "hover-card__definition";
    def.textContent = term.definition;
    c.appendChild(def);
    if (term.related.length > 0) {
      const related = doc.createElement("p");
      related.className = "hover-card__related";
      related.textContent = "See also: " + term.related.join(", ");
      c.appendChild(related);
    }
  }

  function positionCard(trigger) {
    const c = ensureCard();
    const triggerRect = trigger.getBoundingClientRect();
    // Reveal (hidden -> not) before measuring so offsetWidth/Height are real.
    c.hidden = false;
    const cardRect = c.getBoundingClientRect();
    const viewportWidth = doc.defaultView?.innerWidth ?? cardRect.width + triggerRect.left;
    let left = triggerRect.left;
    if (left + cardRect.width > viewportWidth - 8) {
      left = Math.max(8, viewportWidth - cardRect.width - 8);
    }
    let top = triggerRect.bottom + 6;
    const viewportHeight = doc.defaultView?.innerHeight ?? top + cardRect.height;
    if (top + cardRect.height > viewportHeight - 8) {
      top = Math.max(8, triggerRect.top - cardRect.height - 6);
    }
    c.style.left = `${left}px`;
    c.style.top = `${top}px`;
  }

  function open(trigger, term) {
    if (openTrigger === trigger) return;
    if (openTrigger) close();
    renderCardContent(term);
    positionCard(trigger);
    const c = ensureCard();
    trigger.setAttribute("aria-describedby", HOVER_CARD_ID);
    openTrigger = trigger;
    c.hidden = false;
  }

  function close() {
    if (card) card.hidden = true;
    if (openTrigger) openTrigger.removeAttribute("aria-describedby");
    openTrigger = null;
  }

  /** @type {Array<() => void>} */
  const detachers = [];
  function on(target, type, handler, options) {
    target.addEventListener(type, handler, options);
    detachers.push(() => target.removeEventListener(type, handler, options));
  }

  for (const trigger of triggers) {
    const term = glossary.byTerm(trigger.dataset.term ?? "");
    if (!term) continue; // no matching entry — leave the plain text alone

    // Plain focusable element only — no role="button"/aria-expanded: the
    // popup itself is role="tooltip" (below), and the WAI-ARIA APG tooltip
    // pattern doesn't define a role="tooltip" node as something a widget
    // "expands", so this trigger stays out of the disclosure-widget
    // vocabulary entirely, matching this file's header comment.
    if (!trigger.hasAttribute("tabindex")) trigger.tabIndex = 0;
    trigger.classList.add("glossary-term");

    on(trigger, "mouseenter", () => open(trigger, term));
    on(trigger, "mouseleave", () => {
      if (!pointerIsDown) close();
    });
    on(trigger, "focus", () => open(trigger, term));
    on(trigger, "blur", () => close());

    // Touch/tap: a "click" with no preceding mouseenter (touch devices
    // fire click without hover events) toggles the card open or closed.
    on(trigger, "click", (event) => {
      event.stopPropagation();
      if (openTrigger === trigger) {
        close();
      } else {
        open(trigger, term);
      }
    });

    on(trigger, "keydown", (event) => {
      if (event.key === "Escape" && openTrigger === trigger) {
        event.stopPropagation();
        close();
        trigger.focus();
      }
    });
  }

  // Global fallbacks: Escape closes from anywhere, a tap/click outside any
  // trigger or the card itself closes it (the tap-to-toggle counterpart).
  const onDocKeydown = (event) => {
    if (event.key === "Escape" && openTrigger) {
      close();
    }
  };
  const onDocPointerDown = () => {
    pointerIsDown = true;
  };
  const onDocPointerUp = () => {
    pointerIsDown = false;
  };
  const onDocClick = (event) => {
    if (!openTrigger) return;
    const target = event.target;
    if (target === card || (card && card.contains(target))) return;
    if (target === openTrigger || (openTrigger && openTrigger.contains(target))) return;
    close();
  };
  on(doc, "keydown", onDocKeydown);
  on(doc, "pointerdown", onDocPointerDown);
  on(doc, "pointerup", onDocPointerUp);
  on(doc, "click", onDocClick);

  function destroy() {
    close();
    for (const off of detachers.splice(0)) off();
    if (card) {
      card.remove();
      card = null;
    }
  }

  return { destroy };
}
