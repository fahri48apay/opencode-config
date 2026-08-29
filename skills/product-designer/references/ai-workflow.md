# Mengarahkan AI sebagai Alat Product Designer

## Prinsip
- AI mempercepat kerjaan mekanis: variasi layout, draft copy, filler state, scaffolding komponen. Nilai Anda pindah ke tempat model tidak bisa: **framing problem, memilih opsi mana yang benar, dan keputusan/kirim**.
- Peran Anda: **tahu kapan AI membantu vs mengganggu**, dan **memverifikasi/memperbaiki output-nya**.
- Tampilkan/pakai AI secara transparan di workflow record (lihat `portfolio.md`). Rekayasa prompt butuh trigger yang baik (automasi) — lihat KB `16-desain-produk-ai.md` untuk automate-vs-augment dan mental model.

## Prompt engineering untuk desain (pola)
- Bisa untuk: variasi UI, copy, eksplorasi interaksi, data-states, simulasi edge case.
- Contoh intent terstruktur:
  - "Buat 5 varian onboarding untuk pengguna tim keuangan pemula yang mengimpor CSV berantakan."
  - "Buat 3 opsi empty state untuk dashboard kosong, dengan copy + call-to-action."
- **Iterasi sistematis**: ubah satu variabel per percobaan (audience, constraint, platform), bukan ulang dari nol.

## Menilai & mengarahkan output AI
- Punya **kriteria eksplisit** untuk output yang berguna vs bermasalah:
  - Cocok dengan user/peran/konteks?
  - Copy pas dengan brand/nada?
  - Usulan bisa dikerjakan (feasible)?
  - Mencakup state non-happy-path (error, loading, empty)?
  - Amati apakah AI menambah "polish murahan" yang menyesatkan.
- Bahasa generatif AI bisa terdengar meyakinkan tapi salah — selalu **verifikasi** sebelum dijadikan keputusan.

## Kapan tidak memakai AI
- Saat membutuhkan data/riset akurat yang tidak boleh dihafal — uji, cari, atau akui tidak yakin.
- Saat keputusan produk strategis bergantung pada angka/bukti nyata — jangan biarkan AI mengarang metrik.
- Saat kualitas/harmoni visual kritis dan output generik AI berisiko terlihat template.

## Sinkronisasi dengan KB
- Fitur produk yang melibatkan AI (chatbot, generator, rekomendasi): jalankan checklist `~/ui-ux-knowledge-base/16-desain-produk-ai.md` (PAIR Guidebook + Microsoft HAX) — automate vs augment, trust levers, graceful failure.

Sumber: uxcel.com; provn.co; kore1.com; `~/ui-ux-knowledge-base/16-desain-produk-ai.md`.
