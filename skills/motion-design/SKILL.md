---
name: motion-design
description: Senior motion/UI animation designer guidance. Use when animating SVG, icons, loaders, line-drawing (stroke-dasharray), micro-interactions, hero/scroll-driven motion, or choosing between CSS vs SMIL vs JS (Motion/GSAP/Lottie) for web UI. Triggers on "animasi", "svg animation", "line drawing", "stroke-dasharray", "loader", "spinner", "micro-interaction", "motion design", "reduced motion", "animate icon". Generik lintas proyek UI/UX.
---

# Motion Design (UI Animation)

Selecting and implementing motion for interface: which technique, why, and how to keep it
performant and accessible. This is the **implementation layer** — for animation asset tools
(Lottie/Rive/Jitter) read KB `08`; for JS animation libraries (Motion/Bklit/KokonutUI) read KB `18`.

## Referensi utama (baca sesuai kebutuhan)

Knowledge base di `~/ui-ux-knowledge-base/`:

| Situasi | File |
|---|---|
| Teknik animasi SVG murni: CSS vs SMIL vs JS, line-drawing `stroke-dasharray`/`offset` + `pathLength`, performa transform, micro-interaction ikon, motion budget | `19-svg-animation-2026.md` |
| Motion tokens eksak (durasi/easing/spring), M3 | `09-m3-material-deepdive.md` + `01-fondasi-guidelines.md` |
| Aksesibilitas & `prefers-reduced-motion` (keyboard/screen reader) | `14-aksesibilitas-pola.md` |
| Tool aset animasi: LottieFiles/Jitter/Rive, Lordicon, splash screen aturan durasi | `08-icons-logos-motion.md` |
| Library animasi JS: Motion (LazyMotion bundle), Bklit UI, KokonutUI | `18-animasi-komponen-2026.md` |
| Anti-slop: motion punya makna naratif, jangan "biar hidup" | `11-agent-skills-distinct-efficient.md` |

## Keputusan utama

1. **Mulai dari cara termurah yang cukup** (prinsip YAGNI/ponytail, KB `11`):
   CSS transition/keyframes → SMIL → library JS. Jangan pasang library untuk yang bisa
   CSS 3 baris.
2. **CSS** untuk hover/active micro-interaction, loader/spinner, line-drawing. Animasikan
   `transform` + `opacity` (GPU). Hindari `<use>` untuk animasi CSS (buggy).
3. **SMIL** (`<animate>`, `<animateTransform>`, `<animateMotion>`) untuk animasi **atribut**
   SVG (`r`, `points`, `d` morph) dan gerak sepanjang path — yang CSS tak bisa.
4. **JS library** (Motion/GSAP) untuk hero, scroll-driven, morph antar-path, timeline,
   scrubbing — di mana kontrol & interaksi menang.

## Aturan wajib

- **Motion budget & easing**: micro-interaction 100–200ms; transisi 200–400ms; naratif 400ms+.
  Easing `ease`/`cubic-bezier(0.2, 0, 0, 1)`; spring hanya untuk gerak spasial (KB `09`).
- **`prefers-reduced-motion` wajib**: bungkus animasi non-esensial (loop, zoom, parallax)
  di media query; ganti slide/zoom/loop dengan fade (KB `01`/`14`).
- **Line-drawing**: animasi seluruhnya via `stroke-dasharray` (bukan hanya `dashoffset`)
  untuk konsistensi lintas browser; gunakan `pathLength` (atau `getTotalLength()` JS) untuk
  panjang presisi; `animation-fill-mode: forwards` biar state akhir bertahan.
- **Stagger** antar elemen: `animation-delay` per-nth-child — nol setup.
- **Konsisten** dengan design tokens motion bila ada; satu skema easing di seluruh UI.
- **Anti-slop**: tiap animasi menjelaskan perubahan state / menuntun perhatian, bukan
  sekadar "biar hidup".

## Output

Berikan kode runnable + alasan teknik (kenapa CSS/SMIL/JS), durasi & easing eksplisit, dan
variabel `prefers-reduced-motion`. Akhiri dengan ringkasan pilihan teknik bila itu keputusan.
