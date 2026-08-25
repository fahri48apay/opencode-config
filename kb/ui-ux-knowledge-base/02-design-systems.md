# 02 — Design Systems: Anatomi, Penamaan, Sistem Layak Dipelajari

> Sumber utama: **component.gallery** (60 komponen × 95 design system × 2.700+ contoh)
> dan **designsystems.surf** (~90 sistem, didekomposisi jadi foundations + components).
> Lensa keduanya saling melengkapi: gallery = "bagaimana KOMPONEN INI di-namai & di-dokumentasikan",
> Surf = "bagaimana SELURUH SISTEM diorganisasi".

---

## Temuan lintas-sistem

### 1. Konsensus penamaan itu nyata dan terukur
- **Settled (pakai nama dominan)**: Button, Modal/Dialog, Tabs, Badge/Tag, Toast/Snackbar.
- **Genuinely contested — putuskan secara sadar + dokumentasikan alasannya**:
  Accordion vs Disclosure vs Collapse · Badge vs Chip vs Tag · Modal vs Dialog.
- Component Gallery menyediakan *name-distribution chart* per komponen → lihat alias mana yang dominan sebelum menamai.

### 2. Alias map ringkas (canonical ← variasi)
| Canonical | Juga dipanggil |
|---|---|
| Accordion | Disclosure, Collapse, Collapsible, Details, Expander |
| Badge | Tag, Label, Chip |
| Modal | Dialog, Popup |
| Toast | Snackbar |
| Toggle | Switch |
| Drawer | Tray, Flyout, Sheet |
| Select | Dropdown |
| Tooltip | Toggletip |
| Segmented control | Toggle button group |
| Stepper (input) | Nudger, Quantity, Counter |
| Progress indicator | Stepper (flow), Wizard, Timeline |

⚠️ Bedakan berdasar PERILAKU bukan tampilan: Popover = klik + konten interaktif;
Tooltip = hover + teks. "Dropdown menu" ≠ Select karena aksi ≠ input.

### 3. Aturan naming yang terdistilasi
- Nama = **fungsi**, bukan tampilan/implementasi.
- Split jadi komponen bernama bila perilakunya beda (`IconButton`, `CopyButton`);
  tetap prop kalau hanya visual (`primary`/`secondary`).
- Pola: `[Category]/[Component]/[Variant]/[State]`, fungsi-based, 1–2 kata,
  identik di Figma–kode–dokumentasi.
- Alias taruh di metadata search, bukan nama primer.

### 4. Dokumentasi komponen matang selalu punya anatomi sama
```
Definisi + alias → Contoh → Do/Don't (kapan TIDAK dipakai)
→ Accessibility notes → Behavior → Related components
```
"Document the negative space" — bagian "when NOT to use" yang membedakan
sistem dewasa dari sticker sheet.

### 5. Struktur sistem mengkonvergen ke satu tulang punggung
```
Foundations: color · typography · spacing · elevation · tokens · iconography
             accessibility · voice & tone · motion
Components:  ±40–70 tipe
Patterns · Guidelines · Versioning/lifecycle
```
Rasio foundations:components terdokumentasi = indikator kesehatan
(sticker sheet vs true system).

### 6. Token adalah kontrak
Sistem dengan halaman token dedikasi (Polaris, Carbon, Fluent) selamat dari rebrand.
Nama token semantik (`surface/background/interactive`) — tidak pernah by value.

### 7. Tulis untuk AI sebagai pembaca kedua
Frontier 2025–2026: design system "AI-ready" — keputusan machine-traceable
(apa yang approved/current/safe) supaya manusia DAN LLM bisa mengonsumsi docs.

---

## Design system layak dipelajari langsung

| Sistem | Alasan belajar |
|---|---|
| **GOV.UK Design System** | Gold standard docs evidence-based; riset-backed |
| **NHS Digital service manual** | Content design inklusif dengan rationale |
| **IBM Carbon** | Multi-framework (React/Vue/Angular/Svelte/WC) dari satu sumber; arsitektur token tutorial-grade |
| **Shopify Polaris** | Model lifecycle/stage komponen; anatomy foundations↔components terbersih |
| **Atlassian DS** | Integrasi komponen + usage guideline + tone of voice |
| **Salesforce Lightning** | Enterprise config-driven UI; token & variant naming skala besar |
| **Adobe Spectrum** | Disiplin penamaan semantik (Action button vs Button vs Picker) |
| **GitHub Primer** | Evolusi open-source pragmatis; status label per komponen |
| **GitLab Pajamas** | Docs hygiene publik paling transparan (19 foundation areas) |
| **Twilio Paste** | Dokumentasi a11y per-komponen kuat |
| **eBay MIND Patterns** | Reasoning pattern a11y-first, bukan showcase visual |
| **Porsche Design System** | Web Components core + framework adapters |
| **Wise Design** | Langka: sistem mobile-first publik |
| **Uber Base** | Skala masif dengan paritas Figma↔code tinggi |
| **Material / Fluent / HIG** | Benchmark universal; bahasa franca industri |

---

## Direktori pembanding (kalau butuh lebih luas)

| Direktori | Lensa | Catatan |
|---|---|---|
| component.gallery | Komponen → banyak implementasi + alias | Gratis, kurasi tinggi |
| designsystems.surf | Anatomi sistem ternormalisasi, deep-links | Freemium, segar, ada artikel AI-ready |
| adele.uxpin.com | Katalog mentah 300+ sistem | Terluas, metadata dangkal |
| designsystemsrepo.com | Agregator resources (artikel/talk/podcast/tools) | Luas tapi kurasi longgar |

## Checklist memulai design system sendiri

- [ ] Mulai dari spine: tokens → color/type/space → components inti (Button, Input, Modal, Tabs, Toast…) → patterns → voice.
- [ ] Pilih nama dari konsensus industri (cek component.gallery); dokumentasikan keputusan yang menyimpang.
- [ ] Setiap komponen: definisi + contoh + do/don't + a11y + related.
- [ ] Token semantik dengan halaman dedikasi; light/dark/high-contrast variants.
- [ ] Lifecycle label (draft/stable/deprecated) agar trust terjaga.
- [ ] Buat docs readable oleh AI (struktur konsisten, deep-linkable).
