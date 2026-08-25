# 15 — E-commerce & Konversi: Bukti Riset Baymard Institute

> Sumber utama: **baymard.com** (learn section gratis; benchmark penuh berbayar).
> Basis riset: 700+ guideline dari 200.000+ jam riset — 4.400+ sesi usability test moderat
> in-lab, eye-tracking, studi kuantitatif dengan 18.397 partisipan, 18 industri.
> Ini bukti numerik untuk flow belanja; pasangkan dgn pattern psikologi `04` dan playbook `07`.

---

## Angka-angka induk (kutip apa adanya, jangan dihafal salah)

| Metrik | Nilai | Sumber konteks |
|---|---|---|
| Rata-rata cart abandonment rate | **70,19%** (rata-rata 48 studi; stabil ~68–70% sejak 2014) | baymard.com/lists/cart-abandonment-rate |
| Abandon karena checkout "terlalu panjang/rumit" | **18%** user | riset checkout usability |
| Alasan abandon teratas | wajib buat akun · checkout rumit · pengiriman lambat/mahal · tak percaya situs dgn kartu · tidak bisa lihat total biaya | survey multi-tahun |
| Panjang checkout rata-rata | **5,1 langkah**, **11,3 form field** default | benchmark terbaru |
| Potensi reduksi field | **20–60%** field bisa dihapus/otomatisasi | riset form usability |
| Situs top e-comm yang gagal ≥1 dari 4 syarat a11y dasar | **94%** (link, gambar, form field, keyboard) | riset a11y Baymard |
| Search yang tak selaras perilaku query user | **61%** situs | riset search UX |
| Situs yang menyediakan semua 5 tipe filter inti | hanya **43%** | riset product listing |

## Checkout — guideline inti

1. **Guest checkout WAJIB** + opsi buat akun SETELAH order selesai ("account after checkout").
2. **Field autocomplete-first**: gunakan autofill browser (`autocomplete="email"` dst), address lookup,
   dan validasi inline — jangan minta ulang data yang bisa disimpulkan.
3. **Total biaya transparan sedini mungkin**: ongkir/pajak tersembunyi = penyebab abandon #4.
4. **Progress indicator** dengan langkah bernama; izinkan mundur tanpa kehilangan isi.
5. Satu kolom untuk input alamat/kartu (mobile: dua kolom memicu skip-field).
6. Error state: pesan spesifik per field + ringkasan di atas; pertahankan isian saat gagal submit.
7. Trust markers dekat tombol bayar (logo pembayaran, garansi, link kebijakan) — bukan banner asal tempel.

## Form & input

- Tanya diri sendiri tiap field: "bisa dihapus? bisa disimpulkan? bisa ditunda?" — target reduksi 20–60%.
- Label DI ATAS field (bukan placeholder-saja); placeholder boleh untuk contoh format, hilang saat fokus → jangan jadi satu-satunya label.
- Jangan matikan paste di field password/email/kode voucher.
- Keyboard type tepat (`inputmode="numeric"` untuk kartu/OTP), format otomatis saat mengetik.

## Search & product listing

Search harus mendukung minimal: query salah ketik (fuzzy), sinonim, pencarian produk by model/SKU,
autocomplete dengan kategori. 61% situs gagal menyelaraskan ini.
Listing/filter inti yang harus ada: harga, ukuran/varian, brand, rating/review, ketersediaan/warna
(5 filter types — hanya 43% situs lengkap). Filter aktif harus VISIBLE + removable satu-per-satu.

## Mobile commerce

Riset mobile checkout menemukan rata-rata **5+ severe usability flaws** per situs pada flow mobile:
- Target sentuh & spacing (ikuti playbook §B: ≥48px, gap 8px)
- Numeric keypad untuk angka; hindari modal-in-modal
- Sticky CTA yang tak menutupi konten; ringkasan keranjang selalu terlihat

## Cara pakai dalam project non-ecommerce

Angka Baymard tetap relevan sebagai proxy friksi form/flow umum: signup, KYC, booking, donasi.
Terjemahan cepat:

| Pola e-commerce | Padanan produk lain |
|---|---|
| Guest checkout | Signup tanpa paksa akun (magic link / social first) |
| Total biaya transparan | Pricing page tanpa biaya tersembunyi; estimasi sebelum commit |
| Filter PLP | Filter/sort dashboard, pencarian dokumen |
| Cart abandonment | Drop-off mid-flow apa pun → ukur per langkah (playbook §H) |

## Ritual audit ala Baymard (gratis)

1. Tulis task script identik utk kompetitor & produkmu: cari produk → tambah cart → checkout → email konfirmasi (+ cancel/refund).
2. Catat numerik: jumlah langkah, jumlah field, kata per layar, waktu tempuh, error yang muncul.
3. Bandingkan side-by-side vs 2–3 kompetitor (screenshot dari Mobbin/PageFlows — lihat `03`).
4. Prioritaskan temuan: severe (blokir transaksi) → serious (friksi tinggi) → minor.
