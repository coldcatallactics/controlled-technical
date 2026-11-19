# Porting to a new surface or theme

## Scope

This chapter is for a person or agent porting Controlled Technical Design
(CTD) to an application, toolkit, or theme engine. It turns the settled rules
into a procedure that can be executed against a new surface.

A port reads as CTD when it applies the same decisions by ROLE (
classification, material, focus, color, elevation, motion, contrast, shape,
and type) rather than copying values from any one existing implementation.
Hard-coding an application to a fixed tone does not read as CTD.

## Decision procedure

Apply these steps in order to the surface being designed. Each step is a
question about that surface, not about the application that hosts it.

1. **Is the surface an overlay, a substrate, or the substrate's edge?**
   - Classify by interaction: read from or chosen from → overlay; worked
     within → substrate; marks board ownership → edge (the active window
     edge).
   - Assign every layer deliberately. Overlays are system chrome only (bar,
     launcher, popups, menus, tooltips, panels); the content surface is
     content that chrome frames, using semantic role tokens directly on the
     dark substrate.

2. **Which material follows from that class?**
   - Overlays use light-soft; substrates and edges use dark-medium.
   - A port uses dark substrate and content surfaces with light-soft
     overlays; a host platform light mode is outside CTD.

3. **Assign tonal direction:** within each material the ground is most
   recessive; raised/hover surfaces step one rung toward that material's
   ink; selection/focus uses fill inversion as a separate primitive.

4. **Where does focus live?**
   - Sand `#c9b890` marks only the active window edge, paired with a
     non-color title cue.
   - Everything inside a surface uses fill inversion plus a 2px rule in
     that surface's own ink.
   - There is no blue focus, no second hue, and no role-color focus.

5. **Which semantic role, if any, carries color?**
   - Map color by role only: green action, yellow status/attention, blue
     links, red urgent/fail, aqua auxiliary, muted notes.
   - Color does not decorate and does not carry focus alone.

6. **Does the surface need elevation?**
   - Overlays do not cast shadows.
   - Only a content sheet uses the hard offset `4px 4px 0` shadow; soft
     shadows are not used anywhere.

7. **Does anything animate?**
   - Use one curve, `cubic-bezier(0.2, 0, 0, 1)`, at 80-120ms.
   - Only open, close, view-switch, and move/resize animate.
   - Focus, hover, menus, tooltips, and tabs are instant.
   - Global motion-off and reduced-motion are honored.
   - An application's own functional animation (e.g. an explanatory
     visualization) can be explicitly out of scope.

8. **Is the contrast budget respected?**
   - Show no more than one active-board marker and one active-element
     marker at a time.
   - Fields recede.

9. **Do shape and type follow the fixed grammar?**
   - Corner radius is 0; use hairline/dotted structure.
   - Use uppercase mono structural labels with tracking and tabular values.
   - Controls are word-labelled; keep the layout dense.

## Token wiring map

| CTD concept | canonical token(s) | what to set in a new platform |
| --- | --- | --- |
| Overlay ground / ink / brown hairline | `--ct-chrome-bg`, `--ct-chrome-fg`, `--ct-chrome-border` | paper `#f2e5bc`, ink `#3c3836`, hairline `#7c6f64` |
| Substrate ground / ink | `--ct-bg0`, `--ct-fg1` | ground `#282828`, ink `#ebdbb2` (dark-medium) |
| Raise step (dark / light) | `--ct-bg0-soft`, `--ct-bg1` / `--ct-chrome-bg1`, `--ct-chrome-bg2` | `#32302f` → `#3c3836` / `#ebdbb2` → `#d5c4a1` |
| Board focus | `--ct-color-focus-board`, `--ct-focus-sand` | sand `#c9b890` on the active window edge only |
| In-surface focus ink | `--ct-color-focus-element` | light `#3c3836`, dark `#d5c4a1`; fill inversion + 2px rule |
| Semantic link / action / status / urgent | `--ct-color-link`, `--ct-color-action`, `--ct-color-status`, `--ct-color-danger` | blue links, green action, yellow status, red urgent/fail; word-label each |
| Radius | `--ct-radius` | `0` everywhere (the only exception a circular graphic) |
| Single shadow (content sheet) | `--ct-shadow-panel` | `4px 4px 0 rgba(0,0,0,0.35)` on the sheet only |
| Single easing + duration | `--ct-ease`, `--ct-duration-fast`, `--ct-duration-medium` | `cubic-bezier(0.2, 0, 0, 1)`; 80-120ms |

Platform constraints:

- CTD is single-mode → set dark-substrate and light-soft overlay values
  directly; no theme attribute or switch is needed.
- If icon glyphs from the structural font are unavailable → use plain
  uppercase word labels; keep the tabular value.
- No CSS `box-shadow` → use the material step plus a 1px hairline; do not
  substitute a soft shadow.

## CTD characteristics

A port reads as CTD when it shows each characteristic below.

- [ ] Classification/material: is every chrome surface classified
      as overlay, substrate, or edge, with light-soft for overlays and
      dark-medium for substrates/edges? Is the content surface using
      semantic role tokens directly on the dark substrate?
- [ ] Focus, board layer: does sand `#c9b890` appear on exactly
      one active window edge only, paired with a non-color title cue?
- [ ] Focus, in-surface layer: is every in-surface focus a fill
      inversion plus 2px rule in that surface's own ink (`#3c3836` light /
      `#d5c4a1` dark), with no blue or second hue?
- [ ] Raised/hover surfaces step one rung toward the material's
      ink; selection/focus is fill inversion, not a tone.
- [ ] Color roles: does every color map to a semantic role
      (green action, yellow status, blue links, red urgent, aqua auxiliary,
      muted notes) with a word label, and no module or decorative colors?
- [ ] Shadows: do no overlays, menus, tooltips, or controls cast
      a shadow, and does only the content sheet use one flat `4px 4px 0`
      hard shadow?
- [ ] Motion curve/duration: is the only easing
      `cubic-bezier(0.2, 0, 0, 1)` with every animated transition in
      80-120ms?
- [ ] Instant states/reduced-motion: are focus, hover, menus,
      tooltips, and tabs instant (0ms), and do global motion-off and
      reduced-motion snap all motion to the end state?
- [ ] Contrast budget: at any instant, is there no more than one
      active-board marker and one active-element marker, with fields
      receding?
- [ ] Radius/structure: is radius 0 (the only exception a
      circular graphic), with 1px solid borders, 1px dotted rules, and no
      gradients, blur, or translucency?
- [ ] Shape/type: are structural labels uppercase mono with
      tracking, values tabular, and every control word-labelled in a dense
      layout?

## Theme and file naming

A port keeps a recognizable CTD identity in its name.

## Attribution when porting

A port keeps the gruvbox credit and the MIT/X11 notice, and the U.S.
Graphics Company (USGC) inspiration credit, in
[ATTRIBUTION.md](../ATTRIBUTION.md) unchanged. A port does not drop, reword,
or relocate those notices.
