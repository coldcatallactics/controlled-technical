# 08: Components

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** structural descriptions of the CTD component set
**Palette:** gruvbox (MIT/X11); see [ATTRIBUTION.md](../ATTRIBUTION.md).
**Foundation:** This chapter derives from
[spec/00-philosophy.md](00-philosophy.md) (Overlay and Substrate); where this
chapter is less general, that one governs.

---

## Conventions

Each component below is described structurally and generically; a surface
following CTD can realize it in any rendering technology. All color names
resolve to the semantic tokens and controlled color contract of
`spec/02-color.md`; all measurements resolve to the geometry of
`spec/04-layout.md` and the surface rules of `spec/05-surface-and-shape.md`.

Every component inherits the global invariants: corner radius is 0; no
gradients, blur, translucency, or decorative shadows; color is functional
only. These are not repeated per component and apply throughout.

---

## Two chrome categories and the content surface

**Purpose.** Apply the Overlay and Substrate rule of
`spec/00-philosophy.md`: an overlay is light-soft, a substrate and its edge
are dark. Chrome has two categories: the desktop-level overlay and the
window-level edge. A transient overlay is a context of overlay, not a third
chrome category; the content surface is content, not chrome.

The two chrome categories:

- **Desktop-level overlay** (the desktop bar and launcher): light-soft, a
   legend about the whole desktop.
- **Window-level edge** (tab strip, toolbar, URL bar, window edge): dark, the
   board's own edge; sand `#c9b890` when active.

A transient overlay (a context of overlay, not a third chrome category):

- **Transient overlay** (browser menus, tooltips, panels): light-soft, laid
   over a window, then gone.

The content surface is content, not chrome:

- **Content surface**: the content a window holds; it uses its own semantic
   role tokens on the dark substrate.

It is incorrect to say "browser chrome is dark" as a blanket rule: a
browser popup is an overlay (light), a tab strip is a window edge (dark).

Floating popups (menus, tooltips, and panels) are light overlays. A
dropdown attached to and continuous with a dark chrome control is window-edge
chrome, not a floating overlay: it stays on the dark substrate, and its
selected row uses the in-surface inversion for that substrate.

---

## Tab strip

**Purpose.** A tab is a real element bound to the content surface it
stands for: it stays visually joined to that page instead of floating as a
detached chip.

**Anatomy.**
- The active tab takes the content surface's paper tone: the local fill
   inversion of the two-layer focus rule.
- It meets the page edge with no gap, so tab and page read as one surface.
- Inactive tabs stay on the dark window edge.

**Rules.**
- CTD treats a tab as belonging to its page, not as a detached chrome chip.
- The active tab shares its content surface's paper tone and sits flush with
   the page: no gap, border, or shadow separates the two.
- Focus inside the active tab stays the two-layer treatment (fill inversion
   plus a 2px ink rule), with no blue focus hue.
- Inactive tabs remain on the dark board of the window edge.
- Tabs are square and cast no shadow, under the global zero-radius rule.

---

## Content frame

**Purpose.** The primary content surface. Presents its content as an
unambiguous technical document rather than a decorated interface, an
austere, information-dense, explicit sheet.

**Anatomy.**
- A hairline-bordered sheet: `1px solid var(--line)`.
- One hard offset shadow: `4px 4px 0 rgba(0,0,0,0.35)`.
- A two-column shell: `grid-template-columns: 260px minmax(0,1fr)`
   (rail + main sheet).
- A full-width imprint spanning both columns.
- Framing: `width: min(100% - 24px, 1140px); margin: auto`.

**Rules.**
- CTD renders a hairline-bordered sheet with exactly one hard offset shadow.
- CTD composes a rail and a main sheet, plus a full-width imprint.
- The rail is non-sticky; the whole content surface scrolls as one sheet.
- CTD collapses to a single column at viewports `<=820px`.
- CTD typically centers the sheet vertically with auto margins when content
   is short; auto margins collapse when content is taller than the viewport.

## Rail / sidebar

**Purpose.** The navigation legend of the content frame: a tonal index of
sections one step removed from the page.

**Anatomy.**
- A tonal step one rung off the paper (`surround` against `paper`).
- Active row: local fill inversion (paper background), a 2px rule in the
   rail's ink, 700 weight.
- Dotted 1px rules between blocks.
- Block padding 14-18px; block margin 6-10px.

**Rules.**
- The rail sits exactly one tonal rung off the paper background and does not
   introduce a new hue to do so.
- CTD renders the active row with a local fill inversion (paper background),
   a 2px rule in the rail's ink, and 700 weight, all three together.
- Navigation blocks are separated with 1px dotted rules.
- The rail is not sticky; it scrolls with the sheet.
- CTD typically keeps block padding within 14-18px and margins within 6-10px
   to preserve density.

## Desktop bar

**Purpose.** A top-docked legend strip carrying view state, the window
title, and live status modules, a "printed legend on a dark board" rendered
as light-soft chrome. It is a desktop-level overlay (see the chrome
categories above).

**Anatomy.**
- Top-docked at the upper edge; height driven by a 28px bar with a 24px
   content area and a 3px bar border.
- Left cluster: views (view cells 24×24px).
- Center: the window title, with generous side margins; this is the
   non-color cue for the active window.
- Right cluster: status readouts; the module set is application-defined.
   Ink/muted and fixed-width tabular values; module gaps 12px, bar
   padding 8px.
- Short uppercase monospace word labels carry readout identity; no per-module
   colors.
- View states: idle, active, focused, urgent, expressed with paper,
   ink, and rules; active/focused use fill inversion (selection), urgent can
   use red (state).

**Rules.**
- CTD uses light-soft chrome surfaces with monospace word labels and tabular
   status values.
- CTD renders status modules in ink and muted (paper/ink values from the
   palette); there are no per-module colors.
- CTD carries readout identity in short uppercase monospace word labels. Icon
   glyphs from the structural font can pair with tabular values in dense
   chrome, but the word label is present, never glyph + color alone.
- CTD reserves semantic color for actual state only: urgent = red,
   attention/in-progress = yellow.
- CTD supports the four view states idle, active, focused, urgent;
   active/focused use fill inversion as selection (not module color), and
   are distinguished using paper/ink/rules rather than color alone.
- CTD shows the active window title as a non-color focus cue, unstyled as a
   second sand or accent treatment.
- CTD centers the window title with generous side margins so it reads
   independently of the flanking clusters.
- CTD typically holds view cells at 24×24px, menu/bar rows at 28px, bar
   padding at 8px, and module gaps at 12px.

## Window borders

**Purpose.** Frame a window and communicate focus and urgency at the
boundary, the board-level focus marker of the system, paired with the
non-color cue of the active window title in the desktop bar.

**Anatomy.**
- A 2px border on fully opaque windows.
- Unfocused: muted `#7c6f64` (or neutral `#444444`).
- Focused: warm sand `#c9b890`.
- Urgent: red (`#9d0006` / `#cc241d`).
- No titlebars and no close buttons by default.

**Rules.**
- CTD renders a 2px border and keeps the window fully opaque.
- CTD uses muted `#7c6f64` (or neutral `#444444`) when unfocused, warm sand
   `#c9b890` when focused, and red when urgent.
- CTD pairs the sand active-window border with the non-color cue of the
   active window title in the desktop bar; focus is two-layered, not border
   color alone.
- CTD draws no titlebars or close buttons by default; no hidden affordances.
- CTD does not use sand inside a surface or as a second focus hue; inside any
   surface, focus/selection is local fill inversion plus a 2px rule in that
   surface's own ink, not blue.
- CTD typically reserves the warm sand value as the primary focus marker and
   does not reuse it as a decorative accent elsewhere.

## Panels / menus / tooltips

**Purpose.** Floating light-soft chrome laid over dark content: an
in-context legend for commands, values, and detail.

**Anatomy.**
- Light-soft paper background (`#f2e5bc`), brown hairline border (`#7c6f64`).
- Monospace UPPERCASE section headers with letter-spacing 0.04em-0.08em.
- Menu rows 28px; corner radius 0.

**Rules.**
- CTD uses a light-soft paper surface with a brown hairline border and casts
   no shadow; overlays are separated by their material step and a 1px
   hairline (see spec/05-surface-and-shape.md).
- CTD renders section headers in monospace uppercase with the specified
   letter-spacing.
- CTD holds menu rows at 28px.
- CTD is flat and fully opaque: no blur, no translucency, no rounded corners,
   no soft shadow.
- CTD typically keeps labels word-labelled and uppercase; icon-only entries
   are not used in content surfaces and web surfaces.

## Buttons / links

**Purpose.** Explicit, word-labelled triggers and navigation targets with no
hidden affordances.

**Anatomy.**
- Word label in monospace, 0.68rem, UPPERCASE.
- Hairline 1px border; padding 5px 9px.
- Links take the blue role; functional accents are applied as borders or
   left rules, not fills.

**Rules.**
- CTD carries a word label; it is not icon-only and does not rely on
   discovery.
- CTD uses a 1px border and a flat surface with no shadow; it does not fill
   the control with a hue as its resting state.
- CTD uses monospace uppercase labels at the stated size and padding.
- CTD typically expresses links in the blue role and applies functional
   accents as a border or left rule (for example a `0.3rem` solid left rule),
   never as a fill.

## Tables & data

**Purpose.** Present structured values as a dense, scannable record set, the
tabular analogue of the specification sheet.

**Anatomy.**
- Monospace structural headers, UPPERCASE, letter-spaced.
- Tabular numerals: fixed-width values that do not jitter.
- Dotted 1px row dividers.
- Dense cell padding; single-ellipsis truncation for overflow.

**Rules.**
- CTD renders headers in the monospace structural role, uppercase and
   letter-spaced.
- CTD uses fixed-width tabular numerals for numeric readouts so they do not
   jitter.
- CTD separates rows with 1px dotted rules and keeps cell padding dense.
- CTD truncates overflow with a single ellipsis rather than wrapping into
   ragged rows.
- CTD typically reserves chromatic values for semantic roles only; most cells
   remain paper + ink + muted.

## Callouts / status chips

**Purpose.** Mark a note, state, or condition with a controlled semantic
role, kept explicit by an accompanying word.

**Anatomy.**
- A `0.3rem` solid left rule or a word label in a semantic role color.
- Roles: green live, yellow wip, muted plan.
- Underlying contract: green = action/positive/live;
   yellow = status/in-progress/wip; muted = parenthetical notes.

**Rules.**
- CTD carries its role via a left rule or a word label, not a tinted fill.
- CTD uses green for live, yellow for wip, and muted for plan.
- CTD pairs the role color with a word label; color is not the sole carrier
   of meaning.
- CTD typically keeps the accent as a border or left rule (for example a
   `0.3rem` solid green left rule) in keeping with the functional-accent rule.
- CTD does not introduce ad-hoc hues for additional states; new states map
   to an existing controlled role.

## Figures / visualizations

**Purpose.** Render diagrams, plots, and data graphics in the same closed
colour language as the rest of the system, so a figure reads as part of the
specification sheet.

**Anatomy.**
- Semantic role colors resolved as variables (the controlled color contract:
   blue links/navigation, green action/live, yellow status/wip, red
   fail/urgent, aqua auxiliary, purple/orange additional quantities, muted
   notes).
- Flat, hard-edged tonal steps rather than gradients; corner radius 0.
- Fixed colour language shared with text and chrome.

**Rules.**
- CTD resolves every color to a semantic role variable, so role
   variables need no redraw.
- CTD uses flat, hard-edged tonal steps; it does not use gradients, blur,
   translucency, or decorative shadows.
- CTD applies the same controlled color contract as content surfaces and
   does not invent figure-only hues.
- CTD pairs role colors with a word label or legend entry where the color
   distinguishes data.
- CTD typically holds red, purple, aqua, and orange in reserve and defaults
   figures to paper + ink + muted, as on other surfaces.
