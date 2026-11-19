# CTD: Typography Specification

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** type roles, stacks, type scale, treatments, measures, delivery

Type is a controlled vocabulary of two fixed roles plus one optional third. A
monospace role carries all structure; a sans role carries prose; an optional
serif role carries long-form content surfaces. Roles are never mixed within a
single function, and weights in the prose role are restricted to two.

---

## 1. Type roles

| Role | Family | Status | Carries |
| --- | --- | --- | --- |
| 1: Structural | monospace | fixed, required | labels, navigation, headers, metadata, tables, captions, buttons, status values, machine/browser chrome |
| 2: Prose | sans | fixed, required | body prose, headings |
| 3: Content | serif | optional | long-form typeset content surfaces |

---

## 2. Role 1: Structural (monospace)

**Family:** Hack; the Nerd Font variant where icon glyphs are needed.

**Stack (verbatim):**

```
"Hack Nerd Font", "Hack", ui-monospace, "SFMono-Regular", Menlo, Consolas, monospace
```

**Used for:** all structural labels, navigation, headers, metadata, tables,
captions, buttons, status values, and browser/machine chrome.

**Treatment:** UPPERCASE, with letter-spacing in the range `0.04em`-`0.08em`
(`0.06em` typical).

### Type scale: structural

| Use | Size | Weight | Notes |
| --- | --- | --- | --- |
| anchor / default | 14px | 400 | base for structural text |
| labels, shortcuts, tooltips | 11px | 400 | compact mono labels |
| dense chrome | 10-12.5px | 400 | high-density surfaces |
| titles / emphasis | 14px | 700 | bold anchor size |

Regular weight (400) everywhere except titles/emphasis. Numeric readouts use
fixed-width / tabular figures so values do not jitter. Long values use
single-ellipsis truncation (one `…`, not a repeated run). Compact
three-character labels are used for dense status readouts; the specific set is
application-defined.

### Treatment details

| Property | Value |
| --- | --- |
| case | UPPERCASE |
| letter-spacing | `0.04em`-`0.08em` (typical `0.06em`) |
| numerals | fixed-width / tabular for numeric readouts |
| overflow | single-ellipsis truncation |
| compact labels | 3 characters maximum for dense status labels |

---

## 3. Role 2: Prose (sans)

**Family:** Inter.

**Stack (verbatim):**

```
"Inter", system-ui, -apple-system, sans-serif
```

| Property | Value |
| --- | --- |
| weights | 400 and 700 only |
| base size | 16px |
| body line-height | 1.55 |
| heading line-height | 1.2 |
| rendering | antialiased |
| delivery | self-hosted, `font-display: swap` |

No intermediate or bold-black weights are permitted in the prose role.

### Measures

| Context | Measure |
| --- | --- |
| intro | 66ch |
| prose panels | 68ch |
| body prose | 72ch |
| notes | 76ch |

---

## 4. Role 3: Content (optional serif)

**Family:** Libertinus Serif.

Reserved for long-form typeset content surfaces. It is optional and is not
used for interface chrome, labels, or ordinary prose panels.

---

## 5. Fallback families

In constrained chrome, use:

- **Liberation Sans** (fallback for the sans role)
- **Liberation Mono** (fallback for the monospace role)

These are fallbacks for constrained rendering contexts, not additions to the
fixed role set.

---

## 6. Type usage rules

To read as CTD, a surface uses type as described below.

### Core rules

- CTD uses the monospace role for all structural text: labels, navigation,
  headers, metadata, tables, captions, buttons, status values, and chrome.
- The prose role carries body text and headings.
- Structural labels are UPPERCASE with `0.04em`-`0.08em` letter-spacing.
- Prose weights are restricted to 400 and 700.
- Numeric readouts use fixed-width / tabular figures so values do not jitter.
- Overflowing values use single-ellipsis truncation.
- The serif role is optional and limited to long-form content surfaces.

### Typical practice

- The 14px anchor is the structural default; 11px is used for labels,
  shortcuts, and tooltips.
- Dense chrome stays within the 10-12.5px range.
- Structural titles and emphasis use 14px/700.
- Dense status readouts use compact three-character labels.
- Measures are 66ch intro, 68ch panels, 72ch body, 76ch notes.
- Prose is antialiased with body line-height 1.55 and heading line-height 1.2.

### Discouraged practice

- Roles are not mixed within a single function (for example, prose set in the
  structural face for body copy).
- Weights outside the two permitted prose weights are not introduced.

---

## 7. Web-font delivery

- Fonts are **self-hosted**; no external font host is required at runtime.
- Use `font-display: swap` so text renders immediately with the fallback face
  while the web font loads.
- Serve subset font files (only the glyph ranges and weights actually used) to
  limit payload: the two prose weights only, and the monospace weights needed
  by the structural role.
- The referenced faces are not redistributed as part of this specification;
  each is used under its own license. See [ATTRIBUTION.md](../ATTRIBUTION.md)
  for typeface credits.

---

## Do / Don't

**Do**

- keep all structure in the monospace role
- keep all prose in the sans role at 400/700 only
- use uppercase, tracked structural labels
- use tabular numerals and single-ellipsis truncation for data

**Don't**

- set body copy in the structural face
- introduce intermediate or black prose weights
- allow numeric readouts to jitter with proportional figures
- rely on a remote font host at runtime

---

*Referenced typefaces are credited in [ATTRIBUTION.md](../ATTRIBUTION.md).*
