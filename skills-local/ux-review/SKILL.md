---
name: ux-review
description: Deep reference for reviewing and critiquing UI/UX designs. Use when auditing or reviewing designs, screenshots, mockups, wireframes, or UI code — covers Nielsen's 10 usability heuristics, WCAG 2.2 AA accessibility checklist, and a visual hierarchy rubric.
---

# UX Review Reference

Load this skill when performing any design review, audit, or critique.

## 1. Nielsen's 10 Usability Heuristics

For each heuristic, check the listed common violations:

1. **Visibility of system status** — no loading indicators; actions give no feedback; progress unknown for multi-step flows.
2. **Match between system and real world** — jargon/developer terms in labels; unfamiliar metaphors; inconsistent terminology.
3. **User control and freedom** — no undo/cancel; destructive actions without confirmation; dead-end states with no way back.
4. **Consistency and standards** — same action styled differently in different places; platform conventions ignored (e.g., back button behavior).
5. **Error prevention** — allows invalid input without constraint; no confirmation for irreversible actions.
6. **Recognition rather than recall** — users must memorize info across screens; hidden navigation with unlabeled icons only.
7. **Flexibility and efficiency of use** — no shortcuts for frequent tasks; repetitive manual entry that could be prefilled.
8. **Aesthetic and minimalist design** — irrelevant information competes with primary content; decorative elements reduce clarity.
9. **Help users recognize, diagnose, and recover from errors** — cryptic error codes; errors don't say how to fix; error message placement far from the problem.
10. **Help and documentation** — none provided for complex tasks; help is context-free.

## 2. WCAG 2.2 AA Quick Checklist

### Contrast
- Normal text (< 18pt / < 14pt bold): ratio ≥ 4.5:1
- Large text (≥ 18pt or ≥ 14pt bold): ratio ≥ 3:1
- UI components & graphical objects (icons, input borders, focus rings): ratio ≥ 3:1 against adjacent colors
- Verify programmatically when possible: `npx wcag-contrast <fg> <bg>` style tools, or compute relative luminance manually

### Interactive targets
- Pointer targets ≥ 24×24 CSS px (WCAG 2.2 minimum), with 44×44px recommended (Apple HIG 44pt / Material 48dp)
- Adequate spacing between adjacent targets (target-spacing exception applies if spacing provides separation)

### Keyboard & focus
- All functionality reachable via keyboard alone
- Visible focus indicator on every interactive element (not `outline: none` without replacement)
- Logical tab order matching visual order; no focus traps outside modals
- Modals: focus moves in on open, returns to trigger on close, Esc closes

### Forms & labels
- Every input has a persistent visible label (`<label for>`), not placeholder-only
- Errors identified in text near the field + `aria-describedby`; never color-only
- Input purpose hints available for autofill (`autocomplete` attributes)

### Content
- Page has logical heading structure (one h1, no skipped levels)
- Meaningful images have alt text; decorative images have `alt=""`
- Text resizable to 200% without loss of content/function
- Content reflows at 320px width without horizontal scrolling
- Motion/animation respects `prefers-reduced-motion`

## 3. Visual Hierarchy Rubric

Score each area 0–2 (absent/partial/solid):

| Area | Question |
| --- | --- |
| Primary action | Is there exactly one obvious next step? |
| F-pattern/Z-pattern | Does content order follow natural scanning? |
| Size & weight | Do font sizes decrease monotonically with importance? |
| Whitespace | Are related items grouped (proximity) and unrelated separated? |
| Color usage | Is accent color reserved for interactive/emphasis elements only? |
| Alignment | Consistent grid; no arbitrary alignments? |

## 4. Review Output Format

Structure every review as:

1. **Ringkasan observasi** — what the design does well (2–3 points)
2. **Temuan** — table: `Issue | Heuristic/principle | Severity | Fix`
   - Severity: 🔴 critical (blocks task/accessibility) · 🟡 major · 🟢 minor
3. **Top 3 perbaikan prioritas** — concrete, ordered by impact
