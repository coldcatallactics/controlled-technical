# 10: Do and Don't

This chapter condenses the rules of the specification into actionable
guidance. Rationale is included to make each rule's purpose explicit;
the corresponding chapter describes the rule in full.

## Do

- **Keep surfaces dense and explicit.** Density over sparseness and verbosity
  over opacity are the design's stated character. A dense surface presents
  its information directly, so the reader does not have to infer meaning from
  empty space.
- **Use hairline and dotted structure.** One-pixel solid borders define
  containers; one-pixel dotted rules divide sections and draw tree
  connectors. This is the "hairline structure" that gives the surface its
  specification-sheet reading without visual weight.
- **Use functional accents only.** Color is functional: green for action,
  yellow for status, blue for links and navigation, red for failure, with
  the other hues held in reserve. Apply accents as borders or left rules
  rather than fills, so an accent marks meaning instead of coloring an area.
- **Use uppercase mono structural labels.** Structural labels, navigation,
  headers, metadata, tables, captions, buttons, and status values use the
  fixed monospace role with tracking and uppercase treatment. This keeps
  structure visually distinct from prose and makes values tabular.
- **Use flat surfaces.** The single sanctioned hard offset 'sheet on a board'
  shadow belongs to the CONTENT SHEET only; overlays, panels, menus,
  tooltips and controls are flat and unshadowed, separated by material step
  and a 1px hairline.
- **Pair color with a word label.** Because color is never the sole carrier
  of meaning, every role color that conveys state is accompanied by a word
  label. This preserves meaning for all readers and keeps the controlled
  vocabulary legible.
- **Mark the active window with sand `#c9b890` plus its title in the
  desktop bar.** Sand marks the active window's board edge only, never a
  surface or an element inside one. Inside any surface, focus and selection
  use a local fill inversion plus a 2px rule in that surface's own ink
  (`#3c3836` on light overlays, `#d5c4a1` on dark substrates); there is no
  blue focus hue and no second focus color.
- **Use ink and muted with word labels for status modules.** Status readouts
  use ink and muted with word labels; the module set is application-specific;
  semantic color is reserved for actual state: urgent (red) and attention
  (yellow), never per-module hues.
- **Spend contrast sparingly.** Only one active-board marker and one
  active-element marker are present at a time. Fields spend the least
  contrast, thin rules a little, and focus the most; color is reserved for
  labels on the legend.

## Don't

- **Don't simplify into whitespace-heavy minimalism.** Whitespace-heavy
  minimalism is deliberately rejected; reducing the design to a sparse, airy
  layout removes the information density that defines it.
- **Don't add gradients, blur, translucency, rounded corners, or decorative
  shadows.** Surfaces are flat and fully opaque, corner radius is zero
  everywhere, and the only shadow is the content sheet's hard offset shadow.
  These effects introduce decoration and softness that the controlled
  vocabulary excludes.
- **Don't use icon-only controls or hidden affordances.** In content
  surfaces and general surfaces, controls are word-labelled. Glyphs have a
  narrow place only in dense system chrome where they accompany tabular
  values; elsewhere an icon is never the sole label.
- **Don't use color decoratively or introduce ad-hoc hues.** Most surfaces
  are paper, ink, and muted only. Introducing a color for emphasis, or a hue
  outside the defined roles, breaks the one-meaning-per-role contract and
  dilutes the signal of the reserved hues.
- **Don't introduce a second focus hue or use blue for focus.** Blue is the
  link/navigation role; focus is sand on the active window edge (plus its
  title in the desktop bar) plus in-surface inversion and a 2px rule in the
  surface's own ink.
- **Don't animate anything except structural transitions.** Panel open/close,
  view switching, and window move and resize are the only
  transitions that animate. Hover, menu appearance, and tab changes are
  instant, and the reduced-motion preference disables all motion.

## Common failure modes

- **Rounded corners.** Softer, friendlier corners read as a decorated consumer
  surface rather than a technical document. Radius is zero everywhere; the
  only circular form is a specific graphic indicator.
- **Gradient fills.** A gradient introduces continuous, non-semantic
  variation where the system calls for flat tonal steps. It also cannot be
  resolved from a semantic role token. Use flat fills and hard-edged steps
  instead.
- **Icon-only controls.** An unlabelled glyph is a hidden affordance: its
  meaning is left to the reader to guess. Use a word label; reserve glyphs
  for the narrow, tabular dense-chrome case.
- **Decorative color.** Color applied for visual interest rather than meaning
  spends the reserved hues and makes genuine status signals harder to read.
  Keep most surfaces to paper, ink, and muted, and reserve accents for their
  defined roles.
- **Soft shadows.** Diffuse, blurred shadows imply layered, floating depth and
  conflict with the flat "spec-sheet" elevation. Use only the content
  sheet's hard offset shadow; overlays and controls cast none.
- **Airy minimalism.** Generous whitespace and sparse content contradict the
  density goal. Increase explicit structure and information, not empty space;
  short content surfaces are vertically centered only until they are tall
  enough to scroll as one sheet.
