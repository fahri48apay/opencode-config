# 08 — Ikon, Logo & Motion: Iconfinder, Noun Project, Lordicon, LottieFiles, Jitter, Rive, Brandfetch, BrandNew, Cosmos, CodePen, Spline

> Fokus: aset visual bergerak — ikon, logo, thumbnail/app-icon, splash animation.
> Sumber riset Agustus 2026. Terapkan langsung ke project Coffee Tongkrong & seterusnya.

---

## 1. IKON

### Sumber

| Platform | Apa | Kapan pakai | Lisensi inti |
|---|---|---|---|
| **Iconfinder** (~6M+ ikon, 155rb set, 3.400 desainer) | Marketplace premium, source AI editable | Butuh lisensi komersial bersih + master file; procurement step, bukan browsing habit | Free = attribution per-asset; Premium Basic = komersial, tanpa attribution, TANPA boleh dipakai sebagai logo/trademark |
| **Noun Project** (~10jt ikon, 150 negara) | Terluas & paling beragam, monochrome by design | Konsep long-tail ("astronaut to zebra"), imagery orang yang inklusif, API in-product | Free = wajib atribusi (jebakan utk produk!); Pro $3.33/bln; API dari $25/bln |
| **Lordicon** (46.400+ ikon animasi) | Standar emas ikon animasi Lottie (`<lord-icon>` web component) | Micro-interaction delight: hover/click/morph states | Free 9.600 ikon (attribution); Pro $8/bln |

### Set ikon open-source: "feathericon" ≠ "Feather Icons" (jangan tertukar)

⚠️ Domain `feathericon.com` **MATI** (NXDOMAIN, Agu 2026); proyeknya hidup di
**feathericon.github.io/feathericon**. Jangan tertukar dengan **feathericons.com**
(Feather Icons karya Cole Bemis) — dua set berbeda:

| | **feathericon** (@featherplain, Tokyo) | **Feather Icons** (Cole Bemis) |
|---|---|---|
| Situs | feathericon.com ❌ → github.io ✅ | feathericons.com ✅ |
| Jumlah | 255 ikon | 287 ikon |
| Gaya | **Solid/fill**, dipakai umum 16×16px | **Outline stroke-based 24×24**, stroke-width 2, `currentColor`, cap/join round |
| Distribusi | Icon font + SVG sprite + Sketch; npm `feathericon`; gem Rails/Figma | SVG/sprite/font; npm `feather-icons`; API JS `feather.replace()` |
| Versi terakhir | v1.0.2 (2018), commit 2021 → **dorman ±5 thn**, ±40 unduhan npm/minggu | v4.29.x, commit Mar 2025 → maintenance mode tapi masih dirawat |
| Lisensi | MIT | MIT |
| Keunikan | Ikon budaya Jepang (dango, takoyaki, squid) | Konsistensi optical alignment tinggi, ekosistem wrapper luas |

Verdict: untuk project baru pakai **Feather Icons (Cole Bemis)** sebagai pilihan aman
ikon outline MIT; feathericon hanya layak sebagai arsip gaya fill-16px atau bila butuh
ikon makanan/budaya Jepang — status dorman + situs asli mati = risiko supply chain.
Pelajaran meta: **verifikasi domain & aktivitas repo sebelum mengikat project ke set ikon**;
set ikon mati = aset yang tidak akan dapat ikon baru saat fitur bertambah.

### Craft rules lintas-sumber (paling penting)
1. **Grid 24×24**: live area 20×20 + padding 2px. Keyline shapes: circle Ø20 · square 18 · v-rect 16×20 · h-rect 20×16. *"Bounding box adalah kebohongan yang mata tak percaya"* — lingkaran boleh overshoot, kotak undershoot.
2. **SATU stroke weight per set** — 2px @ 24px canonical. Stroke terminal kotak; sudut luar membulat (≈½ stroke), sudut dalam tajam.
3. **Pixel fitting**: koordinat integer; stroke genap di grid genap, ganjil offset 0.5px. Ship size-specific masters: @16px buang detail interior (SF Symbols punya ±9 optical sizes).
4. **Filled vs outline**: outline = default/navigasi; filled = state aktif/terpilih + ukuran <16px. Kalau keduanya ada (bookmark), definisikan aturan statenya eksplisit.
5. **Aksesibilitas**: touch target ≥48px (via padding, bukan glyph); icon-only wajib aria-label; kontras ikut token teks.
6. **Five-second test**: kalau <80% user menebak benar arti ikon → redesign atau beri label.
7. Inline SVG > icon font (hinting lebih baik, payload kecil, tanpa CLS).

### Lordicon motion budget (angka konkret)
- Click-triggered: **≤500ms**
- Hover-triggered: sweet spot **1500–3000ms**
- Loop: jeda antar siklus **2–5 dtk**
- Jangan pernah flash/flicker (risiko fotosensitif); loop terus-menerus merugikan user attention disorder.

---

## 2. MOTION TOOLS & SPLASH ANIMATION

### Posisi ketiga tool (satu kalimat)
- **LottieFiles** → ship animasi *linier* murah ke mana pun; ekosistem terbesar; default untuk loader/micro-interaction/splash sederhana.
- **Jitter.video** → *authoring* tercepat video/GIF/Lottie tanpa After Effects; import Figma; AI agents; output = media, bukan runtime interaktif.
- **Rive** → grafis *interaktif ber-state* runtime terkecil (.riv binary 10–15× lebih kecil dari JSON; State Machines dibuat desainer); pilih saat splash/UI harus MERESPONS input/data. Dipakai Spotify Wrapped, Duolingo.

### Lottie essentials
- Format JSON vector animation (Airbnb 2017); **dotLottie (.lottie)** ~90% lebih kecil dari GIF.
- SDK semua platform + plugin AE/Figma/Canva/Webflow/Framer. Cek *supported-features matrix* AE sebelum ekspor (tidak semua fitur selamat).
- dotLottie v2.4 sudah punya **state machine** (interaktivitas tanpa kode).

### ⏱️ Splash screen: aturan durasi (WAJIB)
- Target **≤1.5 detik** terlihat; ceiling keras ~2–3 dtk. Setiap detik tambahan ≈ +8% abandonment.
- **Google resmi**: animasi ikon ≤1000ms (start delay ≤166ms); dismiss saat first frame siap.
- **Apple**: LaunchScreen WAJIB statis (animasi = risiko rejection); pola umum = static launch → overlay animasi singkat → konten.
- NN/g: feedback 100–300ms; >500ms terasa berat; default ease-out.
- Load beneran >2 dtk? Handoff ke skeleton screen, JANGAN tahan splash.

### Pola implementasi kanonis (native → animated overlay)
1. Native/sistem splash paint instan (solid color = warna frame pertama animasi) → zero white flash.
2. Layer animasi (Lottie/Rive) mount SETELAH engine siap; tahan native splash sampai overlay benar-benar ter-paint (double rAF di RN).
3. Play sekali non-looping (~1–2 dtk), boleh gate dismissal pada sinyal app-ready.
4. Fade out ke konten; **siapkan fallback logo statis** jika animasi gagal.
5. Pitfalls: timer artifisial "biar brand sink in"; mismatch warna background antar-layer; tidak ada reduced-motion fallback; splash panjang di relaunch (full animation hanya cold start).

---

## 3. BRANDING & LOGO DI UI

### Sumber
- **Brandfetch** (brandfetch.com): CDN logo/warna/font perusahaan apa pun — `cdn.brandfetch.io/{domain}` langsung di `<img>`, free 500k req/bln, tanpa attribution, wajib hotlink. Varian dark/light menyelesaikan "logo hilang di dark UI" TANPA recolor. Data nyata: personalisasi brand nyata = Typeform +5% conversion.
- **BrandNew** (underconsideration.com/brandnew): kritik identitas paling otoritatif sejak 2006. Latihan kosakata kritik: equity vs trend-chasing, eksekusi vs strategi, rollout sebagai UX problem (Gap gagal vs Slack sukses). Skim 15 menit/hari; cari arsip sebelum project logo.
- **Cosmos** (cosmos.so): search engine visual AI + cluster referensi pribadi, ad-free. Organize by PROJECT CLUSTER, search by warna/mood; extension save-from-anywhere; filter hide-AI. Lebih baik dari Pinterest untuk taste-building.

### Aturan pemakaian logo pihak ketiga di UI (wajib taat)
- **Google sign-in**: teks persis "Sign in with Google"/"Continue with Google"; "G" full-color RESMI — **dilarang monochrome/recolor**; background putih; spesifikasi hex lengkap light/dark/neutral; tombol Google harus ≥ seprominen opsi third-party lain; compliance = syarat app verification.
- **Meta**: logo min 12px/5mm tinggi; clear space = 2× tinggi simbol.
- **Universal**: clear space dari unit letterform, sama semua sisi; min wordmark ±80–90px lebar; di bawah legibility → pakai varian simplified yang disetujui, JANGAN diperkecil lagi; dilarang stretch/shadow/outline/glow/retype; kontras ≥3:1; encode clear-space sebagai spacing token di design system.
- Fair use: boleh REFERENSI brand (halaman integrasi, review); dilarang merch/implikasi afiliasi.

---

## 4. SHOWCASE, TOOLS & TRENDS 2025–2026

### CodePen (codepen.io)
Library live terbesar CSS-only loaders/spinners/hover effects/pure-CSS logos. **Pens publik otomatis MIT-licensed** (boleh komersial); etika: credit author, Fork > copy diam-diam. Pola layak curi: border-trick spinner, dot-bounce staggered, gradient shift via background-position, glass card (translucent + backdrop-blur + border 1px + soft shadow), splash = logo scale/fade chained ke content fade-in.

### Spline (spline.design)
3D browser-based → hero 3D, 3D logo reveal, product configurator; export React/web satu tag `<spline-viewer>`. Gratis = watermark. **Performance warning serius**: embed mahal di CPU/main-thread — ≤1–2 embed per halaman, lazy-load via IntersectionObserver, reserve container (CLS=0), poster statis, ATAU export image/video kalau interaktivitas tak dibutuhkan.

### Dribbble & Behance — format presentasi profesional
- **Icons/app icons**: grid sheet satu family per frame; varian light/dark/tinted berdampingan; row ukuran thumbnail 40px; preview mask (circle/squircle); motion preview looping dengan rationale tertulis.
- **Logo/identity (Behance)**: arc narasi — challenge → proses (sketch, moodboard) → **construction-grid sheet** → versi mono/reversed → clear-space & min-size → palette → tipografi → mockup sesuai industri → elemen kejutan (GIF/motion).
- Yang membedakan presentasi bagus: silhouette-first, varian sebagai SISTEM bukan one-off, mockup konteks nyata, motion sebagai deliverable bernama (Lottie/MP4/GIF).

### Trends 2025–2026
- **App icons era Liquid Glass**: iOS 26 render tiap ikon layered glass × 6 mode (default/dark/clear/tinted); Icon Composer = flat layers, JANGAN bake gloss/shadow/sudut; **silhouette > palette** (mode clear/tinted buang warna); layer foreground putih untuk mono; safe zone inner 66% dari 1024px.
- Style: glassmorphism 2.0 restrained · single bold element · gradient analogous multi-stop · soft 3D · hand-drawn imperfect sebagai anti-AI signal.
- **Logos**: kinetic/motion-first mainstream (mark statis = "hero frame" dari sequence); responsive system (lockup → monogram → favicon); mesh gradient ala Stripe sudah terasa "2022".
- **Splash**: quiet micro-motion > spectacle; kinetic signature dikenali SEBELUM mark resolve; `prefers-reduced-motion` table stakes.
- App-icon conversion winners: gradient + flat white shape; mascot (games); geometric simetris (media). Losers: ilustrasi detail 3+ elemen, wajah realistis, wordmark >3 huruf.

### Mobbin — 6 gaya splash kanonis (1.700+ contoh nyata)
1. Logo minimal saja (Revolut, Airbnb) — brand terbaik menahan diri
2. Gradient background (Fresha, Tinder)
3. Maskot (Duolingo, Wolt)
4. Animated (Netflix "Tudum") — HANYA jika animasi/sound IS brand
5. Foto background (IKEA)
6. Ilustrasi (Venmo, Etsy)
Dominan: logo instan → ganti cepat (<2 dtk). Animasi elaborat = pengecualian disengaja.

---

## 5. CHECKLIST ACTIONABLE — ikon / logo / thumbnail / splash

### Ikon baru
- [ ] Grid 24px + keylines; satu stroke weight (2px); sudut luar bulat/dalam tajam
- [ ] Uji siluet @40px light+dark+monochrome
- [ ] Pixel-fit di target size; master per size class
- [ ] Touch target ≥48px; aria-label; five-second test ≥80%

### Logo / app icon
- [ ] Desain siluet dulu; verifikasi 40px & favicon 32px
- [ ] Ship layered art (flat masters, zero baked effects) untuk Liquid Glass/adaptive
- [ ] Matriks varian: lockup / stacked / symbol / reversed / mono / favicon
- [ ] Clear-space & min-size terdokumentasi (jadi spacing token)
- [ ] Motion spec tertulis: trigger, easing, durasi, fallback reduce-motion
- [ ] Logo third-party di UI: ikuti guideline resmi (teks persis, no recolor, prominen setara)

### Splash animation
- [ ] Total ≤1.5–2 dtk terlihat; animasi ikon ≤1000ms (aturan Google)
- [ ] Native splash instan dengan bg = frame pertama; tahan sampai overlay ter-paint
- [ ] Play sekali, non-looping; skippable jika >2 dtk; cold-start only
- [ ] Fallback logo statis + `prefers-reduced-motion`
- [ ] Final frame harus berdiri sendiri sebagai static
- [ ] Default: logo-on-solid/gradient; animasi hanya jika itu brand signature (tes Tudum)

### Tool routing cepat
| Kebutuhan | Tool |
|---|---|
| Loader/micro-interaction cepat | LottieFiles library / CodePen |
| Authoring motion tanpa AE | Jitter |
| Animasi interaktif ber-state | Rive |
| Ikon animasi siap pakai | Lordicon |
| Ikon long-tail/diversitas | Noun Project |
| Lisensi bersih + master AI | Iconfinder premium |
| Logo brand pihak ketiga | Brandfetch CDN |
| Referensi visual pribadi | Cosmos |
| Belajar kritik logo | BrandNew |
| Hero 3D | Spline (lazy-load!) |
