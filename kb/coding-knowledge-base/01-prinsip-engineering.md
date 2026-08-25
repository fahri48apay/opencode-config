# 01 · Prinsip Engineering: Perang Melawan Kompleksitas

> Sintesis 3 sumber klasik yang saling menguatkan (riset Agustus 2026):
> - `sources/grug-brained-dev.md` — The Grug Brained Developer (Carson Gross, pembuat htmx)
> - `sources/philosophy-software-design-notes.md` — A Philosophy of Software Design (Ousterhout)
> - `sources/out-of-the-tar-pit-notes.md` — Out of the Tar Pit (Moseley & Marks, 2006)
>
> Ketiganya dari tradisi berbeda, kesimpulan sama:
> **musuh utama software = kompleksitas, bukan kurangnya fitur.**

## 1. Definisi kerja kompleksitas

**Ousterhout**: kompleksitas = Σ(kompleksitas tiap bagian × porsi waktu developer di bagian itu).
Tiga gejala:

1. **Change amplification** — perubahan kecil butuh edit di banyak tempat.
2. **Cognitive load** — harus paham banyak hal untuk satu tugas.
3. **Unknown unknowns** — tak jelas apa yang perlu diketahui untuk menyelesaikan tugas.

Dua penyebab: **dependencies** (tak terhindarkan, tapi harus eksplisit & jelas) dan
**obscurity** (nama ambigu, asumsi tersembunyi, dokumentasi hilang).

**Tar Pit**: pisahkan **essential complexity** (dari masalah user; tetap ada bahkan di dunia
ideal) vs **accidental complexity** (dari tools/bahasa/pilihan kita). Uji cepat: kalau ADA cara
apa pun membuat user puas tanpa menghadapi X → X bukan essential.

**Grug**: kompleksitas = demon. Sekali masuk lewat orang yang "clubbable", dia bertelur.
"Complexity very, very bad."

## 2. Aturan praktis anti-kompleksitas

### Dari grug (paling operasional)

- Senjata #1 engineer senior = kata **"no"**. Kalau harus "yes" → **solusi 80/20**
  ("80% kebutuhan dengan 20% kode").
- **Jangan factor/refactor kode terlalu dini.** Tunggu *cut-point* muncul alami:
  interface sempit yang bisa mengurung kompleksitas "di dalam kristal".
- **Chesterton's Fence**: jangan robohkan kode jelek sebelum paham kenapa dia ada.
  Test lama sering adalah petunjuk bahwa pagar itu jangan dirobohkan.
- **Refactor besar makin besar makin gagal** ("terlalu jauh dari pantai").
  Sistem harus tetap jalan di SETIAP langkah refactor.
- **Simple beats clever**: variabel antara bernama jelas > ekspresi padat satu baris —
  "EASIER DEBUG!". Copy-paste simpel > abstraksi prematur (DRY kalah dari Locality of Behavior).
- Microservices = masalah tersulit (factoring) + network call. Network hit = jutaan siklus CPU.
- Optimasi tanpa profil nyata = tebakan. Ukur dulu.
- Type system: 90% nilainya "hit dot → autocomplete muncul", bukan type correctness.
- FOLD (Fear Of Looking Dumb) harus dilawan: bilang publik "this too complex for grug".

### Dari Ousterhout (struktur modul)

- **Deep module**: fungsi kuat + interface sederhana. Contoh kanonik: Unix I/O —
  5 syscall (`open/read/write/lseek/close`) menyembunyikan ratusan ribu baris kernel.
- **Shallow module = red flag**: biaya interface melebihi manfaatnya.
- **Classitis**: banyak kelas-kelas kecil shallow justru menaikkan kompleksitas total
  (anti-dogma "small classes always good").
- **Information hiding**: enkapsulasi design decision; waspadai leakage via implicit info
  (format file, urutan eksekusi).
- Culprit klasik: **temporal decomposition** (memecah modul berdasarkan waktu langkah,
  contoh: modul ML train terpisah dari test → keputusan fase pertama bocor ke fase kedua).
- **Pull complexity downwards**: interface sederhana > implementasi sederhana.
  Config parameter berjajar = kompleksitas didorong ke atas → sediakan default otomatis.
- **Define errors out of existence**: exception menyumbang kompleksitas tak proporsional —
  desain agar error tidak mungkin terjadi.
- **Design it twice**: selalu ada desain alternatif yang lebih baik dari draft pertama.
- Sulit menamai method/fungsi dengan baik = sinyal desain tidak clean.

### Dari Tar Pit (strategi makro)

- Strategi dua kata: **AVOID & SEPARATE**.
- Penyebab #1 accidental complexity = **mutable state** (tiap bit state MENGANDAKAN total
  kemungkinan state → eksponensial; bikin test flaky dan reasoning hancur).
  #2 control (over-specify urutan), #3 code volume.
- Pisahkan **logic dari state**; pisahkan **essential dari accidental**.
- Testing memberi tahu NOL tentang input lain yang belum dicoba — informal reasoning
  tetap wajib. Kalau harus pilih satu: investasikan pada KESEDERHANAAN.
