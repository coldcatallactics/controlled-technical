# Philosophy: Overlay and Substrate

This chapter is the foundation of Controlled Technical Design. Every other
chapter derives from the rules stated here. Where a later chapter is less
general, this one governs.

## The premise

An interface is a stack of nests: a desktop holds a launcher and windows; a
window holds chrome and a content surface; a content surface holds sheets and
figures. Each nest is a layer, and every layer answers one binary question
before any other design decision is made: **is this layer a substrate or an
overlay?**

That answer fixes the layer's material, its edge treatment, its focus behavior,
and its motion in one step. A substrate is structural: it is a board on which
work happens, it is dark and medium-toned, and its edge is the board's frame.
An overlay is a printed legend lifted above a board: it is light and soft, and
it is read rather than worked on. Chrome has two categories; the content
surface is the content those surfaces frame. When a layer's role is ambiguous,
assign it deliberately rather than letting it inherit by accident: the eye
reads the assignment as meaning.

## The core statement

> **Overlays are light; substrates and their edges are dark.**

This single rule produces the two materials. The light/soft end is the palette's
light tones; the dark/medium end is its dark tones. Values below are the
primitive grounds; semantic roles (ink, muted, hairline) are drawn from the same
end so a material never mixes tone families.

| Material | Role | Ground | Ink | Muted | Hairline | Palette tone |
| --- | --- | --- | --- | --- | --- | --- |
| Field (light / soft) | overlay, legend, paper, sheet | `#fbf1c7` | `#3c3836` | `#928374` | `#d5c4a1` | light, soft end |
| Board (dark / medium) | substrate, window interior, edge, frame | `#282828` | `#ebdbb2` | `#a89984` | `#504945` | dark, medium end |

The palette is **gruvbox** by Pavel Pertsev (morhetz), licensed MIT/X11; see
[ATTRIBUTION.md](../ATTRIBUTION.md).

One token sits outside the two materials: sand `#c9b890`. It is the single
focus accent and it marks the active window's board edge only, never a field,
never an element inside a surface, never a second focus hue.

Overlays are light and substrates are dark; CTD has no theme switch. Content
surfaces use the dark substrate ramp; each layer keeps its material in every
case.

## Layer flow (outer → inner)

Reading from the outermost nest to the innermost, each layer's role determines
its material and its focus behavior.

| Layer | Surface role | Material | What it tells the eye | Focus / state |
| --- | --- | --- | --- | --- |
| desktop bar | outermost system legend; global status | Field (light), overlay | Orientation and whole-machine state at the edge; word-labelled status readouts in ink and muted (modules are application-specific) | The active window title is the non-color focus cue; semantic color appears only for urgent (red) or attention (yellow) |
| launcher | transient command overlay above the desktop | Field (light), overlay | A paper panel lifted over the board; light because it floats above a substrate | Selected item: local fill inversion + 2px rule in the panel's own ink; instant, no motion |
| window interior (terminal/editor/viewport) | primary work substrate; the board | Board (dark), substrate | The dense work surface; ink on dark, hairline structure, no decoration | Inside the active board, the focused cell/pane uses local fill inversion + 2px rule in the surface's own ink; no sand inside |
| window border | the edge of the board; window frame | Board edge; sand `#c9b890` only when active | Which board owns focus, read at the edge before looking inside | The active window's edge turns sand, the sole board-level marker; inactive edges stay dark board |
| browser chrome (tab strip/toolbar/URL bar) | application chrome; part of the window edge | Board (dark), edge/frame | The structural frame around the content surface; not content | Active tab: local fill inversion + 2px rule in the chrome's own ink; no blue focus hue, no second color |
| browser popups (menus/tooltips/panels) | transient overlay above the chrome | Field (light), overlay | A paper legend floating over the dark chrome; light because it is an overlay; this is why "browser chrome is dark" is too coarse | Hovered/focused row: local fill inversion + 2px rule in the popup's own ink; all instant (no motion) |
| content sheet | content framed by chrome; a sheet on a dark board | Board (dark), substrate | A discrete sheet resting on a dark board; the single hard offset shadow `4px 4px 0` is the "sheet on a board" cue | Selection/focus: local fill inversion + 2px rule in the sheet's own ink |
| figures/visualizations | embedded technical content within the sheet | Board (dark), substrate | Data as figure; hairline structure and ink/muted, color only for actual state | No independent ring; urgent/attention use semantic color; selection via local inversion + 2px rule in the figure's own ink |

## The eye path

The eye orients at the edge, finds the sand board, finds the active element
inside, then reads the sheet: the desktop bar and window edges establish
where the surfaces are; the single sand edge identifies which board is active
before any content is read; within that board one element is marked by local
inversion; and only then does the eye settle on the dark content sheet and its
figures. A popup briefly outranks this order, because it is a light overlay
lifted above the board it claims attention the moment it opens, then vanishes
on dismissal, returning the eye to the sand board it came from.

## The four corollaries

1. **Attention lives at edges.** The frame, not the field, carries orientation
   and focus. Global status is word-labelled at the desktop bar; ownership of
   focus is read at the window frame. The quiet interior fields
   carry content, not cues.

2. **Focus is two-layered.** Focus is expressed at exactly two scales: the
   active board's edge turns sand `#c9b890`, and the active element inside any
   surface uses local fill inversion plus a 2px rule in that surface's own ink.
   There is no blue focus hue and no second focus color; a field never turns
   sand and sand never appears inside a surface.

3. **Color is a label on the legend.** Module colors are removed. Status
   readouts, where an application has them, use ink and muted with word
   labels; the module set is application-specific. Semantic color is reserved
   for actual state only: urgent (red) and attention (yellow). Color
   annotates; it never decorates and never carries focus by itself.

4. **Motion is a trail between states.** Motion is
   schematic and indicative only: one curve, `cubic-bezier(0.2, 0, 0, 1)`,
   80-120ms, applied solely to open, close, view-switch, and move. Focus,
   hover, menus, tooltips, and tabs are instant. A global
   motion-off setting and the reduced-motion preference are honored.
   An application's own functional animation can be explicitly out of scope.

## The contrast budget

NORMATIVE. At any instant, exactly one thing spends the most contrast.

- CTD shows no more than one active-board marker: sand `#c9b890` appears on
  one window edge, never on two.
- Within a surface, CTD shows no more than one active-element marker: a single
  local inversion plus 2px rule at a time.
- Everything else recedes. Fields, inactive substrates and quiet overlays,
  spend the least contrast, using ink and muted with no accent.
- Color is reserved for labels on the legend: semantic color marks actual state
  (urgent/red, attention/yellow) and nothing else.
- The desktop bar's active-window title is informational, not a competing focus
  marker; it is not styled as a second sand or accent treatment.

When two claims to the most contrast collide, the edge (corollary 1) wins over
the interior, and the single active element wins over its neighbors. The budget
is a hard constraint, not a recommendation.

## Consequences

Each settled decision is the downstream result of a corollary above.

| Decision | Corollary | Consequence |
| --- | --- | --- |
| Two-layer focus (sand board + local inversion) | C1, C2 | Sand marks the active window edge only; focus inside is local inversion + 2px rule in the surface's own ink; no second focus color. |
| No shadows except the sheet's hard offset | C1, C3 | Elevation is a property of the content sheet alone (`4px 4px 0`); every other surface is flat hairline structure; no soft shadows anywhere. |
| Schematic motion | C4 | One curve, 80-120ms, structural transitions only; focus, hover, menus, tooltips, and tabs instant; reduced-motion honored. |
| No module colors | C3 | Status modules use ink/muted + word labels; semantic color reserved for urgent/attention. |
| Normative contrast budget | C1, C2, C3 | One active board and one active element at a time; fields spend least; color labels state only. |

## Scope note

This philosophy governs surface roles, not specific applications. It is applied
by asking what a layer *is* (substrate or overlay), not by naming a product and
assigning it a fixed tone. "Browser chrome is dark" is therefore
too coarse to be a rule: a browser popup (menus, tooltips, panels) is an overlay
and is light, while a tab strip is a window edge and is dark. The same
distinction resolves every other apparent exception: the content sheet is a
dark substrate, and its hard offset shadow is the cue that reads it as a
sheet rather than as a board. An implementation
that assigns material by role, rather than by application, reads as CTD; one
that hard-codes an application to a single tone does not read as CTD.
