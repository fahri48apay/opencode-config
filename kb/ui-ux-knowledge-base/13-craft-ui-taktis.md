# 13 — Craft UI Taktis: Refactoring UI, Practical UI, Practical Typography

> Sumber utama:
> - **Refactoring UI** (Adam Wathan & Steve Schoger) — taktik desain untuk developer; TOC lengkap di refactoringui.com
> - **Practical UI** (Adham Dannaway) — 100+ guideline logis; gratis: artikel "16 little UI design tips" & "14 logic-driven UI design tips"
> - **Butterick's Practical Typography** (edisi ke-2, gratis online) — aturan tipografi praktis
>
> Ketiganya mengisi lapisan yang tidak dibahas `01-fondasi-guidelines.md` (M3/HIG = token sistem)
> dan skill `design-system` (arsitektur token): yaitu **keputusan visual mikro per-elemen**.

---

## A. Refactoring UI — distilasi per bab

### Hierarki (bab 1–2)
- Mulai dari fitur, bukan layout; detail belakangan; jangan mendesain lebih dari yang perlu.
- "Choose a personality" dulu: font + warna + radius harus konsisten dengan personalia produk (bank ≠ app game).
- Ukuran bukan satu-satunya penekanan: **weight & contrast** bisa mengalahkan size.
- Jangan pakai abu-abu untuk teks di atas background berwarna — turunkan saturasi/naikkan lightness warna dasarnya.
- De-emphasize untuk emphasize: redupkan elemen pendukung agar elemen utama menonjol tanpa membesarkan apa pun.
- Labels are a last resort — data yang jelas konteksnya tak butuh label ("john@example.com" tak butuh "Email").

### Spacing & sizing (bab 3)
- Mulai dari white space berlebihan, lalu kurangi.
- Sistem spacing & sizing TETAP (mis. skala 4/8/12/16/24/32/48/64/96/128) — keputusan lebih sedikit, hasil konsisten.
- Grid overrated; kontainer konten max-width yang menjaga line length lebih penting.
- Relative sizing tidak scale: elemen besar butuh jarak relatif LEBIH BESAR dari elemen kecil.
- Ambiguous spacing musuh utama: jarak antar grup harus > jarak dalam grup.

### Tipografi (bab 4)
- Tetapkan type scale dulu (mis. 12/14/16/18/20/24/30/36/48); body text biasanya cukup 3 ukuran.
- Line length 45–75 karakter; baseline-align, bukan center-align vertikal.
- Line-height proporsional terbalik dengan ukuran teks (heading makin besar → leading makin rapat).
- Letter-spacing: negatif untuk heading besar, positif untuk ALL CAPS kecil.

### Warna (bab 5)
- Ditch hex for HSL — manipulasi lightness/saturasi lebih intuitif.
- Kamu butuh LEBIH BANYAK warna dari dugaan: definisikan 8–10 shade per hue DI AWAL (50–950).
- Greys tidak harus benar-benar abu — greys kebiruan/kehangatan menyatu dengan brand.
- Accessible doesn't have to mean ugly: kontras lewat kombinasi weight+size+warna, bukan hitam pekat semua.

### Depth (bab 6) & Gambar (bab 7)
- Emulate light source konsisten (biasanya atas); shadow dua bagian (ambient kecil gelap + key besar lembut).
- Flat design pun bisa ber-depth: layer via overlap, border halus, beda background.
- Fewer borders: pisahkan dengan jarak & shadow dulu, border sebagai opsi terakhir.

### Finishing (bab 8)
- Supercharge defaults: kosmetik kecil (radius konsisten, ikon setara weight, foto berkualitas, empty state terdesain) yang membuat "terasa didesain".
- Add color with accent borders (border kiri berwarna pada card alert), decorate backgrounds (gradien/pattern halus).

## B. Practical UI — angka-angka kunci (dari artikel resmi Dannaway)

| Aturan | Nilai |
|---|---|
| Kontras elemen UI (field, ikon, border tombol) | ≥ **3:1** (WCAG 2.1 AA non-text) |
| Kontras teks kecil (≤18px / <24px regular) | ≥ **4.5:1** |
| Kontras teks besar (>18px bold atau >24px) | ≥ **3:1** |
| Target sentuh | ≥ **48×48pt**, gap antar tombol ≥ **8pt** |
| Line length ideal | ±40–75 karakter |
| Font weight | **regular + bold saja** (hindari medium/light campur aduk) |
| Line-height body | ≥ **1.5** |
| Alignment | Satu alignment dominan; body text rata kiri |
| Typeface | Satu sans-serif; pilih yang lowercase tinggi (x-height besar) |
| Teks hitam | Hindari #000 murni di layar (gunakan near-black) |

Taktik khas Dannaway:
1. **Space berdasarkan kedekatan relasi** — makin related makin dekat (Gestalt Proximity, lihat `12`).
2. **Satu primary button per view**; hierarki: filled → outline → text.
3. **Hapus container untuk menyederhanakan** — minimalism ≠ simplicity; hapus style sebelum hapus fungsi.
4. **Squint test** — juling; masih terbaca hierarkinya? Kalau tidak, perbaiki.
5. **Optical balance** — sesuaikan posisi berdasar mata, bukan matematika (ikon vs teks: samakan prominence visual, sering ikon lebih tebal/gelap dari labelnya).

## C. Practical Typography (Butterick) — aturan inti

"5 aturan ini sudah melampaui mayoritas writer & designer":

1. Kualitas dokumen ditentukan **body text** — mulai dari situ.
2. Point size: **15–25px web** (10–12pt print).
3. Line spacing: **120–145%** dari point size (CSS: `line-height: 1.2–1.45`, unitless).
4. Line length: **45–90 karakter** rata-rata termasuk spasi.
5. Pakai **font profesional** — hindari Times New Roman/Arial/system font untuk dokumen serius.

Aturan format cepat:
- Curly quotes (" "), bukan straight ("); satu spasi antar kalimat; em dash (—) tanpa spasi ganda.
- Bold ATAU italic, tidak pernah bersamaan; underline hanya untuk link web.
- ALL CAPS < 1 baris + letter-spacing ekstra 5–12%; centered text hemat penggunaannya.
- Justified text WAJIB dengan hyphenation, atau jangan justified sama sekali.
- Indent paragraf ATAU spacing antar-paragraf — pilih satu, jangan dua-duanya.

## Cara pakai gabungan dalam project

```
Setup token   → M3/HIG (file 01) + design-system skill  [makro]
Per elemen    → Refactoring UI + Practical UI            [mikro]
Copy & teks   → Practical Typography + playbook §F       [teks]
```

Checklist saat styling komponen baru:
- [ ] Personalitas produk konsisten (font/warna/radius)?
- [ ] Spacing dari sistem, jarak antar-grup > dalam-grup?
- [ ] Hanya regular/bold; type scale dipatuhi?
- [ ] Kontras: teks 4.5:1, elemen UI 3:1 (cek WebAIM/Contrast plugin)?
- [ ] Target sentuh 48×48 + gap 8?
- [ ] Shadow dua-lapis, sumber cahaya konsisten?
- [ ] Squint test lolos — hierarki terbaca?

## Anti-pola

- ❌ Menyalin palet 5-warna generator — interface butuh 8–10 shade/hue.
- ❌ Medium/Light/SemiBold/Bold dicampur tanpa sistem.
- ❌ Border box untuk memisahkan segalanya (coba jarak & background dulu).
- ❌ Grey text di atas warna brand (pakai turunan warna brand yang lebih terang).
