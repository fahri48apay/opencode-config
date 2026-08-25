---
name: design-system
description: Guide for building color palettes, typography scales, spacing scales, and design tokens as CSS variables. Use when creating or improving a design system, choosing colors or fonts, or defining design tokens.
---

# Design System Guide

Load this skill when building a palette, type/spacing scale, or token set.

## 1. Color Palette

### Structure
- **60-30-10 rule**: ~60% neutral/background, ~30% secondary surface/text, ~10% accent (primary action color).
- Build each hue as an 11-step scale: `50, 100, 200 ... 900, 950` (50 lightest). Step 500–600 is usually the brand/action color.
- Generate scales by adjusting lightness in OKLCH space for perceptually even steps: `oklch(0.7 0.15 250)`.
- Neutrals: slightly tint with the brand hue (hue = same as primary, chroma 0.01–0.03) to avoid dead gray.

### Semantic naming
Name tokens by role, not value:

```css
:root {
  /* surfaces */
  --color-bg-page: oklch(0.98 0.005 250);
  --color-surface: #ffffff;
  --color-surface-raised: #ffffff;

  /* text */
  --color-text-primary: oklch(0.25 0.02 250);
  --color-text-secondary: oklch(0.45 0.02 250);
  --color-text-disabled: oklch(0.65 0.01 250);

  /* actions */
  --color-primary: oklch(0.55 0.18 255);
  --color-primary-hover: oklch(0.48 0.18 255);
  --color-on-primary: #ffffff;

  /* feedback: success / warning / danger (+ -bg and -text variants) */

  /* borders */
  --color-border-default: oklch(0.9 0.01 250);
  --color-border-strong: oklch(0.75 0.02 250);
}
```

### Contrast verification (mandatory)
For every text/surface pairing check WCAG AA:
- Body text ≥ 4.5:1; large text ≥ 3:1; icons/borders ≥ 3:1
- Compute relative luminance: `L = 0.2126R + 0.7152G + 0.0722B` (sRGB linearized), then ratio = `(L1 + 0.05) / (L2 + 0.05)`
- State the measured ratio when proposing a palette. Reject pairings below threshold.

### Dark mode
- Do not simply invert: darken surfaces, desaturate accents slightly (chroma × ~0.9), raise text to ~oklch 0.9 lightness.
- Keep semantic token names identical; only values change per theme.

## 2. Typography Scale

### Modular scale ratios
| Ratio | Interval | Feel |
| --- | --- | --- |
| 1.125 | Major second | Dense UIs, dashboards |
| 1.25 | Major third | Default, most products |
| 1.333 | Perfect fourth | Marketing/editorial |
| 1.5 | Perfect fifth | Display-heavy |

Base body size: 16px (1rem). Typical scale (ratio 1.25):
`12, 14, 16, 20, 24, 30, 36, 48`

### Fluid sizing

```css
--font-size-h1: clamp(2rem, 1.6rem + 2vw, 3rem);
```

### Rules
- Line-height: 1.5 body, 1.2 headings, ≥ 1 for UI labels
- Measure: 45–75 characters per line (ideal ~66)
- Font stack: max 2 families (1 sans for UI + optional serif/display)
- Weights: use 400/500/600 only

## 3. Spacing Scale (4pt grid)

```
--space-1: 4px    --space-5: 24px
--space-2: 8px    --space-6: 32px
--space-3: 12px   --space-7: 48px
--space-4: 16px   --space-8: 64px
```

Rules:
- Component internal padding: `--space-2..4`; gap between related items: `--space-2`; between groups: `--space-5`+
- Never use arbitrary values (`padding: 13px`) — snap to the scale

## 4. Radius & Shadow Tokens

```css
--radius-sm: 4px;      /* inputs, tags */
--radius-md: 8px;      /* buttons, cards */
--radius-lg: 16px;     /* modals, large cards */
--radius-full: 9999px; /* avatars, pills */

--shadow-sm: 0 1px 2px rgb(0 0 0 / 0.06);
--shadow-md: 0 2px 8px rgb(0 0 0 / 0.08);
--shadow-lg: 0 8px 24px rgb(0 0 0 / 0.12);
```

Shadows in dark mode: increase opacity instead of blur spread.

## 5. Token File Format

Prefer CSS variables as source of truth; export JSON if the team uses multi-platform tools:

```json
{
  "color": { "primary": { "value": "#3b82f6", "type": "color" } },
  "font": { "size": { "base": { "value": "1rem", "type": "dimension" } } },
  "space": { "4": { "value": "1rem", "type": "dimension" } }
}
```

## Deliverable format

When proposing a system, output:
1. Palette table with verified contrast ratios
2. Type + spacing scales
3. Complete CSS variables block ready to paste
4. One example component using only tokens
