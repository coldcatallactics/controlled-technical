# 01: Overview

## Definition

Controlled Technical Design (CTD) is a visual language governed by a controlled
vocabulary, a restricted palette with fixed semantic meanings, two fixed type
roles, and hairline structure, arranged so a surface reads as an unambiguous
technical document rather than a decorated interface.

## Core character

The design is, in its own terms:

- "austere, information-dense, explicit, engineered rather than decorative"
- "dense over sparse, verbosity over opacity"
- deliberately rejects whitespace-heavy minimalism
- "flat and explicit", "no hidden affordances"
- "functional colour only"
- "hairline structure"
- a technical-document / specification-sheet surface
- "printed legend on a dark board"

These are not aspirations to be approximated; they are the acceptance criteria
for the visual result. A surface that is sparse, decorative, softly shaded, or
reliant on hidden affordances is outside the design regardless of how closely
its colors match.

## The controlled-vocabulary metaphor

A controlled vocabulary is a closed list of permitted terms in which each term
carries exactly one designated meaning; synonyms and ad-hoc coinages are
excluded. CTD applies that discipline to visual design. The palette is a closed
list of semantic roles, the type system is a closed list of two roles, and
structure is a closed list of hairline treatments. Every visual decision is a
selection from that list, never an invention outside it.

The consequence is legibility of intent: because a role has one meaning, a
color or label can be read without ambiguity. Green is action, yellow is
status, blue is links and navigation, red is failure, while red, purple, aqua,
and orange remain held in reserve so that their appearance is meaningful.
Selection is expressed by fill inversion rather than a new hue, so structure
never competes with vocabulary. See [02-color.md](02-color.md) for the full
palette and role contract; this overview does not reproduce the color values.

## Two-material model

CTD treats a surface as two distinct materials rather than one uniform field.
The underlying principle, "Overlays are light; substrates and their edges are
dark", is defined in [00-philosophy.md](00-philosophy.md).

- **Dark content (substrate).** Window interiors and terminal buffers use the
  dark variant at medium contrast. This is the writing surface: deep, neutral,
  and quiet, so that foreground text and semantic accents carry the
  information.
- **Content surfaces (content, not chrome).** A content surface is the region an
  application renders and styles. External files, PDFs, and embedded
  third-party content are out of scope; only the CTD chrome around them is
  styled. Content surfaces use the dark substrate ramp and their own semantic
  role tokens.
- **Light chrome (overlay).** Menus, tooltips, popups, overlays, the launcher,
  and the desktop bar use the light-soft variant, a paper-like layer. Window
  borders and window edges are dark substrates. The active window's edge
  alone turns warm sand `#c9b890`; inside any surface, focus and selection use
  a local fill inversion plus a 2px rule in that surface's own ink
  (`#3c3836` on light overlays, `#d5c4a1` on dark substrates). Exact values are
  specified in [02-color.md](02-color.md).

The relationship between the two is the point: light overlays laid over dark
substrates: a paper-like legend over dark content, "printed legend on a dark
board." The dark field is the substrate board; the light layer holds the
labels, controls, and navigation that frame it. The content surface between
them uses the dark substrate ramp with its own semantic roles. Keeping the
materials distinct makes it clear which region is chrome and which is framed
content.

## Contrast budget

NORMATIVE. Only one active-board marker (the sand edge) and one active-element
marker (a local inversion plus 2px rule) appear at a time. Fields spend the
least contrast, thin rules a little, and focus the most; color is reserved for
labels on the legend.

## Design goals

- Make dense information explicit and readable without decoration.
- Give every color, type role, and structural line a single, predictable
  function.
- Produce components that read as a specification sheet: hairline borders,
  dotted rules, uppercase mono labels, tabular numerals, and a single hard
  offset shadow.
- Keep state visible: word-labelled controls, visible focus, and color paired
  with a word label.
- Use one set of semantic roles for dark content surfaces, so role
  variables need no redraw.
- Permit motion only where it communicates structure, and honor the
  reduced-motion preference.

## Non-goals

- Whitespace-heavy minimalism and the aesthetic of sparse, airy layouts.
- Decoration for its own sake: gradients, blur, translucency, rounded corners,
  and soft shadows.
- Hidden affordances, icon-only controls in content surfaces, and anything that
  be discovered rather than read.
- Functional color used decoratively, or the introduction of ad-hoc hues
  outside the controlled vocabulary.
- Animation of hover, menu appearance, tab changes, or anything other
  than structural transitions.
- Being a recoloring applied to an otherwise arbitrary interface. CTD is a
  system with a defined structure and behavior, not a theme.

## A system, not a theme

A theme changes the appearance of a surface that already exists. CTD specifies
the surface itself: its vocabulary, its two-material relationship, its
geometry, its component grammar, and its behavior under focus, state change,
and reduced motion. Components are built from the tokens and rules in this
specification rather than styled after the fact. An implementation that adopts
only the colors has not adopted CTD; the structural and behavioral rules are
part of what makes a surface read as CTD.

## Recognition

A surface is recognisably CTD to the extent it follows these rules. There is
no obligation to adopt them; they describe the design language. Adapt freely;
the closer the match, the more clearly the result reads as CTD. The rules are
collected in [README.md](../README.md).
