# 📚 UI/UX Knowledge Base

> Hasil riset mendalam terhadap 45+ sumber referensi UI/UX (terakhir diperbarui Agustus 2026).
> Disusun untuk diterapkan langsung ke project-project ke depan.

## Cara pakai knowledge base ini

| Situasi | Buka file |
|---|---|
| Mau mulai project baru, butuh token desain (warna, tipografi, spacing, motion) | `01-fondasi-guidelines.md` |
| Mau bangun/merapikan design system, bingung penamaan komponen | `02-design-systems.md` |
| Mau tahu "aplikasi top menyelesaikan flow X seperti apa?" (benchmarking) | `03-pattern-evidence.md` |
| Mau optimasi onboarding, paywall, konversi — psikologi pengguna | `04-psikologi-case-studies.md` |
| Butuh tools, template proses, animasi siap pakai, infra $0 | `05-tools-resources.md` |
| Mau ikut komunitas, update tren, rutinitas belajar mingguan | `06-komunitas-tren.md` |
| Audit product sebelum launch / checklist quality gate | `07-playbook.md` |
| Butuh ikon/logo animasi, splash screen, motion tool (Lottie/Rive/Jitter), aturan logo pihak ketiga | `08-icons-logos-motion.md` |
| Butuh token M3 eksak, update Material 3 Expressive, spring motion, status library web resmi | `09-m3-material-deepdive.md` |
| Milih library komponen web (Ant Design vs Skiper UI vs 21st.dev vs ReactBits) + token default-nya | `10-komponen-modern-web.md` |
| Mau desain UI yang tidak mirip template AI, atau mengelola efisiensi agent (hemat token/code, anti-slop copy) | `11-agent-skills-distinct-efficient.md` (+ `sources/`) |
| Butuh dasar psikologi untuk mempertahankan keputusan desain (hukum UX kanonik) | `12-laws-psikologi-ux.md` |
| Butuh taktik visual mikro (hierarki, spacing, tipografi praktis per-elemen) | `13-craft-ui-taktis.md` |
| Mau implementasi komponen yang accessible (keyboard/screen reader pattern) | `14-aksesibilitas-pola.md` |
| Desain form/checkout/listing berbasis bukti riset (konversi & friksi) | `15-ecommerce-konversi.md` |
| Mendesain fitur/produk AI (chatbot, generator, rekomendasi) | `16-desain-produk-ai.md` (+ `sources/hax-18-guidelines.md`, `sources/pair-guidebook-notes.md`) |
| Cari referensi landing page / SaaS live untuk benchmarking visual | `17-galeri-inspirasi-web.md` |

## Peta sumber → peran

```
FONDASI (aturan resmi)
├── Material Design 3 ──── token sistem: color roles, type scale, motion, adaptive
│   └── m3.material.io deep dive ── Expressive 2025, spring tokens, 45 roles, Material Symbols
├── Apple HIG ──────────── platform-native: Dynamic Type, safe area, alert/sheet
│
REFERENSI SISTEM (bagaimana orang lain menyusunnya)
├── Component Gallery ──── 60 komponen × 95 design system × 2.700+ contoh
├── Design Systems Surf ── anatomi ~90 design system (foundations vs components)
├── Ant Design ─────────── sistem enterprise terbesar: arsitektur seed→map→alias, 73 komponen
│
LIBRARY KOMPONEN SIAP-PAKAI (copy-paste era AI)
├── 21st.dev ───────────── registry komunitas + MCP server untuk AI agent (YC W2026)
├── ReactBits ──────────── 166 komponen animasi (hero/landing), MIT+Commons Clause
├── Skiper UI ──────────── komponen motion unik ala shadcn (lisensi custom, hati-hati)
│
BUKTI PATTERN (apa yang benar-benar dipakai produk live)
├── Mobbin ─────────────── 600.000+ screenshot & flow dari app global (+ playbook benchmarking)
├── PageFlows ──────────── video end-to-end user journey + taksonomi flow
├── chamjo.design ──────── pattern pasar lokal (Indonesia, UAE) yang tidak terlihat dari luar
│
PSIKOLOGI & STUDI KASUS
├── Growth.design ──────── teardown beranotasi: onboarding, paywall, email
├── Built for Mars ─────── benchmark terukur antar kompetitor
└── Laws of UX ─────────── 30 hukum psikologi kanonik (Hick, Jakob, Fitts, Gestalt, Peak-End…)

CRAFT UI (taktik visual mikro)
├── Refactoring UI ─────── taktik developer-friendly: hierarki, spacing, warna HSL, depth
├── Practical UI ───────── 100+ guideline logis dgn angka (kontras 3:1/4.5:1, target sentuh 48pt)
└── Practical Typography ─ aturan tipografi inti (15–25px, leading 120–145%, 45–90 karakter)

AKSESIBILITAS (standar implementasi)
└── W3C ARIA APG ────────── 30 pola widget resmi: keyboard map, focus management, live regions

BUKTI KONVERSI & RISET NUMERIK
└── Baymard Institute ──── 700+ guideline dari 200rb jam riset (checkout, form, search, PLP)

DESAIN PRODUK AI (frontier)
├── Google PAIR Guidebook ─ automate vs augment, mental models, trust levers, graceful failure
└── Microsoft HAX Toolkit ─ 18 guidelines human-AI + Design Library + Workbook (+ `sources/`)

GALERI INSPIRASI WEB (produk live)
└── One Page Love · Land-book · Lapa Ninja · Saaspo · SaaS Landing Page · Landingfolio · Godly

PIKIRAN KRITIS
├── UX Collective ──────── esai kurasi manusia; newsletter mingguan cukup
│
TOOLS & EKOSISTEM
├── Miro templates ──────── artefak proses UX siap clone (journey map, story map, dll)
├── originkit.dev ──────── 260+ komponen animasi copy-paste (React/Tailwind/Framer)
├── LottieFlow ─────────── micro-interaction Lottie gratis per state UI
├── free-for.dev ───────── peta free tier untuk MVP $0
│
IKON, LOGO & MOTION
├── Iconfinder / Noun Project / Lordicon ─ sumber ikon statis & animasi + craft rules
├── Feather Icons / feathericon ────────── set ikon open-source MIT (stroke-24 vs fill-16)
├── LottieFiles / Jitter / Rive ────────── toolchain animasi: linier → authoring → interaktif
├── Brandfetch / BrandNew / Cosmos ─────── logo brand, kritik identitas, referensi visual
└── CodePen / Spline / Dribbble-Behance ── loader CSS, 3D web, format presentasi profesional
│
KOMUNITAS & TREN
└── Reddit, Pinterest, Dribbble, Behance, Awwwards, ADPList, Designer Hangout, HN, IH
```

## Workflow riset yang disarankan (sintesis lintas sumber)

1. **Definisikan pertanyaan dulu**, bukan browsing dulu.
   ❌ "Lihat-lihat Mobbin dulu" → ✅ "Bagaimana 10 app top menangani empty state dashboard?"
2. **Mobbin/PageFlows** = bukti mentah → bandingkan 5–10 contoh, ekstrak kerangka umum + outlier.
3. **chamjo.design** = cek delta regional kalau target pasar SEA/MENA.
4. **Component Gallery** = pastikan nama komponen & perilakunya sesuai konsensus industri.
5. **Growth.design/BFM + Laws of UX (`12`)** = hipotesis psikologis untuk flow kritis (signup, paywall, cancel).
6. **Baymard (`15`)** = angka riset untuk form/checkout/listing; **Galeri web (`17`)** = referensi landing page live.
7. **M3 + HIG (`01`/`09`) + Craft UI (`13`) + APG (`14`)** = token, taktik visual mikro, dan pola a11y eksekusi.
8. Fitur menyentuh AI? → jalankan checklist `16-desain-produk-ai.md` sebelum build.
9. Uji → ukur → iterasi.

## File index

- `01-fondasi-guidelines.md` — Material 3 & Apple HIG dengan angka konkret
- `02-design-systems.md` — anatomi & penamaan design system + daftar sistem layak belajar
- `03-pattern-evidence.md` — Mobbin, PageFlows, chamjo.design + pola konvergen
- `04-psikologi-case-studies.md` — Growth.design, Built for Mars + prinsip psikologi
- `05-tools-resources.md` — Miro, OriginKit, LottieFlow, free-for.dev
- `06-komunitas-tren.md` — Reddit/PPinterest/lainnya + tren 2025–2026 + rutinitas belajar
- `07-playbook.md` — checklist actionable: audit, quality gate, stack MVP $0
- `08-icons-logos-motion.md` — Iconfinder/Noun Project/Lordicon, LottieFiles/Jitter/Rive, Brandfetch/BrandNew/Cosmos, CodePen/Spline/Dribbble-Behance + checklist ikon/logo/splash & tren 2025–2026 + feathericon vs Feather Icons
- `09-m3-material-deepdive.md` — m3.material.io mendalam: M3 Expressive, spring/duration/easing tokens eksak, 45 color roles, anatomi komponen, status @material/web, Material Symbols
- `10-komponen-modern-web.md` — Ant Design (arsitektur token seed→map→alias), Skiper UI, 21st.dev (+MCP), ReactBits; perbandingan & aturan anti-jebakan
- `11-agent-skills-distinct-efficient.md` — deep dive 5 agent skill: frontend-design (Anthropic resmi), ponytail (YAGNI ladder), caveman (kompresi output), rtk (filter output CLI), stop-slop (anti pola tulisan AI) + benchmark jujur & cara adaptasinya ke workflow Penpot; sumber mentah di `sources/`
- `12-laws-psikologi-ux.md` — 30 hukum Laws of UX dikelompokkan (keputusan/memori/Gestalt/motivasi) + implikasi desain konkret + anti-pola salah kaprah
- `13-craft-ui-taktis.md` — distilasi Refactoring UI + Practical UI + Practical Typography: taktik per-elemen dengan angka (kontras, target sentuh, leading, line length)
- `14-aksesibilitas-pola.md` — W3C ARIA APG: prinsip semantik-first, tier pola wajib (Dialog/Tabs/Disclosure/Tooltip/Menu Button), ritual verifikasi tanpa tools mahal
- `15-ecommerce-konversi.md` — angka kunci Baymard (70,19% abandonment, 11,3 field, dsb.) + guideline checkout/form/search/listing + padanan untuk produk non-ecommerce
- `16-desain-produk-ai.md` — PAIR Guidebook + HAX 18 guidelines: keputusan automate/augment, framework onboarding AI, trust levers, error recovery, pola UX generatif; mentah di `sources/`
- `17-galeri-inspirasi-web.md` — peta galeri landing/SaaS live (One Page Love → Godly) + workflow riset inspirasi + filter kualitas referensi
