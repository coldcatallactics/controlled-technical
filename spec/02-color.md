# CTD: Color Specification

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** palette, semantic roles, controlled color contract, two-layer focus

The color system is a closed vocabulary: a restricted dark neutral ramp, one
chromatic accent set with fixed semantic meanings, and a light-soft chrome
surface. Colors are never decorative. A surface is composed almost entirely
from paper, ink, and muted roles, with accents held in reserve for defined
signals.

---

## 1. Source and credit

The palette is the **gruvbox** color scheme, created by Pavel Pertsev
(morhetz), licensed under the MIT/X11 license, Copyright (c) 2017 Pavel
Pertsev.

The full notice and licensing terms are in [ATTRIBUTION.md](../ATTRIBUTION.md).

Two materials are used:

- **Dark, medium contrast**: substrate surfaces (window interiors and
  terminal buffers).
- **Light-soft**: overlays and chrome (desktop bar, menus, tooltips, popups,
  launcher; window borders and window edges remain dark substrates).
- **Content surfaces**: content with their own semantic role tokens (§5); they
  use the dark substrate ramp.

The two-material relationship, light overlays over dark substrates, is a
paper-like legend laid over dark content: "printed legend on a dark board."
This is the Overlay and Substrate principle defined in
[00-philosophy.md](00-philosophy.md). Content surfaces use the dark substrate
ramp.

---

## 2. Dark neutral ramp

Dark variant, medium contrast. These are the structural neutrals for content
surfaces.

| Token | Hex | Role |
| --- | --- | --- |
| `bg0` | `#282828` | primary content background |
| `bg0_soft` | `#32302f` | raised surface / selected-tab surface |
| `bg1` | `#3c3836` | - |
| `bg2` | `#504945` | - |
| `bg3` | `#665c54` | border / hairline / muted rule |
| `bg4` | `#7c6f64` | muted border / secondary rule |
| `fg0` | `#fbf1c7` | max emphasis |
| `fg1` | `#ebdbb2` | primary foreground |
| `fg2` | `#d5c4a1` | secondary foreground |
| `fg3` | `#bdae93` | - |
| `fg4` | `#a89984` | tertiary |
| `gray` | `#928374` | disabled / comments |

---

## 3. Chromatic accents

Each accent has a dark value and a bright variant.

| Accent | Value | Bright |
| --- | --- | --- |
| red | `#cc241d` | `#fb4934` |
| green | `#98971a` | `#b8bb26` |
| yellow | `#d79921` | `#fabd2f` |
| blue | `#458588` | `#83a598` |
| purple | `#b16286` | `#d3869b` |
| aqua | `#689d6a` | `#8ec07c` |
| orange | `#d65d0e` | `#fe8019` |

Bright variants are used **only** where contrast against `bg0` demands it (for
example links). They are not a general-purpose brightening of the palette.

---

## 4. Light-soft chrome surface

For menus, tooltips, popups, the desktop bar, and the launcher. Paper-like
surface with ink text and a brown hairline rule.

| Token | Hex | Role |
| --- | --- | --- |
| `bg` | `#f2e5bc` | paper |
| `bg1` | `#ebdbb2` | raised / hover |
| `bg2` | `#d5c4a1` | - |
| `fg` | `#3c3836` | ink on paper |
| `muted` | `#665c54` | - |
| `border` | `#7c6f64` | brown hairline / rule |

Focus inside any surface is not a color: use local fill inversion plus a 2px
rule in the surface's own ink (`#3c3836` on light overlays, `#d5c4a1` on dark
substrates). The active window's board edge alone turns sand `#c9b890`.

---

## 5. Semantic roles

Content-surface roles with their dark values. Implementations use these
dark values for every semantic token.

| Role | Value | Function / notes |
| --- | --- | --- |
| `paper` | `#32302f` | page / content surface background |
| `surround` | `#282828` | body behind the frame; hover |
| `ink` | `#d5c4a1` | text, borders, active navigation |
| `muted` | `#a89984` | secondary text, notes |
| `muted-2` | `#928374` | tertiary |
| `line` | `#665c54` | hairlines, dotted rules |
| `red` | `#cc241d` | fail / urgent / error |
| `green` | `#98971a` | action / positive / live |
| `yellow` | `#d79921` | status / in-progress / WIP |
| `blue` | `#458588` | links / navigation |
| `purple` | `#b16286` | additional quantity |
| `aqua` | `#689d6a` | auxiliary constructions / projections / ghosts |
| `orange` | `#d65d0e` | additional quantity |

---

## 6. Tonal direction within a material

Within a material, the ground is the most recessive tone; raised and hover
surfaces step one rung toward that material's ink.

| Material | Ground (recessive) | Ink | Raise steps (toward ink) |
| --- | --- | --- | --- |
| Dark substrate | `#282828` | `#ebdbb2` | `#32302f` → `#3c3836` → `#504945` |
| Light overlay | `#f2e5bc` | `#3c3836` | `#ebdbb2` → `#d5c4a1` |

- Raised and hover surfaces step one rung toward the ink, not jump.
- Selection/focus is fill inversion, a separate primitive; see
  [Two-layer focus and border states](#8-two-layer-focus-and-border-states).
- Urgent/attention use semantic accent colors, not tonal steps.

---

## 7. Controlled color contract

Each role has one fixed meaning. The mapping below is invariant across
surfaces.

| Role | Fixed meaning |
| --- | --- |
| green | action / positive / live |
| yellow | status / in-progress / WIP |
| blue | links / navigation |
| red | fail / urgent / error |
| aqua | auxiliary constructions, projections, ghosts |
| purple / orange | additional quantities |
| muted | parenthetical notes |

Contract rules:

- **Reserve.** Red, purple, aqua, and orange are held in reserve. Most
  surfaces use paper + ink + muted only.
- **Selection by inversion.** Selection is expressed as a fill inversion,
  never as a new hue.
- **Variables in figures.** The same contract governs figures and
  visualizations: colors are semantic role names resolved to variables, so
  role variables need no redraw.
- **Flat tonal steps.** Figures and surfaces use flat, hard-edged tonal steps
  rather than gradients.

Token prefix is `--ct-`; see the primitive (`--ct-bg0`, `--ct-fg1`,
`--ct-red-bright`, …) and semantic (`--ct-color-paper`, `--ct-color-ink`,
`--ct-color-focus-board`, `--ct-color-focus-element`, …) token definitions for
implementation values.

---

## 8. Two-layer focus and border states

Focus is expressed at two scales, never as a hue. Sand `#c9b890` marks the
ACTIVE WINDOW (board) only, a 2px border, paired with the active window title
in the desktop bar as a non-color cue. Inside any surface, focus and selection
use a local fill inversion plus a 2px rule in that surface's own ink: `#3c3836`
on light overlays, `#d5c4a1` on dark substrates. There is no blue focus hue and
no second focus color; blue remains the link/navigation role. Sand never
appears inside a surface. This is the one custom value layered on the palette
substrate; all other colors come from the ramp above.

| Border state | Color |
| --- | --- |
| active window | `#c9b890` (warm sand board edge) |
| inactive window | `#7c6f64` (copper/muted), or neutral `#444444` |
| urgent | `#cc241d` |

Window borders are 2px. Default windows carry no titlebar and no close button.

---

## 9. Color usage rules

To read as CTD, a surface uses color as described below.

### Core rules

- CTD applies the controlled color contract: green = action, yellow = status,
  blue = links/navigation, red = fail, aqua = auxiliary, purple/orange =
  additional quantity, muted = note.
- Red, purple, aqua, and orange are held in reserve; ordinary surfaces stay
  at paper + ink + muted.
- Selection and in-surface focus use fill inversion plus a 2px rule in the
  surface's own ink, never a new hue.
- Figure and visualization colors resolve as semantic variables, so role
  variables need no redraw.
- Every semantic token has a single dark value.
- Every semantic color is paired with a word label; color is never the sole
  carrier of meaning.
- The active window is marked with sand `#c9b890` plus its title in the
  desktop bar; there is no second focus hue and blue is not used for focus.
- Surfaces are flat and explicit, with functional accents applied as borders
  or left rules rather than fills.

### Excluded uses

- Color is not used decoratively, and no ad-hoc hues are introduced outside
  the fixed set.
- Gradients are not used.

### Typical practice

- Bright variants are used only where contrast against `bg0` demands it
  (links).
- Accents are applied as borders or left rules (for example a green left rule
  marking a live callout).
- Light-soft chrome is kept distinct from dark content surfaces.

### Discouraged practice

- The palette is not brightened indiscriminately; the bright set is
  conditional, not stylistic.

---

## 10. Accessibility

- Dark-medium and light-soft pairs are selected to meet readable contrast.
- Bright variants are introduced only where contrast on `bg0` demands it; they
  are a contrast remedy, not a decorative option.
- Color is never the sole carrier of meaning: every role color is paired with
  a word label (for example "live", "WIP", "error").
- Visible focus indicators are required on all interactive elements: mark the
  active window with sand `#c9b890` plus its title in the desktop bar, and mark
  in-surface focus with local fill inversion plus a 2px rule in the surface's
  own ink; there is no blue focus hue.
- See `spec/09-accessibility.md` for the full accessibility contract.

---

## Do / Don't

**Do**

- keep surfaces dense and explicit
- use hairline and dotted structure
- use functional accents only
- pair color with a word label
- keep figures in flat, hard-edged tonal steps

**Don't**

- use color decoratively or introduce ad-hoc hues
- represent selection with a new hue instead of an inversion
- rely on color alone to convey state
- add gradients

---

*Palette: gruvbox, MIT/X11, Copyright (c) 2017 Pavel Pertsev,
[ATTRIBUTION.md](../ATTRIBUTION.md).*
