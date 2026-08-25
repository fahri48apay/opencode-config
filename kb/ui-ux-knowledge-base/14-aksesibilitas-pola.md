# 14 — Aksesibilitas: Pola Implementasi dari W3C ARIA APG

> Sumber utama: **W3C ARIA Authoring Practices Guide (APG)** — w3.org/WAI/ARIA/apg
> (30 pola widget + Practices + contoh kode siap uji). Ini standar resmi W3C,
> pelengkap checklist WCAG 2.2 AA di skill `ux-review` (yang bilang APA; APG bilang BAGAIMANA).
> Sumber sekunder: The A11Y Project, Inclusive Components (Heydon Pickering), web.dev a11y course.

---

## Prinsip urutan pertama: HTML semantik > ARIA

1. **Rule #1 ARIA: jangan pakai ARIA kalau ada elemen HTML native.**
   `<button>` sudah dapat focus, Enter/Space, role, dan nama — `div role="button"` tidak (harus dibangun manual).
2. Jangan ubah semantik native tanpa alasan (`<h3><a>` bukan `<a><h3>` di dalam heading).
3. Semua interaktif HARUS bisa keyboard + punya accessible name.
4. Jangan pakai `role="presentation"`/`aria-hidden="true"` pada elemen yang ter-focus.

## 30 pola APG — mana yang wajib dikuasai

Daftar lengkap: Accordion, Alert, Alert Dialog, Breadcrumb, Button, Carousel, Checkbox,
Combobox, Dialog (Modal), Disclosure, Feed, Grid, Landmarks, Link, Listbox, Menu & Menubar,
Menu Button, Meter, Radio Group, Slider, Slider Multi-Thumb, Spinbutton, Switch, Table, Tabs,
Toolbar, Tooltip, Tree View, Treegrid, Window Splitter.

**Tier 1 (paling sering salah & paling sering dipakai):**

| Pola | Kunci keyboard yang WAJIB | Kesalahan umum |
|---|---|---|
| **Dialog (Modal)** | Tab tertahan dalam dialog ("focus trap"); `Esc` menutup; focus kembali ke trigger saat tutup | Tidak memindahkan focus ke dialog; background masih scrollable/terbaca screen reader |
| **Tabs** | Arrow keys antar tab; `Tab` keluar ke konten panel (bukan melompati panel) | Semua panel tetap di DOM tanpa `hidden` → screen reader membaca semua |
| **Disclosure / Accordion** | `Enter`/`Space` toggle; state via `aria-expanded` | Pakai `div onclick`; ikon chevron tanpa label |
| **Tooltip** | Muncul on focus DAN hover; hilang on blur AND `Esc`; tidak berisi interaksi penting | Info kritis HANYA di tooltip; tooltip tak bisa ditutup keyboard |
| **Menu Button** | `Enter`/`Space`+`Down` buka; arrow navigasi item; `Esc` tutup & fokus balik ke tombol | Menu nav situs dibuat dengan pola menu aplikasi (salah konteks!) |

**Tier 2:** Checkbox/Switch/Radio (bedakan perilakunya!), Listbox vs Combobox (combobox = input +
popup, polanya rumit — 5 varian), Slider/Spinbutton (arrow keys + Home/End), Feed (scroll loading),
Carousel (pause otomatis + kontrol eksplisit), Landmarks (8 role untuk struktur halaman).

## Aturan lintas-pola yang paling sering dilanggar

- **Focus visible**: jangan pernah `outline: none` tanpa pengganti. Custom focus ring minimal 3:1 kontras area.
- **Skip link**: "Skip to main content" sebagai link pertama tiap halaman.
- **Landmarks**: `<header>` `<nav>` `<main>` `<aside>` `<footer>` — satu `<main>` per halaman.
- **Live regions**: notifikasi dinamis pakai `aria-live="polite"`; error validasi form pakai
  `aria-describedby` mengikat pesan ke field; jangan hanya animasikan warna.
- **Error recovery**: pesan error di ATAS field, jelaskan apa yang salah + cara memperbaiki,
  jangan hanya "Input invalid".
- **Reduced motion**: hormati `prefers-reduced-motion` (fade > slide/parallax) — selaras playbook §F.

## Ritual verifikasi cepat (tanpa tools mahal)

1. **Keyboard-only pass**: cabut mouse; semua task inti selesai? Fokus tidak pernah hilang?
2. **Screen reader smoke test**: VoiceOver (Cmd+F5, macOS/iOS) atau TalkBack — judul halaman terbaca?
   Form field punya label? Error diumumkan?
3. **Zoom 200% + font scale ekstrem**: layout tidak pecah, tidak terpotong?
4. **Kontras programatik**: WebAIM Contrast Checker / plugin Contrast (Figma).
5. **Lighthouse a11y score** sebagai asap-detector (bukan jaminan).

## Pola desain visual yang lahir dari APG (untuk designer)

- Modal harus punya: judul, tombol close eksplisit, Esc, backdrop klik (opsional tapi umum), dan
  **fokus awal di elemen logis pertama**.
- Tabs vs Select: tabs untuk mengganti VIEW, select untuk INPUT nilai.
- Switch vs Checkbox: switch = efek langsung seketika (setting on/off), checkbox = bagian dari
  form yang di-submit bersama.
- Tooltip ≠ Popover ≠ Dialog: hover+info pasif vs klik+konten interaktif non-modal vs klik+interupsi modal
  (konsisten dengan alias map di `02-design-systems.md`).

## Anti-pola

- ❌ Menambah ARIA agar Lighthouse hijau padahal perilaku keyboard belum benar (ARIA menjanjikan, kode harus menepati).
- ❌ `aria-label` yang menduplikasi teks visible ("Button Submit" pada tombol bertuliskan Submit).
- ❌ Carousel autoplay tanpa pause; feed tanpa cara mundur; slider tanpa input angka alternatif.
- ❌ Mengandalkan warna saja untuk state (error merah tanpa ikon + teks).
