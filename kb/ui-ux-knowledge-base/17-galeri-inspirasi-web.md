# 17 — Galeri Inspirasi Web: Peta + Kapan Pakai yang Mana

> Sumber utama: galeri kurasi landing page & website aktif per Agustus 2026.
> Melengkapi `03-pattern-evidence.md` (Mobbin/PageFlows = flow aplikasi) dan `06-komunitas-tren.md`
> (Dribbble/Awwwards = showcase konsep). Galeri di sini fokus: **produk nyata yang sudah live**,
> terutama landing page & SaaS — referensi yang bisa dipertanggungjawabkan ke stakeholder.

---

## Peta galeri → lensa

| Galeri | Lensa | Skala | Gratis? |
|---|---|---|---|
| **One Page Love** (onepagelove.com) | One-page & single-serving sites; kurasi personal sejak 2008 | 9.000+ situs, 8.800+ section examples (pricing/FAQ/social proof) | Ya (+template berbayar) |
| **Land-book** (land-book.com) | Landing page lintas industri; filter dalam: industri, style, warna, platform, typography; kini ada Sections/Motion galleries | Besar, update harian | Freemium (~$6/bln Pro) |
| **Lapa Ninja** (lapa.ninja) | Landing page + 15rb screenshot full-site | 7.300+ desain sejak 2015 | Ya |
| **Saaspo** (saaspo.dev) | Khusus SaaS/B2B; browse per industri & per SECTION | Besar untuk niche-nya | Freemium |
| **SaaS Landing Page** (saaslandingpage.com) | SaaS end-to-end funnel (pricing/about/testimonial/FAQ); tiap entri memperlihatkan font, palet, tech stack — bisa difilter | Sedang, detail tinggi | Freemium |
| **SaaSFrame** (saasframe.io) | Marketing page + hero section + onboarding email B2B | Sedang | Sebagian di balik langganan |
| **Landingfolio** (landingfolio.com) | Landing page per industri/tipe + komponen siap pakai (Tailwind/Webflow/Figma) | Luas komponen | Freemium |
| **Godly** (godly.website) | Avant-garde / trend-forward; "astronomically good web design" | Kurasi ketat | Ya |

## Workflow riset inspirasi yang benar

1. **Pertanyaan dulu** (sama seperti ritual file 03): "Bagaimana 10 SaaS AI menyusun hero + social proof?"
   bukan "lihat-lihat Land-book".
2. **Pilih galeri sesuai pertanyaan**:
   - Flow produk & screen app → Mobbin/PageFlows (`03`)
   - Hero/landing/pricing → Saaspo/Land-book/SaaS Landing Page
   - Section spesifik (testimonials, FAQ, changelog) → One Page Love sections, Land-book Sections
   - Eksplorasi arah visual berani → Godly; mainstream-safe → Land-book
   - Butuh blok siap-build → Landingfolio components
3. **Ekstrak kerangka, bukan kulit**: susun tabel pola (headline formula, urutan section, jumlah CTA,
   jenis social proof). Outlier dicatat tapi tak ditiru mentah-mentah.
4. **Cek konsistensi marketing ↔ product**: SaasUI menunjukkan nilai cek landing page BERDAMPINGAN
   dengan UI produk aslinya — janji di landing harus sama dengan pengalaman in-app.
5. Baru eksekusi dgn token project sendiri (anti-template-AI: lihat `11` §frontend-design).

## Filter kualitas saat memilah referensi

- [ ] Situs masih hidup (bukan arsip mati) & produknya riil?
- [ ] Bisa dibedakan mana pilihan brand vs best practice?
- [ ] Ada ≥3 contoh serupa dari situs berbeda? → baru layak jadi pattern.
- [ ] Kontras/a11y layak ditiru? (banyak galeri avant-garde melanggar WCAG — jangan ikut buta)
- [ ] Tech stack tercatat (di SLP/Land-book)? Berguna kalau mau lihat implementasi.

## Anti-pola

- ❌ Meng-copy hero persis dari tren minggu ini → semua produk tampak sama (AI-slop aesthetic).
- ❌ Meniru situs agensi/portofolio untuk produk data-dense — tujuan beda (kesan vs konversi).
- ❌ Inspirasi tanpa benchmark: tetap jalankan task-script audit ala Baymard setelah redesign (`15`).
- ❌ Dribbble-shot sebagai bukti pattern — itu konsep, bukan produk live (bedakan dengan galeri di file ini).
