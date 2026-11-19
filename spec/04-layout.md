# 04: Layout & Geometry

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** grid composition, content frame, rail, desktop bar, window
  geometry, spacing rhythm, breakpoints
**Palette:** gruvbox (MIT/X11); see [ATTRIBUTION.md](../ATTRIBUTION.md).
**Foundation:** This chapter derives from
[spec/00-philosophy.md](00-philosophy.md) (Overlay and Substrate); where this
chapter is less general, that one governs.

---

## 1. Composition model

CTD surfaces are composed on a grid. Structure is expressed through placement
and hairline rules, not through ornament. The page is a single scrolling
sheet; chrome is docked; density is intentional.

- CTD composes the primary content surface on a grid; it does not use
  free-floating absolute positioning for primary structure.
- The whole content surface scrolls as one sheet; the rail is not sticky.
- Dense, explicit arrangements are favoured over whitespace-heavy ones.

### Layout diagram

```
+--------------------------------------------------------------+  <- viewport
|  DESKTOP BAR (docked top, 28px outer / 24px content)         |
|  [VIEWS] [active][focused]  |   WINDOW TITLE   | STATUS READOUTS (application-defined) |
+----------------------------+-----------------------------------+
| RAIL (260px)               | MAIN SHEET (minmax(0,1fr))        |
|  . BLOCK HEADER            |  . section rule (1px dotted)      |
|   - item                    |  Title                            |
|   - item                    |  body text ...                    |
|  :                          |                                   |
|  . BLOCK HEADER            |  [ BUTTON ]  [ BUTTON ]           |
|   - item                    |                                   |
+----------------------------+-----------------------------------+
|  IMPRINT (full width)                                          |
+--------------------------------------------------------------+
        |                                    |
        +-- content frame, 1px solid border, one hard offset shadow --+
```

---

## 2. Content frame

The primary content frame is a hairline-bordered sheet with a single hard
offset shadow. Its width and placement are fixed by one rule:

```css
width: min(100% - 24px, 1140px);
margin: auto;
border: 1px solid var(--line);
```

- The frame rule above applies verbatim to the primary content frame. The
  `24px` inset and `1140px` cap are fixed.
- The frame carries the single sanctioned hard offset shadow defined in
  `spec/05-surface-and-shape.md`; no other shadow is added.
- `margin: auto` performs two duties: it centers the frame horizontally, and
  it centers a short content surface vertically. When the content surface is
  taller than the viewport, the auto margins collapse and the sheet scrolls
  normally.
- Auto margins collapse; vertical centering is not forced in a way that clips
  a tall content surface.
- A full-width imprint is included as the last block of the frame.

---

## 3. Two-column shell

Inside the frame, the body is a two-column shell:

```css
grid-template-columns: 260px minmax(0,1fr);
```

- The shell uses `260px minmax(0,1fr)` on wide viewports. The `minmax(0,1fr)`
  main track is allowed to shrink below its content width; it does not force
  horizontal overflow.
- The first column is the rail; the second is the main sheet.
- At `<=820px` the shell collapses to one column: the rail stacks above (or
  resolves into) the main sheet, and no horizontal track remains fixed at
  260px.
- The rail's tonal step is kept distinct from the main sheet (see
  `spec/08-components.md`).

### Rail behavior

- The rail is not sticky. It scrolls with the content surface.
- Rail blocks are separated with 1px dotted rules.
- Rail blocks use 14-18px vertical padding.
- The active row carries a paper background, a 2px inset left accent bar, and
  700 weight.

### Tree connectors

- Structural tree connectors are 1px dotted lines; solid lines, gradients, and
  connector arrowheads are not used for tree structure.

---

## 4. Desktop bar

The desktop bar is a fixed piece of light-soft chrome docked at the top of the
viewport. It is a desktop-level overlay: a legend about the whole desktop; see
the chrome categories in `spec/08-components.md` and the Overlay and
Substrate rule in `spec/00-philosophy.md`.

- The desktop bar is top-docked at the upper edge; it is not embedded in the
  scrolling content surface.
- Height is driven by a **28px bar** with a **24px content area**; both figures
  are preserved: 28px outer, 24px content.
- Bar padding is `8px`; gaps between modules are `12px`; menu rows are `28px`.
- View cells are `24px × 24px`.
- The 3px desktop-bar border from `spec/05-surface-and-shape.md` applies.

### Clusters

| Cluster | Position | Contents |
| --- | --- | --- |
| Left | start | Views, rendered as 24×24 view cells with idle / active / focused / urgent states. |
| Center | middle | Window title, with generous side margins. |
| Right | end | Status readouts: application-defined set of word-labelled values. |

- The bar has the three clusters above. The center window title has generous
  side margins so it does not collide with either cluster.
- Status-module values are rendered in fixed-width / tabular form so numeric
  readouts do not jitter (see `spec/03-typography.md`).
- Status modules are rendered in ink and muted (paper/ink values from the
  palette); there are no per-module colors.
- Each status readout has a short uppercase monospace word label; the specific
  module set is application-defined.
- Semantic color is reserved for actual state only: urgent = red,
  attention/in-progress = yellow.
- icon glyphs from the structural font can pair with tabular values in dense
  chrome, but the word label is present, never glyph + color alone.
- Active / focused view cells use fill inversion as selection (not module
  color); urgent cells can use red for state.

---

## 5. Window geometry

Window layout is governed by gaps, border width, and opacity. These values are
fixed.

| Property | Value |
| --- | --- |
| Inner gaps (horizontal / vertical) | `3px / 3px` |
| Outer gaps (horizontal / vertical) | `5px / 5px` |
| Window border | `2px` |
| Opacity | fully opaque |

- Inner gaps are `3px/3px` and outer gaps are `5px/5px`.
- The window border is `2px`. Border state color (unfocused / focused / urgent)
  is defined in `spec/08-components.md`. Warm sand `#c9b890` marks the active
  window, paired with the non-color cue of the active window title in the
  desktop bar.
- Windows are fully opaque; translucency, blur, or opacity is not applied to
  window surfaces.
- Titlebars and close buttons are omitted by default.

---

## 6. Spacing rhythm

Spacing is compact and deliberate.

| Context | Range |
| --- | --- |
| General padding blocks | `6px - 18px` |
| Rail blocks | `14px - 18px` |
| Margin between blocks | `6px - 10px` |

- Spacing stays within the compact `6-18px` range; large open gutters are not
  introduced.
- Rail blocks sit at the upper end (`14-18px`) and inter-block margins at
  `6-10px`.
- Density is intentional; spacing is not enlarged to reduce information density.

---

## 7. Breakpoints

| Breakpoint | Effect |
| --- | --- |
| `<=820px` | Two-column shell collapses to one column (rail no longer a fixed 260px track). |
| `<=560px` | Components reflow: clusters and multi-part controls wrap or stack. |

- The shell collapses to one column at `820px`.
- Components reflow at `560px`.
- The fixed 28px/24px status-bar geometry is preserved across breakpoints,
  reflowing cluster contents rather than resizing the bar.

---

## 8. Do / Don't

**Do**
- compose on a grid with a 260px rail and shrinkable main track
- keep the content surface a single scrolling sheet with a non-sticky rail
- use the exact frame, gap, padding, and breakpoint values above
- draw tree connectors as 1px dotted lines

**Don't**
- make the rail sticky or split the content surface into independent scroll
  regions
- force vertical centering on tall content surfaces
- allow the main track to overflow horizontally
- add translucency or blur to windows or chrome

---

## 9. Accessibility notes

- Reflow at the defined breakpoints does not hide or truncate required controls.
- The docked desktop bar remains readable at 24px content height; values stay
  tabular.
- Dotted structural connectors are not the sole carrier of hierarchy; pair
  them with textual headings.
