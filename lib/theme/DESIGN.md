---
name: High-Energy Sports System
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#3a3939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1c1b1b'
  surface-container: '#201f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353534'
  on-surface: '#e5e2e1'
  on-surface-variant: '#c5c9ac'
  inverse-surface: '#e5e2e1'
  inverse-on-surface: '#313030'
  outline: '#8f9378'
  outline-variant: '#444932'
  surface-tint: '#b0d500'
  primary: '#ffffff'
  on-primary: '#2a3400'
  primary-container: '#caf300'
  on-primary-container: '#596c00'
  inverse-primary: '#536600'
  secondary: '#ffb693'
  on-secondary: '#561f00'
  secondary-container: '#fe6b00'
  on-secondary-container: '#572000'
  tertiary: '#ffffff'
  on-tertiary: '#303030'
  tertiary-container: '#e5e2e1'
  on-tertiary-container: '#656464'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#caf300'
  primary-fixed-dim: '#b0d500'
  on-primary-fixed: '#171e00'
  on-primary-fixed-variant: '#3e4c00'
  secondary-fixed: '#ffdbcc'
  secondary-fixed-dim: '#ffb693'
  on-secondary-fixed: '#351000'
  on-secondary-fixed-variant: '#7a3000'
  tertiary-fixed: '#e5e2e1'
  tertiary-fixed-dim: '#c8c6c5'
  on-tertiary-fixed: '#1b1c1c'
  on-tertiary-fixed-variant: '#474746'
  background: '#131313'
  on-background: '#e5e2e1'
  surface-variant: '#353534'
typography:
  display-lg:
    fontFamily: Anton
    fontSize: 48px
    fontWeight: '400'
    lineHeight: 52px
    letterSpacing: 0.02em
  headline-lg:
    fontFamily: Anton
    fontSize: 32px
    fontWeight: '400'
    lineHeight: 36px
    letterSpacing: 0.02em
  headline-md:
    fontFamily: Anton
    fontSize: 24px
    fontWeight: '400'
    lineHeight: 28px
    letterSpacing: 0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-bold:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '700'
    lineHeight: 16px
    letterSpacing: 0.05em
  stat-lg:
    fontFamily: Anton
    fontSize: 40px
    fontWeight: '400'
    lineHeight: 40px
    letterSpacing: -0.01em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  2xl: 48px
  gutter: 16px
  margin-mobile: 16px
  margin-desktop: 40px
---

## Brand & Style

This design system is engineered for peak performance, targeting athletes and fitness enthusiasts who demand precision and motivation. The brand personality is aggressive yet disciplined, leaning into a **High-Contrast / Bold** aesthetic that mirrors the intensity of a high-end gym or a night-time urban run.

The visual narrative centers on "The Void and the Spark"—a deep, immersive dark environment punctuated by hyper-vibrant accents that draw the eye to critical actions and progress metrics. The style utilizes heavy typography and sharp, intentional layouts to evoke a sense of professional-grade equipment. Every element is designed to feel fast, responsive, and uncompromising.

## Colors

The palette is built on a foundation of "Absolute Dark" to minimize eye strain in low-light workout environments and maximize the "pop" of functional colors.

*   **Primary (Electric Lime):** Used for primary calls to action, success states, and active "on" statuses. It represents energy and go-time.
*   **Secondary (Neon Orange):** Reserved for high-intensity alerts, heatmaps, and secondary highlights that require immediate attention without overusing the lime.
*   **Surface & Background:** A tiered system of black and deep charcoal (#0A0A0A to #1A1A1A) provides the structural depth needed to separate content without using heavy shadows.
*   **Functional Colors:** Errors are rendered in a pure vivid red (#FF3B30), while informational states use a cool slate blue to remain distinct from the warm-toned primary/secondary accents.

## Typography

The typographic scale creates a hierarchy of power. We use **Anton** for all display and headline roles—its condensed, bold nature provides an "athletic jersey" feel that communicates urgency and strength. All headlines should be set in Uppercase to maintain the high-energy tone.

**Inter** handles the heavy lifting for all functional data and body text. Its neutral, utilitarian design ensures that complex workout data remains legible at a glance. For mobile views, `display-lg` should be capped at `36px` to ensure no awkward word-breaking, maintaining the "compact power" aesthetic.

## Layout & Spacing

This design system employs a **Fluid Grid** with a strict 4px baseline rhythm. The spacing is tight and efficient to mimic the density of a cockpit or a fitness tracker.

*   **Mobile:** 4-column grid with 16px side margins and 16px gutters.
*   **Desktop:** 12-column grid with 40px margins and 24px gutters.
*   **Sectioning:** Large vertical gaps (48px+) are used between different workout types or data sets to allow the eye a momentary "rest" in an otherwise high-density UI.
*   **Alignment:** All numerical data should be tabular-lined to ensure vertical alignment in lists and stats.

## Elevation & Depth

Depth is conveyed through **Tonal Layers** and **Low-Contrast Outlines** rather than traditional soft shadows. This maintains the "sleek/professional" requirement.

1.  **Level 0 (Background):** #0A0A0A - The base canvas.
2.  **Level 1 (Cards/Surfaces):** #121212 - Raised slightly with a subtle 1px border (#222222).
3.  **Level 2 (Active Elements):** #1A1A1A - Used for items being interacted with or currently selected.
4.  **Overlays:** Semi-transparent #000000 at 80% opacity with a background blur (12px) for modals, keeping the context of the workout visible underneath.

Avoid drop shadows unless specifically needed for floating action buttons (FAB), in which case use a hard 4px offset shadow with 100% opacity to maintain the brutalist-leanings of the system.

## Shapes

The shape language is "Machine Precision." We use **Soft (0.25rem)** rounding for standard components like input fields and small cards to keep the UI from feeling dangerously sharp, while maintaining a structural, architectural feel.

*   **Buttons:** Standard buttons follow the `rounded-sm` (4px) rule.
*   **Progress Bars:** Should have 0px rounding on the internal fill to emphasize a "filling a container" metaphor.
*   **Interactive Chips:** Use `rounded-lg` (8px) to differentiate them from static cards.

## Components

### Buttons
*   **Primary:** Background: Electric Lime (#D4FF00), Text: #000000 (Black). High-contrast, bold, and center-aligned.
*   **Secondary:** Background: Transparent, Border: 2px #D4FF00, Text: #D4FF00.
*   **Ghost:** Background: Transparent, Text: #A1A1AA.

### Cards
*   Cards use surface #121212 with a 1px #222222 border. 
*   Padding should be consistently 16px or 24px depending on content density.
*   Headlines within cards must use `headline-md`.

### Progress Indicators
*   **Linear:** 4px height. Track: #222222, Fill: Electric Lime.
*   **Circular:** Large stroke width (8px+) for high visibility during movement.
*   **Intensity Gauges:** Use a gradient from Electric Lime to Neon Orange to represent heart rate or effort zones.

### Inputs
*   Fields should have a dark background (#1A1A1A) with a bottom-only border (2px) that glows Electric Lime when focused.

### Performance Lists
*   List items are separated by 1px #222222 dividers.
*   Right-aligned "Stat" columns use the `stat-lg` or `label-bold` typography for immediate readability.