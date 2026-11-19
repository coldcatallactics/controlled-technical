# 05: Surface, Shape & Elevation

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** corner radius, prohibited effects, hairline structure, single
elevation, buttons, functional accents
**Palette:** gruvbox (MIT/X11); see [ATTRIBUTION.md](../ATTRIBUTION.md).

---

## 1. Shape

Surfaces are hard-edged. Shape carries no decoration; structure comes from
hairlines and spacing.

- Corner radius is `0` on all elements, explicitly forced to zero rather than
  relying on an inherited default.
- The only permitted exception is a circular graphic, such as a circular
  status indicator. This exception applies to the graphic itself, not to its
  container.
- Buttons, panels, inputs, tabs, and containers are not rounded.
- Token mapping: `--ct-radius: 0`.

---

## 2. Prohibited effects

CTD excludes the following on all surfaces without exception.

- Gradients are not used.
- Blur is not used (background blur, backdrop filter, or motion blur).
- Translucency is not used; all surfaces are opaque.
- Soft/diffuse and decorative shadows are not used anywhere. Overlays do not
  cast shadows; they are separated from substrates by their material step and
  a `1px` hairline (§4). The single exception is the content sheet's hard
  offset shadow in §4.
- Blur is off everywhere, including the security-critical surfaces (see
  `spec/06-motion.md`).

---

## 3. Hairline structure

Structure is built from lines of fixed weight. Each weight has one job.

| Structure | Value | Application |
| --- | --- | --- |
| Container border | `1px solid` | Defines containers, frames, panels, sheets. |
| Section rule | `1px dotted` | Divides sections; tree connectors. |
| Window border | `2px solid` | Window outline (focus state by color). |
| Status-bar border | `3px` | Docked status bar edge. |

- `1px solid` borders define containers and `1px dotted` rules divide sections.
- Window borders use `2px` and the status-bar border uses `3px`, with the
  values in `spec/04-layout.md` and `spec/08-components.md`.
- Heavier borders are not substituted for emphasis; color, weight, or a
  functional left rule is used instead.

---

## 4. Overlay separation and the one sanctioned elevation

Overlays are not lifted with shadows. An overlay is separated from the
substrate beneath it by its material step, a light Field over a dark Board,
per the Overlay and Substrate model in `spec/00-philosophy.md` (overlays are
light, substrates are dark), plus a `1px solid` hairline. Overlays do not
cast shadows.

The ONE sanctioned shadow belongs to the CONTENT SHEET, which keeps the
flat hard offset "sheet on a board" cue:

| Surface | Shadow |
| --- | --- |
| Content sheet | `4px 4px 0 rgba(0,0,0,0.35)` |

- Overlays are separated from substrates by their material step and a
  `1px solid` hairline, not by a shadow. Overlays do not cast shadows.
- The `4px 4px 0 rgba(0,0,0,0.35)` shadow applies to the content sheet only:
  the "sheet on a board" cue. A small `2px 2px 0` shadow appears only on a
  control that is part of that content sheet, as part of the sheet's own
  elevation idiom; it is not a general control shadow.
- The shadow is flat: zero blur radius, hard edge, offset only. No blur,
  spread, or second shadow layer is added.
- No other element casts a shadow: floating panels (menus, popups, tooltips,
  overlays, launcher), buttons, the content frame, and the docked status bar
  are all unshadowed.
- Soft or diffuse shadows are not used anywhere.
- Token mapping: `--ct-shadow-panel` (the content-sheet shadow).

---

## 5. Buttons

Buttons are word-labelled, flat, and hairline-bordered.

| Property | Value |
| --- | --- |
| Label | word label, never icon-only |
| Font | monospace |
| Size | `0.68rem` |
| Case | uppercase |
| Border | `1px solid` |
| Padding | `5px 9px` |
| Elevation | none (flat) |

- Buttons carry a word label in monospace at `0.68rem`, uppercase, with a
  `1px` border and `5px 9px` padding. Buttons are flat and do not cast a
  shadow of their own (a control that is part of the content sheet follows
  the sheet's shadow idiom in §4).
- Icon-only buttons are not used. No radius or soft shadow is added.
- The label is paired with its semantic role color only where the color is
  functional (e.g. a live/positive action), and the word label is always kept.

---

## 6. Functional accents

Accent color is applied as structure, not as a filled background.

- Functional accents are applied as borders or left rules, not as fills. For
  example, a callout uses a `0.3rem solid green` left rule.
- A container is not flooded with a role color as its background to signal
  state; a rule, a border, or a word-labelled chip is used instead.
- Accent colors come from the controlled palette and follow the color contract
  in `spec/02-color.md`.

---

## 7. Do / Don't

**Do**
- force radius to zero everywhere except a circular graphic
- build structure from 1px solid / 1px dotted rules, 2px window borders,
  3px status-bar border
- separate overlays by material step + hairline; reserve the one flat
  hard-offset shadow for the content sheet
- keep buttons word-labelled, mono, uppercase, hairline-bordered
- apply accents as left rules or borders

**Don't**
- add gradients, blur, translucency, decorative/soft shadows, or shadows on
  overlays
- round corners on any container or control
- fill surfaces with role colors for emphasis
- stack multiple shadows or add blur to the sanctioned offset shadow

---

## 8. Accessibility notes

- The content sheet's hard offset shadow is not the sole indicator of state;
  it is paired with border color or a label where state matters. Overlay
  separation stays legible without a shadow, through the material step and
  hairline alone.
- Zero radius and flat surfaces do not reduce hit-target size or
  focus-visible clarity (see `spec/09-accessibility.md`).
- Accent rules are paired with a word label so color is never the only
  carrier of meaning.
