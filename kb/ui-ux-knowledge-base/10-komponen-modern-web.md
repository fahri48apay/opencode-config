# 10 — Library Komponen Web Modern: Ant Design, Skiper UI, 21st.dev, ReactBits

> Empat sumber komponen siap pakai dengan karakter sangat berbeda: Ant Design = sistem
> enterprise utuh; Skiper UI & ReactBits = komponen motion/copy-paste; 21st.dev = registry
> komunitas + infra AI agent. Riset langsung dari situs/repo live, Agustus 2026.
> Angka bertanda *(unverified)* = tidak bisa dikonfirmasi dari sumber primer.

---

## Peta posisi (baca dulu)

| Kebutuhan | Pakai | Jangan |
|---|---|---|
| Admin dashboard / app data-dense | **Ant Design** | ReactBits/Skiper (animasi berat) |
| Landing page "wow" + hero animasi | **ReactBits** / 21st.dev | Ant Design (kaku untuk marketing) |
| Komponen motion unik ala situs award | **Skiper UI** / ReactBits | — |
| Workflow AI agent (MCP) | **21st.dev** (MCP resmi) | — |
| Fondasi design system jangka panjang | **Ant Design** (token architecture) | copy-paste libs |

---

## 1. ANT DESIGN (ant.design)

### Identitas
- Tim UX **Ant Group** (Alipay/Alibaba), repo dibuat 24 Apr 2015. Lisensi **MIT**.
- **v6 dirilis 24 Nov 2025**; stabil terkini 6.x rilis minor tiap ±1–2 minggu.
- ~99.2k★ GitHub, **±3,7jt download npm/minggu** — klaim sendiri "world's second most popular React UI framework".
- Ekosistem: Ant Design Mobile, AntV charts, ProComponents (ProTable/ProForm), Ant Design Pro,
  **Ant Design X** (komponen AI/LUI), kit Figma resmi v6 berisi **600+ token**.

### Filosofi resmi (design values)
1. **Natural** — antarmuka meniru hukum alam/kognisi; hierarki lembut, tanpa dekorasi yang melawan intuisi.
2. **Certain** — UI adalah media bukan tujuan; satu pola per interaksi; spesifikasi eksak → biaya belajar rendah.
3. **Meaningful** — tiap elemen melayani misi user; feedback instan; Result/Empty/Progress yang informatif.
4. **Growing** — sistem harus bisa tumbuh: token berlapis + ekosistem terbuka.

### Arsitektur token v5/v6 (yang paling layak ditiru)
```
Seed Token (niat minimal, mis. colorPrimary saja)
   └─ algorithm: defaultAlgorithm | darkAlgorithm | compactAlgorithm
        └─ Map Token (palet & skala turunan otomatis)
             └─ Alias Token (semantik: colorTextDescription, paddingSM…)
                  └─ Component Token (override per komponen, tak bocor ke lain)
```
Override via `<ConfigProvider theme={{ token, components }}>`; konsumsi via `useToken()`;
v6 punya mode `zeroRuntime` + CSS variables murni (hapus runtime CSS-in-JS).

### Token default eksak (terverifikasi dari docs)

| Seed token | Default | | Map/Alias | Default |
|---|---|---|---|---|
| `colorPrimary` | **#1677ff** (v4 lama #1890ff) | | controlHeight XS/SM/LG | 16 / **24** / **40px** |
| `colorSuccess` | #52c41a | | fontSize SM/LG/XL | 12 / 16 / 20px |
| `colorWarning` | #faad14 | | Heading 1–5 | 38/30/24/20/16px |
| `colorError` | #ff4d4f | | borderRadius XS→LG | 2 / 4 / **6** / 8px |
| `colorInfo` | #1677ff | | margin/padding ramp | XXS 4 · XS 8 · SM 12 · 16 · MD 20 · LG 24 · XL 32 · XXL 48 |
| `fontSize` | **14px** | | colorBgLayout / Elevated | #f5f5f5 / #fff (dark ≈ #000 / **#141414 / #1f1f1f**) |
| `borderRadius` | **6px** | | colorBorder | #d9d9d9 |
| `controlHeight` | **32px** | | teks alpha | rgba(0,0,0,.88/.65/.45/.25) |
| `motionUnit` | 0.1s | | zIndexPopupBase | 1000 |
| Breakpoints | xs480 sm576 md768 lg992 xl1200 xxl1600 xxxl1920 | | focus ring | 2px rgba(5,145,255,.1), lineWidthFocus 3px |

- Font family persis: `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, …emoji`.
- Shadow kartu: `0 6px 16px 0 rgba(0,0,0,.08), 0 3px 6px -4px rgba(0,0,0,.12), 0 9px 28px 8px rgba(0,0,0,.05)`.
- Motion: fast **0.1s** / mid **0.2s** / slow **0.3s**; easeInOut `cubic-bezier(0.645,0.045,0.355,1)`; easeOutBack `(0.12,0.4,0.29,1.46)`.

### Inventaris: 73 komponen resmi
General 4 · Layout 7 (termasuk Splitter, Masonry v6) · Navigation 7 · **Data Entry 18**
(Cascader, Transfer, TreeSelect, Mentions…) · **Data Display 21** (Table super-lengkap,
Descriptions, Tour, Tree, QRCode…) · Feedback 11 (Result, Watermark…) · Other 5.
Khas Ant yang jarang utuh di library lain: Table (fix kolom/editable/virtual), Cascader,
Transfer, Tour, FloatButton.Group, Watermark, Segmented.

### Dark theme = algoritma, bukan invert
Palet brand digenerate 10 langkah dengan kurva lightness/saturation khusus gelap dan
indeks dipetakan ulang (hue identitas tetap); netral diturunkan dari `colorBgBase`:
layout #000 → container ≈#141414 → elevated ≈#1f1f1f (elevasi via lapisan solid lebih terang,
BUKAN shadow). `[darkAlgorithm, compactAlgorithm]` bisa dikombinasi.

### Aksesibilitas & i18n — jujur soal kelemahan
- **a11y titik lemah terbesar**: tidak ada halaman docs a11y khusus; audit komunitas 2025–2026
  menemukan landmark hilang/nested interactive; maintainer: "no plans yet, community PR welcome".
  Yang ada: keyboard rc-components, focus token, perbaikan inkremental. → Untuk kebutuhan WCAG
  ketat, siapkan effort audit tambahan.
- i18n kuat: **70 locale** termasuk `id_ID`; RTL via `direction="rtl"`.

### Kapan pakai vs hindari
✅ B2B/admin desktop-first, form & tabel kompleks, tim kecil butuh 70+ komponen konsisten,
butuh i18n/RTL luas, theming token kuat.
❌ Situs marketing (wajah "admin template" mudah dikenali), butuh styling headless penuh,
WCAG AA/AAA ketat tanpa effort ekstra, bundle size super sensitif (pakai v6 zeroRuntime bila ya).

### Pelajaran dari docs ant.design sendiri
Format halaman komponen yang bikin docs-nya standar industri: intro 1 kalimat → **bullet
"When To Use"** → demo live + kode → tabel API seragam (Property|Description|Type|Default|Version).
Plus Theme Editor online interaktif, mirror versi lama (3x/4x.ant.design), dan seksi
**AI: design.md / LLMs.txt / MCP Server** — dokumentasi modern wajib machine-readable.

---

## 2. SKIPER UI (skiper-ui.com)

⚠️ **Domain**: `skipper-ui.com` (dengan pp) **MATI/NXDOMAIN** — yang benar **skiper-ui.com**.
Sering salah tulis "Skipper UI" di artikel; produk aslinya memakai ejaan satu-p.

- Apa: "**Un-common Components for shadcn/ui**" — registry komponen bergaya shadcn
  (bukan paket npm), 1 file `.tsx` per komponen. Pembuat: Gurvinder Singh (Gxuri).
- Stack prasyarat: React/Next.js + Tailwind + Motion(Framer Motion) + gsap + react-use-measure.
- **106 komponen** (`skiper1…skiper107`): dynamic island, cursor trail, token swap UI,
  sign-in stacked ala Devouring Details, dsb — motion-forward, hasil reverse-engineer
  desain terbaik web.
- **Lisensi custom (bukan MIT)**: Free boleh komersial tapi **wajib atribusi**;
  **Premium $129 sekali bayar** (tanpa atribusi); Exclusive $549 *(coming soon)*.
  Registry item Pro minta license key.
- A11y: tidak ada dokumentasi/klaim → anggap lemah.
- ✅ Pakai sebagai referensi estetika/motion untuk landing React+Tailwind; ❌ jangan jadikan
  fondasi design system (cakupan primitif tipis, lisensi custom, a11y tak terjamin).

---

## 3. 21ST.DEV

- Tagline kini *"The living library of interfaces"* (dulu "npm for design engineers").
  Pembuat: Serafim Korablev (@serafimcloud) dkk, **21st Labs, YC W2026**, SF.
- Registry komunitas format **shadcn registry** (React+Tailwind+Radix): klaim **12.000+**
  komponen/template/tema, 3,31jt builders terdaftar (klaim marketing), 700+ author;
  mengindeks library pihak ketiga (Aceternity, Magic UI, Origin UI, Ruixen UI…).
- Cara pakai: **Copy prompt AI** (utama — paste ke Cursor/Claude Code/v0) · shadcn CLI ·
  **MCP resmi**: `npx @21st-dev/cli@latest init --client cursor|claude|vscode…` atau HTTP
  `https://21st.dev/api/mcp` + header `x-api-key`. Tool: generate, get_inspiration,
  search_logo, catalog search. Ada ekstensi VS Code.
- Harga: Free **2 salinan/hari** · Builder **$6/bln** (unlimited) · +AI $15/bln · Team $7,50/seat.
  Platform MIT; lisensi per-komponen milik author.
- Kelemahan: konsistensi bervariasi multi-author, a11y tanpa audit sentral, kuota free ketat,
  fokus perusahaan bergeser ke Agents SDK.
- ✅ Variasi gaya luas + blok landing + workflow agent-first; ❌ butuh sistem tunggal konsisten/garansi a11y.

---

## 4. REACTBITS (reactbits.dev)

- Pembuat: **David Haz** (single author, kurasi rapi). ±46k★ GitHub. Tagline: largest &
  most creative library of animated React components.
- **166 komponen gratis** (llms.txt resmi): Text Animations 32 (Split Text, Blur Text,
  Decrypted Text, Variable Proximity…) · Animations 37 (Click Spark, Magnet, Image Trail…) ·
  Components 44 (Spotlight Card, Dock, Magic Bento, Stepper…) · Backgrounds 53 (Aurora,
  Particles, Silk, Hyperspeed, Liquid Chrome…).
- 4 varian per komponen: JS/TS × CSS/Tailwind. Deps **per komponen**: GSAP, Motion,
  three.js, OGL, matter-js — cek halaman masing-masing.
- Instal: shadcn CLI URL registry (`npx shadcn@latest add https://reactbits.dev/r/SplitText-TS-TW`)
  atau jsrepo atau manual. Tidak ada paket npm resmi.
- **Lisensi MIT + Commons Clause**: bebas dipakai personal & komersial SEBAGAI BAGIAN aplikasi,
  tapi **dilarang menjual/redistribusi komponennya sendiri**. Library gratis tetap gratis;
  monetisasi via **Pro lifetime $99/$199/$299** (134 animated comps → +238 page blocks +
  300 app UI blocks + templates Next.js).
- A11y/performa: animasi default ON, tanpa panduan `prefers-reduced-motion` resmi → tambahkan
  wrapper sendiri; background WebGL/OGL/three.js berat di main-thread & butuh `ssr:false` di Next.js.
- ✅ Landing/hero/marketing/portfolio; ❌ dashboard data-dense, alur aksesibilitas-kritis,
  kebutuhan redistribusi murni-MIT.

---

## 5. Perbandingan cepat

| Aspek | Ant Design | Skiper UI | 21st.dev | ReactBits |
|---|---|---|---|---|
| Model | Framework UI utuh | Registry shadcn niche | Marketplace komunitas + AI | Katalog 1 author |
| Jumlah | 73 komponen | 106 komponen | 12.000+ aset | 166 gratis (+683 Pro) |
| Lisensi | MIT | Custom (atribusi/$129) | MIT platform, per-author | MIT + Commons Clause |
| Biaya | Gratis | Gratis-atribusi / $129 | Free 2/hari; $6–15/bln | Gratis; Pro $99–299 sekali |
| A11y | Sedang (kelemahan diketahui) | Lemah | Bervariasi (basis Radix) | Lemah (animasi default ON) |
| Motion util | 0.1/0.2/0.3s konservatif | Sangat expressive | Bervariasi | Sangat expressive |
| Cocok untuk | App internal/B2B | Aksen landing unik | Eksplorasi + agen AI | Hero/marketing |

## 6. Aturan lintas-library (anti-jebakan)

1. **Reduced-motion wajib**: semua library animasi di atas tidak memakai
   `prefers-reduced-motion` by default — bungkus dengan util sendiri sebelum masuk produksi.
2. **Anggaran performa**: maksimal 1–2 komponen WebGL/heavy-motion per halaman; lazy-load sisanya.
3. Cek **lisensi per komponen** (bukan per situs) sebelum masuk repo klien.
4. Copy-paste ≠ dependensi: kamu mewarisi maintenance kode itu — review a11y & TS types.
5. Dashboard/app internal → Ant Design/shadcn polos; komponen ekspresif hanya di permukaan
   marketing. Jangan campur bahasa visual keduanya dalam satu produk.
