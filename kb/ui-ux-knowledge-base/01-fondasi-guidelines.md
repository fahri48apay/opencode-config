# 01 — Fondasi: Material Design 3 & Apple HIG

> Dua "bahasa desain" resmi platform. M3 = sistem parametrik satu-untuk-semua;
> HIG = preskriptif per-platform. Keduanya memberi angka konkret yang bisa langsung
> dipakai sebagai design token di project apa pun.

---

## Material Design 3 (Material You)

### Filosofi
- **Warna adalah sistem, bukan cat merek**: dari satu *seed color* → 5 tonal palette
  → ~28 semantic roles (`primary`, `on-primary`, `primary-container`, dst). Tidak ada hex hard-coded.
- **Accessible by construction**: pasangan role (mis. primary/on-primary) punya nilai tone yang
  dijamin kontras WCAG otomatis.
- **Depth via tonal surface**, bukan shadow-first.
- **Adaptive by breakpoint** (window size class), bukan per-device.

### Color roles (nilai tone terverifikasi)
| Role | Light | Dark |
|---|---|---|
| `primary` / `secondary` / `tertiary` | tone 40 | tone 80 |
| `on-primary` | tone 100 | tone 20 |
| `*-container` | tone 90 | tone 30 |
| `on-*-container` | tone 10 | tone 90 |
| `surface`/`background` | neutral 98–99 | neutral ~6 |
| `on-surface` | neutral 10 | neutral ~90 |
| `surface-variant` | NV 90 | NV 30 |
| `outline` | NV 50 | NV 60 |

- **Surface container ladder** (2023+): `surface-container-lowest < -low < -container < -high < -highest`
  — gantikan elevasi+overlay untuk hierarki panel/kartu. Sangat mudah diterjemahkan ke CSS variables.
- Aturan: selalu pasangkan container dengan `on-X-container` miliknya sendiri; jangan campur slot.
- Generate light+dark scheme dari satu seed secara programatik:
  Material Theme Builder / `material-color-utilities` (ada port Dart/TS/Swift/C++).

### Type scale (15 role, sp/rem)
| Style | Size | LH | Tracking | Weight |
|---|---|---|---|---|
| display-large | 57 | 64 | −0.25 | 400 |
| display-medium | 45 | 52 | 0 | 400 |
| display-small | 36 | 44 | 0 | 400 |
| headline-large | 32 | 40 | 0 | 400 |
| headline-medium | 28 | 36 | 0 | 400 |
| headline-small | 24 | 32 | 0 | 400 |
| title-large | 22 | 28 | 0 | 400 |
| title-medium | 16 | 24 | +0.15 | 500 |
| title-small | 14 | 20 | +0.10 | 500 |
| body-large | 16 | 24 | +0.50 | 400 |
| body-medium | 14 | 20 | +0.25 | 400 |
| body-small | 12 | 16 | +0.40 | 400 |
| label-large | 14 | 20 | +0.10 | 500 |
| label-medium | 12 | 16 | +0.50 | 500 |
| label-small | 11 | 16 | +0.50 | 500 |

### Elevation, state, shape
- Elevasi (dp): L0=0, L1=1, L2=3, L3=6, L4=8, L5=12. Kartu filled=L0, elevated=L1,
  menu/sheet=L2–3, dialog/FAB/snackbar=L3.
- **State layer opacity** (scrim warna konten, nilai token resmi terkini): hover **8%**, focus **12%**, pressed **12%**, dragged **16%**, disabled content **38%**. (Spek lama 2021 memakai 10% untuk focus/pressed — sudah diganti; lihat `09-m3-material-deepdive.md`.)
- Shape scale: none 0 · XS 4 · S 8 · M 12 · L 16–20 · XL 28–32 · XXL 48 · full=pill. Button/chip/FAB=full; card=large/XL.

### Motion
- Durasi: short **50–200ms** (elemen kecil) · medium **250–400ms** (panel masuk/keluar) · long **450–600ms** · extra-long **700–1000ms** (transisi hero/full-screen).
- Easing: standard `cubic-bezier(0.2,0,0,1)`; emphasized-accelerate `(0.3,0,0.8,0.15)`; emphasized-decelerate `(0.05,0.7,0.1,1)`.
- Spring tokens untuk gerak spasial/gesture-driven saja.

### Adaptive layout
- Window width classes: **compact <600dp · medium 600–840 · expanded 840–1200 · large 1200–1600 · XL ≥1600**.
- Navigasi: compact→bottom nav bar · medium→rail · expanded→rail/drawer persisten.
- Canonical layouts: list-detail, supporting pane, feed. Satu navigation graph lintas ukuran.
- **Touch target ≥48×48dp dengan gap ≥8dp** (glyph visual boleh 24dp, sisanya padding).
- Test setiap layar di compact DAN expanded sebelum ship.

### Aksesibilitas
- Kontras gratis dari pasangan role; custom color wajib diverifikasi AA (4.5:1 teks, 3:1 UI besar).
- Dukung font scaling OS hingga 200% (pakai unit relatif, jangan lock height).

Referensi token machine-readable: `github.com/material-foundation/material-tokens`,
`material-components/material-web/tokens`. Pendalaman penuh (M3 Expressive, spring tokens,
45 color roles, status @material/web) → `09-m3-material-deepdive.md`.

---

## Apple Human Interface Guidelines (HIG)

### Filosofi
- **Clarity, Deference, Depth** — konten dulu, chrome mundur.
- Platform-native: iOS (touch), macOS (pointer+keyboard), watchOS (glance), visionOS (mata+tangan).
- Pakai komponen sistem — otomatis dapat Dark Mode, Dynamic Type, Increase Contrast, lokalisasi.
- Bahasa visual terkini: **Liquid Glass** — lapisan kontrol/navigasi mengambang di atas lapisan konten.

### Typography & Dynamic Type
- Body default: iOS **17pt** · macOS **13pt** · tvOS **29pt** · visionOS **17pt** · watchOS **16pt**.
- iOS @ Large step: Large Title 34/41 · Title1 28/34 · Title2 22/28 · Title3 20/25 · Headline 17 semibold · Body 17/22 · Callout 16/21 · Subhead 15/20 · Footnote 13/18 · Caption1 12/16 · Caption2 11/13.
- **Dynamic Type = event layout**: uji dari xSmall sampai AX5 (Body 17→53pt). Hindari weight Light/Ultralight.

### Warna & material
- Pakai dynamic system colors (`label`, `secondaryLabel`, `systemBackground`, `separator`, …) — jangan hard-code hex-nya.
- Kontras: **4.5:1** teks ≤17pt · **3:1** teks ≥18pt/bold · target **7:1** untuk teks custom kecil.
- Dark Mode: background base (recedes) vs elevated (advances); modal auto-elevate; redupkan gambar putih pekat; JANGAN buat toggle appearance in-app.
- Liquid Glass varian `regular` (blur untuk keterbacaan) vs `clear` (overlay media + dimming hitam 35%).

### Layout & target
- Hormati safe area (Dynamic Island, home indicator); background edge-to-edge, interaksi di dalam guide.
- **Minimum control size**: iOS 44×44pt (min 28) · macOS 28/20 · tvOS 66/56 · visionOS 60/28 · watchOS 44/28. Padding ±12pt tepi bezel / 24pt borderless.
- Kontrol utama di tengah/bawah layar (jangkauan ibu jari). Hindari full-width button di iOS.

### Pola komponen (konvensi penting)
- **Tab bar** = navigasi (tempat), **toolbar** = aksi. Selalu beri label. Jangan overflow tab "More".
- **Sheet**: Cancel kiri / Done kanan; multi-step ganti Cancel→Back; Done disabled sampai final; detents (large+medium+custom); grabber wajib di sheet resizable; support swipe-to-dismiss.
- **Alert**: hanya untuk interupsi; ≤3 tombol; tombol spesifik ("Erase", bukan OK); destructive selalu dipasangkan Cancel; jangan tampil saat app launch.
- Pesan non-kritis → snackbar/banner/toast, bukan modal.

### SF Symbols & aksesibilitas
- 6.000+ simbol, 9 weight match SF, 4 render mode (mono/hierarchical/palette/multicolor), animasi built-in. Beri accessibility label.
- Reduce Motion: fade menggantikan slide/zoom; hindari animasi blur.
- Setiap gesture harus punya alternatif button.

---

## Perbedaan kunci M3 vs HIG (untuk keputusan lintas platform)

| Aspek | Material 3 | Apple HIG |
|---|---|---|
| Sumber warna | Algoritmik (seed→tonal→role), bisa dari wallpaper user | Palet semantik kurasi OS + accent app |
| Model depth | Tonal surface steps + shadow lembut | Translucensi/material (Liquid Glass) di atas konten |
| Tipografi | Scale tetap 15 role × font scaling OS | Dynamic Type elastis (user-controlled, termasuk AX sizes) |
| Target sentuh | 48×48dp | 44×44pt |
| Feedback transien | Snackbar/banner (tidak blokir input) | Alert dibatasi ketat; action sheets/sheets |
| Ownership theming | Algorithm + user | OS (accent, appearance) |

## Takeaway eksekusi untuk project apa pun

1. Token = **semantic roles** (`accent`, `on-accent`, `surface-container-*`, `outline`) — bukan nama warna mentah.
2. Generate light+dark dari satu seed programatik.
3. Type scale: kuadruple size+leading+tracking+weight per role; uji di 200% scaling.
4. Breakpoint netral 600/840/1200px; nav bar→rail→drawer mengikutinya.
5. State interaksi = scrim overlay 8/12/12/16% agar konsisten di warna apa pun.
6. Hierarki kartu/panel via surface steps, shadow hanya penguat.
7. Motion: 150–200ms micro-feedback, 250–400ms container, easing standar; spring hanya spasial.
8. Copy UI: sentence case, verb spesifik <3 kata, judul bar <15 karakter.
9. Honor Reduce Motion, Increase Contrast, Dark Mode di semua komponen custom.
10. Rancang layout expanded lebih dulu saat fitur baru; compact menyusul.
