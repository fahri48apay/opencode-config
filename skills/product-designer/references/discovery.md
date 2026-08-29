# Framework Discovery & Keputusan Produk

## 1. Framing problem
- Tulis **problem statement** satu kalimat yang menamai **user, aksi, dan hambatan**.
  Contoh: "Pengguna baru yang pertama kali membuka dashboard keuangan tidak bisa menemukan cara memuat data CSV, dan menyerah sebelum mencapai nilai inti."
- Sebelum membangun: jawab **"apakah produk/feature-nya sudah terbukti?"** Bila belum ada produk / belum tervalidasi terhadap permintaan nyata → ini masalah product design dulu (strategi), bukan polish UI.
  Tanda belum terbukti: ketidakpastian apakah orang mau apa yang dibangun, daftar fitur hasil opini internal, rencana bisnis belum diuji ke pelanggan nyata. Sumber: nuuxstudios.com.

## 2. Riset & insight
- Riset bisa berupa: user interview, usability test, survey, review pelanggan, analytics, competitor research, diskusi stakeholder, atau data produk existing.
- Tujuan riset: cari **pola**, bukan daftar komentar individu.
  - Kelompokkan observasi yang mirip → temukan masalah berulang lintas user/sumber.
  - Pisahkan **observasi** (fakta) dari **insight** (pemahaman/penalaran).
  - Hubungkan insight ke **peluang produk**, bukan berhenti di temuan.
  - Tunjukkan bukti: kutipan anonim, catatan riset, affinity board (FigJam/Miro).
- Jangan mengarang angka. Tidak yakin → uji, cari, atau nyatakan tidak yakin.

## 3. Prioritas & roadmap ("apa yang dibangun dulu, ditunda, dan dipotong")
- Pertimbangkan tiga sumbu: **nilai pengguna** × **dampak bisnis** × **biaya teknis**.
- Jangan cuma menambah fitur — berani menyarankan apa yang **dipotong/tunda**.
- Metrik keberhasilan relevan: aktivasi (user capai nilai inti lebih cepat), adopsi fitur, retensi, konversi, drop-off, task completion, pengurangan support ticket.
- Bila menerima permintaan yang tidak cocok dengan arah produk, **tolak/push back dengan alasan** — ini bagian normal dari peran.

## 4. Decision record (artefak keputusan)
Saat keputusan desain/produk penting, gunakan format ini (bagus untuk kerja nyata & portofolio):

| Field | Contoh |
|---|---|
| Decision | Menaruh ringkasan hasil-AI di balik langkah review |
| Context | User mengandalkan ringkasan untuk catatan tingkat klien |
| Options (termasuk ditolak) | Auto-publish ringkasan, sembunyikan, wajib tulis manual |
| Reason | Step review menjaga kecepatan sambil menurunkan risiko kepercayaan |
| Evidence | Prototype test: user mengedit 4 dari 5 ringkasan hasil-AI |
| Follow-up | Tambah confidence cue & source preview di versi berikutnya |

Risiko yang biasa jadi constraint: kapasitas engineering, aturan brand, latency/model, kepercayaan user, compliance, perilaku mobile, kualitas data, waktu. Buat constraint itu **terlihat** di keputusan.

Sumber: provn.co/blog/2026/06/product-designer-builder-portfolio; nuuxstudios.com; kore1.com.
