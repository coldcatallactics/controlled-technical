# 07: Iconography

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** glyphs in system chrome, word-labelled controls, ban on
decorative icons
**Palette:** gruvbox (MIT/X11); see [ATTRIBUTION.md](../ATTRIBUTION.md).

---

## 1. Permitted glyphs

Iconographic glyphs are tolerated only in dense system chrome, where space
is at a premium and the glyph is anchored by a numeric readout.

- icon glyphs from the structural font can be used in dense system chrome and
   status readouts.
- Where a glyph appears, it is paired with a fixed-width / tabular value so
   the readout is unambiguous and does not jitter (see
   `spec/03-typography.md`).
- Glyphs are drawn from the monospace/structural type role; they do not
   introduce a separate decorative font.

---

## 2. Word labels everywhere else

Content surfaces and web surfaces use words, not icons.

- CTD word-labels controls in content surfaces and web surfaces. Controls are
   never icon-only.
- CTD does not rely on hidden affordances: the label is visible, not
   revealed on hover.
- CTD typically keeps labels in the uppercase monospace structural treatment
   used elsewhere.
- Wordmark art, lettering drawn from text glyphs, including character-cell
   art, is a word label, not a decorative icon, when it spells a readable
   name in the structural monospace font, uses a single ink color, and stays
   flat with no gradient or shadow.

---

## 3. No decorative icons

- CTD does not use decorative icons. An icon is permitted only when it
   carries information already meaningful in the controlled vocabulary.
- CTD does not introduce an icon whose meaning is not already expressed by
   a role, state, or label in the system.
- Icon color follows the controlled color contract; color is not the sole
   carrier of the icon's meaning (pair with a label or value).

---

## 4. Do / Don't

**Do**
- use icon glyphs from the structural font only in dense chrome, paired with
   tabular values
- word-label every control in content surfaces and web surfaces
- let an icon only repeat information already in the controlled vocabulary

**Don't**
- use icon-only controls or hidden affordances
- add decorative icons
- use an icon to convey something outside the controlled vocabulary

---

## 5. Accessibility notes

- Every glyph-based indicator has an equivalent text label or fixed-width
   value available; the icon is not the sole carrier of meaning.
- Icon-only affordances are prohibited in content surfaces and web
   surfaces; keep controls perceivable by label.
