# 06: Motion

**Status:** v1.0, settled
**Version:** 1.0
**Scope:** easing curves, allowed transitions, durations, global and
reduced-motion behavior
**Palette:** gruvbox (MIT/X11); see [ATTRIBUTION.md](../ATTRIBUTION.md).

---

## 1. Principle and scope

Motion is schematic and indicative. It is governed by corollary 4 of the
Overlay and Substrate philosophy (`spec/00-philosophy.md`).

> **Motion exists to show where a window went, not to decorate. If it does
> not explain where something went, it does not animate.**

These rules apply to system chrome and surfaces. An application's own
functional animation can be out of scope.

---

## 2. One curve

One curve governs every permitted transition; no others are introduced.

| Curve | Value | Use |
| --- | --- | --- |
| Governing curve | `cubic-bezier(0.2, 0, 0, 1)` | Every permitted transition. |

- CTD uses `cubic-bezier(0.2, 0, 0, 1)` for all permitted motion.
- CTD does not define or use any additional easing curve.
- Token mapping: `--ct-ease`.

---

## 3. Allowed transitions

Only window and view transitions animate. Everything else is instant.

- CTD animates only: window/view open, window/view close, view switch,
   and window move/resize.
- Focus changes, hover, menus, tooltips, the desktop bar, and tab
   changes are instant (`0ms`) and never animated.
- Pointer dragging follows the pointer directly, without animation.
- Color fills, text, badges, scroll position, and decorative elements are
   never animated.
- Blur is kept off and never animated; motion is kept off on
   security-critical surfaces.

---

## 4. Durations

| Transition | Duration | Curve |
| --- | --- | --- |
| Window/view open | `100ms` | governing |
| Window/view close | `80ms` | governing |
| View switch | `120ms` | governing |
| Window move/resize | `120ms` | governing |
| Focus, hover, menus, tooltips, desktop bar, tab change, pointer drag | `0ms` (instant) | none |

- Every animated transition is within `80-120ms`, using the exact values
   above.
- Focus, hover, menus, tooltips, the desktop bar, tab changes, and
   pointer dragging are instant.
- Token mapping: `--ct-duration-*`.

---

## 5. Global and reduced motion

- CTD supports a global "motion off" setting that, when enabled, snaps any
   running transition to its final state immediately.
- CTD honors the `prefers-reduced-motion` preference: when set, all animation
   and transition are snapped to its final state, overriding the
   per-transition rules above.
- Motion stays off on security-critical surfaces regardless of the global
   setting.
- Motion-off and reduced-motion behavior does not change layout, structure,
   or information; only motion is removed.

---

## 6. Do / Don't

**Do**
- animate only window/view open, close, view switch, and move/resize
- use the single governing curve with the exact durations above
- make focus, hover, menus, tooltips, the desktop bar, and tabs instant
- have pointer dragging follow the pointer directly
- support global motion-off (snapping to final state) and honor reduced-motion

**Don't**
- animate focus, hover, tabs, color changes, or the desktop bar
- introduce a second easing curve or blur-based motion
- animate security-critical surfaces
- lengthen durations beyond `80-120ms`

---

## 7. Accessibility notes

- `prefers-reduced-motion` snaps all animation and transition to its final
   state (also see `spec/09-accessibility.md`).
- Instant state changes remain perceivable via non-motion signals
   (border color, label, focus indicator).
- Motion is never required to understand or operate any control.
