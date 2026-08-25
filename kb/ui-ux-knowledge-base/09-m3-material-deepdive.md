# 09 — Deep Dive m3.material.io: M3 Expressive, Token Eksak & Status Ekosistem

> Pendalaman dari `01-fondasi-guidelines.md` (tetap jadi ringkasan eksekusi).
> Sumber: situs live m3.material.io, repo resmi (`material-components/material-web` v0.192,
> androidx compose material3, `material-color-utilities`), blog resmi Google — Agustus 2026.
> Semua angka di bawah diverifikasi dari source/token resmi kecuali bertanda *(unverified)*.

---

## 1. Identitas & posisi

- Tagline resmi: *"Google's open-source design system"* — arsip M1/M2 masih online di footer.
- IA situs: Home · Get started · Develop · Foundations · Styles · Components · Blog.
- **M3 Expressive ≠ "M4"** — eksplisit evolusi M3, bukan versi baru.

## 2. Material 3 Expressive (Mei 2025 → rollout 2025–2026)

| Tanggal | Peristiwa |
|---|---|
| 13 Mei 2025 | Diumumkan di Android Show I/O + blog resmi m3 |
| Sep 2025 | Stable di Pixel via Android 16 QPR1 |
| Wear OS 6 | Expressive untuk round display; klaim hemat baterai hingga 10% |
| Des 2025 | Redesign app Google first-party (Gmail, Chrome, Keep…) "mostly completed" |

Isi inti update:
1. **Motion physics system**: spring menggantikan easing+duration sebagai bahasa utama.
   Dua skema preset level produk: **expressive** (overshoot/bounce, hero moments) dan
   **standard** (minimal bounce, produk utilitarian). Compose API: `MotionScheme.expressive()/.standard()`.
2. **14 komponen baru/diupdate** — baru: Button groups, FAB menu, Loading indicator,
   Split button, Toolbar(s); update: App bars, Carousel, Buttons, Extended FAB, FABs,
   Icon buttons, Navigation bar/rail, Progress indicators.
3. **35 shape ikonik + shape morphing** bawaan (transisi antar-shape bisa digerakkan dinamis).
4. **Type scale varian *Emphasized***: ukuran/line-height sama dengan role dasar tapi weight
   naik (contoh eksak androidx: `displayLargeEmphasized` 57sp Weight**Medium**;
   `labelLargeEmphasized` 14sp Bold). Font ekspresif: **Roboto Flex** (variable).
5. Warna lebih vibrant (rentang chroma lebar) untuk hierarki tajam.
6. Terminologi: "window size classes" → kini disebut **breakpoints**.

Basis riset resmi: **46 studi, >18.000 partisipan**; temuan headline: elemen UI kunci
terlihat hingga **4× lebih cepat** di layar expressive. 7 taktik resmi (shape variation,
rich color, typography attention, containment, fluid motion, component flexibility) →
digabung jadi **hero moments: maksimal 1–2 per produk** (sisanya tetap tenang).

⚠️ **Koreksi atas file 01**: state layer resmi terkini (token @material/web):
hover **8%**, focus **12%**, pressed **12%**, dragged **16%**, disabled content **38%**.
(Angka 10% adalah spek 2021 yang sudah diganti.)

## 3. Color system mendalam

- **HCT space** = Hue–Chroma–Tone, dibangun di CAM16 × CIE L\*. Kenapa bukan HSL: memodelkan
  persepsi mata nyata → tone menjamin kontras pairing otomatis, chroma dibatasi gamut.
  Library resmi: C++, Dart, Java, Kotlin, Swift, TypeScript.
- **Dynamic color pipeline (Android)**: wallpaper → quantization (**Celebi**) → scoring warna
  → core palette → scheme light/dark; ada modul *dislike* (koreksi warna universal-disliked),
  *blend/harmonize*, *temperature*. Error roles default-nya statis (tidak ikut hue wallpaper).
- **45 color roles resmi** (diagram halaman Color Roles): 16 accent (primary/secondary/
  tertiary/error × role/on-role/container/on-container) + outline ×2 + surface inti (3) +
  5 surface container + dim/bright + inverse ×3 + scrim/shadow + **fixed accents ×12**
  ({primary,secondary,tertiary} × fixed/fixed-dim/on-fixed/on-fixed-variant).
- **Surface container ladder — nilai tone terverifikasi**:

| Role | Light | Dark |
|---|---|---|
| surface-container-lowest | tone 100 | 4 |
| surface-container-low | 96 | 10 |
| surface-container | 94 | 12 |
| surface-container-high | 92 | 17 |
| surface-container-highest | 90 | 22 |
| surface / dim / bright | 98 / 87 / 98 | 6 / 6 / 24 |

- Hex referensi baseline: primary40 `#6750A4`, primary10 `#21005D`, neutral98 `#FEF7FF`,
  neutral90 `#E6E0E9`, neutral4 `#0F0D13`, neutral6 `#141218`.
- **Kontras: 3 level user-controlled kini — standard / medium / high**; pairing komponen min 3:1, teks 4.5:1.

## 4. Motion tokens lengkap

### Duration (16 token, eksak)

| Token | ms | Token | ms |
|---|---|---|---|
| short1–4 | 50 / 100 / 150 / 200 | long1–4 | 450 / 500 / 550 / 600 |
| medium1–4 | 250 / 300 / 350 / 400 | extra-long1–4 | 700 / 800 / 900 / 1000 |

### Easing (eksak)

| Token | cubic-bezier |
|---|---|
| standard (= emphasized) | 0.2, 0, 0, 1 |
| standard-accelerate / decelerate | 0.3, 0, 1, 1 / 0, 0, 0, 1 |
| emphasized-accelerate | 0.3, 0, 0.8, 0.15 |
| emphasized-decelerate | 0.05, 0.7, 0.1, 1 |
| linear | 0, 0, 1, 1 |
| legacy | 0.4, 0, 0.2, 1 |

### Spring physics Expressive (damping / stiffness, eksak dari androidx)

| Token `md.sys.motion.spring.*` | Standard | Expressive |
|---|---|---|
| default-spatial | 0.9 / 700 | **0.8 / 380** |
| fast-spatial | 0.9 / 1400 | **0.6 / 800** |
| slow-spatial | 0.9 / 300 | **0.8 / 200** |
| default/fast/slow-effects | **1.0** / 1600·3800·800 | 1.0 / 1600·3800·800 |

Aturan pakai:
- **Spatial** (posisi/rotasi/ukuran/corner-radius): boleh overshoot. **Effects** (color/opacity):
  damping wajib 1.0 — TIDAK boleh overshoot.
- Kecepatan: fast = komponen kecil (switch/button) · default = sebagian layar (bottom sheet) · slow = full-screen.
- Nilai spring berbeda per form factor (wearable/phone/tablet).
- Duration-based kini untuk transisi screen-to-screen & fallback platform
  (Web = konversi manual via specs; **Flutter belum ada**; Compose: 21 komponen sudah spring by default).

## 5. Anatomi komponen (angka terverifikasi, token @material/web)

| Komponen | Spesifikasi eksak |
|---|---|
| Filled button | tinggi **40px** · radius **full** · label label-large 14px · icon 18px · leading/trailing space 24px (16px dgn icon) · elevasi rest L0 → hover L1 · disabled: container op **.12**, label op **.38** |
| Navigation bar | tinggi **80px** · bg `surface-container` · elevasi **L2** · active indicator pill **64×32px** secondary-container · icon 24px · label label-medium-prominent saat aktif |
| Outlined text field | outline **1px → 2px** fokus (primary) · input body-large · supporting text body-small · icon 24px · radius XS (4px, sudut atas) |
| Assist chip | tinggi **32px** · radius small **8px** · outline 1px flat (elevated = L1) · icon 18px |
| Switch | track **52×32px** radius full · handle off **16px** → on **24px** → pressed **28px** · icon handle 16px |
| Shape scale (web) | none 0 · XS 4 · S 8 · M 12 · L 16 · XL 28 · **full 9999px** + varian arah `-top/-start/-end` |
| Elevasi | L0=0 · L1=1 · L2=3 · L3=6 · L4=8 · L5=12 dp |

*(unverified hari ini: FAB 40/56/96dp, extended FAB 56dp, dialog 280–560dp, snackbar 48dp,
nav rail 80dp, menu item 48dp, list 56/72dp — standar lama, cek specs sebelum dipakai.)*

## 6. Status implementasi web & tooling (penting!)

- **@material/web = MAINTENANCE MODE sejak 10 Juni 2024** (discussion #5642, masih pinned 2026):
  tim direalokasi ke framework internal Google (Wiz). Bukan deprecated, tapi PR tidak diterima
  by default. 11.2k★, 4jt+ download npm total, dipakai 150+ project internal Google.
- **Rekomendasi resmi: pengguna Angular → Angular Material.** Belum ada penerus M3-native untuk web.
- **M3 Expressive (spring, shape morph, komponen baru) BELUM ada di web** — approximasi manual:
  transisi `border-radius` + spring JS sendiri, atau pakai token CSS dari repo tanpa komponennya.
- **Material Theme Builder**: plugin Figma v21 (±98.500 install): ekstraksi dynamic color dari
  gambar, HCT picker, harmonization, type theming per Google Font, variable-backed styles,
  JSON import/export web↔Figma. Web tool: material-foundation.github.io/material-theme-builder
  (surfaces berbasis tone + fixed accents).

## 7. Material Symbols (ikon)

- **4.271 codepoints per style** (dihitung dari repo master Agu 2026) — docs lama bilang "2.500+/3.800+" (stale).
- 3 style variable font: Outlined / Rounded / Sharp.
- **Variable axes**: FILL 0..1 · wght 100..700 · GRAD −50..200 · opsz 20..48 · **ROND 0..100**
  (roundness — sering terlewat).
- Payload: font statis penuh **295KB** · variable penuh **7.9MB** · subset `&icon_names=` **1.7KB**
  → selalu subset + `&display=block` (anti-FOUC ligature).
- Lisensi **Apache 2.0** — bebas dipakai produk apa pun.

## 8. Pelajaran UX dari situs m3.material.io sendiri

Pola dokumentasi layak dicuri untuk design system sendiri:
1. Copy-link anchor di tiap heading; toggle dark/light; tooltip inline untuk istilah teknis.
2. Pola **Do / Don't / Caution** berpasangan ilustrasi di hampir semua guideline.
3. Angka selalu dekat klaim (diagram token, tabel availability per platform, badge tanggal update).
4. Transparansi riset sebagai konten (46 studi/18k partisipan) + rekrut partisipan langsung dari situs.
5. Visual: putih dominan + aksen dynamic-color, heading besar — konten yang jadi bintang, bukan chrome.

## 9. Lisensi & batasan

- Konten/guideline M3: **Apache 2.0 atau CC BY 4.0** — brand apa pun bebas memakai pola/token/komponen.
- Kode semua library: Apache 2.0.
- **Batasan brand Google** (terpisah dari M3): dilarang menyiratkan afiliasi, pakai nama/logo
  Google di produkmu, **meniru kombinasi warna/ikon khas Google**, merchandise. Tombol
  "Sign in with Google" tetap tunduk guideline Google Identity — style M3 umum tidak memberi hak itu.

## 10. Takeaway eksekusi cepat

1. Pakai skema motion: pilih expressive ATAU standard sekali di level produk; spatial boleh bounce, effects tidak.
2. Spring cheat-sheet: default-spatial 0.8/380 (expressive) atau 0.9/700 (standard); effects selalu damping 1.0.
3. State layer: **8 / 12 / 12 / 16%** (hover/focus/pressed/dragged) — update mental model lama 8/10/10/16.
4. Ladder panel via surface-container tones (100/96/94/92/90 light; 4/10/12/17/22 dark) — bukan shadow.
5. Web: jangan invest di @material/web untuk project baru; ambil token CSS-nya saja, bangun komponen sendiri.
6. Material Symbols: selalu subset via `&icon_names=`, manfaatkan axis ROND/FILL untuk state.
7. Hero moments maksimal 1–2 per produk — sisanya quiet.
