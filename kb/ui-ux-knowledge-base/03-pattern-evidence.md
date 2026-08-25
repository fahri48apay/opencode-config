# 03 — Pattern Evidence: Mobbin, PageFlows, chamjo.design

> Prinsip: **pertanyaan dulu, browsing kemudian**. Sumber-sumber ini adalah BUKTI
> (produk live, bukan concept art) — pakai untuk benchmarking, bukan meniru buta.

---

## Mobbin (mobbin.com) — playbook mendalam

> Deep-dive Agustus 2026 dari landing/pricing/terms/changelog/blog resmi + review pihak ketiga.

### Produk & skala (klaim landing, Agu 2026)
**1.428 apps · 621.500+ screens · 323.900 flows** — iOS/Android/**Web + "Sites"**
(landing/marketing site, sejak Agu 2025). Update mingguan; ada version history per-app,
Live Activities/Dynamic Island/widgets, video micro-interaction, mode prototype
(hotspot click-through), flow tree arsitektur app.

### Fitur pencarian (yang sering dilewatkan)
- Search multi-lapis satu query: *screens / flows / sections* (bisa ganti tab tanpa kehilangan query).
- **OCR text-in-screenshot**: cari kata yang muncul di dalam gambar ("checkout", "invite").
- **Deep Search semantik (AI)**: membaca maksud, bukan keyword literal; juga dipakai di Chat & API/MCP.
- **Visual search**: upload screenshot → cari layar mirip; klik hasil → "similar screens".
- Filter: Screen Pattern × UI Element × Flow Pattern × industri × platform × animated-only;
  sort Latest/Trending/Most popular/Top rated.
- Collections + komentar (publik sejak Jan 2026, profil `mobbin.com/@username`),
  plugin Figma multi-screen, **MCP Server (Apr 2026)** + REST API ber-AI-Credits.

### Harga 2026 (live, ditampilkan IDR)
| Tier | Harga | Isi kunci |
|---|---|---|
| Free | Rp0 | hanya 4 app/site terbaru, filter & flow terbatas, ≤3 koleksi, tanpa download |
| Pro | **Rp160.000/bln billed yearly** ≈ $10/mo | semua konten, koleksi unlimited, download, app history, plugin Figma |
| Team | Rp256.000/member/bln ≈ $16 | + koleksi tim, mentions, admin, SOC 2 |
| Enterprise | contact sales | SOC 2, legal agreement |

Catatan: Pro **dipangkas dari $16 → $10 pada 8 Juli 2026**; tanpa free-trial berwaktu
(free tier = trial); refund strictly none (Terms §8); diskon pelajar/edukator tersedia.

### Legal pemakaian screenshot (WAJIB tahu sebelum deliverable)
- Semua Materials adalah **IP pemilik aplikasi**, bukan milik Mobbin (§10.3).
- Boleh: publikasi ulang **terbatas + atribusi** ke pemilik app ("Screenshot via Mobbin / © App") — benchmark internal, evidence wall, referensi pola di Figma.
- Abu-abu: mockup deliverable yang menampilkan UI/brand app lain masif; portofolio yang menyalin persis.
- Dilarang tegas: menjual/lisensi konten, scrape/mirror, melatih model generative-AI darinya (§3.4), membangun database pengganti dari API/MCP (§3.5). DMCA aktif.

### Playbook benchmarking (step-by-step)
1. Mulai dari task/pertanyaan riset, bukan scrolling — "Bagaimana neobank menangani KYC?".
2. Tarik **5–10 contoh momen yang sama** lintas app sejenis (Screen Pattern + industri + platform target).
3. Pisahkan **pola konvergen** (= konvensi kuat, jangan pecahkan tanpa alasan) vs **outlier**
   (= hipotesis diferensiasi). Data MCP: pasangan rival populer Calm+Headspace, Monzo+Revolut,
   Linear+Notion → kerja "side-by-side competitor" adalah pola nyata praktisi.
4. **Ekstrak prinsip, jangan pixel** — tulis kesimpulan perilaku ("paywall datang setelah
   personalisasi"), lalu desain dengan bahasa visual sendiri.
5. Dokumentasikan: Collection per-proyek + komentar konteks = evidence wall saat review stakeholder.
6. Cek **App History** untuk melihat evolusi redesign — pola iterasi > snapshot tunggal.

Kesalahan umum: browsing ala Pinterest tanpa pertanyaan; copy blind lintas pasar/konteks
(pola AS/Eropa ditempel ke pasar COD/wallet lokal); mengira "app besar pakai ini" =
"terbukti" — caveat resmi Mobbin sendiri: *"data menunjukkan wujud, bukan performa"*.

### Pola konvergen yang terlihat lintas ribuan app
1. Paywall = stack value proposition + social proof + framing trial.
2. Onboarding = 3–5 layar ideal, permission request progresif dengan alasan.
3. Checkout menyembunyikan field di belakang collapsible/wallet (Apple/Google Pay).
4. Version history mengungkap *bagaimana* app iterasi.
5. Satu elemen dibandingkan lintas 20 app → lihat rentang konvensi sebelum commit.

Bukti kuantitatif resmi (studi "The Long Onboarding", Jul 2026; 986 apps/1.460 flows):
rata-rata onboarding **25 layar** (Finance 40, Health 36); **22% app memasang paywall saat
onboarding, 71% di antaranya TANPA personalisasi dulu**; hanya ~6% pakai urutan
personalisasi→paywall (justru flow terpanjang, rata-rata 42 layar). Elemen yang membuat
flow panjang terasa pendek: progress bar, pertanyaan personal, mirror persona,
cicip produk, rencana dari jawaban.

### Keterbatasan & alternatif
Tanpa anotasi/alasan desain · snapshot statis (bukan data A/B) · search kadang meleset
(keluhan #1 review) · free tier sempit + daily caps · bias app populer Barat/global,
coverage SEA/Indonesia tipis · web coverage lebih dangkal dari mobile.
Alternatif: PageFlows (video journey beranotasi) · Nicelydone (spesialis SaaS/web) ·
Refero (murah/cepat) · Screenlane (granular komponen) · GoodUI (**bukti lift A/B test**) ·
OpenUX/Lazyweb (gelombang gratis AI-native 2026).

### Bahasa visual situsnya sendiri (meta-inspirasi)
Minimal terang + dark mode opsional; font **Saans** (Displaay); grid masonry kartu rounded
shadow tipis; hover memunculkan aksi Open/Save/Copy + tag elemen UI; onboarding paywall-nya
sendiri mempraktikkan apa yang didokumentasikan: value dulu → upsell modal → wall of
social proof (logo Coinbase/Wise/Airbnb/Nike). Blog dua kanal: esai editorial panjang +
data insights — posisi konten sebagai riset, bukan SEO listicle.

---

## PageFlows (pageflows.com)

**Apa**: library video rekaman flow nyata end-to-end (~$99/thn). Nilai utamanya:
**taksonominya sendiri = checklist audit siap pakai.**

**Taksonomi flow (≈50 kategori)**:
- Onboarding & Tutorials: Onboarding, Signing Up
- Account: Upgrading, Downgrading & Canceling, Log In/Out, Verifying, Resetting Password, Reactivating, Deactivating & Deleting
- Content: Creating & Adding, Searching & Finding, Filtering & Sorting, Importing/Exporting
- Social: Inviting, Following, Sharing, Reviewing, Blocking, Reporting
- Transactions: Purchasing, Booking, Transferring, Canceling & Refunding, Redeeming
- Misc: Setting Up, Enabling/Disabling, Agreeing To Terms, Getting Help

**10 pola dari flow-flow terbaik**:
1. Progressive disclosure di mana-mana; tooltip hanya muncul saat kontekstual.
2. Aha-moment acceleration: rutekan user ke satu aksi bernilai dalam hitungan menit; sisanya skippable.
3. Personalisasi di depan MAKSIMAL 3–5 pertanyaan yang user sudah tahu jawabannya.
4. Permission priming: layar pre-permission custom menjelaskan "mengapa" SEBELUM dialog OS; selalu sediakan "Not now".
5. Freemium gate di batas kontekstual (paywall muncul tepat saat dibutuhkan, bukan jadwal).
6. Checklist setup SaaS: dismissible, 3–5 item, progress % terlihat.
7. Deferred account creation: biarkan user merasakan nilai dulu sebelum diminta signup.
8. Empty state = onboarding; dashboard kosong adalah churn point #1.
9. Escape hatch ("Skip"/"Later") justru MENAIKKAN completion rate.
10. Email memperpanjang onboarding (lifecycle email post-signup).

**Produk yang paling banyak dipelajari**: fintech onboarding (Revolut, Robinhood, Monzo — KYC tersulit), consumer mobile (Duolingo, TikTok), B2B web (Stripe, Notion, Slack).

---

## chamjo.design

**Apa**: archive 8.000+ screenshot app LOKAL — fokus **Indonesia & UAE**
("chamgo" = 참고, "referensi"). Satu-satunya jendela ke flow di balik login wall /
payment lokal yang butuh residensi untuk capture.

**Mengapa berharga untuk kita (pasar Indonesia)**:
- Pattern non-Barat menyelesaikan masalah sama secara BEDA:
  chat-based commerce · checkout COD-heavy · wallet/aggregator payment
  · layout informasi lebih padat · badge status & ikonografi bahasa lokal.
- Logika super-app (Gojek-style nested mini-services) = pattern untuk produk feature-dense.
- Benchmark "trusted look" emerging market ≠ Barat (color coding & proof signals beda).

**Cara pakai**: Mobbin = baseline global → chamjo = delta regional.
Bandingkan flow type yang sama side-by-side. Kalau pattern "universal" ternyata
hanya ada di Barat → itu sinyal localization gap.

---

## Sintesis: kapan pakai yang mana

| Kebutuhan | Alat |
|---|---|
| "Bagaimana app global menyelesaikan X?" (cepat, luas) | Mobbin |
| "Journey lengkap end-to-end dengan anotasi" | PageFlows |
| "Apakah ini cocok untuk pasar Indonesia/MENA?" | chamjo.design |
| Taksonomi audit flow produk sendiri | Taxonomy PageFlows |
| Bukti evolusi keputusan desain | Mobbin version history |
| Estetika spekulatif / trend visual | ❌ Jangan pakai ketiganya — pakai Dribbble/Awwwards tapi sadar biasnya |

## Template riset pattern (copy-paste ke project)

```
Pertanyaan: Bagaimana [10 app top] menangani [flow/elemen X]?
Sumber    : Mobbin (global) + chamjo (regional) + PageFlows (video)
Output    :
  - Kerangka umum (langkah 1..N yang semua lakukan)
  - Outlier menarik + hipotesis kenapa
  - Konvensi yang HARUS diikuti (user expectation)
  - Peluang diferensiasi yang tetap aman
Keputusan : [pattern yang kita adopsi + alasan + link bukti]
```
