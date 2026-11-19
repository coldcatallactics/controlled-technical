# 09: Accessibility

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** focus, semantic state, motion, color-plus-label, and contrast
requirements
**Palette:** gruvbox (MIT/X11); see [ATTRIBUTION.md](../ATTRIBUTION.md).

---

## Recognition

A surface reads as CTD when its accessibility behaviors match the
characteristics below. These apply in both the dark content surfaces and
the light-soft chrome surfaces, and in every component described in
`spec/08-components.md`.

---

## 1. Visible focus indicators

Every interactive element exposes a visible focus indicator when reached by
keyboard. The indicator is driven by the focus-visible state so it appears
for keyboard navigation without being forced on pointer interaction.

- Focus is two-layered. Sand `#c9b890` marks the ACTIVE WINDOW (board) only
  (a 2px border), paired with the active window title in the desktop bar as
  a non-color cue.
- Inside any surface, focus and selection are a local fill inversion plus a
  2px rule in the surface's own ink: `#3c3836` on light overlays, `#d5c4a1`
  on dark substrates. There is no blue focus hue and no second focus color;
  blue remains the link/navigation role.
- The indicator remains visible against both dark content surfaces and
  light-soft chrome surfaces.
- The active window edge uses the warm-sand marker (`#c9b890`) defined in
  `spec/08-components.md` and `spec/02-color.md`; sand never appears inside
  a surface.
- CTD does not remove or reduce the focus indicator for any interactive
  element, including buttons, links, menu rows, and table controls.

## 2. Semantic HTML and ARIA state

Where a native semantic element or attribute exists, CTD uses it in
preference to a visual-only imitation. Interactive state is exposed
programmatically as well as visually.

- Navigation and selection state is conveyed with the appropriate
  semantics: for example `current`, `pressed`, and `selected`.
- The active rail row, the active view, and any toggled button expose
  their state through the matching semantic attribute, not through
  the ink bar, fill inversion, or border color alone.
- Labels are associated with their controls; word labels from
  `spec/07-iconography.md` and `spec/08-components.md` satisfy this where a
  visible text label is present.
- CTD uses native elements first and reserves ARIA for state that native
  elements cannot express.

## 3. Reduced motion

The `prefers-reduced-motion` preference disables all animations and
transitions. This extends the global "motion off" setting described in
`spec/06-motion.md`.

- With reduced motion active, panel open/close, view switches, and
  window move/resize apply their end state immediately, with no
  animated interpolation.
- Hover, menu appearance, and tab changes are already instant and
  remain instant.
- Motion is limited to state changes and uses the single governing curve in
  `spec/06-motion.md`; it applies only when motion is permitted, and the
  reduced-motion preference disables it.
- Security-critical surface motion and blur stay off regardless of the
  preference.

## 4. Color is not the sole carrier of meaning

Color carries semantic information in CTD, but it is never the only
signal for that information. Every role color is paired with a word
label, or an equivalent non-color cue such as the specified active-row
accent bar and 700 weight.

- The controlled color contract pairs with explicit labels: green live,
  yellow wip, muted plan; status modules use ink and muted with word labels,
  and semantic color is reserved for actual state: urgent (red) and
  attention (yellow).
- View states idle, active, focused, urgent are distinguishable by
  paper/ink/rules and state text, not by color alone.
- Selection is expressed by fill inversion together with its semantic
  `selected`/`current` state, never by a new hue alone.
- Urgency shown by a red window border is accompanied by a word label
  or other non-color indication where the state is presented in content.
- Figures and visualizations provide a legend or word labels for
  role-colored series, per `spec/08-components.md`.

## 5. Contrast

The gruvbox pairs fixed by this specification meet readable contrast in
both of their defined surfaces.

- Dark content surfaces use the dark-medium pair: `bg0 #282828` with
  `fg1 #ebdbb2` as the primary text pairing; secondary and tertiary
  foregrounds step down through the defined `fg2`-`fg4` and `gray` roles.
- Light-soft chrome uses the paper pair: `bg #f2e5bc` with `fg #3c3836` as
  the primary text pairing; `muted #665c54` for secondary text.
- Bright variants (for example blue `#83a598`) are used only where
  contrast on `bg0` demands it, links, and are not applied as a
  general-purpose foreground.
- The in-surface focus rule uses the surface's own ink (`#3c3836` on
  light overlays, `#d5c4a1` on dark substrates) so the indicator clears the
  contrast requirement on its background; the active window edge uses sand
  `#c9b890`.
- CTD verifies any new foreground/background pairing against an established
  contrast criterion before adopting it; it does not lower contrast to achieve
  a tonal effect.

---

## CTD characteristics

A surface reads as CTD when it shows every characteristic below. Each item
is derived directly from the requirements in this chapter.

- [ ] CTD shows a visible focus indicator on every interactive element,
      driven by the `focus-visible` state.
- [ ] CTD shows two-layered focus: sand `#c9b890` marks only the active
      window edge (plus its title in the desktop bar), and in-surface focus
      is a local inversion plus 2px rule in the surface's own ink; no blue or
      second focus hue.
- [ ] CTD keeps focus indicators visible on both dark content
      surfaces and light-soft chrome surfaces.
- [ ] CTD exposes interactive state (`current`, `pressed`, `selected`)
      through semantic HTML or ARIA, not by styling alone.
- [ ] CTD uses native semantic elements where available; ARIA is
      reserved for state native elements cannot express.
- [ ] CTD associates visible word labels with their controls; no
      control is icon-only where a word label is required.
- [ ] CTD disables all animations and transitions under
      `prefers-reduced-motion`, applying end states immediately.
- [ ] CTD keeps hover, menu appearance, and tab changes instant,
      and security-critical surface motion and blur off.
- [ ] CTD shows no role color as the sole carrier of meaning; each is
      paired with a word label or equivalent non-color cue.
- [ ] CTD distinguishes view states (idle, active, focused, urgent) by
      paper/ink/rules and text, not color alone.
- [ ] CTD uses fill inversion plus semantic state for selection,
      never a new hue alone.
- [ ] CTD includes a legend or word labels for role-colored series in
      figures and visualizations.
- [ ] CTD uses the dark-medium pair for text on content surfaces and the
      paper pair on light-soft chrome.
- [ ] CTD uses bright color variants only for links where contrast
      on `bg0` demands it.
- [ ] CTD checks new foreground/background pairings against an
      established contrast criterion before adoption.
